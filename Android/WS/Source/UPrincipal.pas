unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  Horse,
  Horse.Jhonson,
  System.JSON, Horse.HandleException,Winapi.Windows, FireDAC.Phys.PGDef,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.PG, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client,System.Json.writers,System.IniFiles,System.JSON.Types,
  IdBaseComponent, IdComponent, IdIPWatch,Horse.BasicAuthentication,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FMX.Memo.Types,
  FMX.Edit, FMX.Layouts,DateUtils;
type
  TfrmPrincipal = class(TForm)
    FCon: TFDConnection;
    ToolBar1: TToolBar;
    lblDB: TLabel;
    IdIPWatch1: TIdIPWatch;
    Rectangle1: TRectangle;
    btnFechar: TImage;
    lblWS: TLabel;
    Rectangle2: TRectangle;
    Image1: TImage;
    mlog: TMemo;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    layKeyTotal: TLayout;
    Rectangle20: TRectangle;
    layKey: TLayout;
    Rectangle21: TRectangle;
    Rectangle22: TRectangle;
    Image77: TImage;
    Layout102: TLayout;
    Layout103: TLayout;
    Rectangle31: TRectangle;
    Label15: TLabel;
    edtSerialHD: TEdit;
    Rectangle32: TRectangle;
    Label17: TLabel;
    edtKey: TEdit;
    Layout104: TLayout;
    Layout105: TLayout;
    btnValidaKey: TRectangle;
    Layout106: TLayout;
    Image78: TImage;
    Label18: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnValidaKeyClick(Sender: TObject);
  private
    function GetVersaoArq: string;
    function  ValidaKey(Serial,Chave: String): Boolean;
    function  ValidadeKey(Chave: String): Tdate;
    function  GetIdeDiskSerialNumber : String;
    Function  SerialNum(FDrive:String) :String;
    procedure ChangeByteOrder(var Data; Size: Integer);
  public
    { Public declarations }
    vDataKey:string;
    DataKey : TDate;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses UDmDB;

procedure TfrmPrincipal.btnValidaKeyClick(Sender: TObject);
begin
 if ValidaKey(edtSerialHD.Text,edtKey.Text) then
  begin
    ShowMessage('Chave Validada com Sucesso!');
    layKeyTotal.Visible    := false;
  end
  else
  begin
    ShowMessage('Chave Invalida!');
    Exit;
  end;
end;

procedure TfrmPrincipal.ChangeByteOrder(var Data; Size: Integer);
var
  ptr : PChar;
  i : Integer;
  c : Char;
