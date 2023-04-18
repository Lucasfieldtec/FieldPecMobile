unit UListAnimal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Objects, FMX.Controls.Presentation,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UFrameAnimal;

type
  TfrmListAnimal = class(TForm)
    Rectangle1: TRectangle;
    layPrincipal: TLayout;
    RecLista: TRectangle;
    layListCards: TLayout;
    Layout9: TLayout;
    btnSelecionar: TRectangle;
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
    edtIdentificacao: TEdit;
    ClearEditButton2: TClearEditButton;
    Lsbrl: TLayout;
    lblLista: TLabel;
    btnCloseAll: TImage;
    Layout3: TLayout;
    lblTotalRegistro: TLabel;
    StyleBook1: TStyleBook;
    Rectangle2: TRectangle;
    edtLocal: TEdit;
    ClearEditButton1: TClearEditButton;
    Label1: TLabel;
    Layout5: TLayout;
    Layout8: TLayout;
    btnBuscar: TRectangle;
    Layout10: TLayout;
    Label3: TLabel;
    Image1: TImage;
    Rectangle6: TRectangle;
    RdManejo: TRadioButton;
    rdSisbov: TRadioButton;
    rdChip: TRadioButton;
    Layout11: TLayout;
    btnLerQr: TRectangle;
    Layout12: TLayout;
    Image2: TImage;
    layBtnSelecionar: TLayout;
    Rectangle5: TRectangle;
    Layout14: TLayout;
    Label5: TLabel;
    Image3: TImage;
    procedure btnSelecionarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnSelecionarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure edtLocalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseAllClick(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure edtIdentificacaoKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnLerQrClick(Sender: TObject);
    procedure Rectangle5Click(Sender: TObject);
  private
    { Private declarations }
  public
    FFrame     : TFrameAnimal;
    vIdCurralF,vIdAnimal,vIddentificacao : string;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure GeraLista;
    procedure DestroiFrames;
    procedure ItemClick(Sender: TObject);
end;

var
  frmListAnimal: TfrmListAnimal;

implementation

{$R *.fmx}

uses UDmDB, UCurrais
{$IFDEF Android}
,UNewCam
{$ENDIF}
;
procedure TfrmListAnimal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if ListaCards=nil then
  FreeAndNil(ListaCards);
 DestroiFrames;
 edtIdentificacao.Text :='';
 edtLocal.Text :='';
end;

procedure TfrmListAnimal.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmListAnimal.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmListAnimal.GeraLista;
var
 item: TListBoxItem;
 vFiltro:string;
begin
 vFiltro:='';
 if edtIdentificacao.Text.Length=0 then
 begin
   ShowMessage('Informe a Identificação do Animal!');
   Exit;
 end;
 if edtIdentificacao.Text.Length>0 then
 begin
   if rdSisbov.IsChecked then
    vFiltro:=vFiltro+' and identificacao_2='+edtIdentificacao.Text.QuotedString;
   if RdManejo.IsChecked then
    vFiltro:=vFiltro+' and SUBSTR(IDENTIFICACAO_2,9,6)='+edtIdentificacao.Text.QuotedString;
   if rdChip.IsChecked then
    vFiltro:=vFiltro+' and identificacao_1='+edtIdentificacao.Text.QuotedString;
 end;
// if edtLocal.Text.Length>0 then
//  vFiltro:=vFiltro+' and ID_LOCAL='+vIdCurralF;
 dmdb.AbreBuscaAnimal(vFiltro);
 if dmdb.ANIMAIS.IsEmpty then
 begin
  layPrincipal.Visible := false;
  ShowMessage('Animal Não Encontrado');
  Exit;
 end;
 layPrincipal.Visible := true;
 if ListaCards=nil then
  FreeAndNil(ListaCards);
 DestroiFrames;
   ListaCards        := TListBox.Create(self);
   ListaCards.Parent := layListCards;
   ListaCards.Align  := TAlignLayout.Client;
   dmDB.ANIMAIS.First;
   TThread.CreateAnonymousThread(procedure
   begin
     while not dmDB.ANIMAIS.eof do
     begin
      ListaCards.BeginUpdate;
      item := TListBoxItem.Create(self);
      FFrame := TFrameAnimal.Create(self);
      FFrame.Name:= 'Item_'+dmDB.ANIMAISID.AsString;

      FFrame.Parent          := item;
      FFrame.Align           := TAlignLayout.Client;
      FFrame.HitTest         := false;
      FFrame.Opacity         := 1;

      item.HitTest           := true;
      item.Height            := layListCards.Height -10;
      item.Margins.Left      := 10;
      item.Margins.Right     := 10;
      item.Margins.Top       := 10;
      item.Margins.Bottom    := 10;
      item.TagString         := dmDB.ANIMAISId.AsString;
      item.OnClick           := ItemClick;
      item.OnMouseDown       := FrameMouseDown;
      item.OnMouseUp         := FrameMouseUp;
      item.TagString         := dmDB.ANIMAISId.AsString;

      FFrame.lblChip.Text         := dmDB.ANIMAISIDENTIFICACAO_1.AsString;
      FFrame.lblSISBOV.Text       := dmDB.ANIMAISIDENTIFICACAO_2.AsString;
      FFrame.lblLocalAtual.Text   := dmDB.ANIMAISCODIGO.AsString;
      FFrame.lblRaca.Text         := dmDB.ANIMAISRaca.AsString;
      FFrame.lblCategoria.Text    := dmDB.ANIMAISCategoria.AsString;
      FFrame.lblRebanho.Text      := dmDB.ANIMAISRebanho.AsString;
      FFrame.lblDataEnt.Text      := FormatDateTime('dd/mm/yyyy',dmDB.ANIMAISDATA_PROC.AsDateTime);
      FFrame.lblPesoEnt.Text      := dmDB.ANIMAISPESO_ENTRADA.AsString;
      FFrame.lblPesoEstimado.Text := dmDB.ANIMAISPESO_ESTIMADO.AsString;
      FFrame.lblProdutor.Text     := dmDB.ANIMAISPRODUTOR.AsString;
      FFrame.lblPropriedade.Text  := dmDB.ANIMAISPROPRIEDADE.AsString;

      item.Parent                 := ListaCards;

      ListaCards.EndUpdate;
      dmDB.ANIMAIS.Next;
     end;
     TThread.Synchronize(nil, procedure
     begin
      lblTotalRegistro.Text := intToStr(ListaCards.Items.Count);
     end);
   end).Start;
end;

procedure TfrmListAnimal.ItemClick(Sender: TObject);
begin
 vIddentificacao    := edtIdentificacao.Text;
 vIdAnimal          := TListBoxItem(sender).TagString;
 TListBoxItem(sender).IsSelected := true;
end;

procedure TfrmListAnimal.Rectangle5Click(Sender: TObject);
begin
 if vIdAnimal.Length=0 then
 begin
   ShowMessage('Selecione o animal!');
   Exit;
 end;
 Close;
end;

procedure TfrmListAnimal.SearchEditButton1Click(Sender: TObject);
begin
  GeraLista;
end;

procedure TfrmListAnimal.btnBuscarClick(Sender: TObject);
begin
 if edtIdentificacao.Text.Length=0 then
 begin
   ShowMessage('Informe uma Identificação!');
   Exit;
 end;
 GeraLista;
end;

procedure TfrmListAnimal.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmListAnimal.btnLerQrClick(Sender: TObject);
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
     GeraLista;
    end;
  end);
 {$ENDIF}
end;

procedure TfrmListAnimal.btnSelecionarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmListAnimal.btnSelecionarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 1;
end;


procedure TfrmListAnimal.DestroiFrames;
var
  i : Integer;
begin
  for i := ComponentCount - 1 downto 0 do
  begin
   If (Components[i] is TFrame) then
     TFrame(Components[i]).Destroy;
  end;
end;

procedure TfrmListAnimal.edtLocalClick(Sender: TObject);
begin
 if Not Assigned(frmListaCurrais) then
   Application.CreateForm(TfrmListaCurrais, frmListaCurrais);
  frmListaCurrais.ShowModal(procedure(ModalResult: TModalResult)
  begin
    edtLocal.Text := frmListaCurrais.vNomeCurral;
    vIdCurralF    := frmListaCurrais.vIdCurral;
  end);
end;

procedure TfrmListAnimal.edtIdentificacaoKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
 if key=13 then
   GeraLista;
end;

end.
