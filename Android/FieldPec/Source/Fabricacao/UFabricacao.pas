unit UFabricacao;

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
    ,Soap.EncdDecd,UFrameLimpaBebedouro, FMX.Memo.Types,uCbxFabricacao,
    UFrameFabricacao,UFrameListaInsumos,System.Math, UTeclado;

type
  TfrmFabricacao = class(TForm)
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
    edtRacaoF: TEdit;
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
    Layout25: TLayout;
    Label9: TLabel;
    Image5: TImage;
    Layout23: TLayout;
    btnConfirmar: TRectangle;
    Layout24: TLayout;
    Label8: TLabel;
    Image3: TImage;
    layDadosRacao: TLayout;
    Layout19: TLayout;
    Label6: TLabel;
    Layout14: TLayout;
    Rectangle6: TRectangle;
    edtRacao: TEdit;
    ClearEditButton1: TClearEditButton;
    layBtnLista: TLayout;
    btnHabilitaSync: TRectangle;
    Image16: TImage;
    Label32: TLabel;
    btnExcluiItem: TRectangle;
    Image6: TImage;
    lblExcluir: TLabel;
    LocationSensor1: TLocationSensor;
    GestureManager1: TGestureManager;
    Layout13: TLayout;
    Layout15: TLayout;
    Label5: TLabel;
    Rectangle9: TRectangle;
    edtKgPrevisto: TEdit;
    ClearEditButton3: TClearEditButton;
    Layout21: TLayout;
    Layout22: TLayout;
    Label10: TLabel;
    Rectangle7: TRectangle;
    edtOperadorPa: TEdit;
    ClearEditButton4: TClearEditButton;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    tbiFab: TTabItem;
    Rectangle14: TRectangle;
    Layout18: TLayout;
    Layout20: TLayout;
    Rectangle15: TRectangle;
    Layout26: TLayout;
    Layout31: TLayout;
    Layout32: TLayout;
    Rectangle17: TRectangle;
    Layout40: TLayout;
    Label16: TLabel;
    Image7: TImage;
    Layout33: TLayout;
    Ração: TLabel;
    lblRacaoFabricando: TLabel;
    Layout34: TLayout;
    Rectangle18: TRectangle;
    Layout35: TLayout;
    Layout36: TLayout;
    Label13: TLabel;
    Label15: TLabel;
    Layout37: TLayout;
    Rectangle19: TRectangle;
    edtPrevisto: TEdit;
    Rectangle20: TRectangle;
    edtRealizado: TEdit;
    Rectangle10: TRectangle;
    LayListaInsumos: TLayout;
    Layout28: TLayout;
    btnFinalizaFabricacao: TRectangle;
    Layout29: TLayout;
    Label7: TLabel;
    Image2: TImage;
    layEditaRealizado: TLayout;
    Rectangle16: TRectangle;
    Layout27: TLayout;
    Layout30: TLayout;
    Layout38: TLayout;
    Label11: TLabel;
    Rectangle21: TRectangle;
    edtRealizadoInsumo: TEdit;
    btnSalvar: TRectangle;
    Layout39: TLayout;
    Label12: TLabel;
    Image8: TImage;
    ListaInsumos: TListView;
    Layout41: TLayout;
    Image9: TImage;
    Layout42: TLayout;
    Layout43: TLayout;
    Label14: TLabel;
    Rectangle22: TRectangle;
    edtPrevistoInsumo: TEdit;
    Rectangle23: TRectangle;
    procedure btnNovoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnNovoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnCloseAllClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnExcluiItemClick(Sender: TObject);
    procedure edtOperadorPaClick(Sender: TObject);
    procedure edtRacaoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure ListaInsumosItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure btnSalvarClick(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure btnFinalizaFabricacaoClick(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure edtRealizadoInsumoClick(Sender: TObject);
  private
    c : TCustomCombo;
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
    FFrame       : TFrameFabricacao;
    FFrameInsumo : TFrameListaInsumos;
    vListBoxIdex:single;
    vFlagSync,vIdRacao,vMsRacao,vIdFabricacao,vIdOperador,
    vIDInsumo,vRealizadoInsumo,vRealizadoSender : string;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure GeraListaCards(vFiltro:string);
    procedure GeraListaInsumos(vFiltro:string);
    procedure DestroiFrames;
    procedure ItemClick(Sender: TObject);
    procedure ItemInsumoClick(Sender: TObject);
    procedure FrameGesture(Sender: TObject;
     const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure GeraComboRacao;
    {$IFDEF ANDROID}
     procedure ItemRacaoClick(Sender: TObject; const Point: TPointF);
     procedure ItemOperadorClick(Sender: TObject; const Point: TPointF);
    {$ENDIF}
    {$IFDEF MSWINDOWS}
     procedure ItemRacaoClick(Sender: TObject);
     procedure ItemOperadorClick(Sender: TObject);
    {$ENDIF}

    procedure GeraComboOperador;
    procedure btnEditar(Sender: TObject);
    procedure edtRealizadoExit(Sender: TObject);
    procedure BtnInsumosClick(Sender: TObject);

end;

var
  frmFabricacao: TfrmFabricacao;

implementation

{$R *.fmx}

uses UDmDB, UListBebedouro, UNewCam, UPrincipal;

procedure TfrmFabricacao.FormShow(Sender: TObject);
begin
 layEditaRealizado.Visible := false;
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

procedure TfrmFabricacao.FrameGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  layBtnLista.Visible := true;
end;

procedure TfrmFabricacao.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmFabricacao.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmFabricacao.GeraComboRacao;
begin
  c := TCustomCombo.Create(frmFabricacao);
  c.TitleMenuText := 'Escolha uma Racao';
  c.SubTitleMenuText := '';
  c.BackgroundColor := $FFF2F2F8;
  c.OnClick := ItemRacaoClick;
  dmDB.RACAO.Close;
  dmDB.RACAO.Open;
  dmDB.RACAO.First;
  while not dmDB.RACAO.Eof do
  begin
    c.AddItem(
     dmDB.RACAOID.AsString,
     dmDB.RACAOMATERIASECA.AsString,
     dmDB.RACAONOME.AsString
    );
    dmDB.RACAO.Next;
  end;
end;

procedure TfrmFabricacao.GeraComboOperador;
begin
  c := TCustomCombo.Create(frmFabricacao);
  c.TitleMenuText := 'Escolha um Operador';
  c.SubTitleMenuText := '';
  c.BackgroundColor := $FFF2F2F8;
  c.OnClick := ItemOperadorClick;
  dmDB.users.Close;
  dmDB.users.Open;
  dmDB.users.First;
  while not dmDB.users.Eof do
  begin
    c.AddItem(
     dmDB.usersID.AsString,
     '',
     dmDB.usersNAME.AsString
    );
    dmDB.users.Next;
  end;
end;


procedure TfrmFabricacao.GeraListaCards(vFiltro: string);
var
  item: TListBoxItem;
begin
   if ListaCards=nil then
    FreeAndNil(ListaCards);
   DestroiFrames;
   ListaCards        := TListBox.Create(self);
   ListaCards.Parent := layListCards;
   ListaCards.Align  := TAlignLayout.Client;
   dmDB.AbreFabricacao(vFiltro);
   dmDB.FABRICACAO.First;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     while not dmDB.FABRICACAO.eof do
     begin
      ListaCards.BeginUpdate;
      item := TListBoxItem.Create(self);
      FFrame := TFrameFabricacao.Create(self);
      FFrame.Name:= 'Item_'+dmDB.FABRICACAOID.AsString;
      FFrame.Parent          := item;
      FFrame.Align           := TAlignLayout.Client;
      FFrame.HitTest         := false;
      FFrame.Opacity         := 1;
      FFrame.Tag             := dmDB.FABRICACAOID.AsInteger;
      FFrame.TagString       := dmDB.FABRICACAORACAO.AsString+'*'+
       dmDB.FABRICACAOKG_PREVISTO.AsString;
      FFrame.TagFloat        := dmDB.FABRICACAOSYNC.AsFloat;

      item.HitTest               := true;
      item.Height                := 230;
      item.Margins.Left          := 10;
      item.Margins.Right         := 10;
      item.Margins.Top           := 10;
      item.Margins.Bottom        := 10;
      item.TagString             := dmDB.FABRICACAOID.AsString;
      item.OnClick               := ItemClick;
      item.OnMouseDown           := FrameMouseDown;
      item.OnMouseUp             := FrameMouseUp;
      item.Touch.GestureManager  := GestureManager1;
      item.Touch.InteractiveGestures := [TInteractiveGesture.LongTap];
      item.OnGesture             := FrameGesture;
      item.Tag                   := dmDB.FABRICACAOID.AsInteger;
      item.TagFloat              := dmDB.FABRICACAOSYNC.AsFloat;

      FFrame.lblRacao.Text          := dmDB.FABRICACAORACAO.AsString;
      FFrame.lblData.TagString      := dmDB.FABRICACAODATA_FAB.AsString;
      FFrame.lblPrevisto.Text       := dmDB.FABRICACAOKG_PREVISTO.AsString;
      FFrame.lblRealizado.Text      := dmDB.FABRICACAOKG_REALIZADO.AsString;
      FFrame.btnInsumos.OnClick     := BtnInsumosClick;
      if dmDB.FABRICACAOSTATUS.AsInteger=1 then
      begin
       FFrame.lblStatus.text         :='Aberta';
       FFrame.recStatus.Fill.Color   := TAlphaColorRec.Yellow;
      end;
      if dmDB.FABRICACAOSTATUS.AsInteger=2 then
      begin
       FFrame.lblStatus.text         :='Finalizada';
       FFrame.recStatus.Fill.Color   := TAlphaColorRec.Green;
      end;

      if dmDB.FABRICACAOSYNC.AsInteger=0 then
      begin
        FFrame.imgSyncYes.visible := false;
        FFrame.imgSyncNo.visible  := true;
        FFrame.lblSync.Text       := 'Sincronização Pendente';
      end;
      if dmDB.FABRICACAOSYNC.AsInteger=1 then
      begin
        FFrame.imgSyncYes.visible := true;
        FFrame.imgSyncNo.visible  := false;
        FFrame.lblSync.Text       := 'Sincronizado';
      end;
      item.Parent                 := ListaCards;
      ListaCards.EndUpdate;
      dmDB.FABRICACAO.Next;
     end;
     lblTotalRegistro.Text := intToStr(ListaCards.Items.Count);
    end);
   end).Start;
end;

procedure TfrmFabricacao.GeraListaInsumos(vFiltro: string);
var
  item   : TListViewItem;
  txt    : TListItemText;
  txtH   : TListItemPurpose;
  img    : TListItemImage;
  vRealizado,vPrevisto:Double;
begin
   dmDB.AbreFabricacaoInusmo('and b.ID_FABRICACAO='+vIdFabricacao);
   dmDB.FABRICACAO_INSUMOS.First;
   vRealizado:=0;
   vPrevisto :=0;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     ListaInsumos.Items.Clear;
     while not dmDB.FABRICACAO_INSUMOS.eof do
     begin
       vRealizado := vRealizado + dmDB.FABRICACAO_INSUMOSKG_FABRICADO.AsFloat;
       vPrevisto  := vPrevisto  + dmDB.FABRICACAO_INSUMOSKG_PREVISTO.AsFloat;
       item := ListaInsumos.Items.Add;
       with frmFabricacao do
       begin
         with item  do
         begin
           txt           := TListItemText(Objects.FindDrawable('Text7'));
           txt.Text      := 'Editar';

           txt           := TListItemText(Objects.FindDrawable('Text3'));
           txt.Text      := dmDB.FABRICACAO_INSUMOSInsumo.AsString;
           txt.TagString := dmDB.FABRICACAO_INSUMOSID.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text9'));
           txt.Text := 'Previsto:';
           txt      := TListItemText(Objects.FindDrawable('Text4'));
           txt.Text := dmDB.FABRICACAO_INSUMOSKG_PREVISTO.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text5'));
           txt.Text := 'Realizado:';
           txt      := TListItemText(Objects.FindDrawable('Text6'));
           txt.Text := dmDB.FABRICACAO_INSUMOSKG_FABRICADO.AsString;
           txt.TagString := dmDB.FABRICACAO_INSUMOSKG_FABRICADO.AsString;

           img := TListItemImage(Objects.FindDrawable('Image14'));
           img.Bitmap     := frmPrincipal.imgEdit.Bitmap;
         end;
       end;
       dmDB.FABRICACAO_INSUMOS.Next;
     end;
     edtRealizado.Text := floatToStr(vRealizado);
//     edtPrevisto.Text  := IntToStr(Floor(vPrevisto));
    end);
   end).Start;
