unit UFornecimento;

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
    ,Soap.EncdDecd,UFrameFornecimento,UFrameLoteFornecimento, FMX.Memo.Types,
  View.WebCharts, FMX.WebBrowser,Charts.Types,uCombobox;

type
  TfrmFornecimento = class(TForm)
    StyleBook1: TStyleBook;
    tbPrincipal: TTabControl;
    tbilista: TTabItem;
    tbiCad: TTabItem;
    Rectangle1: TRectangle;
    layPrincipal: TLayout;
    RecLista: TRectangle;
    layListCards: TLayout;
    Layout9: TLayout;
    btnLeitura: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image4: TImage;
    Layout1: TLayout;
    Rectangle3: TRectangle;
    Layout2: TLayout;
    Layout4: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Label2: TLabel;
    Rectangle4: TRectangle;
    edtCurralF: TEdit;
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
    layDadosLotes: TLayout;
    Layout19: TLayout;
    Label6: TLabel;
    Layout26: TLayout;
    layBtnLista: TLayout;
    btnHabilitaSync: TRectangle;
    Image16: TImage;
    Label32: TLabel;
    btnExcluiItem: TRectangle;
    Image6: TImage;
    lblExcluir: TLabel;
    LocationSensor1: TLocationSensor;
    GestureManager1: TGestureManager;
    Rectangle9: TRectangle;
    Rectangle11: TRectangle;
    layListaCardsLotes: TLayout;
    laycharts: TLayout;
    WebCharts1: TWebCharts;
    Layout14: TLayout;
    Layout15: TLayout;
    Label5: TLabel;
    Rectangle6: TRectangle;
    Layout20: TLayout;
    Layout28: TLayout;
    btnConfirmar: TRectangle;
    Layout29: TLayout;
    Label12: TLabel;
    Image8: TImage;
    Rectangle18: TRectangle;
    Layout35: TLayout;
    Layout36: TLayout;
    Label13: TLabel;
    Layout37: TLayout;
    Rectangle19: TRectangle;
    edtPrevisto: TEdit;
    Rectangle7: TRectangle;
    Layout27: TLayout;
    Layout30: TLayout;
    Layout31: TLayout;
    Rectangle20: TRectangle;
    Label15: TLabel;
    Layout24: TLayout;
    Rectangle12: TRectangle;
    Label8: TLabel;
    RoundRect1: TRoundRect;
    cbxTrato: TComboBox;
    Layout13: TLayout;
    layNota: TLayout;
    Nota: TLabel;
    cbxNota: TRoundRect;
    Image2: TImage;
    lblDieta: TLabel;
    Layout23: TLayout;
    btnBuscaFiltro: TRectangle;
    Layout32: TLayout;
    Label10: TLabel;
    Image3: TImage;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField: TLinkFillControlToField;
    edtRealizado: TLabel;
    edtLinhaF: TEdit;
    ListaCards: TListView;
    lblPrevTotal: TLabel;
    lblRealTotal: TLabel;
    Layout33: TLayout;
    Layout34: TLayout;
    Layout38: TLayout;
    Label11: TLabel;
    Layout39: TLayout;
    Layout40: TLayout;
    Label14: TLabel;
    Rectangle14: TRectangle;
    cbxTratoF: TComboBox;
    Rectangle13: TRectangle;
    edtFiltraRacao: TEdit;
    ClearEditButton1: TClearEditButton;
    procedure btnLeituraMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnLeituraMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnCloseAllClick(Sender: TObject);
    procedure btnLeituraClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnExcluiItemClick(Sender: TObject);
    procedure cbxNotaClick(Sender: TObject);
    procedure edtdataClosePicker(Sender: TObject);
    procedure btnBuscaFiltroClick(Sender: TObject);
    procedure edtRealizadoClick(Sender: TObject);
    procedure ListaCardsItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure edtFiltraRacaoClick(Sender: TObject);
  private
    {$IFDEF ANDROID}
    Location: TLocationCoord2D;
    FGeocoder: TGeocoder;
     procedure LocationPermissionRequestResult
                (Sender: TObject; const APermissions: TArray<string>;
                const AGrantResults: TArray<TPermissionStatus>);
     procedure DisplayRationale(Sender: TObject;
              const APermissions: TArray<string>; const APostRationaleProc: TProc);
    {$ENDIF}
  public
    ListaCardsLotes :TListBox;
    c          : TCustomCombo;
    FFrame     : TFrameFornecimento;
    FFrameLote : TFrameLoteFornecimento;
    vIdLeitura,vIdBebedouro,vFlagSync,vIdLote,vIdCurral,vQdtCab,
    vMsRacao,vIdRacao : string;
    Access_Fine_Location, Access_Coarse_Location,vIdFornecimento,vMediaPeso : string;
    PermissaoCamera, PermissaoReadStorage, PermissaoWriteStorage,vAjuste : string;
    vListBoxIdex:single;
    vIndexLoteLista,vIndexLote,vBtnBuscar,vFiltroRacao:integer;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure GeraListaCards(vFiltro:string);
    procedure GeraListaCardLotes(vFiltro: string);
    procedure DestroiFrames;
    procedure ItemLoteClick(Sender: TObject);
    procedure FrameGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    {$IFDEF ANDROID}
     procedure ItemNotaClick(Sender: TObject; const Point: TPointF);
    {$ENDIF}
    {$IFDEF MSWINDOWS}
      procedure ItemNotaClick(Sender: TObject);
    {$ENDIF}
    procedure GeraComboDietas;
    procedure ProximoItemLote;