begin
  ptr := @Data;
  for i := 0 to (Size shr 1)-1 do
  begin
    c := ptr^;
    ptr^ := (ptr+1)^;
    (ptr+1)^ := c;
    Inc(ptr,2);
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
 //VALIDA LICENÇA
  dmDB.Tablekey.Close;
  dmDB.Tablekey.Open;
  dmDB.Tablekey.Filtered:= false;
  dmDB.Tablekey.Filter  := 'STATUS=1';
  dmDB.Tablekey.Filtered:= true;
  if dmDB.Tablekey.IsEmpty then
  begin
   ShowMessage('Informe a Licença de Uso do sistema!');
   edtSerialHD.Text := SerialNum('C');
   layKeyTotal.Visible := true;
   Exit;
  end
  else
  begin
    DataKey := ValidadeKey(dmDB.TablekeyKEY.AsString);
    if DataKey<date then
    begin
      ShowMessage('Licença Vencida em :'+DateToStr(DataKey)+' Dias');
      edtSerialHD.Text := SerialNum('C');
      layKeyTotal.Visible := true;
      Exit;
    end
    else
    begin
      if DaysBetween(date,DataKey)<=5 then
      begin
       if DaysBetween(date,DataKey)>0 then
        ShowMessage('Falta :'+intToStr(DaysBetween(date,DataKey))+' para vencer sua licença!')
       else
        ShowMessage('Sua Licença expira amanha, entre em contato com suporte.')
      end;
    end;
  end;
  //VALIDA LICENÇA END


 mlog.Lines.Clear;
 try
  if dmDB.ConectaBD then
   mlog.Lines.Add('Conectado com sucesso!')
  else
   mlog.Lines.Add('Erro ao Conectar ao banco!')
 except
  on E : Exception do
      mlog.Lines.Add('Erro ao Conectar ao banco : '+E.Message);
 end;
   THorse.Use(Jhonson);
   THorse.Use(HorseBasicAuthentication(
   function(const AUsername, APassword: string): Boolean
    begin
      Result := AUsername.Equals('fuelmanage') and APassword.Equals('991528798');
    end)
   );
  THorse.Use(HandleException);
  THorse.Get('/ping',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
    Res.Send('pong');
  end);
  THorse.Listen(8089, procedure(Horse: THorse)
  begin
    lblWS.Text := ('FieldPec Mobile Rodando no ip:'+
     IdIPWatch1.LocalIP+' na porta: ' + Horse.Port.ToString+' Versão:'+
      GetVersaoArq);
    Application.ProcessMessages;
  end);

  THorse.Get('/GetTesteServidor',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Testando Servidor');
     try
      Res.Send<TJSONObject>(dmDB.GetTestaServidor);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/USERS',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Usuarios');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.USERS));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/PROPRIEDADES',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Propriedades');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.PROPRIEDADES));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.post('/CURRAIS',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Currais');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGenericPostPropriedade(dmDB.CURRAIS,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.post('/BEBEDOURO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Bebedouro');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGenericPostPropriedade(dmDB.BEBEDOURO,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.post('/COCHO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Cocho');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGenericPostPropriedade(dmDB.COCHO,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  THorse.Get('/AUX_MOTIVO_MOVIMENTACAO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Motivo Movimentação');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.AUX_MOTIVO_MOVIMENTACAO));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);
  
  THorse.post('/ANIMAL',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando ANIMAL');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetAnimaisPostPropriedade(dmDB.ANIMAL,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.post('/HIST_SANIDADE',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando HIST SANIDADE');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetHistSanidadePostPropriedade(dmDB.HIST_SANIDADE,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);


  THorse.Get('/ALIMENTO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando ALIMENTOS');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.ALIMENTO));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/RACA',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando RACA');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.RACA));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/CATEGORIA_PADRAO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando CATEGORIA PADRAO');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.CATEGORIA_PADRAO));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/CATEGORIAS',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando CATEGORIAS');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.CATEGORIAS));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/PRODUTORES',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando PRODUTORES');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.PRODUTORES));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/AUX_REBANHO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando REBANHO');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.AUX_REBANHO));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/SUPLEMENTO_MINERAL',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Suplemento Mineral');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.SUPLEMENTO_MINERAL));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/AUX_NOTAS_LEITURA',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Nota de Leitura');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.AUX_NOTAS_LEITURA));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.post('/LOTE_NUTRICIONAL',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : LOTE NUTRICIONAL');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGenericPostPropriedade(dmDB.LOTE_NUTRICIONAL,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);


  THorse.post('/HIST_LEITURA_COCHO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : HISTORICO LEITURA');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGenericPostPropriedade(dmDB.HIST_LEITURA_COCHO,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.post('/HIST_CONSUMO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : HISTORICO CONSUMO');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGenericPostPropriedade(dmDB.HIST_CONSUMO,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/RACAO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' :  RACAO');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.RACAO));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/RACAOINSUMOS',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' :  RACAO INSUMOS');
     try
     Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.RACAOINSUMOS));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Post('/FORNECIMENTO_PREVISTO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : FORNECIMENTO PREVISTO');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGenericPostPropriedade(dmDB.FORNECIMENTO_PREVISTO,LBody));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/FARMACO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : FARMACO');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.FARMACO));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/PROTOCOLO_SANITARIO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : PROTOCOLO SANITARIO');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.PROTOCOLO_SANITARIO));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/PROTOCOLO_FARMACOS',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody: TJSONObject;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : PROTOCOLO FARMACOS');
     LBody := Req.Body<TJSONObject>;
     try
      Res.Send<TJSONObject>(dmDB.GetGeneric(dmDB.PROTOCOLO_FARMACOS));
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

