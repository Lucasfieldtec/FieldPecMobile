unit UCadPadrao;

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
  FMX.StdActns
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   ,Androidapi.JNI.Os, Androidapi.Helpers,
   Androidapi.JNI.GraphicsContentViewText,System.Permissions,FMX.DialogService
   {$ENDIF}
    ,Soap.EncdDecd,UFrameLimpaBebedouro, FMX.Memo.Types;

type
  TfrmCadPadrao = class(TForm)
    StyleBook1: TStyleBook;
    tbPrincipal: TTabControl;
    tbilista: TTabItem;
    tbiCad: TTabItem;
    Rectangle1: TRectangle;
    layPrincipal: TLayout;
    RecLista: TRectangle;
    layListCards: TLayout;
    Layout9: TLayout;
    btnNovo: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image4: TImage;
    ListaCards: TListBox;
    Layout1: TLayout;
    Rectangle3: TRectangle;
    Layout2: TLayout;
    Layout4: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Label2: TLabel;
    Rectangle4: TRectangle;
    edtBebedouroF: TEdit;
    ClearEditButton2: TClearEditButton;
    Layout5: TLayout;
    Layout8: TLayout;
    Label1: TLabel;
    Rectangle2: TRectangle;
    edtdataf: TDateEdit;
    Layout10: TLayout;
    btnBuscar: TRectangle;
    Layout11: TLayout;
    Label3: TLabel;
    Image1: TImage;
    Lsbrl: TLayout;
    lblLista: TLabel;
    btnCloseAll: TImage;
    Layout3: TLayout;
    lblTotalRegistro: TLabel;
    Rectangle5: TRectangle;
    Layout12: TLayout;
    Layout16: TLayout;
    Rectangle8: TRectangle;
    Layout17: TLayout;
    Layout18: TLayout;
    Layout21: TLayout;
    Layout22: TLayout;
    Label7: TLabel;
    Rectangle10: TRectangle;
    edtdata: TDateEdit;
    Layout25: TLayout;
    Label9: TLabel;
    Image5: TImage;
    Layout23: TLayout;
    btnConfirmar: TRectangle;
    Layout24: TLayout;
    Label8: TLabel;
    Image3: TImage;
    layDadosBebedouro: TLayout;
    Layout19: TLayout;
    Label6: TLabel;
    Layout14: TLayout;
    Rectangle6: TRectangle;
    EdtBebedouro: TEdit;
    ClearEditButton1: TClearEditButton;
    SearchEditButton2: TSearchEditButton;
    Layout15: TLayout;
    btnLerQr: TRectangle;
    Layout20: TLayout;
    Image2: TImage;
    Layout26: TLayout;
    Layout27: TLayout;
    Layout28: TLayout;
    Rectangle7: TRectangle;
    layBtnLista: TLayout;
    btnHabilitaSync: TRectangle;
    Image16: TImage;
    Label32: TLabel;
    btnExcluiItem: TRectangle;
    Image6: TImage;
    lblExcluir: TLabel;
    LocationSensor1: TLocationSensor;
    GestureManager1: TGestureManager;
    Layout29: TLayout;
    Layout30: TLayout;
    Label10: TLabel;
    Label11: TLabel;
    lblLatitude: TLabel;
    lblLongitude: TLabel;
    edtObs: TEdit;
    Layout13: TLayout;
    Layout31: TLayout;
    Image7: TImage;
    Layout32: TLayout;
    lblUltimaLimpeza: TLabel;
    Layout33: TLayout;
    Label12: TLabel;
    Rectangle9: TRectangle;
    Rectangle11: TRectangle;
    Label5: TLabel;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    procedure btnNovoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnNovoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnCloseAllClick(Sender: TObject);
    procedure SearchEditButton2Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnLerQrClick(Sender: TObject);
    procedure btnExcluiItemClick(Sender: TObject);
    procedure LocationSensor1LocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
  private
    {$IFDEF ANDROID}
    Location: TLocationCoord2D;
    FGeocoder: TGeocoder;
    Access_Fine_Location, Access_Coarse_Location : string;
    PermissaoCamera, PermissaoReadStorage, PermissaoWriteStorage : string;
     procedure LocationPermissionRequestResult
                (Sender: TObject; const APermissions: TArray<string>;
                const AGrantResults: TArray<TPermissionStatus>);
     procedure DisplayRationale(Sender: TObject;
              const APermissions: TArray<string>; const APostRationaleProc: TProc);
    {$ENDIF}
  public
    FFrame     : TFrameLimpaBebedouro;
    vIdLimpeza,vIdBebedouro,vFlagSync : string;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure GeraListaCards(vFiltro:string);
    procedure DestroiFrames;
    procedure ItemClick(Sender: TObject);
    procedure FrameGesture(Sender: TObject;
     const EventInfo: TGestureEventInfo; var Handled: Boolean);

