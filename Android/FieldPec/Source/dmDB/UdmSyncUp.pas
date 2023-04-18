unit UdmSyncUp;

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
  TdmSyncUp = class(TDataModule)
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
    MOVIMENTACAO_ANIMAL: TFDQuery;
    QryAuxLoop: TFDQuery;
    qryAux: TFDQuery;
    FORNECIMENTO: TFDQuery;
    FORNECIMENTOID_PASTO: TIntegerField;
    FORNECIMENTOID_PRODUTO: TIntegerField;
    FORNECIMENTODATA_FORNECIMENTO: TDateField;
    FORNECIMENTOREALIZADO_COCHO_KG: TBCDField;
    FORNECIMENTOREALIZADO_COCHO_SACO: TBCDField;
    FORNECIMENTOREALIZADO_ESTOQUE_KG: TBCDField;
    FORNECIMENTOREALIZADO_ESTOQUE_SACO: TBCDField;
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
    FORNECIMENTOESTOQUE_ORIGEM: TIntegerField;
    FORNECIMENTOSYNC: TIntegerField;
    FORNECIMENTOID: TFDAutoIncField;
    LEITURA_COCHO: TFDQuery;
    FABRICACAO_INSUMOS: TFDQuery;
    FABRICACAO_INSUMOSID: TIntegerField;
    FABRICACAO_INSUMOSID_FABRICACAO: TIntegerField;
    FABRICACAO_INSUMOSID_ALIMENTO: TIntegerField;
    FABRICACAO_INSUMOSID_CONCENTRADO: TIntegerField;
    FABRICACAO_INSUMOSDATA_FAB: TDateField;
    FABRICACAO_INSUMOSHORA_INI: TTimeField;
    FABRICACAO_INSUMOSHORA_FIM: TTimeField;
    FABRICACAO_INSUMOSMS_INSUMO: TBCDField;
    FABRICACAO_INSUMOSKG_PREVISTO: TBCDField;
    FABRICACAO_INSUMOSKG_FABRICADO: TBCDField;
    FABRICACAO_INSUMOSDATAREG: TDateField;
    FABRICACAO_INSUMOSID_USUARIO: TIntegerField;
    FABRICACAO_INSUMOSID_USUARIO_ALTERACAO: TIntegerField;
    FABRICACAO_INSUMOSDATA_ALTERACAO: TSQLTimeStampField;
    FABRICACAO_INSUMOSSTATUS: TIntegerField;
    FABRICACAO_INSUMOSVALOR_KG: TBCDField;
    FABRICACAO_INSUMOSCUSTO: TFMTBCDField;
    FABRICACAO: TFDQuery;
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
    FORNECIMENTO_CONF: TFDQuery;
    FORNECIMENTO_CONFID: TFDAutoIncField;
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
    FORNECIMENTO_CONFSYNC: TIntegerField;
    QryAuxLoopFab: TFDQuery;
    ANIMAL_SANIDADE: TFDQuery;
    ANIMAL_SANIDADEID: TFDAutoIncField;
    ANIMAL_SANIDADEID_ANIMAL: TIntegerField;
    ANIMAL_SANIDADEID_FARMACO: TIntegerField;
    ANIMAL_SANIDADEID_PROTOCOLO: TIntegerField;
    ANIMAL_SANIDADEDOSE_ML: TBCDField;
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
    ANIMAL_SANIDADESYNC: TIntegerField;
  private
    procedure AlteraFlagSync(Atabela, AFlag,Aid: string);
    procedure AtualizaIdSyncFabricacao(AIdOld, AidNew: string);
  public
   Host,Porta:string;
   function PostLimpezaBebedouro: string;
   function PostMovAnimal: string;
   function PostForneMineral: string;
   function PostLeituraCocho: string;
   function PostFabricacao: string;
   function PostSanidade: string;
   function PostFabricacaoInsumos(vIdFabricacao: string):string;
   function PostFornecimentoConf: string;
  end;

var
  dmSyncUp: TdmSyncUp;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UDmDB, UPrincipal, UdmSync;

