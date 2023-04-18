unit UFornMineral;

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
    ,Soap.EncdDecd,UFrameFormMineral, FMX.Memo.Types;

type
  TfrmFornMineral = class(TForm)
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
    edtPastoF: TEdit;
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
    layDadosPasto: TLayout;
    Layout19: TLayout;
    Label6: TLabel;
    Layout14: TLayout;
    Rectangle6: TRectangle;
    edtCocho: TEdit;
    ClearEditButton1: TClearEditButton;
    SearchEditButton2: TSearchEditButton;
    Layout15: TLayout;
    btnLerQr: TRectangle;
    Layout20: TLayout;
    Image2: TImage;
    Layout26: TLayout;
    Layout27: TLayout;
    Layout28: TLayout;
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
    Layout13: TLayout;
    Layout31: TLayout;
    Image7: TImage;
    Layout32: TLayout;
    lblQtdeCabeca: TLabel;
    Layout33: TLayout;
    Label12: TLabel;
    Rectangle9: TRectangle;
    Rectangle11: TRectangle;
    Label5: TLabel;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Rectangle7: TRectangle;
    edtMineral: TEdit;
    ClearEditButton3: TClearEditButton;
    SearchEditButton1: TSearchEditButton;
    Layout34: TLayout;
    Rectangle14: TRectangle;
    Label13: TLabel;
    Rectangle15: TRectangle;
    cbxTipoForne: TComboBox;
    Layout35: TLayout;
    Rectangle16: TRectangle;
    rdSaco: TRadioButton;
    rdKg: TRadioButton;
    Layout36: TLayout;
    Rectangle17: TRectangle;
    Label14: TLabel;
    Rectangle18: TRectangle;
    edtQtdeForne: TEdit;
    Layout37: TLayout;
    Rectangle19: TRectangle;
    Label15: TLabel;
    Rectangle20: TRectangle;
    cbxEstoqueOrigem: TComboBox;
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
    procedure SearchEditButton1Click(Sender: TObject);
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
    FFrame     : TFrameFornMineral;
    vIdLimpeza,vIdCocho,vIdPasto,vFlagSync,vIdMineral,vKgEmbalagemMineral: string;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure GeraListaCards(vFiltro:string);
    procedure DestroiFrames;
    procedure ItemClick(Sender: TObject);
    procedure FrameGesture(Sender: TObject;
     const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure LimpaCampos;

end;

var
  frmFornMineral: TfrmFornMineral;

implementation

{$R *.fmx}

uses UDmDB, UListBebedouro, UNewCam, UListCocho, UListSuplementoMineral;

procedure TfrmFornMineral.FormShow(Sender: TObject);
begin
 {$IFDEF ANDROID}
  Access_Coarse_Location := JStringToString(TJManifest_permission.JavaClass.ACCESS_COARSE_LOCATION);
  Access_Fine_Location   := JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION);
  PermissionsService.RequestPermissions([Access_Coarse_Location,
                                                       Access_Fine_Location],
                                                       procedure(const APermissions: TClassicStringDynArray; const AGrantResults: TClassicPermissionStatusDynArray)
                                                        begin

                                                        end);
  PermissaoCamera       := JStringToString(TJManifest_permission.JavaClass.CAMERA);
  PermissaoReadStorage  := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  PermissaoWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);

 {$ENDIF}

 layBtnLista.Visible     := false;
 tbPrincipal.TabPosition := TTabPosition.None;
 tbPrincipal.ActiveTab   := tbilista;
end;

procedure TfrmFornMineral.FrameGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  layBtnLista.Visible := true;
end;

procedure TfrmFornMineral.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmFornMineral.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmFornMineral.GeraListaCards(vFiltro: string);
var
  item: TListBoxItem;
