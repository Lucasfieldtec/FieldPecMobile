unit UDmDB;

interface

uses
  System.SysUtils, System.Classes, System.Json,
  vcl.Forms, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin,
  System.Json.writers,System.JSON.Types, FireDAC.Phys.PGDef, FireDAC.Phys.PG,
  FireDAC.Phys.ODBCBase,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef,System.IniFiles, FireDAC.FMXUI.Wait,FMX.Dialogs,
  FireDAC.Phys.IBBase,IdSSLOpenSSL,IdSMTP,IdMessage,IdText,IdExplicitTLSClientServerBase,
  IdAttachmentFile, FireDAC.Comp.BatchMove,System.Variants, FireDAC.Comp.BatchMove.JSON,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  System.Net.HttpClient,FMX.Types,System.Net.URLClient,
  System.Net.HttpClientComponent, FireDAC.ConsoleUI.Wait,FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Script,IdHashMessageDigest,
  FireDAC.Phys.SQLiteWrapper.Stat;


type
  TdmDB = class(TDataModule)
    USERS: TFDQuery;
    PROPRIEDADES: TFDQuery;
    CURRAIS: TFDQuery;
    ALIMENTO: TFDQuery;
    RACA: TFDQuery;
    CATEGORIAS: TFDQuery;
    CATEGORIA_PADRAO: TFDQuery;
    PRODUTORES: TFDQuery;
    AUX_REBANHO: TFDQuery;
    ANIMAL: TFDQuery;
    ANIMALINSERTINTO: TStringField;
    ANIMALID_PROPRIEDADE: TIntegerField;
    BEBEDOURO: TFDQuery;
    COCHO: TFDQuery;
    LIMPEZABEBEDOURO: TFDQuery;
    LIMPEZABEBEDOUROID: TFDAutoIncField;
    LIMPEZABEBEDOUROID_BEBEDOURO: TIntegerField;
    LIMPEZABEBEDOUROID_RESPOPNSAVEL: TIntegerField;
    LIMPEZABEBEDOURODATA: TDateField;
    LIMPEZABEBEDOUROOBSERVACAO: TStringField;
    LIMPEZABEBEDOURODATAREG: TSQLTimeStampField;
    LIMPEZABEBEDOUROSTATUS: TIntegerField;
    LIMPEZABEBEDOUROID_USUARIO: TIntegerField;
    LIMPEZABEBEDOUROHORA: TTimeField;
    LIMPEZABEBEDOUROLATITUDE: TStringField;
    LIMPEZABEBEDOUROLONGITUDE: TStringField;
    AUX_MOTIVO_MOVIMENTACAO: TFDQuery;
    MOVIMENTACAO_ANIMAL: TFDQuery;
    qryInsert: TFDQuery;
    SUPLEMENTO_MINERAL: TFDQuery;
    FORNECIMENTO: TFDQuery;
    FORNECIMENTOID: TIntegerField;
    FORNECIMENTOID_PASTO: TIntegerField;
    FORNECIMENTOID_PRODUTO: TIntegerField;
    FORNECIMENTODATA_FORNECIMENTO: TDateField;
    FORNECIMENTOPREVISAO_KG: TFMTBCDField;
    FORNECIMENTOPREVISTO_SACO: TFMTBCDField;
    FORNECIMENTOREALIZADO_COCHO_KG: TFMTBCDField;
    FORNECIMENTOREALIZADO_COCHO_SACO: TFMTBCDField;
    FORNECIMENTOREALIZADO_ESTOQUE_KG: TFMTBCDField;
    FORNECIMENTOREALIZADO_ESTOQUE_SACO: TFMTBCDField;
    FORNECIMENTOID_USUARIO: TIntegerField;
    FORNECIMENTODATA_REG: TSQLTimeStampField;
    FORNECIMENTOSTATUS: TIntegerField;
    FORNECIMENTOTIPO_FORNE: TStringField;
    FORNECIMENTOTAG_COCHO: TStringField;
    FORNECIMENTOLATITUDE: TStringField;
    FORNECIMENTOLONGITUDE: TStringField;
    FORNECIMENTOID_RESPONSAVEL: TIntegerField;
    FORNECIMENTOID_COCHO: TIntegerField;
    FORNECIMENTOQTD_ANIMAIS: TIntegerField;
    FORNECIMENTOVALOR_KG: TFMTBCDField;
    FORNECIMENTOESTOQUE_ORIGEM: TIntegerField;
    HIST_LEITURA_COCHO: TFDQuery;
    LEITURA_COCHO: TFDQuery;
    LOTE_NUTRICIONAL: TFDQuery;
    HIST_LEITURA_COCHOID_LOTE: TIntegerField;
    HIST_LEITURA_COCHOID_CURRAL: TIntegerField;
    HIST_LEITURA_COCHODATA_LEITURA: TDateField;
    HIST_LEITURA_COCHONOTA: TFMTBCDField;
    HIST_LEITURA_COCHOAJUSTE: TFMTBCDField;
    HIST_LEITURA_COCHOID_PROPRIEDADE: TIntegerField;
    HIST_LEITURA_COCHOID: TIntegerField;
    AUX_NOTAS_LEITURA: TFDQuery;
    AUX_NOTAS_LEITURAID: TIntegerField;
    AUX_NOTAS_LEITURANOTA: TFMTBCDField;
    AUX_NOTAS_LEITURAAJUSTE: TFMTBCDField;
    HIST_CONSUMO: TFDQuery;
    HIST_CONSUMOID_LOTE: TIntegerField;
    HIST_CONSUMODATA_CONSUMO: TDateField;
    HIST_CONSUMOMN: TFMTBCDField;
    HIST_CONSUMOMS: TFMTBCDField;
    LEITURA_COCHOID: TIntegerField;
    LEITURA_COCHOID_LOTE: TIntegerField;
    LEITURA_COCHOID_CURRAL: TIntegerField;
    LEITURA_COCHODATA_LEITURA: TDateField;
    LEITURA_COCHONOTA: TFMTBCDField;
    LEITURA_COCHOAJUSTE: TFMTBCDField;
    LEITURA_COCHOID_USUARIO: TIntegerField;
    LEITURA_COCHOID_USUARIO_ALTERCAO: TIntegerField;
    LEITURA_COCHODATA_ALTERACAO: TSQLTimeStampField;
    LEITURA_COCHODATAREG: TSQLTimeStampField;
    LEITURA_COCHOSTATUS: TIntegerField;
    RACAO: TFDQuery;
    RACAOINSUMOS: TFDQuery;
    FABRICACAO: TFDQuery;
    FABRICACAO_INSUMOS: TFDQuery;
    FORNECIMENTO_CONF: TFDQuery;
    FORNECIMENTO_PREVISTO: TFDQuery;
    FORNECIMENTO_CONFID: TIntegerField;
    FORNECIMENTO_CONFID_LOTE: TIntegerField;
    FORNECIMENTO_CONFID_LOCAL: TIntegerField;
    FORNECIMENTO_CONFQTD_CAB: TIntegerField;
    FORNECIMENTO_CONFMEDIA_PESO: TFMTBCDField;
    FORNECIMENTO_CONFDATA_FORN: TDateField;
    FORNECIMENTO_CONFHORA_FORN: TTimeField;
    FORNECIMENTO_CONFTRATO: TIntegerField;
    FORNECIMENTO_CONFID_RACAO: TIntegerField;
    FORNECIMENTO_CONFMS_RACAO: TFMTBCDField;
    FORNECIMENTO_CONFVALOR_KG_RACAO: TFMTBCDField;
    FORNECIMENTO_CONFPREVISTO_MN_KG: TIntegerField;
    FORNECIMENTO_CONFREALIZADO_MN_KG: TIntegerField;
    FORNECIMENTO_CONFCUSTO_TOTAL_TRATO: TFMTBCDField;
    FORNECIMENTO_CONFID_MOTORISTA: TIntegerField;
    FORNECIMENTO_CONFID_USUARIO: TIntegerField;
    FORNECIMENTO_CONFDATAREG: TSQLTimeStampField;
    FORNECIMENTO_CONFSTATUS: TIntegerField;
    FORNECIMENTO_CONFLOTE_FABRICACAO: TStringField;
    FORNECIMENTO_CONFID_USUARIO_ALTERACAO: TIntegerField;
    FORNECIMENTO_CONFDATA_ALTERACAO: TSQLTimeStampField;
    RACAOID: TIntegerField;
    RACAOTIPO: TIntegerField;
    RACAONOME: TStringField;
    RACAOGMD: TFMTBCDField;
    RACAOMATERIASECA: TFMTBCDField;
    RACAOSTATUS: TIntegerField;
    RACAODATAREGISTRO: TSQLTimeStampField;
    RACAOIDUSUARIO: TIntegerField;
    RACAODATAALTERACAO: TSQLTimeStampField;
    RACAOIDUSUARIOALTERACAO: TIntegerField;
    RACAOVALORKG: TFMTBCDField;
    RACAODATAFORMULACAO: TDateField;
    RACAOID_PROPRIEDADE: TIntegerField;
    RACAOIMS_PV: TFMTBCDField;
    RACAOTEMPO_MISTURA: TIntegerField;
    RACAOINSUMOSID: TIntegerField;
    RACAOINSUMOSIDRACAO: TIntegerField;
    RACAOINSUMOSIDINSUMOALIMENTO: TIntegerField;
    RACAOINSUMOSPERCENTMATERIASECA: TFMTBCDField;
    RACAOINSUMOSKGMATERIASECA: TFMTBCDField;
    RACAOINSUMOSINCLUSAOMATERIASECA: TFMTBCDField;
    RACAOINSUMOSINCLUSAOMATERIANATURAL: TFMTBCDField;
    RACAOINSUMOSVALORKG: TFMTBCDField;
    RACAOINSUMOSVALORINCLUSAO: TFMTBCDField;
    RACAOINSUMOSSTATUS: TIntegerField;
    RACAOINSUMOSDATAREGISTRO: TSQLTimeStampField;
    RACAOINSUMOSIDUSUARIO: TIntegerField;
    RACAOINSUMOSDATAALTERACAO: TSQLTimeStampField;
    RACAOINSUMOSIDUSUARIOALTERACAO: TIntegerField;
    RACAOINSUMOSKGMATERIANATURAL: TFMTBCDField;
    RACAOINSUMOSORDEM_FABRICACAO: TIntegerField;
    RACAOINSUMOSID_PREMISTURA: TIntegerField;
    RACAOINSUMOSTOLERANCIA_FAB: TFMTBCDField;
    FABRICACAOID: TIntegerField;
    FABRICACAOIDRACAO: TIntegerField;
    FABRICACAODATA_FAB: TDateField;
    FABRICACAOKG_PREVISTO: TBCDField;
    FABRICACAOKG_REALIZADO: TBCDField;
    FABRICACAOCUSTO_TOTAL: TBCDField;
    FABRICACAOHORA_INICIO: TTimeField;
    FABRICACAOHORA_FIM: TTimeField;
    FABRICACAODATAREG: TDateField;
    FABRICACAOID_USUARIO: TIntegerField;
    FABRICACAOTIPO_BAIXA: TIntegerField;
    FABRICACAOID_CENTROCUSTO: TIntegerField;
    FABRICACAOLOTE_FABRICACAO: TStringField;
    FABRICACAOID_OPERADOR: TIntegerField;
    FABRICACAOORIGEM_DADOS: TIntegerField;
    FABRICACAODATA_ALTERACAO: TSQLTimeStampField;
    FABRICACAOID_USUARIO_ALTERACAO: TIntegerField;
    FABRICACAOSTATUS: TIntegerField;
    FABRICACAOID_PROPRIEDADE: TIntegerField;
    FABRICACAOID_PREMISTURA: TIntegerField;
    FABRICACAO_INSUMOSID: TIntegerField;
    FABRICACAO_INSUMOSID_FABRICACAO: TIntegerField;
    FABRICACAO_INSUMOSID_ALIMENTO: TIntegerField;
    FABRICACAO_INSUMOSID_CONCENTRADO: TIntegerField;
    FABRICACAO_INSUMOSDATA_FAB: TDateField;
    FABRICACAO_INSUMOSHORA_INI: TTimeField;
    FABRICACAO_INSUMOSHORA_FIM: TTimeField;
    FABRICACAO_INSUMOSMS_INSUMO: TFMTBCDField;
    FABRICACAO_INSUMOSKG_PREVISTO: TBCDField;
    FABRICACAO_INSUMOSKG_FABRICADO: TBCDField;
    FABRICACAO_INSUMOSDATAREG: TDateField;
    FABRICACAO_INSUMOSID_USUARIO: TIntegerField;
    FABRICACAO_INSUMOSID_USUARIO_ALTERACAO: TIntegerField;
    FABRICACAO_INSUMOSDATA_ALTERACAO: TSQLTimeStampField;
    FABRICACAO_INSUMOSSTATUS: TIntegerField;
    FABRICACAO_INSUMOSVALOR_KG: TFMTBCDField;
    FABRICACAO_INSUMOSCUSTO: TFMTBCDField;
    qryAux: TFDQuery;
    FORNECIMENTO_PREVISTOID: TIntegerField;
    FORNECIMENTO_PREVISTOID_LOTE: TIntegerField;
    FORNECIMENTO_PREVISTOID_LOCAL: TIntegerField;
    FORNECIMENTO_PREVISTOQTD_CAB: TIntegerField;
    FORNECIMENTO_PREVISTOMEDIA_PESO: TFMTBCDField;
    FORNECIMENTO_PREVISTODATA_FORN: TDateField;
    FORNECIMENTO_PREVISTOHORA_FORN: TTimeField;
    FORNECIMENTO_PREVISTOTRATO: TIntegerField;
    FORNECIMENTO_PREVISTOID_RACAO: TIntegerField;
    FORNECIMENTO_PREVISTOMS_RACAO: TFMTBCDField;
    FORNECIMENTO_PREVISTOVALOR_KG_RACAO: TFMTBCDField;
    FORNECIMENTO_PREVISTOPREVISTO_MN_KG: TIntegerField;
    FORNECIMENTO_PREVISTOREALIZADO_MN_KG: TIntegerField;
    FORNECIMENTO_PREVISTOCUSTO_TOTAL_TRATO: TFMTBCDField;
    FORNECIMENTO_PREVISTOID_MOTORISTA: TIntegerField;
    FORNECIMENTO_PREVISTOID_USUARIO: TIntegerField;
    FORNECIMENTO_PREVISTODATAREG: TSQLTimeStampField;
    FORNECIMENTO_PREVISTOSTATUS: TIntegerField;
    FORNECIMENTO_PREVISTOLOTE_FABRICACAO: TStringField;
    FORNECIMENTO_PREVISTOID_USUARIO_ALTERACAO: TIntegerField;
    FORNECIMENTO_PREVISTODATA_ALTERACAO: TSQLTimeStampField;
    HIST_CONSUMOID_CURRAL: TIntegerField;
    HIST_CONSUMOIMSPV: TFMTBCDField;
    HIST_SANIDADE: TFDQuery;
    HIST_SANIDADEINSERTINTO: TStringField;
    FComSQLite: TFDConnection;
    Tablekey: TFDQuery;
    TablekeyKEY: TStringField;
    TablekeyDATAREG: TSQLTimeStampField;
    TablekeyID: TIntegerField;
    TablekeySTATUS: TIntegerField;
    FARMACO: TFDQuery;
    PROTOCOLO_SANITARIO: TFDQuery;
    PROTOCOLO_FARMACOS: TFDQuery;
    FARMACOID: TIntegerField;
    FARMACONOME: TStringField;
    FARMACOPRINCIPIO_ATIVO: TStringField;
    FARMACOID_FABRICANTE: TIntegerField;
    FARMACOTIPO_APICACAO: TIntegerField;
    FARMACOML_DOSE_FIXA: TFMTBCDField;
    FARMACOML_DOSE_PV: TFMTBCDField;
    FARMACOKG_DOSE_PV: TFMTBCDField;
    FARMACODATA_REG: TSQLTimeStampField;
    FARMACOID_USUARIO: TIntegerField;
    FARMACOSTATUS: TIntegerField;
    FARMACOID_INDICACAO: TIntegerField;
    FARMACOCARENCIA_DIA: TIntegerField;
    FARMACOVALOR_ML: TFloatField;
    PROTOCOLO_SANITARIOID: TIntegerField;
    PROTOCOLO_SANITARIONOME: TStringField;
    PROTOCOLO_SANITARIODATAREG: TSQLTimeStampField;
    PROTOCOLO_SANITARIOID_USUARIO: TIntegerField;
    PROTOCOLO_SANITARIOSTATUS: TIntegerField;
    PROTOCOLO_SANITARIOTIPO: TIntegerField;
    PROTOCOLO_FARMACOSID: TIntegerField;
    PROTOCOLO_FARMACOSID_FARMACO: TIntegerField;
    PROTOCOLO_FARMACOSTIPO_DOSAGEM: TIntegerField;
    PROTOCOLO_FARMACOSID_USUARIO: TIntegerField;
    PROTOCOLO_FARMACOSDOSE_FIXA_ML: TFMTBCDField;
    PROTOCOLO_FARMACOSDOSE_PESO_ML: TFMTBCDField;
    PROTOCOLO_FARMACOSDOSE_PESO_KG: TFMTBCDField;
    PROTOCOLO_FARMACOSSTATUS: TIntegerField;
    PROTOCOLO_FARMACOSID_PROTOCOLO: TIntegerField;
    PROTOCOLO_FARMACOSCARENCIA_DIAS: TIntegerField;
    ANIMAL_SANIDADE: TFDQuery;
    ANIMAL_SANIDADEID: TIntegerField;
    ANIMAL_SANIDADEID_ANIMAL: TIntegerField;
    ANIMAL_SANIDADEID_FARMACO: TIntegerField;
    ANIMAL_SANIDADEID_PROTOCOLO: TIntegerField;
    ANIMAL_SANIDADEDOSE_ML: TFMTBCDField;
    ANIMAL_SANIDADEID_PROPRIEDAE: TIntegerField;
    ANIMAL_SANIDADEID_LOCAL_ATUAL: TIntegerField;
    ANIMAL_SANIDADEDATA_APLICACAO: TDateField;
    ANIMAL_SANIDADETIPO_APLICACAO: TIntegerField;
    ANIMAL_SANIDADEID_RESPONSAVEL_APLICACAO: TIntegerField;
    ANIMAL_SANIDADEID_USUARIO: TIntegerField;
    ANIMAL_SANIDADEDATAREG: TSQLTimeStampField;
    ANIMAL_SANIDADESTATUS: TIntegerField;
    ANIMAL_SANIDADETIPO_TRATAMENTO: TIntegerField;
    ANIMAL_SANIDADEID_RESPONSAVEL_APLI_DIREITO: TIntegerField;
    ANIMAL_SANIDADECARENCIA_DIAS: TIntegerField;
    ANIMAL_SANIDADEID_USUARIO_ALTERACAO: TIntegerField;
    ANIMAL_SANIDADEDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    ANIMAL_SANIDADECARENCIA_DATA: TDateField;
    ANIMAL_SANIDADEORIGEM_DADOS: TIntegerField;
    ANIMAL_SANIDADEID_MOTIVO_APLICACAO: TIntegerField;
    ANIMAL_SANIDADEID_BASE_CAMPO: TIntegerField;
    ANIMAL_SANIDADEBASE_CAMPO_SYNC: TIntegerField;
    ANIMAL_SANIDADEBASE_CAMPO_DT_SYNC: TDateField;
    ANIMAL_SANIDADEVALOR_TOTAL: TFloatField;
    procedure LIMPEZABEBEDOUROReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure MOVIMENTACAO_ANIMALReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure qryInsertReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure qryAuxReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure FORNECIMENTO_CONFReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
    procedure FComSQLiteBeforeConnect(Sender: TObject);
  private
    function LerIni(Diretorio,Chave1, Chave2, ValorPadrao: String): String;
    function GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
    procedure AtualizaLocalAnimal(vIdAnimal,vIdLocal:string);
    function RetornaIDUltimoFornecimento: string;
    procedure InsereFornecimentoCab(VDATA,ID_PASTO,ID_FORN,ID_MINERAL,QTD_FORN_TOTAL,
     VALOR_KG, QTD_CAB: string);
    function  RetornaValorKgMineral(idMineral:string):string;
    procedure VerificaLeitruraExiste(vIdLote,vData:string);
    procedure ConfirmaLeituraCocho(ID_USUARIO,vIdLote,vIdCurral,vDataLeitura,vNota,vAjuste:string);
    procedure InsereLeituraCocho(ID_USUARIO,TIPO,ID_LOTE, ID_CURRAL, DATA_LEITURA,
     NOTA, AJUSTE,REPLY: string);
    function RetornaMaxId(Atabela: string): string;
    function  RetornaValorKgAlimento(idAlimento:string):Double;
    function  RetornaValorKgRacao(idRacao:string):Double;
    procedure AtualizaFornecimento(id, idMotorista, hora, qtdCab,
      MediaPeso, Realizado,VDATA,TRATO,ID_LOTE,id_Racao: string);
  public
    var vDataBaseCampo,vPathBD,vPathBDMaster,vNomeBase,vIdUserLogado,
    vNomeUserLogado,vTipoUser,vDataBase,vServer,vNomePropriedade,
    vPainelAnimais,vPainelEstoque,vPainelFinanceiro,
    vRastreada,vRacaBndOutroEras,vSexoBndOutroEras,vDnBndOutroEras,
    vLic,vSenhaUserLogado,vNomeProdutorEmbarque,vTotalAnimais :string;
    vCadPedido,vGeraAnexoSaida,vCadGTA,vSyncBC: integer;
    function ConectaBD:Boolean;
    procedure AbreSanidade(idPropriedade:string);

    function GetGeneric(DataSet: TDataSet):TJSONObject;
    function GetGenericPostPropriedade(DataSet: TDataSet;obj: TJSONObject):TJSONObject;
    function GetAnimaisPostPropriedade(DataSet: TDataSet;obj: TJSONObject):TJSONObject;
    function GetHistSanidadePostPropriedade(DataSet: TDataSet;obj: TJSONObject):TJSONObject;
    function GetTestaServidor: TJSONObject;

    function AcceptLimpezaBebedouro(obj: TJSONObject): TJSONObject;
    function AcceptMovAnimal(obj: TJSONObject): TJSONObject;
    function AcceptFornecimento(obj: TJSONObject): TJSONObject;
    function AcceptFornecimentoConf(obj: TJSONObject): TJSONObject;
    function AcceptLeituraCocho(obj: TJSONObject): TJSONObject;
    function AcceptFabricacao(obj: TJSONObject): TJSONObject;
    function AcceptFabricacaoInsumos(obj: TJSONObject): TJSONObject;

    function AcceptSanidade(obj: TJSONObject): TJSONObject;

    function  ValidaLicencaJaUsada(Chave: String): Boolean;
    procedure InativaKey;


  end;