{$R *.dfm}

function TdmSyncUp.PostFabricacao: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 Url := 'http://'+Host+':'+Porta+'/FABRICACAO';
   with QryAuxLoopFab,QryAuxLoopFab.SQL do
   begin
     Clear;
     Add('select * from fabricacao where status=2 and sync=0');
     Open;
   end;
   QryAuxLoopFab.First;
   while not QryAuxLoopFab.Eof do
   begin
    with FABRICACAO,FABRICACAO.SQL do
     begin
      Clear;
      Add('select * from fabricacao where id='+QryAuxLoopFab.FieldByName('id').AsString);
      Open;
     end;
     frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
     frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
     frmPrincipal.IdHTTP1.Request.ContentType := 'application/json';
     frmPrincipal.IdHTTP1.Request.Accept      := 'application/json';
     if not FABRICACAO.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       FABRICACAO.SaveToStream(JsonToSend,sfJSON);
       try
         vReultHTTP := frmPrincipal.IdHTTP1.Post(url,JsonToSend);
         if copy(vReultHTTP,0,4)='{"OK'then
         begin
           vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
           vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
           AlteraFlagSync('FABRICACAO','1',QryAuxLoopFab.FieldByName('id').AsString);
           AtualizaIdSyncFabricacao(QryAuxLoopFab.FieldByName('id').AsString,
            vReultHTTP);
           PostFabricacaoInsumos(vReultHTTP);
         end
         else
          TThread.Synchronize(nil, procedure
          begin
           ShowMessage(vReultHTTP);
          end);
         Inc(I);
         QryAuxLoopFab.Next;
       except
        on E: Exception do
        begin
          TThread.Synchronize(nil, procedure
          begin
           ShowMessage('Erro ao sioncronizar Start Diario : '+e.Message);
          end);
          Result:='Erro ao sioncronizar Abastecimento : '+e.Message;
        end;
       end;
     end;
   end;
 Result     := vReultHTTP;
end;

procedure TdmSyncUp.AtualizaIdSyncFabricacao(AIdOld, AidNew: string);
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

function TdmSyncUp.PostFabricacaoInsumos(vIdFabricacao: string): string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 with QryAuxLoop,QryAuxLoop.SQL do
 begin
   Clear;
   Add('SELECT * FROM FABRICACAO_INSUMOS');
   Add('WHERE SYNC=0 AND ID_FABRICACAO='+vIdFabricacao);
   Open;
   while not QryAuxLoop.Eof do
   begin
     with FABRICACAO_INSUMOS,FABRICACAO_INSUMOS.SQL do
     begin
      Clear;
      Add('select * from FABRICACAO_INSUMOS where id='+QryAuxLoop.FieldByName('id').AsString);
      Open;
     end;
     if not FABRICACAO_INSUMOS.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       FABRICACAO_INSUMOS.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/FABRICACAO_INSUMOS';
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.ContentType := 'application/json';
       frmPrincipal.IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP := frmPrincipal.IdHTTP1.Post(url,JsonToSend);
         if copy(vReultHTTP,0,4)='{"OK'then
          dmsync.AlteraFlagSync('FABRICACAO_INSUMOS','1',QryAuxLoop.FieldByName('id').AsString)
         else
          TThread.Synchronize(nil, procedure
          begin
           ShowMessage(vReultHTTP);
          end);
         inc(i);
         QryAuxLoop.Next;
       except
        on E: Exception do
        begin
         TThread.Synchronize(nil, procedure
         begin
          ShowMessage('Erro ao sioncronizar FABRICACAO INSUMOS: '+e.Message);
         end);
          Result:='Erro ao sioncronizar FABRICACAO INSUMOS: '+e.Message;
        end;
       end;
     end;
   end;
 end;
 Result     := vReultHTTP;
end;


procedure TdmSyncUp.AlteraFlagSync(Atabela, AFlag, Aid: string);
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

