unit UCamFoto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.TabControl, FMX.Layouts,
  FMX.TreeView, FMX.MultiView, System.Actions, FMX.ActnList, FMX.Ani,
  FMX.Effects, FMX.Filter.Effects, System.Rtti, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Grid, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.ListBox, FMX.DateTimeCtrls,
  System.Bluetooth, System.Bluetooth.Components,System.Threading,FireDAC.Comp.Client,
  FMX.EditBox, FMX.SpinBox, FMX.Memo,IdHTTP,System.Json.writers,System.Json.Readers,System.JSON.Types,
  Rest.Json,System.JSON, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, Data.Bind.ObjectScope,
  REST.Client, IPPeerClient,REST.Types,FMX.VirtualKeyboard,FMX.Platform,
  IdHashMessageDigest,System.ImageList,
  FMX.ImgList, FMX.Media, System.Sensors, System.Sensors.Components,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Gestures, FMX.NumberBox, FMX.ListView, FMX.MediaLibrary.Actions,FMX.Surfaces,
  FMX.StdActns,u99Permissions
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   ,Androidapi.JNI.Os, Androidapi.Helpers,
   Androidapi.JNI.GraphicsContentViewText,System.Permissions,FMX.DialogService
   {$ENDIF}
    ,Soap.EncdDecd;

type
  TfrmCamFotoAbastecimento = class(TForm)
    layImgHorimetro: TLayout;
    Rectangle26: TRectangle;
    btnFotoHorimetro: TRectangle;
    Image12: TImage;
    Label8: TLabel;
    btnFotoBomba: TRectangle;
    Image13: TImage;
    Label30: TLabel;
    RecImgHrimetro: TRectangle;
    imgHorimetro: TImage;
    RecImgBomba: TRectangle;
    imgBomba: TImage;
    Layout71: TLayout;
    Layout42: TLayout;
    Rectangle21: TRectangle;
    Rectangle27: TRectangle;
    Image14: TImage;
    Label31: TLabel;
    Layout43: TLayout;
    btnSalvarFoto: TRectangle;
    Image16: TImage;
    Label32: TLabel;
    ActionList1: TActionList;
    ActLibrary: TTakePhotoFromLibraryAction;
    ActFoto: TTakePhotoFromCameraAction;
    procedure ActFotoDidFinishTaking(Image: TBitmap);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarFotoClick(Sender: TObject);
    procedure btnFotoHorimetroClick(Sender: TObject);
    procedure btnFotoBombaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Rectangle27Click(Sender: TObject);
  private
    vImgCapture :integer;
    PermissaoCamera, PermissaoReadStorage, PermissaoWriteStorage : string;
    procedure TakePicturePermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);

    procedure DisplayMessageCamera(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);

    procedure LibraryPermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);

    procedure DisplayMessageLibrary(Sender: TObject;
                const APermissions: TArray<string>;
                const APostProc: TProc);

  public
    function BitmapFromBase64(const base64: string): TBitmap;
    function Base64FromBitmap(Bitmap: TBitmap): string;
  end;

var
  frmCamFotoAbastecimento: TfrmCamFotoAbastecimento;

implementation

{$R *.fmx}

uses UDmDB;


procedure TfrmCamFotoAbastecimento.LibraryPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
begin
 if (Length(AGrantResults) = 2) and
  (AGrantResults[0] = TPermissionStatus.Granted) and
  (AGrantResults[1] = TPermissionStatus.Granted) then
   ActLibrary.Execute
  else
   TDialogService.ShowMessage('Você não tem permissão para acessar as fotos');
end;

procedure TfrmCamFotoAbastecimento.Rectangle27Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmCamFotoAbastecimento.ActFotoDidFinishTaking(Image: TBitmap);
begin
 if vImgCapture=1 then
  begin
   imgHorimetro.Bitmap.Assign(Image);
   Exit;
  end;
  if vImgCapture=2 then
  begin
   imgBomba.Bitmap.Assign(Image);
   Exit;
  end;
end;

procedure TfrmCamFotoAbastecimento.btnFotoBombaClick(Sender: TObject);
begin
 vImgCapture:=2;
 {$IFDEF ANDROID}
  PermissionsService.RequestPermissions([PermissaoCamera,
                                         PermissaoReadStorage,
                                         PermissaoWriteStorage],
                                         TakePicturePermissionRequestResult,
                                         DisplayMessageCamera
                                         );
  {$ENDIF}

  {$IFDEF IOS}
  ActFoto.Execute;
  {$ENDIF}