var
  dmDB: TdmDB;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UPrincipal;

{$R *.dfm}

procedure TdmDB.AbreSanidade(idPropriedade: string);
begin

end;

function TdmDB.AcceptFabricacao(obj: TJSONObject): TJSONObject;
var
  I,X,vEdit: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdProduto  :string;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := frmPrincipal.FCon;
  FABRICACAO.Connection := frmPrincipal.FCon;
  FABRICACAO.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    FABRICACAO.Close;
    FABRICACAO.Open;
    FABRICACAO.Insert;

    for x := 0 to FABRICACAO.Fields.Count -1 do
    begin
     vField  := StringReplace(FABRICACAO.Fields[x].Name,
      'FABRICACAO','',[rfReplaceAll]);
     if (vField<>'DATAREG') and (vField<>'ID') and (vQry.FindField(vField) <> nil)
     and (FABRICACAO.FindField(vField) <> nil) then
      FABRICACAO.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
      FABRICACAO.ApplyUpdates(-1);
      FABRICACAO.Connection.Commit;
      vIdResult := RetornaMaxId('FABRICACAO');
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Abastecimento:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.RetornaMaxId(Atabela: string): string;
begin
 with QryAux,QryAux.SQL do
 begin
   Clear;
   Add('select max(id) max_id from '+Atabela);
   Open;
   Result := FieldByName('max_id').AsString;
 end;