//****************Post********************************************************

  THorse.Post('/ANIMAL_SANIDADE',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Sanidade');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmDB.AcceptSanidade(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Post('/LIMPEZABEBEDOURO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Limpeza Bebedouro');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmDB.AcceptLimpezaBebedouro(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Post('/MOVIMENTACAO_ANIMAL',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Movimentacao Animal');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmDB.AcceptMovAnimal(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Post('/FORNECIMENTO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Fornecimento Mineral');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmDB.AcceptFornecimento(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Post('/LEITURA_COCHO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Leitura de Cocho');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmDB.AcceptLeituraCocho(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Post('/FABRICACAO',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Fabricacao');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmDB.AcceptFabricacao(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Post('/FABRICACAO_INSUMOS',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Fabricacao');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmDB.AcceptFabricacaoInsumos(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Post('/FORNECIMENTO_CONF',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Fornecimento');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmDB.AcceptFornecimentoConf(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

end;

function TfrmPrincipal.GetIdeDiskSerialNumber: String;
type
    TSrbIoControl = packed record
      HeaderLength: ULONG;
      Signature: Array[0..7] of Char;
      Timeout: ULONG;
      ControlCode: ULONG;
      ReturnCode: ULONG;
      Length: ULONG;
   end;
   SRB_IO_CONTROL = TSrbIoControl;
   PSrbIoControl = ^TSrbIoControl;

    TIDERegs = packed record
      bFeaturesReg : Byte;
      bSectorCountReg : Byte;
      bSectorNumberReg : Byte;
      bCylLowReg : Byte;
      bCylHighReg : Byte;
      bDriveHeadReg : Byte;
      bCommandReg : Byte;
      bReserved : Byte;
   end;
    IDEREGS = TIDERegs;
    PIDERegs = ^TIDERegs;

   TSendCmdInParams = packed record
      cBufferSize : DWORD;
      irDriveRegs : TIDERegs;
      bDriveNumber : Byte;
      bReserved : Array[0..2] of Byte;
      dwReserved : Array[0..3] of DWORD;
      bBuffer : Array[0..0] of Byte;
    end;
    SENDCMDINPARAMS = TSendCmdInParams;
    PSendCmdInParams = ^TSendCmdInParams;

    TIdSector = packed record
      wGenConfig : Word;
      wNumCyls : Word;
      wReserved : Word;
      wNumHeads : Word;
      wBytesPerTrack : Word;
      wBytesPerSector : Word;
      wSectorsPerTrack : Word;
      wVendorUnique : Array[0..2] of Word;
      sSerialNumber : Array[0..19] of Char;
      wBufferType : Word;
      wBufferSize : Word;
      wECCSize : Word;
      sFirmwareRev : Array[0..7] of Char;
      sModelNumber : Array[0..39] of Char;
      wMoreVendorUnique : Word;
      wDoubleWordIO : Word;
      wCapabilities : Word;
      wReserved1 : Word;
      wPIOTiming : Word;
      wDMATiming : Word;
      wBS : Word;
      wNumCurrentCyls : Word;
      wNumCurrentHeads : Word;
      wNumCurrentSectorsPerTrack : Word;
      ulCurrentSectorCapacity : ULONG;
      wMultSectorStuff : Word;
      ulTotalAddressableSectors : ULONG;
      wSingleWordDMA : Word;
      wMultiWordDMA : Word;
      bReserved : Array[0..127] of Byte;
    end;
    PIdSector = ^TIdSector;

  const
    IDE_ID_FUNCTION = $EC;
    IDENTIFY_BUFFER_SIZE = 512;
    DFP_RECEIVE_DRIVE_DATA = $0007c088;
    IOCTL_SCSI_MINIPORT = $0004d008;
    IOCTL_SCSI_MINIPORT_IDENTIFY = $001b0501;
    DataSize = sizeof(TSendCmdInParams)-1+IDENTIFY_BUFFER_SIZE;
    BufferSize = SizeOf(SRB_IO_CONTROL)+DataSize;
    W9xBufferSize = IDENTIFY_BUFFER_SIZE+16;
  var
    hDevice : THandle;
    cbBytesReturned : DWORD;
    pInData : PSendCmdInParams;
    pOutData : Pointer;
    Buffer : Array[0..BufferSize-1] of Byte;
    srbControl : TSrbIoControl absolute Buffer;

  begin
    Result := '';
    FillChar(Buffer,BufferSize,#0);
    if Win32Platform=VER_PLATFORM_WIN32_NT then
    begin
      hDevice := CreateFile('\\.\Scsi0:',
      GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE,  nil, OPEN_EXISTING, 0, 0);
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
        srbControl.HeaderLength := SizeOf(SRB_IO_CONTROL);
        System.Move('SCSIDISK',srbControl.Signature,8);
        srbControl.Timeout := 2;
        srbControl.Length := DataSize;
        srbControl.ControlCode := IOCTL_SCSI_MINIPORT_IDENTIFY;
        pInData := PSendCmdInParams(PChar(@Buffer)
        +SizeOf(SRB_IO_CONTROL));
        pOutData := pInData;
       with pInData^ do
       begin
         cBufferSize := IDENTIFY_BUFFER_SIZE;
         bDriveNumber := 0;
         with irDriveRegs do
         begin
           bFeaturesReg := 0;
           bSectorCountReg := 1;
           bSectorNumberReg := 1;
           bCylLowReg := 0;
           bCylHighReg := 0;
           bDriveHeadReg := $A0;
           bCommandReg := IDE_ID_FUNCTION;
         end;
      end;
      if not DeviceIoControl( hDevice, IOCTL_SCSI_MINIPORT, @Buffer, BufferSize, @Buffer, BufferSize, cbBytesReturned, nil ) then Exit;
     finally
       CloseHandle(hDevice);
     end;
   end
   else
   begin
      hDevice := CreateFile( '\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0 );
      if hDevice=INVALID_HANDLE_VALUE then Exit;
      try
        pInData := PSendCmdInParams(@Buffer);
        pOutData := @pInData^.bBuffer;
        with pInData^ do
        begin
           cBufferSize := IDENTIFY_BUFFER_SIZE;
           bDriveNumber := 0;
           with irDriveRegs do
           begin
             bFeaturesReg := 0;
             bSectorCountReg := 1;
             bSectorNumberReg := 1;
             bCylLowReg := 0;
             bCylHighReg := 0;
             bDriveHeadReg := $A0;
             bCommandReg := IDE_ID_FUNCTION;
           end;
         end;
         if not DeviceIoControl( hDevice, DFP_RECEIVE_DRIVE_DATA, pInData, SizeOf(TSendCmdInParams)-1, pOutData, W9xBufferSize, cbBytesReturned, nil ) then Exit;
        finally
          CloseHandle(hDevice);
        end;
     end;
     with PIdSector(PChar(pOutData)+16)^ do
     begin
        ChangeByteOrder(sSerialNumber,SizeOf(sSerialNumber));
        SetString(Result,sSerialNumber,SizeOf(sSerialNumber));
     end;
end;

function TfrmPrincipal.GetVersaoArq: string;
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

function TfrmPrincipal.SerialNum(FDrive: String): String;
var
  Serial:DWord;
  DirLen,Flags: DWord;
  DLabel : Array[0..11] of Char;
begin
 Try
  GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
  Result := IntToHex(Serial,8);
 Except
  Result :='';
 end;
end;

function TfrmPrincipal.ValidadeKey(Chave: String): Tdate;
var
 Data,
 Dias,
 Dia,Mes,Ano,vData,Sistema,vSerial:string;
begin
  if Chave.Length>10 then
  begin
    vSerial := copy(Chave,0,pos('SE',Chave)-1);
    Data   := copy(Chave,(pos('SE',Chave)+2),8);
    Dias   := copy(Chave,pos('SE',Chave)+10,4);
    Sistema:= copy(Chave,pos('SE',Chave)+14,1);
    Dia :=(copy(Data,7,2));
    Mes :=(copy(Data,5,2));
    Ano :=(copy(Data,0,4));
    Result :=strToDate(Dia+'/'+Mes+'/'+Ano);
  end;
end;

function TfrmPrincipal.ValidaKey(Serial, Chave: String): Boolean;
var
 Data,
 Dias,
 Dia,Mes,Ano,vData,Sistema,vSerial:string;
begin
  if Chave.Length>10 then
  begin
    vSerial := copy(Chave,0,pos('SE',Chave)-1);
    Data   := copy(Chave,(pos('SE',Chave)+2),8);
    Dias   := copy(Chave,pos('SE',Chave)+10,4);
    Sistema:= copy(Chave,pos('SE',Chave)+14,1);
  end;
  if not dmDB.ValidaLicencaJaUsada(Chave) then
  begin
   Result:= false;
   Exit;
  end;

  if UpperCase(Serial)<>UpperCase(vSerial) then
    Result := false
  else
   if Sistema<>'0' then
    Result := false
  else
   if(Dias.Length=0) or (Dias='0') then
    Result := false
  else
  begin
     Dia :=(copy(Data,7,2));
     Mes :=(copy(Data,5,2));
     Ano :=(copy(Data,0,4));
     vDataKey:=Dia+'/'+Mes+'/'+Ano;
     dmDB.InativaKey;
     dmDB.Tablekey.Insert;
     dmDB.TablekeyKEY.AsString      := Chave;
     try
       dmDB.Tablekey.ApplyUpdates(-1);
      except
       on E : Exception do
       begin
         ShowMessage('Exception message = '+E.Message);
       end;
     end;
     Result := true;
  end;
end;

end.
