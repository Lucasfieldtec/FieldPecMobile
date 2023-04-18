unit UListCategoria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Objects, FMX.Controls.Presentation,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UFrameCategoria;

type
  TfrmListCategoria = class(TForm)
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
    V: TLayout;
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
    procedure SearchEditButton1Click(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    FFrame     : TFrameCategoria;
    vFiltro,vIdCategoria : string;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure GeraListaCards(vFiltro:string);
    procedure DestroiFrames;
    procedure ItemClick(Sender: TObject);
end;

var
  frmListCategoria: TfrmListCategoria;

implementation

{$R *.fmx}

uses UDmDB;

procedure TfrmListCategoria.FormShow(Sender: TObject);
begin
  GeraListaCards(vFiltro);
end;

procedure TfrmListCategoria.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmListCategoria.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmListCategoria.GeraListaCards(vFiltro: string);
var
  item: TListBoxItem;
begin
   if ListaCards=nil then
    FreeAndNil(ListaCards);
   DestroiFrames;
   ListaCards        := TListBox.Create(self);
   ListaCards.Parent := layListCards;
   ListaCards.Align  := TAlignLayout.Client;

   dmDB.CATEGORIAS.Filtered := false;
   dmDB.CATEGORIAS.Close;
   dmDB.CATEGORIAS.Open;
   if vFiltro.Length>0 then
   begin
    dmDB.CATEGORIAS.Filter := vFiltro;
    dmDB.CATEGORIAS.Filtered := true;
   end;
   dmDB.CATEGORIAS.First;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     while not dmDB.CATEGORIAS.eof do
     begin
      ListaCards.BeginUpdate;
      item := TListBoxItem.Create(self);
      FFrame := TFrameCategoria.Create(self);
      FFrame.Name:= 'Item_'+dmDB.CATEGORIASID.AsString;

      FFrame.Parent          := item;
      FFrame.Align           := TAlignLayout.Client;
      FFrame.HitTest         := false;
      FFrame.Opacity         := 1;

      item.HitTest           := true;
      item.Height            := 100;
      item.Margins.Left      := 10;
      item.Margins.Right     := 10;
      item.Margins.Top       := 10;
      item.Margins.Bottom    := 10;
      item.TagString         := dmDB.CATEGORIASId.AsString;
      item.OnClick           := ItemClick;
      item.OnMouseDown       := FrameMouseDown;
      item.OnMouseUp         := FrameMouseUp;
      item.TagString         := dmDB.CATEGORIASId.AsString;

      FFrame.lblCATEGORIA.Text      := dmDB.CATEGORIASNOME.AsString;
      FFrame.lblCATEGORIA.TagString := dmDB.CATEGORIASId.AsString;
      FFrame.lblCategoriaPadrao.Text:= dmDB.CATEGORIASCategoriaPadrao.AsString;
      item.Parent                      := ListaCards;
      ListaCards.EndUpdate;
      dmDB.CATEGORIAS.Next;
     end;
     lblTotalRegistro.Text := intToStr(ListaCards.Items.Count);
    end);
   end).Start;
end;

procedure TfrmListCategoria.ItemClick(Sender: TObject);
begin
 vIdCategoria          := TListBoxItem(sender).TagString;
 TListBoxItem(sender).IsSelected := true;
end;

procedure TfrmListCategoria.SearchEditButton1Click(Sender: TObject);
begin
   GeraListaCards('nome like '+QuotedStr('%'+edtNomeF.Text+'%'))
end;

procedure TfrmListCategoria.btnBuscarClick(Sender: TObject);
begin
   GeraListaCards('nome like '+QuotedStr('%'+edtNomeF.Text+'%'))
end;

procedure TfrmListCategoria.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmListCategoria.btnSelecionarClick(Sender: TObject);
begin
  ShowMessage('Categoria Selecionado :'+vIdCategoria);
end;

procedure TfrmListCategoria.btnSelecionarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmListCategoria.btnSelecionarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 1;
end;


procedure TfrmListCategoria.DestroiFrames;
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