end;

function TdmDB.GetTestaServidor: TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
begin
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue('OK');
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.ConectaBD:Boolean;
var
  Arquivo: String;
  vVendorLib:string;
begin
  frmPrincipal.FCon.Connected := false;
  Arquivo := ExtractFilePath(ParamStr(0))+'fieldconf.ini';
  if not FileExists(Arquivo) then
  begin
    ShowMessage('Arquivo fieldconf.ini não localizado no seguinte diretorio:'+#13+
    Arquivo);
    Exit;
  end
  else
  begin
    vVendorLib :=ExtractFilePath(ParamStr(0))+'fbclient_32.dll';
    frmPrincipal.FDPhysFBDriverLink1.VendorLib := vVendorLib;
    try
      with frmPrincipal.FCon do
        begin
          vPathBD                    := LerIni(Arquivo,'FIREBIRD','dbRede','');
          vNomeBase                  := LerIni(Arquivo,'FIREBIRD','NomeBase','');
          Params.Clear;
          Params.Values['DriverID']  :='FB';
          vDataBase := LerIni(Arquivo,'FIREBIRD','Database','');
          vServer   := LerIni(Arquivo,'FIREBIRD','Server','');
          Params.Values['Server']    :=LerIni(Arquivo,'FIREBIRD','Server','');
          Params.Values['Database']  :=LerIni(Arquivo,'FIREBIRD','Database','');
          vPathBDMaster := vServer+':'+vDataBase;
          vLic                       :=LerIni(Arquivo,'FIREBIRD','Lic','');
          Params.Values['User_name'] :=LerIni(Arquivo,'FIREBIRD','User','');
          Params.Values['Password']  :=LerIni(Arquivo,'FIREBIRD','Password','');
          Params.Values['Port']      :=LerIni(Arquivo,'FIREBIRD','Port','');
          Connected := True;
          frmPrincipal.lblDB.TEXT := 'DB : '+vServer+':'+vDataBase;
          Result := true;
        end;
    except
     on E : Exception do
     begin
      ShowMessage('Erro ao Conectar ao banco : '+E.Message);
      Result := false;
     end;
    end;
  end;