end;

procedure TfrmFabricacao.Image5Click(Sender: TObject);
begin
 tbPrincipal.ActiveTab := tbilista;
end;

procedure TfrmFabricacao.Image7Click(Sender: TObject);
begin
 tbPrincipal.ActiveTab := tbilista;
end;

procedure TfrmFabricacao.Image9Click(Sender: TObject);
begin
  layEditaRealizado.Visible := false;
end;

procedure TfrmFabricacao.ItemClick(Sender: TObject);
begin
 vIdFabricacao       := intToStr(TListBoxItem(sender).Tag);
 vFlagSync           := FloatToStr(TListBoxItem(sender).TagFloat);
 TListBoxItem(sender).IsSelected := true;
end;

procedure TfrmFabricacao.ItemInsumoClick(Sender: TObject);
begin
 vIDInsumo          := TListBoxItem(sender).TagString;
 TListBoxItem(sender).IsSelected := true;
end;
{$IFDEF ANDROID}
procedure TfrmFabricacao.ItemRacaoClick(Sender: TObject; const Point: TPointF);
begin
 c.HideMenu;
 edtRacao.Text     := c.NomeItem;
 vIdRacao          := c.CodItem;
 vMsRacao          := c.DescricaoItem;
end;
procedure TfrmFabricacao.ItemOperadorClick(Sender: TObject;
  const Point: TPointF);
