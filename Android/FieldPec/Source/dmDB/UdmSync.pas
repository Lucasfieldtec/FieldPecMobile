unit UdmSync;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  System.JSON,FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client,System.Json.writers,System.IniFiles,System.JSON.Types,
  IdBaseComponent, IdComponent, IdIPWatch, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Stan.StorageJSON;

type
  TdmSync = class(TDataModule)
    USERS: TFDQuery;
    qryAux: TFDQuery;
    PROPRIEDADES: TFDQuery;
    CURRAIS: TFDQuery;
    ALIMENTO: TFDQuery;
    RACA: TFDQuery;
    CATEGORIAS: TFDQuery;
    CATEGORIA_PADRAO: TFDQuery;
    PRODUTORES: TFDQuery;
    AUX_REBANHO: TFDQuery;
    ANIMAIS: TFDQuery;
    BEBEDOURO: TFDQuery;
    COCHO: TFDQuery;
    COCHOID: TIntegerField;
    COCHOID_PASTO: TIntegerField;
    COCHONOME: TStringField;
    COCHOTAG: TStringField;
    COCHOID_USUARIO: TIntegerField;
    COCHODATAREG: TSQLTimeStampField;
    COCHOSTATUS: TIntegerField;
    COCHOID_MINERAL: TIntegerField;
    COCHOMETRAGEM: TBCDField;
    COCHOCREEPFEED: TIntegerField;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    AUX_MOTIVO_MOVIMENTACAO: TFDQuery;
    SUPLEMENTO_MINERAL: TFDQuery;
    LOTE_NUTRICIONAL: TFDQuery;
    LEITURA_COCHO: TFDQuery;
    HIST_LEITURA_COCHO: TFDQuery;
    AUX_NOTAS_LEITURA: TFDQuery;
    AUX_NOTAS_LEITURAID: TIntegerField;
    AUX_NOTAS_LEITURANOTA: TFMTBCDField;
    AUX_NOTAS_LEITURAAJUSTE: TBCDField;
    HIST_CONSUMO: TFDQuery;
    HIST_CONSUMOID_LOTE: TIntegerField;
    HIST_CONSUMODATA_CONSUMO: TDateField;
    HIST_CONSUMOMN: TBCDField;
    HIST_CONSUMOMS: TBCDField;
    RACAO: TFDQuery;
    RACAOINSUMOS: TFDQuery;
    FORNECIMENTO_CONF: TFDQuery;
    FORNECIMENTO_PREVISTO: TFDQuery;
    RACAOID: TIntegerField;
    RACAOTIPO: TIntegerField;
    RACAONOME: TStringField;
    RACAOGMD: TBCDField;
    RACAOMATERIASECA: TBCDField;
    RACAOSTATUS: TIntegerField;
    RACAODATAREGISTRO: TSQLTimeStampField;
    RACAOIDUSUARIO: TIntegerField;
    RACAODATAALTERACAO: TSQLTimeStampField;
    RACAOIDUSUARIOALTERACAO: TIntegerField;
    RACAOVALORKG: TBCDField;
    RACAODATAFORMULACAO: TDateField;
    RACAOID_PROPRIEDADE: TIntegerField;
    RACAOIMS_PV: TBCDField;
    RACAOTEMPO_MISTURA: TIntegerField;
    RACAOINSUMOSID: TIntegerField;
    RACAOINSUMOSIDRACAO: TIntegerField;
    RACAOINSUMOSIDINSUMOALIMENTO: TIntegerField;
    RACAOINSUMOSPERCENTMATERIASECA: TBCDField;
    RACAOINSUMOSKGMATERIASECA: TBCDField;
    RACAOINSUMOSINCLUSAOMATERIASECA: TBCDField;
    RACAOINSUMOSINCLUSAOMATERIANATURAL: TBCDField;
    RACAOINSUMOSVALORKG: TBCDField;
    RACAOINSUMOSVALORINCLUSAO: TBCDField;
    RACAOINSUMOSSTATUS: TIntegerField;
    RACAOINSUMOSDATAREGISTRO: TSQLTimeStampField;
    RACAOINSUMOSIDUSUARIO: TIntegerField;
    RACAOINSUMOSDATAALTERACAO: TSQLTimeStampField;
    RACAOINSUMOSIDUSUARIOALTERACAO: TIntegerField;
    RACAOINSUMOSKGMATERIANATURAL: TBCDField;
    RACAOINSUMOSORDEM_FABRICACAO: TIntegerField;
    RACAOINSUMOSID_PREMISTURA: TIntegerField;
    RACAOINSUMOSTOLERANCIA_FAB: TBCDField;
    FORNECIMENTO_CONFID_LOTE: TIntegerField;
    FORNECIMENTO_CONFID_LOCAL: TIntegerField;
    FORNECIMENTO_CONFQTD_CAB: TIntegerField;
    FORNECIMENTO_CONFMEDIA_PESO: TBCDField;
    FORNECIMENTO_CONFDATA_FORN: TDateField;
    FORNECIMENTO_CONFHORA_FORN: TTimeField;
    FORNECIMENTO_CONFTRATO: TIntegerField;
    FORNECIMENTO_CONFID_RACAO: TIntegerField;
    FORNECIMENTO_CONFMS_RACAO: TBCDField;
    FORNECIMENTO_CONFVALOR_KG_RACAO: TBCDField;
    FORNECIMENTO_CONFPREVISTO_MN_KG: TIntegerField;
    FORNECIMENTO_CONFREALIZADO_MN_KG: TIntegerField;
    FORNECIMENTO_CONFCUSTO_TOTAL_TRATO: TBCDField;
    FORNECIMENTO_CONFID_MOTORISTA: TIntegerField;
    FORNECIMENTO_CONFID_USUARIO: TIntegerField;
    FORNECIMENTO_CONFDATAREG: TSQLTimeStampField;
    FORNECIMENTO_CONFSTATUS: TIntegerField;
    FORNECIMENTO_CONFLOTE_FABRICACAO: TStringField;
    FORNECIMENTO_CONFID_USUARIO_ALTERACAO: TIntegerField;
    FORNECIMENTO_CONFDATA_ALTERACAO: TSQLTimeStampField;
    QryAuxLoop: TFDQuery;
    FORNECIMENTO_PREVISTOID_LOTE: TIntegerField;
    FORNECIMENTO_PREVISTOID_LOCAL: TIntegerField;
    FORNECIMENTO_PREVISTOQTD_CAB: TIntegerField;
    FORNECIMENTO_PREVISTOMEDIA_PESO: TBCDField;
    FORNECIMENTO_PREVISTODATA_FORN: TDateField;
    FORNECIMENTO_PREVISTOHORA_FORN: TTimeField;
    FORNECIMENTO_PREVISTOTRATO: TIntegerField;
    FORNECIMENTO_PREVISTOID_RACAO: TIntegerField;
    FORNECIMENTO_PREVISTOMS_RACAO: TBCDField;
    FORNECIMENTO_PREVISTOVALOR_KG_RACAO: TBCDField;
    FORNECIMENTO_PREVISTOPREVISTO_MN_KG: TIntegerField;
    FORNECIMENTO_PREVISTOREALIZADO_MN_KG: TIntegerField;
    FORNECIMENTO_PREVISTOCUSTO_TOTAL_TRATO: TBCDField;
    FORNECIMENTO_PREVISTOID_MOTORISTA: TIntegerField;
    FORNECIMENTO_PREVISTOID_USUARIO: TIntegerField;
    FORNECIMENTO_PREVISTODATAREG: TSQLTimeStampField;
    FORNECIMENTO_PREVISTOSTATUS: TIntegerField;
    FORNECIMENTO_PREVISTOLOTE_FABRICACAO: TStringField;
    FORNECIMENTO_PREVISTOID_USUARIO_ALTERACAO: TIntegerField;
    FORNECIMENTO_PREVISTODATA_ALTERACAO: TSQLTimeStampField;
    FORNECIMENTO_CONFID: TIntegerField;
    FORNECIMENTO_PREVISTOID: TIntegerField;
    HIST_CONSUMOID_CURRAL: TIntegerField;
    HIST_CONSUMOIMSPV: TBCDField;
    FORNECIMENTO_PREVISTOSYNC: TIntegerField;
    FARMACO: TFDQuery;
    PROTOCOLO_SANITARIO: TFDQuery;
    PROTOCOLO_FARMACOS: TFDQuery;
    FARMACOID: TIntegerField;
    FARMACONOME: TStringField;
    FARMACOPRINCIPIO_ATIVO: TStringField;
    FARMACOTIPO_APICACAO: TIntegerField;
    FARMACOML_DOSE_FIXA: TBCDField;
    FARMACOML_DOSE_PV: TBCDField;
    FARMACOKG_DOSE_PV: TBCDField;
    FARMACOCARENCIA_DIA: TIntegerField;
    FARMACOVALOR_ML: TFloatField;
    PROTOCOLO_SANITARIOID: TIntegerField;
    PROTOCOLO_SANITARIONOME: TStringField;
    PROTOCOLO_SANITARIOSTATUS: TIntegerField;
    PROTOCOLO_SANITARIOTIPO: TIntegerField;
    PROTOCOLO_FARMACOSID: TIntegerField;
    PROTOCOLO_FARMACOSID_FARMACO: TIntegerField;
    PROTOCOLO_FARMACOSTIPO_DOSAGEM: TIntegerField;
    PROTOCOLO_FARMACOSDOSE_FIXA_ML: TBCDField;
    PROTOCOLO_FARMACOSDOSE_PESO_ML: TBCDField;
    PROTOCOLO_FARMACOSDOSE_PESO_KG: TBCDField;
    PROTOCOLO_FARMACOSID_PROTOCOLO: TIntegerField;
    PROTOCOLO_FARMACOSCARENCIA_DIAS: TIntegerField;
  private

  public
    Host,Porta:string;
    function  GetGenerico(DataSet: TFDQuery): string;
    function  GetGenericoPostIdPropriedade(DataSet: TFDQuery): string;
    function  GetAnimais: string;
    function  GetHistSanidade: string;
    procedure DeletaTabelaSync(Atabela:string);
    procedure DeletaTabelaSyncPropriedade(Atabela,vIDProp:string);
    procedure DeletaHistConsumoSyncPropriedade(vIDProp:string);
    procedure DeletaFornePrevSyncPropriedade(vIDProp:string);
    function  TestaServidor: string;
    procedure AtualizaIdSyncFabricacao(AIdOld, AidNew: string);
    procedure AlteraFlagSync(Atabela, AFlag,Aid: string);
  end;