end;

procedure TdmDB.ConfirmaLeituraCocho(ID_USUARIO,vIdLote, vIdCurral, vDataLeitura, vNota,
  vAjuste: string);
begin
  try
    InsereLeituraCocho(ID_USUARIO,'1',vIdLote,vIdCurral,
    vDataLeitura.QuotedString,
    StringReplace(vNota,',','.',[rfReplaceAll]),
    vAjuste,
    '1');
  except
  on e : Exception do
   frmPrincipal.mlog.Lines.Add('Erro ao Atualizar Leitura: '+e.Message)
  end;
end;

procedure TdmDB.FComSQLiteBeforeConnect(Sender: TObject);
var
 ArquivoDB:string;
begin
  ArquivoDB := ExtractFilePath(ParamStr(0))+'db\WS.db';
  if FileExists(ArquivoDB) then
   begin
    FComSQLite.Params.DriverID :='SQLite';
    FComSQLite.Params.Values['Database'] :=ArquivoDB;
   end
   else
    ShowMessage('BD Não localizado!!');
end;

procedure TdmDB.FORNECIMENTO_CONFReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 frmPrincipal.mlog.Lines.Add(e.Message)
end;

function TdmDB.LerIni(Diretorio,Chave1, Chave2, ValorPadrao: String): String;
var
 FileIni: TIniFile;
begin
  result := ValorPadrao;
  try
    FileIni := TIniFile.Create(Diretorio);
    if FileExists(Diretorio) then
      result := FileIni.ReadString(Chave1, Chave2, ValorPadrao);
  finally
    FreeAndNil(FileIni)
  end;
end;

procedure TdmDB.LIMPEZABEBEDOUROReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 frmPrincipal.mlog.Lines.Add(e.Message);
end;

procedure TdmDB.MOVIMENTACAO_ANIMALReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
  frmPrincipal.mlog.Lines.Add(e.Message);
end;

procedure TdmDB.qryAuxReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 frmPrincipal.mlog.Lines.Add(e.Message);
end;

procedure TdmDB.qryInsertReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
  frmPrincipal.mlog.Lines.Add(e.Message);
end;


function TdmDB.RetornaIDUltimoFornecimento: string;
var
 vQryAux :TFDQuery;
 vMax:string;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := frmPrincipal.FCon ;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('SELECT  MAX(ID)MAX_ID FROM FORNECIMENTO');
   Open;
   Result := FieldByName('MAX_ID').AsString;
 end;
 vQryAux.Free;
end;



function TdmDB.RetornaValorKgAlimento(idAlimento: string): Double;
var
 vQryAux :TFDQuery;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := frmPrincipal.FCon;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('select COALESCE(CUSTO_MEDIO,0)CUSTO_MEDIO from alimento');
   Add('where id='+idAlimento);
   Open;
   Result := FieldByName('CUSTO_MEDIO').AsFloat;
 end;
 vQryAux.Free;
end;

function TdmDB.RetornaValorKgMineral(idMineral: string): string;
var
 vQryAux :TFDQuery;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := frmPrincipal.FCon;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('select * from suplemento_mineral');
   Add('where id='+idMineral);
   Open;
   Result := formatFloat('0.00',FieldByName('valor_kg').AsFloat);
 end;
 vQryAux.Free;
end;

function TdmDB.RetornaValorKgRacao(idRacao: string): Double;
var
 vQryAux :TFDQuery;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := frmPrincipal.FCon;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('SELECT COALESCE(VALORKG,0) VALOR FROM RACAO');
   Add('where id='+idRacao);
   Open;
   Result := FieldByName('VALOR').AsFloat;
 end;
 vQryAux.Free;
end;

function TdmDB.ValidaLicencaJaUsada(Chave: String): Boolean;
var
 vQryAux :TFDQuery;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := FComSQLite;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('select * from keyfield');
   Add('where "KEY"='+Chave.QuotedString);
   Open;
   Result := vQryAux.IsEmpty;
 end;
 vQryAux.Free;
end;

procedure TdmDB.VerificaLeitruraExiste(vIdLote, vData: string);
begin
 with LEITURA_COCHO,LEITURA_COCHO.SQL do
 begin
   Clear;
   Add('SELECT * FROM LEITURA_COCHO');
   Add('where status=1');
   Add('and data_leitura='+FormatDateTime('mm/dd/yyyy',strToDate(vData)).QuotedString);
   Add('and id_lote='+vidLote);
   Open;
 end;
end;

