unit UFSync;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.ActnList, System.Actions, FMX.TabControl,FireDAC.DApt, FMX.ListBox,
  FMX.Ani, FMX.ScrollBox, FMX.Memo, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope,FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, Data.DB, FireDAC.Comp.DataSet,
  FMX.TreeView,System.Net.HttpClient, FMX.Memo.Types
  {$IFDEF ANDROID}
  ,AndroidApi.helpers,AndroidApi.JNI.JavaTypes,AndroidApi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os,Androidapi.JNIBridge,Androidapi.JNI.Telephony,Androidapi.JNI.Provider,
  FMX.Helpers.Android,FMX.Platform.Android,System.PushNotification,System.Permissions,
  FMX.VirtualKeyboard, FMX.Media
  {$ENDIF}

 {$IFDEF MSWINDOWS}
  ,Winapi.Windows, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP
 {$ENDIF}
  ;

type
  TFrameSync = class(TFrame)
    laySelectSync: TLayout;
    imgSync: TImage;
    Animacao: TFloatAnimation;
    Layout36: TLayout;
    imgTransf: TImage;
    mlog: TEdit;
    Rectangle19: TRectangle;
    Image17: TImage;
    Label19: TLabel;
    Rectangle24: TRectangle;
    Layout35: TLayout;
    Label21: TLabel;
    btnFechaSync: TImage;
    Rectangle3: TRectangle;
    btnEnviar: TRectangle;
    Label22: TLabel;
    Layout37: TLayout;
    Rectangle6: TRectangle;
    Image2: TImage;
    ShadowEffect5: TShadowEffect;
    lblLimpezaSync: TLabel;
    btnBaixar: TRectangle;
    Image1: TImage;
    ShadowEffect1: TShadowEffect;
    Label1: TLabel;
    Image3: TImage;
    ShadowEffect2: TShadowEffect;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Image4: TImage;
    ShadowEffect3: TShadowEffect;
    lblMovAnimal: TLabel;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    Image5: TImage;
    ShadowEffect4: TShadowEffect;
    lblFornConfinamento: TLabel;
    Layout3: TLayout;
    Rectangle4: TRectangle;
    Image6: TImage;
    ShadowEffect6: TShadowEffect;
    lblFornMineral: TLabel;
    Layout4: TLayout;
    Rectangle5: TRectangle;
    Image7: TImage;
    ShadowEffect7: TShadowEffect;
    lblLeituraCocho: TLabel;
    Layout5: TLayout;
    Rectangle7: TRectangle;
    Image8: TImage;
    ShadowEffect8: TShadowEffect;
    lblFabricacao: TLabel;
    layOpcBaixar: TLayout;
    Rectangle8: TRectangle;
    Layout6: TLayout;
    btnBaixaAll: TRectangle;
    Image11: TImage;
    ShadowEffect10: TShadowEffect;
    Label3: TLabel;
    btnAnimais: TRectangle;
    Image9: TImage;
    ShadowEffect15: TShadowEffect;
    Label15: TLabel;
    chkBaixaAnimais: TButton;
    btnSanidade: TRectangle;
    Image10: TImage;
    ShadowEffect9: TShadowEffect;
    Label2: TLabel;
    chkBaixaHistSani: TButton;
    Layout7: TLayout;
    Rectangle9: TRectangle;
    Image12: TImage;
    ShadowEffect11: TShadowEffect;
    lblSanidade: TLabel;
    procedure btnFechaSyncClick(Sender: TObject);
    procedure btnEnviarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnEnviarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnEnviarClick(Sender: TObject);
    procedure Rectangle19Click(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
    procedure chkBaixaAnimaisClick(Sender: TObject);
    procedure btnBaixaAllClick(Sender: TObject);
    procedure btnAnimaisClick(Sender: TObject);
    procedure chkBaixaHistSaniClick(Sender: TObject);
    procedure btnSanidadeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses UPrincipal, UdmSync, UDmDB, UdmSyncUp;

procedure TFrameSync.btnAnimaisClick(Sender: TObject);
begin
  if chkBaixaAnimais.Text='' then
   chkBaixaAnimais.Text :='X'
  else
   chkBaixaAnimais.Text :='';
end;

procedure TFrameSync.btnBaixaAllClick(Sender: TObject);
begin
  layOpcBaixar.Visible := false;
  if dmSync.TestaServidor<>'Erro' THEN
  begin
   Animacao.Start;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Usuarios...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.USERS));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Propriedades...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.USERS));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Currais...');
    end);
    mlog.text :=(dmSync.GetGenericoPostIdPropriedade(dmSync.CURRAIS));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Bebedouros...');
    end);
    mlog.text :=(dmSync.GetGenericoPostIdPropriedade(dmSync.BEBEDOURO));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Cochos...');
    end);
    mlog.text :=(dmSync.GetGenericoPostIdPropriedade(dmSync.COCHO));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Alimentos...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.ALIMENTO));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Raca...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.RACA));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Categoria Padrao...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.CATEGORIA_PADRAO));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Categorias...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.CATEGORIAS));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Produtores...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.PRODUTORES));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Rebanho...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.AUX_REBANHO));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Motivo Movimentacao...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.AUX_MOTIVO_MOVIMENTACAO));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Suplemento Mineral...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.SUPLEMENTO_MINERAL));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Nota de Leitura...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.AUX_NOTAS_LEITURA));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando LOTE NUTRICIONAL');
    end);
    mlog.text :=(dmSync.GetGenericoPostIdPropriedade(dmSync.LOTE_NUTRICIONAL));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando HISTORICO LEITURA DE COCHO');
    end);
    mlog.text :=(dmSync.GetGenericoPostIdPropriedade(dmSync.HIST_LEITURA_COCHO));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Historico Consumo...');
    end);
    mlog.text :=(dmSync.GetGenericoPostIdPropriedade(dmSync.HIST_CONSUMO));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Ração...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.RACAO));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Ração Insumos...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.RACAOINSUMOS));
    Sleep(1000);
    if chkBaixaAnimais.Text='X' then
    begin
      TThread.Synchronize(nil, procedure
      begin
       mlog.text :=('Baixando Animais...');
      end);
      mlog.text :=(dmSync.GetAnimais);
      Sleep(1000);
    end;
    if chkBaixaHistSani.Text='X' then
    begin
      TThread.Synchronize(nil, procedure
      begin
       mlog.text :=('Baixando Hist. Sanidade...');
      end);
      mlog.text :=(dmSync.GetHistSanidade);
      Sleep(1000);
    end;

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Enviando Fornecimento Conf');
    end);
    mlog.text :=(dmSyncUp.PostFornecimentoConf);
    Sleep(1000);


    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Previsto Fornecimento...');
    end);
    mlog.text :=(dmSync.GetGenericoPostIdPropriedade(dmSync.FORNECIMENTO_PREVISTO));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Farmacos...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.FARMACO));
    Sleep(1000);


    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Protocolos...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.PROTOCOLO_SANITARIO));
    Sleep(1000);


    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Protocolos Farmacos...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.PROTOCOLO_FARMACOS));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     Animacao.Stop;
     MessageDlg('Dados Sincronizados com Sucesso!'+#13+
      'Sistema deve ser reiniciado!', System.UITypes.TMsgDlgType.mtInformation,
       [System.UITypes.TMsgDlgBtn.mbYes], 0,
       procedure(const AResult: System.UITypes.TModalResult)
       begin
//         Application.Terminate;
       end);
    end);
   end).Start;
  end
  else
  begin
    ShowMessage('Erro ao se conectar com servidor!');
    Animacao.Stop;
  end;