begin
   if ListaCards=nil then
    FreeAndNil(ListaCards);
   DestroiFrames;
   ListaCards        := TListBox.Create(self);
   ListaCards.Parent := layListCards;
   ListaCards.Align  := TAlignLayout.Client;

   dmDB.AbreFornMineral(dmdb.vIdPropriedade,vFiltro);
   dmDB.FORNECIMENTO.First;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     while not dmDB.FORNECIMENTO.eof do
     begin
      ListaCards.BeginUpdate;
      item := TListBoxItem.Create(self);
      FFrame := TFrameFornMineral.Create(self);
      FFrame.Name:= 'Item_'+dmDB.FORNECIMENTOID.AsString;
      FFrame.Parent          := item;
      FFrame.Align           := TAlignLayout.Client;
      FFrame.HitTest         := false;
      FFrame.Opacity         := 1;

      item.HitTest           := true;
      item.Height            := 260;
      item.Margins.Left      := 10;
      item.Margins.Right     := 10;
      item.Margins.Top       := 10;
      item.Margins.Bottom    := 10;
      item.TagString         := dmDB.FORNECIMENTOID.AsString;
      item.OnClick           := ItemClick;
      item.OnMouseDown       := FrameMouseDown;
      item.OnMouseUp         := FrameMouseUp;
      item.Touch.GestureManager      := GestureManager1;
      item.Touch.InteractiveGestures := [TInteractiveGesture.LongTap];
      item.OnGesture                 := FrameGesture;

      item.Tag               := dmDB.FORNECIMENTOID.AsInteger;
      item.TagString         := dmDB.FORNECIMENTOPasto.AsString;
      item.TagFloat          := dmDB.FORNECIMENTOSYNC.AsFloat;

      FFrame.lblpasto.Text          := dmDB.FORNECIMENTOPasto.AsString;
      FFrame.lblpasto.TagString     := dmDB.FORNECIMENTOID.AsString;
      FFrame.lbldata.Text           := dmDB.FORNECIMENTODATA_FORNECIMENTO.AsString;
      FFrame.lblmineral.Text        := dmDB.FORNECIMENTOMineral.AsString;
      FFrame.lblRealizadoCocho.Text := dmDB.FORNECIMENTOREALIZADO_COCHO_SACO.AsString;
      FFrame.lblEstoqueCasinha.Text := dmDB.FORNECIMENTOREALIZADO_ESTOQUE_SACO.AsString;
      FFrame.lblRealizadoCochoKG.Text := dmDB.FORNECIMENTOREALIZADO_COCHO_KG.AsString;
      FFrame.lblEstoqueCasinhaKG.Text := dmDB.FORNECIMENTOREALIZADO_ESTOQUE_KG.AsString;

      if dmDB.FORNECIMENTOSYNC.AsInteger=0 then
      begin
        FFrame.imgSyncYes.visible := false;
        FFrame.imgSyncNo.visible  := true;
        FFrame.lblSync.Text       := 'Sincronização Pendente';
      end;
      if dmDB.FORNECIMENTOSYNC.AsInteger=1 then
      begin
        FFrame.imgSyncYes.visible := true;
        FFrame.imgSyncNo.visible  := false;
        FFrame.lblSync.Text       := 'Sincronizado';
      end;
      item.Parent                      := ListaCards;

      ListaCards.EndUpdate;
      dmDB.FORNECIMENTO.Next;
     end;
     lblTotalRegistro.Text := intToStr(ListaCards.Items.Count);
    end);
   end).Start;
end;

procedure TfrmFornMineral.ItemClick(Sender: TObject);
begin
 vIdLimpeza          := intToStr(TListBoxItem(sender).Tag);
 vFlagSync           := FloatToStr(TListBoxItem(sender).TagFloat);
 TListBoxItem(sender).IsSelected := true;
end;

procedure TfrmFornMineral.LimpaCampos;
begin
  edtCocho.Text              :='';
  edtMineral.Text            :='';
  cbxTipoForne.ItemIndex     :=-1;
  cbxEstoqueOrigem.ItemIndex :=-1;
  edtQtdeForne.Text          :='0';
  lblLatitude.Text           :='';
  lblLongitude.Text          :='';
  rdSaco.IsChecked           :=true;
