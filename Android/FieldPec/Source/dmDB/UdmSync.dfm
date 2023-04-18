object dmSync: TdmSync
  Height = 386
  Width = 810
  object USERS: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from users'
      'where status>-1 ')
    Left = 48
    Top = 16
  end
  object qryAux: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    Left = 152
    Top = 256
  end
  object PROPRIEDADES: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from propriedades'
      'where propria=1 and status>-1')
    Left = 48
    Top = 72
  end
  object CURRAIS: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from currais'
      'where status>-1 and id_propriedade=90001')
    Left = 48
    Top = 128
  end
  object ALIMENTO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from alimento'
      'where status=1')
    Left = 40
    Top = 189
  end
  object RACA: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from raca'
      'where status=1')
    Left = 136
    Top = 16
  end
  object CATEGORIAS: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select c.* from categorias c')
    Left = 136
    Top = 72
  end
  object CATEGORIA_PADRAO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select c.* from categoria_padrao c')
    Left = 136
    Top = 136
  end
  object PRODUTORES: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM PRODUTORES')
    Left = 128
    Top = 192
  end
  object AUX_REBANHO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from AUX_REBANHO')
    Left = 224
    Top = 16
  end
  object ANIMAIS: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    Left = 224
    Top = 80
  end
  object BEBEDOURO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select b.*,c.id_propriedade from BEBEDOURO b'
      'JOIN currais c ON b.id_pasto=c.id')
    Left = 224
    Top = 136
  end
  object COCHO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT a.*,b.id_propriedade FROM cocho A'
      'JOIN currais B ON A.id_pasto=B.id')
    Left = 224
    Top = 200
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
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 128
    Top = 328
  end
  object AUX_MOTIVO_MOVIMENTACAO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM AUX_MOTIVO_MOVIMENTACAO')
    Left = 349
    Top = 16
  end
  object SUPLEMENTO_MINERAL: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM SUPLEMENTO_MINERAL')
    Left = 352
    Top = 72
  end
  object LOTE_NUTRICIONAL: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM LOTE_NUTRICIONAL')
    Left = 352
    Top = 136
  end
  object LEITURA_COCHO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM LEITURA_COCHO')
    Left = 360
    Top = 200
  end
  object HIST_LEITURA_COCHO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT a.* FROM HIST_LEITURA_COCHO a'
      'JOIN CURRAIS c ON C.ID=ID_CURRAL')
    Left = 352
    Top = 264
  end
  object AUX_NOTAS_LEITURA: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from AUX_NOTAS_LEITURA')
    Left = 504
    Top = 32
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
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from HIST_CONSUMO')
    Left = 496
    Top = 112
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
    object HIST_CONSUMOID_CURRAL: TIntegerField
      FieldName = 'ID_CURRAL'
      Origin = 'ID_CURRAL'
    end
    object HIST_CONSUMOIMSPV: TBCDField
      FieldName = 'IMSPV'
      Origin = 'IMSPV'
      Precision = 15
      Size = 2
    end
  end
  object RACAO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM RACAO')
    Left = 600
    Top = 8
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
  object RACAOINSUMOS: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM RACAOINSUMOS'
      '')
    Left = 600
    Top = 72
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
  end
  object FORNECIMENTO_CONF: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM FORNECIMENTO_CONF'
      'WHERE SYNC=0')
    Left = 717
    Top = 24
    object FORNECIMENTO_CONFID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Required = True
    end
    object FORNECIMENTO_CONFID_LOCAL: TIntegerField
      FieldName = 'ID_LOCAL'
      Required = True
    end
    object FORNECIMENTO_CONFQTD_CAB: TIntegerField
      FieldName = 'QTD_CAB'
      Required = True
    end
    object FORNECIMENTO_CONFMEDIA_PESO: TBCDField
      FieldName = 'MEDIA_PESO'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTO_CONFDATA_FORN: TDateField
      FieldName = 'DATA_FORN'
    end
    object FORNECIMENTO_CONFHORA_FORN: TTimeField
      FieldName = 'HORA_FORN'
    end
    object FORNECIMENTO_CONFTRATO: TIntegerField
      FieldName = 'TRATO'
      Required = True
    end
    object FORNECIMENTO_CONFID_RACAO: TIntegerField
      FieldName = 'ID_RACAO'
      Required = True
    end
    object FORNECIMENTO_CONFMS_RACAO: TBCDField
      FieldName = 'MS_RACAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object FORNECIMENTO_CONFVALOR_KG_RACAO: TBCDField
      FieldName = 'VALOR_KG_RACAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object FORNECIMENTO_CONFPREVISTO_MN_KG: TIntegerField
      FieldName = 'PREVISTO_MN_KG'
      Required = True
    end
    object FORNECIMENTO_CONFREALIZADO_MN_KG: TIntegerField
      FieldName = 'REALIZADO_MN_KG'
    end
    object FORNECIMENTO_CONFCUSTO_TOTAL_TRATO: TBCDField
      FieldName = 'CUSTO_TOTAL_TRATO'
      Required = True
      Precision = 15
      Size = 2
    end
    object FORNECIMENTO_CONFID_MOTORISTA: TIntegerField
      FieldName = 'ID_MOTORISTA'
    end
    object FORNECIMENTO_CONFID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
    end
    object FORNECIMENTO_CONFDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Required = True
    end
    object FORNECIMENTO_CONFSTATUS: TIntegerField
      FieldName = 'STATUS'
      Required = True
    end
    object FORNECIMENTO_CONFLOTE_FABRICACAO: TStringField
      FieldName = 'LOTE_FABRICACAO'
    end
    object FORNECIMENTO_CONFID_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'ID_USUARIO_ALTERACAO'
    end
    object FORNECIMENTO_CONFDATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
    end
    object FORNECIMENTO_CONFID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object FORNECIMENTO_PREVISTO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM FORNECIMENTO_CONF')
    Left = 693
    Top = 120
    object FORNECIMENTO_PREVISTOID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Origin = 'ID_LOTE'
    end
    object FORNECIMENTO_PREVISTOID_LOCAL: TIntegerField
      FieldName = 'ID_LOCAL'
      Origin = 'ID_LOCAL'
    end
    object FORNECIMENTO_PREVISTOQTD_CAB: TIntegerField
      FieldName = 'QTD_CAB'
      Origin = 'QTD_CAB'
    end
    object FORNECIMENTO_PREVISTOMEDIA_PESO: TBCDField
      FieldName = 'MEDIA_PESO'
      Origin = 'MEDIA_PESO'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTO_PREVISTODATA_FORN: TDateField
      FieldName = 'DATA_FORN'
      Origin = 'DATA_FORN'
    end
    object FORNECIMENTO_PREVISTOHORA_FORN: TTimeField
      FieldName = 'HORA_FORN'
      Origin = 'HORA_FORN'
    end
    object FORNECIMENTO_PREVISTOTRATO: TIntegerField
      FieldName = 'TRATO'
      Origin = 'TRATO'
    end
    object FORNECIMENTO_PREVISTOID_RACAO: TIntegerField
      FieldName = 'ID_RACAO'
      Origin = 'ID_RACAO'
    end
    object FORNECIMENTO_PREVISTOMS_RACAO: TBCDField
      FieldName = 'MS_RACAO'
      Origin = 'MS_RACAO'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTO_PREVISTOVALOR_KG_RACAO: TBCDField
      FieldName = 'VALOR_KG_RACAO'
      Origin = 'VALOR_KG_RACAO'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTO_PREVISTOPREVISTO_MN_KG: TIntegerField
      FieldName = 'PREVISTO_MN_KG'
      Origin = 'PREVISTO_MN_KG'
    end
    object FORNECIMENTO_PREVISTOREALIZADO_MN_KG: TIntegerField
      FieldName = 'REALIZADO_MN_KG'
      Origin = 'REALIZADO_MN_KG'
    end
    object FORNECIMENTO_PREVISTOCUSTO_TOTAL_TRATO: TBCDField
      FieldName = 'CUSTO_TOTAL_TRATO'
      Origin = 'CUSTO_TOTAL_TRATO'
      Precision = 15
      Size = 2
    end
    object FORNECIMENTO_PREVISTOID_MOTORISTA: TIntegerField
      FieldName = 'ID_MOTORISTA'
      Origin = 'ID_MOTORISTA'
    end
    object FORNECIMENTO_PREVISTOID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object FORNECIMENTO_PREVISTODATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
    end
    object FORNECIMENTO_PREVISTOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object FORNECIMENTO_PREVISTOLOTE_FABRICACAO: TStringField
      FieldName = 'LOTE_FABRICACAO'
      Origin = 'LOTE_FABRICACAO'
    end
    object FORNECIMENTO_PREVISTOID_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'ID_USUARIO_ALTERACAO'
      Origin = 'ID_USUARIO_ALTERACAO'
    end
    object FORNECIMENTO_PREVISTODATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
      Origin = 'DATA_ALTERACAO'
    end
    object FORNECIMENTO_PREVISTOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FORNECIMENTO_PREVISTOSYNC: TIntegerField
      FieldName = 'SYNC'
      Origin = 'SYNC'
      Required = True
    end
  end
  object QryAuxLoop: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    Left = 496
    Top = 184
  end
  object FARMACO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM FARMACO')
    Left = 488
    Top = 256
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
  end
  object PROTOCOLO_SANITARIO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM PROTOCOLO_SANITARIO')
    Left = 600
    Top = 264
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
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM PROTOCOLO_FARMACOS')
    Left = 704
    Top = 232
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
end
