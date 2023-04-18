object dmdb: Tdmdb
  Height = 553
  Width = 1079
  object FCon: TFDConnection
    Params.Strings = (
      
        'Database=E:\Projetos2022\Field\Field2023\FieldPecMobile\Android\' +
        'FieldPec\db\FPM.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    BeforeConnect = FConBeforeConnect
    Left = 48
    Top = 32
  end
  object qryConfig: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'SELECT * FROM CONFIG')
    Left = 48
    Top = 80
    object qryConfigIP_SERVIDOR: TWideStringField
      FieldName = 'IP_SERVIDOR'
      Origin = 'IP_SERVIDOR'
      Size = 15
    end
    object qryConfigPOTA_SERVIDOR: TIntegerField
      FieldName = 'POTA_SERVIDOR'
      Origin = 'POTA_SERVIDOR'
    end
    object qryConfigSERIAL: TWideStringField
      FieldName = 'SERIAL'
      Origin = 'SERIAL'
    end
    object qryConfigSalvarLogin: TIntegerField
      FieldName = 'SalvarLogin'
      Origin = 'SalvarLogin'
    end
  end
  object qryControAcces: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from control_access'
      'order by id desc'
      'limit 1')
    Left = 56
    Top = 144
    object qryControAccesid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryControAccesusuario: TWideStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 32767
    end
    object qryControAccesdata_access: TDateTimeField
      FieldName = 'data_access'
      Origin = 'data_access'
    end
    object qryControAccessenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 100
    end
  end
  object PROPRIEDADES: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'select * from propriedades'
      'where propria=1 and status>-1')
    Left = 48
    Top = 216
    object PROPRIEDADESID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object PROPRIEDADESNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object PROPRIEDADESCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
      Size = 100
    end
    object PROPRIEDADESUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      FixedChar = True
      Size = 15
    end
    object PROPRIEDADESENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 200
    end
    object PROPRIEDADESSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object PROPRIEDADESUSRER_ID: TIntegerField
      FieldName = 'USRER_ID'
      Origin = 'USRER_ID'
    end
    object PROPRIEDADESDATA_REG: TSQLTimeStampField
      FieldName = 'DATA_REG'
      Origin = 'DATA_REG'
      Required = True
    end
    object PROPRIEDADESPROPRIA: TIntegerField
      FieldName = 'PROPRIA'
      Origin = 'PROPRIA'
      Required = True
    end
    object PROPRIEDADESCOD_ESTAB_GTA: TStringField
      FieldName = 'COD_ESTAB_GTA'
      Origin = 'COD_ESTAB_GTA'
    end
    object PROPRIEDADESIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
    end
    object PROPRIEDADESGUID: TWideStringField
      FieldName = 'GUID'
      Origin = 'GUID'
      Size = 32767
    end
    object PROPRIEDADESRASTREADA: TIntegerField
      FieldName = 'RASTREADA'
      Origin = 'RASTREADA'
    end
    object PROPRIEDADESCOD_ERAS_BND: TStringField
      FieldName = 'COD_ERAS_BND'
      Origin = 'COD_ERAS_BND'
    end
    object PROPRIEDADESCIF: TStringField
      FieldName = 'CIF'
      Origin = 'CIF'
    end
    object PROPRIEDADESNIRF: TStringField
      FieldName = 'NIRF'
      Origin = 'NIRF'
    end
    object PROPRIEDADESINCRA: TStringField
      FieldName = 'INCRA'
      Origin = 'INCRA'
    end
  end
  object CURRAIS: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'select c.*, '
      'case '
      ' when TIPO =0 then '#39'PASTO'#39
      ' when TIPO =1 then '#39'CONFINAMENTO'#39
      'end TIPOSTR'
      'from currais c')
    Left = 48
    Top = 280
    object CURRAISID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object CURRAISID_PROPRIEDADE: TIntegerField
      FieldName = 'ID_PROPRIEDADE'
      Origin = 'ID_PROPRIEDADE'
    end
    object CURRAISTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object CURRAISUSER_ID: TIntegerField
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
    end
    object CURRAISDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
    end
    object CURRAISSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object CURRAISPESO_MINIMO: TIntegerField
      FieldName = 'PESO_MINIMO'
      Origin = 'PESO_MINIMO'
      Required = True
    end
    object CURRAISPESO_MAXIMO: TIntegerField
      FieldName = 'PESO_MAXIMO'
      Origin = 'PESO_MAXIMO'
      Required = True
    end
    object CURRAISCAPACIDADE: TIntegerField
      FieldName = 'CAPACIDADE'
      Origin = 'CAPACIDADE'
      Required = True
    end
    object CURRAISLOTACAO: TIntegerField
      FieldName = 'LOTACAO'
      Origin = 'LOTACAO'
    end
    object CURRAISSTATUS_LOTACAO: TStringField
      FieldName = 'STATUS_LOTACAO'
      Origin = 'STATUS_LOTACAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CURRAISQRCODE: TStringField
      FieldName = 'QRCODE'
      Origin = 'QRCODE'
      Size = 30
    end
    object CURRAISLATITUDE: TStringField
      FieldName = 'LATITUDE'
      Origin = 'LATITUDE'
      Size = 50
    end
    object CURRAISLONGITUDE: TStringField
      FieldName = 'LONGITUDE'
      Origin = 'LONGITUDE'
      Size = 30
    end
    object CURRAISCUSTO_FIXO_DIA: TBCDField
      FieldName = 'CUSTO_FIXO_DIA'
      Origin = 'CUSTO_FIXO_DIA'
      Precision = 15
      Size = 2
    end
    object CURRAISAREA_HECTARES: TBCDField
      FieldName = 'AREA_HECTARES'
      Origin = 'AREA_HECTARES'
      Precision = 15
      Size = 3
    end
    object CURRAISCODIGO: TWideStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 32767
    end
    object CURRAISID_RETIRO: TIntegerField
      FieldName = 'ID_RETIRO'
      Origin = 'ID_RETIRO'
    end
    object CURRAISORDERM_FORN: TIntegerField
      FieldName = 'ORDERM_FORN'
      Origin = 'ORDERM_FORN'
    end
    object CURRAISTAG_INICIO: TStringField
      FieldName = 'TAG_INICIO'
      Origin = 'TAG_INICIO'
      Size = 30
    end
    object CURRAISTAG_FIM: TStringField
      FieldName = 'TAG_FIM'
      Origin = 'TAG_FIM'
      Size = 30
    end
    object CURRAISTIPOSTR: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPOSTR'
      Origin = 'TIPOSTR'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object ALIMENTO: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from alimento'
      'where status=1')
    Left = 48
    Top = 336
    object ALIMENTOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object ALIMENTONOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object ALIMENTOCUSTO_MEDIO: TFMTBCDField
      FieldName = 'CUSTO_MEDIO'
      Origin = 'CUSTO_MEDIO'
      Required = True
      Precision = 18
      Size = 3
    end
    object ALIMENTOUNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      Origin = 'UNIDADE_MEDIDA'
    end
    object ALIMENTOPESO_EMBALAGEM: TBCDField
      FieldName = 'PESO_EMBALAGEM'
      Origin = 'PESO_EMBALAGEM'
      Precision = 15
      Size = 2
    end
    object ALIMENTOPERCENT_TOLERANCIA: TIntegerField
      FieldName = 'PERCENT_TOLERANCIA'
      Origin = 'PERCENT_TOLERANCIA'
    end
    object ALIMENTOMS: TBCDField
      FieldName = 'MS'
      Origin = 'MS'
      Precision = 15
      Size = 2
    end
    object ALIMENTODATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object ALIMENTOID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object ALIMENTOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object ALIMENTOSALDO_ATUAL: TBCDField
      FieldName = 'SALDO_ATUAL'
      Origin = 'SALDO_ATUAL'
      Precision = 15
      Size = 3
    end
    object ALIMENTODATA_CUSTO_MEDIO: TDateField
      FieldName = 'DATA_CUSTO_MEDIO'
      Origin = 'DATA_CUSTO_MEDIO'
    end
  end
  object RACA: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from raca'
      'where status=1')
    Left = 160
    Top = 24
    object RACAID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object RACANOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object RACASTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object RACADATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object RACAID_USER: TIntegerField
      FieldName = 'ID_USER'
      Origin = 'ID_USER'
    end
    object RACACODIGO_BND: TStringField
      FieldName = 'CODIGO_BND'
      Origin = 'CODIGO_BND'
      FixedChar = True
      Size = 2
    end
  end
  object CATEGORIAS: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select c.*,cp.nome CategoriaPadrao from categorias c'
      'join categoria_padrao cp on cp.id=c.id_categoria_padrao'
      'where status=1')
    Left = 160
    Top = 80
    object CATEGORIASID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object CATEGORIASNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object CATEGORIASSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object CATEGORIASSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object CATEGORIASDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object CATEGORIASUSER_ID: TIntegerField
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
    end
    object CATEGORIASFAIXA_ETARIA: TStringField
      FieldName = 'FAIXA_ETARIA'
      Origin = 'FAIXA_ETARIA'
    end
    object CATEGORIASGMD: TBCDField
      FieldName = 'GMD'
      Origin = 'GMD'
      Precision = 15
      Size = 3
    end
    object CATEGORIASID_FAIXA: TIntegerField
      FieldName = 'ID_FAIXA'
      Origin = 'ID_FAIXA'
    end
    object CATEGORIASID_CATEGORIA_PADRAO: TIntegerField
      FieldName = 'ID_CATEGORIA_PADRAO'
      Origin = 'ID_CATEGORIA_PADRAO'
      Required = True
    end
    object CATEGORIASCategoriaPadrao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CategoriaPadrao'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object PRODUTORES: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'SELECT * FROM PRODUTORES')
    Left = 160
    Top = 144
    object PRODUTORESID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object PRODUTORESID_PROPRIEDADE: TIntegerField
      FieldName = 'ID_PROPRIEDADE'
      Origin = 'ID_PROPRIEDADE'
      Required = True
    end
    object PRODUTORESNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object PRODUTORESCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Required = True
    end
    object PRODUTORESSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object PRODUTORESDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object PRODUTORESGUID: TStringField
      FieldName = 'GUID'
      Origin = 'GUID'
      Size = 100
    end
    object PRODUTORESUSER_ID: TIntegerField
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
    end
  end
  object AUX_REBANHO: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from AUX_REBANHO')
    Left = 160
    Top = 200
    object AUX_REBANHOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object AUX_REBANHONOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
    end
    object AUX_REBANHOOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 100
    end
    object AUX_REBANHODATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object AUX_REBANHOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object AUX_REBANHOID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object AUX_REBANHODATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
      Origin = 'DATA_ALTERACAO'
    end
    object AUX_REBANHOID_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'ID_USUARIO_ALTERACAO'
      Origin = 'ID_USUARIO_ALTERACAO'
    end
  end
  object ANIMAIS: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'SELECT  '
      ' a.ID,'
      ' IDENTIFICACAO_1,'
      ' IDENTIFICACAO_2,'
      ' PESO_ENTRADA,'
      ' PESO_ESTIMADO,'
      ' DATA_PROC,'
      ' c.NOME Categoria,'
      ' r.NOME Raca,'
      ' ar.NOME Rebanho,'
      ' c2.CODIGO,'
      ' p.NOME PROPRIEDADE,'
      ' p2.NOME PRODUTOR'
      'FROM ANIMAL a '
      'JOIN CATEGORIAS c ON c.id=a.ID_CATEGORIA '
      'JOIN RACA r ON r.id=a.ID_RACA '
      'JOIN AUX_REBANHO ar ON ar.id=a.ID_REBANHO '
      'JOIN CURRAIS c2 ON c2.id=a.ID_LOCAL'
      'JOIN PROPRIEDADES p ON p.id=a.ID_PROPRIEDADE '
      'JOIN PRODUTORES p2 ON p2.id=a.ID_PRODUTOR '
      'WHERE a.STATUS =1')
    Left = 160
    Top = 256
    object ANIMAISIDENTIFICACAO_1: TStringField
      FieldName = 'IDENTIFICACAO_1'
      Origin = 'IDENTIFICACAO_1'
      Size = 25
    end
    object ANIMAISIDENTIFICACAO_2: TStringField
      FieldName = 'IDENTIFICACAO_2'
      Origin = 'IDENTIFICACAO_2'
      Size = 25
    end
    object ANIMAISPESO_ENTRADA: TBCDField
      FieldName = 'PESO_ENTRADA'
      Origin = 'PESO_ENTRADA'
      Precision = 15
      Size = 2
    end
    object ANIMAISPESO_ESTIMADO: TBCDField
      FieldName = 'PESO_ESTIMADO'
      Origin = 'PESO_ESTIMADO'
      Precision = 15
      Size = 2
    end
    object ANIMAISDATA_PROC: TSQLTimeStampField
      FieldName = 'DATA_PROC'
      Origin = 'DATA_PROC'
      Required = True
    end
    object ANIMAISCategoria: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Categoria'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object ANIMAISRaca: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Raca'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object ANIMAISRebanho: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Rebanho'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
    end
    object ANIMAISCODIGO: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object ANIMAISPROPRIEDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PROPRIEDADE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object ANIMAISPRODUTOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTOR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object ANIMAISID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
  end
  object BEBEDOURO: TFDQuery
    OnReconcileError = BEBEDOUROReconcileError
    Connection = FCon
    SQL.Strings = (
      'select A.*,B.codigo Pasto from BEBEDOURO A'
      'JOIN currais B ON A.id_pasto=B.id')
    Left = 256
    Top = 24
    object BEBEDOUROID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object BEBEDOUROID_PASTO: TIntegerField
      FieldName = 'ID_PASTO'
      Origin = 'ID_PASTO'
      Required = True
    end
    object BEBEDOUROIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      Origin = 'IDENTIFICACAO'
    end
    object BEBEDOUROVOLUME: TBCDField
      FieldName = 'VOLUME'
      Origin = 'VOLUME'
      Precision = 15
      Size = 2
    end
    object BEBEDOUROVAZAO: TBCDField
      FieldName = 'VAZAO'
      Origin = 'VAZAO'
      Precision = 15
      Size = 2
    end
    object BEBEDOUROFREQ_LIMPEZA: TIntegerField
      FieldName = 'FREQ_LIMPEZA'
      Origin = 'FREQ_LIMPEZA'
    end
    object BEBEDOUROULTIMA_LIMPEZA: TDateField
      FieldName = 'ULTIMA_LIMPEZA'
      Origin = 'ULTIMA_LIMPEZA'
    end
    object BEBEDOURODATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object BEBEDOUROID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object BEBEDOURODATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
      Origin = 'DATA_ALTERACAO'
    end
    object BEBEDOUROID_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'ID_USUARIO_ALTERACAO'
      Origin = 'ID_USUARIO_ALTERACAO'
    end
    object BEBEDOUROSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object BEBEDOUROPasto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Pasto'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object qryAux: TFDQuery
    Connection = FCon
    Left = 256
    Top = 80
  end
  object COCHO: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'select A.*,B.codigo Pasto,b.lotacao from cocho A'
      'left JOIN currais B ON A.id_pasto=B.id')
    Left = 256
    Top = 144
    object COCHOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object COCHOID_PASTO: TIntegerField
      FieldName = 'ID_PASTO'
      Origin = 'ID_PASTO'
      Required = True
    end
    object COCHONOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 40
    end
    object COCHOTAG: TStringField
      FieldName = 'TAG'
      Origin = 'TAG'
      Size = 40
    end
    object COCHOID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object COCHODATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object COCHOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object COCHOID_MINERAL: TIntegerField
      FieldName = 'ID_MINERAL'
      Origin = 'ID_MINERAL'
    end
    object COCHOMETRAGEM: TBCDField
      FieldName = 'METRAGEM'
      Origin = 'METRAGEM'
      Precision = 15
      Size = 2
    end
    object COCHOCREEPFEED: TIntegerField
      FieldName = 'CREEPFEED'
      Origin = 'CREEPFEED'
    end
    object COCHOPasto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Pasto'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object COCHOLOTACAO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'LOTACAO'
      Origin = 'LOTACAO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object LIMPEZABEBEDOURO: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select a.*,c.codigo Pasto from LIMPEZABEBEDOURO a'
      'join bebedouro b on a.id_bebedouro=b.id'
      'join currais c on c.id=b.id_pasto')
    Left = 392
    Top = 64
    object LIMPEZABEBEDOUROID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object LIMPEZABEBEDOUROID_BEBEDOURO: TIntegerField
      FieldName = 'ID_BEBEDOURO'
      Origin = 'ID_BEBEDOURO'
    end
    object LIMPEZABEBEDOUROID_RESPOPNSAVEL: TIntegerField
      FieldName = 'ID_RESPOPNSAVEL'
      Origin = 'ID_RESPOPNSAVEL'
    end
    object LIMPEZABEBEDOURODATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
    end
    object LIMPEZABEBEDOUROOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 100
    end
    object LIMPEZABEBEDOURODATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
    end
    object LIMPEZABEBEDOUROSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object LIMPEZABEBEDOUROID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object LIMPEZABEBEDOUROHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
    end
    object LIMPEZABEBEDOUROLATITUDE: TStringField
      FieldName = 'LATITUDE'
      Origin = 'LATITUDE'
    end
    object LIMPEZABEBEDOUROLONGITUDE: TStringField
      FieldName = 'LONGITUDE'
      Origin = 'LONGITUDE'
    end
    object LIMPEZABEBEDOUROPasto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Pasto'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object LIMPEZABEBEDOUROSYNC: TIntegerField
      FieldName = 'SYNC'
      Origin = 'SYNC'
    end
  end
  object MOVIMENTACAO_ANIMAL: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select'
      ' a.*,'
      ' o.codigo Origem,'
      ' d.codigo Destino,'
      ' m.nome Motivo,'
      ' case'
      '  when length(an.identificacao_2)>0 then identificacao_2'
      '  else'
      '   identificacao_1'
      ' end identificacao'
      'from movimentacao_animal a'
      'join animal an on an.id=a.id_animal'
      'join currais o on o.id=a.id_pasto_origem'
      'join currais d on d.id=a.id_pasto_destino'
      'join AUX_MOTIVO_MOVIMENTACAO m on m.id=a.id_motivo')
    Left = 392
    Top = 112
    object MOVIMENTACAO_ANIMALID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object MOVIMENTACAO_ANIMALID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object MOVIMENTACAO_ANIMALID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'ID_ANIMAL'
    end
    object MOVIMENTACAO_ANIMALID_PASTO_ORIGEM: TIntegerField
      FieldName = 'ID_PASTO_ORIGEM'
      Origin = 'ID_PASTO_ORIGEM'
    end
    object MOVIMENTACAO_ANIMALID_PASTO_DESTINO: TIntegerField
      FieldName = 'ID_PASTO_DESTINO'
      Origin = 'ID_PASTO_DESTINO'
    end
    object MOVIMENTACAO_ANIMALDATA: TDateField
      FieldName = 'DATA'
      Origin = 'DATA'
    end
    object MOVIMENTACAO_ANIMALID_MOTIVO: TIntegerField
      FieldName = 'ID_MOTIVO'
      Origin = 'ID_MOTIVO'
    end
    object MOVIMENTACAO_ANIMALDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
    end
    object MOVIMENTACAO_ANIMALPESO_ENTRADA: TBCDField
      FieldName = 'PESO_ENTRADA'
      Origin = 'PESO_ENTRADA'
      Precision = 15
      Size = 2
    end
    object MOVIMENTACAO_ANIMALPESO_SAIDA_PROJ: TBCDField
      FieldName = 'PESO_SAIDA_PROJ'
      Origin = 'PESO_SAIDA_PROJ'
      Precision = 15
      Size = 2
    end
    object MOVIMENTACAO_ANIMALDIAS: TIntegerField
      FieldName = 'DIAS'
      Origin = 'DIAS'
    end
    object MOVIMENTACAO_ANIMALORIGEM_DADOS: TIntegerField
      FieldName = 'ORIGEM_DADOS'
      Origin = 'ORIGEM_DADOS'
    end
    object MOVIMENTACAO_ANIMALTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object MOVIMENTACAO_ANIMALSYNC: TIntegerField
      FieldName = 'SYNC'
      Origin = 'SYNC'
    end
    object MOVIMENTACAO_ANIMALOrigem: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Origem'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object MOVIMENTACAO_ANIMALDestino: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Destino'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object MOVIMENTACAO_ANIMALMotivo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Motivo'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object MOVIMENTACAO_ANIMALidentificacao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'identificacao'
      Origin = 'identificacao'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object AUX_MOTIVO_MOVIMENTACAO: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'SELECT * FROM AUX_MOTIVO_MOVIMENTACAO')
    Left = 392
    Top = 160
    object AUX_MOTIVO_MOVIMENTACAOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object AUX_MOTIVO_MOVIMENTACAONOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object AUX_MOTIVO_MOVIMENTACAOID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object AUX_MOTIVO_MOVIMENTACAODATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object AUX_MOTIVO_MOVIMENTACAOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
  end
  object SUPLEMENTO_MINERAL: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'SELECT *'
      'FROM suplemento_mineral')
    Left = 400
    Top = 240
    object SUPLEMENTO_MINERALID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object SUPLEMENTO_MINERALNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object SUPLEMENTO_MINERALID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
    end
    object SUPLEMENTO_MINERALGANHO_ESPERADO: TBCDField
      FieldName = 'GANHO_ESPERADO'
      Origin = 'GANHO_ESPERADO'
      Required = True
      Precision = 15
      Size = 3
    end
    object SUPLEMENTO_MINERALESTOQUE_MINIMO: TBCDField
      FieldName = 'ESTOQUE_MINIMO'
      Origin = 'ESTOQUE_MINIMO'
      Required = True
      Precision = 15
      Size = 3
    end
    object SUPLEMENTO_MINERALPESO_EMBALAGEM: TBCDField
      FieldName = 'PESO_EMBALAGEM'
      Origin = 'PESO_EMBALAGEM'
      Required = True
      Precision = 15
      Size = 3
    end
    object SUPLEMENTO_MINERALSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object SUPLEMENTO_MINERALDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
    end
    object SUPLEMENTO_MINERALID_USUARIO: TSmallintField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object SUPLEMENTO_MINERALCONSUMO_ESPERADO: TBCDField
      FieldName = 'CONSUMO_ESPERADO'
      Origin = 'CONSUMO_ESPERADO'
      Required = True
      Precision = 15
      Size = 3
    end
    object SUPLEMENTO_MINERALVALOR_KG: TBCDField
      FieldName = 'VALOR_KG'
      Origin = 'VALOR_KG'
      Precision = 15
      Size = 3
    end
    object SUPLEMENTO_MINERALESTOQUE_MINIMO_DIAS: TIntegerField
      FieldName = 'ESTOQUE_MINIMO_DIAS'
      Origin = 'ESTOQUE_MINIMO_DIAS'
    end
    object SUPLEMENTO_MINERALCM_COCHO_INDICADO: TBCDField
      FieldName = 'CM_COCHO_INDICADO'
      Origin = 'CM_COCHO_INDICADO'
      Precision = 15
      Size = 2
    end
    object SUPLEMENTO_MINERALINGESTAO_PERCENT_PV: TBCDField
      FieldName = 'INGESTAO_PERCENT_PV'
      Origin = 'INGESTAO_PERCENT_PV'
      Required = True
      Precision = 15
      Size = 3
    end
    object SUPLEMENTO_MINERALPADRAO: TIntegerField
      FieldName = 'PADRAO'
      Origin = 'PADRAO'
      Required = True
    end
    object SUPLEMENTO_MINERALID_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'ID_USUARIO_ALTERACAO'
      Origin = 'ID_USUARIO_ALTERACAO'
    end
    object SUPLEMENTO_MINERALDATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
      Origin = 'DATA_ALTERACAO'
    end
    object SUPLEMENTO_MINERALFORMULADO: TIntegerField
      FieldName = 'FORMULADO'
      Origin = 'FORMULADO'
      Required = True
    end
    object SUPLEMENTO_MINERALPRE_MISTURA: TIntegerField
      FieldName = 'PRE_MISTURA'
      Origin = 'PRE_MISTURA'
      Required = True
    end
    object SUPLEMENTO_MINERALMS_TOTAL: TBCDField
      FieldName = 'MS_TOTAL'
      Origin = 'MS_TOTAL'
      Precision = 15
      Size = 3
    end
    object SUPLEMENTO_MINERALSALDO_ATUAL: TBCDField
      FieldName = 'SALDO_ATUAL'
      Origin = 'SALDO_ATUAL'
      Precision = 15
      Size = 3
    end
    object SUPLEMENTO_MINERALDATA_CUSTO_MEDIO: TDateField
      FieldName = 'DATA_CUSTO_MEDIO'
      Origin = 'DATA_CUSTO_MEDIO'
    end
  end
  object FORNECIMENTO: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'SELECT f.*,c.codigo Pasto,s.nome Mineral'
      'FROM fornecimento F'
      'JOIN currais C ON C.id=F.id_pasto'
      'JOIN suplemento_mineral S ON S.id=F.id_produto')
    Left = 400
    Top = 312
    object FORNECIMENTOID_PASTO: TIntegerField
      FieldName = 'ID_PASTO'
      Origin = 'ID_PASTO'
    end
    object FORNECIMENTOID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
    end
    object FORNECIMENTODATA_FORNECIMENTO: TDateField
      FieldName = 'DATA_FORNECIMENTO'
      Origin = 'DATA_FORNECIMENTO'
    end
    object FORNECIMENTOPREVISAO_KG: TBCDField
      FieldName = 'PREVISAO_KG'
      Origin = 'PREVISAO_KG'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTOPREVISTO_SACO: TBCDField
      FieldName = 'PREVISTO_SACO'
      Origin = 'PREVISTO_SACO'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTOREALIZADO_COCHO_KG: TBCDField
      FieldName = 'REALIZADO_COCHO_KG'
      Origin = 'REALIZADO_COCHO_KG'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTOREALIZADO_COCHO_SACO: TBCDField
      FieldName = 'REALIZADO_COCHO_SACO'
      Origin = 'REALIZADO_COCHO_SACO'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTOREALIZADO_ESTOQUE_KG: TBCDField
      FieldName = 'REALIZADO_ESTOQUE_KG'
      Origin = 'REALIZADO_ESTOQUE_KG'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTOREALIZADO_ESTOQUE_SACO: TBCDField
      FieldName = 'REALIZADO_ESTOQUE_SACO'
      Origin = 'REALIZADO_ESTOQUE_SACO'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTOID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object FORNECIMENTODATA_REG: TSQLTimeStampField
      FieldName = 'DATA_REG'
      Origin = 'DATA_REG'
    end
    object FORNECIMENTOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object FORNECIMENTOTIPO_FORNE: TStringField
      FieldName = 'TIPO_FORNE'
      Origin = 'TIPO_FORNE'
      Size = 10
    end
    object FORNECIMENTOTAG_COCHO: TStringField
      FieldName = 'TAG_COCHO'
      Origin = 'TAG_COCHO'
      Size = 30
    end
    object FORNECIMENTOLATITUDE: TStringField
      FieldName = 'LATITUDE'
      Origin = 'LATITUDE'
      Size = 50
    end
    object FORNECIMENTOLONGITUDE: TStringField
      FieldName = 'LONGITUDE'
      Origin = 'LONGITUDE'
      Size = 50
    end
    object FORNECIMENTOSOBRA_KG: TBCDField
      FieldName = 'SOBRA_KG'
      Origin = 'SOBRA_KG'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTOID_RESPONSAVEL: TIntegerField
      FieldName = 'ID_RESPONSAVEL'
      Origin = 'ID_RESPONSAVEL'
    end
    object FORNECIMENTOID_COCHO: TIntegerField
      FieldName = 'ID_COCHO'
      Origin = 'ID_COCHO'
    end
    object FORNECIMENTOQTD_ANIMAIS: TIntegerField
      FieldName = 'QTD_ANIMAIS'
      Origin = 'QTD_ANIMAIS'
    end
    object FORNECIMENTOPREVISAO_DIAS: TIntegerField
      FieldName = 'PREVISAO_DIAS'
      Origin = 'PREVISAO_DIAS'
    end
    object FORNECIMENTOCONSUMO_ESTIMADO_CAB_DIA: TBCDField
      FieldName = 'CONSUMO_ESTIMADO_CAB_DIA'
      Origin = 'CONSUMO_ESTIMADO_CAB_DIA'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTOVALOR_KG: TBCDField
      FieldName = 'VALOR_KG'
      Origin = 'VALOR_KG'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTOESTOQUE_ORIGEM: TIntegerField
      FieldName = 'ESTOQUE_ORIGEM'
      Origin = 'ESTOQUE_ORIGEM'
    end
    object FORNECIMENTOCONSUMO_ESTIMADO_TOTAL_DIA: TBCDField
      FieldName = 'CONSUMO_ESTIMADO_TOTAL_DIA'
      Origin = 'CONSUMO_ESTIMADO_TOTAL_DIA'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTOVALOR_TOTAL_FORN: TBCDField
      FieldName = 'VALOR_TOTAL_FORN'
      Origin = 'VALOR_TOTAL_FORN'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTOVALOR_CAB_DIA: TBCDField
      FieldName = 'VALOR_CAB_DIA'
      Origin = 'VALOR_CAB_DIA'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTOVALOR_TOTAL_CAB: TBCDField
      FieldName = 'VALOR_TOTAL_CAB'
      Origin = 'VALOR_TOTAL_CAB'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTOOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 200
    end
    object FORNECIMENTOID_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'ID_USUARIO_ALTERACAO'
      Origin = 'ID_USUARIO_ALTERACAO'
    end
    object FORNECIMENTODATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
      Origin = 'DATA_ALTERACAO'
    end
    object FORNECIMENTOPasto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Pasto'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object FORNECIMENTOMineral: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Mineral'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FORNECIMENTOSYNC: TIntegerField
      FieldName = 'SYNC'
      Origin = 'SYNC'
    end
    object FORNECIMENTOID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  object LOTE_NUTRICIONAL: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select ln2.*, c.CODIGO Curral,'
      '(SELECT nota '
      ' FROM LEITURA_COCHO lc '
      
        ' WHERE status=1 AND ID_LOTE=ln2.ID AND DATA_LEITURA ='#39'2021-05-02' +
        #39')UltimaNota,'
      ' (SELECT AJUSTE '
      ' FROM LEITURA_COCHO lc '
      
        ' WHERE status=1 AND ID_LOTE=ln2.ID AND DATA_LEITURA ='#39'2021-05-02' +
        #39')AJUSTE'
      'from currais c '
      'JOIN LOTE_NUTRICIONAL ln2 ON ln2.ID_LOCAL=c.id'
      'where LN2.status>-1 '
      'and C.ID_PROPRIEDADE=90001')
    Left = 552
    Top = 64
    object LOTE_NUTRICIONALID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object LOTE_NUTRICIONALID_PLANEJAMETO: TIntegerField
      FieldName = 'ID_PLANEJAMETO'
      Origin = 'ID_PLANEJAMETO'
      Required = True
    end
    object LOTE_NUTRICIONALID_PROPRIEDADE: TIntegerField
      FieldName = 'ID_PROPRIEDADE'
      Origin = 'ID_PROPRIEDADE'
      Required = True
    end
    object LOTE_NUTRICIONALID_LOCAL: TIntegerField
      FieldName = 'ID_LOCAL'
      Origin = 'ID_LOCAL'
    end
    object LOTE_NUTRICIONALDATA_ENTRADA: TDateField
      FieldName = 'DATA_ENTRADA'
      Origin = 'DATA_ENTRADA'
      Required = True
    end
    object LOTE_NUTRICIONALDATA_PRIMEIRO_TRATO: TDateField
      FieldName = 'DATA_PRIMEIRO_TRATO'
      Origin = 'DATA_PRIMEIRO_TRATO'
    end
    object LOTE_NUTRICIONALQTDE_CAB: TIntegerField
      FieldName = 'QTDE_CAB'
      Origin = 'QTDE_CAB'
    end
    object LOTE_NUTRICIONALPESO_MEDIO: TBCDField
      FieldName = 'PESO_MEDIO'
      Origin = 'PESO_MEDIO'
      Precision = 15
      Size = 3
    end
    object LOTE_NUTRICIONALDIAS_MEDIO: TIntegerField
      FieldName = 'DIAS_MEDIO'
      Origin = 'DIAS_MEDIO'
    end
    object LOTE_NUTRICIONALSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object LOTE_NUTRICIONALID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object LOTE_NUTRICIONALID_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'ID_USUARIO_ALTERACAO'
      Origin = 'ID_USUARIO_ALTERACAO'
    end
    object LOTE_NUTRICIONALDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
      Origin = 'DATA_ULTIMA_ALTERACAO'
    end
    object LOTE_NUTRICIONALPESO_ENTRADA: TBCDField
      FieldName = 'PESO_ENTRADA'
      Origin = 'PESO_ENTRADA'
      Precision = 15
      Size = 3
    end
    object LOTE_NUTRICIONALCurral: TWideStringField
      FieldName = 'Curral'
      Origin = 'Curral'
      Size = 32767
    end
    object LOTE_NUTRICIONALUltimaNota: TBCDField
      FieldName = 'UltimaNota'
      Origin = 'UltimaNota'
      Required = True
      Precision = 15
      Size = 2
    end
    object LOTE_NUTRICIONALAJUSTE: TBCDField
      FieldName = 'AJUSTE'
      Origin = 'AJUSTE'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object LEITURA_COCHO: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'SELECT lc.*,ln2.ID Lote,c.CODIGO Curral FROM LEITURA_COCHO lc '
      'JOIN LOTE_NUTRICIONAL ln2 ON ln2.ID=lc.ID_LOTE'
      'JOIN CURRAIS c ON lc.ID_CURRAL=c.ID ')
    Left = 552
    Top = 136
    object LEITURA_COCHOID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object LEITURA_COCHOID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Origin = 'ID_LOTE'
    end
    object LEITURA_COCHOID_CURRAL: TIntegerField
      FieldName = 'ID_CURRAL'
      Origin = 'ID_CURRAL'
    end
    object LEITURA_COCHODATA_LEITURA: TDateField
      FieldName = 'DATA_LEITURA'
      Origin = 'DATA_LEITURA'
    end
    object LEITURA_COCHONOTA: TBCDField
      FieldName = 'NOTA'
      Origin = 'NOTA'
      Precision = 15
      Size = 2
    end
    object LEITURA_COCHOAJUSTE: TBCDField
      FieldName = 'AJUSTE'
      Origin = 'AJUSTE'
      Precision = 15
      Size = 2
    end
    object LEITURA_COCHOID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object LEITURA_COCHOID_USUARIO_ALTERCAO: TIntegerField
      FieldName = 'ID_USUARIO_ALTERCAO'
      Origin = 'ID_USUARIO_ALTERCAO'
    end
    object LEITURA_COCHODATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
      Origin = 'DATA_ALTERACAO'
    end
    object LEITURA_COCHODATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
    end
    object LEITURA_COCHOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object LEITURA_COCHOSYNC: TIntegerField
      FieldName = 'SYNC'
      Origin = 'SYNC'
    end
    object LEITURA_COCHOLote: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Lote'
      Origin = 'ID'
      ProviderFlags = []
      ReadOnly = True
    end
    object LEITURA_COCHOCurral: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Curral'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object HIST_LEITURA_COCHO: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      
        'SELECT a.data_leitura "Label",a.nota "Value" FROM HIST_LEITURA_C' +
        'OCHO a'
      'JOIN CURRAIS c ON C.ID=ID_CURRAL')
    Left = 552
    Top = 192
    object HIST_LEITURA_COCHOLabel: TDateField
      FieldName = 'Label'
      Origin = 'DATA_LEITURA'
      Required = True
    end
    object HIST_LEITURA_COCHOValue: TBCDField
      FieldName = 'Value'
      Origin = 'NOTA'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object AUX_NOTAS_LEITURA: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from AUX_NOTAS_LEITURA'
      'order by nota')
    Left = 544
    Top = 264
    object AUX_NOTAS_LEITURAID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object AUX_NOTAS_LEITURANOTA: TFMTBCDField
      FieldName = 'NOTA'
      Origin = 'NOTA'
      Required = True
      Precision = 18
      Size = 2
    end
    object AUX_NOTAS_LEITURAAJUSTE: TBCDField
      FieldName = 'AJUSTE'
      Origin = 'AJUSTE'
      Required = True
      Precision = 15
      Size = 2
    end
  end
  object HIST_CONSUMO: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from HIST_CONSUMO')
    Left = 544
    Top = 328
    object HIST_CONSUMOID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Origin = 'ID_LOTE'
      Required = True
    end
    object HIST_CONSUMODATA_CONSUMO: TDateField
      FieldName = 'DATA_CONSUMO'
      Origin = 'DATA_CONSUMO'
      Required = True
    end
    object HIST_CONSUMOMN: TBCDField
      FieldName = 'MN'
      Origin = 'MN'
      Precision = 15
      Size = 2
    end
    object HIST_CONSUMOMS: TBCDField
      FieldName = 'MS'
      Origin = 'MS'
      Precision = 15
      Size = 2
    end
  end
  object HIST_CONSUMO_MN: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from HIST_CONSUMO')
    Left = 680
    Top = 72
  end
  object HIST_CONSUMO_MS: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'select * from HIST_CONSUMO')
    Left = 680
    Top = 136
  end
  object RACAOINSUMOS: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'SELECT B.*,A.NOME INSUMO FROM RACAOINSUMOS B'
      'JOIN ALIMENTO A ON A.ID=B.IDINSUMOALIMENTO')
    Left = 688
    Top = 216
    object RACAOINSUMOSID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object RACAOINSUMOSIDRACAO: TIntegerField
      FieldName = 'IDRACAO'
      Required = True
    end
    object RACAOINSUMOSIDINSUMOALIMENTO: TIntegerField
      FieldName = 'IDINSUMOALIMENTO'
      Required = True
    end
    object RACAOINSUMOSPERCENTMATERIASECA: TBCDField
      FieldName = 'PERCENTMATERIASECA'
      Required = True
      Precision = 15
      Size = 3
    end
    object RACAOINSUMOSKGMATERIASECA: TBCDField
      FieldName = 'KGMATERIASECA'
      Required = True
      Precision = 15
      Size = 3
    end
    object RACAOINSUMOSINCLUSAOMATERIASECA: TBCDField
      FieldName = 'INCLUSAOMATERIASECA'
      Precision = 15
      Size = 3
    end
    object RACAOINSUMOSINCLUSAOMATERIANATURAL: TBCDField
      FieldName = 'INCLUSAOMATERIANATURAL'
      Precision = 15
      Size = 3
    end
    object RACAOINSUMOSVALORKG: TBCDField
      FieldName = 'VALORKG'
      Required = True
      Precision = 15
      Size = 3
    end
    object RACAOINSUMOSVALORINCLUSAO: TBCDField
      FieldName = 'VALORINCLUSAO'
      Precision = 15
      Size = 3
    end
    object RACAOINSUMOSSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object RACAOINSUMOSDATAREGISTRO: TSQLTimeStampField
      FieldName = 'DATAREGISTRO'
      Required = True
    end
    object RACAOINSUMOSIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      Required = True
    end
    object RACAOINSUMOSDATAALTERACAO: TSQLTimeStampField
      FieldName = 'DATAALTERACAO'
    end
    object RACAOINSUMOSIDUSUARIOALTERACAO: TIntegerField
      FieldName = 'IDUSUARIOALTERACAO'
    end
    object RACAOINSUMOSKGMATERIANATURAL: TBCDField
      FieldName = 'KGMATERIANATURAL'
      Precision = 15
      Size = 3
    end
    object RACAOINSUMOSORDEM_FABRICACAO: TIntegerField
      FieldName = 'ORDEM_FABRICACAO'
    end
    object RACAOINSUMOSID_PREMISTURA: TIntegerField
      FieldName = 'ID_PREMISTURA'
    end
    object RACAOINSUMOSTOLERANCIA_FAB: TBCDField
      FieldName = 'TOLERANCIA_FAB'
      Precision = 15
      Size = 3
    end
    object RACAOINSUMOSINSUMO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INSUMO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object FABRICACAO: TFDQuery
    CachedUpdates = True
    OnReconcileError = FABRICACAOReconcileError
    Connection = FCon
    SQL.Strings = (
      'SELECT A.*,B.NOME RACAO FROM FABRICACAO A'
      'JOIN RACAO B ON A.IDRACAO=B.ID')
    Left = 688
    Top = 288
    object FABRICACAOIDRACAO: TIntegerField
      FieldName = 'IDRACAO'
      Origin = 'IDRACAO'
    end
    object FABRICACAODATA_FAB: TDateField
      FieldName = 'DATA_FAB'
      Origin = 'DATA_FAB'
    end
    object FABRICACAOKG_PREVISTO: TBCDField
      FieldName = 'KG_PREVISTO'
      Origin = 'KG_PREVISTO'
      Precision = 18
    end
    object FABRICACAOKG_REALIZADO: TBCDField
      FieldName = 'KG_REALIZADO'
      Origin = 'KG_REALIZADO'
      Precision = 18
    end
    object FABRICACAOCUSTO_TOTAL: TBCDField
      FieldName = 'CUSTO_TOTAL'
      Origin = 'CUSTO_TOTAL'
      Precision = 18
    end
    object FABRICACAOHORA_INICIO: TTimeField
      FieldName = 'HORA_INICIO'
      Origin = 'HORA_INICIO'
    end
    object FABRICACAOHORA_FIM: TTimeField
      FieldName = 'HORA_FIM'
      Origin = 'HORA_FIM'
    end
    object FABRICACAODATAREG: TDateField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
    end
    object FABRICACAOID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object FABRICACAOTIPO_BAIXA: TIntegerField
      FieldName = 'TIPO_BAIXA'
      Origin = 'TIPO_BAIXA'
    end
    object FABRICACAOID_CENTROCUSTO: TIntegerField
      FieldName = 'ID_CENTROCUSTO'
      Origin = 'ID_CENTROCUSTO'
    end
    object FABRICACAOLOTE_FABRICACAO: TStringField
      FieldName = 'LOTE_FABRICACAO'
      Origin = 'LOTE_FABRICACAO'
      Size = 100
    end
    object FABRICACAOID_OPERADOR: TIntegerField
      FieldName = 'ID_OPERADOR'
      Origin = 'ID_OPERADOR'
    end
    object FABRICACAOORIGEM_DADOS: TIntegerField
      FieldName = 'ORIGEM_DADOS'
      Origin = 'ORIGEM_DADOS'
    end
    object FABRICACAODATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
      Origin = 'DATA_ALTERACAO'
    end
    object FABRICACAOID_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'ID_USUARIO_ALTERACAO'
      Origin = 'ID_USUARIO_ALTERACAO'
    end
    object FABRICACAOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object FABRICACAOID_PROPRIEDADE: TIntegerField
      FieldName = 'ID_PROPRIEDADE'
      Origin = 'ID_PROPRIEDADE'
    end
    object FABRICACAOID_PREMISTURA: TIntegerField
      FieldName = 'ID_PREMISTURA'
      Origin = 'ID_PREMISTURA'
    end
    object FABRICACAORACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RACAO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FABRICACAOSYNC: TIntegerField
      FieldName = 'SYNC'
      Origin = 'SYNC'
    end
    object FABRICACAOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object RACAO: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'SELECT * FROM RACAO')
    Left = 688
    Top = 344
    object RACAOID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object RACAOTIPO: TIntegerField
      FieldName = 'TIPO'
      Required = True
    end
    object RACAONOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object RACAOGMD: TBCDField
      FieldName = 'GMD'
      Precision = 15
      Size = 3
    end
    object RACAOMATERIASECA: TBCDField
      FieldName = 'MATERIASECA'
      Precision = 15
      Size = 3
    end
    object RACAOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object RACAODATAREGISTRO: TSQLTimeStampField
      FieldName = 'DATAREGISTRO'
      Required = True
    end
    object RACAOIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      Required = True
    end
    object RACAODATAALTERACAO: TSQLTimeStampField
      FieldName = 'DATAALTERACAO'
    end
    object RACAOIDUSUARIOALTERACAO: TIntegerField
      FieldName = 'IDUSUARIOALTERACAO'
    end
    object RACAOVALORKG: TBCDField
      FieldName = 'VALORKG'
      Precision = 15
      Size = 3
    end
    object RACAODATAFORMULACAO: TDateField
      FieldName = 'DATAFORMULACAO'
      Required = True
    end
    object RACAOID_PROPRIEDADE: TIntegerField
      FieldName = 'ID_PROPRIEDADE'
      Required = True
    end
    object RACAOIMS_PV: TBCDField
      FieldName = 'IMS_PV'
      Precision = 15
      Size = 3
    end
    object RACAOTEMPO_MISTURA: TIntegerField
      FieldName = 'TEMPO_MISTURA'
    end
  end
  object FABRICACAO_INSUMOS: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'SELECT b.*,a.nome Insumo FROM FABRICACAO_INSUMOS b'
      'JOIN ALIMENTO A ON A.ID=B.ID_ALIMENTO')
    Left = 688
    Top = 416
    object FABRICACAO_INSUMOSID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object FABRICACAO_INSUMOSID_FABRICACAO: TIntegerField
      FieldName = 'ID_FABRICACAO'
      Required = True
    end
    object FABRICACAO_INSUMOSID_ALIMENTO: TIntegerField
      FieldName = 'ID_ALIMENTO'
    end
    object FABRICACAO_INSUMOSID_CONCENTRADO: TIntegerField
      FieldName = 'ID_CONCENTRADO'
    end
    object FABRICACAO_INSUMOSDATA_FAB: TDateField
      FieldName = 'DATA_FAB'
    end
    object FABRICACAO_INSUMOSHORA_INI: TTimeField
      FieldName = 'HORA_INI'
    end
    object FABRICACAO_INSUMOSHORA_FIM: TTimeField
      FieldName = 'HORA_FIM'
    end
    object FABRICACAO_INSUMOSMS_INSUMO: TBCDField
      FieldName = 'MS_INSUMO'
      Precision = 15
      Size = 3
    end
    object FABRICACAO_INSUMOSKG_PREVISTO: TBCDField
      FieldName = 'KG_PREVISTO'
      Precision = 18
    end
    object FABRICACAO_INSUMOSKG_FABRICADO: TBCDField
      FieldName = 'KG_FABRICADO'
      Precision = 18
    end
    object FABRICACAO_INSUMOSDATAREG: TDateField
      FieldName = 'DATAREG'
    end
    object FABRICACAO_INSUMOSID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Required = True
    end
    object FABRICACAO_INSUMOSID_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'ID_USUARIO_ALTERACAO'
    end
    object FABRICACAO_INSUMOSDATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
    end
    object FABRICACAO_INSUMOSSTATUS: TIntegerField
      FieldName = 'STATUS'
    end
    object FABRICACAO_INSUMOSVALOR_KG: TBCDField
      FieldName = 'VALOR_KG'
      Precision = 15
      Size = 3
    end
    object FABRICACAO_INSUMOSCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Size = 7
    end
    object FABRICACAO_INSUMOSSYNC: TIntegerField
      FieldName = 'SYNC'
      Origin = 'SYNC'
      Required = True
    end
    object FABRICACAO_INSUMOSInsumo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Insumo'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object USERS: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'SELECT * FROM USERS')
    Left = 160
    Top = 312
    object USERSID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object USERSDT_REGISTER: TSQLTimeStampField
      FieldName = 'DT_REGISTER'
      Origin = 'DT_REGISTER'
    end
    object USERSSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object USERSLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Size = 100
    end
    object USERSPASSWORD: TStringField
      FieldName = 'PASSWORD'
      Origin = 'PASSWORD'
      Size = 255
    end
    object USERSNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 100
    end
    object USERSTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object USERSID_PROPRIEDADE: TIntegerField
      FieldName = 'ID_PROPRIEDADE'
      Origin = 'ID_PROPRIEDADE'
    end
    object USERSID_CARGO: TIntegerField
      FieldName = 'ID_CARGO'
      Origin = 'ID_CARGO'
    end
  end
  object FORNECIMENTO_CONF: TFDQuery
    CachedUpdates = True
    OnReconcileError = FORNECIMENTO_CONFReconcileError
    Connection = FCon
    SQL.Strings = (
      'SELECT '
      ' A.*,'
      ' C.CODIGO CURRAL,'
      ' D.NOME RACAO,'
      ' E.NAME MOTORISTA,'
      ' B.QTDE_CAB QTDE_CAB_LOTE,'
      ' B.PESO_MEDIO PESO_MEDIO_LOTE'
      'FROM FORNECIMENTO_CONF A '
      'JOIN LOTE_NUTRICIONAL B ON A.ID_LOTE=B.ID'
      'JOIN CURRAIS C ON C.ID=A.ID_LOCAL'
      'JOIN RACAO D ON D.ID=A.ID_RACAO'
      'LEFT JOIN USERS E ON E.ID=A.ID_MOTORISTA')
    Left = 400
    Top = 384
    object FORNECIMENTO_CONFID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Origin = 'ID_LOTE'
    end
    object FORNECIMENTO_CONFID_LOCAL: TIntegerField
      FieldName = 'ID_LOCAL'
      Origin = 'ID_LOCAL'
    end
    object FORNECIMENTO_CONFQTD_CAB: TIntegerField
      FieldName = 'QTD_CAB'
      Origin = 'QTD_CAB'
    end
    object FORNECIMENTO_CONFMEDIA_PESO: TBCDField
      FieldName = 'MEDIA_PESO'
      Origin = 'MEDIA_PESO'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTO_CONFDATA_FORN: TDateField
      FieldName = 'DATA_FORN'
      Origin = 'DATA_FORN'
    end
    object FORNECIMENTO_CONFHORA_FORN: TTimeField
      FieldName = 'HORA_FORN'
      Origin = 'HORA_FORN'
    end
    object FORNECIMENTO_CONFTRATO: TIntegerField
      FieldName = 'TRATO'
      Origin = 'TRATO'
    end
    object FORNECIMENTO_CONFID_RACAO: TIntegerField
      FieldName = 'ID_RACAO'
      Origin = 'ID_RACAO'
    end
    object FORNECIMENTO_CONFMS_RACAO: TBCDField
      FieldName = 'MS_RACAO'
      Origin = 'MS_RACAO'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTO_CONFVALOR_KG_RACAO: TBCDField
      FieldName = 'VALOR_KG_RACAO'
      Origin = 'VALOR_KG_RACAO'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTO_CONFPREVISTO_MN_KG: TIntegerField
      FieldName = 'PREVISTO_MN_KG'
      Origin = 'PREVISTO_MN_KG'
    end
    object FORNECIMENTO_CONFREALIZADO_MN_KG: TIntegerField
      FieldName = 'REALIZADO_MN_KG'
      Origin = 'REALIZADO_MN_KG'
    end
    object FORNECIMENTO_CONFCUSTO_TOTAL_TRATO: TBCDField
      FieldName = 'CUSTO_TOTAL_TRATO'
      Origin = 'CUSTO_TOTAL_TRATO'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTO_CONFID_MOTORISTA: TIntegerField
      FieldName = 'ID_MOTORISTA'
      Origin = 'ID_MOTORISTA'
    end
    object FORNECIMENTO_CONFID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object FORNECIMENTO_CONFDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
    end
    object FORNECIMENTO_CONFSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object FORNECIMENTO_CONFLOTE_FABRICACAO: TStringField
      FieldName = 'LOTE_FABRICACAO'
      Origin = 'LOTE_FABRICACAO'
    end
    object FORNECIMENTO_CONFID_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'ID_USUARIO_ALTERACAO'
      Origin = 'ID_USUARIO_ALTERACAO'
    end
    object FORNECIMENTO_CONFDATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
      Origin = 'DATA_ALTERACAO'
    end
    object FORNECIMENTO_CONFSYNC: TIntegerField
      FieldName = 'SYNC'
      Origin = 'SYNC'
    end
    object FORNECIMENTO_CONFCURRAL: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CURRAL'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object FORNECIMENTO_CONFRACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RACAO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FORNECIMENTO_CONFMOTORISTA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MOTORISTA'
      Origin = 'NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FORNECIMENTO_CONFID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FORNECIMENTO_CONFQTDE_CAB_LOTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTDE_CAB_LOTE'
      Origin = 'QTDE_CAB'
      ProviderFlags = []
      ReadOnly = True
    end
    object FORNECIMENTO_CONFPESO_MEDIO_LOTE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PESO_MEDIO_LOTE'
      Origin = 'PESO_MEDIO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 15
      Size = 3
    end
  end
  object LISTA_LOTE_FRAME: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'SELECT '
      ' fc.data_FORN DATA_FORN,'
      ' fc.trato TRATO,'
      ' CP.CODIGO CURRAL,'
      ' RR.NOME RACAO,'
      ' fc.PREVISTO_MN_KG,'
      ' fc.REALIZADO_MN_KG,'
      ' fc.ID ID_FORNE,'
      ' fc.ID_LOCAL IDCURRAL,'
      ' fc.ID_LOTE IDLOTE,'
      ' lf.QTDE_CAB'
      'FROM FORNECIMENTO_CONF fc '
      'JOIN RACAO RR on RR.ID=fc.ID_RACAO'
      'join LOTE_NUTRICIONAL LF ON LF.ID=fc.id_lote'
      'JOIN CURRAIS CP on CP.ID=fc.ID_LOCAL')
    Left = 800
    Top = 136
    object LISTA_LOTE_FRAMEDATA_FORN: TDateField
      FieldName = 'DATA_FORN'
      Origin = 'DATA_FORN'
    end
    object LISTA_LOTE_FRAMETRATO: TIntegerField
      FieldName = 'TRATO'
      Origin = 'TRATO'
      Required = True
    end
    object LISTA_LOTE_FRAMECURRAL: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CURRAL'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object LISTA_LOTE_FRAMERACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RACAO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object LISTA_LOTE_FRAMEPREVISTO_MN_KG: TIntegerField
      FieldName = 'PREVISTO_MN_KG'
      Origin = 'PREVISTO_MN_KG'
      Required = True
    end
    object LISTA_LOTE_FRAMEREALIZADO_MN_KG: TIntegerField
      FieldName = 'REALIZADO_MN_KG'
      Origin = 'REALIZADO_MN_KG'
    end
    object LISTA_LOTE_FRAMEID_FORNE: TFDAutoIncField
      FieldName = 'ID_FORNE'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object LISTA_LOTE_FRAMEIDCURRAL: TIntegerField
      FieldName = 'IDCURRAL'
      Origin = 'ID_LOCAL'
      Required = True
    end
    object LISTA_LOTE_FRAMEIDLOTE: TIntegerField
      FieldName = 'IDLOTE'
      Origin = 'ID_LOTE'
      Required = True
    end
    object LISTA_LOTE_FRAMEQTDE_CAB: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTDE_CAB'
      Origin = 'QTDE_CAB'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryLinhaConfinamento: TFDQuery
    Connection = FCon
    SQL.Strings = (
      'select '
      ' substr(CP.CODIGO,1 ,(INSTR(CP.CODIGO,'#39'-'#39')-1)) linha'
      'from currais cp '
      'where status=1 and tipo=0'
      'group by substr(CP.CODIGO,1 ,(INSTR(CP.CODIGO,'#39'-'#39')-1))'
      'order by substr(CP.CODIGO,1 ,(INSTR(CP.CODIGO,'#39'-'#39')-1))')
    Left = 808
    Top = 192
    object qryLinhaConfinamentolinha: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'linha'
      Origin = 'linha'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object HIST_SANIDADE: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'SELECT * FROM HIST_SANIDADE')
    Left = 256
    Top = 336
    object HIST_SANIDADEID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object HIST_SANIDADEID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'ID_ANIMAL'
      Required = True
    end
    object HIST_SANIDADEID_PROPRIEDADE: TIntegerField
      FieldName = 'ID_PROPRIEDADE'
      Origin = 'ID_PROPRIEDADE'
    end
    object HIST_SANIDADEDATA_APLICACAO: TDateField
      FieldName = 'DATA_APLICACAO'
      Origin = 'DATA_APLICACAO'
    end
    object HIST_SANIDADEPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Size = 100
    end
    object HIST_SANIDADEDOSE_ML: TBCDField
      FieldName = 'DOSE_ML'
      Origin = 'DOSE_ML'
      Precision = 15
      Size = 3
    end
    object HIST_SANIDADECARENCIA_DIAS: TIntegerField
      FieldName = 'CARENCIA_DIAS'
      Origin = 'CARENCIA_DIAS'
    end
    object HIST_SANIDADECARENCIA_DATA: TDateField
      FieldName = 'CARENCIA_DATA'
      Origin = 'CARENCIA_DATA'
    end
  end
  object PROTOCOLO_SANITARIO: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'SELECT * FROM PROTOCOLO_SANITARIO')
    Left = 168
    Top = 440
    object PROTOCOLO_SANITARIOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PROTOCOLO_SANITARIONOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object PROTOCOLO_SANITARIOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object PROTOCOLO_SANITARIOTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
  end
  object PROTOCOLO_FARMACOS: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'SELECT * FROM PROTOCOLO_FARMACOS')
    Left = 352
    Top = 440
    object PROTOCOLO_FARMACOSID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object PROTOCOLO_FARMACOSID_FARMACO: TIntegerField
      FieldName = 'ID_FARMACO'
      Origin = 'ID_FARMACO'
      Required = True
    end
    object PROTOCOLO_FARMACOSTIPO_DOSAGEM: TIntegerField
      FieldName = 'TIPO_DOSAGEM'
      Origin = 'TIPO_DOSAGEM'
      Required = True
    end
    object PROTOCOLO_FARMACOSDOSE_FIXA_ML: TBCDField
      FieldName = 'DOSE_FIXA_ML'
      Origin = 'DOSE_FIXA_ML'
      Precision = 15
      Size = 2
    end
    object PROTOCOLO_FARMACOSDOSE_PESO_ML: TBCDField
      FieldName = 'DOSE_PESO_ML'
      Origin = 'DOSE_PESO_ML'
      Precision = 15
      Size = 2
    end
    object PROTOCOLO_FARMACOSDOSE_PESO_KG: TBCDField
      FieldName = 'DOSE_PESO_KG'
      Origin = 'DOSE_PESO_KG'
      Precision = 15
      Size = 2
    end
    object PROTOCOLO_FARMACOSID_PROTOCOLO: TIntegerField
      FieldName = 'ID_PROTOCOLO'
      Origin = 'ID_PROTOCOLO'
      Required = True
    end
    object PROTOCOLO_FARMACOSCARENCIA_DIAS: TIntegerField
      FieldName = 'CARENCIA_DIAS'
      Origin = 'CARENCIA_DIAS'
    end
  end
  object FARMACO: TFDQuery
    CachedUpdates = True
    Connection = FCon
    SQL.Strings = (
      'SELECT '
      ' F.*,'
      ' CASE '
      '   WHEN TIPO_APICACAO=0 THEN '#39'FIXA'#39
      '   ELSE  '
      '    '#39'ML PESO'#39
      ' END TIPO_DOSAGEM '
      'FROM FARMACO f ')
    Left = 56
    Top = 432
    object FARMACOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FARMACONOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object FARMACOPRINCIPIO_ATIVO: TStringField
      FieldName = 'PRINCIPIO_ATIVO'
      Origin = 'PRINCIPIO_ATIVO'
      Size = 100
    end
    object FARMACOTIPO_APICACAO: TIntegerField
      FieldName = 'TIPO_APICACAO'
      Origin = 'TIPO_APICACAO'
    end
    object FARMACOML_DOSE_FIXA: TBCDField
      FieldName = 'ML_DOSE_FIXA'
      Origin = 'ML_DOSE_FIXA'
      Precision = 15
      Size = 2
    end
    object FARMACOML_DOSE_PV: TBCDField
      FieldName = 'ML_DOSE_PV'
      Origin = 'ML_DOSE_PV'
      Precision = 15
      Size = 2
    end
    object FARMACOKG_DOSE_PV: TBCDField
      FieldName = 'KG_DOSE_PV'
      Origin = 'KG_DOSE_PV'
      Precision = 15
      Size = 2
    end
    object FARMACOCARENCIA_DIA: TIntegerField
      FieldName = 'CARENCIA_DIA'
      Origin = 'CARENCIA_DIA'
    end
    object FARMACOVALOR_ML: TFloatField
      FieldName = 'VALOR_ML'
      Origin = 'VALOR_ML'
    end
    object FARMACOTIPO_DOSAGEM: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_DOSAGEM'
      Origin = 'TIPO_DOSAGEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object TableProtocoloFarmacos: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'ID_PROTOCOLO'
    MasterFields = 'ID'
    DetailFields = 'ID_PROTOCOLO'
    Connection = FCon
    SQL.Strings = (
      'select '
      'PF.ID,'
      'PF.ID_FARMACO,'
      'PF.TIPO_DOSAGEM,'
      'COALESCE(PF.DOSE_FIXA_ML,0)DOSE_FIXA_ML,'
      'COALESCE(PF.DOSE_PESO_ML,0)DOSE_PESO_ML,'
      'COALESCE(PF.DOSE_PESO_KG,0)DOSE_PESO_KG,'
      'PF.ID_PROTOCOLO,'
      'PF.CARENCIA_DIAS, '
      'F.NOME FARMACO,'
      'CASE '
      '  WHEN PF.TIPO_DOSAGEM=0 THEN '#39'FIXA'#39
      '  WHEN PF.TIPO_DOSAGEM=1 THEN '#39'PESO'#39
      ' END TIPO_APLICACAO_STR'
      'from PROTOCOLO_FARMACOS PF '
      'JOIN FARMACO F ON F.ID=PF.ID_FARMACO'
      'where id_protocolo=:ID')
    Left = 508
    Top = 443
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
  end
end