function TdmSyncUp.PostLimpezaBebedouro: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 with QryAuxLoop,QryAuxLoop.SQL do
 begin
   Clear;
   Add('select * from LIMPEZABEBEDOURO where SYNC=0');
   Open;
   I :=1;
   while not QryAuxLoop.Eof do
   begin
     frmPrincipal.FrameSync1.mlog.text:='Enviando Limpeza Bebedouro:'+
      IntToStr(i)+' de '+IntToStr(QryAuxLoop.RecordCount) ;

     with LIMPEZABEBEDOURO,LIMPEZABEBEDOURO.SQL do
     begin
      Clear;
      Add('select * from LIMPEZABEBEDOURO a');
      Add('where id='+QryAuxLoop.FieldByName('id').AsString);
      Open;
     end;
     if not LIMPEZABEBEDOURO.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       LIMPEZABEBEDOURO.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/LIMPEZABEBEDOURO';
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.ContentType := 'application/json';
       frmPrincipal.IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP := frmPrincipal.IdHTTP1.Post(url,JsonToSend);
         if copy(vReultHTTP,0,4)='{"OK'then
         begin
           vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
           vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
           AlteraFlagSync('limpezabebedouro','1',vReultHTTP);
         end
         else
          TThread.Synchronize(nil, procedure
          begin
           ShowMessage(vReultHTTP);
          end);
         inc(I);
         QryAuxLoop.Next;
       except
        on E: Exception do
        begin
         TThread.Synchronize(nil, procedure
         begin
           ShowMessage('Erro ao sioncronizar Limpeza de Bebedouro : '+e.Message);
         end);
         Result:='Erro ao sioncronizar Limpeza de Bebedouro : '+e.Message;
         Break;
        end;
       end;
     end;
   end;
 end;
 Result:= vReultHTTP;
end;

function TdmSyncUp.PostFornecimentoConf: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 with QryAuxLoop,QryAuxLoop.SQL do
 begin
   Clear;
   Add('select * from FORNECIMENTO_CONF  where SYNC=0 and REALIZADO_MN_KG>0');
   Open;
   I :=1;
   while not QryAuxLoop.Eof do
   begin
     frmPrincipal.FrameSync1.mlog.text:='Enviando Fornecimento :'+
      IntToStr(i)+' de '+IntToStr(QryAuxLoop.RecordCount) ;

     with FORNECIMENTO_CONF,FORNECIMENTO_CONF.SQL do
     begin
      Clear;
      Add('select * from FORNECIMENTO_CONF a');
      Add('where id='+QryAuxLoop.FieldByName('id').AsString);
      Open;
     end;
     if not FORNECIMENTO_CONF.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       FORNECIMENTO_CONF.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/FORNECIMENTO_CONF';
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.ContentType := 'application/json';
       frmPrincipal.IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP := frmPrincipal.IdHTTP1.Post(url,JsonToSend);
         if copy(vReultHTTP,0,4)='{"OK'then
         begin
           vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
           vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
           AlteraFlagSync('FORNECIMENTO_CONF','1',vReultHTTP);
         end
         else
          TThread.Synchronize(nil, procedure
          begin
           ShowMessage(vReultHTTP);
          end);
         inc(I);
         QryAuxLoop.Next;
       except
        on E: Exception do
        begin
         TThread.Synchronize(nil, procedure
         begin
           ShowMessage('Erro ao sioncronizar Start Diario : '+e.Message);
         end);
         Result:='Erro ao sioncronizar Start Diario : '+e.Message;
         Break;
        end;
       end;
     end;
   end;
 end;
 Result:= vReultHTTP;
end;