end;

procedure TFrameSync.btnBaixarClick(Sender: TObject);
begin
  layOpcBaixar.Visible := true;
end;

procedure TFrameSync.btnEnviarClick(Sender: TObject);
begin
 if dmSync.TestaServidor<>'Erro' THEN
 begin
   Animacao.Start;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Enviando Limpeza Bebedouro...');
    end);
    mlog.text :=(dmSyncUp.PostLimpezaBebedouro);
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Enviando Movimentaçao Animal...');
    end);
    mlog.text :=(dmSyncUp.PostMovAnimal);
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Enviando Fornecimento');
    end);
    mlog.text :=(dmSyncUp.PostForneMineral);
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Enviando Fornecimento Conf');
    end);
    mlog.text :=(dmSyncUp.PostFornecimentoConf);
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Enviando Leitura Cocho');
    end);
    mlog.text :=(dmSyncUp.PostLeituraCocho);
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Enviando Fabricacao');
    end);
    mlog.text :=(dmSyncUp.PostFabricacao);
    Sleep(1000);


    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Enviando Sanidade');
    end);
    mlog.text :=(dmSyncUp.PostSanidade);
    Sleep(1000);


    TThread.Synchronize(nil, procedure
    begin
     dmdb.FCon.Commit;
     dmdb.FCon.Connected := false;
     dmdb.FCon.Connected := True;
     dmSyncUp.LIMPEZABEBEDOURO.Connection := dmdb.FCon;
     dmSyncUp.LIMPEZABEBEDOURO.Close;
     dmSyncUp.LIMPEZABEBEDOURO.Open;
     lblLimpezaSync.Text :='Limpeza Bebedouro:'+intToStr(dmSyncUp.LIMPEZABEBEDOURO.RecordCount);


     Animacao.Stop;
     MessageDlg('Dados Sincronizados com Sucesso, sistema deve ser reiniciado!',
     System.UITypes.TMsgDlgType.mtInformation,
       [System.UITypes.TMsgDlgBtn.mbYes], 0,
       procedure(const AResult: System.UITypes.TModalResult)
       begin
         Application.Terminate;
       end);
    end);
  end).Start;
 end
 else
  begin
    ShowMessage('Erro ao se conectar com servidor!');
    Animacao.Stop;
  end;
end;

procedure TFrameSync.btnEnviarMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 TRectangle(sender).Opacity := 0.5;
end;

procedure TFrameSync.btnEnviarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 TRectangle(sender).Opacity := 1;
end;

procedure TFrameSync.btnFechaSyncClick(Sender: TObject);
begin
 Visible := false;
end;

procedure TFrameSync.btnSanidadeClick(Sender: TObject);
begin
   if chkBaixaHistSani.Text='' then
   chkBaixaHistSani.Text :='X'
  else
   chkBaixaHistSani.Text :='';
end;

procedure TFrameSync.chkBaixaAnimaisClick(Sender: TObject);
begin
  if chkBaixaAnimais.Text='' then
   chkBaixaAnimais.Text :='X'
  else
   chkBaixaAnimais.Text :='';
end;

procedure TFrameSync.chkBaixaHistSaniClick(Sender: TObject);
begin
   if chkBaixaHistSani.Text='' then
   chkBaixaHistSani.Text :='X'
  else
   chkBaixaHistSani.Text :='';
end;

procedure TFrameSync.Rectangle19Click(Sender: TObject);
begin
  Visible := false;
end;

end.