begin
 c.HideMenu;
 edtOperadorPa.Text     := c.NomeItem;
 vIdOperador            := c.CodItem;
end;
{$ENDIF}
{$IFDEF MSWINDOWS}
procedure TfrmFabricacao.ItemRacaoClick(Sender: TObject);
begin
 c.HideMenu;
 edtRacao.Text     := c.NomeItem;
 vIdRacao          := c.CodItem;
 vMsRacao          := c.DescricaoItem;
end;
procedure TfrmFabricacao.ItemOperadorClick(Sender: TObject);
begin
 c.HideMenu;
 edtOperadorPa.Text     := c.NomeItem;
 vIdOperador            := c.CodItem;
end;
{$ENDIF}

procedure TfrmFabricacao.ListaInsumosItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
var
 vPrevistoInsumo:string;
begin
  vPrevistoInsumo := TAppearanceListViewItem(ListaInsumos.Selected).Objects.FindObjectT<TListItemText>
   ('Text4').Text;
  vIDInsumo :=
   TAppearanceListViewItem(ListaInsumos.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').TagString;
  vRealizadoSender :=
   TAppearanceListViewItem(ListaInsumos.Selected).Objects.FindObjectT<TListItemText>
   ('Text6').TagString;
  if ItemObject is TListItemImage then
  begin
    if TListItemImage(ItemObject).Name='Image14'  then
    begin
     if vFlagSync='1' then
     begin
      ShowMessage('Batida ja Sincronizada!');
      Exit;
     end
     else
     begin
      edtPrevistoInsumo.Text    := vPrevistoInsumo;
      edtRealizadoInsumo.Text   := vRealizadoSender;
      layEditaRealizado.Visible := true;
     end;
    end;
  end;
end;
{$IFDEF ANDROID}
procedure TfrmFabricacao.LocationPermissionRequestResult(Sender: TObject;
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
procedure TfrmFabricacao.btnBuscarClick(Sender: TObject);
var
 vFiltro:string;
begin
 vFiltro :=' and DATA_FAB='+FormatDateTime('yyyy-mm-dd',edtdataf.Date).QuotedString;
 if edtRacaoF.Text.Length>0 then
  vFiltro := vFiltro+' and b.nome like '+QuotedStr('%'+edtRacaoF.Text+'%');
 GeraListaCards(vFiltro);
end;

procedure TfrmFabricacao.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmFabricacao.btnConfirmarClick(Sender: TObject);
begin
  if edtRacao.Text='Seleciona a Ração' then
  begin
    ShowMessage('Informe a Ração!!');
    Exit;
  end;
  if(edtKgPrevisto.Text='Previsto(kg)')or(edtKgPrevisto.Text='')  then
  begin
    ShowMessage('Informe o Previsto!!');
    Exit;
  end;
  if edtOperadorPa.Text='Seleciona o Operador' then
  begin
    ShowMessage('Informe o Operador!!');
    Exit;
  end;
  vIdFabricacao                          := intToStr(dmdb.RetornaIdFabricacao);
  dmdb.FabricacaoID.AsInteger            := StrToInt(vIdFabricacao);
  dmdb.FabricacaoIDRACAO.AsString        := vIdRacao;
  dmdb.FabricacaoDATA_FAB.AsDateTime     := NOW;
  dmdb.FabricacaoKG_PREVISTO.AsInteger   := strToInt(edtKgPrevisto.Text);
  dmdb.FabricacaoKG_REALIZADO.AsFloat    := 0;
  dmdb.FabricacaoCUSTO_TOTAL.AsInteger   := 0;
  dmdb.FabricacaoID_USUARIO.AsString     := dmdb.vIdUser;
  dmdb.FabricacaoID_OPERADOR.AsString    := vIdOperador;
  dmdb.FabricacaoID_PROPRIEDADE.AsString := dmdb.vIdPropriedade;
 try
  dmdb.Fabricacao.ApplyUpdates(-1);
  dmdb.InsereFabricacaoAlimentos(vIdFabricacao,vIdRacao,StringReplace(edtKgPrevisto.Text,',','.',[rfReplaceAll]));
  GeraListaInsumos(' and ID_FABRICACAO='+vIdFabricacao);
  lblRacaoFabricando.text := edtRacao.text;
  edtPrevisto.text        := edtKgPrevisto.text;
  edtRealizado.text       :='0';
  tbPrincipal.ActiveTab   := tbiFab;
 except

 end;
end;

procedure TfrmFabricacao.btnEditar(Sender: TObject);
begin
 vIDInsumo := TRectangle(Sender).TagString;
 edtRealizadoInsumo.Text := intToStr(TRectangle(Sender).tag);
 layEditaRealizado.Visible := true;
end;

procedure TfrmFabricacao.btnExcluiItemClick(Sender: TObject);
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
       dmDB.DeletaGenerico(vIdFabricacao,'FABRICACAO');
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

procedure TfrmFabricacao.btnFinalizaFabricacaoClick(Sender: TObject);
begin
 if vFlagSync='1' then
 begin
  ShowMessage('Batida ja Sincronizada!');
  Exit;
 end;
 MessageDlg('Deseja Realmente Finalizar esse Fabricação?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes,
   System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
    case AResult of
     mrYES:
     begin
       dmdb.FinalizaBatida(vIdFabricacao);
       btnBuscarClick(Sender);
       tbPrincipal.ActiveTab := tbilista;
     end;
     mrNo:
    end;
   end);
end;

procedure TfrmFabricacao.BtnInsumosClick(Sender: TObject);
var
 vRacao,
 vPrevito: string;
begin
  vIdFabricacao := intToStr(TRectangle(sender).Parent.Tag);
  vRacao        := copy(TRectangle(sender).Parent.TagString,0,
   pos('*',TRectangle(sender).Parent.TagString)-1);
  vPrevito      := copy(TRectangle(sender).Parent.TagString,
   (pos('*',TRectangle(sender).Parent.TagString)+1),
   TRectangle(sender).Parent.TagString.Length);
  vFlagSync     := FloatToStr(TRectangle(sender).Parent.TagFloat);
  GeraListaInsumos(' and ID_FABRICACAO='+vIdFabricacao);
  edtPrevisto.Text        := vPrevito;
  lblRacaoFabricando.text := vRacao;
  tbPrincipal.ActiveTab   := tbiFab;
end;

procedure TfrmFabricacao.btnNovoClick(Sender: TObject);
begin
  edtRacao.Text      :='';
  edtOperadorPa.Text :='';
  edtKgPrevisto.Text :='';
  dmdb.FABRICACAO.Close;
  dmdb.FABRICACAO.Open;
  dmdb.FABRICACAO.Insert;
  tbPrincipal.ActiveTab := tbiCad;
end;

procedure TfrmFabricacao.btnNovoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmFabricacao.btnNovoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  TRectangle(sender).Opacity := 1;
end;
procedure TfrmFabricacao.btnSalvarClick(Sender: TObject);
begin
 dmdb.AtualizaRealizadoIsnumo(vIDInsumo,edtRealizadoInsumo.Text);
 GeraListaInsumos(' and ID_FABRICACAO='+vIdFabricacao);
 layEditaRealizado.Visible := false;
end;

procedure TfrmFabricacao.DestroiFrames;
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
procedure TfrmFabricacao.DisplayRationale(Sender: TObject;
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
procedure TfrmFabricacao.edtOperadorPaClick(Sender: TObject);
begin
 GeraComboOperador;
 c.ShowMenu;
end;

procedure TfrmFabricacao.edtRacaoClick(Sender: TObject);
begin
  GeraComboRacao;
  c.ShowMenu;
end;

procedure TfrmFabricacao.edtRealizadoExit(Sender: TObject);
begin
  vIDInsumo        :=TEdit(sender).TagString;
  vRealizadoSender :=TEdit(sender).Text;
end;

procedure TfrmFabricacao.edtRealizadoInsumoClick(Sender: TObject);
begin
 if Not Assigned(frmTeclado) then
   Application.CreateForm(TfrmTeclado,frmTeclado);
  frmTeclado.lbl_valorPrev.Text := edtPrevistoInsumo.Text;
  frmTeclado.lbl_valor.Text     := edtRealizadoInsumo.Text;
  frmTeclado.ShowModal(procedure(ModalResult: TModalResult)
  begin
    edtRealizadoInsumo.Text := frmTeclado.vValorFim;
  end);
end;

end.