end;

var
  frmFornecimento: TfrmFornecimento;

implementation

{$R *.fmx}

uses UDmDB, UListBebedouro, UNewCam, UTeclado;

procedure TfrmFornecimento.FormShow(Sender: TObject);
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
 GeraComboDietas;
 layBtnLista.Visible     := false;
 tbPrincipal.TabPosition := TTabPosition.None;
 tbPrincipal.ActiveTab   := tbilista;
end;

procedure TfrmFornecimento.FrameGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  layBtnLista.Visible := true;
end;

procedure TfrmFornecimento.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmFornecimento.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmFornecimento.GeraListaCards(vFiltro: string);
var
  item   : TListViewItem;
  txt    : TListItemText;
  txtH   : TListItemPurpose;
  img    : TListItemImage;
  vRealizado,vPrevisto:Double;
begin
   vFiltro :=' and DATA_FORN='+FormatDateTime('yyyy-mm-dd',edtdataf.Date).QuotedString;
   if edtCurralF.Text.Length>0 then
    vFiltro := vFiltro+' and c.codito like '+QuotedStr('%'+edtCurralF.Text+'%');
   if cbxTratoF.ItemIndex>0 then
    vFiltro := vFiltro+' and a.trato='+cbxTratoF.Selected.Text;
   if edtFiltraRacao.Text.Length>0 then
    vFiltro := vFiltro+' and a.id_racao='+vIdRacao;

   dmDB.AbreFornecimentoConf(vFiltro);
   dmDB.FORNECIMENTO_CONF.First;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     ListaCards.Items.Clear;
     while not dmDB.FORNECIMENTO_CONF.eof do
     begin
       vRealizado := vRealizado + dmDB.FORNECIMENTO_CONFREALIZADO_MN_KG.AsFloat;
       vPrevisto  := vPrevisto  + dmDB.FORNECIMENTO_CONFPREVISTO_MN_KG.AsFloat;
       item := ListaCards.Items.Add;
       with frmFornecimento do
       begin
         with item  do
         begin
           txt           := TListItemText(Objects.FindDrawable('Text8'));
           txt.Text      := 'Data:';
           txt           := TListItemText(Objects.FindDrawable('Text7'));
           txt.Text      := dmDB.FORNECIMENTO_CONFDATA_FORN.AsString;

           txt           := TListItemText(Objects.FindDrawable('Text10'));
           txt.Text      := 'Trato:';
           txt           := TListItemText(Objects.FindDrawable('Text11'));
           txt.Text      := dmDB.FORNECIMENTO_CONFTRATO.AsString;

           txt           := TListItemText(Objects.FindDrawable('Text13'));
           txt.Text      := 'Ração:';
           txt           := TListItemText(Objects.FindDrawable('Text14'));
           txt.Text      := dmDB.FORNECIMENTO_CONFRACAO.AsString;

           txt           := TListItemText(Objects.FindDrawable('Text3'));
           txt.Text      := dmDB.FORNECIMENTO_CONFCURRAL.AsString;
           txt.TagString := dmDB.FORNECIMENTO_CONFID.AsString;
           txt.TagFloat  := dmDB.FORNECIMENTO_CONFSYNC.AsFloat;

           txt      := TListItemText(Objects.FindDrawable('Text9'));
           txt.Text := 'Previsto:';
           txt      := TListItemText(Objects.FindDrawable('Text4'));
           txt.Text := dmDB.FORNECIMENTO_CONFPREVISTO_MN_KG.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text5'));
           txt.Text := 'Realizado:';
           txt      := TListItemText(Objects.FindDrawable('Text6'));
           txt.Text := dmDB.FORNECIMENTO_CONFREALIZADO_MN_KG.AsString;

         end;
       end;
       dmDB.FORNECIMENTO_CONF.Next;
     end;
     lblPrevTotal.Text := 'Prev. Total:'+FormatFloat('0.00',vPrevisto);
     lblRealTotal.Text := 'Real. Total:'+FormatFloat('0.00',vRealizado);
     lblTotalRegistro.Text  := intToStr(ListaCards.Items.Count);
    end);
   end).Start;
