object dmDB: TdmDB
  Height = 506
  Width = 930
  object USERS: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from users'
      'where status>-1 ')
    Left = 48
    Top = 16
  end
  object PROPRIEDADES: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from propriedades'
      'where propria=1 and status>-1')
    Left = 48
    Top = 72
  end
  object CURRAIS: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from currais b'
      'WHERE B.status=1 ')
    Left = 48
    Top = 136
  end
  object ALIMENTO: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from alimento'
      'where status=1')
    Left = 48
    Top = 189
  end
  object RACA: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from raca'
      'where status=1')
    Left = 200
    Top = 40
  end
  object CATEGORIAS: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select c.* from categorias c')
    Left = 200
    Top = 96
  end
  object CATEGORIA_PADRAO: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select c.* from categoria_padrao c')
    Left = 200
    Top = 160
  end
  object PRODUTORES: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from produtores'
      'where id_propriedade in('
      ' select id from propriedades'
      ' where status=1 and propria=1)')
    Left = 208
    Top = 224
  end
  object AUX_REBANHO: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from AUX_REBANHO')
    Left = 200
    Top = 288
  end
  object ANIMAL: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT  '
      #39'INSERT INTO ANIMAL'#39'||'
      
        #39'(ID,ID_USUARIO, IDENTIFICACAO_1, IDENTIFICACAO_2, PESO_ENTRADA,' +
        ' PESO_ESTIMADO, ID_LOCAL, ID_LOTE, ID_RACA,'#39'||'
      
        #39'ID_CATEGORIA, ID_REBANHO, ID_PROPRIEDADE, ID_PRODUTOR, ID_CONTR' +
        'ATO,DATA_PROC,IDADE_MESES,DIAS) VALUES('#39'||'
      ' ID||'#39','#39'||'
      ' ID_USUARIO||'#39','#39'||'
      ' '#39#39#39#39'||COALESCE(IDENTIFICACAO_1,'#39#39')||'#39#39#39#39'||'#39','#39'||'
      ' '#39#39#39#39'||COALESCE(IDENTIFICACAO_2,'#39#39')||'#39#39#39#39'||'#39','#39'|| '
      ' PESO_ENTRADA||'#39','#39'||'
      ' COALESCE(PESO_ESTIMADO,0)||'#39','#39'||'
      ' ID_LOCAL||'#39','#39'||'
      ' COALESCE(ID_LOTE,0)||'#39','#39'||'
      ' ID_RACA||'#39','#39'||'
      ' ID_CATEGORIA||'#39','#39'||'
      ' ID_REBANHO||'#39','#39'||'
      ' ID_PROPRIEDADE||'#39','#39'||'
      ' ID_PRODUTOR||'#39','#39'||'
      ' COALESCE(ID_CONTRATO,0)||'#39','#39'||'
      ' '#39#39#39#39'||CAST(DATA_PROC AS DATE)||'#39#39#39#39'||'#39','#39
      ' ||IDADE_MESES||'#39','#39'||'
      
        ' datediff(DAY FROM A.DATA_PROC TO CURRENT_DATE)||'#39');'#39' as InsertI' +
        'nto,'
      'ID_PROPRIEDADE'
      'FROM ANIMAL a '
      'where status=1')
    Left = 344
    Top = 48
    object ANIMALINSERTINTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INSERTINTO'
      Origin = 'INSERTINTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 467
    end
    object ANIMALID_PROPRIEDADE: TIntegerField
      FieldName = 'ID_PROPRIEDADE'
      Origin = 'ID_PROPRIEDADE'
    end
  end
  object BEBEDOURO: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT a.*,b.ID_PROPRIEDADE FROM bebedouro A'
      'JOIN currais B ON A.id_pasto=B.id'
      'WHERE B.status=1 and a.status=1')
    Left = 344
    Top = 104
  end
  object COCHO: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT A.*,B.ID_PROPRIEDADE FROM cocho A'
      'JOIN currais B ON A.id_pasto=B.id'
      'WHERE B.status=1 and a.status=1')
    Left = 344
    Top = 152
  end
  object LIMPEZABEBEDOURO: TFDQuery
    CachedUpdates = True
    OnReconcileError = LIMPEZABEBEDOUROReconcileError
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from LIMPEZABEBEDOURO a'
      '')
    Left = 608
    Top = 40
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
  object AUX_MOTIVO_MOVIMENTACAO: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT * FROM AUX_MOTIVO_MOVIMENTACAO')
    Left = 341
    Top = 216
  end
  object MOVIMENTACAO_ANIMAL: TFDQuery
    CachedUpdates = True
    OnReconcileError = MOVIMENTACAO_ANIMALReconcileError
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select'
      ' a.*'
      'from movimentacao_animal a')
    Left = 610
    Top = 96
  end
  object qryInsert: TFDQuery
    CachedUpdates = True
    OnReconcileError = qryInsertReconcileError
    Connection = frmPrincipal.FCon
    Left = 344
    Top = 280
  end
  object SUPLEMENTO_MINERAL: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT * FROM SUPLEMENTO_MINERAL'
      'WHERE status=1 ')
    Left = 464
    Top = 40
  end
  object FORNECIMENTO: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT f.*'
      'FROM fornecimento F')
    Left = 608
    Top = 152
    object FORNECIMENTOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
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
    object FORNECIMENTOPREVISAO_KG: TFMTBCDField
      FieldName = 'PREVISAO_KG'
      Origin = 'PREVISAO_KG'
      Precision = 18
      Size = 2
    end
    object FORNECIMENTOPREVISTO_SACO: TFMTBCDField
      FieldName = 'PREVISTO_SACO'
      Origin = 'PREVISTO_SACO'
      Precision = 18
      Size = 2
    end
    object FORNECIMENTOREALIZADO_COCHO_KG: TFMTBCDField
      FieldName = 'REALIZADO_COCHO_KG'
      Origin = 'REALIZADO_COCHO_KG'
      Precision = 18
      Size = 2
    end
    object FORNECIMENTOREALIZADO_COCHO_SACO: TFMTBCDField
      FieldName = 'REALIZADO_COCHO_SACO'
      Origin = 'REALIZADO_COCHO_SACO'
      Precision = 18
      Size = 2
    end
    object FORNECIMENTOREALIZADO_ESTOQUE_KG: TFMTBCDField
      FieldName = 'REALIZADO_ESTOQUE_KG'
      Origin = 'REALIZADO_ESTOQUE_KG'
      Precision = 18
      Size = 2
    end
    object FORNECIMENTOREALIZADO_ESTOQUE_SACO: TFMTBCDField
      FieldName = 'REALIZADO_ESTOQUE_SACO'
      Origin = 'REALIZADO_ESTOQUE_SACO'
      Precision = 18
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
    object FORNECIMENTOVALOR_KG: TFMTBCDField
      FieldName = 'VALOR_KG'
      Origin = 'VALOR_KG'
      Precision = 18
      Size = 2
    end
    object FORNECIMENTOESTOQUE_ORIGEM: TIntegerField
      FieldName = 'ESTOQUE_ORIGEM'
      Origin = 'ESTOQUE_ORIGEM'
    end
  end
  object HIST_LEITURA_COCHO: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT c.id,a.*,c.id_propriedade FROM HIST_LEITURA_COCHO(9001) a'
      'JOIN CURRAIS c ON C.ID=ID_CURRAL')
    Left = 464
    Top = 240
    object HIST_LEITURA_COCHOID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Origin = 'ID_LOTE'
    end
    object HIST_LEITURA_COCHOID_CURRAL: TIntegerField
      FieldName = 'ID_CURRAL'
      Origin = 'ID_CURRAL'
    end
    object HIST_LEITURA_COCHODATA_LEITURA: TDateField
      FieldName = 'DATA_LEITURA'
      Origin = 'DATA_LEITURA'
    end
    object HIST_LEITURA_COCHONOTA: TFMTBCDField
      FieldName = 'NOTA'
      Origin = 'NOTA'
      Precision = 18
      Size = 3
    end
    object HIST_LEITURA_COCHOAJUSTE: TFMTBCDField
      FieldName = 'AJUSTE'
      Origin = 'AJUSTE'
      Precision = 18
      Size = 3
    end
    object HIST_LEITURA_COCHOID_PROPRIEDADE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_PROPRIEDADE'
      Origin = 'ID_PROPRIEDADE'
      ProviderFlags = []
      ReadOnly = True
    end
    object HIST_LEITURA_COCHOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
  end
  object LEITURA_COCHO: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT * FROM LEITURA_COCHO'
      'where status=1')
    Left = 464
    Top = 160
    object LEITURA_COCHOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    object LEITURA_COCHONOTA: TFMTBCDField
      FieldName = 'NOTA'
      Origin = 'NOTA'
      Precision = 18
      Size = 2
    end
    object LEITURA_COCHOAJUSTE: TFMTBCDField
      FieldName = 'AJUSTE'
      Origin = 'AJUSTE'
      Precision = 18
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
  end
  object LOTE_NUTRICIONAL: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT * FROM LOTE_NUTRICIONAL'
      'where status=1')
    Left = 464
    Top = 104
  end
  object AUX_NOTAS_LEITURA: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'select * from AUX_NOTAS_LEITURA')
    Left = 616
    Top = 224
    object AUX_NOTAS_LEITURAID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object AUX_NOTAS_LEITURANOTA: TFMTBCDField
      FieldName = 'NOTA'
      Origin = 'NOTA'
      Required = True
      Precision = 18
      Size = 2
    end
    object AUX_NOTAS_LEITURAAJUSTE: TFMTBCDField
      FieldName = 'AJUSTE'
      Origin = 'AJUSTE'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object HIST_CONSUMO: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT * FROM HIST_CONSUMO_LOTE(90001)')
    Left = 608
    Top = 280
    object HIST_CONSUMOID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Origin = 'ID_LOTE'
    end
    object HIST_CONSUMODATA_CONSUMO: TDateField
      FieldName = 'DATA_CONSUMO'
      Origin = 'DATA_CONSUMO'
    end
    object HIST_CONSUMOMN: TFMTBCDField
      FieldName = 'MN'
      Origin = 'MN'
      Precision = 18
      Size = 3
    end
    object HIST_CONSUMOMS: TFMTBCDField
      FieldName = 'MS'
      Origin = 'MS'
      Precision = 18
      Size = 3
    end
    object HIST_CONSUMOID_CURRAL: TIntegerField
      FieldName = 'ID_CURRAL'
      Origin = 'ID_CURRAL'
    end
    object HIST_CONSUMOIMSPV: TFMTBCDField
      FieldName = 'IMSPV'
      Origin = 'IMSPV'
      Precision = 18
      Size = 3
    end
  end
  object RACAO: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT * FROM RACAO'
      'WHERE STATUS=1')
    Left = 736
    Top = 40
    object RACAOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object RACAOTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
    object RACAONOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object RACAOGMD: TFMTBCDField
      FieldName = 'GMD'
      Origin = 'GMD'
      Precision = 18
      Size = 3
    end
    object RACAOMATERIASECA: TFMTBCDField
      FieldName = 'MATERIASECA'
      Origin = 'MATERIASECA'
      Precision = 18
      Size = 3
    end
    object RACAOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object RACAODATAREGISTRO: TSQLTimeStampField
      FieldName = 'DATAREGISTRO'
      Origin = 'DATAREGISTRO'
      Required = True
    end
    object RACAOIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      Origin = 'IDUSUARIO'
      Required = True
    end
    object RACAODATAALTERACAO: TSQLTimeStampField
      FieldName = 'DATAALTERACAO'
      Origin = 'DATAALTERACAO'
    end
    object RACAOIDUSUARIOALTERACAO: TIntegerField
      FieldName = 'IDUSUARIOALTERACAO'
      Origin = 'IDUSUARIOALTERACAO'
    end
    object RACAOVALORKG: TFMTBCDField
      FieldName = 'VALORKG'
      Origin = 'VALORKG'
      Precision = 18
      Size = 3
    end
    object RACAODATAFORMULACAO: TDateField
      FieldName = 'DATAFORMULACAO'
      Origin = 'DATAFORMULACAO'
      Required = True
    end
    object RACAOID_PROPRIEDADE: TIntegerField
      FieldName = 'ID_PROPRIEDADE'
      Origin = 'ID_PROPRIEDADE'
      Required = True
    end
    object RACAOIMS_PV: TFMTBCDField
      FieldName = 'IMS_PV'
      Origin = 'IMS_PV'
      Precision = 18
      Size = 3
    end
    object RACAOTEMPO_MISTURA: TIntegerField
      FieldName = 'TEMPO_MISTURA'
      Origin = 'TEMPO_MISTURA'
    end
  end
  object RACAOINSUMOS: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT * FROM RACAOINSUMOS'
      
        'WHERE STATUS=1 AND IDRACAO IN(SELECT ID FROM RACAO WHERE STATUS=' +
        '1)')
    Left = 736
    Top = 104
    object RACAOINSUMOSID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object RACAOINSUMOSIDRACAO: TIntegerField
      FieldName = 'IDRACAO'
      Origin = 'IDRACAO'
      Required = True
    end
    object RACAOINSUMOSIDINSUMOALIMENTO: TIntegerField
      FieldName = 'IDINSUMOALIMENTO'
      Origin = 'IDINSUMOALIMENTO'
      Required = True
    end
    object RACAOINSUMOSPERCENTMATERIASECA: TFMTBCDField
      FieldName = 'PERCENTMATERIASECA'
      Origin = 'PERCENTMATERIASECA'
      Required = True
      Precision = 18
      Size = 3
    end
    object RACAOINSUMOSKGMATERIASECA: TFMTBCDField
      FieldName = 'KGMATERIASECA'
      Origin = 'KGMATERIASECA'
      Required = True
      Precision = 18
      Size = 3
    end
    object RACAOINSUMOSINCLUSAOMATERIASECA: TFMTBCDField
      FieldName = 'INCLUSAOMATERIASECA'
      Origin = 'INCLUSAOMATERIASECA'
      Precision = 18
      Size = 3
    end
    object RACAOINSUMOSINCLUSAOMATERIANATURAL: TFMTBCDField
      FieldName = 'INCLUSAOMATERIANATURAL'
      Origin = 'INCLUSAOMATERIANATURAL'
      Precision = 18
      Size = 3
    end
    object RACAOINSUMOSVALORKG: TFMTBCDField
      FieldName = 'VALORKG'
      Origin = 'VALORKG'
      Required = True
      Precision = 18
      Size = 3
    end
    object RACAOINSUMOSVALORINCLUSAO: TFMTBCDField
      FieldName = 'VALORINCLUSAO'
      Origin = 'VALORINCLUSAO'
      Precision = 18
      Size = 3
    end
    object RACAOINSUMOSSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object RACAOINSUMOSDATAREGISTRO: TSQLTimeStampField
      FieldName = 'DATAREGISTRO'
      Origin = 'DATAREGISTRO'
      Required = True
    end
    object RACAOINSUMOSIDUSUARIO: TIntegerField
      FieldName = 'IDUSUARIO'
      Origin = 'IDUSUARIO'
      Required = True
    end
    object RACAOINSUMOSDATAALTERACAO: TSQLTimeStampField
      FieldName = 'DATAALTERACAO'
      Origin = 'DATAALTERACAO'
    end
    object RACAOINSUMOSIDUSUARIOALTERACAO: TIntegerField
      FieldName = 'IDUSUARIOALTERACAO'
      Origin = 'IDUSUARIOALTERACAO'
    end
    object RACAOINSUMOSKGMATERIANATURAL: TFMTBCDField
      FieldName = 'KGMATERIANATURAL'
      Origin = 'KGMATERIANATURAL'
      Precision = 18
      Size = 3
    end
    object RACAOINSUMOSORDEM_FABRICACAO: TIntegerField
      FieldName = 'ORDEM_FABRICACAO'
      Origin = 'ORDEM_FABRICACAO'
    end
    object RACAOINSUMOSID_PREMISTURA: TIntegerField
      FieldName = 'ID_PREMISTURA'
      Origin = 'ID_PREMISTURA'
    end
    object RACAOINSUMOSTOLERANCIA_FAB: TFMTBCDField
      FieldName = 'TOLERANCIA_FAB'
      Origin = 'TOLERANCIA_FAB'
      Precision = 18
      Size = 3
    end
  end
  object FABRICACAO: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT * FROM FABRICACAO')
    Left = 744
    Top = 176
    object FABRICACAOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
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
  end
  object FABRICACAO_INSUMOS: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT * FROM FABRICACAO_INSUMOS')
    Left = 744
    Top = 248
    object FABRICACAO_INSUMOSID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FABRICACAO_INSUMOSID_FABRICACAO: TIntegerField
      FieldName = 'ID_FABRICACAO'
      Origin = 'ID_FABRICACAO'
    end
    object FABRICACAO_INSUMOSID_ALIMENTO: TIntegerField
      FieldName = 'ID_ALIMENTO'
      Origin = 'ID_ALIMENTO'
    end
    object FABRICACAO_INSUMOSID_CONCENTRADO: TIntegerField
      FieldName = 'ID_CONCENTRADO'
      Origin = 'ID_CONCENTRADO'
    end
    object FABRICACAO_INSUMOSDATA_FAB: TDateField
      FieldName = 'DATA_FAB'
      Origin = 'DATA_FAB'
    end
    object FABRICACAO_INSUMOSHORA_INI: TTimeField
      FieldName = 'HORA_INI'
      Origin = 'HORA_INI'
    end
    object FABRICACAO_INSUMOSHORA_FIM: TTimeField
      FieldName = 'HORA_FIM'
      Origin = 'HORA_FIM'
    end
    object FABRICACAO_INSUMOSMS_INSUMO: TFMTBCDField
      FieldName = 'MS_INSUMO'
      Origin = 'MS_INSUMO'
      Precision = 18
      Size = 3
    end
    object FABRICACAO_INSUMOSKG_PREVISTO: TBCDField
      FieldName = 'KG_PREVISTO'
      Origin = 'KG_PREVISTO'
      Precision = 18
    end
    object FABRICACAO_INSUMOSKG_FABRICADO: TBCDField
      FieldName = 'KG_FABRICADO'
      Origin = 'KG_FABRICADO'
      Precision = 18
    end
    object FABRICACAO_INSUMOSDATAREG: TDateField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
    end
    object FABRICACAO_INSUMOSID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object FABRICACAO_INSUMOSID_USUARIO_ALTERACAO: TIntegerField
      FieldName = 'ID_USUARIO_ALTERACAO'
      Origin = 'ID_USUARIO_ALTERACAO'
    end
    object FABRICACAO_INSUMOSDATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
      Origin = 'DATA_ALTERACAO'
    end
    object FABRICACAO_INSUMOSSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object FABRICACAO_INSUMOSVALOR_KG: TFMTBCDField
      FieldName = 'VALOR_KG'
      Origin = 'VALOR_KG'
      Precision = 18
      Size = 3
    end
    object FABRICACAO_INSUMOSCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Origin = 'CUSTO'
      Precision = 18
      Size = 7
    end
  end
  object FORNECIMENTO_CONF: TFDQuery
    CachedUpdates = True
    OnReconcileError = FORNECIMENTO_CONFReconcileError
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT * FROM FORNECIMENTO_CONF')
    Left = 840
    Top = 48
    object FORNECIMENTO_CONFID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
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
    object FORNECIMENTO_CONFMEDIA_PESO: TFMTBCDField
      FieldName = 'MEDIA_PESO'
      Origin = 'MEDIA_PESO'
      Precision = 18
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
    object FORNECIMENTO_CONFMS_RACAO: TFMTBCDField
      FieldName = 'MS_RACAO'
      Origin = 'MS_RACAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object FORNECIMENTO_CONFVALOR_KG_RACAO: TFMTBCDField
      FieldName = 'VALOR_KG_RACAO'
      Origin = 'VALOR_KG_RACAO'
      Required = True
      Precision = 18
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
    object FORNECIMENTO_CONFCUSTO_TOTAL_TRATO: TFMTBCDField
      FieldName = 'CUSTO_TOTAL_TRATO'
      Origin = 'CUSTO_TOTAL_TRATO'
      Required = True
      Precision = 18
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
  end
  object FORNECIMENTO_PREVISTO: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT '
      ' *'
      'FROM FORNECIMENTO_CONF f '
      
        'WHERE DATA_FORN=(SELECT MAX(DATA_FORN) FROM FORNECIMENTO_CONF fc' +
        ') '
      'AND STATUS >-1')
    Left = 840
    Top = 128
    object FORNECIMENTO_PREVISTOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FORNECIMENTO_PREVISTOID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Origin = 'ID_LOTE'
      Required = True
    end
    object FORNECIMENTO_PREVISTOID_LOCAL: TIntegerField
      FieldName = 'ID_LOCAL'
      Origin = 'ID_LOCAL'
      Required = True
    end
    object FORNECIMENTO_PREVISTOQTD_CAB: TIntegerField
      FieldName = 'QTD_CAB'
      Origin = 'QTD_CAB'
      Required = True
    end
    object FORNECIMENTO_PREVISTOMEDIA_PESO: TFMTBCDField
      FieldName = 'MEDIA_PESO'
      Origin = 'MEDIA_PESO'
      Precision = 18
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
      Required = True
    end
    object FORNECIMENTO_PREVISTOID_RACAO: TIntegerField
      FieldName = 'ID_RACAO'
      Origin = 'ID_RACAO'
      Required = True
    end
    object FORNECIMENTO_PREVISTOMS_RACAO: TFMTBCDField
      FieldName = 'MS_RACAO'
      Origin = 'MS_RACAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object FORNECIMENTO_PREVISTOVALOR_KG_RACAO: TFMTBCDField
      FieldName = 'VALOR_KG_RACAO'
      Origin = 'VALOR_KG_RACAO'
      Required = True
      Precision = 18
      Size = 2
    end
    object FORNECIMENTO_PREVISTOPREVISTO_MN_KG: TIntegerField
      FieldName = 'PREVISTO_MN_KG'
      Origin = 'PREVISTO_MN_KG'
      Required = True
    end
    object FORNECIMENTO_PREVISTOREALIZADO_MN_KG: TIntegerField
      FieldName = 'REALIZADO_MN_KG'
      Origin = 'REALIZADO_MN_KG'
    end
    object FORNECIMENTO_PREVISTOCUSTO_TOTAL_TRATO: TFMTBCDField
      FieldName = 'CUSTO_TOTAL_TRATO'
      Origin = 'CUSTO_TOTAL_TRATO'
      Required = True
      Precision = 18
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
      Required = True
    end
    object FORNECIMENTO_PREVISTOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
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
  end
  object qryAux: TFDQuery
    OnReconcileError = qryAuxReconcileError
    Connection = frmPrincipal.FCon
    Left = 832
    Top = 312
  end
  object HIST_SANIDADE: TFDQuery
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT  '
      #39'INSERT INTO HIST_SANIDADE'#39'||'
      
        #39'(ID_ANIMAL, ID_PROPRIEDADE, DATA_APLICACAO, PRODUTO, DOSE_ML, C' +
        'ARENCIA_DIAS, CARENCIA_DATA) VALUES('#39'||'
      ' a.ID_ANIMAL||'#39','#39'||'
      ' a.ID_PROPRIEDAE ||'#39','#39'||'
      ' '#39#39#39#39'||CAST(DATA_APLICACAO AS DATE)||'#39#39#39#39'||'#39','#39'||'
      ' '#39#39#39#39'||b.NOME ||'#39#39#39#39'||'#39','#39'||'
      ' a.DOSE_ML||'#39','#39'||'
      ' a.CARENCIA_DIAS||'#39','#39'||'
      ' '#39#39#39#39'||CARENCIA_DATA ||'#39#39#39#39'||'#39');'#39' as InsertInto,'
      'c.ID_PROPRIEDADE'
      'from animal_sanidade a'
      'join animal c on a.id_animal=c.id'
      'join farmaco b on a.id_farmaco=b.id'
      'where c.status=1 ')
    Left = 376
    Top = 360
    object HIST_SANIDADEINSERTINTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INSERTINTO'
      Origin = 'INSERTINTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 312
    end
  end
  object FComSQLite: TFDConnection
    Params.Strings = (
      'Database=E:\Projetos2021\Field\FieldTrato\wsField\db\WS.db'
      'LockingMode=Normal'
      'OpenMode=ReadWrite'
      'DriverID=SQLite')
    LoginPrompt = False
    BeforeConnect = FComSQLiteBeforeConnect
    Left = 72
    Top = 304
  end
  object Tablekey: TFDQuery
    CachedUpdates = True
    Connection = FComSQLite
    SQL.Strings = (
      'SELECT * FROM KEYFIELD')
    Left = 115
    Top = 376
    object TablekeyKEY: TStringField
      FieldName = 'KEY'
      Origin = '"KEY"'
      Size = 30
    end
    object TablekeyDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
    end
    object TablekeyID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TablekeySTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
  end
  object FARMACO: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT * FROM FARMACO'
      'WHERE STATUS=1')
    Left = 472
    Top = 368
    object FARMACOID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FARMACONOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object FARMACOPRINCIPIO_ATIVO: TStringField
      FieldName = 'PRINCIPIO_ATIVO'
      Origin = 'PRINCIPIO_ATIVO'
      Size = 100
    end
    object FARMACOID_FABRICANTE: TIntegerField
      FieldName = 'ID_FABRICANTE'
      Origin = 'ID_FABRICANTE'
      Required = True
    end
    object FARMACOTIPO_APICACAO: TIntegerField
      FieldName = 'TIPO_APICACAO'
      Origin = 'TIPO_APICACAO'
      Required = True
    end
    object FARMACOML_DOSE_FIXA: TFMTBCDField
      FieldName = 'ML_DOSE_FIXA'
      Origin = 'ML_DOSE_FIXA'
      Precision = 18
      Size = 2
    end
    object FARMACOML_DOSE_PV: TFMTBCDField
      FieldName = 'ML_DOSE_PV'
      Origin = 'ML_DOSE_PV'
      Precision = 18
      Size = 2
    end
    object FARMACOKG_DOSE_PV: TFMTBCDField
      FieldName = 'KG_DOSE_PV'
      Origin = 'KG_DOSE_PV'
      Precision = 18
      Size = 2
    end
    object FARMACODATA_REG: TSQLTimeStampField
      FieldName = 'DATA_REG'
      Origin = 'DATA_REG'
    end
    object FARMACOID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object FARMACOSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object FARMACOID_INDICACAO: TIntegerField
      FieldName = 'ID_INDICACAO'
      Origin = 'ID_INDICACAO'
    end
    object FARMACOCARENCIA_DIA: TIntegerField
      FieldName = 'CARENCIA_DIA'
      Origin = 'CARENCIA_DIA'
      Required = True
    end
    object FARMACOVALOR_ML: TFloatField
      FieldName = 'VALOR_ML'
      Origin = 'VALOR_ML'
    end
  end
  object PROTOCOLO_SANITARIO: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT * FROM PROTOCOLO_SANITARIO'
      'WHERE STATUS=1')
    Left = 584
    Top = 368
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
    object PROTOCOLO_SANITARIODATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
      Required = True
    end
    object PROTOCOLO_SANITARIOID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
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
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT * FROM PROTOCOLO_FARMACOS'
      'WHERE STATUS=1')
    Left = 744
    Top = 368
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
    object PROTOCOLO_FARMACOSID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
      Required = True
    end
    object PROTOCOLO_FARMACOSDOSE_FIXA_ML: TFMTBCDField
      FieldName = 'DOSE_FIXA_ML'
      Origin = 'DOSE_FIXA_ML'
      Precision = 18
      Size = 2
    end
    object PROTOCOLO_FARMACOSDOSE_PESO_ML: TFMTBCDField
      FieldName = 'DOSE_PESO_ML'
      Origin = 'DOSE_PESO_ML'
      Precision = 18
      Size = 2
    end
    object PROTOCOLO_FARMACOSDOSE_PESO_KG: TFMTBCDField
      FieldName = 'DOSE_PESO_KG'
      Origin = 'DOSE_PESO_KG'
      Precision = 18
      Size = 2
    end
    object PROTOCOLO_FARMACOSSTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
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
  object ANIMAL_SANIDADE: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FCon
    SQL.Strings = (
      'SELECT * FROM ANIMAL_SANIDADE'
      'WHERE STATUS=-51')
    Left = 256
    Top = 368
    object ANIMAL_SANIDADEID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ANIMAL_SANIDADEID_ANIMAL: TIntegerField
      FieldName = 'ID_ANIMAL'
      Origin = 'ID_ANIMAL'
    end
    object ANIMAL_SANIDADEID_FARMACO: TIntegerField
      FieldName = 'ID_FARMACO'
      Origin = 'ID_FARMACO'
    end
    object ANIMAL_SANIDADEID_PROTOCOLO: TIntegerField
      FieldName = 'ID_PROTOCOLO'
      Origin = 'ID_PROTOCOLO'
    end
    object ANIMAL_SANIDADEDOSE_ML: TFMTBCDField
      FieldName = 'DOSE_ML'
      Origin = 'DOSE_ML'
      Precision = 18
      Size = 2
    end
    object ANIMAL_SANIDADEID_PROPRIEDAE: TIntegerField
      FieldName = 'ID_PROPRIEDAE'
      Origin = 'ID_PROPRIEDAE'
    end
    object ANIMAL_SANIDADEID_LOCAL_ATUAL: TIntegerField
      FieldName = 'ID_LOCAL_ATUAL'
      Origin = 'ID_LOCAL_ATUAL'
    end
    object ANIMAL_SANIDADEDATA_APLICACAO: TDateField
      FieldName = 'DATA_APLICACAO'
      Origin = 'DATA_APLICACAO'
    end
    object ANIMAL_SANIDADETIPO_APLICACAO: TIntegerField
      FieldName = 'TIPO_APLICACAO'
      Origin = 'TIPO_APLICACAO'
    end
    object ANIMAL_SANIDADEID_RESPONSAVEL_APLICACAO: TIntegerField
      FieldName = 'ID_RESPONSAVEL_APLICACAO'
      Origin = 'ID_RESPONSAVEL_APLICACAO'
    end
    object ANIMAL_SANIDADEID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Origin = 'ID_USUARIO'
    end
    object ANIMAL_SANIDADEDATAREG: TSQLTimeStampField
      FieldName = 'DATAREG'
      Origin = 'DATAREG'
    end
    object ANIMAL_SANIDADESTATUS: TIntegerField
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object ANIMAL_SANIDADETIPO_TRATAMENTO: TIntegerField
      FieldName = 'TIPO_TRATAMENTO'
      Origin = 'TIPO_TRATAMENTO'
    end
    object ANIMAL_SANIDADEID_RESPONSAVEL_APLI_DIREITO: TIntegerField
      FieldName = 'ID_RESPONSAVEL_APLI_DIREITO'
      Origin = 'ID_RESPONSAVEL_APLI_DIREITO'
    end
    object ANIMAL_SANIDADECARENCIA_DIAS: TIntegerField
      FieldName = 'CARENCIA_DIAS'
      Origin = 'CARENCIA_DIAS'
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
  end
end