end;

var
  frmCadPadrao: TfrmCadPadrao;

implementation

{$R *.fmx}

uses UDmDB, UListBebedouro, UnitCamera;

procedure TfrmCadPadrao.FormShow(Sender: TObject);
begin
 {$IFDEF ANDROID}
  Access_Coarse_Location := JStringToString(TJManifest_permission.JavaClass.ACCESS_COARSE_LOCATION);
  Access_Fine_Location   := JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION);
  PermissionsService.RequestPermissions([Access_Coarse_Location,
                                                       Access_Fine_Location],
                                                       LocationPermissionRequestResult,
                                                       DisplayRationale);
  PermissaoCamera       := JStringToString(TJManifest_permission.JavaClass.CAMERA);
  PermissaoReadStorage  := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  PermissaoWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);

 {$ENDIF}

 layBtnLista.Visible     := false;
 tbPrincipal.TabPosition := TTabPosition.None;
 tbPrincipal.ActiveTab   := tbilista;
end;

procedure TfrmCadPadrao.FrameGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  layBtnLista.Visible := true;
end;

procedure TfrmCadPadrao.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmCadPadrao.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmCadPadrao.GeraListaCards(vFiltro: string);
var
  item: TListBoxItem;
begin
   if ListaCards=nil then
    FreeAndNil(ListaCards);
   DestroiFrames;
   ListaCards        := TListBox.Create(self);
   ListaCards.Parent := layListCards;
   ListaCards.Align  := TAlignLayout.Client;

   dmDB.AbreLimpezaBebedouro(dmdb.vIdPropriedade,vFiltro);
   dmDB.LIMPEZABEBEDOURO.First;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     while not dmDB.LIMPEZABEBEDOURO.eof do
     begin
      ListaCards.BeginUpdate;
      item := TListBoxItem.Create(self);
      FFrame := TFrameLimpaBebedouro.Create(self);
      FFrame.Name:= 'Item_'+dmDB.LIMPEZABEBEDOUROID.AsString;
      FFrame.Parent          := item;
      FFrame.Align           := TAlignLayout.Client;
      FFrame.HitTest         := false;
      FFrame.Opacity         := 1;

      item.HitTest           := true;
      item.Height            := 200;
      item.Margins.Left      := 10;
      item.Margins.Right     := 10;
      item.Margins.Top       := 10;
      item.Margins.Bottom    := 10;
      item.TagString         := dmDB.LIMPEZABEBEDOUROID.AsString;
      item.OnClick           := ItemClick;
      item.OnMouseDown       := FrameMouseDown;
      item.OnMouseUp         := FrameMouseUp;
      item.Touch.GestureManager      := GestureManager1;
      item.Touch.InteractiveGestures := [TInteractiveGesture.LongTap];
      item.OnGesture                 := FrameGesture;

      item.Tag               := dmDB.LIMPEZABEBEDOUROID.AsInteger;
      item.TagString         := dmDB.LIMPEZABEBEDOUROPasto.AsString;
      item.TagFloat          := dmDB.LIMPEZABEBEDOUROSYNC.AsFloat;

      FFrame.lblBEBEDOURO.Text      := dmDB.LIMPEZABEBEDOUROPasto.AsString;
      FFrame.lblBEBEDOURO.TagString := dmDB.LIMPEZABEBEDOUROID.AsString;
      FFrame.lbldatalimpeza.Text    := dmDB.LIMPEZABEBEDOURODATA.AsString;
      FFrame.lblObservacao.Text     := dmDB.LIMPEZABEBEDOUROOBSERVACAO.AsString;
      if dmDB.LIMPEZABEBEDOUROSYNC.AsInteger=0 then
      begin
        FFrame.imgSyncYes.visible := false;
        FFrame.imgSyncNo.visible  := true;
        FFrame.lblSync.Text       := 'Sincronização Pendente';
      end;
      if dmDB.LIMPEZABEBEDOUROSYNC.AsInteger=1 then
      begin
        FFrame.imgSyncYes.visible := true;
        FFrame.imgSyncNo.visible  := false;
        FFrame.lblSync.Text       := 'Sincronizado';
      end;
      item.Parent                      := ListaCards;

      ListaCards.EndUpdate;
      dmDB.LIMPEZABEBEDOURO.Next;
     end;
     lblTotalRegistro.Text := intToStr(ListaCards.Items.Count);
    end);
   end).Start;
