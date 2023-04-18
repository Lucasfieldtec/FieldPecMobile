unit UCurrais;

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
    ,Soap.EncdDecd,UFrameLista;

type
  TfrmListaCurrais = class(TForm)
    layPrincipal: TLayout;
    Rectangle1: TRectangle;
    RecLista: TRectangle;
    StyleBook1: TStyleBook;
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
    layListCards: TLayout;
    Lsbrl: TLayout;
    btnCloseAll: TImage;
    Label1: TLabel;
    Layout3: TLayout;
    lblTotalRegistro: TLabel;
    Layout9: TLayout;
    btnSelecionar: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image4: TImage;
    Layout5: TLayout;
    Rectangle6: TRectangle;
    rdConfinamento: TRadioButton;
    RdPasto: TRadioButton;
    rdTodos: TRadioButton;
    Layout10: TLayout;
    btnBuscar: TRectangle;
    Layout11: TLayout;
    Label3: TLabel;
    Image1: TImage;
    lista: TListView;
    imgData: TImage;
    imgSyncOf: TImage;
    imgSyncOn: TImage;
    imgStatus: TImage;
    imgFinalizar: TImage;
    imgCurral: TImage;
    imgBoi: TImage;
    procedure btnCloseAllClick(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ListaCardsCanFocus(Sender: TObject; var ACanFocus: Boolean);
    procedure btnSelecionarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnSelecionarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscarClick(Sender: TObject);
    procedure listaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
  private
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Single);
  public
    vFiltro,vIdCurral,vNomeCurral,vTipo:string;
    FFrame: TFItemListaCurrais;
    procedure GeraListaCards(vFiltro:string);
    procedure DestroiFrames;

 end;

var
  frmListaCurrais: TfrmListaCurrais;

implementation

{$R *.fmx}

uses UDmDB;

{ TForm1 }

procedure TfrmListaCurrais.ListaCardsCanFocus(Sender: TObject;
  var ACanFocus: Boolean);
begin
 ShowMessage('oia')
end;

procedure TfrmListaCurrais.listaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdCurral:= TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text1').TagString;
 vNomeCurral        := TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text1').Text;
 vTipo              := FloatToStr(TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
  ('Text1').TagFloat);
end;

procedure TfrmListaCurrais.btnBuscarClick(Sender: TObject);
var
 vFiltro:string;
begin
 if rdConfinamento.IsChecked then
  vFiltro := vFiltro+'and tipo=1';
 if RdPasto.IsChecked then
  vFiltro := vFiltro+'and tipo=0';
 if edtNomeF.Text.Length>0 then
  vFiltro := vFiltro+' and codigo like '+QuotedStr('%'+edtNomeF.Text+'%');
 GeraListaCards(vFiltro);
end;

procedure TfrmListaCurrais.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmListaCurrais.btnSelecionarClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmListaCurrais.btnSelecionarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmListaCurrais.btnSelecionarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
    TRectangle(sender).Opacity := 1;
end;

procedure TfrmListaCurrais.DestroiFrames;
var
  i : Integer;
begin
  for i := ComponentCount - 1 downto 0 do
  begin
   If (Components[i] is TFrame) then
     TFrame(Components[i]).Destroy;
  end;
end;

procedure TfrmListaCurrais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 edtNomeF.Text :='';
end;

procedure TfrmListaCurrais.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmListaCurrais.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmListaCurrais.GeraListaCards(vFiltro: string);
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
begin
 dmDB.AbreCurrais(dmdb.vIdPropriedade,vFiltro);
   dmDB.CURRAIS.First;
 Lista.Items.Clear;
 while not dmDB.CURRAIS.eof do
 begin
   item := Lista.Items.Add;
   with frmListaCurrais do
   begin
     with item  do
     begin
       txt      := TListItemText(Objects.FindDrawable('Text1'));
       txt.Text := dmDB.CURRAISCODIGO.AsString;
       txt.TagString := dmDB.CURRAISID.AsString;
       txt.TagFloat  := dmDB.CURRAISTIPO.AsFloat;

       img := TListItemImage(Objects.FindDrawable('Image2'));
       img.Bitmap     := imgCurral.Bitmap;
       txt      := TListItemText(Objects.FindDrawable('Text4'));
       txt.Text := dmDB.CURRAISCODIGO.AsString;

       img := TListItemImage(Objects.FindDrawable('Image7'));
       img.Bitmap     := imgBoi.Bitmap;
       txt      := TListItemText(Objects.FindDrawable('Text6'));
       txt.Text := 'Lotação: '+dmDB.CURRAISLOTACAO.AsString;

       img := TListItemImage(Objects.FindDrawable('Image3'));
       img.Bitmap     := imgBoi.Bitmap;
       txt      := TListItemText(Objects.FindDrawable('Text5'));
       txt.Text := 'Tipo: '+dmDB.CURRAISTIPOSTR.AsString;
       dmDB.CURRAIS.Next;
     end;
   end;
   lblTotalRegistro.Text := intToStr(Lista.Items.Count);
 end;
end;


procedure TfrmListaCurrais.SearchEditButton1Click(Sender: TObject);
var
 vFiltro:string;
begin
 if rdConfinamento.IsChecked then
  vFiltro := vFiltro+'and tipo=1';
 if RdPasto.IsChecked then
  vFiltro := vFiltro+'and tipo=0';
 if edtNomeF.Text.Length>0 then
  vFiltro := vFiltro+' and codigo like '+QuotedStr('%'+edtNomeF.Text+'%');
 GeraListaCards(vFiltro);
end;

end.