end;

procedure TfrmCamFotoAbastecimento.btnFotoHorimetroClick(Sender: TObject);
begin
 vImgCapture:=1;
 {$IFDEF ANDROID}
  PermissionsService.RequestPermissions([PermissaoCamera,
                                         PermissaoReadStorage,
                                         PermissaoWriteStorage],
                                         TakePicturePermissionRequestResult,
                                         DisplayMessageCamera
                                         );
  {$ENDIF}

  {$IFDEF IOS}
  ActFoto.Execute;
  {$ENDIF}
end;

procedure TfrmCamFotoAbastecimento.btnSalvarFotoClick(Sender: TObject);
begin
 if not imgHorimetro.Bitmap.IsEmpty then
     dmDB.vImg64Horimetro := Base64FromBitmap(imgHorimetro.Bitmap);
 if not imgBomba.Bitmap.IsEmpty then
    dmDB.vImg64Bomba := Base64FromBitmap(imgBomba.Bitmap);
 Close;
end;

procedure TfrmCamFotoAbastecimento.FormCreate(Sender: TObject);
begin
 PermissaoCamera       := JStringToString(TJManifest_permission.JavaClass.CAMERA);
 PermissaoReadStorage  := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
 PermissaoWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
end;

procedure TfrmCamFotoAbastecimento.FormShow(Sender: TObject);
begin
 RecImgHrimetro.Height   := (frmCamFotoAbastecimento.Height/2)-82;
 RecImgBomba.Height      := (frmCamFotoAbastecimento.Height/2)-82;

 if dmDB.vImg64Horimetro.Length>0 then
  imgHorimetro.Bitmap  := BitmapFromBase64(dmDB.vImg64Horimetro)
 else
  imgHorimetro.Bitmap  := nil;
 if dmDB.vImg64Horimetro.Length>0 then
  imgBomba.Bitmap  := BitmapFromBase64(dmDB.vImg64Bomba)
 else
  imgBomba.Bitmap  := nil;
end;

function TfrmCamFotoAbastecimento.Base64FromBitmap(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;
begin
  Input := TBytesStream.Create;
  try
    Bitmap.SaveToStream(Input);
    Input.Position := 0;
    Output := TStringStream.Create('', TEncoding.ASCII);
    try
      Soap.EncdDecd.EncodeStream(Input, Output);
      Result := Output.DataString;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

function TfrmCamFotoAbastecimento.BitmapFromBase64(const base64: string): TBitmap;
var
  Input: TStringStream;
  Output: TBytesStream;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      Soap.EncdDecd.DecodeStream(Input, Output);
      Output.Position := 0;
      Result := TBitmap.Create;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

procedure TfrmCamFotoAbastecimento.TakePicturePermissionRequestResult(
        Sender: TObject; const APermissions: TArray<string>;
        const AGrantResults: TArray<TPermissionStatus>);
begin
        // 3 Permissoes: CAMERA, READ_EXTERNAL_STORAGE e WRITE_EXTERNAL_STORAGE

        if (Length(AGrantResults) = 3) and
           (AGrantResults[0] = TPermissionStatus.Granted) and
           (AGrantResults[1] = TPermissionStatus.Granted) and
           (AGrantResults[2] = TPermissionStatus.Granted) then
                ActFoto.Execute
        else
                TDialogService.ShowMessage('Você não tem permissão para tirar fotos');
end;


procedure TfrmCamFotoAbastecimento.DisplayMessageCamera(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
  TDialogService.ShowMessage('O app precisa acessar a câmera e as fotos do seu dispositivo',
  procedure(const AResult: TModalResult)
  begin
          APostProc;
  end);
end;

procedure TfrmCamFotoAbastecimento.DisplayMessageLibrary(Sender: TObject;
  const APermissions: TArray<string>; const APostProc: TProc);
begin
  TDialogService.ShowMessage('O app precisa acessar as fotos do seu dispositivo',
  procedure(const AResult: TModalResult)
  begin
    APostProc;
  end);
end;



end.