end;

procedure TfrmCadPadrao.ItemClick(Sender: TObject);
begin
 vIdLimpeza          := intToStr(TListBoxItem(sender).Tag);
 vFlagSync           := FloatToStr(TListBoxItem(sender).TagFloat);
 TListBoxItem(sender).IsSelected := true;
end;

procedure TfrmCadPadrao.LocationPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
var
         x : integer;
begin
  if (Length(AGrantResults) = 2) and
    (AGrantResults[0] = TPermissionStatus.Granted) and
    (AGrantResults[1] = TPermissionStatus.Granted) then
  begin
    LocationSensor1.Active := true;
  end
  else
  begin
    TDialogService.ShowMessage
      ('Não é possível acessar o GPS porque o app não possui acesso');
  end;
end;

procedure TfrmCadPadrao.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
begin
 lblLatitude.Text  := Format('%2.6f', [NewLocation.Latitude]);
 lblLongitude.Text := Format('%2.6f', [NewLocation.Longitude]);
end;

procedure TfrmCadPadrao.SearchEditButton2Click(Sender: TObject);
begin
 frmListBebedouro:= TfrmListBebedouro.Create(nil);
 frmListBebedouro.ShowModal(procedure(ModalResult: TModalResult)
 begin
  EdtBebedouro.Text     :=frmListBebedouro.vNomeBebedouro;
  vIdBebedouro          :=frmListBebedouro.vIdBebedouro;
  lblUltimaLimpeza.Text :=frmListBebedouro.vUltimaLimpeza;
  layDadosBebedouro.Height := 110;
 end);
end;

procedure TfrmCadPadrao.btnBuscarClick(Sender: TObject);
var
 vFiltro:string;
begin
 vFiltro :=' and data='+FormatDateTime('yyyy-mm-dd',edtdata.Date).QuotedString;
 if edtBebedouroF.Text.Length>0 then
  vFiltro := vFiltro+' and pasto like '+QuotedStr('%'+edtBebedouroF.Text+'%');
 GeraListaCards(vFiltro);
end;

