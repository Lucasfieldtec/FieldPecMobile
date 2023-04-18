unit UMovAnimal;

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
    ,Soap.EncdDecd,UFrameMovAnimal, FMX.Memo.Types;

type
  TfrmMovAnimal = class(TForm)
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
    EdtAnimal: TEdit;
    ClearEditButton1: TClearEditButton;
    SearchEditButton2: TSearchEditButton;
    LocationSensor1: TLocationSensor;
    GestureManager1: TGestureManager;
    Rectangle9: TRectangle;
    Rectangle11: TRectangle;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout34: TLayout;
    Label2: TLabel;
    Rectangle4: TRectangle;
    edtOrigemF: TEdit;
    ClearEditButton2: TClearEditButton;
    Layout35: TLayout;
    Layout36: TLayout;
    Label13: TLabel;
    Rectangle14: TRectangle;
    edtDestinoF: TEdit;
    ClearEditButton3: TClearEditButton;
    layBtnLista: TLayout;
    btnHabilitaSync: TRectangle;
    Image16: TImage;
    Label32: TLabel;
    btnExcluiItem: TRectangle;
    Image6: TImage;
    lblExcluir: TLabel;
    Layout13: TLayout;
    Layout15: TLayout;
    Rectangle7: TRectangle;
    Label5: TLabel;
    Layout20: TLayout;
    Rectangle12: TRectangle;
    edtMotivo: TEdit;
    ClearEditButton4: TClearEditButton;
    btnBuscaMotivo: TSearchEditButton;
    Layout26: TLayout;
    Layout27: TLayout;
    Rectangle13: TRectangle;
    Label10: TLabel;
    Layout28: TLayout;
    Rectangle15: TRectangle;
    edtDestino: TEdit;
    ClearEditButton5: TClearEditButton;
    btnBuscaDestino: TSearchEditButton;
    Layout29: TLayout;
    Layout30: TLayout;
    Rectangle16: TRectangle;
    Label11: TLabel;
    Layout31: TLayout;
    Rectangle17: TRectangle;
    edtOrigem: TEdit;
    ClearEditButton6: TClearEditButton;
    btnBuscaOrigem: TSearchEditButton;
    procedure btnNovoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnNovoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnCloseAllClick(Sender: TObject);
    procedure BuscaOrigemClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnExcluiItemClick(Sender: TObject);
    procedure btnBuscaOrigemClick(Sender: TObject);
    procedure btnBuscaDestinoClick(Sender: TObject);
    procedure btnBuscaMotivoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
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
    FFrame     : TFrameMovAnimal;
    vId,vIdBebedouro,vFlagSync,vIdAnimal,vIdOrigem,vIdDestino,
    vIdMotivo,vTipoOrigem:string;
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
  frmMovAnimal: TfrmMovAnimal;

implementation

{$R *.fmx}

uses UDmDB, UListBebedouro, UNewCam, UFrameAnimal, UListAnimal, UCurrais,
  UListMotivoMov;

procedure TfrmMovAnimal.FormShow(Sender: TObject);
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

procedure TfrmMovAnimal.FrameGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  layBtnLista.Visible := true;
end;

procedure TfrmMovAnimal.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmMovAnimal.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmMovAnimal.GeraListaCards(vFiltro: string);
var
  item: TListBoxItem;