end;

procedure TfrmFornecimento.GeraComboDietas;
begin
  c := TCustomCombo.Create(frmFornecimento);
  c.TitleMenuText := 'Escolha uma Dieta';
  c.SubTitleMenuText := '';
  c.BackgroundColor := $FFF2F2F8;
  c.OnClick := ItemNotaClick;
  dmDB.RACAO.Close;
  dmDB.RACAO.Open;
  dmDB.RACAO.First;
  while not dmDB.RACAO.Eof do
  begin
    c.AddItem(
     dmDB.RACAOid.AsString,
     dmDB.RACAOMATERIASECA.AsString,
     dmDB.RACAONOME.AsString
    );
    dmDB.RACAO.Next;
  end;
end;


procedure TfrmFornecimento.GeraListaCardLotes(vFiltro: string);
var
  I:integer;
  item: TListBoxItem;
  vMaxTrato:string;
begin
 if cbxTrato.ItemIndex=-1  then
 begin
  ShowMessage('Informe os Tratos!');
  Exit;
 end;
 if lblDieta.Text='Selecione a Dieta'  then
 begin
  ShowMessage('Selecione a Dieta!');
  Exit;
 end;
 if ListaCardsLotes<>nil then
  ListaCardsLotes.DisposeOf;
  ListaCardsLotes := TListBox.Create(self);
  ListaCardsLotes.Parent    := layListaCardsLotes;
  ListaCardsLotes.Align     := TAlignLayout.Client;
  ListaCardsLotes.ListStyle := TListStyle.Horizontal;

 if ListaCardsLotes.Items.Count>0 then
   ListaCardsLotes.Items.Clear;
 DestroiFrames;
 dmDB.AbreLotesFornecimento(
  edtLinhaF.Text,
  cbxTrato.Selected.Text,
  vIdRacao);

 dmDB.LISTA_LOTE_FRAME.First;
 I :=1;
 while not dmDB.LISTA_LOTE_FRAME.eof do
 begin
  vMaxTrato := dmdb.RetornaUltimoTratoCurral(dmDB.LISTA_LOTE_FRAMEIDCURRAL.AsString);
  ListaCards.BeginUpdate;
  item := TListBoxItem.Create(self);
  FFrameLote := TFrameLoteFornecimento.Create(self);
  FFrameLote.Name:= 'Item_Lote'+intToStr(I);
  FFrameLote.Parent                 := item;
  FFrameLote.Align                  := TAlignLayout.Client;
  FFrameLote.HitTest                := false;
  FFrameLote.Opacity                := 1;

  if dmDB.LOTE_NUTRICIONALUltimaNota.AsString.Length>0 then
   FFrameLote.RecBack.Fill.Color    := TAlphaColorRec.Lightcyan
  else
   FFrameLote.RecBack.Fill.Color    := TAlphaColorRec.White;

  item.HitTest                      := true;
  item.Height                       := ListaCardsLotes.Height;
  item.Width                        := ListaCardsLotes.Width-25;
  item.Margins.Left                 := 5;
  item.Margins.Right                := 5;
  item.Margins.Top                  := 2;
  item.Margins.Bottom               := 2;
  item.TagString                    := dmDB.LISTA_LOTE_FRAMEIDLOTE.AsString;
  item.Tag                          := dmDB.LISTA_LOTE_FRAMEIDCURRAL.AsInteger;
  item.TagFloat                     := dmDB.LISTA_LOTE_FRAMEID_FORNE.AsInteger;
  item.OnClick                      := ItemLoteClick;
  item.OnMouseDown                  := FrameMouseDown;
  item.OnMouseUp                    := FrameMouseUp;
  item.Touch.GestureManager         := GestureManager1;
  item.Touch.InteractiveGestures    := [TInteractiveGesture.LongTap];
  item.OnGesture                    := FrameGesture;

  FFrameLote.lblCurral.Text         := dmDB.LISTA_LOTE_FRAMECURRAL.AsString;
  FFrameLote.lblLote.Text           := dmDB.LISTA_LOTE_FRAMEIDLOTE.AsString;
  FFrameLote.lblRacaoPrevista.Text  := dmDB.LISTA_LOTE_FRAMERACAO.AsString;
  FFrameLote.lblTrato.Text          := dmDB.LISTA_LOTE_FRAMETRATO.AsString;

  if vMaxTrato=dmDB.LISTA_LOTE_FRAMETRATO.AsString then
   FFrameLote.lblPrevisto.Text       := dmdb.RetornaUltimoTratoCorrigidoCurral(dmDB.LISTA_LOTE_FRAMEIDCURRAL.AsString)
  else
   FFrameLote.lblPrevisto.Text       := dmDB.LISTA_LOTE_FRAMEPREVISTO_MN_KG.AsString;

  FFrameLote.lblRealizado.Text      := dmDB.LISTA_LOTE_FRAMEREALIZADO_MN_KG.AsString;
  item.Parent                       := ListaCardsLotes;

  ListaCardsLotes.EndUpdate;
  inc(I);
  dmDB.LISTA_LOTE_FRAME.Next;
 end;
 if vBtnBuscar=0 then
 begin
  ListaCards.BeginUpdate;
  ListaCardsLotes.ViewportPosition   := PointF(vListBoxIdex+(item.Height+25),0);
  ListaCardsLotes.EndUpdate;
  vBtnBuscar :=0;
 end;
