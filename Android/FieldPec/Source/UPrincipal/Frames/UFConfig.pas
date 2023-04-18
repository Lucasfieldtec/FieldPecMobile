unit UFConfig;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Effects, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.Edit;

type
  TframeConfig = class(TFrame)
    RecPrincipal: TRectangle;
    Layout1: TLayout;
    img_seta: TImage;
    Layout2: TLayout;
    btnCloseAll: TImage;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Layout23: TLayout;
    Rectangle17: TRectangle;
    Layout30: TLayout;
    Layout31: TLayout;
    Label14: TLabel;
    Layout32: TLayout;
    btnConfirmar: TRectangle;
    Image9: TImage;
    ShadowEffect1: TShadowEffect;
    Label16: TLabel;
    Rectangle2: TRectangle;
    Layout24: TLayout;
    Layout25: TLayout;
    Label10: TLabel;
    Rectangle9: TRectangle;
    edtIpServidor: TEdit;
    ClearEditButton2: TClearEditButton;
    Rectangle3: TRectangle;
    edtPortaServidor: TEdit;
    ClearEditButton1: TClearEditButton;
    procedure btnCloseAllClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses UDmDB, UPrincipal, UdmSync, UFLogin;

procedure TframeConfig.btnCloseAllClick(Sender: TObject);
begin
 Visible := false;
end;

procedure TframeConfig.btnConfirmarClick(Sender: TObject);
var
 vResult:string;
begin
 if edtIPServidor.Text.IsEmpty then
 begin
  ShowMessage('Informe o Host do Servidor');
  edtIPServidor.SetFocus;
  Exit;
 end;
 if edtPortaServidor.Text.IsEmpty then
 begin
  ShowMessage('Informe a Porta do Servidor');
  edtPortaServidor.SetFocus;
  Exit;
 end;
 dmDB.qryConfig.Edit;
 dmdb.qryConfigIP_SERVIDOR.AsString    := edtIPServidor.Text;
 dmdb.qryConfigPOTA_SERVIDOR.AsString  := edtPortaServidor.Text;
 dmSync.Host                           := edtIPServidor.Text;
 dmSync.Porta                          := edtPortaServidor.Text;
 try
   dmdb.qryConfig.ApplyUpdates(-1);
 except
 on E : Exception do
   ShowMessage('Erro ao inserir Configuração : '+E.Message);
 end;
   if frmPrincipal.vPrimeiroAcesso then
   begin
    try
     vResult := dmSync.GetGenerico(dmSync.USERS);
     dmSync.GetGenerico(dmSync.PROPRIEDADES);
     dmdb.PROPRIEDADES.Close;
     dmdb.PROPRIEDADES.Open;
     if vResult='Dados Baixados com Sucesso!' then
     begin
       ShowMessage('Usuarios baixados com sucesso');
       frmPrincipal.vPrimeiroAcesso := false;
       frmPrincipal.frmeLogin1.Visible := true;
       Visible := false;
     end
     else
     begin
       ShowMessage(vResult);
     end;
    except
    on E : Exception do
       ShowMessage('Erro ao baixar Usuario: '+E.Message);
    end;
   end
   else
    Visible := false;
end;

end.