begin
   if ListaCards=nil then
    FreeAndNil(ListaCards);
   DestroiFrames;
   ListaCards        := TListBox.Create(self);
   ListaCards.Parent := layListCards;
   ListaCards.Align  := TAlignLayout.Client;

   dmDB.AbreMovAnimal(dmdb.vIdPropriedade,vFiltro);
   dmDB.MOVIMENTACAO_ANIMAL.First;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     while not dmDB.MOVIMENTACAO_ANIMAL.eof do
     begin
      ListaCards.BeginUpdate;
      item := TListBoxItem.Create(self);
      FFrame := TFrameMovAnimal.Create(self);
      FFrame.Name:= 'Item_'+dmDB.MOVIMENTACAO_ANIMALID.AsString;
      FFrame.Parent          := item;
      FFrame.Align           := TAlignLayout.Client;
      FFrame.HitTest         := false;
      FFrame.Opacity         := 1;

      item.HitTest           := true;
      item.Height            := 320;
      item.Margins.Left      := 10;
      item.Margins.Right     := 10;
      item.Margins.Top       := 10;
      item.Margins.Bottom    := 10;
      item.TagString         := dmDB.MOVIMENTACAO_ANIMALID.AsString;
      item.OnClick                       := ItemClick;
      item.OnMouseDown                   := FrameMouseDown;
      item.OnMouseUp                     := FrameMouseUp;
      item.Touch.GestureManager          := GestureManager1;
      item.Touch.InteractiveGestures     := [TInteractiveGesture.LongTap];
      item.OnGesture                     := FrameGesture;
      item.Tag                           := dmDB.MOVIMENTACAO_ANIMALID.AsInteger;

      FFrame.lblData.Text                := dmDB.MOVIMENTACAO_ANIMALDATA.AsString;
      FFrame.lblMotivo.Text              := dmDB.MOVIMENTACAO_ANIMALMotivo.AsString;
      FFrame.lblOrigem.Text              := dmDB.MOVIMENTACAO_ANIMALOrigem.AsString;
      FFrame.lblDestino.Text             := dmDB.MOVIMENTACAO_ANIMALDestino.AsString;
      FFrame.lblIdentificacaoAnimal.Text := dmDB.MOVIMENTACAO_ANIMALidentificacao.AsString;



      if dmDB.MOVIMENTACAO_ANIMALSYNC.AsInteger=0 then
      begin
        FFrame.imgSyncYes.visible := false;
        FFrame.imgSyncNo.visible  := true;
        FFrame.lblSync.Text       := 'Sincronização Pendente';
      end;
      if dmDB.MOVIMENTACAO_ANIMALSYNC.AsInteger=1 then
      begin
        FFrame.imgSyncYes.visible := true;
        FFrame.imgSyncNo.visible  := false;
        FFrame.lblSync.Text       := 'Sincronizado';
      end;
      item.Parent                      := ListaCards;

      ListaCards.EndUpdate;
      dmDB.MOVIMENTACAO_ANIMAL.Next;
     end;
     lblTotalRegistro.Text := intToStr(ListaCards.Items.Count);
    end);
   end).Start;
end;

procedure TfrmMovAnimal.ItemClick(Sender: TObject);
begin
 vId                 := intToStr(TListBoxItem(sender).Tag);
 vFlagSync           := FloatToStr(TListBoxItem(sender).TagFloat);
 TListBoxItem(sender).IsSelected := true;
end;

procedure TfrmMovAnimal.LimpaCampos;
begin
 EdtAnimal.Text  :='';
 edtOrigem.Text  :='';
 edtDestino.Text :='';
 edtMotivo.Text  :='';