end;

{$IFDEF ANDROID}
procedure TfrmFornecimento.ItemNotaClick(Sender: TObject; const Point: TPointF);
begin
 c.HideMenu;
 if vFiltroRacao=1 then
  edtFiltraRacao.Text :=c.NomeItem
 else
  lblDieta.Text     := c.NomeItem;
 vMsRacao          := c.DescricaoItem;
 vIdRacao          := c.CodItem;
end;
{$ENDIF}
{$IFDEF MSWINDOWS}
procedure TfrmFornecimento.ItemNotaClick(Sender: TObject);
begin
 c.HideMenu;
 if vFiltroRacao=1 then
  edtFiltraRacao.Text :=c.NomeItem
 else
  lblDieta.Text     := c.NomeItem;
 vMsRacao          := c.DescricaoItem;
 vIdRacao          := c.CodItem;
end;
{$ENDIF}


procedure TfrmFornecimento.ItemLoteClick(Sender: TObject);
begin
 if cbxTrato.ItemIndex=-1 then
 begin
   ShowMessage('Informe o Trato!');
   Exit;
 end;
 vIndexLote       := TListBoxItem(sender).Index;
 vIdLote          := TListBoxItem(sender).TagString;
 vIdCurral        := intToStr(TListBoxItem(sender).Tag);
 vIdFornecimento  := FloatToStr(TListBoxItem(sender).TagFloat);
 dmdb.AbreFornecimentoLote(vIdFornecimento);
 if not dmdb.FORNECIMENTO_CONF.IsEmpty then
 begin
   lblDieta.Text      := dmdb.FORNECIMENTO_CONF.FieldByName('RACAO').AsString;
   vMsRacao           := dmdb.FORNECIMENTO_CONF.FieldByName('MS_RACAO').AsString;
   vIdRacao           := dmdb.FORNECIMENTO_CONF.FieldByName('ID_RACAO').AsString;
   vQdtCab            := dmdb.FORNECIMENTO_CONF.FieldByName('QTDE_CAB_LOTE').AsString;
   vMediaPeso         := dmdb.FORNECIMENTO_CONF.FieldByName('PESO_MEDIO_LOTE').AsString;
   edtPrevisto.Text   := dmdb.FORNECIMENTO_CONF.FieldByName('PREVISTO_MN_KG').AsString;
   edtRealizado.Text  := dmdb.FORNECIMENTO_CONF.FieldByName('REALIZADO_MN_KG').AsString;
 end;
end;

