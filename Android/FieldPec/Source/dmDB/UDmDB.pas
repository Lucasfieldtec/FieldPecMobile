unit UDmDB;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet,System.IOUtils,FMX.Dialogs,
  FireDAC.Phys.SQLiteWrapper.Stat,StrUtils,System.UITypes,System.Math;

type
  Tdmdb = class(TDataModule)
    FCon: TFDConnection;
    qryConfig: TFDQuery;
    qryConfigIP_SERVIDOR: TWideStringField;
    qryConfigPOTA_SERVIDOR: TIntegerField;
    qryConfigSERIAL: TWideStringField;
    qryConfigSalvarLogin: TIntegerField;
    qryControAcces: TFDQuery;
    qryControAccesid: TFDAutoIncField;
    qryControAccesusuario: TWideStringField;
    qryControAccesdata_access: TDateTimeField;
    qryControAccessenha: TStringField;
    PROPRIEDADES: TFDQuery;
    PROPRIEDADESID: TIntegerField;
    PROPRIEDADESNOME: TStringField;
    PROPRIEDADESCIDADE: TStringField;
    PROPRIEDADESUF: TStringField;
    PROPRIEDADESENDERECO: TStringField;
    PROPRIEDADESSTATUS: TIntegerField;
    PROPRIEDADESUSRER_ID: TIntegerField;
    PROPRIEDADESDATA_REG: TSQLTimeStampField;
    PROPRIEDADESPROPRIA: TIntegerField;
    PROPRIEDADESCOD_ESTAB_GTA: TStringField;
    PROPRIEDADESIE: TStringField;
    PROPRIEDADESGUID: TWideStringField;
    PROPRIEDADESRASTREADA: TIntegerField;
    PROPRIEDADESCOD_ERAS_BND: TStringField;
    PROPRIEDADESCIF: TStringField;
    PROPRIEDADESNIRF: TStringField;
    PROPRIEDADESINCRA: TStringField;
    CURRAIS: TFDQuery;
    CURRAISID: TIntegerField;
    CURRAISID_PROPRIEDADE: TIntegerField;
    CURRAISTIPO: TIntegerField;
    CURRAISUSER_ID: TIntegerField;
    CURRAISDATAREG: TSQLTimeStampField;
    CURRAISSTATUS: TIntegerField;
    CURRAISPESO_MINIMO: TIntegerField;
    CURRAISPESO_MAXIMO: TIntegerField;
    CURRAISCAPACIDADE: TIntegerField;
    CURRAISLOTACAO: TIntegerField;
    CURRAISSTATUS_LOTACAO: TStringField;
    CURRAISQRCODE: TStringField;
    CURRAISLATITUDE: TStringField;
    CURRAISLONGITUDE: TStringField;
    CURRAISCUSTO_FIXO_DIA: TBCDField;
    CURRAISAREA_HECTARES: TBCDField;
    CURRAISCODIGO: TWideStringField;
    CURRAISID_RETIRO: TIntegerField;
    CURRAISORDERM_FORN: TIntegerField;
    CURRAISTAG_INICIO: TStringField;
    CURRAISTAG_FIM: TStringField;
    ALIMENTO: TFDQuery;
    ALIMENTOID: TIntegerField;
    ALIMENTONOME: TStringField;
    ALIMENTOCUSTO_MEDIO: TFMTBCDField;
    ALIMENTOUNIDADE_MEDIDA: TStringField;
    ALIMENTOPESO_EMBALAGEM: TBCDField;
    ALIMENTOPERCENT_TOLERANCIA: TIntegerField;
    ALIMENTOMS: TBCDField;
    ALIMENTODATAREG: TSQLTimeStampField;
    ALIMENTOID_USUARIO: TIntegerField;
    ALIMENTOSTATUS: TIntegerField;
    ALIMENTOSALDO_ATUAL: TBCDField;
    ALIMENTODATA_CUSTO_MEDIO: TDateField;
    RACA: TFDQuery;
    CATEGORIAS: TFDQuery;
    RACAID: TIntegerField;
    RACANOME: TStringField;
    RACASTATUS: TIntegerField;
    RACADATAREG: TSQLTimeStampField;
    RACAID_USER: TIntegerField;
    RACACODIGO_BND: TStringField;
    CATEGORIASID: TIntegerField;
    CATEGORIASNOME: TStringField;
    CATEGORIASSEXO: TStringField;
    CATEGORIASSTATUS: TIntegerField;
    CATEGORIASDATAREG: TSQLTimeStampField;
    CATEGORIASUSER_ID: TIntegerField;
    CATEGORIASFAIXA_ETARIA: TStringField;
    CATEGORIASGMD: TBCDField;
    CATEGORIASID_FAIXA: TIntegerField;
    CATEGORIASID_CATEGORIA_PADRAO: TIntegerField;
    CATEGORIASCategoriaPadrao: TStringField;
    PRODUTORES: TFDQuery;
    PRODUTORESID: TIntegerField;
    PRODUTORESID_PROPRIEDADE: TIntegerField;
    PRODUTORESNOME: TStringField;
    PRODUTORESCPF_CNPJ: TStringField;
    PRODUTORESSTATUS: TIntegerField;
    PRODUTORESDATAREG: TSQLTimeStampField;
    PRODUTORESGUID: TStringField;
    PRODUTORESUSER_ID: TIntegerField;
    AUX_REBANHO: TFDQuery;
    AUX_REBANHOID: TIntegerField;
    AUX_REBANHONOME: TStringField;
    AUX_REBANHOOBSERVACAO: TStringField;
    AUX_REBANHODATAREG: TSQLTimeStampField;
    AUX_REBANHOSTATUS: TIntegerField;
    AUX_REBANHOID_USUARIO: TIntegerField;
    AUX_REBANHODATA_ALTERACAO: TSQLTimeStampField;
    AUX_REBANHOID_USUARIO_ALTERACAO: TIntegerField;
    ANIMAIS: TFDQuery;
    ANIMAISIDENTIFICACAO_1: TStringField;
    ANIMAISIDENTIFICACAO_2: TStringField;
    ANIMAISPESO_ENTRADA: TBCDField;
    ANIMAISPESO_ESTIMADO: TBCDField;
    ANIMAISDATA_PROC: TSQLTimeStampField;
    ANIMAISCategoria: TStringField;
    ANIMAISRaca: TStringField;
    ANIMAISRebanho: TStringField;
    ANIMAISCODIGO: TWideStringField;
    ANIMAISPROPRIEDADE: TStringField;
    ANIMAISPRODUTOR: TStringField;
    ANIMAISID: TIntegerField;
    CURRAISTIPOSTR: TWideStringField;
    BEBEDOURO: TFDQuery;
    BEBEDOUROID: TIntegerField;
    BEBEDOUROID_PASTO: TIntegerField;
    BEBEDOUROIDENTIFICACAO: TStringField;
    BEBEDOUROVOLUME: TBCDField;
    BEBEDOUROVAZAO: TBCDField;
    BEBEDOUROFREQ_LIMPEZA: TIntegerField;
    BEBEDOUROULTIMA_LIMPEZA: TDateField;
    BEBEDOURODATAREG: TSQLTimeStampField;
    BEBEDOUROID_USUARIO: TIntegerField;
    BEBEDOURODATA_ALTERACAO: TSQLTimeStampField;
    BEBEDOUROID_USUARIO_ALTERACAO: TIntegerField;
    BEBEDOUROSTATUS: TIntegerField;
    qryAux: TFDQuery;
    BEBEDOUROPasto: TWideStringField;
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
    COCHOPasto: TWideStringField;
    LIMPEZABEBEDOURO: TFDQuery;
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
    LIMPEZABEBEDOUROPasto: TWideStringField;
    LIMPEZABEBEDOUROSYNC: TIntegerField;
    LIMPEZABEBEDOUROID: TFDAutoIncField;
    MOVIMENTACAO_ANIMAL: TFDQuery;
    AUX_MOTIVO_MOVIMENTACAO: TFDQuery;
    AUX_MOTIVO_MOVIMENTACAOID: TIntegerField;
    AUX_MOTIVO_MOVIMENTACAONOME: TStringField;
    AUX_MOTIVO_MOVIMENTACAOID_USUARIO: TIntegerField;
    AUX_MOTIVO_MOVIMENTACAODATAREG: TSQLTimeStampField;
    AUX_MOTIVO_MOVIMENTACAOSTATUS: TIntegerField;
    MOVIMENTACAO_ANIMALID: TFDAutoIncField;
    MOVIMENTACAO_ANIMALID_USUARIO: TIntegerField;
    MOVIMENTACAO_ANIMALID_ANIMAL: TIntegerField;
    MOVIMENTACAO_ANIMALID_PASTO_ORIGEM: TIntegerField;
    MOVIMENTACAO_ANIMALID_PASTO_DESTINO: TIntegerField;
    MOVIMENTACAO_ANIMALDATA: TDateField;
    MOVIMENTACAO_ANIMALID_MOTIVO: TIntegerField;
    MOVIMENTACAO_ANIMALDATAREG: TSQLTimeStampField;
    MOVIMENTACAO_ANIMALPESO_ENTRADA: TBCDField;
    MOVIMENTACAO_ANIMALPESO_SAIDA_PROJ: TBCDField;
    MOVIMENTACAO_ANIMALDIAS: TIntegerField;
    MOVIMENTACAO_ANIMALORIGEM_DADOS: TIntegerField;
    MOVIMENTACAO_ANIMALTIPO: TIntegerField;
    MOVIMENTACAO_ANIMALSYNC: TIntegerField;
    MOVIMENTACAO_ANIMALOrigem: TWideStringField;
    MOVIMENTACAO_ANIMALDestino: TWideStringField;
    MOVIMENTACAO_ANIMALMotivo: TStringField;
    MOVIMENTACAO_ANIMALidentificacao: TWideStringField;
    SUPLEMENTO_MINERAL: TFDQuery;
    SUPLEMENTO_MINERALID: TIntegerField;
    SUPLEMENTO_MINERALNOME: TStringField;
    SUPLEMENTO_MINERALID_FORNECEDOR: TIntegerField;
    SUPLEMENTO_MINERALGANHO_ESPERADO: TBCDField;
    SUPLEMENTO_MINERALESTOQUE_MINIMO: TBCDField;
    SUPLEMENTO_MINERALPESO_EMBALAGEM: TBCDField;
    SUPLEMENTO_MINERALSTATUS: TIntegerField;
    SUPLEMENTO_MINERALDATAREG: TSQLTimeStampField;
    SUPLEMENTO_MINERALID_USUARIO: TSmallintField;
    SUPLEMENTO_MINERALCONSUMO_ESPERADO: TBCDField;
    SUPLEMENTO_MINERALVALOR_KG: TBCDField;
    SUPLEMENTO_MINERALESTOQUE_MINIMO_DIAS: TIntegerField;
    SUPLEMENTO_MINERALCM_COCHO_INDICADO: TBCDField;
    SUPLEMENTO_MINERALINGESTAO_PERCENT_PV: TBCDField;
    SUPLEMENTO_MINERALPADRAO: TIntegerField;
    SUPLEMENTO_MINERALID_USUARIO_ALTERACAO: TIntegerField;
    SUPLEMENTO_MINERALDATA_ALTERACAO: TSQLTimeStampField;
    SUPLEMENTO_MINERALFORMULADO: TIntegerField;
    SUPLEMENTO_MINERALPRE_MISTURA: TIntegerField;
    SUPLEMENTO_MINERALMS_TOTAL: TBCDField;
    SUPLEMENTO_MINERALSALDO_ATUAL: TBCDField;
    SUPLEMENTO_MINERALDATA_CUSTO_MEDIO: TDateField;
    FORNECIMENTO: TFDQuery;
    FORNECIMENTOID_PASTO: TIntegerField;
    FORNECIMENTOID_PRODUTO: TIntegerField;
    FORNECIMENTODATA_FORNECIMENTO: TDateField;
    FORNECIMENTOPREVISAO_KG: TBCDField;
    FORNECIMENTOPREVISTO_SACO: TBCDField;
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
    FORNECIMENTOSOBRA_KG: TBCDField;
    FORNECIMENTOID_RESPONSAVEL: TIntegerField;
    FORNECIMENTOID_COCHO: TIntegerField;
    FORNECIMENTOQTD_ANIMAIS: TIntegerField;
    FORNECIMENTOPREVISAO_DIAS: TIntegerField;
    FORNECIMENTOCONSUMO_ESTIMADO_CAB_DIA: TBCDField;
    FORNECIMENTOVALOR_KG: TBCDField;
    FORNECIMENTOESTOQUE_ORIGEM: TIntegerField;
    FORNECIMENTOCONSUMO_ESTIMADO_TOTAL_DIA: TBCDField;
    FORNECIMENTOVALOR_TOTAL_FORN: TBCDField;
    FORNECIMENTOVALOR_CAB_DIA: TBCDField;
    FORNECIMENTOVALOR_TOTAL_CAB: TBCDField;
    FORNECIMENTOOBSERVACAO: TStringField;
    FORNECIMENTOID_USUARIO_ALTERACAO: TIntegerField;
    FORNECIMENTODATA_ALTERACAO: TSQLTimeStampField;
    FORNECIMENTOPasto: TWideStringField;
    FORNECIMENTOMineral: TStringField;
    FORNECIMENTOSYNC: TIntegerField;
    FORNECIMENTOID: TFDAutoIncField;
    COCHOLOTACAO: TIntegerField;
    LOTE_NUTRICIONAL: TFDQuery;
    LEITURA_COCHO: TFDQuery;
    LEITURA_COCHOID: TFDAutoIncField;
    LEITURA_COCHOID_LOTE: TIntegerField;
    LEITURA_COCHOID_CURRAL: TIntegerField;
    LEITURA_COCHODATA_LEITURA: TDateField;
    LEITURA_COCHONOTA: TBCDField;
    LEITURA_COCHOAJUSTE: TBCDField;
    LEITURA_COCHOID_USUARIO: TIntegerField;
    LEITURA_COCHOID_USUARIO_ALTERCAO: TIntegerField;
    LEITURA_COCHODATA_ALTERACAO: TSQLTimeStampField;
    LEITURA_COCHODATAREG: TSQLTimeStampField;
    LEITURA_COCHOSTATUS: TIntegerField;
    LEITURA_COCHOSYNC: TIntegerField;
    LEITURA_COCHOLote: TIntegerField;
    LEITURA_COCHOCurral: TWideStringField;
    HIST_LEITURA_COCHO: TFDQuery;
    HIST_LEITURA_COCHOLabel: TDateField;
    HIST_LEITURA_COCHOValue: TBCDField;
    AUX_NOTAS_LEITURA: TFDQuery;
    AUX_NOTAS_LEITURAID: TIntegerField;
    AUX_NOTAS_LEITURANOTA: TFMTBCDField;
    AUX_NOTAS_LEITURAAJUSTE: TBCDField;
    HIST_CONSUMO: TFDQuery;
    HIST_CONSUMOID_LOTE: TIntegerField;
    HIST_CONSUMODATA_CONSUMO: TDateField;
    HIST_CONSUMOMN: TBCDField;
    HIST_CONSUMOMS: TBCDField;
    HIST_CONSUMO_MN: TFDQuery;
    HIST_CONSUMO_MS: TFDQuery;
    LOTE_NUTRICIONALID: TIntegerField;
    LOTE_NUTRICIONALID_PLANEJAMETO: TIntegerField;
    LOTE_NUTRICIONALID_PROPRIEDADE: TIntegerField;
    LOTE_NUTRICIONALID_LOCAL: TIntegerField;
    LOTE_NUTRICIONALDATA_ENTRADA: TDateField;
    LOTE_NUTRICIONALDATA_PRIMEIRO_TRATO: TDateField;
    LOTE_NUTRICIONALQTDE_CAB: TIntegerField;
    LOTE_NUTRICIONALPESO_MEDIO: TBCDField;
    LOTE_NUTRICIONALDIAS_MEDIO: TIntegerField;
    LOTE_NUTRICIONALSTATUS: TIntegerField;
    LOTE_NUTRICIONALID_USUARIO: TIntegerField;
    LOTE_NUTRICIONALID_USUARIO_ALTERACAO: TIntegerField;
    LOTE_NUTRICIONALDATA_ULTIMA_ALTERACAO: TSQLTimeStampField;
    LOTE_NUTRICIONALPESO_ENTRADA: TBCDField;
    LOTE_NUTRICIONALCurral: TWideStringField;
    LOTE_NUTRICIONALUltimaNota: TBCDField;
    LOTE_NUTRICIONALAJUSTE: TBCDField;
    RACAOINSUMOS: TFDQuery;
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
    FABRICACAO: TFDQuery;
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
    FABRICACAORACAO: TStringField;
    RACAOINSUMOSINSUMO: TStringField;
    RACAO: TFDQuery;
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
    FABRICACAO_INSUMOSSYNC: TIntegerField;
    FABRICACAO_INSUMOSInsumo: TStringField;
    USERS: TFDQuery;
    USERSID: TIntegerField;
    USERSDT_REGISTER: TSQLTimeStampField;
    USERSSTATUS: TIntegerField;
    USERSLOGIN: TStringField;
    USERSPASSWORD: TStringField;
    USERSNAME: TStringField;
    USERSTIPO: TIntegerField;
    USERSID_PROPRIEDADE: TIntegerField;
    USERSID_CARGO: TIntegerField;
    FABRICACAOSYNC: TIntegerField;
    FABRICACAOID: TIntegerField;
    FORNECIMENTO_CONF: TFDQuery;
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
    FORNECIMENTO_CONFCURRAL: TWideStringField;
    FORNECIMENTO_CONFRACAO: TStringField;
    FORNECIMENTO_CONFMOTORISTA: TStringField;
    LISTA_LOTE_FRAME: TFDQuery;
    qryLinhaConfinamento: TFDQuery;
    qryLinhaConfinamentolinha: TWideStringField;
    LISTA_LOTE_FRAMEDATA_FORN: TDateField;
    LISTA_LOTE_FRAMETRATO: TIntegerField;
    LISTA_LOTE_FRAMECURRAL: TWideStringField;
    LISTA_LOTE_FRAMERACAO: TStringField;
    LISTA_LOTE_FRAMEPREVISTO_MN_KG: TIntegerField;
    LISTA_LOTE_FRAMEREALIZADO_MN_KG: TIntegerField;
    LISTA_LOTE_FRAMEID_FORNE: TFDAutoIncField;
    LISTA_LOTE_FRAMEIDCURRAL: TIntegerField;
    LISTA_LOTE_FRAMEIDLOTE: TIntegerField;
    LISTA_LOTE_FRAMEQTDE_CAB: TIntegerField;
    FORNECIMENTO_CONFID: TIntegerField;
    FORNECIMENTO_CONFQTDE_CAB_LOTE: TIntegerField;
    FORNECIMENTO_CONFPESO_MEDIO_LOTE: TBCDField;
    HIST_SANIDADE: TFDQuery;
    HIST_SANIDADEID: TFDAutoIncField;
    HIST_SANIDADEID_ANIMAL: TIntegerField;
    HIST_SANIDADEID_PROPRIEDADE: TIntegerField;
    HIST_SANIDADEDATA_APLICACAO: TDateField;
    HIST_SANIDADEPRODUTO: TStringField;
    HIST_SANIDADEDOSE_ML: TBCDField;
    HIST_SANIDADECARENCIA_DIAS: TIntegerField;
    HIST_SANIDADECARENCIA_DATA: TDateField;
    PROTOCOLO_SANITARIO: TFDQuery;
    PROTOCOLO_SANITARIOID: TIntegerField;
    PROTOCOLO_SANITARIONOME: TStringField;
    PROTOCOLO_SANITARIOSTATUS: TIntegerField;
    PROTOCOLO_SANITARIOTIPO: TIntegerField;
    PROTOCOLO_FARMACOS: TFDQuery;
    PROTOCOLO_FARMACOSID: TIntegerField;
    PROTOCOLO_FARMACOSID_FARMACO: TIntegerField;
    PROTOCOLO_FARMACOSTIPO_DOSAGEM: TIntegerField;
    PROTOCOLO_FARMACOSDOSE_FIXA_ML: TBCDField;
    PROTOCOLO_FARMACOSDOSE_PESO_ML: TBCDField;
    PROTOCOLO_FARMACOSDOSE_PESO_KG: TBCDField;
    PROTOCOLO_FARMACOSID_PROTOCOLO: TIntegerField;
    PROTOCOLO_FARMACOSCARENCIA_DIAS: TIntegerField;
    FARMACO: TFDQuery;
    FARMACOID: TIntegerField;
    FARMACONOME: TStringField;
    FARMACOPRINCIPIO_ATIVO: TStringField;
    FARMACOTIPO_APICACAO: TIntegerField;
    FARMACOML_DOSE_FIXA: TBCDField;
    FARMACOML_DOSE_PV: TBCDField;
    FARMACOKG_DOSE_PV: TBCDField;
    FARMACOCARENCIA_DIA: TIntegerField;
    FARMACOVALOR_ML: TFloatField;
    FARMACOTIPO_DOSAGEM: TWideStringField;
    TableProtocoloFarmacos: TFDQuery;
    procedure FConBeforeConnect(Sender: TObject);
    procedure ReadAccess;
    procedure BEBEDOUROReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure FABRICACAOReconcileError(DataSet: TFDDataSet; E: EFDException;
      UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
    procedure FORNECIMENTO_CONFReconcileError(DataSet: TFDDataSet;
      E: EFDException; UpdateKind: TFDDatSRowState;
      var Action: TFDDAptReconcileAction);
  private
    { Private declarations }
  public
    vIdLocalAtual,vIdUser,vIdPropriedade,vLocalAnimalId,vIdPastoCocho,vQtdeCab,
    vIdPasto:string;
    vLeituraMinima,vLeituraMaxima,vLeituraRange:Double;
    function VerificaTabelaVazia(AnomeTable: string): Boolean;
    function AutenticaUsuario(Usuario, Senha: string): Boolean;
    procedure SalvarAcesso(vUsuario, Senha: string);
    procedure AbreCurrais(vPropriedade, vFiltro: string);
    procedure AbreBebedouro(vPropriedade, vFiltro: string);
    procedure AbreBuscaAnimal(vFiltro:string);
    function  RetornaIdAnimal(vFiltro: string):string;
    procedure AbreCocho(vPropriedade, vFiltro: string);
    procedure AbreLimpezaBebedouro(vPropriedade, vFiltro: string);
    function  RetornaNomeBebedouro(vId:string):string;
    procedure AbreMovAnimal(vPropriedade, vFiltro: string);
    procedure AbreLotes(vPropriedade, vFiltro,vData: string);
    procedure AbreLotesFornecimento(vLinha,vTrato,vIdDieta: string);
    procedure AbreLeituraCocho(vPropriedade, vFiltro: string);
    procedure AbreHistConsumo(vIdLote: string);
    procedure AbreFornecimento(vPropriedade, vFiltro: string);

    procedure DeletaBebedouroPropriedade;
    procedure DeletaCochoPropriedade;
    procedure DeletaGenerico(vID,vTabela:string);
    procedure FinalizaBatida(vID:string);
    function  RetornaOrigemAnimalMov(vIdAnimal:string):string;
    procedure AbreFornecimentoConf(Filtro: string);

    procedure AbreFornMineral(vPropriedade, vFiltro: string);
    function  RetornaPastoCocho(vId:string):string;
    procedure AbreGraficoHistLeitura(vIdLote:string);
    procedure GeraTrackLeitura;
    procedure AbreFabricacao(vFiltro:string);
    function  InsereFabricacao(idRacao, idOperador,previsto: string): string;
    procedure InsereFabricacaoAlimentos(vIdFabricacao,vIdRacao, kgPrevisto: string);
    procedure AbreFabricacaoInusmo(vFiltro: string);
    function  RetornaMaxIdFabricacao:string;
    procedure AtualizaRealizadoIsnumo(vID,vRealizado:String);
    function  VerificaIDExite(Atabela, AId: string): Boolean;
    function  RetornaIdFabricacao: integer;
    procedure AbreFornecimentoLote(IdForn: string);
    procedure AbreLinhaConfimaneto;
    procedure AbreSanidadeAnimal(IdAnimal:string);
    function  VerificaFornecimentoExite(vData,vIdCurral,vTrato,vIdDieta:string):Boolean;
    function  RetornaUltimoTratoCurral(IdCurral:string):string;
    function  RetornaUltimoTratoCorrigidoCurral(IdCurral: string): string;
    Procedure AplicaTratamentoExtra(idProduto,produto,idAnimal,DataAplicacao,idLocal,
    TipoDosagem,CarenciaDias,IDBASE:string;DoseFixaML, DosePesoML, DosePesoKG:Double);
    function RetornaPesoAtualAnimal(idAnimal: String): Double;
  end;

var
  dmdb: Tdmdb;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UPrincipal, UFLogin;

{$R *.dfm}

procedure TdmDB.DeletaBebedouroPropriedade;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from bebedouro');
   Add('where id_pasto in(');
   Add('select id from currais where id_propriedade='+dmdb.vIdPropriedade);
   Add(')');
   qryAux.SQL.Text;
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

procedure TdmDB.DeletaCochoPropriedade;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from cocho');
   Add('where id_pasto in(');
   Add('select id from currais where id_propriedade='+dmdb.vIdPropriedade);
   Add(')');
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

procedure Tdmdb.DeletaGenerico(vID, vTabela: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('delete from '+vTabela);
   Add('where id='+vID);
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

procedure TdmDB.SalvarAcesso(vUsuario, Senha: string);
begin
  qryControAcces.Close;
  qryControAcces.Open;
  if not qryControAcces.IsEmpty then
  begin
   qryControAcces.Delete;
   qryControAcces.ApplyUpdates(-1);
  end;
  try
   qryControAcces.Close;
   qryControAcces.Open;
   qryControAcces.Insert;
   qryControAccesUsuario.AsString := vUsuario;
   qryControAccesSenha.AsString   := Senha;
   qryControAcces.ApplyUpdates(-1);
  except
   on E : Exception do
      ShowMessage('Erro ao inserir Controle de Acesso : '+E.Message);
  end;
end;

function Tdmdb.RetornaIdAnimal(vFiltro: string):string;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('SELECT');
   Add(' *');
   Add('FROM ANIMAL a');
   Add('WHERE a.STATUS =1');
   Add(vFiltro);
   Open;
   vIdLocalAtual := qryAux.FieldByName('ID_LOCAL').AsString;
   Result := FieldByName('ID').AsString;
 end;
end;


procedure Tdmdb.AbreBuscaAnimal(vFiltro: string);
begin
 with ANIMAIS,ANIMAIS.SQL do
 begin
   Clear;
   Add('SELECT');
   Add('a.ID,');
   Add(' IDENTIFICACAO_1,');
   Add(' IDENTIFICACAO_2,');
   Add(' PESO_ENTRADA,');
   Add(' PESO_ESTIMADO,');
   Add(' DATA_PROC,');
   Add(' c.NOME Categoria,');
   Add(' r.NOME Raca,');
   Add(' ar.NOME Rebanho,');
   Add(' c2.CODIGO,');
   Add(' p.NOME PROPRIEDADE,');
   Add(' p2.NOME PRODUTOR');
   Add('FROM ANIMAL a');
   Add('LEFT JOIN CATEGORIAS c ON c.id=a.ID_CATEGORIA');
   Add('LEFT JOIN RACA r ON r.id=a.ID_RACA');
   Add('LEFT JOIN AUX_REBANHO ar ON ar.id=a.ID_REBANHO');
   Add('LEFT JOIN CURRAIS c2 ON c2.id=a.ID_LOCAL');
   Add('LEFT JOIN PROPRIEDADES p ON p.id=a.ID_PROPRIEDADE');
   Add('LEFT JOIN PRODUTORES p2 ON p2.id=a.ID_PRODUTOR');
   Add('WHERE a.STATUS =1');
   Add(vFiltro);
   Open;
 end;
end;

procedure Tdmdb.AbreCurrais(vPropriedade, vFiltro: string);
begin
 with CURRAIS,CURRAIS.SQL do
 begin
   Clear;
   Add('select c.*,');
   Add('case');
   Add('when TIPO =0 then ''PASTO''');
   Add('when TIPO =1 then ''CONFINAMENTO''');
   Add('end TIPOSTR');
   Add('from currais c');
   Add('where status>-1');
   Add('and ID_PROPRIEDADE='+vPropriedade);
   Add(vFiltro);
   Open;
 end;
end;

procedure Tdmdb.AbreLotes(vPropriedade, vFiltro,vData: string);
begin
 with LOTE_NUTRICIONAL,LOTE_NUTRICIONAL.SQL do
 begin
   Clear;
   Add('select ln2.*, c.CODIGO Curral,');
   Add('(SELECT nota');
   Add('FROM LEITURA_COCHO lc');
   Add('WHERE status=1 AND ID_LOTE=ln2.ID AND DATA_LEITURA =:dt_leitura)UltimaNota,');
   Add('(SELECT AJUSTE');
   Add('FROM LEITURA_COCHO lc');
   Add('WHERE status=1 AND ID_LOTE=ln2.ID AND DATA_LEITURA =:dt_leitura)AJUSTE');
   Add('from currais c');
   Add('JOIN LOTE_NUTRICIONAL ln2 ON ln2.ID_LOCAL=c.id');
   Add('where LN2.status>-1');
   Add('and C.ID_PROPRIEDADE='+vPropriedade);
   Add(vFiltro);
   ParamByName('dt_leitura').AsString := vData;
//   InputBox('','',Text,
//    procedure(const AResult: TModalResult; const AValue: string)
//    begin
//      // This is executed when user closes the input box
//      // Check result and value here and do whatever is needed
//    end
//    );
   Open;
 end;
end;

procedure Tdmdb.AbreLotesFornecimento(vLinha,vTrato,vIdDieta: string);
begin
 with LISTA_LOTE_FRAME,LISTA_LOTE_FRAME.SQL do
 begin
   Clear;
   Add('SELECT');
   Add('fc.data_FORN DATA_FORN,');
   Add(' fc.trato TRATO,');
   Add(' CP.CODIGO CURRAL,');
   Add(' RR.NOME RACAO,');
   Add(' fc.PREVISTO_MN_KG,');
   Add(' fc.REALIZADO_MN_KG,');
   Add(' fc.ID ID_FORNE,');
   Add(' fc.ID_LOCAL IDCURRAL,');
   Add(' fc.ID_LOTE IDLOTE,');
   Add(' lf.QTDE_CAB');
   Add('FROM FORNECIMENTO_CONF fc');
   Add('JOIN RACAO RR on RR.ID=fc.ID_RACAO');
   Add('join LOTE_NUTRICIONAL LF ON LF.ID=fc.id_lote');
   Add('JOIN CURRAIS CP on CP.ID=fc.ID_LOCAL');
   Add('where CP.ID_PROPRIEDADE='+vIdPropriedade);
   Add('and fc.DATA_FORN='+FormatDateTime('yyyy-mm-dd',date).QuotedString);
   Add('and fc.TRATO='+vTrato);
   Add('and fc.ID_RACAO='+vIdDieta);
   if vLinha.Length>0 then
    Add('and substr(CP.CODIGO,1 ,(INSTR(CP.CODIGO,''-'')-1)) like '+QuotedStr('%'+vLinha+'%'));
   Open;
 end;
end;


function Tdmdb.VerificaFornecimentoExite(vData, vIdCurral, vTrato,
  vIdDieta: string): Boolean;
begin
 with FORNECIMENTO_CONF,FORNECIMENTO_CONF.sql do
 begin
  Clear;
  Add('SELECT');
  Add(' A.*,');
  Add(' C.CODIGO CURRAL,');
  Add(' D.NOME RACAO,');
  Add(' E.NAME MOTORISTA');
  Add('FROM FORNECIMENTO_CONF A');
  Add('JOIN LOTE_NUTRICIONAL B ON A.ID_LOTE=B.ID');
  Add('JOIN CURRAIS C ON C.ID=A.ID_LOCAL');
  Add('JOIN RACAO D ON D.ID=A.ID_RACAO');
  Add('LEFT JOIN USERS E ON E.ID=A.ID_MOTORISTA');
  Add('where DATA_FORN='+vData);
  Add('AND A.ID_LOCAL='+vIdCurral);
  Add('AND A.TRATO='+vTrato);
  Add('AND A.ID_RACAO='+vIdDieta);
  Open;
  result := FORNECIMENTO_CONF.IsEmpty;
 end;
end;

function TdmDB.VerificaIDExite(Atabela, AId: string): Boolean;
begin
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('select * from '+Atabela);
  Add('where id='+AId);
  Open;
  result := qryAux.IsEmpty;
 end;
end;

function TdmDB.RetornaIdFabricacao: integer;
var
 vid:Integer;
begin
 repeat
   vid := Random(900000);
  until (dmDB.VerificaIDExite('FABRICACAO',intToStr(vid)));
  Result :=vid;
end;

procedure Tdmdb.AbreFabricacao(vFiltro: string);
begin
 with FABRICACAO,FABRICACAO.SQL do
 begin
   Clear;
   Add('select a.*,b.NOME racao from FABRICACAO a');
   Add('join racao b on (a.idracao=b.id)');
   Add('where a.status>-1');
   Add(vFiltro);
   Add('order by a.datareg desc');
   Open;
 end;
end;

procedure Tdmdb.AbreFabricacaoInusmo(vFiltro: string);
begin
 with FABRICACAO_INSUMOS,FABRICACAO_INSUMOS.SQL do
 begin
   Clear;
   Add('SELECT b.*,a.nome Insumo FROM FABRICACAO_INSUMOS b');
   Add('JOIN ALIMENTO A ON A.ID=B.ID_ALIMENTO');
   Add('WHERE b.status=1');
   Add(vFiltro);
   Open;
 end;
end;

procedure Tdmdb.AbreFornMineral(vPropriedade, vFiltro: string);
begin
 with FORNECIMENTO,FORNECIMENTO.SQL do
 begin
   Clear;
   Add('SELECT f.*,c.codigo Pasto,s.nome Mineral');
   Add('FROM fornecimento F');
   Add('JOIN currais C ON C.id=F.id_pasto');
   Add('JOIN suplemento_mineral S ON S.id=F.id_produto');
   Add(vFiltro);
   Open;
 end;
end;

function Tdmdb.InsereFabricacao(idRacao, idOperador,previsto: string): string;
begin
 Fabricacao.Close;
 Fabricacao.Open;
 Fabricacao.Insert;
 FABRICACAOIDRACAO.AsString        := idRacao;
 FABRICACAOID_OPERADOR.AsString    := idOperador;
 FABRICACAOID_USUARIO.AsString     := vIdUser;
 FABRICACAOHORA_INICIO.AsDateTime  := now;
 FABRICACAOKG_PREVISTO.AsString    := previsto;
 FABRICACAODATA_FAB.AsDateTime     := date;
 try
  Fabricacao.ApplyUpdates(-1);
  Result :='OK';
 except
  on E: Exception do
    Result :='Erro ao salvar Fabricacao:'+E.Message;
 end;
end;

procedure Tdmdb.InsereFabricacaoAlimentos(vIdFabricacao,vIdRacao, kgPrevisto: string);
var
 vQry,vQryInsert:TFDQuery;
 vIdAlimento,vData,vPercentMsAlimento:string;
 vPrevisto :integer;
begin
 vQryInsert:=TFDQuery.Create(nil);
 vQryInsert.Connection := FCon;

 vQry:=TFDQuery.Create(nil);
 vQry.Connection := FCon;

 with vQry,vQry.SQL do
 begin
   Add('SELECT');
   Add(' b.id idAlimento,');
   Add(' CURRENT_DATE,');
   Add(' A.PERCENTMATERIASECA,');
   Add(kgPrevisto+' *(CAST(a.INCLUSAOMATERIANATURAL AS DOUBLE PRECISION)/100) Previsto');
   Add('FROM RACAOINSUMOS a');
   Add('JOIN ALIMENTO b ON a.IDINSUMOALIMENTO=b.ID');
   Add('WHERE a.STATUS=1 and a.IDRACAO='+vIdRacao);
   Add('order by ORDEM_FABRICACAO');
   try
    Open;
    while not vQry.eof do
    begin
     vIdAlimento := vQry.FieldByName('idAlimento').AsString;
     vData       := FormatDateTime('yyyy-mm-dd',date).QuotedString;
     vPercentMsAlimento := StringReplace(vQry.FieldByName('PERCENTMATERIASECA').AsString,',','.',[rfReplaceAll]);
     vPrevisto          := vQry.FieldByName('Previsto').AsInteger;

     with vQryInsert,vQryInsert.SQL do
     begin
       Clear;
       Add('INSERT INTO FABRICACAO_INSUMOS');
       Add('(ID_FABRICACAO,');
       Add(' ID_ALIMENTO,');
       Add(' DATA_FAB,');
       Add(' MS_INSUMO,');
       Add(' KG_PREVISTO,');
       Add(' KG_FABRICADO,');
       Add(' ID_USUARIO)');
       Add('values(');
       Add(vIdFabricacao+',');
       Add(vIdAlimento+',');
       Add(vData+',');
       Add(vPercentMsAlimento+',');
       Add(intToStr(vPrevisto)+',');
       Add('0,');
       Add(dmdb.vIdUser+')');
       try
        ExecSQL;
        vQry.Next;
       except
       on E: Exception do
        ShowMessage('Erro :'+E.Message);
       end;
     end;
    end;
   except
    on E: Exception do
      ShowMessage('Erro :'+E.Message);
   end;
 end;
 vQry.Free;
end;



procedure Tdmdb.AbreGraficoHistLeitura(vIdLote: string);
begin
 with HIST_LEITURA_COCHO,HIST_LEITURA_COCHO.SQL do
 begin
   Clear;
   Add('SELECT a.data_leitura "Label",a.nota "Value" FROM HIST_LEITURA_COCHO a');
   Add('JOIN CURRAIS c ON C.ID=ID_CURRAL');
   Add('WHERE A.ID_LOTE='+vIdLote);
   Open;
 end;
end;

procedure Tdmdb.AbreHistConsumo(vIdLote: string);
begin
 with HIST_CONSUMO_MN,HIST_CONSUMO_MN.SQL do
 begin
   Clear;
   Add('select DATA_CONSUMO "LABEL",MN "VALUE" from HIST_CONSUMO WHERE ID_LOTE='+vIdLote);
   Open;
 end;
 with HIST_CONSUMO_MS,HIST_CONSUMO_MS.SQL do
 begin
   Clear;
   Add('select DATA_CONSUMO "LABEL",MS "VALUE" from HIST_CONSUMO WHERE ID_LOTE='+vIdLote);
   Open;
 end;
end;

procedure Tdmdb.AbreBebedouro(vPropriedade, vFiltro: string);
begin
 with BEBEDOURO,BEBEDOURO.SQL do
 begin
   Clear;
   Add('select A.*,B.codigo Pasto from BEBEDOURO A');
   Add('left JOIN currais B ON A.id_pasto=B.id');
   Add('where b.ID_PROPRIEDADE='+vPropriedade);
   Add(vFiltro);
   Open;
 end;
end;

procedure Tdmdb.AbreLeituraCocho(vPropriedade, vFiltro: string);
begin
 with LEITURA_COCHO,LEITURA_COCHO.SQL do
 begin
   Clear;
   Add('SELECT lc.*,ln2.ID Lote,c.CODIGO Curral FROM LEITURA_COCHO lc');
   Add('JOIN LOTE_NUTRICIONAL ln2 ON ln2.ID=lc.ID_LOTE');
   Add('JOIN CURRAIS c ON lc.ID_CURRAL=c.ID');
   Add('AND C.ID_PROPRIEDADE='+vPropriedade);
   Add(vFiltro);
   Add('order by lc.id desc');
   Open;
 end;
end;

procedure Tdmdb.AbreFornecimentoConf(Filtro: string);
begin
 with FORNECIMENTO_CONF,FORNECIMENTO_CONF.SQL do
 begin
   Clear;
   Add('SELECT');
   Add(' A.*,');
   Add(' C.CODIGO CURRAL,');
   Add(' D.NOME RACAO,');
   Add(' E.NAME MOTORISTA,');
   Add(' B.QTDE_CAB QTDE_CAB_LOTE,');
   Add(' B.PESO_MEDIO PESO_MEDIO_LOTE');
   Add('FROM FORNECIMENTO_CONF A');
   Add('JOIN LOTE_NUTRICIONAL B ON A.ID_LOTE=B.ID');
   Add('JOIN CURRAIS C ON C.ID=A.ID_LOCAL');
   Add('JOIN RACAO D ON D.ID=A.ID_RACAO');
   Add('LEFT JOIN USERS E ON E.ID=A.ID_MOTORISTA');
   Add('WHERE A.STATUS=1');
   Add('AND C.ID_PROPRIEDADE='+dmdb.vIdPropriedade);
   Add(Filtro);
   Add('ORDER BY A.DATA_FORN,D.NOME,substr(c.CODIGO,1 ,(INSTR(c.CODIGO,''-'')-1)),ORDERM_FORN,TRATO');
   Open;
 end;
end;

procedure Tdmdb.AbreFornecimentoLote(IdForn: string);
begin
  with FORNECIMENTO_CONF,FORNECIMENTO_CONF.SQL do
  begin
    Clear;
    Add('SELECT');
    Add(' A.*,');
    Add(' C.CODIGO CURRAL,');
    Add(' D.NOME RACAO,');
    Add(' E.NAME MOTORISTA,');
    Add(' B.QTDE_CAB QTDE_CAB_LOTE,');
    Add(' B.PESO_MEDIO PESO_MEDIO_LOTE');
    Add('FROM FORNECIMENTO_CONF A');
    Add('JOIN LOTE_NUTRICIONAL B ON A.ID_LOTE=B.ID');
    Add('JOIN CURRAIS C ON C.ID=A.ID_LOCAL');
    Add('JOIN RACAO D ON D.ID=A.ID_RACAO');
    Add('LEFT JOIN USERS E ON E.ID=A.ID_MOTORISTA');
    Add('WHERE A.ID='+IdForn);
    Open;
  end;
end;

procedure Tdmdb.AbreFornecimento(vPropriedade, vFiltro: string);
begin
 with LEITURA_COCHO,LEITURA_COCHO.SQL do
 begin
   Clear;
   Add('SELECT lc.*,ln2.ID Lote,c.CODIGO Curral FROM LEITURA_COCHO lc');
   Add('JOIN LOTE_NUTRICIONAL ln2 ON ln2.ID=lc.ID_LOTE');
   Add('JOIN CURRAIS c ON lc.ID_CURRAL=c.ID');
   Add('AND C.ID_PROPRIEDADE='+vPropriedade);
   Add(vFiltro);
   Add('order by lc.id desc');
   Open;
 end;
end;

procedure Tdmdb.AbreLimpezaBebedouro(vPropriedade, vFiltro: string);
begin
 with LIMPEZABEBEDOURO,LIMPEZABEBEDOURO.SQL do
 begin
   Clear;
   Add('select a.*,c.codigo Pasto from LIMPEZABEBEDOURO a');
   Add('join bebedouro b on a.id_bebedouro=b.id');
   Add('join currais c on c.id=b.id_pasto');
   Add('where c.ID_PROPRIEDADE='+vPropriedade);
   Add(vFiltro);
   Add('order by a.id desc');
   Open;
 end;
end;

procedure Tdmdb.AbreLinhaConfimaneto;
begin
 with qryLinhaConfinamento,qryLinhaConfinamento.SQL do
 begin
   Clear;
   Add('select');
   Add(' substr(CP.CODIGO,1 ,(INSTR(CP.CODIGO,''-'')-1)) linha');
   Add('from currais cp');
   Add('where status=1 and tipo=0 and ID_PROPRIEDADE='+vIdPropriedade);
   Add('group by substr(CP.CODIGO,1 ,(INSTR(CP.CODIGO,''-'')-1))');
   Add('order by substr(CP.CODIGO,1 ,(INSTR(CP.CODIGO,''-'')-1))');
   Open;
 end;
end;

procedure Tdmdb.AbreMovAnimal(vPropriedade, vFiltro: string);
begin
 with MOVIMENTACAO_ANIMAL,MOVIMENTACAO_ANIMAL.SQL do
 begin
   Clear;
   Add('select');
   Add(' a.*,');
   Add(' o.codigo Origem,');
   Add(' d.codigo Destino,');
   Add(' m.nome Motivo,');
   Add(' case');
   Add('when length(an.identificacao_2)>0 then identificacao_2');
   Add('else');
   Add(' identificacao_1');
   Add('end identificacao');
   Add('from movimentacao_animal a');
   Add('join animal an on an.id=a.id_animal');
   Add('join currais o on o.id=a.id_pasto_origem');
   Add('join currais d on d.id=a.id_pasto_destino');
   Add('join AUX_MOTIVO_MOVIMENTACAO m on m.id=a.id_motivo');
   Add('where o.ID_PROPRIEDADE='+vPropriedade);
   Add(vFiltro);
   Add('order by a.id desc');
   Open;
 end;
end;

procedure Tdmdb.AbreSanidadeAnimal(IdAnimal: string);
begin
 with HIST_SANIDADE,HIST_SANIDADE.SQL do
 begin
   Clear;
   Add('SELECT * FROM HIST_SANIDADE');
   Add('WHERE ID_ANIMAL='+IdAnimal);
   Add('order by DATA_APLICACAO desc');
   Open;
 end;
end;

function Tdmdb.RetornaPesoAtualAnimal(idAnimal: String): Double;
var
 vQryAux :TFDQuery;
 vNumero :string;
 vPeso,vPeso1   :Double;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := fCon;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('SELECT COALESCE(ULTIMO_PESO,PESO_ENTRADA) peso FROM ANIMAL');
   Add('WHERE ID='+idAnimal);
   Open;
   vPeso  := FieldByName('peso').AsFloat;
   Result := vPeso;
 end;
 vQryAux.Free;
end;

procedure Tdmdb.AplicaTratamentoExtra(idProduto,produto, idAnimal, DataAplicacao,
  idLocal, TipoDosagem,CarenciaDias,
  IDBASE: string;DoseFixaML, DosePesoML, DosePesoKG:Double);
var
 vQryAux:TFDQuery;
 vTipoDose,vDiasCarencia:integer;
 vPesoAnimal,vDosePeso,vDoseFixa:Double;
 vIdFarmaco:string;
begin
 vQryAux := TFDQuery.Create(nil);
 vQryAux.Connection := fCon;

 if TipoDosagem='0' then
   vDoseFixa := DoseFixaML
 else
 begin
   vPesoAnimal := RetornaPesoAtualAnimal(idAnimal);
   vDoseFixa   := ((vPesoAnimal/DosePesoKG)*DosePesoML);
 end;
 with vQryAux,vQryAux.SQL do
 begin
   Clear;
   Add('INSERT INTO ANIMAL_SANIDADE');
   Add('(ID_ANIMAL,');
   Add('ID_FARMACO,');
   Add('DOSE_ML,');
   Add('ID_PROPRIEDAE,');
   Add('ID_LOCAL_ATUAL,');
   Add('DATA_APLICACAO,');
   Add('TIPO_APLICACAO,');
   Add('ID_RESPONSAVEL_APLICACAO,');
   Add('ID_USUARIO,');
   Add('TIPO_TRATAMENTO,');
   Add('CARENCIA_DIAS');
   Add(')values(');
   Add(':ID_ANIMAL,');
   Add(':ID_FARMACO,');
   Add(':DOSE_ML,');
   Add(':ID_PROPRIEDAE,');
   Add(':ID_LOCAL_ATUAL,');
   Add(':DATA_APLICACAO,');
   Add(':TIPO_APLICACAO,');
   Add(':ID_RESPONSAVEL_APLICACAO,');
   Add(':ID_USUARIO,');
   Add(':TIPO_TRATAMENTO,');
   Add(':CARENCIA_DIAS');
   Add(')');
   ParamByName('ID_ANIMAL').AsString                     :=idAnimal;
   ParamByName('ID_FARMACO').AsString                    :=idProduto;
   ParamByName('DOSE_ML').AsFloat                        :=vDoseFixa;
   ParamByName('ID_PROPRIEDAE').AsString                 :=vIdPropriedade;
   ParamByName('ID_LOCAL_ATUAL').AsString                :=idLocal;
   ParamByName('DATA_APLICACAO').AsString                :=DataAplicacao;
   ParamByName('TIPO_APLICACAO').AsInteger               :=1;
   ParamByName('ID_RESPONSAVEL_APLICACAO').AsString      :=vIdUser;
   ParamByName('ID_USUARIO').AsString                    :=vIdUser;
   ParamByName('TIPO_TRATAMENTO').AsInteger              :=2;
   ParamByName('CARENCIA_DIAS').AsString                 :=CarenciaDias;
   try
    ExecSQL;

    HIST_SANIDADE.Close;
    HIST_SANIDADE.Open;
    HIST_SANIDADE.Insert;
    HIST_SANIDADEID_ANIMAL.AsString        :=idAnimal;
    HIST_SANIDADEID_PROPRIEDADE.AsString   :=vIdPropriedade;
    HIST_SANIDADEDATA_APLICACAO.AsDateTime :=date;
    HIST_SANIDADEPRODUTO.AsString          :=produto;
    HIST_SANIDADEDOSE_ML.AsFloat           :=vDoseFixa;
    HIST_SANIDADECARENCIA_DIAS.AsString    :=CarenciaDias;
    HIST_SANIDADE.ApplyUpdates(-1);

//    with qryAux,qryAux.SQL do
//     begin
//       Clear;
//       Add('INSERT INTO HIST_SANIDADE(');
//       Add('ID_ANIMAL,');
//       Add('ID_PROPRIEDADE,');
//       Add('DATA_APLICACAO,');
//       Add('PRODUTO,');
//       Add('DOSE_ML,');
//       Add('CARENCIA_DIAS)VALUES(');
//       Add(':ID_ANIMAL,');
//       Add(':ID_PROPRIEDADE,');
//       Add(':DATA_APLICACAO,');
//       Add(':PRODUTO,');
//       Add(':DOSE_ML,');
//       Add(':CARENCIA_DIAS)');
//       ParamByName('ID_ANIMAL').AsString      := idAnimal;
//       ParamByName('ID_PROPRIEDADE').AsString := vIdPropriedade;
//       ParamByName('DATA_APLICACAO').AsString := DataAplicacao;
//       ParamByName('PRODUTO').AsString        := PRODUTO;
//       ParamByName('DOSE_ML').AsString        := vDoseFixa.ToString;
//       ParamByName('CARENCIA_DIAS').AsString  := CarenciaDias;
//       ExecSQL;
//     end;
   except
   on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
   end;
 end;
 vQryAux.Free;
end;

procedure Tdmdb.AtualizaRealizadoIsnumo(vID,vRealizado: String);
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('UPDATE FABRICACAO_INSUMOS SET KG_FABRICADO='+vRealizado);
  Add('WHERE ID='+vID);
  ExecSQL;
 end;
 qryAux.Free;
end;

procedure Tdmdb.AbreCocho(vPropriedade, vFiltro: string);
begin
 with COCHO,COCHO.SQL do
 begin
   Clear;
   Add('select A.*,B.codigo Pasto,B.LOTACAO from cocho A');
   Add('left JOIN currais B ON A.id_pasto=B.id');
   Add('where b.ID_PROPRIEDADE='+vPropriedade);
   Add(vFiltro);
   Open;
 end;
end;

function TdmDB.AutenticaUsuario(Usuario, Senha: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
  Clear;
  Add('SELECT * FROM USERS');
  Add('WHERE LOGIN='+Usuario.QuotedString);
  Add('AND PASSWORD='+Senha.QuotedString);
  Add('AND ID_PROPRIEDADE='+vIdPropriedade);
  Open;
  if not qryAux.IsEmpty then
   begin
    vIdUser          := qryAux.FieldByName('ID').AsString;
    Result := true
   end
   else
    Result := false;
   end;
   qryAux.Free;
end;

procedure Tdmdb.BEBEDOUROReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

function Tdmdb.VerificaTabelaVazia(AnomeTable: string): Boolean;
var
 qryAux : TFDQuery;
begin
 qryAux := TFDQuery.Create(nil);
 qryAux.Connection := FCon;
 with qryAux,qryAux.sql do
 begin
   Clear;
   Add('select * from '+AnomeTable);
   try
    Open;
   except
    on E: Exception do
     ShowMessage('Erro:' + E.Message );
   end;
   frmPrincipal.vPrimeiroAcesso := qryAux.IsEmpty;
   Result := qryAux.IsEmpty;
 end;
 qryAux.free;
end;

procedure TdmDB.ReadAccess;
begin
  qryControAcces.Close;
  qryControAcces.Open;
  if not qryControAcces.IsEmpty then
  begin
   frmPrincipal.frmeLogin1.edtUsuario.Text := qryControAccesUsuario.AsString;
   if qryConfigSalvarLogin.AsInteger=1 then
    frmPrincipal.frmeLogin1.edtSenha.Text   := qryControAccesSenha.AsString;
  end;
end;


function Tdmdb.RetornaMaxIdFabricacao: string;
begin
 with qryAux,qryAux.SQL do
 begin
  Clear;
  Add('select max(id)max_id from  FABRICACAO b');
  Open;
  Result := FieldByName('max_id').AsString;
 end;
end;

function Tdmdb.RetornaNomeBebedouro(vId: string): string;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('select c.codigo from  bebedouro b');
   Add('join currais c on c.id=b.id_pasto');
   Add('where b.id='+vId);
   Open;
   Result := FieldByName('codigo').AsString;
 end;
end;

function Tdmdb.RetornaOrigemAnimalMov(vIdAnimal: string): string;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('select b.CODIGO,b.id from ANIMAL a');
   Add('join CURRAIS b on a.ID_LOCAL=b.id');
   Add('where a.id='+vIdAnimal);
   Open;
   vLocalAnimalId := FieldByName('id').AsString;
   Result         := FieldByName('CODIGO').AsString;
 end;
end;

function Tdmdb.RetornaPastoCocho(vId: string): string;
begin
 COCHO.Filtered := false;
 COCHO.Close;
 COCHO.Open;
 COCHO.Filter :='ID='+vId.QuotedString;
 COCHO.Filtered := true;
 vIdPastoCocho := COCHOID.AsString;
 vIdPasto      := COCHOID_PASTO.AsString;
 vQtdeCab      := COCHOLOTACAO.AsString;
 Result        := COCHOPasto.AsString;
// with qryAux,qryAux.SQL do
// begin
//   Clear;
//   Add('select a.id,b.codigo,b.id IdPasto,b.lotacao from cocho a');
//   Add('join currais b on a.id_pasto=b.id');
//   Add('where a.tag='+vId.QuotedString);
//   //Add('and b.id_propriedade='+dmdb.vIdPropriedade);
//   inputbox('','',text);
//   Open;
//   vIdPastoCocho := FieldByName('id').AsString;
//   vIdPasto      := FieldByName('IdPasto').AsString;
//   vQtdeCab      := FieldByName('LOTACAO').AsString;
//   Result        := FieldByName('codigo').AsString;
// end;
end;

function Tdmdb.RetornaUltimoTratoCurral(IdCurral: string): string;
begin
  with qryAux,qryAux.SQL do
  begin
    Clear;
    Add('select MAX(trato) MAX_TRATO from FORNECIMENTO_CONF S');
    Add('where ID_LOCAL ='+IdCurral);
    Open;
    Result := FieldByName('MAX_TRATO').AsString;
  end;
end;

function Tdmdb.RetornaUltimoTratoCorrigidoCurral(IdCurral: string): string;
var
 vPrev,vReal:Double;
begin
  with qryAux,qryAux.SQL do
  begin
    Clear;
    Add('select');
    Add(' coalesce(sum(S.PREVISTO_MN_KG),0)PREVISTO_MN_KG,');
    Add(' coalesce(sum(S.REALIZADO_MN_KG),0)REALIZADO_MN_KG');
    Add('from FORNECIMENTO_CONF S');
    Add('where ID_LOCAL ='+IdCurral);
    Add('and DATA_FORN='+FormatDateTime('yyyy-mm-dd',date).QuotedString);
    Open;
    vPrev := FieldByName('PREVISTO_MN_KG').AsFloat;
    vReal := FieldByName('REALIZADO_MN_KG').AsFloat;
    Result := FloatToStr(vPrev-vReal);
  end;
end;

procedure Tdmdb.FABRICACAOReconcileError(DataSet: TFDDataSet; E: EFDException;
  UpdateKind: TFDDatSRowState; var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message)
end;

procedure Tdmdb.FConBeforeConnect(Sender: TObject);
var
 vPath:string;
begin
 {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   FCon.Params.DriverID :='SQLite';
   FCon.Params.Values['Database'] :=
   TPath.Combine(TPath.GetDocumentsPath,'FPM.db');
 {$ENDIF}
 {$IFDEF MSWINDOWS}
   vPath := ExtractFilePath(ParamStr(0))+'db\FPM.db';
   if FileExists(vPath) then
   begin
    FCon.Params.DriverID :='SQLite';
    FCon.Params.Values['Database'] :=vPath;
   end
   else
    ShowMessage('BD Não localizado!!');
 {$ENDIF}
end;

procedure Tdmdb.FinalizaBatida(vID: string);
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('UPDATE FABRICACAO SET STATUS=2, HORA_FIM=CURRENT_TIME');
   Add('WHERE ID='+vID);
   ExecSQL;
 end;
end;

procedure Tdmdb.FORNECIMENTO_CONFReconcileError(DataSet: TFDDataSet;
  E: EFDException; UpdateKind: TFDDatSRowState;
  var Action: TFDDAptReconcileAction);
begin
 ShowMessage(e.Message);
end;

procedure Tdmdb.GeraTrackLeitura;
begin
 with qryAux,qryAux.SQL do
 begin
   Clear;
   Add('SELECT min(NOTA) min,max(nota) max FROM AUX_NOTAS_LEITURA anl');
   Open;
   vLeituraMinima := FieldByName('min').AsInteger;
   vLeituraMaxima := FieldByName('max').AsInteger;
 end;
end;

end.