function TdmSyncUp.PostForneMineral: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 with QryAuxLoop,QryAuxLoop.SQL do
 begin
   Clear;
   Add('select * from fornecimento  where SYNC=0');
   Open;
   I :=1;
   while not QryAuxLoop.Eof do
   begin
     frmPrincipal.FrameSync1.mlog.text:='Enviando Fornecimento de Mineral:'+
      IntToStr(i)+' de '+IntToStr(QryAuxLoop.RecordCount) ;

     with FORNECIMENTO,FORNECIMENTO.SQL do
     begin
      Clear;
      Add('select * from FORNECIMENTO a');
      Add('where id='+QryAuxLoop.FieldByName('id').AsString);
      Open;
     end;
     if not FORNECIMENTO.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       FORNECIMENTO.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/FORNECIMENTO';
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.ContentType := 'application/json';
       frmPrincipal.IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP := frmPrincipal.IdHTTP1.Post(url,JsonToSend);
         if copy(vReultHTTP,0,4)='{"OK'then
         begin
           vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
           vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
           AlteraFlagSync('FORNECIMENTO','1',vReultHTTP);
         end
         else
          TThread.Synchronize(nil, procedure
          begin
           ShowMessage(vReultHTTP);
          end);
         inc(I);
         QryAuxLoop.Next;
       except
        on E: Exception do
        begin
         TThread.Synchronize(nil, procedure
         begin
           ShowMessage('Erro ao sioncronizar Start Diario : '+e.Message);
         end);
         Result:='Erro ao sioncronizar Start Diario : '+e.Message;
         Break;
        end;
       end;
     end;
   end;
 end;
 Result:= vReultHTTP;
end;

function TdmSyncUp.PostMovAnimal: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if (Host.Length=0) or (Porta.Length=0) then
 begin
  dmdb.qryConfig.Close;
  dmdb.qryConfig.Open;
  Host  := dmdb.qryConfigIP_SERVIDOR.AsString;
  Porta := dmdb.qryConfigPOTA_SERVIDOR.AsString;
 end;
 with QryAuxLoop,QryAuxLoop.SQL do
 begin
   Clear;
   Add('select * from movimentacao_animal where SYNC=0');
   Open;
   I :=1;
   while not QryAuxLoop.Eof do
   begin
     frmPrincipal.FrameSync1.mlog.text:='Enviando Mov. Animal:'+
      IntToStr(i)+' de '+IntToStr(QryAuxLoop.RecordCount) ;

     with MOVIMENTACAO_ANIMAL,MOVIMENTACAO_ANIMAL.SQL do
     begin
      Clear;
      Add('select * from movimentacao_animal a');
      Add('where id='+QryAuxLoop.FieldByName('id').AsString);
      Open;
     end;
     if not MOVIMENTACAO_ANIMAL.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       MOVIMENTACAO_ANIMAL.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/MOVIMENTACAO_ANIMAL';
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.ContentType := 'application/json';
       frmPrincipal.IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP := frmPrincipal.IdHTTP1.Post(url,JsonToSend);
         if copy(vReultHTTP,0,4)='{"OK'then
         begin
           vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
           vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
           AlteraFlagSync('MOVIMENTACAO_ANIMAL','1',vReultHTTP);
         end
         else
          TThread.Synchronize(nil, procedure
          begin
           ShowMessage(vReultHTTP);
          end);
         inc(I);
         QryAuxLoop.Next;
       except
        on E: Exception do
        begin
         TThread.Synchronize(nil, procedure
         begin
           ShowMessage('Erro ao sioncronizar Mov. Animal : '+e.Message);
         end);
         Result:='Erro ao sioncronizar Mov. Animal : '+e.Message;
         Break;
        end;
       end;
     end;
   end;
 end;
 Result:= vReultHTTP;
end;