procedure TfrmFornecimento.ListaCardsItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdFornecimento       := TAppearanceListViewItem(ListaCards.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').TagString;
 vFlagSync             := FloatToStr(TAppearanceListViewItem(ListaCards.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').TagFloat);
end;
{$IFDEF ANDROID}
procedure TfrmFornecimento.LocationPermissionRequestResult(Sender: TObject;
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
procedure TfrmFornecimento.ProximoItemLote;
begin
end;

procedure TfrmFornecimento.btnBuscaFiltroClick(Sender: TObject);
begin
  vBtnBuscar := 1;
  GeraListaCardLotes('');
end;

procedure TfrmFornecimento.btnBuscarClick(Sender: TObject);
begin
 GeraListaCards('');
end;

procedure TfrmFornecimento.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmFornecimento.btnConfirmarClick(Sender: TObject);
begin
 vBtnBuscar:=0;
 if vIdLote.Length=0 then
 begin
   ShowMessage('Selecione o Lote!');
   Exit;
 end;
 if lblDieta.Text='Selecione a Dieta' then
 begin
   ShowMessage('Selecione a Dieta!');
   Exit;
 end;
 if cbxTrato.ItemIndex=-1 then
 begin
   ShowMessage('Selecione o Trato!');
   Exit;
 end;
 vListBoxIdex := ListaCardsLotes.ViewportPosition.X;
 dmdb.FORNECIMENTO_CONF.Edit;
 try
  dmdb.FORNECIMENTO_CONFID_LOTE.AsString         := vIdLote;
  dmdb.FORNECIMENTO_CONFID_LOCAL.AsString        := vIdCurral;
  dmdb.FORNECIMENTO_CONFQTD_CAB.AsString         := vQdtCab;
  dmdb.FORNECIMENTO_CONFMEDIA_PESO.AsString      := vMediaPeso;
  dmdb.FORNECIMENTO_CONFDATA_FORN.AsDateTime     := edtdata.Date;
  dmdb.FORNECIMENTO_CONFID_RACAO.AsString        := vIdRacao;
  dmdb.FORNECIMENTO_CONFMS_RACAO.AsString        := vMSRacao;
  dmdb.FORNECIMENTO_CONFHORA_FORN.AsDateTime     := now;
  dmdb.FORNECIMENTO_CONFPREVISTO_MN_KG.AsString  := edtPrevisto.Text;
  dmdb.FORNECIMENTO_CONFREALIZADO_MN_KG.AsString := edtRealizado.Text;
  dmdb.FORNECIMENTO_CONFTRATO.AsString           := cbxTrato.Selected.Text;
  dmdb.FORNECIMENTO_CONFID_MOTORISTA.AsString    := dmdb.vIdUser;
  dmdb.FORNECIMENTO_CONFID_USUARIO.AsString      := dmdb.vIdUser;
  dmdb.FORNECIMENTO_CONFVALOR_KG_RACAO.AsInteger := 0;
  dmdb.FORNECIMENTO_CONFSYNC.AsInteger           := 0;
  dmdb.FORNECIMENTO_CONF.ApplyUpdates(-1);
  GeraListaCardLotes('');
  if vIndexLote<ListaCardsLotes.Items.Count then
  begin
   try
    ListaCardsLotes.ItemIndex  := vIndexLote + 1;
   except
    on E : Exception do
     ShowMessage('Fim da Listas');
   end;
  end;
  edtPrevisto.Text  :='';
  edtRealizado.Text :='0';
 except
   on E : Exception do
    ShowMessage('Erro ao Confirmar Registro : '+E.Message);
 end;
end;

procedure TfrmFornecimento.btnExcluiItemClick(Sender: TObject);
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
       dmDB.DeletaGenerico(vIdFornecimento,'FORNECIMENTO_CONF');
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

procedure TfrmFornecimento.btnLeituraClick(Sender: TObject);
begin
  vListBoxIdex :=0;
  tbPrincipal.ActiveTab := tbiCad;
end;

procedure TfrmFornecimento.btnLeituraMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmFornecimento.btnLeituraMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 1;
end;

procedure TfrmFornecimento.cbxNotaClick(Sender: TObject);
begin
  vFiltroRacao:=0;
  c.ShowMenu;
end;

procedure TfrmFornecimento.DestroiFrames;
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
procedure TfrmFornecimento.DisplayRationale(Sender: TObject;
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
procedure TfrmFornecimento.edtdataClosePicker(Sender: TObject);
begin
  GeraListaCardLotes('');
end;

procedure TfrmFornecimento.edtFiltraRacaoClick(Sender: TObject);
begin
 c.ShowMenu;
 vFiltroRacao:=1;
end;

procedure TfrmFornecimento.edtRealizadoClick(Sender: TObject);
begin
 if Not Assigned(frmTeclado) then
   Application.CreateForm(TfrmTeclado,frmTeclado);
  frmTeclado.lbl_valorPrev.Text := edtPrevisto.Text;
  frmTeclado.lbl_valor.Text     := edtRealizado.Text;
  frmTeclado.ShowModal(procedure(ModalResult: TModalResult)
  begin
    edtRealizado.Text := frmTeclado.vValorFim;
  end);
end;

end.

