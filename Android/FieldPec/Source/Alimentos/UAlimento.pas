unit UAlimento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Objects, FMX.Controls.Presentation,
  UFrameListaAlimentos;

type
  TfrmListaAlimentos = class(TForm)
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
    Label1: TLabel;
    btnCloseAll: TImage;
    Layout3: TLayout;
    lblTotalRegistro: TLabel;
    Layout10: TLayout;
    btnBuscar: TRectangle;
    Layout11: TLayout;
    Label3: TLabel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnSelecionarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnSelecionarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    FFrame   : TFItemListaAlimentos;
    vIdAlimento,vFiltro:string;
    procedure GeraListaCards(vFiltro:string);
    procedure DestroiFrames;
    procedure ItemClick(Sender: TObject);
  end;

var
  frmListaAlimentos: TfrmListaAlimentos;

implementation

{$R *.fmx}

uses UDmDB;

{ TfrmListaAlimentos }

procedure TfrmListaAlimentos.btnBuscarClick(Sender: TObject);
begin
   GeraListaCards('nome like '+QuotedStr('%'+edtNomeF.Text+'%'))
end;

procedure TfrmListaAlimentos.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmListaAlimentos.btnSelecionarClick(Sender: TObject);
begin
 ShowMessage('Alimento Selecionado :'+  vIdAlimento);
end;

procedure TfrmListaAlimentos.btnSelecionarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
      TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmListaAlimentos.btnSelecionarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
   TRectangle(sender).Opacity := 1;
end;

procedure TfrmListaAlimentos.DestroiFrames;
var
  i : Integer;
begin
  for i := ComponentCount - 1 downto 0 do
  begin
   If (Components[i] is TFrame) then
     TFrame(Components[i]).Destroy;
  end;
end;

procedure TfrmListaAlimentos.FormShow(Sender: TObject);
begin
 GeraListaCards(vFiltro);
end;

procedure TfrmListaAlimentos.GeraListaCards(vFiltro: string);
var
  item: TListBoxItem;
  vImgBomba,vImgHorimetro,vImgkm :TImage;
begin
   if ListaCards=nil then
    FreeAndNil(ListaCards);
   DestroiFrames;
   ListaCards        := TListBox.Create(self);
   ListaCards.Parent := layListCards;
   ListaCards.Align  := TAlignLayout.Client;

   dmDB.ALIMENTO.Filtered := false;
   dmDB.ALIMENTO.Close;
   dmDB.ALIMENTO.Open;
   if vFiltro.Length>0 then
   begin
    dmDB.ALIMENTO.Filter := vFiltro;
    dmDB.ALIMENTO.Filtered := true;
   end;

   dmDB.ALIMENTO.First;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     while not dmDB.ALIMENTO.eof do
     begin
      ListaCards.BeginUpdate;
      item := TListBoxItem.Create(self);
      FFrame := TFItemListaAlimentos.Create(self);
      FFrame.Name:= 'Item_'+dmDB.ALIMENTOID.AsString;

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
      item.TagString         := dmDB.ALIMENTOId.AsString;
      item.OnClick           := ItemClick;
      item.TagString         := dmDB.ALIMENTOId.AsString;

      FFrame.lblNome.Text    := dmDB.ALIMENTONOME.AsString;

      FFrame.lblMs.Text      := dmDB.ALIMENTOMS.AsString;

      item.Parent                      := ListaCards;

      ListaCards.EndUpdate;
      dmDB.ALIMENTO.Next;
     end;
     lblTotalRegistro.Text := intToStr(ListaCards.Items.Count);
    end);
   end).Start;

end;

procedure TfrmListaAlimentos.ItemClick(Sender: TObject);
begin
 vIdAlimento          := TListBoxItem(sender).TagString;
 TListBoxItem(sender).IsSelected := true;
end;

procedure TfrmListaAlimentos.SearchEditButton1Click(Sender: TObject);
begin
  GeraListaCards('nome like '+QuotedStr('%'+edtNomeF.Text+'%'))
end;

end.