end;
{$IFDEF ANDROID}
procedure TfrmFornMineral.LocationPermissionRequestResult(Sender: TObject;
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
{$ENDIF}
procedure TfrmFornMineral.LocationSensor1LocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
begin
 lblLatitude.Text  := Format('%2.6f', [NewLocation.Latitude]);
 lblLongitude.Text := Format('%2.6f', [NewLocation.Longitude]);
end;

procedure TfrmFornMineral.SearchEditButton1Click(Sender: TObject);
begin
 frmListaMineral:= TfrmListaMineral.Create(nil);
 frmListaMineral.ShowModal(procedure(ModalResult: TModalResult)
 begin
  edtMineral.Text       :=frmListaMineral.vNomeMineral;
  vIdMineral            :=frmListaMineral.vIdMineral;
  vKgEmbalagemMineral   :=frmListaMineral.vKgEmbalagem;
 end);
end;

procedure TfrmFornMineral.SearchEditButton2Click(Sender: TObject);
begin
 frmListCocho:= TfrmListCocho.Create(nil);
 frmListCocho.ShowModal(procedure(ModalResult: TModalResult)
 begin
  EdtCocho.Text         :=frmListCocho.vNomeCocho;
  vIdCocho              :=frmListCocho.vIdCocho;
  vIdPasto              :=frmListCocho.vIdPasto;
  lblQtdeCabeca.Text    :=frmListCocho.vLotacao;
  layDadosPasto.Height := 110;
 end);
end;

procedure TfrmFornMineral.btnBuscarClick(Sender: TObject);
var
 vFiltro:string;
begin
 vFiltro :=' and DATA_FORNECIMENTO='+FormatDateTime('yyyy-mm-dd',edtdata.Date).QuotedString;
 if edtPastoF.Text.Length>0 then
  vFiltro := vFiltro+' and C.codigo like '+QuotedStr('%'+edtPastoF.Text+'%');
 GeraListaCards(vFiltro);
end;

procedure TfrmFornMineral.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmFornMineral.btnConfirmarClick(Sender: TObject);
begin
 if edtCocho.Text.Length=0 then
 begin
   ShowMessage('Informe o Cocho!');
   Exit;
 end;
 if edtMineral.Text.Length=0 then
 begin
   ShowMessage('Informe o Mineral!');
   Exit;
 end;
 if cbxTipoForne.ItemIndex=-1 then
 begin
   ShowMessage('Informe o Tipo!');
   Exit;
 end;
 if (not rdSaco.IsChecked)and(not rdKg.IsChecked) then
 begin
   ShowMessage('Informe se é em KG ou Saco!');
   Exit;
 end;
 if (edtQtdeForne.Text.Length=0)or(edtQtdeForne.Text='0') then
 begin
   ShowMessage('Informe a Quantidade!');
   Exit;
 end;
 if cbxEstoqueOrigem.ItemIndex=-1 then
 begin
   ShowMessage('Informe o Estoque de Origem!');
   Exit;
 end;
 dmdb.FORNECIMENTOID_PASTO.AsString            := vIdPasto;
 dmdb.FORNECIMENTOID_COCHO.AsString            := vIdCocho;
 dmdb.FORNECIMENTOQTD_ANIMAIS.AsString         := lblQtdeCabeca.Text;
 dmdb.FORNECIMENTOID_PRODUTO.AsString          := vIdMineral;
 dmdb.FORNECIMENTODATA_FORNECIMENTO.AsDateTime := edtdata.Date;
 dmdb.FORNECIMENTOESTOQUE_ORIGEM.AsInteger     := cbxEstoqueOrigem.ItemIndex;
 dmdb.FORNECIMENTOTIPO_FORNE.AsString          := 'App';
 if cbxTipoForne.ItemIndex=0 then
 begin
  if rdSaco.IsChecked then
  begin
   dmdb.FORNECIMENTOREALIZADO_COCHO_SACO.AsFloat := StrToFloat(edtQtdeForne.Text);
   dmdb.FORNECIMENTOREALIZADO_COCHO_KG.AsFloat   :=
    StrToFloat(edtQtdeForne.Text)*StrToFloat(vKgEmbalagemMineral);
  end;
  if rdKg.IsChecked then
  begin
   dmdb.FORNECIMENTOREALIZADO_COCHO_SACO.AsFloat := StrToFloat(edtQtdeForne.Text)/
   StrToFloat(vKgEmbalagemMineral);
   dmdb.FORNECIMENTOREALIZADO_COCHO_KG.AsFloat   :=StrToFloat(edtQtdeForne.Text);
  end;
 end
 else
 begin
   if rdSaco.IsChecked then
  begin
   dmdb.FORNECIMENTOREALIZADO_ESTOQUE_SACO.AsFloat := StrToFloat(edtQtdeForne.Text);
   dmdb.FORNECIMENTOREALIZADO_ESTOQUE_KG.AsFloat   :=
    StrToFloat(edtQtdeForne.Text)*StrToFloat(vKgEmbalagemMineral);
  end;
  if rdKg.IsChecked then
  begin
   dmdb.FORNECIMENTOREALIZADO_ESTOQUE_SACO.AsFloat := StrToFloat(edtQtdeForne.Text)/
   StrToFloat(vKgEmbalagemMineral);
   dmdb.FORNECIMENTOREALIZADO_ESTOQUE_KG.AsFloat   :=StrToFloat(edtQtdeForne.Text);
  end;
 end;
 dmdb.FORNECIMENTOLATITUDE.AsString       := lblLatitude.Text;
 dmdb.FORNECIMENTOLONGITUDE.AsString      := lblLongitude.Text;
 dmdb.FORNECIMENTOID_USUARIO.AsString     := dmdb.vIdUser;
 dmdb.FORNECIMENTOID_RESPONSAVEL.AsString := dmdb.vIdUser;
 try
   dmdb.FORNECIMENTO.ApplyUpdates(-1);
   btnBuscarClick(Sender);
   tbPrincipal.ActiveTab := tbilista;
 except
   on E : Exception do
    ShowMessage('Erro ao Confirmar Registro : '+E.Message);
 end;
end;

procedure TfrmFornMineral.btnExcluiItemClick(Sender: TObject);
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
       dmDB.DeletaGenerico(vIdLimpeza,'FORNECIMENTO');
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

procedure TfrmFornMineral.btnLerQrClick(Sender: TObject);
var
 vCod,vNome:string;
begin
 {$IFDEF Android}
  if Not Assigned(FrmCameraNew) then
   Application.CreateForm(TFrmCameraNew, FrmCameraNew);
  FrmCameraNew.ShowModal(procedure(ModalResult: TModalResult)
  begin
    vCod := FrmCameraNew.codigo;
    if vCod.Length>0 then
    begin
      dmdb.AbreCocho(dmdb.vIdPropriedade,' AND TAG='+vCod.QuotedString);
      if dmdb.COCHO.IsEmpty then
      begin
        edtCocho.Text :='';
        layDadosPasto.Height := 60;
        ShowMessage('Codigo não encontrado:'+vCod);
      end
      else
      begin
       edtCocho.Text :=dmdb.COCHOPasto.AsString;
       vIdCocho      :=dmdb.COCHOID.AsString;
       vIdPasto      :=dmdb.COCHOID_PASTO.AsString;
       lblQtdeCabeca.Text :=dmdb.COCHOLOTACAO.AsString;;
       layDadosPasto.Height := 110;
      end;
    end;
  end);
 {$ENDIF}
end;

procedure TfrmFornMineral.btnNovoClick(Sender: TObject);
begin
  LimpaCampos;
  layDadosPasto.Height:= 65;
  LocationSensor1.Active  := false;
  LocationSensor1.Active  := true;
  dmdb.FORNECIMENTO.Close;
  dmdb.FORNECIMENTO.Open;
  dmdb.FORNECIMENTO.Insert;
  tbPrincipal.ActiveTab := tbiCad;
end;

procedure TfrmFornMineral.btnNovoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmFornMineral.btnNovoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 1;
end;

procedure TfrmFornMineral.DestroiFrames;
var
  i : Integer;
begin
  for i := ComponentCount - 1 downto 0 do
  begin
   If (Components[i] is TFrame) then
     TFrame(Components[i]).Destroy;
  end;
end;
{$IFDEF ANDROID}
procedure TfrmFornMineral.DisplayRationale(Sender: TObject;
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
{$ENDIF}

end.