function TdmDB.AcceptFabricacaoInsumos(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdProduto  :string;
  vValorKG   : Double;
  vCustoTotal: Double;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := frmPrincipal.FCon;
  FABRICACAO_INSUMOS.Connection := frmPrincipal.FCon;
  FABRICACAO_INSUMOS.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    FABRICACAO_INSUMOS.Close;
    FABRICACAO_INSUMOS.Open;
    FABRICACAO_INSUMOS.Insert;
    for x := 0 to FABRICACAO_INSUMOS.Fields.Count -1 do
    begin
     vField  := StringReplace(FABRICACAO_INSUMOS.Fields[x].Name,
      'FABRICACAO_INSUMOS','',[rfReplaceAll]);
     if(vField<>'DATAREG') and (vField<>'ID') and (vQry.FindField(vField) <> nil)
     and (vField<>'VALOR_KG')and (vField<>'CUSTO')
     then
      FABRICACAO_INSUMOS.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
     if(vField='VALOR_KG') then
     begin
      vValorKG   := RetornaValorKgAlimento(vQry.FieldByName('ID_ALIMENTO').AsString);
      vCustoTotal:= vValorKG * vQry.FieldByName('KG_FABRICADO').AsFloat;
      FABRICACAO_INSUMOS.FieldByName('VALOR_KG').AsFloat := vValorKG;
     end;
    end;
    try
      FABRICACAO_INSUMOS.ApplyUpdates(-1);
      FABRICACAO_INSUMOS.Connection.Commit;
      if vIdResult.Length>0 then
       vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult:=vQry.FieldByName('id').AsString;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Fabricacao Insumos:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptFornecimento(obj: TJSONObject): TJSONObject;
var
 VMaxIdFor,vValorMineral:string;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdProduto  :string;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := frmPrincipal.FCon;
  FORNECIMENTO.Connection := frmPrincipal.FCon;
  FORNECIMENTO.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    FORNECIMENTO.Close;
    FORNECIMENTO.Open;
    FORNECIMENTO.Insert;
    for x := 0 to FORNECIMENTO.Fields.Count -1 do
    begin
     vField  := StringReplace(FORNECIMENTO.Fields[x].Name,
      'FORNECIMENTO','',[rfReplaceAll]);
     if (vField<>'DATAREG') and (vField<>'ID') and (vQry.FindField(vField) <> nil)then
      FORNECIMENTO.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
      FORNECIMENTO.ApplyUpdates(-1);
      FORNECIMENTO.Connection.Commit;
      if vQry.FieldByName('QTD_ANIMAIS').AsInteger>0 then
      begin
        VMaxIdFor     := RetornaIDUltimoFornecimento;
        vValorMineral := RetornaValorKgMineral(
          vQry.FieldByName('ID_PRODUTO').AsString);
        InsereFornecimentoCab(
         FormatDateTime('mm/dd/yyyy',vQry.FieldByName('DATA_FORNECIMENTO').AsDateTime),
         vQry.FieldByName('ID_PASTO').AsString,
         VMaxIdFor,
         vQry.FieldByName('ID_PRODUTO').AsString,
         formatFloat('0.00',vQry.FieldByName('REALIZADO_COCHO_KG').AsFloat),
         vValorMineral,
         vQry.FieldByName('QTD_ANIMAIS').AsString
         );
      end;

      if vIdResult.Length>0 then
       vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult:=vQry.FieldByName('id').AsString;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Fornecimento:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptFornecimentoConf(obj: TJSONObject): TJSONObject;
var
 VMaxIdFor,vValorMineral:string;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdProduto  :string;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := frmPrincipal.FCon;
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  try
    AtualizaFornecimento(
      vQry.FindField('ID').AsString,
      vQry.FindField('ID_MOTORISTA').AsString,
      vQry.FindField('HORA_FORN').AsString,
      vQry.FindField('QTD_CAB').AsString,
      vQry.FindField('MEDIA_PESO').AsString,
      vQry.FindField('REALIZADO_MN_KG').AsString,
      vQry.FindField('DATA_FORN').AsString,
      vQry.FindField('TRATO').AsString,
      vQry.FindField('ID_LOTE').AsString,
      vQry.FindField('ID_RACAO').AsString
    );
    vIdResult:=vQry.FieldByName('id').AsString;
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
    txtJson.WritePropertyName('OK');
    txtJson.WriteValue(vIdResult);
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   except
     on E: Exception do
     begin
       StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       txtJson.WritePropertyName('Erro');
       txtJson.WriteValue('Erro Ao Sincronizar Fornecimento:'+E.Message);
       txtJson.WriteEndObject;
       Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
     end;
  end;
end;

procedure TdmDB.AtualizaFornecimento(id, idMotorista, hora, qtdCab,
  MediaPeso, Realizado,VDATA,TRATO,ID_LOTE,id_Racao: string);
var
 vCustoTotal:Double;
 vQryTools :TFDQuery;
begin
 vQryTools := TFDQuery.Create(nil);
 vQryTools.Connection := frmPrincipal.FCon ;
 vCustoTotal := strToFloat(Realizado)*dmDB.RetornaValorKgRacao(id_Racao);
 with FORNECIMENTO_CONF,FORNECIMENTO_CONF.SQL do
 begin
   Clear;
   Add('SELECT * FROM FORNECIMENTO_CONF WHERE ID='+id);
   Open;
 end;
 if not FORNECIMENTO_CONF.IsEmpty then
 begin
   FORNECIMENTO_CONF.Edit;
   FORNECIMENTO_CONFID_MOTORISTA.AsString         := idMotorista;
   FORNECIMENTO_CONFHORA_FORN.AsDateTime          := StrToTime(Hora);
   FORNECIMENTO_CONFQTD_CAB.AsString              := qtdCab;
   FORNECIMENTO_CONFMEDIA_PESO.AsFloat            := strToFloat(MediaPeso);
   FORNECIMENTO_CONFCUSTO_TOTAL_TRATO.AsFloat     := vCustoTotal;
   FORNECIMENTO_CONFREALIZADO_MN_KG.AsFloat       := strToFloat(Realizado);
   FORNECIMENTO_CONFDATA_ALTERACAO.AsDateTime     := now ;
   FORNECIMENTO_CONFID_USUARIO_ALTERACAO.AsString := idMotorista;
   try
     FORNECIMENTO_CONF.ApplyUpdates(-1);
     FORNECIMENTO_CONF.Connection.Commit;
     with vQryTools,vQryTools.SQL do
     begin
      Clear;
      Add('UPDATE DET_LOTE_PLANEJAMENTO SET UTILIZADO=1');
      Add('WHERE DATA='+FormatDateTime('mm/dd/yyyy',StrToDate(VDATA)).QuotedString+ ' AND TRATO='+TRATO);
      Add('AND ID_LOTE='+ID_LOTE);
      try
        vQryTools.ExecSQL;
        vQryTools.Connection.Commit;
      except
       on E : Exception do
        frmPrincipal.mlog.Lines.Add(E.ClassName+' error raised, with message : '+E.Message);
      end;



      if strToInt(Realizado)>0 then
      begin
       with vQryTools,vQryTools.SQL do
       begin
         Clear;
         Add('DELETE FROM ANIMAL_FORNECIMENTO_CONF WHERE ID_FORNECIMENTO='+ID);
         try
          ExecSQL;
          vQryTools.Connection.Commit;
         except
          on E : Exception do
           frmPrincipal.mlog.Lines.Add(E.ClassName+' error raised, with message : '+E.Message);
         end;

         Clear;
         Add('INSERT INTO ANIMAL_FORNECIMENTO_CONF(');
         Add('ID_ANIMAL,');
         Add('ID_FORNECIMENTO,');
         Add(' DATA_FORNECIMENTO,');
         Add(' TRATO,');
         Add(' ID_LOTE,');
         Add(' ID_CURRAL,');
         Add(' CONSUMO_MN,');
         Add(' CONSUMO_MS,');
         Add(' IMS_PV,');
         Add(' CUSTO,');
         Add(' PESO_MEDIO,');
         Add(' ID_RACAO');
         Add(')');
         Add('SELECT');
         Add('B.ID,');
         Add('A.ID,');
         Add('A.DATA_FORN,');
         Add('A.TRATO,');
         Add('A.ID_LOTE,');
         Add('A.ID_LOCAL,');
         Add('CAST(A.REALIZADO_MN_KG AS DOUBLE PRECISION)/CAST(A.QTD_CAB AS DOUBLE PRECISION) ConsumoMn,');
         Add('CAST(A.REALIZADO_MN_KG AS DOUBLE PRECISION)/CAST(A.QTD_CAB AS DOUBLE PRECISION)*(CAST(MS_RACAO AS DOUBLE PRECISION)/100)ConsumoMs,');
         Add('(((CAST(A.REALIZADO_MN_KG AS DOUBLE PRECISION)/A.QTD_CAB)*(CAST(A.MS_RACAO AS DOUBLE PRECISION)/100)*100)/');
         Add('CAST(MEDIA_PESO AS DOUBLE PRECISION))IMS_PV,');
         Add('A.CUSTO_TOTAL_TRATO/A.QTD_CAB,');
         Add('A.MEDIA_PESO,');
         Add('A.ID_RACAO');
         Add('FROM FORNECIMENTO_CONF A');
         Add('JOIN ANIMAL B ON A.ID_LOCAL=B.ID_LOCAL');
         Add('WHERE B.STATUS=1 AND A.ID='+ID);
         try
          ExecSQL;
          vQryTools.Connection.Commit;
         except
          on E : Exception do
           frmPrincipal.mlog.Lines.Add(E.ClassName+' error raised, with message : '+E.Message);
         end;
       end;
      end;
     end;
    except
    on E : Exception do
     frmPrincipal.mlog.Lines.Add(E.ClassName+' error raised, with message : '+E.Message);
   end;
 end;
vQryTools.Free;
end;

procedure TdmDB.InativaKey;
var
 vQryAux :TFDQuery;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := FComSQLite;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('UPDATE KEYFIELD SET STATUS=-1');
   try
    ExecSQL;
   EXCEPT
   on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
   end;
 end;
 vQryAux.Free;
end;

procedure TdmDB.InsereFornecimentoCab(VDATA,ID_PASTO,ID_FORN,ID_MINERAL,QTD_FORN_TOTAL,
  VALOR_KG, QTD_CAB: string);
var
 vQryAux,vQryAuxInsert :TFDQuery;
 vQtdFornCab,vValorFornCab:Double;
 vQtdFornCabS,vValorFornCabS,vIdAnimal:String;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := frmPrincipal.FCon;
 vQryAuxInsert := TFDQuery.Create(nil);
 vQryAuxInsert.Connection := frmPrincipal.FCon;
 vQtdFornCab   := strToFloat(QTD_FORN_TOTAL) / StrToFloat(QTD_CAB);
 vValorFornCab := vQtdFornCab * strToFloat(VALOR_KG);
 vQtdFornCabS   := FormatFloat('0.00',vQtdFornCab);
 vValorFornCabS := FormatFloat('0.00',vValorFornCab);
 with vQryAux,vQryAux.SQL do
 begin
   if VDATA= FormatDateTime('mm/dd/yyyy',date) then
   begin
     Clear;
     Add('SELECT');
     Add('*');
     Add('FROM animal A');
     Add('where A.ID_LOCAL='+ID_PASTO+ ' AND STATUS=1');
     Add('and a.data_proc<='+VDATA.QuotedString);
     Open;
     while not vQryAux.Eof do
     begin
       vIdAnimal :=  vQryAux.FieldByName('ID').AsString;
      with vQryAuxInsert,vQryAuxInsert.SQL do
      begin
       Clear;
       Add('INSERT INTO ANIMAL_FORNECIMENTO(');
       Add('DATA,');
       Add('ID_FORNECIMENTO,');
       Add('KG_CAB,');
       Add('VALOR_FORN,');
       Add('ID_MINERAL,');
       Add('ID_ANIMAL,');
       Add('ID_PASTO)');
       Add('VALUES(');
       Add(':DATA,');
       Add(':ID_FORNECIMENTO,');
       Add(':KG_CAB,');
       Add(':VALOR_FORN,');
       Add(':ID_MINERAL,');
       Add(':ID_ANIMAL,');
       Add(':ID_PASTO)');
       ParamByName('DATA').AsString            :=VDATA;
       ParamByName('ID_FORNECIMENTO').AsString :=ID_FORN;
       ParamByName('KG_CAB').AsString          :=StringReplace(vQtdFornCabS,',','.',[rfReplaceAll]);
       ParamByName('VALOR_FORN').AsString      :=StringReplace(vValorFornCabS,',','.',[rfReplaceAll]);
       ParamByName('ID_MINERAL').AsString      :=ID_MINERAL;
       ParamByName('ID_ANIMAL').AsString       :=vIdAnimal;
       ParamByName('ID_PASTO').AsString        :=ID_PASTO;
       try
        vQryAuxInsert.ExecSQL;
        vQryAuxInsert.Connection.Commit;
        vQryAux.Next;
       except
       on E : Exception do
         ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
       end;
      end;
     end;
   end
   else
   begin
     Clear;
     Add('SELECT * FROM HIST_ANIMAL_LOCAL_DIA');
     Add('WHERE ID_LOCAL='+ID_PASTO);
     Add('AND "DATA"='+VDATA.QuotedString);
     Open;
     while not vQryAux.Eof do
     begin
       vIdAnimal :=  vQryAux.FieldByName('ID_ANIMAL').AsString;
      with vQryAuxInsert,vQryAuxInsert.SQL do
      begin
       Clear;
       Add('INSERT INTO ANIMAL_FORNECIMENTO(');
       Add('DATA,');
       Add('ID_FORNECIMENTO,');
       Add('KG_CAB,');
       Add('VALOR_FORN,');
       Add('ID_MINERAL,');
       Add('ID_ANIMAL,');
       Add('ID_PASTO)');
       Add('VALUES(');
       Add(':DATA,');
       Add(':ID_FORNECIMENTO,');
       Add(':KG_CAB,');
       Add(':VALOR_FORN,');
       Add(':ID_MINERAL,');
       Add(':ID_ANIMAL,');
       Add(':ID_PASTO)');

       ParamByName('DATA').AsString            :=VDATA;
       ParamByName('ID_FORNECIMENTO').AsString :=ID_FORN;
       ParamByName('KG_CAB').AsString          :=StringReplace(vQtdFornCabS,',','.',[rfReplaceAll]);
       ParamByName('VALOR_FORN').AsString      :=StringReplace(vValorFornCabS,',','.',[rfReplaceAll]);
       ParamByName('ID_MINERAL').AsString      :=ID_MINERAL;
       ParamByName('ID_ANIMAL').AsString       :=vIdAnimal;
       ParamByName('ID_PASTO').AsString        :=ID_PASTO;
       try
        vQryAuxInsert.ExecSQL;
        vQryAuxInsert.Connection.Commit;
        vQryAux.Next;
       except
       on E : Exception do
         ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
       end;
      end;
     end;
   end;
 end;
 vQryAux.Free;
 vQryAuxInsert.Free;
end;


procedure TdmDB.InsereLeituraCocho(ID_USUARIO,TIPO, ID_LOTE, ID_CURRAL, DATA_LEITURA, NOTA,
  AJUSTE, REPLY: string);
var
 vQry :TFDQuery;
begin
 vQry            := TFDQuery.Create(nil);
 vQry.Connection := frmPrincipal.FCon;
 with vQry,vQry.SQL do
 begin
   Clear;
   Add('UPDATE LEITURA_COCHO SET STATUS=-1');
   Add(',ID_USUARIO_ALTERCAO='+ID_USUARIO);
   Add(',DATA_ALTERACAO=CURRENT_TIMESTAMP');
   Add('WHERE ID_LOTE='+ID_LOTE);
   Add('AND ID_CURRAL='+ID_CURRAL);
   Add('AND DATA_LEITURA='+DATA_LEITURA);
   ExecSQL;
   vQry.Connection.Commit;
   if tipo='1' then
   begin
     Clear;
     Add('INSERT INTO LEITURA_COCHO(ID_LOTE,ID_CURRAL,DATA_LEITURA,NOTA,AJUSTE,ID_USUARIO)');
     Add('VALUES(');
     Add(ID_LOTE+',');
     Add(ID_CURRAL+',');
     Add(DATA_LEITURA+',');
     Add(NOTA+',');
     Add(AJUSTE+',');
     Add(ID_USUARIO+')');
     try
       ExecSQL;
       vQry.Connection.Commit;
       Clear;
       Add('EXECUTE PROCEDURE  GERA_TRATOS_LEITURA('+AJUSTE+','+
       DATA_LEITURA+','+
       ID_USUARIO+','+
       ID_LOTE+','+
       REPLY+')');
       ExecSQL;
       vQry.Connection.Commit;
     except
      on e : Exception do
       frmPrincipal.mlog.Lines.add('Erro ao Atualizar Lotes: '+e.Message)
     end;
   end;
   if tipo='2' then
   begin
     Clear;
     Add('INSERT INTO LEITURA_COCHO(ID_LOTE,ID_CURRAL,DATA_LEITURA,NOTA,AJUSTE,ID_USUARIO)');
     Add('VALUES(');
     Add(ID_LOTE+',');
     Add(ID_CURRAL+',');
     Add(DATA_LEITURA+',');
     Add('100,');
     Add(AJUSTE+',');
     Add(ID_USUARIO+')');
     try
       ExecSQL;
       vQry.Connection.Commit;
       Clear;
       Add('EXECUTE PROCEDURE  GERA_TRATOS_LEITURA_KG('+AJUSTE+','+
       DATA_LEITURA+','+
       ID_USUARIO+','+
       ID_LOTE+','+
       REPLY+')');
       ExecSQL;
       vQry.Connection.Commit;
     except
      on e : Exception do
       frmPrincipal.mlog.Lines.add('Erro ao Atualizar Lotes: '+e.Message)
     end;
   end;
 end;
 vQry.Free;
end;

function TdmDB.AcceptLeituraCocho(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdProduto  :string;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := frmPrincipal.FCon;
  LEITURA_COCHO.Connection := frmPrincipal.FCon;
  LEITURA_COCHO.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    dmDB.VerificaLeitruraExiste(
     vQry.FieldByName('id_lote').AsString,
     vQry.FieldByName('data_leitura').AsString);
    if LEITURA_COCHO.IsEmpty then
     LEITURA_COCHO.Insert
    else
     LEITURA_COCHO.Edit;
    for x := 0 to LEITURA_COCHO.Fields.Count -1 do
    begin
     vField  := StringReplace(LEITURA_COCHO.Fields[x].Name,
      'LEITURA_COCHO','',[rfReplaceAll]);
     if (vField<>'DATAREG') and (vField<>'ID') and (vQry.FindField(vField) <> nil)then
      LEITURA_COCHO.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
      LEITURA_COCHO.ApplyUpdates(-1);
      LEITURA_COCHO.Connection.Commit;
      ConfirmaLeituraCocho(
       vQry.FieldByName('ID_USUARIO').AsString,
       vQry.FieldByName('ID_LOTE').AsString,
       vQry.FieldByName('ID_CURRAL').AsString,
       FormatDateTime('mm/dd/yyyy',vQry.FieldByName('DATA_LEITURA').AsDateTime),
       vQry.FieldByName('NOTA').AsString,
       vQry.FieldByName('AJUSTE').AsString
      );
      if vIdResult.Length>0 then
       vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult:=vQry.FieldByName('id').AsString;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Leitura de Cocho:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptLimpezaBebedouro(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdProduto  :string;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := frmPrincipal.FCon;
  LIMPEZABEBEDOURO.Connection := frmPrincipal.FCon;
  LIMPEZABEBEDOURO.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    LIMPEZABEBEDOURO.Close;
    LIMPEZABEBEDOURO.Open;
    LIMPEZABEBEDOURO.Insert;
    for x := 0 to LIMPEZABEBEDOURO.Fields.Count -1 do
    begin
     vField  := StringReplace(LIMPEZABEBEDOURO.Fields[x].Name,
      'LIMPEZABEBEDOURO','',[rfReplaceAll]);
     if (vField<>'DATAREG') and (vField<>'ID') and (vQry.FindField(vField) <> nil)then
      LIMPEZABEBEDOURO.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
      LIMPEZABEBEDOURO.ApplyUpdates(-1);
      LIMPEZABEBEDOURO.Connection.Commit;
      if vIdResult.Length>0 then
       vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult:=vQry.FieldByName('id').AsString;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Abastecimento:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.AcceptSanidade(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry,vQry1       : TFDQuery;
  vIdResult,vIdProduto  :string;
  vValorTotal:Double;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := frmPrincipal.FCon;

  vQry1       := TFDQuery.Create(nil);
  vQry1.Connection := frmPrincipal.FCon;

  ANIMAL_SANIDADE.Connection := frmPrincipal.FCon;
  ANIMAL_SANIDADE.Open();
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    ANIMAL_SANIDADE.Close;
    ANIMAL_SANIDADE.Open;
    ANIMAL_SANIDADE.Insert;
    for x := 0 to ANIMAL_SANIDADE.Fields.Count -1 do
    begin
     vField  := StringReplace(ANIMAL_SANIDADE.Fields[x].Name,
      'ANIMAL_SANIDADE','',[rfReplaceAll]);
     if (vField<>'DATAREG') and (vField<>'ID') and (vQry.FindField(vField) <> nil)then
      ANIMAL_SANIDADE.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
      with vQry1,vQry1.SQL do
      begin
        Clear;
        Add('SELECT COALESCE(VALOR_ML,0)VALOR_ML  FROM FARMACO');
        Add('WHERE ID='+vQry.FieldByName('ID_FARMACO').AsString);
        Open;
        vValorTotal:= (vQry.FieldByName('DOSE_ML').AsFloat * vQry1.FieldByName('VALOR_ML').AsFloat);
      end;
      ANIMAL_SANIDADEVALOR_TOTAL.AsFloat := vValorTotal;
      ANIMAL_SANIDADE.ApplyUpdates(-1);
      ANIMAL_SANIDADE.Connection.Commit;
      if vIdResult.Length>0 then
       vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
      else
       vIdResult:=vQry.FieldByName('id').AsString;
      vQry.Next;
     except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Abastecimento:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
  vQry.Free;
  vQry1.Free;
end;



function TdmDB.AcceptMovAnimal(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS,vMaxID:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult,vIdProduto  :string;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := frmPrincipal.FCon;
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  while not vQry.eof do
  begin
    with qryInsert,qryInsert.SQL do
    begin
      Clear;
      Add('INSERT INTO MOVIMENTACAO_ANIMAL');
      Add('(ID_USUARIO,');
      Add('ID_ANIMAL,');
      Add('ID_PASTO_ORIGEM,');
      Add('ID_PASTO_DESTINO,');
      Add('"DATA",');
      Add('ID_MOTIVO,');
      Add('ORIGEM_DADOS,');
      Add('TIPO)');
      Add('values');
      Add('(');
      Add(vQry.FieldByName('ID_USUARIO').AsString+',');
      Add(vQry.FieldByName('ID_ANIMAL').AsString+',');
      Add(vQry.FieldByName('ID_PASTO_ORIGEM').AsString+',');
      Add(vQry.FieldByName('ID_PASTO_DESTINO').AsString+',');
      Add(FormatDateTime('mm/dd/yyyy',vQry.FieldByName('DATA').AsDateTime).QuotedString+',');
      Add(vQry.FieldByName('ID_MOTIVO').AsString+',');
      Add('1,');
      Add('0');
      Add(');');
      qryInsert.SQL.Text;
      try
       qryInsert.ExecSQL;
       qryInsert.Connection.Commit;
       AtualizaLocalAnimal(
        vQry.FieldByName('ID_ANIMAL').AsString,
        vQry.FieldByName('ID_PASTO_DESTINO').AsString
       );
       if vIdResult.Length>0 then
        vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
       else
        vIdResult:=vQry.FieldByName('id').AsString;
       vQry.Next;
      except
       on E: Exception do
       begin
         StrAux  := TStringWriter.Create;
         txtJson := TJsonTextWriter.Create(StrAux);
         txtJson.Formatting := TJsonFormatting.Indented;
         txtJson.WriteStartObject;
         txtJson.WritePropertyName('Erro');
         txtJson.WriteValue('Erro Ao Sincronizar Abastecimento:'+E.Message);
         txtJson.WriteEndObject;
         Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
       end;
      end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

procedure TdmDB.AtualizaLocalAnimal(vIdAnimal, vIdLocal: string);
var
  vQry       : TFDQuery;
begin
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := frmPrincipal.FCon;
  with vQry,vQry.SQL do
  begin
    Clear;
    Add('update animal set id_local='+vIdLocal);
    Add('where id='+vIdAnimal);
    ExecSQL;
    vQry.Connection.Commit;
  end;
  vQry.Free;
end;

function TdmDB.GetAnimaisPostPropriedade(DataSet: TDataSet;
  obj: TJSONObject): TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
 vJsonString :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1: TJSONArray;
 vidPropriedade:string;
 IStatus:integer;
begin
   vJsonString      := Obj.ToString;
   vJoInsert        := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
   vJoItem          := vJoInsert.GetValue('IDPROPRIEDADE') as TJSONArray;
   vJoItemO         := vJoItem.Items[0] as TJSONObject;
   vidPropriedade   :=  vJoItemO.GetValue('id').value;
   ANIMAL.Filtered := false;
   ANIMAL.Close;
   ANIMAL.Open;
   ANIMAL.Filter   := 'ID_PROPRIEDADE='+vidPropriedade;
   ANIMAL.Filtered := true;
   if not ANIMAL.IsEmpty then
   begin
    StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('ANIMAL');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not ANIMAL.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('INSERT');
      txtJson.WriteValue(ANIMAL.FieldByName('InsertInto').AsString);
      txtJson.WriteEndObject;
      ANIMAL.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabecalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum Animal encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;

function TdmDB.GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
var
  f: TField;
  o: TJSOnObject;
  a: TJSONArray;
begin
  a := TJSONArray.Create;
  DataSet.Active := True;
  DataSet.First;
  while not DataSet.EOF do begin
    o := TJSOnObject.Create;
    for f in DataSet.Fields do
      o.AddPair(f.FieldName, VarToStr(f.Value));
    a.AddElement(o);
    DataSet.Next;
  end;
  DataSet.Active := False;
  Result := TJSONObject.Create;
  Result.AddPair(DataSet.Name, a);
end;


function TdmDB.GetGeneric(DataSet: TDataSet): TJSONObject;
begin
 DataSet.Close;
 DataSet.Open;
 Result := GetDataSetAsJSON(DataSet);
end;

function TdmDB.GetGenericPostPropriedade(DataSet: TDataSet;obj: TJSONObject): TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
 vJsonString :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1: TJSONArray;
 vidPropriedade:string;
 IStatus,vQtd:integer;
begin
   vJsonString      := Obj.ToString;
   vJoInsert        := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
   vJoItem          := vJoInsert.GetValue('IDPROPRIEDADE') as TJSONArray;
   vJoItemO         := vJoItem.Items[0] as TJSONObject;
   vidPropriedade   :=  vJoItemO.GetValue('id').value;
   if DataSet.Name='BEBEDOURO' then
   begin
    with BEBEDOURO,BEBEDOURO.SQL do
    begin
      Clear;
      Add('SELECT a.*,b.ID_PROPRIEDADE FROM bebedouro A');
      Add('JOIN currais B ON A.id_pasto=B.id');
      Add('WHERE B.status=1 and a.status=1');
      Add('AND B.ID_PROPRIEDADE='+vidPropriedade);
      BEBEDOURO.SQL.Text;
      Open;
      vQtd := BEBEDOURO.RecordCount;
      Result := GetDataSetAsJSON(BEBEDOURO);
    end;
   end;
   if DataSet.Name='HIST_LEITURA_COCHO' then
   begin
    with HIST_LEITURA_COCHO,HIST_LEITURA_COCHO.SQL do
    begin
      Clear;
      Add('SELECT c.id,a.*,c.id_propriedade  FROM HIST_LEITURA_COCHO('+vidPropriedade+') a');
      Add('JOIN CURRAIS c ON C.ID=ID_CURRAL');
      HIST_LEITURA_COCHO.SQL.Text;
      Open;
      vQtd := HIST_LEITURA_COCHO.RecordCount;
      Result := GetDataSetAsJSON(HIST_LEITURA_COCHO);
    end
   end;
   if DataSet.Name='HIST_CONSUMO' then
   begin
    with HIST_CONSUMO,HIST_CONSUMO.SQL do
    begin
      Clear;
      Add('SELECT * FROM HIST_CONSUMO_LOTE('+vidPropriedade+') a');
      HIST_LEITURA_COCHO.SQL.Text;
      Open;
      vQtd := HIST_CONSUMO.RecordCount;
      Result := GetDataSetAsJSON(HIST_CONSUMO);
    end
   end;
   if DataSet.Name='FORNECIMENTO_PREVISTO' then
   begin
    with FORNECIMENTO_PREVISTO,FORNECIMENTO_PREVISTO.SQL do
    begin
      Clear;
      Add('SELECT');
      Add(' f.*');
      Add('FROM FORNECIMENTO_CONF f');
      Add('JOIN LOTE_NUTRICIONAL L ON L.ID=F.ID_LOTE');
      Add('WHERE DATA_FORN=(SELECT MAX(DATA_FORN) FROM FORNECIMENTO_CONF fc)');
      Add('AND f.STATUS >-1');
      Add('AND l.ID_PROPRIEDADE='+vidPropriedade);
      FORNECIMENTO_PREVISTO.SQL.Text;
      Open;
      vQtd := FORNECIMENTO_PREVISTO.RecordCount;
      Result := GetDataSetAsJSON(FORNECIMENTO_PREVISTO);
    end
   end;
   if(DataSet.Name<>'BEBEDOURO') and (DataSet.Name<>'HIST_LEITURA_COCHO')and
   (DataSet.Name<>'FORNECIMENTO_PREVISTO')and(DataSet.Name<>'HIST_CONSUMO')
   then
   begin
    DataSet.Filtered := false;
    DataSet.Close;
    DataSet.Open;
    DataSet.Filter   := 'ID_PROPRIEDADE='+vidPropriedade;
    DataSet.Filtered := true;
    vQtd := DataSet.RecordCount;
    Result := GetDataSetAsJSON(DataSet);
   end;
end;

function TdmDB.GetHistSanidadePostPropriedade(DataSet: TDataSet;
  obj: TJSONObject): TJSONObject;
var
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 InsertInto : string;
 vJsonString :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1: TJSONArray;
 vidPropriedade:string;
 IStatus:integer;
begin
   vJsonString      := Obj.ToString;
   vJoInsert        := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
   vJoItem          := vJoInsert.GetValue('IDPROPRIEDADE') as TJSONArray;
   vJoItemO         := vJoItem.Items[0] as TJSONObject;
   vidPropriedade   :=  vJoItemO.GetValue('id').value;
   HIST_SANIDADE.Filtered := false;
   HIST_SANIDADE.Close;
   HIST_SANIDADE.Open;
   HIST_SANIDADE.Filter   := 'ID_PROPRIEDADE='+vidPropriedade;
   HIST_SANIDADE.Filtered := true;
   if not HIST_SANIDADE.IsEmpty then
   begin
    StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     TxtJSON.WriteStartObject; //Objeto maior
     TxtJSON.WritePropertyName('HIST_SANIDADE');
     TxtJSON.WriteStartArray; //Objeto pedido
     while not HIST_SANIDADE.Eof do
     begin
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('INSERT');
      txtJson.WriteValue(HIST_SANIDADE.FieldByName('InsertInto').AsString);
      txtJson.WriteEndObject;
      HIST_SANIDADE.Next;
     end;
     TxtJSON.WriteEndArray; //Fecha Array dos Itens
     TxtJSON.WriteEndObject;  //Fecha Cabecalho do pedido
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end
   else
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Nenhum HIST_SANIDADE encontrado!');
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
end;

end.
