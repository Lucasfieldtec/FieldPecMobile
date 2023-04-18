unit UListSuplementoMineral;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Objects, FMX.Controls.Presentation,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UFrameSuplementoMineral;

type
  TfrmListaMineral = class(TForm)
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
    procedure btnSelecionarClick(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    oDataSet   : TFDQuery;
    FFrame     : TFrameSuplementoMineral;
    vIdMineral,vNomeMineral,vKgEmbalagem : string;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure GeraListaCards(vFiltro:string);
    procedure DestroiFrames;
    procedure ItemClick(Sender: TObject);
end;

var
  frmListaMineral: TfrmListaMineral;

implementation

{$R *.fmx}

uses UDmDB;

procedure TfrmListaMineral.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmListaMineral.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmListaMineral.GeraListaCards(vFiltro: string);
var
  item: TListBoxItem;
begin
   if ListaCards=nil then
    FreeAndNil(ListaCards);
   DestroiFrames;
   ListaCards        := TListBox.Create(self);
   ListaCards.Parent := layListCards;
   ListaCards.Align  := TAlignLayout.Client;

   dmDB.SUPLEMENTO_MINERAL.Filtered := false;
   dmDB.SUPLEMENTO_MINERAL.Close;
   dmDB.SUPLEMENTO_MINERAL.Open;
   if vFiltro.Length>0 then
   begin
    dmDB.SUPLEMENTO_MINERAL.Filter := vFiltro;
    dmDB.SUPLEMENTO_MINERAL.Filtered := true;
   end;
   dmDB.SUPLEMENTO_MINERAL.First;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     while not dmDB.SUPLEMENTO_MINERAL.eof do
     begin
      ListaCards.BeginUpdate;
      item := TListBoxItem.Create(self);
      FFrame := TFrameSuplementoMineral.Create(self);
      FFrame.Name:= 'Item_'+dmDB.SUPLEMENTO_MINERALID.AsString;

      FFrame.Parent            := item;
      FFrame.Align             := TAlignLayout.Client;
      FFrame.HitTest           := false;
      FFrame.Opacity           := 1;

      item.HitTest             := true;
      item.Height              := 100;
      item.Margins.Left        := 10;
      item.Margins.Right       := 10;
      item.Margins.Top         := 10;
      item.Margins.Bottom      := 10;
      item.TagString           := dmDB.SUPLEMENTO_MINERALNOME.AsString;
      item.Tag                 := dmDB.SUPLEMENTO_MINERALId.AsInteger;
      item.TagFloat            := dmDB.SUPLEMENTO_MINERALPESO_EMBALAGEM.AsFloat;
      item.OnClick             := ItemClick;
      item.OnMouseDown         := FrameMouseDown;
      item.OnMouseUp           := FrameMouseUp;
      item.TagString           := dmDB.SUPLEMENTO_MINERALNOME.AsString;
      item.Tag                 := dmDB.SUPLEMENTO_MINERALID.AsInteger;
      item.TagFloat            := dmDB.SUPLEMENTO_MINERALPESO_EMBALAGEM.AsFloat;

      FFrame.lblnome.Text      := dmDB.SUPLEMENTO_MINERALNOME.AsString;
      FFrame.lblnome.TagString := dmDB.SUPLEMENTO_MINERALId.AsString;
      FFrame.lblEmbalagem.TagString := dmDB.SUPLEMENTO_MINERALPESO_EMBALAGEM.AsString;
      item.Parent              := ListaCards;
      ListaCards.EndUpdate;
      dmDB.SUPLEMENTO_MINERAL.Next;
     end;
     lblTotalRegistro.Text := intToStr(ListaCards.Items.Count);
    end);
   end).Start;
end;

procedure TfrmListaMineral.ItemClick(Sender: TObject);
begin
 vIdMineral          := intToStr(TListBoxItem(sender).Tag);
 vNomeMineral        := TListBoxItem(sender).TagString;
 vKgEmbalagem        := FloatToStr(TListBoxItem(sender).TagFloat);
 TListBoxItem(sender).IsSelected := true;
end;

procedure TfrmListaMineral.SearchEditButton1Click(Sender: TObject);
var
 vFiltro:string;
begin
 if edtNomeF.Text.Length>0 then
  vFiltro := vFiltro+' and pasto like '+QuotedStr('%'+edtNomeF.Text+'%');
 GeraListaCards(vFiltro);
end;

procedure TfrmListaMineral.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmListaMineral.btnSelecionarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmListaMineral.btnSelecionarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 1;
end;

procedure TfrmListaMineral.btnSelecionarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;


procedure TfrmListaMineral.DestroiFrames;
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
