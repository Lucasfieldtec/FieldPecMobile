unit UFarmacos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Objects, FMX.Controls.Presentation,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TfrmFarmacos = class(TForm)
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
    lblFarmacos: TLabel;
    btnCloseAll: TImage;
    StyleBook1: TStyleBook;
    Lista: TListView;
    procedure edtNomeFChangeTracking(Sender: TObject);
    procedure ListaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure FormShow(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    vNomeFarmaco,
    vIdFarmaco,
    vTipoDose,
    vMlFixa,
    vKgMl,
    vMlPorPeso,vCarenciaDias:string;
    procedure GeraLista;
  end;

var
  frmFarmacos: TfrmFarmacos;

implementation

{$R *.fmx}

uses UDmDB, UPrincipal;

{ TfrmFarmacos }

procedure TfrmFarmacos.btnSelecionarClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmFarmacos.edtNomeFChangeTracking(Sender: TObject);
begin
  dmdb.FARMACO.Filtered := false;
  dmdb.FARMACO.Filter   := ' nome like '+QuotedStr('%'+edtNomeF.Text+'%');
  dmdb.FARMACO.Filtered := True;
  GeraLista;
end;

procedure TfrmFarmacos.FormShow(Sender: TObject);
begin
 dmdb.FARMACO.Filtered := false;
 dmdb.FARMACO.Close;
 dmdb.FARMACO.Open;
 GeraLista;
end;

procedure TfrmFarmacos.GeraLista;
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vStatus:string;
begin
 TThread.CreateAnonymousThread(procedure
 begin
  TThread.Synchronize(nil, procedure
  begin
    dmDb.FARMACO.First;
    Lista.Items.Clear;
    while not dmDb.FARMACO.eof do
     begin
       item := Lista.Items.Add;
         with frmFarmacos do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text1'));
             txt.TagString := dmDb.FARMACOid.AsString;
             txt.Text      := dmDb.FARMACONOME.AsString;

             txt           := TListItemText(Objects.FindDrawable('Text3'));
             txt.Text      := 'Dosagem : ';
             txt.TagString := dmDb.FARMACOML_DOSE_FIXA.AsString;

             txt           := TListItemText(Objects.FindDrawable('Text4'));
             txt.TagString := dmDb.FARMACOTIPO_APICACAO.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text5'));
             txt.Text := 'Fixa(ml) : ';
             txt.TagString := dmDb.FARMACOKG_DOSE_PV.AsString;


             txt      := TListItemText(Objects.FindDrawable('Text6'));
             txt.Text := dmDb.FARMACOML_DOSE_FIXA.AsString;
             txt.TagString := dmDb.FARMACOML_DOSE_PV.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text7'));
             txt.Text := 'Peso(ml) : ';
             txt      := TListItemText(Objects.FindDrawable('Text8'));
             txt.Text := dmDb.FARMACOML_DOSE_PV.AsString;

             txt      := TListItemText(Objects.FindDrawable('Text9'));
             txt.Text := 'Carência : ';
             txt      := TListItemText(Objects.FindDrawable('Text10'));
             txt.Text := dmDb.FARMACOCARENCIA_DIA.AsString;

             img := TListItemImage(Objects.FindDrawable('Image2'));
             img.Bitmap     := frmPrincipal.imgfarmaco.Bitmap;

           end;
           dmDB.FARMACO.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TfrmFarmacos.ListaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
   vIdFarmaco:=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text1').TagString;

  vNomeFarmaco:=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text1').Text;

  vTipoDose:=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text4').TagString;

  vMlFixa :=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text3').TagString;

  vKgMl :=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text5').TagString;

  vMlPorPeso :=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text6').TagString;

  vCarenciaDias :=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text10').Text;

end;

end.
