object dmSyncUp: TdmSyncUp
  Height = 385
  Width = 525
  object LIMPEZABEBEDOURO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from LIMPEZABEBEDOURO a'
      'where sync=0'
      '')
    Left = 66
    Top = 16
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
  end
  object MOVIMENTACAO_ANIMAL: TFDQuery
    Connection = dmdb.FCon
    SQL.Strings = (
      'select'
      ' a.*'
      ' from movimentacao_animal a'
      'where sync=0')
    Left = 202
    Top = 16
  end
  object QryAuxLoop: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    Left = 24
    Top = 232
  end
  object qryAux: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    Left = 104
    Top = 232
  end
  object FORNECIMENTO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT f.* '
      'FROM fornecimento F'
      'where sync=0')
    Left = 64
    Top = 72
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
    object FORNECIMENTOESTOQUE_ORIGEM: TIntegerField
      FieldName = 'ESTOQUE_ORIGEM'
      Origin = 'ESTOQUE_ORIGEM'
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
  object LEITURA_COCHO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM LEITURA_COCHO'
      'where sync=0')
    Left = 200
    Top = 72
  end
  object FABRICACAO_INSUMOS: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM FABRICACAO_INSUMOS'
      'WHERE SYNC=0')
    Left = 330
    Top = 96
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
  end
  object FABRICACAO: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM FABRICACAO'
      'WHERE STATUS=2 AND SYNC=0')
    Left = 330
    Top = 24
    object FABRICACAOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FABRICACAOIDRACAO: TIntegerField
      FieldName = 'IDRACAO'
      Origin = 'IDRACAO'
      Required = True
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
  end
  object FORNECIMENTO_CONF: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM FORNECIMENTO_CONF '
      'WHERE SYNC=0 and REALIZADO_MN_KG>0')
    Left = 336
    Top = 160
    object FORNECIMENTO_CONFID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FORNECIMENTO_CONFID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Origin = 'ID_LOTE'
      Required = True
    end
    object FORNECIMENTO_CONFID_LOCAL: TIntegerField
      FieldName = 'ID_LOCAL'
      Origin = 'ID_LOCAL'
      Required = True
    end
    object FORNECIMENTO_CONFQTD_CAB: TIntegerField
      FieldName = 'QTD_CAB'
      Origin = 'QTD_CAB'
      Required = True
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
      Required = True
    end
    object FORNECIMENTO_CONFID_RACAO: TIntegerField
      FieldName = 'ID_RACAO'
      Origin = 'ID_RACAO'
      Required = True
    end
    object FORNECIMENTO_CONFMS_RACAO: TBCDField
      FieldName = 'MS_RACAO'
      Origin = 'MS_RACAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object FORNECIMENTO_CONFVALOR_KG_RACAO: TBCDField
      FieldName = 'VALOR_KG_RACAO'
      Origin = 'VALOR_KG_RACAO'
      Required = True
      Precision = 15
      Size = 2
    end
    object FORNECIMENTO_CONFPREVISTO_MN_KG: TIntegerField
      FieldName = 'PREVISTO_MN_KG'
      Origin = 'PREVISTO_MN_KG'
      Required = True
    end
    object FORNECIMENTO_CONFREALIZADO_MN_KG: TIntegerField
      FieldName = 'REALIZADO_MN_KG'
      Origin = 'REALIZADO_MN_KG'
    end
    object FORNECIMENTO_CONFCUSTO_TOTAL_TRATO: TBCDField
      FieldName = 'CUSTO_TOTAL_TRATO'
      Origin = 'CUSTO_TOTAL_TRATO'
      Required = True
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
      Required = True
    end
    object FORNECIMENTO_CONFSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
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
      Required = True
    end
  end
  object QryAuxLoopFab: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    Left = 32
    Top = 160
  end
  object ANIMAL_SANIDADE: TFDQuery
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT * FROM ANIMAL_SANIDADE'
      'WHERE SYNC=0')
    Left = 336
    Top = 240
    object ANIMAL_SANIDADEID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object ANIMAL_SANIDADEID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'ID_ANIMAL'
      Required = True
    end
    object ANIMAL_SANIDADEID_FARMACO: TIntegerField
      FieldName = 'ID_FARMACO'
      Origin = 'ID_FARMACO'
      Required = True
    end
    object ANIMAL_SANIDADEID_PROTOCOLO: TIntegerField
      FieldName = 'ID_PROTOCOLO'
      Origin = 'ID_PROTOCOLO'
    end
    object ANIMAL_SANIDADEDOSE_ML: TBCDField
      FieldName = 'DOSE_ML'
      Origin = 'DOSE_ML'
      Required = True
      Precision = 15
      Size = 2
    end
    object ANIMAL_SANIDADEID_PROPRIEDAE: TIntegerField
      FieldName = 'ID_PROPRIEDAE'
      Origin = 'ID_PROPRIEDAE'
      Required = True
    end
    object ANIMAL_SANIDADEID_LOCAL_ATUAL: TIntegerField
      FieldName = 'ID_LOCAL_ATUAL'
      Origin = 'ID_LOCAL_ATUAL'
      Required = True
    end
    object ANIMAL_SANIDADEDATA_APLICACAO: TDateField
      FieldName = 'DATA_APLICACAO'
      Origin = 'DATA_APLICACAO'
      Required = True
    end
    object ANIMAL_SANIDADETIPO_APLICACAO: TIntegerField
      FieldName = 'TIPO_APLICACAO'
      Origin = 'TIPO_APLICACAO'
      Required = True
    end
    object ANIMAL_SANIDADEID_RESPONSAVEL_APLICACAO: TIntegerField
      FieldName = 'ID_RESPONSAVEL_APLICACAO'
      Origin = 'ID_RESPONSAVEL_APLICACAO'
    end
    object ANIMAL_SANIDADEID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object ANIMAL_SANIDADEDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object ANIMAL_SANIDADESTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object ANIMAL_SANIDADETIPO_TRATAMENTO: TIntegerField
      FieldName = 'TIPO_TRATAMENTO'
      Origin = 'TIPO_TRATAMENTO'
      Required = True
    end
    object ANIMAL_SANIDADEID_RESPONSAVEL_APLI_DIREITO: TIntegerField
      FieldName = 'ID_RESPONSAVEL_APLI_DIREITO'
      Origin = 'ID_RESPONSAVEL_APLI_DIREITO'
    end
    object ANIMAL_SANIDADECARENCIA_DIAS: TIntegerField
      FieldName = 'CARENCIA_DIAS'
      Origin = 'CARENCIA_DIAS'
      Required = True
    end
    object ANIMAL_SANIDADEID_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'ID_USUARIO_ALTERACAO'
      Origin = 'ID_USUARIO_ALTERACAO'
    end
    object ANIMAL_SANIDADEDATA_ULTIMA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_ALTERACAO'
      Origin = 'DATA_ULTIMA_ALTERACAO'
    end
    object ANIMAL_SANIDADECARENCIA_DATA: TDateField
      FieldName = 'CARENCIA_DATA'
      Origin = 'CARENCIA_DATA'
    end
    object ANIMAL_SANIDADEORIGEM_DADOS: TIntegerField
      FieldName = 'ORIGEM_DADOS'
      Origin = 'ORIGEM_DADOS'
    end
    object ANIMAL_SANIDADEID_MOTIVO_APLICACAO: TIntegerField
      FieldName = 'ID_MOTIVO_APLICACAO'
      Origin = 'ID_MOTIVO_APLICACAO'
    end
    object ANIMAL_SANIDADEID_BASE_CAMPO: TIntegerField
      FieldName = 'ID_BASE_CAMPO'
      Origin = 'ID_BASE_CAMPO'
    end
    object ANIMAL_SANIDADEBASE_CAMPO_SYNC: TIntegerField
      FieldName = 'BASE_CAMPO_SYNC'
      Origin = 'BASE_CAMPO_SYNC'
    end
    object ANIMAL_SANIDADEBASE_CAMPO_DT_SYNC: TDateField
      FieldName = 'BASE_CAMPO_DT_SYNC'
      Origin = 'BASE_CAMPO_DT_SYNC'
    end
    object ANIMAL_SANIDADEVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
    end
    object ANIMAL_SANIDADESYNC: TIntegerField
      FieldName = 'SYNC'
      Origin = 'SYNC'
    end
  end
end
