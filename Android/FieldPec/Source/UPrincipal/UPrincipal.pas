unit UPrincipal;

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
  FMX.VirtualKeyboard
  {$ENDIF}
  ,FMX.Media,System.IOUtils, UFLogin, UFConfig, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, UFSync
 {$IFDEF MSWINDOWS}
  ,Winapi.Windows
 {$ENDIF}
  ;

type
  TfrmPrincipal = class(TForm)
    frmeLogin1: TfrmeLogin;
    RecPrincipal: TRectangle;
    RecMnu: TRectangle;
    laySuperior: TLayout;
    laySubMnu1: TLayout;
    btnConfig: TRectangle;
    Image3: TImage;
    ShadowEffect7: TShadowEffect;
    Label7: TLabel;
    btnSync: TRectangle;
    Image5: TImage;
    ShadowEffect4: TShadowEffect;
    Label6: TLabel;
    MediaPlayer1: TMediaPlayer;
    img_seta: TImage;
    StyleBook1: TStyleBook;
    Layout2: TLayout;
    btnCloseAll: TImage;
    frameConfig1: TframeConfig;
    IdHTTP1: TIdHTTP;
    lblPropriedade: TLabel;
    FrameSync1: TFrameSync;
    laySubMnuCad: TLayout;
    btnCadastros: TRectangle;
    Image1: TImage;
    ShadowEffect1: TShadowEffect;
    Label1: TLabel;
    MediaPlayer2: TMediaPlayer;
    recSubMnuCad: TRectangle;
    Layout1: TLayout;
    Layout3: TLayout;
    imgFechaMnuCad: TImage;
    Layout4: TLayout;
    btnCadCurrais: TRectangle;
    Image2: TImage;
    ShadowEffect2: TShadowEffect;
    Label2: TLabel;
    MediaPlayer3: TMediaPlayer;
    Layout5: TLayout;
    btnAlimentos: TRectangle;
    Image4: TImage;
    ShadowEffect3: TShadowEffect;
    Label3: TLabel;
    MediaPlayer4: TMediaPlayer;
    VertScrollBox1: TVertScrollBox;
    Layout6: TLayout;
    btnRaca: TRectangle;
    Image6: TImage;
    ShadowEffect5: TShadowEffect;
    Label4: TLabel;
    MediaPlayer5: TMediaPlayer;
    Layout7: TLayout;
    btnCategorias: TRectangle;
    Image7: TImage;
    ShadowEffect6: TShadowEffect;
    Label5: TLabel;
    MediaPlayer6: TMediaPlayer;
    Layout8: TLayout;
    btnProdutores: TRectangle;
    Image8: TImage;
    ShadowEffect8: TShadowEffect;
    Label8: TLabel;
    MediaPlayer7: TMediaPlayer;
    Layout9: TLayout;
    btnRebanho: TRectangle;
    Image9: TImage;
    ShadowEffect9: TShadowEffect;
    Label9: TLabel;
    MediaPlayer8: TMediaPlayer;
    Layout11: TLayout;
    btnBebedouro: TRectangle;
    Image11: TImage;
    ShadowEffect11: TShadowEffect;
    Label11: TLabel;
    MediaPlayer10: TMediaPlayer;
    Layout12: TLayout;
    btnCocho: TRectangle;
    Image12: TImage;
    ShadowEffect12: TShadowEffect;
    Label12: TLabel;
    MediaPlayer11: TMediaPlayer;
    Layout13: TLayout;
    btnLimpaBebedouro: TRectangle;
    Image13: TImage;
    ShadowEffect13: TShadowEffect;
    Label13: TLabel;
    RecMenuAnimais: TRectangle;
    VertScrollBox2: TVertScrollBox;
    Layout15: TLayout;
    Layout16: TLayout;
    Image15: TImage;
    Layout17: TLayout;
    MediaPlayer13: TMediaPlayer;
    Image16: TImage;
    Layout10: TLayout;
    btnBuscaAnimal: TRectangle;
    Image10: TImage;
    ShadowEffect10: TShadowEffect;
    Label10: TLabel;
    MediaPlayer9: TMediaPlayer;
    Layout14: TLayout;
    btnMovAnimal: TRectangle;
    Image14: TImage;
    ShadowEffect14: TShadowEffect;
    Label14: TLabel;
    MediaPlayer12: TMediaPlayer;
    Layout18: TLayout;
    btnAnimais: TRectangle;
    Image17: TImage;
    ShadowEffect15: TShadowEffect;
    Label15: TLabel;
    MediaPlayer14: TMediaPlayer;
    Layout19: TLayout;
    btnNutricao: TRectangle;
    Image18: TImage;
    ShadowEffect16: TShadowEffect;
    Label16: TLabel;
    MediaPlayer15: TMediaPlayer;
    recNutricaoAnimal: TRectangle;
    VertScrollBox3: TVertScrollBox;
    recNutricaoAnimalSub: TLayout;
    Layout21: TLayout;
    Image19: TImage;
    Layout22: TLayout;
    MediaPlayer16: TMediaPlayer;
    Image20: TImage;
    Layout23: TLayout;
    btnFornecimetoSal: TRectangle;
    Image21: TImage;
    ShadowEffect17: TShadowEffect;
    Label17: TLabel;
    MediaPlayer17: TMediaPlayer;
    Layout20: TLayout;
    btnLeituraCocho: TRectangle;
    Image22: TImage;
    ShadowEffect18: TShadowEffect;
    Label18: TLabel;
    MediaPlayer18: TMediaPlayer;
    Layout24: TLayout;
    btnFabricacao: TRectangle;
    Image23: TImage;
    ShadowEffect19: TShadowEffect;
    Label19: TLabel;
    MediaPlayer19: TMediaPlayer;
    imgEdit: TImage;
    Layout25: TLayout;
    btnFornecimento: TRectangle;
    Image24: TImage;
    ShadowEffect20: TShadowEffect;
    Label20: TLabel;
    MediaPlayer20: TMediaPlayer;
    Layout26: TLayout;
    btnDash: TRectangle;
    Image25: TImage;
    ShadowEffect21: TShadowEffect;
    Label21: TLabel;
    MediaPlayer21: TMediaPlayer;
    RecDashBoard: TRectangle;
    VertScrollBox4: TVertScrollBox;
    Layout27: TLayout;
    Layout28: TLayout;
    Image26: TImage;
    Layout29: TLayout;
    MediaPlayer22: TMediaPlayer;
    Image27: TImage;
    Layout30: TLayout;
    btnResumoGeral: TRectangle;
    Image28: TImage;
    ShadowEffect22: TShadowEffect;
    Label22: TLabel;
    MediaPlayer23: TMediaPlayer;
    Layout31: TLayout;
    btnDadosConsumo: TRectangle;
    Image29: TImage;
    ShadowEffect23: TShadowEffect;
    Label23: TLabel;
    MediaPlayer24: TMediaPlayer;
    Layout32: TLayout;
    btnPrevRelForn: TRectangle;
    Image30: TImage;
    ShadowEffect24: TShadowEffect;
    Label24: TLabel;
    MediaPlayer25: TMediaPlayer;
    Layout33: TLayout;
    btnHistSanidade: TRectangle;
    Image31: TImage;
    ShadowEffect25: TShadowEffect;
    Label25: TLabel;
    MediaPlayer26: TMediaPlayer;
    layInferiro: TLayout;
    lblVersao: TLabel;
    imgFarmaco: TImage;
    procedure FormShow(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
    procedure btnConfigMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnSyncMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnConfigMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnSyncMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnConfigClick(Sender: TObject);
    procedure btnSyncClick(Sender: TObject);
    procedure btnCadastrosClick(Sender: TObject);
    procedure imgFechaMnuCadClick(Sender: TObject);
    procedure btnCadCurraisClick(Sender: TObject);
    procedure btnAlimentosClick(Sender: TObject);
    procedure btnRacaClick(Sender: TObject);
    procedure btnCategoriasClick(Sender: TObject);
    procedure btnProdutoresClick(Sender: TObject);
    procedure btnRebanhoClick(Sender: TObject);
    procedure btnBuscaAnimalClick(Sender: TObject);
    procedure btnBebedouroClick(Sender: TObject);
    procedure btnCochoClick(Sender: TObject);
    procedure btnLimpaBebedouroClick(Sender: TObject);
    procedure btnAnimaisClick(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure btnMovAnimalClick(Sender: TObject);
    procedure btnFornecimetoSalClick(Sender: TObject);
    procedure btnNutricaoClick(Sender: TObject);
    procedure Image19Click(Sender: TObject);
    procedure btnLeituraCochoClick(Sender: TObject);
    procedure btnFabricacaoClick(Sender: TObject);
    procedure btnDadosConsumoClick(Sender: TObject);
    procedure Image26Click(Sender: TObject);
    procedure btnDashClick(Sender: TObject);
    procedure btnFornecimentoClick(Sender: TObject);
    procedure btnResumoGeralClick(Sender: TObject);
    procedure btnPrevRelFornClick(Sender: TObject);
    procedure btnHistSanidadeClick(Sender: TObject);
  private
    { Private declarations }
  public
   vPrimeiroAcesso:Boolean;
   procedure MostraMenu;
   {$IF DEFINED(iOS) or DEFINED(ANDROID)}
     function GetVersaoArq: string;
   {$ENDIF}
   {$IFDEF MSWINDOWS}
     function  GetVersaoArqWin:string;
   {$ENDIF}
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses UDmDB, UdmSync, UCurrais, UFrameListaAlimentos, UAlimento, UFrameRaca,
  UListRaca, UFrameCategoria, UFrameLista, UListCategoria, UListProdutores,
  UListRebanho, UFrameAnimal, UListAnimal, UFrameBebedouro, UListBebedouro,
  UFrameCocho, UListCocho, UFrameRebanho, UFrameProdutores,
  UFrameLimpaBebedouro, ULimpaBebedouro, UdmSyncUp, UListMotivoMov, UMovAnimal,
  UFornMineral, UFrameLeituraCocho, ULeituraCocho, UFabricacao, UFornecimento,
  UDMDashBoard, UDashBoard,UHistSanidade;

procedure TfrmPrincipal.MostraMenu;
begin
  btnConfig.Width          := (frmPrincipal.Width/2)-20;
  btnSync.Width            := (frmPrincipal.Width/2)-20;
end;



procedure TfrmPrincipal.btnCadCurraisClick(Sender: TObject);
begin
 frmListaCurrais:= TfrmListaCurrais.Create(nil);
 frmListaCurrais.vFiltro :='';
 frmListaCurrais.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnCategoriasClick(Sender: TObject);
begin
 frmListCategoria:= TfrmListCategoria.Create(nil);
 frmListCategoria.vFiltro :='';
 frmListCategoria.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnCloseAllClick(Sender: TObject);
begin
  MessageDlg('Deseja realmente sair do aplicativo?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
//     SharedActivity.finish;
     Close;
   end);
end;

procedure TfrmPrincipal.btnCochoClick(Sender: TObject);
begin
 frmListCocho:= TfrmListCocho.Create(nil);
 frmListCocho.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnConfigClick(Sender: TObject);
begin
  dmdb.qryConfig.Close;
  dmdb.qryConfig.Open;
  frameConfig1.edtIpServidor.Text    := dmdb.qryConfigIP_SERVIDOR.AsString;
  frameConfig1.edtPortaServidor.Text := dmdb.qryConfigPOTA_SERVIDOR.AsString;
  frameConfig1.Visible := true;
end;

procedure TfrmPrincipal.btnConfigMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
    TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmPrincipal.btnConfigMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
    TRectangle(sender).Opacity := 1;
end;

procedure TfrmPrincipal.btnDadosConsumoClick(Sender: TObject);
begin
 if Not Assigned(frmDashBoard) then
   Application.CreateForm(TfrmDashBoard, frmDashBoard);
   frmDashBoard.vTabInex :=1;
  frmDashBoard.ShowModal(procedure(ModalResult: TModalResult)
  begin
  end);
end;

procedure TfrmPrincipal.btnDashClick(Sender: TObject);
begin
 RecDashBoard.Visible   := true;
end;

procedure TfrmPrincipal.btnFabricacaoClick(Sender: TObject);
begin
  if Not Assigned(frmFabricacao) then
   Application.CreateForm(TfrmFabricacao,frmFabricacao);
  frmFabricacao.ShowModal(procedure(ModalResult: TModalResult)
  begin
     recNutricaoAnimal.Visible := false;
  end);
end;

procedure TfrmPrincipal.btnFornecimentoClick(Sender: TObject);
begin
  if Not Assigned(frmFornecimento) then
   Application.CreateForm(TfrmFornecimento,frmFornecimento);
  frmFornecimento.ShowModal(procedure(ModalResult: TModalResult)
  begin
     recNutricaoAnimal.Visible := false;
  end);
end;

procedure TfrmPrincipal.btnFornecimetoSalClick(Sender: TObject);
begin
 if Not Assigned(frmFornMineral) then
   Application.CreateForm(TfrmFornMineral, frmFornMineral);
  frmFornMineral.ShowModal(procedure(ModalResult: TModalResult)
  begin
     recNutricaoAnimal.Visible := false;
  end);
end;

procedure TfrmPrincipal.btnHistSanidadeClick(Sender: TObject);
begin
 if Not Assigned(frmHistSanidade) then
   Application.CreateForm(TfrmHistSanidade, frmHistSanidade);
  frmHistSanidade.ShowModal(procedure(ModalResult: TModalResult)
  begin
  end);
end;

procedure TfrmPrincipal.btnLeituraCochoClick(Sender: TObject);
begin
  if Not Assigned(frmLeituraCocho) then
   Application.CreateForm(TfrmLeituraCocho,frmLeituraCocho);
  frmLeituraCocho.ShowModal(procedure(ModalResult: TModalResult)
  begin
     recNutricaoAnimal.Visible := false;
  end);
end;

procedure TfrmPrincipal.btnLimpaBebedouroClick(Sender: TObject);
begin
 frmLimpaBebedouro:= TfrmLimpaBebedouro.Create(nil);
 frmLimpaBebedouro.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnMovAnimalClick(Sender: TObject);
begin
 frmMovAnimal:= TfrmMovAnimal.Create(nil);
 frmMovAnimal.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnNutricaoClick(Sender: TObject);
begin
   recNutricaoAnimal.Visible := true;
end;

procedure TfrmPrincipal.btnPrevRelFornClick(Sender: TObject);
begin
  if Not Assigned(frmDashBoard) then
   Application.CreateForm(TfrmDashBoard, frmDashBoard);
   frmDashBoard.vTabInex :=2;
  frmDashBoard.ShowModal(procedure(ModalResult: TModalResult)
  begin
  end);
end;

procedure TfrmPrincipal.btnProdutoresClick(Sender: TObject);
begin
 frmListProdutores:= TfrmListProdutores.Create(nil);
 frmListProdutores.vFiltro :='';
 frmListProdutores.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnRacaClick(Sender: TObject);
begin
 frmListRaca:= TfrmListRaca.Create(nil);
 frmListRaca.vFiltro :='';
 frmListRaca.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnRebanhoClick(Sender: TObject);
begin
 frmListRebanho:= TfrmListRebanho.Create(nil);
 frmListRebanho.vFiltro :='';
 frmListRebanho.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnResumoGeralClick(Sender: TObject);
begin
if Not Assigned(frmDashBoard) then
   Application.CreateForm(TfrmDashBoard, frmDashBoard);
   frmDashBoard.vTabInex :=0;
  frmDashBoard.ShowModal(procedure(ModalResult: TModalResult)
  begin
  end);
end;

procedure TfrmPrincipal.btnAlimentosClick(Sender: TObject);
begin
 frmListaAlimentos:= TfrmListaAlimentos.Create(nil);
 frmListaAlimentos.vFiltro :='';
 frmListaAlimentos.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnAnimaisClick(Sender: TObject);
begin
  RecMenuAnimais.Visible := true;
end;

procedure TfrmPrincipal.btnBebedouroClick(Sender: TObject);
begin
 frmListBebedouro:= TfrmListBebedouro.Create(nil);
 frmListBebedouro.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnBuscaAnimalClick(Sender: TObject);
begin
  if Not Assigned(frmListAnimal) then
   Application.CreateForm(TfrmListAnimal, frmListAnimal);
  frmListAnimal.ShowModal(procedure(ModalResult: TModalResult)
  begin
  end);
end;

procedure TfrmPrincipal.btnCadastrosClick(Sender: TObject);
begin
 recSubMnuCad.Visible := true;
end;

procedure TfrmPrincipal.btnSyncClick(Sender: TObject);
begin
 FrameSync1.btnEnviar.Width := (FrameSync1.Width-20)/2;
 FrameSync1.btnBaixar.Width := (FrameSync1.Width-20)/2;
 FrameSync1.layOpcBaixar.Visible := false;
 dmSyncUP.LIMPEZABEBEDOURO.Close;
 dmSyncUP.LIMPEZABEBEDOURO.Open;
 FrameSync1.lblLimpezaSync.Text :='Limpeza Bebedouro:'+intToStr(dmSyncUP.LIMPEZABEBEDOURO.RecordCount);

 dmSyncUP.MOVIMENTACAO_ANIMAL.Close;
 dmSyncUP.MOVIMENTACAO_ANIMAL.Open;
 FrameSync1.lblMovAnimal.Text :='Mov. Animal:'+intToStr(dmSyncUP.MOVIMENTACAO_ANIMAL.RecordCount);

 dmSyncUP.FORNECIMENTO.Close;
 dmSyncUP.FORNECIMENTO.Open;
 FrameSync1.lblFornMineral.Text :='Fornecimento Sal:'+intToStr(dmSyncUP.FORNECIMENTO.RecordCount);

 dmSyncUP.FORNECIMENTO_CONF.Close;
 dmSyncUP.FORNECIMENTO_CONF.Open;
 FrameSync1.lblFornConfinamento.Text :='Fornecimento Conf.:'+intToStr(dmSyncUP.FORNECIMENTO_CONF.RecordCount);

 dmSyncUP.FABRICACAO.Close;
 dmSyncUP.FABRICACAO.Open;
 FrameSync1.lblFabricacao.Text :='Fabricação :'+intToStr(dmSyncUP.FABRICACAO.RecordCount);

 dmSyncUP.LEITURA_COCHO.Close;
 dmSyncUP.LEITURA_COCHO.Open;
 FrameSync1.lblLeituraCocho.Text :='Leitura de Cocho :'+intToStr(dmSyncUP.LEITURA_COCHO.RecordCount);

 dmSyncUP.ANIMAL_SANIDADE.Close;
 dmSyncUP.ANIMAL_SANIDADE.Open;
 FrameSync1.lblSanidade.Text :='Sanidade :'+intToStr(dmSyncUP.ANIMAL_SANIDADE.RecordCount);

 FrameSync1.Visible := true;
end;

procedure TfrmPrincipal.btnSyncMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
    TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmPrincipal.btnSyncMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
   TRectangle(sender).Opacity := 1;
end;

{$IFDEF MSWINDOWS}
function TfrmPrincipal.GetVersaoArqWin: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(
  ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0,
  VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue),
  VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(
    dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(
    dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(
    dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;
{$ENDIF}

{$IF DEFINED(iOS) or DEFINED(ANDROID)}
function TfrmPrincipal.GetVersaoArq: string;
var
 PKGInfo:JPackageInfo;
begin
 PKGInfo := SharedActivity.getPackageManager.getPackageInfo(
   SharedActivity.getPackageName,0);
 result := JStringToString(PKGInfo.VersionName)
end;
{$ENDIF}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
 {$IFDEF MSWINDOWS}
  lblversao.text                 := GetVersaoArqWin;
 {$ENDIF}
 {$IF DEFINED(iOS) or DEFINED(ANDROID)}
  lblversao.text                 := GetVersaoArq;
//  dmdb.CreateTablesVersao(GetVersaoArq);
 {$ENDIF}
 recNutricaoAnimal.Visible := false;
 RecMenuAnimais.Visible := false;
 recSubMnuCad.Visible   := false;
 RecPrincipal.Visible   := false;
 RecDashBoard.Visible   := false;
 dmdb.qryConfig.Close;
 dmdb.qryConfig.Open;
   if dmDB.VerificaTabelaVazia('users') then
   begin
     vPrimeiroAcesso        := true;
     dmDB.qryConfig.Edit;

     frameConfig1.Visible := true;
     frameConfig1.edtIPServidor.Text     := dmDB.qryConfigIP_SERVIDOR.AsString;
     frameConfig1.edtPortaServidor.Text  := dmDB.qryConfigPOTA_SERVIDOR.AsString;
   end
   else
   begin
     dmdb.PROPRIEDADES.Close;
     dmdb.PROPRIEDADES.Open;
     vPrimeiroAcesso           := false;
     dmDB.ReadAccess;
     if dmDB.qryConfigSalvarLogin.AsInteger=1 then
     begin
      frmeLogin1.chkSalvaSenha.IsChecked := true;
      dmDB.qryControAcces.Close;
      dmDB.qryControAcces.Open;
      if not dmDB.qryControAcces.IsEmpty then
      begin
       frmeLogin1.edtUsuario.Text := dmDB.qryControAccesUsuario.AsString;
       frmeLogin1.edtSenha.Text   := dmDB.qryControAccesSenha.AsString;
      end;
     end
     else
      frmeLogin1.chkSalvaSenha.IsChecked := false;
     frmeLogin1.Visible        := true;
     frmeLogin1.edtUsuario.SetFocus;

   end;
end;

procedure TfrmPrincipal.Image15Click(Sender: TObject);
begin
 RecMenuAnimais.Visible := false;
end;

procedure TfrmPrincipal.Image19Click(Sender: TObject);
begin
  recNutricaoAnimal.Visible := false;
end;

procedure TfrmPrincipal.Image26Click(Sender: TObject);
begin
 RecDashBoard.Visible := false;
end;

procedure TfrmPrincipal.imgFechaMnuCadClick(Sender: TObject);
begin
 recSubMnuCad.Visible := false;
end;

end.
