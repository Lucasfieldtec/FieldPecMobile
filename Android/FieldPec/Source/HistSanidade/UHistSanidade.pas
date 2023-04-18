unit UHistSanidade;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.StdCtrls, FMX.Edit, FMX.Objects, FMX.Controls.Presentation,
  FMX.Layouts, UDmDB, UListProdutores, FMX.TabControl, FMX.ListBox, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.ScrollBox;

type
  TfrmHistSanidade = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Rectangle1: TRectangle;
    layPrincipal: TLayout;
    RecLista: TRectangle;
    layListCards: TLayout;
    Layout9: TLayout;
    btnSelecionar: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image4: TImage;
    Lista: TListView;
    Layout1: TLayout;
    Rectangle3: TRectangle;
    Layout2: TLayout;
    Layout4: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Label2: TLabel;
    Label1: TLabel;
    Rectangle2: TRectangle;
    edtLocal: TEdit;
    ClearEditButton1: TClearEditButton;
    Layout11: TLayout;
    btnLerQr: TRectangle;
    Layout12: TLayout;
    Image2: TImage;
    Rectangle4: TRectangle;
    edtIdentificacao: TEdit;
    ClearEditButton2: TClearEditButton;
    Layout5: TLayout;
    Rectangle6: TRectangle;
    rdChip: TRadioButton;
    RdManejo: TRadioButton;
    rdSisbov: TRadioButton;
    Layout8: TLayout;
    btnBuscar: TRectangle;
    Layout10: TLayout;
    Label3: TLabel;
    Image1: TImage;
    Lsbrl: TLayout;
    lblLista: TLabel;
    btnCloseAll: TImage;
    Layout3: TLayout;
    lblTotalRegistro: TLabel;
    Layout13: TLayout;
    btnAplicar: TRectangle;
    Layout14: TLayout;
    Label5: TLabel;
    Image3: TImage;
    Rectangle5: TRectangle;
    Layout15: TLayout;
    Layout19: TLayout;
    Rectangle9: TRectangle;
    Layout20: TLayout;
    Label7: TLabel;
    Image6: TImage;
    Layout21: TLayout;
    Rectangle10: TRectangle;
    Layout22: TLayout;
    Layout23: TLayout;
    Layout24: TLayout;
    Layout25: TLayout;
    Label8: TLabel;
    Label9: TLabel;
    Rectangle11: TRectangle;
    Edit1: TEdit;
    ClearEditButton3: TClearEditButton;
    Rectangle13: TRectangle;
    edtFarmacoProtocolo: TEdit;
    ClearEditButton4: TClearEditButton;
    Layout28: TLayout;
    Rectangle14: TRectangle;
    rdProtocolo: TRadioButton;
    rdMedicamento: TRadioButton;
    Layout31: TLayout;
    Label11: TLabel;
    Image9: TImage;
    Layout32: TLayout;
    Label12: TLabel;
    StyleBook1: TStyleBook;
    layDadosFarmaco: TLayout;
    Layout16: TLayout;
    Label6: TLabel;
    Rectangle7: TRectangle;
    cbxTipo: TComboBox;
    Layout17: TLayout;
    Label10: TLabel;
    Rectangle8: TRectangle;
    edtDoseFixa: TEdit;
    Layout18: TLayout;
    Label13: TLabel;
    Rectangle12: TRectangle;
    edtDosePeso: TEdit;
    Rectangle15: TRectangle;
    edtKgMl: TEdit;
    Label14: TLabel;
    Rectangle16: TRectangle;
    layDadosProtocolo: TLayout;
    Rectangle17: TRectangle;
    GridFarmacos: TStringGrid;
    StringColumn1: TStringColumn;
    FloatColumn1: TFloatColumn;
    StringColumn2: TStringColumn;
    Column1: TColumn;
    StringColumn3: TStringColumn;
    Column2: TColumn;
    Column3: TColumn;
    procedure btnLerQrClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure edtFarmacoProtocoloClick(Sender: TObject);
    procedure edtDoseFixaTyping(Sender: TObject);
    procedure Rectangle9Click(Sender: TObject);
  private
   vIDAnimal,vIdProtocolo:string;
   chkIdent:integer;
  public
    procedure GerarLista;
  end;