function TdmSyncUp.PostSanidade: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if (Host.Length=0) or (Porta.Length=0) then
 begin
  dmdb.qryConfig.Close;
  dmdb.qryConfig.Open;
  Host  := dmdb.qryConfigIP_SERVIDOR.AsString;
  Porta := dmdb.qryConfigPOTA_SERVIDOR.AsString;
 end;
 with QryAuxLoop,QryAuxLoop.SQL do
 begin
   Clear;
   Add('SELECT * FROM ANIMAL_SANIDADE WHERE SYNC=0');
   Open;
   I :=1;
   while not QryAuxLoop.Eof do
   begin
     frmPrincipal.FrameSync1.mlog.text:='Enviando Sanidade:'+
      IntToStr(i)+' de '+IntToStr(QryAuxLoop.RecordCount) ;

     with ANIMAL_SANIDADE,ANIMAL_SANIDADE.SQL do
     begin
      Clear;
      Add('select * from ANIMAL_SANIDADE a');
      Add('where id='+QryAuxLoop.FieldByName('id').AsString);
      Open;
     end;
     if not ANIMAL_SANIDADE.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       ANIMAL_SANIDADE.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/ANIMAL_SANIDADE';
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.ContentType := 'application/json';
       frmPrincipal.IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP := frmPrincipal.IdHTTP1.Post(url,JsonToSend);
         if copy(vReultHTTP,0,4)='{"OK'then
         begin
           vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
           vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
           AlteraFlagSync('ANIMAL_SANIDADE','1',vReultHTTP);
         end
         else
          TThread.Synchronize(nil, procedure
          begin
           ShowMessage(vReultHTTP);
          end);
         inc(I);
         QryAuxLoop.Next;
       except
        on E: Exception do
        begin
         TThread.Synchronize(nil, procedure
         begin
           ShowMessage('Erro ao sioncronizar Leitura de Cocho : '+e.Message);
         end);
         Result:='Erro ao sioncronizar Mov. Animal : '+e.Message;
         Break;
        end;
       end;
     end;
   end;
 end;
 Result:= vReultHTTP;
end;

function TdmSyncUp.PostLeituraCocho: string;
var
 URL,vReultHTTP:STRING;
 JsonToSend  : TStringStream;
 I:integer;
begin
 if (Host.Length=0) or (Porta.Length=0) then
 begin
  dmdb.qryConfig.Close;
  dmdb.qryConfig.Open;
  Host  := dmdb.qryConfigIP_SERVIDOR.AsString;
  Porta := dmdb.qryConfigPOTA_SERVIDOR.AsString;
 end;
 with QryAuxLoop,QryAuxLoop.SQL do
 begin
   Clear;
   Add('SELECT * FROM LEITURA_COCHO WHERE SYNC=0');
   Open;
   I :=1;
   while not QryAuxLoop.Eof do
   begin
     frmPrincipal.FrameSync1.mlog.text:='Enviando Leitura de Cocho:'+
      IntToStr(i)+' de '+IntToStr(QryAuxLoop.RecordCount) ;

     with LEITURA_COCHO,LEITURA_COCHO.SQL do
     begin
      Clear;
      Add('select * from LEITURA_COCHO a');
      Add('where id='+QryAuxLoop.FieldByName('id').AsString);
      Open;
     end;
     if not LEITURA_COCHO.IsEmpty then
     begin
       JsonToSend := TStringStream.Create(nil);
       LEITURA_COCHO.SaveToStream(JsonToSend,sfJSON);
       Url := 'http://'+Host+':'+Porta+'/LEITURA_COCHO';
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.CustomHeaders.Clear;
       frmPrincipal.IdHTTP1.Request.ContentType := 'application/json';
       frmPrincipal.IdHTTP1.Request.Accept      := 'application/json';
       try
         vReultHTTP := frmPrincipal.IdHTTP1.Post(url,JsonToSend);
         if copy(vReultHTTP,0,4)='{"OK'then
         begin
           vReultHTTP := StringReplace(vReultHTTP,'{"OK":"','',[rfReplaceAll]);
           vReultHTTP := StringReplace(vReultHTTP,'"}','',[rfReplaceAll]);
           AlteraFlagSync('LEITURA_COCHO','1',vReultHTTP);
         end
         else
          TThread.Synchronize(nil, procedure
          begin
           ShowMessage(vReultHTTP);
          end);
         inc(I);
         QryAuxLoop.Next;
       except
        on E: Exception do
        begin
         TThread.Synchronize(nil, procedure
         begin
           ShowMessage('Erro ao sioncronizar Leitura de Cocho : '+e.Message);
         end);
         Result:='Erro ao sioncronizar Mov. Animal : '+e.Message;
         Break;
        end;
       end;
     end;
   end;
 end;
 Result:= vReultHTTP;
end;

end.