var
  dmSync: TdmSync;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UDmDB, UPrincipal, UFSync;

{$R *.dfm}

{ TdmSync }



{ TdmSync }

procedure TdmSync.AlteraFlagSync(Atabela, AFlag,Aid: string);
begin
  with qryAux,qryAux.SQL do
  begin
    Clear;
    Add('update '+Atabela+' set sync='+AFlag);
    Add('where id='+Aid);
    try
     ExecSQL;
    except
     on E: Exception do
      TThread.Synchronize(nil, procedure
      begin
       ShowMessage(e.Message);
      end);
    end;
  end;
end;

procedure TdmSync.AtualizaIdSyncFabricacao(AIdOld, AidNew: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('update FABRICACAO set id='+AidNew);
   Add('where id='+AIdOld);
   try
    ExecSQL;
   except
     on E: Exception do
      TThread.Synchronize(nil, procedure
      begin
       ShowMessage(e.Message);
      end);
   end;

   Clear;
   Add('update FABRICACAO_INSUMOS set ID_FABRICACAO='+AidNew);
   Add('where ID_FABRICACAO='+AIdOld);
   try
    ExecSQL;
   except
     on E: Exception do
      TThread.Synchronize(nil, procedure
      begin
       ShowMessage(e.Message);
      end);
   end
 end;
end;

procedure TdmSync.DeletaFornePrevSyncPropriedade(vIDProp: string);
begin
  with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from FORNECIMENTO_CONF');
   Add('where ID_LOCAL in(select id from CURRAIS where ID_PROPRIEDADE='+vIDProp+')');
   try
    ExecSQL;
   except
     on E: Exception do
      TThread.Synchronize(nil, procedure
      begin
       ShowMessage(e.Message);
      end);
   end
 end;
end;

procedure TdmSync.DeletaHistConsumoSyncPropriedade(vIDProp: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from HIST_CONSUMO');
   Add('where id_lote in(select id from LOTE_NUTRICIONAL where ID_PROPRIEDADE='+vIDProp+')');
   try
    ExecSQL;
   except
     on E: Exception do
      TThread.Synchronize(nil, procedure
      begin
       ShowMessage(e.Message);
      end);
   end
 end;
end;

procedure TdmSync.DeletaTabelaSync(Atabela: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from '+Atabela);
   try
    ExecSQL;
   except
     on E: Exception do
      TThread.Synchronize(nil, procedure
      begin
       ShowMessage(e.Message);
      end);
   end
 end;
end;

function TdmSync.TestaServidor: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
begin
  if (Host.Length=0) or (Porta.Length=0) then
  begin
   dmdb.qryConfig.Close;
   dmdb.qryConfig.Open;
   Host  := dmdb.qryConfigIP_SERVIDOR.AsString;
   Porta := dmdb.qryConfigPOTA_SERVIDOR.AsString;
  end;

   Url :='http://'+Host+':'+Porta+'/GetTesteServidor';
   frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := frmPrincipal.IdHTTP1.Get(URL);
    Result:= vJsonString;
   except
     Result  := 'Erro';
   end;
end;


procedure TdmSync.DeletaTabelaSyncPropriedade(Atabela,vIDProp: string);
begin
  with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from '+Atabela);
   Add('where ID_PROPRIEDADE='+vIDProp);
   try
    ExecSQL;
   except
     on E: Exception do
      TThread.Synchronize(nil, procedure
      begin
       ShowMessage(e.Message);
      end);
   end
 end;
end;

function TdmSync.GetAnimais: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
 JsonToSend  : TStringStream;
begin
 if (Host.Length=0) or (Porta.Length=0) then
  begin
   dmdb.qryConfig.Close;
   dmdb.qryConfig.Open;
   Host  := dmdb.qryConfigIP_SERVIDOR.AsString;
   Porta := dmdb.qryConfigPOTA_SERVIDOR.AsString;
  end;

  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  TxtJSON.WriteStartObject;
  TxtJSON.WritePropertyName('IDPROPRIEDADE');
  TxtJSON.WriteStartArray;
    txtJson.WriteStartObject;
    txtJson.WritePropertyName('id');
    txtJson.WriteValue(dmdb.vIdPropriedade);
  TxtJSON.WriteEndArray;
  TxtJSON.WriteEndObject;
  LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
  JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
 Url :='http://'+Host+':'+Porta+'/ANIMAL';
 frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
 try
  vJsonString        := frmPrincipal.IdHTTP1.Post(URL,JsonToSend);
  DeletaTabelaSyncPropriedade('ANIMAL',dmdb.vIdPropriedade);
  if(vJsonString<>'{"Mensagem":"Nenhum Animal encontrado!"}') then
  begin
    jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
     vJoGet := jSubObj.GetValue<TJSONArray>('ANIMAL') as TJSONArray;
     for i := 0 to vJoGet.Count-1 do
     begin
        vJoGetJ         := vJoGet.Items[i] as TJSONObject;
        vID             := vJoGetJ.GetValue('INSERT').value;
        if vID.Length>0 then
        begin
          with qryAux,qryAux.SQL do
          begin
            Clear;
            Add(vID);
            try
              ExecSQL;
              TThread.Synchronize(nil, procedure
               begin
                  frmPrincipal.FrameSync1.mlog.text :=('Animais '+intToStr(i)+' de '+intToStr(vJoGet.Count));
               end);
            except
              on E: Exception do
               Raise exception.Create(E.Message);
            end;
          end;
        end;
     end;
     result:='Animais Baixado com Sucesso!'
  end
  else
   Result :=vJsonString;
 except
 on E: Exception do
   begin
     frmPrincipal.FrameSync1.mlog.text :=(E.Message);
   end;
 end;
end;

function TdmSync.GetHistSanidade: string;
var
 Url,vJsonString,vID:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
 JsonToSend  : TStringStream;
begin
 if (Host.Length=0) or (Porta.Length=0) then
  begin
   dmdb.qryConfig.Close;
   dmdb.qryConfig.Open;
   Host  := dmdb.qryConfigIP_SERVIDOR.AsString;
   Porta := dmdb.qryConfigPOTA_SERVIDOR.AsString;
  end;

  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  TxtJSON.WriteStartObject;
  TxtJSON.WritePropertyName('IDPROPRIEDADE');
  TxtJSON.WriteStartArray;
    txtJson.WriteStartObject;
    txtJson.WritePropertyName('id');
    txtJson.WriteValue(dmdb.vIdPropriedade);
  TxtJSON.WriteEndArray;
  TxtJSON.WriteEndObject;
  LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
  JsonToSend := TStringStream.Create(LJsonObj.ToJSON);
 Url :='http://'+Host+':'+Porta+'/HIST_SANIDADE';
 frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
 try
  vJsonString        := frmPrincipal.IdHTTP1.Post(URL,JsonToSend);
  DeletaTabelaSyncPropriedade('HIST_SANIDADE',dmdb.vIdPropriedade);
  if(vJsonString<>'{"Mensagem":"Nenhum Historico Sanidade encontrado!"}') then
  begin
    jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
     vJoGet := jSubObj.GetValue<TJSONArray>('HIST_SANIDADE') as TJSONArray;
     for i := 0 to vJoGet.Count-1 do
     begin
        vJoGetJ         := vJoGet.Items[i] as TJSONObject;
        vID             := vJoGetJ.GetValue('INSERT').value;
        if vID.Length>0 then
        begin
          with qryAux,qryAux.SQL do
          begin
            Clear;
            Add(vID);
            try
              ExecSQL;
              TThread.Synchronize(nil, procedure
               begin
                  frmPrincipal.FrameSync1.mlog.text :=('Historico Sanidade '+intToStr(i)+' de '+intToStr(vJoGet.Count));
               end);
            except
              on E: Exception do
               Raise exception.Create(E.Message);
            end;
          end;
        end;
     end;
     result:='Animais Baixado com Sucesso!'
  end
  else
   Result :=vJsonString;
 except
 on E: Exception do
   begin
     frmPrincipal.FrameSync1.mlog.text :=(E.Message);
   end;
 end;
end;


function TdmSync.GetGenerico(DataSet: TFDQuery): string;
var
 Url,vJsonString,vIsert,vJsonCopy,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
 f: TField;
begin
  if (Host.Length=0) or (Porta.Length=0) then
  begin
   dmdb.qryConfig.Close;
   dmdb.qryConfig.Open;
   Host  := dmdb.qryConfigIP_SERVIDOR.AsString;
   Porta := dmdb.qryConfigPOTA_SERVIDOR.AsString;
  end;


  Url := 'http://'+Host+':'+Porta+'/'+DataSet.Name;
  frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
   try
    vJsonString        := frmPrincipal.IdHTTP1.Get(URL);
    vJsonCopy          := copy(vJsonString,0,6);
     if(vJsonCopy<>'{"Erro') then
     begin
      if(vJsonString<>'{"'+DataSet.Name+'":[]}') then
      begin
        DeletaTabelaSync(DataSet.Name);
        DataSet.Close;
        DataSet.Open;
        jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
         vJoGet := jSubObj.GetValue<TJSONArray>(DataSet.Name) as TJSONArray;
         for i := 0 to vJoGet.Count-1 do
         begin
            vJoGetJ         := vJoGet.Items[i] as TJSONObject;
            DataSet.Close;
            DataSet.Open;
            DataSet.Insert;
             for f in DataSet.Fields do
             begin
              vField:=f.FieldName;
              DataSet.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
             end;
            try
             DataSet.ApplyUpdates(-1);
             TThread.Synchronize(nil, procedure
             begin
              frmPrincipal.FrameSync1.mlog.text :=('Registros '+intToStr(i)+' de '+intToStr(vJoGet.Count));
             end);
            except
             on E: Exception do
              result:='Erro:'+E.Message;
            end;
         end;
         result:='Dados Baixados com Sucesso!'
      end
      else
       Result :=StringReplace(DataSet.Name,'T','',[rfReplaceAll])+' Sem Dados Para Baixar!'
     end
     else
       Result :=vJsonString;
     except
     on E: Exception do
       begin
         result:='Erro ao comunicar com Servidor:'+E.Message;
       end;
     end;
end;

function TdmSync.GetGenericoPostIdPropriedade(DataSet: TFDQuery): string;
var
 Url,vJsonString,vIsert,vJsonCopy,
 vField,vFieldJS,vId:string;
 vJoInsert,vJoItemO,vJoItemO1,jSubObj,vJoGetJ : TJSONObject;
 vJoItem,vJoItem1,vJoGet  : TJSONArray;
 JsonValue,JsonId:TJSONValue;
 I,J,z:integer;
 joName,objJson,joItem : TJSONObject;
 joItems: TJSONArray;
 StrAux      : TStringWriter;
 txtJson     : TJsonTextWriter;
 LJsonObj    : TJSONObject;
 JsonToSend  : TStringStream;
 f: TField;
begin
  if (Host.Length=0) or (Porta.Length=0) then
  begin
   dmdb.qryConfig.Close;
   dmdb.qryConfig.Open;
   Host  := dmdb.qryConfigIP_SERVIDOR.AsString;
   Porta := dmdb.qryConfigPOTA_SERVIDOR.AsString;
  end;

  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  TxtJSON.WriteStartObject;
  TxtJSON.WritePropertyName('IDPROPRIEDADE');
  TxtJSON.WriteStartArray;
    txtJson.WriteStartObject;
    txtJson.WritePropertyName('id');
    txtJson.WriteValue(dmdb.vIdPropriedade);
  TxtJSON.WriteEndArray;
  TxtJSON.WriteEndObject;
  LJsonObj := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
  JsonToSend := TStringStream.Create(LJsonObj.ToJSON);

  Url := 'http://'+Host+':'+Porta+'/'+DataSet.Name;
  frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
  frmPrincipal.IdHTTP1.Request.ContentType := 'application/json';
  frmPrincipal.IdHTTP1.Request.Accept      := 'application/json';
  try
    vJsonString        := frmPrincipal.IdHTTP1.Post(URL,JsonToSend);
    vJsonCopy          := copy(vJsonString,0,6);
     if(vJsonCopy<>'{"Erro') then
     begin
      if(vJsonString<>'{"'+DataSet.Name+'":[]}') then
      begin
        if (DataSet.Name='COCHO')then
         dmdb.DeletaCochoPropriedade;
        if (DataSet.Name='BEBEDOURO') then
         dmdb.DeletaBebedouroPropriedade;
        if (DataSet.Name='HIST_CONSUMO') then
          DeletaHistConsumoSyncPropriedade(dmdb.vIdPropriedade);
        if (DataSet.Name='FORNECIMENTO_PREVISTO') then
          DeletaFornePrevSyncPropriedade(dmdb.vIdPropriedade);
        if (DataSet.Name<>'COCHO')and(DataSet.Name<>'BEBEDOURO')
         and(DataSet.Name<>'HIST_CONSUMO')and(DataSet.Name<>'FORNECIMENTO_PREVISTO') then
         DeletaTabelaSyncPropriedade(DataSet.Name,dmdb.vIdPropriedade);

        DataSet.Close;
        DataSet.Open;
        jSubObj  := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
         vJoGet := jSubObj.GetValue<TJSONArray>(DataSet.Name) as TJSONArray;
         for i := 0 to vJoGet.Count-1 do
         begin
            vJoGetJ         := vJoGet.Items[i] as TJSONObject;
            DataSet.Close;
            DataSet.Open;
            DataSet.Insert;
             for f in DataSet.Fields do
             begin
              vField:=f.FieldName;
              if (DataSet.Name='COCHO')or(DataSet.Name='BEBEDOURO') then
              begin
               if vField<>'ID_PROPRIEDADE' then
                DataSet.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
              end
              else
              begin
               if vField<>'SYNC' then
                DataSet.FieldByName(vField).AsString := vJoGetJ.GetValue(vField).value;
              end;
             end;
             if (DataSet.Name='FORNECIMENTO_PREVISTO') then
              DataSet.FieldByName('SYNC').AsInteger :=1;
            try
             DataSet.ApplyUpdates(-1);
             TThread.Synchronize(nil, procedure
             begin
              frmPrincipal.FrameSync1.mlog.text :=('Registros '+intToStr(i)+' de '+intToStr(vJoGet.Count));
             end);
            except
             on E: Exception do
              result:='Erro:'+E.Message;
            end;
         end;
         result:='Dados Baixados com Sucesso!'
      end
      else
       Result :='Sem Dados Para Baixar!'
     end
     else
       Result :=vJsonString;
 except
 on E: Exception do
   begin
     result:='Erro ao comunicar com Servidor:'+E.Message;
   end;
 end;
end;
end.