var
  frmHistSanidade: TfrmHistSanidade;

implementation
USES UPrincipal, UNewCam, UDMDashBoard, UFarmacos, uFormat, UProtocoloSanitario;

{$R *.fmx}

procedure TfrmHistSanidade.btnAplicarClick(Sender: TObject);
begin
 if rdSisbov.IsChecked then
  chkIdent:=0;

 if RdManejo.IsChecked then
  chkIdent:=1;

 if rdChip.IsChecked then
  chkIdent:=2;

 cbxTipo.ItemIndex :=-1;
 layDadosFarmaco.Visible   := false;
 layDadosProtocolo.Visible := false;
 edtFarmacoProtocolo.Text :='';
 edtDoseFixa.Text  :='0';
 edtDosePeso.Text  :='0';
 edtKgMl.Text      :='0';
 TabControl1.ActiveTab := TabItem2;
end;

procedure TfrmHistSanidade.btnBuscarClick(Sender: TObject);
begin
 if edtIdentificacao.Text.Length=0 then
 begin
   ShowMessage('Informe uma Identificação!');
   Exit;
 end;
 GerarLista;
end;

procedure TfrmHistSanidade.GerarLista;
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 URL,urlBomba,urlHorimetro,urlKM,vChekURL,vFiltro    : string;
 vLayout  : TLayout;
 FileSize : Int64;
begin
 if edtIdentificacao.Text.Length>0 then
 begin
   if rdSisbov.IsChecked then
    vFiltro:=vFiltro+' and identificacao_2='+edtIdentificacao.Text.QuotedString;
   if RdManejo.IsChecked then
    vFiltro:=vFiltro+' and SUBSTR(IDENTIFICACAO_2,9,6)='+edtIdentificacao.Text.QuotedString;
   if rdChip.IsChecked then
    vFiltro:=vFiltro+' and identificacao_1='+edtIdentificacao.Text.QuotedString;
 end;

 vIDAnimal := dmdb.RetornaIdAnimal(vFiltro);
 if vIDAnimal.Length<=0 then
 begin
   ShowMessage('Animal Não Encontrado!');
   btnAplicar.Enabled      := false;
   Lista.Items.Clear;
   Exit;
 end;
 btnAplicar.Enabled      := true;
 Lista.Items.Clear;
 dmdb.AbreSanidadeAnimal(vIDAnimal);
 if not dmDB.HIST_SANIDADE.IsEmpty then
 begin
     while not dmDB.HIST_SANIDADE.eof do
     begin
       item := Lista.Items.Add;
       with frmHistSanidade do
       begin
         with item  do
         begin
           txt      := TListItemText(Objects.FindDrawable('Text1'));
           txt.Text := dmDB.HIST_SANIDADEPRODUTO.AsString;
           txt.TagString := dmDB.HIST_SANIDADEid.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text3'));
           txt.Text := 'Dose(ML) : ';

           txt      := TListItemText(Objects.FindDrawable('Text2'));
           txt.Text := dmDB.HIST_SANIDADEDOSE_ML.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text4'));
           txt.Text := 'Data Aplicação : ';

           txt      := TListItemText(Objects.FindDrawable('Text5'));
           txt.Text := dmDB.HIST_SANIDADEDATA_APLICACAO.AsString;
         end;
        dmDB.HIST_SANIDADE.Next;
       end;
     end;
 end
 else
   ShowMessage('Animal não possui Histórico Sanitário!')
end;

procedure TfrmHistSanidade.Rectangle9Click(Sender: TObject);
var
  x,i: Integer;
