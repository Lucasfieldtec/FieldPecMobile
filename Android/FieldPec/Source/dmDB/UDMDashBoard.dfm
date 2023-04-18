object dmDash: TdmDash
  OldCreateOrder = False
  Height = 463
  Width = 620
  object qryAux: TFDQuery
    Connection = dmdb.FCon
    Left = 48
    Top = 24
  end
  object AnimalCategoria: TFDQuery
    Connection = dmdb.FCon
    Left = 56
    Top = 96
  end
  object AnimalRaca: TFDQuery
    Connection = dmdb.FCon
    Left = 56
    Top = 168
  end
  object AnimalRebanho: TFDQuery
    Connection = dmdb.FCon
    Left = 56
    Top = 216
  end
  object qtdCabLocal: TFDQuery
    Connection = dmdb.FCon
    Left = 56
    Top = 288
  end
  object CurraisCombo: TFDQuery
    Connection = dmdb.FCon
    SQL.Strings = (
      
        'SELECT C.ID ID_CURRAL,C.CODIGO,COUNT(*) QTD_CAB,AVG(PESO_ENTRADA' +
        ') MEDIA_PESO,'
      'AVG(TRUNC(CURRENT_TIMESTAMP-A.DATA_PROC)) Dias  '
      'FROM ANIMAL A'
      'JOIN CURRAIS c ON c.ID=A.ID_LOCAL'
      'GROUP BY C.ID,C.CODIGO')
    Left = 224
    Top = 32
  end
  object HIST_CONSUMO_MN: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from HIST_CONSUMO')
    Left = 220
    Top = 88
  end
  object HIST_CONSUMO_MS: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from HIST_CONSUMO')
    Left = 220
    Top = 144
  end
  object HIST_CONSUMO_IMSPV: TFDQuery
    CachedUpdates = True
    Connection = dmdb.FCon
    SQL.Strings = (
      'select * from HIST_CONSUMO')
    Left = 220
    Top = 216
  end
  object FornePrevisto: TFDQuery
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT '
      ' B.NOME "Label",'
      ' SUM(COALESCE(A.PREVISTO_MN_KG,0)) "Value"'
      'FROM FORNECIMENTO_CONF A'
      'JOIN RACAO B ON A.ID_RACAO=B.ID'
      
        'WHERE DATA_FORN=(select max(data_forn) from fornecimento_conf wh' +
        'ere status=1)'
      'GROUP BY B.NOME')
    Left = 368
    Top = 24
  end
  object ForneRealizado: TFDQuery
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT '
      ' B.NOME "Label",'
      ' SUM(COALESCE(A.REALIZADO_MN_KG,0)) "Value"'
      'FROM FORNECIMENTO_CONF A'
      'JOIN RACAO B ON A.ID_RACAO=B.ID'
      
        'WHERE DATA_FORN=(select max(data_forn) from fornecimento_conf wh' +
        'ere status=1)'
      'GROUP BY B.NOME')
    Left = 376
    Top = 80
  end
  object FabricadoXForne: TFDQuery
    Connection = dmdb.FCon
    SQL.Strings = (
      
        'select b.nome "Label",sum(kg_realizado) "Value" from fabricacao ' +
        'a'
      'join racao b on idracao=b.id'
      
        'where a.data_fab=(select max(data_forn) from fornecimento_conf w' +
        'here status=1)'
      'GROUP BY B.NOME')
    Left = 368
    Top = 160
  end
  object ForneRealizadoGeral: TFDQuery
    Connection = dmdb.FCon
    SQL.Strings = (
      'SELECT '
      ' B.NOME "Label",'
      ' SUM(COALESCE(A.REALIZADO_MN_KG,0)) "Value"'
      'FROM FORNECIMENTO_CONF A'
      'JOIN RACAO B ON A.ID_RACAO=B.ID'
      
        'WHERE DATA_FORN=(select max(data_forn) from fornecimento_conf wh' +
        'ere status=1)'
      'GROUP BY B.NOME')
    Left = 376
    Top = 224
  end
end
