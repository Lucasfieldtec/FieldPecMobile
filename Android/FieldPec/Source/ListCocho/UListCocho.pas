unit UListCocho;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Objects, FMX.Controls.Presentation,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UFrameCocho;

type
  TfrmListCocho = class(TForm)
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
    procedure btnCloseAllClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    vNomeCocho,vIdCocho,vIdPasto,vLotacao : string;
    FFrame     : TFrameCocho;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure GeraListaCards(vFiltro:string);
    procedure DestroiFrames;
    procedure ItemClick(Sender: TObject);
end;

var
  frmListCocho: TfrmListCocho;

implementation

{$R *.fmx}

uses UDmDB;

procedure TfrmListCocho.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmListCocho.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmListCocho.GeraListaCards(vFiltro: string);
var
  item: TListBoxItem;
begin
   if ListaCards=nil then
    FreeAndNil(ListaCards);
   DestroiFrames;
   ListaCards        := TListBox.Create(self);
   ListaCards.Parent := layListCards;
   ListaCards.Align  := TAlignLayout.Client;

   dmDB.AbreCocho(dmdb.vIdPropriedade,vFiltro);
   dmDB.COCHO.First;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     while not dmDB.COCHO.eof do
     begin
      ListaCards.BeginUpdate;
      item := TListBoxItem.Create(self);
      FFrame := TFrameCocho.Create(self);
      FFrame.Name:= 'Item_'+dmDB.COCHOID.AsString;

      FFrame.Parent          := item;
      FFrame.Align           := TAlignLayout.Client;
      FFrame.HitTest         := false;
      FFrame.Opacity         := 1;

      item.HitTest           := true;
      item.Height            := 60;
      item.Margins.Left      := 10;
      item.Margins.Right     := 10;
      item.Margins.Top       := 10;
      item.Margins.Bottom    := 10;
      item.TagString         := dmDB.COCHOID.AsString;
      item.OnClick           := ItemClick;
      item.OnMouseDown       := FrameMouseDown;
      item.OnMouseUp         := FrameMouseUp;
      item.Tag               := dmDB.COCHOID.AsInteger;
      item.TagString         := dmDB.COCHOPasto.AsString;
      item.hint              := dmDB.COCHOlotacao.AsString;
      item.TagFloat          := dmDB.COCHOID_PASTO.AsFloat;

      FFrame.lblCocho.Text       := dmDB.COCHOPasto.AsString+'-'+dmDB.COCHOTAG.AsString;
      FFrame.lblCocho.TagString  := dmDB.COCHOID.AsString;
      item.Parent                := ListaCards;

      ListaCards.EndUpdate;
      dmDB.COCHO.Next;
     end;
     lblTotalRegistro.Text := intToStr(ListaCards.Items.Count);
    end);
   end).Start;
end;

procedure TfrmListCocho.ItemClick(Sender: TObject);
begin
 vIdCocho    := intToStr(TListBoxItem(sender).Tag);
 vNomeCocho  := TListBoxItem(sender).TagString;
 vIdPasto    := FloatToStr(TListBoxItem(sender).TagFloat);
 vLotacao    := TListBoxItem(sender).Hint;
end;

procedure TfrmListCocho.SearchEditButton1Click(Sender: TObject);
var
 vFiltro:string;
begin
 if edtNomeF.Text.Length>0 then
  vFiltro := vFiltro+' and pasto like '+QuotedStr('%'+edtNomeF.Text+'%');
 GeraListaCards(vFiltro);
end;

procedure TfrmListCocho.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmListCocho.btnSelecionarClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmListCocho.btnSelecionarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 1;
end;

procedure TfrmListCocho.btnSelecionarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;


procedure TfrmListCocho.DestroiFrames;
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