begin
 if rdMedicamento.IsChecked then
 begin
   if edtDosePeso.Text.Length=0 then
    edtDosePeso.Text :='0';

   if edtKgMl.Text.Length=0 then
    edtKgMl.Text :='0';

   if edtDoseFixa.Text.Length=0 then
    edtDoseFixa.Text :='0';

   if edtFarmacoProtocolo.Text.Length=0 then
   begin
     ShowMessage('Informe o protocolo ou medicamento!');
     Exit;
   end;
   if cbxTipo.ItemIndex=-1 then
   begin
     ShowMessage('Informe o Tipo de Dosagem!');
     Exit;
   end;

   if cbxTipo.ItemIndex=0 then
   begin
     if (edtDoseFixa.Text.Length=0) or (edtDoseFixa.Text.ToDouble<=0) then
     begin
       ShowMessage('Informe a dose fixa!');
       Exit;
     end;
   end;

   if cbxTipo.ItemIndex=1 then
   begin
     if(edtDosePeso.Text.Length=0) or (edtDosePeso.Text.ToDouble<=0) then
     begin
       ShowMessage('Informe ml por peso!');
       Exit;
     end;

     if(edtKgMl.Text.Length=0) or (edtKgMl.Text.ToDouble<=0) then
     begin
       ShowMessage('Informe peso para cada dose!');
       Exit;
     end;

   end;
   try
      dmdb.AplicaTratamentoExtra(
      edtFarmacoProtocolo.TagString,
      edtFarmacoProtocolo.Text,
      vIDAnimal,
      FormatDateTime('yyyy-mm-dd',DATE),
      dmdb.vIdLocalAtual,
      cbxTipo.ItemIndex.ToString,
      edtDoseFixa.TagString,
      '0',
      strToFloat(edtDoseFixa.Text),
      strToFloat(edtDosePeso.Text),
      strToFloat(edtKgMl.Text)
      );
      ShowMessage('Sanidade aplicada com sucesso!');

      case chkIdent of
        0: rdSisbov.IsChecked := true;
        1: RdManejo.IsChecked := true;
        2: rdChip.IsChecked := true;
      end;
      GerarLista;
      TabControl1.ActiveTab := TabItem1;
   except
     on E : Exception do
      ShowMessage('Erro ao Confirmar Registro : '+E.Message);
   end;
 end
 else
 begin
   for x := 0 to GridFarmacos.RowCount-1 do
   begin
     if (GridFarmacos.Cells[1,x]='0') and (GridFarmacos.Cells[2,x]='0') then
     begin
      ShowMessage('Existe Farmaco com a dose zerada'+#13+'Corrija antes de aplicar!');
      Exit;
      Break;
     end;
   end;
   try
     for I := 0 to GridFarmacos.RowCount-1 do
     begin
        dmdb.AplicaTratamentoExtra(
        GridFarmacos.Cells[5,i],
        GridFarmacos.Cells[0,i],
        vIDAnimal,
        FormatDateTime('yyyy-mm-dd',DATE),
        dmdb.vIdLocalAtual,
        GridFarmacos.Cells[6,i],
        GridFarmacos.Cells[4,i],
        '0',
        GridFarmacos.Cells[1,i].ToDouble,
        GridFarmacos.Cells[2,i].ToDouble,
        GridFarmacos.Cells[3,i].ToDouble
        );
     end;
      ShowMessage('Sanidade aplicada com sucesso!');
      case chkIdent of
        0: rdSisbov.IsChecked := true;
        1: RdManejo.IsChecked := true;
        2: rdChip.IsChecked := true;
      end;
      GerarLista;
      TabControl1.ActiveTab := TabItem1;
   except
     on E : Exception do
      ShowMessage('Erro ao Confirmar Registro : '+E.Message);
   end;
 end;
end;

procedure TfrmHistSanidade.btnCloseAllClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHistSanidade.btnLerQrClick(Sender: TObject);
var
 vCod:string;
begin
 {$IFDEF Android}
  if Not Assigned(FrmCameraNew) then
   Application.CreateForm(TFrmCameraNew, FrmCameraNew);
  FrmCameraNew.ShowModal(procedure(ModalResult: TModalResult)
  begin
    vCod := FrmCameraNew.codigo;
    if vCod.Length>0 then
    begin
     if (vCod.Length=16) and (copy(vCod,0,1)='0') then
      edtIdentificacao.Text := copy(vCod,2,vCod.Length)
     else
      edtIdentificacao.Text := vCod;
//     GeraLista;
    end;
  end);
 {$ENDIF}
end;

procedure TfrmHistSanidade.edtDoseFixaTyping(Sender: TObject);
begin
  Formatar(edtDoseFixa, TFormato.Valor)
end;

procedure TfrmHistSanidade.edtFarmacoProtocoloClick(Sender: TObject);
var
 I: Integer;
begin
 if rdMedicamento.IsChecked then
 begin
   if Not Assigned(frmFarmacos) then
   Application.CreateForm(TfrmFarmacos,frmFarmacos);
   frmFarmacos.ShowModal(procedure(ModalResult: TModalResult)
   begin
     edtFarmacoProtocolo.TagString := frmFarmacos.vIdFarmaco;
     edtFarmacoProtocolo.Text      := frmFarmacos.vNomeFarmaco;
     cbxTipo.ItemIndex             := frmFarmacos.vTipoDose.ToInteger;
     edtDoseFixa.Text              := frmFarmacos.vMlFixa;
     edtDoseFixa.TagString         := frmFarmacos.vCarenciaDias;
     edtDosePeso.Text              := frmFarmacos.vMlPorPeso;
     edtKgMl.Text                  := frmFarmacos.vKgMl;
   end);
   layDadosFarmaco.Visible         := true;
   layDadosProtocolo.Visible       := false;
 end;
  if rdProtocolo.IsChecked then
  begin
   if Not Assigned(FrmProtocoloSanitario) then
   Application.CreateForm(TFrmProtocoloSanitario,FrmProtocoloSanitario);
   FrmProtocoloSanitario.ShowModal(procedure(ModalResult: TModalResult)
   begin
     if FrmProtocoloSanitario.vIdProtocolo.Length>0 then
     begin
      edtFarmacoProtocolo.TagString := FrmProtocoloSanitario.vIdProtocolo;
      edtFarmacoProtocolo.Text      := FrmProtocoloSanitario.vNomeProtocolo;
      GridFarmacos.RowCount         := dmdb.TableProtocoloFarmacos.RecordCount;
      dmdb.TableProtocoloFarmacos.First;
      I:=0;
      while not dmdb.TableProtocoloFarmacos.Eof do
      begin
        GridFarmacos.Cells[0,i]  := dmdb.TableProtocoloFarmacos.FieldByName('FARMACO').AsString;
        GridFarmacos.Cells[1,i]  := dmdb.TableProtocoloFarmacos.FieldByName('DOSE_FIXA_ML').AsString;
        GridFarmacos.Cells[2,i]  := dmdb.TableProtocoloFarmacos.FieldByName('DOSE_PESO_ML').AsString;
        GridFarmacos.Cells[3,i]  := dmdb.TableProtocoloFarmacos.FieldByName('DOSE_PESO_KG').AsString;
        GridFarmacos.Cells[4,i]  := dmdb.TableProtocoloFarmacos.FieldByName('CARENCIA_DIAS').AsString;
        GridFarmacos.Cells[5,i]  := dmdb.TableProtocoloFarmacos.FieldByName('ID_FARMACO').AsString;
        GridFarmacos.Cells[6,i]  := dmdb.TableProtocoloFarmacos.FieldByName('TIPO_DOSAGEM').AsString;
        inc(i);
        dmdb.TableProtocoloFarmacos.Next;
      end;
      layDadosFarmaco.Visible         := false;
      layDadosProtocolo.Visible       := true;
     end;
   end);
  end;
end;

procedure TfrmHistSanidade.FormShow(Sender: TObject);
begin
  TabControl1.TabPosition := TTabPosition.None;
  TabControl1.ActiveTab   := TabItem1;
  btnAplicar.Enabled      := false;
  Lista.Items.Clear;
  edtIdentificacao.Text :='';
end;

end.
