unit UListBebedouro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Objects, FMX.Controls.Presentation,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UFrameBebedouro, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TfrmListBebedouro = class(TForm)
    Rectangle1: TRectangle;
    layPrincipal: TLayout;
    RecLista: TRectangle;
    layListCards: TLayout;
    Layout9: TLayout;
    btnSelecionar: TRectangle;
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
    imgFrequencia: TImage;
    imgDaata: TImage;
    lista: TListView;
    imgData: TImage;
    imgSyncOf: TImage;
    imgSyncOn: TImage;
    imgStatus: TImage;
    imgFinalizar: TImage;
    imgCurral: TImage;
    imgBoi: TImage;
    procedure btnSelecionarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnSelecionarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
    procedure listaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  private
    { Private declarations }
  public
    oDataSet   : TFDQuery;
    FFrame     : TFrameBebedouro;
    vNomeBebedouro,vIdBebedouro,vUltimaLimpeza : string;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure GeraListaCards(vFiltro:string);
    procedure DestroiFrames;
end;

var
  frmListBebedouro: TfrmListBebedouro;

implementation

{$R *.fmx}

uses UDmDB;

procedure TfrmListBebedouro.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmListBebedouro.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmListBebedouro.GeraListaCards(vFiltro: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
begin
 dmDB.AbreBebedouro(dmdb.vIdPropriedade,vFiltro);
 dmDB.BEBEDOURO.First;
 Lista.Items.Clear;
 while not dmDB.BEBEDOURO.eof do
 begin
   item := Lista.Items.Add;
   with frmListBebedouro do
   begin
     with item  do
     begin
       txt      := TListItemText(Objects.FindDrawable('Text1'));
       txt.Text      := dmDB.BEBEDOUROPasto.AsString;
       txt.TagString := dmDB.BEBEDOUROID.AsString;

       img := TListItemImage(Objects.FindDrawable('Image2'));
       img.Bitmap     := imgFrequencia.Bitmap;
       txt      := TListItemText(Objects.FindDrawable('Text4'));
       txt.Text :=  'Frequencia de  Limpeza: '+dmDB.BEBEDOUROFREQ_LIMPEZA.AsString+' dias';

       img := TListItemImage(Objects.FindDrawable('Image7'));
       img.Bitmap     := imgDaata.Bitmap;
       txt      := TListItemText(Objects.FindDrawable('Text6'));
       txt.Text := 'Última Limpeza: '+dmDB.BEBEDOUROULTIMA_LIMPEZA.AsString;

       dmDB.BEBEDOURO.Next;
     end;
   end;
   lblTotalRegistro.Text := intToStr(Lista.Items.Count);
 end;
end;


procedure TfrmListBebedouro.listaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdBebedouro             := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text1').TagString;
 vNomeBebedouro           := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text1').Text;
 vUltimaLimpeza           := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text6').Text;
end;

procedure TfrmListBebedouro.SearchEditButton1Click(Sender: TObject);
var
 vFiltro:string;
begin
 if edtNomeF.Text.Length>0 then
  vFiltro := vFiltro+' and pasto like '+QuotedStr('%'+edtNomeF.Text+'%');
 GeraListaCards(vFiltro);
end;

procedure TfrmListBebedouro.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmListBebedouro.btnSelecionarClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmListBebedouro.btnSelecionarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 1;
end;

procedure TfrmListBebedouro.btnSelecionarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;


procedure TfrmListBebedouro.DestroiFrames;
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