procedure TfrmCadPadrao.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmCadPadrao.btnConfirmarClick(Sender: TObject);
begin
 if EdtBebedouro.Text.Length=0 then
 begin
   ShowMessage('Informe o Bebedouro!');
   Exit;
 end;
 dmdb.LIMPEZABEBEDOUROID_BEBEDOURO.AsString    := vIdBebedouro;
 dmdb.LIMPEZABEBEDOUROID_RESPOPNSAVEL.AsString := dmdb.vIdUser;
 dmdb.LIMPEZABEBEDOURODATA.AsDateTime          := date;
 dmdb.LIMPEZABEBEDOUROHORA.AsDateTime          := now;
 if edtObs.Text.Length>0 then
  dmdb.LIMPEZABEBEDOUROOBSERVACAO.AsString     := edtObs.Text;
 dmdb.LIMPEZABEBEDOUROID_USUARIO.AsString      := dmdb.vIdUser;
 dmdb.LIMPEZABEBEDOUROLATITUDE.AsString        := lblLatitude.Text;
 dmdb.LIMPEZABEBEDOUROLONGITUDE.AsString       := lblLongitude.Text;
 try
   dmdb.LIMPEZABEBEDOURO.ApplyUpdates(-1);
   btnBuscarClick(Sender);
   tbPrincipal.ActiveTab := tbilista;
 except
   on E : Exception do
    ShowMessage('Erro ao Confirmar Registro : '+E.Message);
 end;
end;

procedure TfrmCadPadrao.btnExcluiItemClick(Sender: TObject);
begin
 layBtnLista.Visible := false;
 if vFlagSync='0' then
 begin
   MessageDlg('Deseja Realmente Deletar esse Registro?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes,
   System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
    case AResult of
     mrYES:
     begin
       dmDB.DeletaGenerico(vIdLimpeza,'limpezabebedouro');
       btnBuscarClick(sender);
     end;
     mrNo:
    end;
   end);
 end
 else
 begin
   ShowMessage('Registro ja Sincronizado!!');
 end;
end;

procedure TfrmCadPadrao.btnLerQrClick(Sender: TObject);
var
 vCod,vNome:string;
begin
 {$IFDEF Android}
  if Not Assigned(FrmCamera) then
   Application.CreateForm(TFrmCamera, FrmCamera);
  FrmCamera.ShowModal(procedure(ModalResult: TModalResult)
  begin
    vCod := FrmCamera.codigo;
    if vCod.Length>0 then
    begin
      vNome             := dmdb.RetornaNomeBebedouro(vCod);
      if vNome.Length=0 then
      begin
        edtBebedouro.Text :='';
        layDadosBebedouro.Height := 60;
        ShowMessage('Codigo não encontrado:'+vCod);
      end
      else
      begin
       edtBebedouro.Text :=vNome;
       vIdBebedouro      := vCod;
       layDadosBebedouro.Height := 110;
      end;
    end;
  end);
 {$ENDIF}
end;

procedure TfrmCadPadrao.btnNovoClick(Sender: TObject);
begin
  layDadosBebedouro.Height:= 65;
  LocationSensor1.Active  := false;
  LocationSensor1.Active  := true;
  EdtBebedouro.Text :='';
  edtObs.Text       :='';
  dmdb.LIMPEZABEBEDOURO.Close;
  dmdb.LIMPEZABEBEDOURO.Open;
  dmdb.LIMPEZABEBEDOURO.Insert;
  tbPrincipal.ActiveTab := tbiCad;
end;

procedure TfrmCadPadrao.btnNovoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmCadPadrao.btnNovoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 1;
end;

procedure TfrmCadPadrao.DestroiFrames;
var
  i : Integer;
begin
  for i := ComponentCount - 1 downto 0 do
  begin
   If (Components[i] is TFrame) then
     TFrame(Components[i]).Destroy;
  end;
end;

procedure TfrmCadPadrao.DisplayRationale(Sender: TObject;
  const APermissions: TArray<string>; const APostRationaleProc: TProc);
var
  I: Integer;
  RationaleMsg: string;
begin
  for I := 0 to High(APermissions) do
  begin
    if (APermissions[I] = Access_Coarse_Location) or (APermissions[I] = Access_Fine_Location) then
      RationaleMsg := 'O app precisa de acesso ao GPS para obter sua localização'
  end;
  TDialogService.ShowMessage(RationaleMsg,
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end)
end;

end.

