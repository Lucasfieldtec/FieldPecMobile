unit UListMotivoMov;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Objects, FMX.Controls.Presentation,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UFrameMotivoMov;

type
  TfrmListaMotivoMov = class(TForm)
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
    procedure btnSelecionarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnSelecionarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    oDataSet   : TFDQuery;
    FFrame     : TFrameMotivoMov;
    vIdMotivo,vNomeMotivo  : string;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure GeraListaCards(vFiltro:string);
    procedure DestroiFrames;
    procedure ItemClick(Sender: TObject);
end;

var
  frmListaMotivoMov: TfrmListaMotivoMov;

implementation

{$R *.fmx}

uses UDmDB;

procedure TfrmListaMotivoMov.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmListaMotivoMov.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmListaMotivoMov.GeraListaCards(vFiltro: string);
var
  item: TListBoxItem;
begin
   if ListaCards=nil then
    FreeAndNil(ListaCards);
   DestroiFrames;
   ListaCards        := TListBox.Create(self);
   ListaCards.Parent := layListCards;
   ListaCards.Align  := TAlignLayout.Client;

   dmDB.AUX_MOTIVO_MOVIMENTACAO.Filtered := false;
   dmDB.AUX_MOTIVO_MOVIMENTACAO.Close;
   dmDB.AUX_MOTIVO_MOVIMENTACAO.Open;
   if vFiltro.Length>0 then
   begin
    dmDB.AUX_MOTIVO_MOVIMENTACAO.Filter := vFiltro;
    dmDB.AUX_MOTIVO_MOVIMENTACAO.Filtered := true;
   end;
   dmDB.AUX_MOTIVO_MOVIMENTACAO.First;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     while not dmDB.AUX_MOTIVO_MOVIMENTACAO.eof do
     begin
      ListaCards.BeginUpdate;
      item := TListBoxItem.Create(self);
      FFrame := TFrameMotivoMov.Create(self);
      FFrame.Name:= 'Item_'+dmDB.AUX_MOTIVO_MOVIMENTACAOID.AsString;

      FFrame.Parent          := item;
      FFrame.Align           := TAlignLayout.Client;
      FFrame.HitTest         := false;
      FFrame.Opacity         := 1;

      item.HitTest           := true;
      item.Height            := 50;
      item.Margins.Left      := 10;
      item.Margins.Right     := 10;
      item.Margins.Top       := 10;
      item.Margins.Bottom    := 10;
      item.TagString         := dmDB.AUX_MOTIVO_MOVIMENTACAOId.AsString;
      item.OnClick           := ItemClick;
      item.OnMouseDown       := FrameMouseDown;
      item.OnMouseUp         := FrameMouseUp;
      item.TagString         := dmDB.AUX_MOTIVO_MOVIMENTACAONOME.AsString;
      item.Tag               := dmDB.AUX_MOTIVO_MOVIMENTACAOId.AsInteger;

      FFrame.lblNome.Text    := dmDB.AUX_MOTIVO_MOVIMENTACAONOME.AsString;
      item.Parent            := ListaCards;
      ListaCards.EndUpdate;
      dmDB.AUX_MOTIVO_MOVIMENTACAO.Next;
     end;
     lblTotalRegistro.Text := intToStr(ListaCards.Items.Count);
    end);
   end).Start;
end;

procedure TfrmListaMotivoMov.ItemClick(Sender: TObject);
begin
 vIdMotivo          := intToStr(TListBoxItem(sender).Tag);
 vNomeMotivo        := TListBoxItem(sender).TagString;
 TListBoxItem(sender).IsSelected := true;
end;

procedure TfrmListaMotivoMov.SearchEditButton1Click(Sender: TObject);
begin
  GeraListaCards('nome like '+QuotedStr('%'+edtNomeF.Text+'%'))
end;

procedure TfrmListaMotivoMov.btnSelecionarClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmListaMotivoMov.btnSelecionarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 1;
end;

procedure TfrmListaMotivoMov.btnSelecionarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;


procedure TfrmListaMotivoMov.DestroiFrames;
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
