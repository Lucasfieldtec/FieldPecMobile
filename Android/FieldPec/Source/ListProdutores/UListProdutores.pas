unit UListProdutores;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Objects, FMX.Controls.Presentation,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UFrameProdutores;

type
  TfrmListProdutores = class(TForm)
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
    edtNomeF: TEdit;
    ClearEditButton2: TClearEditButton;
    SearchEditButton1: TSearchEditButton;
    Lsbrl: TLayout;
    lblLista: TLabel;
    btnCloseAll: TImage;
    Layout3: TLayout;
    lblTotalRegistro: TLabel;
    StyleBook1: TStyleBook;
    Layout10: TLayout;
    btnBuscar: TRectangle;
    Layout11: TLayout;
    Label3: TLabel;
    Image1: TImage;
    procedure btnSelecionarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnSelecionarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    FFrame     : TFrameProdutores;
    vIdProdutor,vFiltro : string;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure GeraListaCards(vFiltro:string);
    procedure DestroiFrames;
    procedure ItemClick(Sender: TObject);
end;

var
  frmListProdutores: TfrmListProdutores;

implementation

{$R *.fmx}

uses UDmDB;

procedure TfrmListProdutores.FormShow(Sender: TObject);
begin
  GeraListaCards('id_propriedade='+dmdb.vIdPropriedade);
end;

procedure TfrmListProdutores.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmListProdutores.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmListProdutores.GeraListaCards(vFiltro: string);
var
  item: TListBoxItem;
begin
   if ListaCards=nil then
    FreeAndNil(ListaCards);
   DestroiFrames;
   ListaCards        := TListBox.Create(self);
   ListaCards.Parent := layListCards;
   ListaCards.Align  := TAlignLayout.Client;

   dmDB.PRODUTORES.Filtered := false;
   dmDB.PRODUTORES.Close;
   dmDB.PRODUTORES.Open;
   if vFiltro.Length>0 then
   begin
    dmDB.PRODUTORES.Filter := vFiltro;
    dmDB.PRODUTORES.Filtered := true;
   end;
   dmDB.PRODUTORES.First;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     while not dmDB.PRODUTORES.eof do
     begin
      ListaCards.BeginUpdate;
      item := TListBoxItem.Create(self);
      FFrame := TFrameProdutores.Create(self);
      FFrame.Name:= 'Item_'+dmDB.PRODUTORESID.AsString;

      FFrame.Parent          := item;
      FFrame.Align           := TAlignLayout.Client;
      FFrame.HitTest         := false;
      FFrame.Opacity         := 1;

      item.HitTest           := true;
      item.Height            := 120;
      item.Margins.Left      := 10;
      item.Margins.Right     := 10;
      item.Margins.Top       := 10;
      item.Margins.Bottom    := 10;
      item.TagString         := dmDB.PRODUTORESId.AsString;
      item.OnClick           := ItemClick;
      item.OnMouseDown       := FrameMouseDown;
      item.OnMouseUp         := FrameMouseUp;
      item.TagString         := dmDB.PRODUTORESId.AsString;

      FFrame.lblPRODUTORES.Text      := dmDB.PRODUTORESNOME.AsString;
      FFrame.lblPRODUTORES.TagString := dmDB.PRODUTORESId.AsString;
      FFrame.lblCpfCnpj.Text         := dmDB.PRODUTORESCPF_CNPJ.AsString;
      item.Parent                    := ListaCards;
      ListaCards.EndUpdate;
      dmDB.PRODUTORES.Next;
     end;
     lblTotalRegistro.Text := intToStr(ListaCards.Items.Count);
    end);
   end).Start;
end;

procedure TfrmListProdutores.ItemClick(Sender: TObject);
begin
 vIdProdutor          := TListBoxItem(sender).TagString;
 TListBoxItem(sender).IsSelected := true;
end;

procedure TfrmListProdutores.SearchEditButton1Click(Sender: TObject);
begin
   GeraListaCards('id_propriedade='+dmdb.vIdPropriedade +
    ' and nome like '+QuotedStr('%'+edtNomeF.Text+'%'))
end;

procedure TfrmListProdutores.btnCloseAllClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListProdutores.btnSelecionarClick(Sender: TObject);
begin
   ShowMessage('Produtor Selecionado :'+vIdProdutor);
end;

procedure TfrmListProdutores.btnSelecionarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmListProdutores.btnSelecionarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 1;
end;


procedure TfrmListProdutores.DestroiFrames;
var
  i : Integer;
begin
  for i := ComponentCount - 1 downto 0 do
  begin
   If (Components[i] is TFrame) then
     TFrame(Components[i]).Destroy;
  end;
end;

end.