end;
{$IFDEF ANDROID}
procedure TfrmMovAnimal.LocationPermissionRequestResult(Sender: TObject;
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
procedure TfrmMovAnimal.BuscaOrigemClick(Sender: TObject);
begin
 frmListAnimal:= TfrmListAnimal.Create(nil);
 frmListAnimal.ShowModal(procedure(ModalResult: TModalResult)
 begin
  EdtAnimal.Text        := frmListAnimal.vIddentificacao;
  vIdAnimal             := frmListAnimal.vIdAnimal;
  edtOrigem.Text        := dmdb.RetornaOrigemAnimalMov(vIdAnimal);
  vIdOrigem             := dmdb.vLocalAnimalId;
 end);
end;

procedure TfrmMovAnimal.btnBuscaDestinoClick(Sender: TObject);
begin
 frmListaCurrais:= TfrmListaCurrais.Create(nil);
 frmListaCurrais.ShowModal(procedure(ModalResult: TModalResult)
 begin
  edtDestino.Text        := frmListaCurrais.vNomeCurral;
  vIdDestino             := frmListaCurrais.vIdCurral;
 end);
end;

procedure TfrmMovAnimal.btnBuscaMotivoClick(Sender: TObject);
begin
 frmListaMotivoMov:= TfrmListaMotivoMov.Create(nil);
 frmListaMotivoMov.GeraListaCards('');
 frmListaMotivoMov.ShowModal(procedure(ModalResult: TModalResult)
 begin
  edtMotivo.Text := frmListaMotivoMov.vNomeMotivo;
  vIdMotivo      := frmListaMotivoMov.vIdMotivo;
 end);
end;

procedure TfrmMovAnimal.btnBuscaOrigemClick(Sender: TObject);
begin
 frmListaCurrais:= TfrmListaCurrais.Create(nil);
 frmListaCurrais.ShowModal(procedure(ModalResult: TModalResult)
 begin
  edtOrigem.Text        := frmListaCurrais.vNomeCurral;
  vIdOrigem             := frmListaCurrais.vIdCurral;
  vTipoOrigem           := frmListaCurrais.vTipo;
 end);
end;

procedure TfrmMovAnimal.btnBuscarClick(Sender: TObject);
var
 vFiltro:string;
begin
 vFiltro :=' and data='+FormatDateTime('yyyy-mm-dd',edtdata.Date).QuotedString;
 if edtOrigemF.Text.Length>0 then
  vFiltro := vFiltro+' and origem like '+QuotedStr('%'+edtOrigemF.Text+'%');
 if edtDestinoF.Text.Length>0 then
  vFiltro := vFiltro+' and destino like '+QuotedStr('%'+edtDestinoF.Text+'%');
 GeraListaCards(vFiltro);
end;

procedure TfrmMovAnimal.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmMovAnimal.btnConfirmarClick(Sender: TObject);
begin
 if EdtAnimal.Text.Length=0 then
 begin
   ShowMessage('Informe o Animal!');
   Exit;
 end;
 if edtOrigem.Text.Length=0 then
 begin
   ShowMessage('Informe a Origem!');
   Exit;
 end;
 if edtDestino.Text.Length=0 then
 begin
   ShowMessage('Informe o Destino!');
   Exit;
 end;
 if edtOrigem.Text=edtDestino.Text then
 begin
   ShowMessage('Origem e Destino não pode ser iguais!');
   Exit;
 end;
 if edtMotivo.Text.Length=0 then
 begin
   ShowMessage('Informe o Motivo!');
   Exit;
 end;
 dmdb.MOVIMENTACAO_ANIMALID_ANIMAL.AsString          := vIdAnimal;
 dmdb.MOVIMENTACAO_ANIMALID_PASTO_ORIGEM.AsString    := vIdOrigem;
 dmdb.MOVIMENTACAO_ANIMALID_PASTO_DESTINO.AsString   := vIdDestino;
 dmdb.MOVIMENTACAO_ANIMALID_MOTIVO.AsString          := vIdMotivo;
 dmdb.MOVIMENTACAO_ANIMALDATA.AsDateTime             := edtdata.DateTime;
 dmdb.MOVIMENTACAO_ANIMALID_USUARIO.AsString         := dmdb.vIdUser;
 try
   dmdb.MOVIMENTACAO_ANIMAL.ApplyUpdates(-1);
   btnBuscarClick(Sender);
   tbPrincipal.ActiveTab := tbilista;
 except
   on E : Exception do
    ShowMessage('Erro ao Confirmar Registro : '+E.Message);
 end;
end;

procedure TfrmMovAnimal.btnExcluiItemClick(Sender: TObject);
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
       dmDB.DeletaGenerico(vId,'MOVIMENTACAO_ANIMAL');
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

procedure TfrmMovAnimal.btnNovoClick(Sender: TObject);
begin
  layDadosBebedouro.Height:= 65;
  LocationSensor1.Active  := false;
  LocationSensor1.Active  := true;
  LimpaCampos;
  dmdb.MOVIMENTACAO_ANIMAL.Close;
  dmdb.MOVIMENTACAO_ANIMAL.Open;
  dmdb.MOVIMENTACAO_ANIMAL.Insert;
  tbPrincipal.ActiveTab := tbiCad;
end;

procedure TfrmMovAnimal.btnNovoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmMovAnimal.btnNovoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 1;
end;

procedure TfrmMovAnimal.DestroiFrames;
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
procedure TfrmMovAnimal.DisplayRationale(Sender: TObject;
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

