unit UNewCam;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  Winsoft.Android.Camera, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Platform,
  FMX.Colors, Winsoft.FireMonkey.Obr;

type
  TFrmCameraNew = class(TForm)
    ColorBox: TColorBox;
    LabelBarcode: TLabel;
    Panel: TPanel;
    ACamera: TACamera;
    FObr: TFObr;
    procedure ACameraDataReady(Sender: TObject);
    procedure ACameraDisplayRationale(Sender: TObject;
      const APostRationaleProc: TProc);
    procedure ACameraPermission(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codigo : string;
    [volatile] Paused: Boolean;
    FMXApplicationEventService: IFMXApplicationEventService;
    [volatile] RgbaDataWidth: Integer;
    [volatile] RgbaDataHeight: Integer;
    [volatile] RgbaData: array of Cardinal;
    [volatile] ScanBitmap: TBitmap;
    [volatile] Scanning: Integer;
    procedure Start;
    procedure Stop;
    function HandleAppEvent(AAppEvent: TApplicationEvent; AContext: TObject): Boolean;
  end;

var
  FrmCameraNew: TFrmCameraNew;

implementation
 uses System.IOUtils, FMX.DialogService, System.SyncObjs;
{$R *.fmx}

procedure TFrmCameraNew.ACameraDataReady(Sender: TObject);
begin
  if TInterlocked.BitTestAndSet(Scanning, 0) then
  begin
    ACamera.ReleaseData; // already scanning so nothing to do with data
    Exit;
  end;

  TThread.CreateAnonymousThread(
    procedure
    var
      Width, Height: Integer;
      Barcode: TObrSymbol;
      Text: string;
    begin
      try
        try
          ACamera.DataToRgba(@RgbaData[0], ACamera.PreviewRotation, ACamera.PreviewHorizMirror);
        finally
          ACamera.ReleaseData;
        end;

        try
          if ACamera.PreviewRotation in [ro0, ro180] then
          begin
            Width := RgbaDataWidth;
            Height := RgbaDataHeight;
          end
          else
          begin
            Width := RgbaDataHeight;
            Height := RgbaDataWidth;
          end;

  {$ifdef Delphi101}
          // to avoid 'Bitmap size too big' bug in Delphi 10.1
          if (ScanBitmap.Width <> Width) or (ScanBitmap.Height <> Height) then
            TThread.Synchronize(nil,
              procedure
              begin
                ScanBitmap.SetSize(Width, Height);
              end);
          else
  {$endif Delphi101}
          begin
            ACamera.UpdateBitmap(ScanBitmap, @RgbaData[0], Width, Height);

            FObr.Picture := ScanBitmap;
            try
              FObr.Scan;
              if FObr.BarcodeCount > 0 then
              begin
                Barcode := FObr.Barcode[0];
                Text := Barcode.DataUtf8;

                // execute UI code in main thread
                TThread.Queue(nil,
                  procedure
                  begin
                    if LabelBarcode.Text <> Text then
                    begin
                      LabelBarcode.Text := Text;
                      ACamera.PlayMediaActionSound(msStartVideoRecording);
                      Stop;
                      codigo := Text;
                      Close;
                    end;
                  end);
              end
            finally
              FObr.Picture := nil;
            end;
          end
        except
          on E: Exception do
          begin
            Text := E.Message;
            // execute UI code in main thread
            TThread.Queue(nil,
              procedure
              begin
                LabelBarcode.Text := Text;
              end);
          end
        end;
      finally
        TInterlocked.BitTestAndClear(Scanning, 0);
      end;
    end).Start;
end;

procedure TFrmCameraNew.ACameraDisplayRationale(Sender: TObject;
  const APostRationaleProc: TProc);
begin
 TDialogService.ShowMessage('O aplicativo precisa acessar a câmera para funcionar',
 procedure(const AResult: TModalResult)
 begin
    APostRationaleProc
 end);
end;

procedure TFrmCameraNew.ACameraPermission(Sender: TObject);
begin
 if not ACamera.PermissionGranted then
   ShowMessage('Não é possível acessar a câmera porque a permissão necessária não foi concedida');
end;

procedure TFrmCameraNew.FormCreate(Sender: TObject);
begin
   ScanBitmap := TBitmap.Create;

  if TPlatformServices.Current.SupportsPlatformService(IFMXApplicationEventService, FMXApplicationEventService) then
    FMXApplicationEventService.SetApplicationEventHandler(HandleAppEvent);

  ACamera.LoadMediaActionSound(msStartVideoRecording);
  FObr.Active := True;
end;

procedure TFrmCameraNew.FormShow(Sender: TObject);
begin
  ACamera.Active      := True;
  ACamera.SceneMode   := TSceneMode.smBarcode;
  ACamera.FocusMode   := TFocusMode.foContinuousPicture;
  Start;
end;

function TFrmCameraNew.HandleAppEvent(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
begin
  if ACamera.PermissionGranted then
  case AAppEvent of
    TApplicationEvent.EnteredBackground:
    begin
      Paused := ACamera.Capturing;
      Stop;
      ACamera.Active := False;
    end;

    TApplicationEvent.WillBecomeForeground:
    begin
      ACamera.Active := True;
      if Paused then
      begin
        Paused := False;
        Start;
      end;
    end;
  end;
  Result := True;
end;

procedure TFrmCameraNew.Start;
begin
  RgbaDataWidth := ACamera.PreviewSize.Width;
  RgbaDataHeight := ACamera.PreviewSize.Height;
  SetLength(RgbaData, RgbaDataWidth * RgbaDataHeight);

  LabelBarcode.Text := '';
  ACamera.Start;
end;

procedure TFrmCameraNew.Stop;
begin
 ACamera.Stop;
end;

end.
