unit UProtocoloSanitario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Edit, FMX.StdCtrls, FMX.ListView, FMX.Objects, FMX.Controls.Presentation,
  FMX.Layouts;

type
  TFrmProtocoloSanitario = class(TForm)
    Rectangle1: TRectangle;
    layPrincipal: TLayout;
    RecLista: TRectangle;
    layListCards: TLayout;
    Layout9: TLayout;
    btnSelecionar: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image4: TImage;
    Lista: TListView;
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
    procedure FormShow(Sender: TObject);
    procedure ListaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtNomeFChangeTracking(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    vIdProtocolo,vNomeProtocolo:string;
    procedure GeraLista;
  end;

var
  FrmProtocoloSanitario: TFrmProtocoloSanitario;

implementation

{$R *.fmx}

uses UDmDB, UPrincipal;

procedure TFrmProtocoloSanitario.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TFrmProtocoloSanitario.btnSelecionarClick(Sender: TObject);
begin
 if vIdProtocolo.Length=0 then
 begin
   ShowMessage('Selcione o protocolo sanitario!');
   Exit;
 end;
 dmdb.TableProtocoloFarmacos.Close;
 dmdb.TableProtocoloFarmacos.ParamByName('ID').AsString :=vIdProtocolo;
 dmdb.TableProtocoloFarmacos.Open;
 Close;
end;

procedure TFrmProtocoloSanitario.edtNomeFChangeTracking(Sender: TObject);
begin
  dmdb.PROTOCOLO_SANITARIO.Filtered := false;
  dmdb.PROTOCOLO_SANITARIO.Filter   := ' nome like '+QuotedStr('%'+edtNomeF.Text+'%');
  dmdb.PROTOCOLO_SANITARIO.Filtered := True;
  GeraLista;
end;

procedure TFrmProtocoloSanitario.FormShow(Sender: TObject);
begin
 dmdb.PROTOCOLO_SANITARIO.Filtered := false;
 dmdb.PROTOCOLO_SANITARIO.Close;
 dmdb.PROTOCOLO_SANITARIO.Open;
 GeraLista;
end;

procedure TFrmProtocoloSanitario.GeraLista;
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
    dmDb.PROTOCOLO_SANITARIO.First;
    Lista.Items.Clear;
    while not dmDb.PROTOCOLO_SANITARIO.eof do
     begin
       item := Lista.Items.Add;
         with FrmProtocoloSanitario do
         begin
           with item  do
           begin
             txt      := TListItemText(Objects.FindDrawable('Text1'));
             txt.TagString := dmDb.PROTOCOLO_SANITARIOid.AsString;
             txt.Text      := dmDb.PROTOCOLO_SANITARIONOME.AsString;

             img := TListItemImage(Objects.FindDrawable('Image2'));
             img.Bitmap     := frmPrincipal.imgfarmaco.Bitmap;

           end;
           dmDB.PROTOCOLO_SANITARIO.Next;
         end;
     end;
  end);
 end).Start;
end;

procedure TFrmProtocoloSanitario.ListaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
 vIdProtocolo :=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text1').TagString;

 vNomeProtocolo :=
   TAppearanceListViewItem(Lista.Selected).Objects.FindObjectT<TListItemText>
   ('Text1').Text;
end;

end.
