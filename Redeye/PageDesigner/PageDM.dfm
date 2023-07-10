object dmPage: TdmPage
  OldCreateOrder = False
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object qryPage: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT * FROM tb_PageLayout'
      'WHERE f_PageLayoutName = :Name')
    Left = 40
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptInput
      end>
    object qryPagef_PageLayoutName: TStringField
      FieldName = 'f_PageLayoutName'
      Origin = 'PAGEDB.tb_PageLayout.f_PageLayoutName'
      FixedChar = True
      Size = 50
    end
    object qryPagef_TopMargin: TFloatField
      FieldName = 'f_TopMargin'
      Origin = 'PAGEDB.tb_PageLayout.f_TopMargin'
    end
    object qryPagef_LeftMargin: TFloatField
      FieldName = 'f_LeftMargin'
      Origin = 'PAGEDB.tb_PageLayout.f_LeftMargin'
    end
    object qryPagef_BottomMargin: TFloatField
      FieldName = 'f_BottomMargin'
      Origin = 'PAGEDB.tb_PageLayout.f_BottomMargin'
    end
    object qryPagef_RightMargin: TFloatField
      FieldName = 'f_RightMargin'
      Origin = 'PAGEDB.tb_PageLayout.f_RightMargin'
    end
    object qryPagef_Preprinted: TStringField
      FieldName = 'f_Preprinted'
      Origin = 'PAGEDB.tb_PageLayout.f_Preprinted'
      FixedChar = True
      Size = 1
    end
    object qryPagef_PrintLogo: TStringField
      FieldName = 'f_PrintLogo'
      Origin = 'PAGEDB.tb_PageLayout.f_PrintLogo'
      FixedChar = True
      Size = 1
    end
    object qryPagef_PrintAddress: TStringField
      FieldName = 'f_PrintAddress'
      Origin = 'PAGEDB.tb_PageLayout.f_PrintAddress'
      FixedChar = True
      Size = 1
    end
    object qryPagef_LogoTop: TFloatField
      FieldName = 'f_LogoTop'
      Origin = 'PAGEDB.tb_PageLayout.f_LogoTop'
    end
    object qryPagef_LogoLeft: TFloatField
      FieldName = 'f_LogoLeft'
      Origin = 'PAGEDB.tb_PageLayout.f_LogoLeft'
    end
    object qryPagef_LogoWidth: TFloatField
      FieldName = 'f_LogoWidth'
      Origin = 'PAGEDB.tb_PageLayout.f_LogoWidth'
    end
    object qryPagef_LogoHeight: TFloatField
      FieldName = 'f_LogoHeight'
      Origin = 'PAGEDB.tb_PageLayout.f_LogoHeight'
    end
    object qryPagef_AddressTop: TFloatField
      FieldName = 'f_AddressTop'
      Origin = 'PAGEDB.tb_PageLayout.f_AddressTop'
    end
    object qryPagef_AddressLeft: TFloatField
      FieldName = 'f_AddressLeft'
      Origin = 'PAGEDB.tb_PageLayout.f_AddressLeft'
    end
    object qryPagef_AddressWidth: TFloatField
      FieldName = 'f_AddressWidth'
      Origin = 'PAGEDB.tb_PageLayout.f_AddressWidth'
    end
    object qryPagef_AddressHeight: TFloatField
      FieldName = 'f_AddressHeight'
      Origin = 'PAGEDB.tb_PageLayout.f_AddressHeight'
    end
    object qryPagef_PaperSize: TStringField
      FieldName = 'f_PaperSize'
      Origin = 'PAGEDB.tb_PageLayout.f_PaperSize'
      FixedChar = True
    end
    object qryPagef_Portrait: TStringField
      FieldName = 'f_Portrait'
      Origin = 'PAGEDB.tb_PageLayout.f_Portrait'
      FixedChar = True
      Size = 1
    end
    object qryPagef_Units: TStringField
      FieldName = 'f_Units'
      Origin = 'PAGEDB.tb_PageLayout.f_Units'
      FixedChar = True
    end
    object qryPagef_PPTop: TFloatField
      FieldName = 'f_PPTop'
      Origin = 'PAGEDB.tb_PageLayout.f_PPTop'
    end
    object qryPagef_PPLeft: TFloatField
      FieldName = 'f_PPLeft'
      Origin = 'PAGEDB.tb_PageLayout.f_PPLeft'
    end
    object qryPagef_PPWidth: TFloatField
      FieldName = 'f_PPWidth'
      Origin = 'PAGEDB.tb_PageLayout.f_PPWidth'
    end
    object qryPagef_PPHeight: TFloatField
      FieldName = 'f_PPHeight'
      Origin = 'PAGEDB.tb_PageLayout.f_PPHeight'
    end
    object qryPagef_LogoFile: TStringField
      FieldName = 'f_LogoFile'
      Origin = 'PAGEDB.tb_PageLayout.f_LogoFile'
      FixedChar = True
      Size = 255
    end
    object qryPagef_FaxDefault: TStringField
      FieldName = 'f_FaxDefault'
      Origin = 'PB.tb_PageLayout.f_FaxDefault'
      FixedChar = True
      Size = 1
    end
    object qryPagef_PrintDefault: TStringField
      FieldName = 'f_PrintDefault'
      Origin = 'PB.tb_PageLayout.f_PrintDefault'
      FixedChar = True
      Size = 1
    end
    object qryPagef_AddressFontName: TStringField
      FieldName = 'f_AddressFontName'
      Origin = 'PB.tb_PageLayout.f_AddressFontName'
      FixedChar = True
      Size = 50
    end
    object qryPagef_AddressFontSize: TIntegerField
      FieldName = 'f_AddressFontSize'
      Origin = 'PB.tb_PageLayout.f_AddressFontSize'
    end
    object qryPagef_AddressFontStyle: TIntegerField
      FieldName = 'f_AddressFontStyle'
      Origin = 'PB.tb_PageLayout.f_AddressFontStyle'
    end
    object qryPagef_AddressAlignment: TStringField
      FieldName = 'f_AddressAlignment'
      Origin = 'PB.tb_PageLayout.f_AddressAlignment'
      FixedChar = True
      Size = 1
    end
    object qryPagef_AddressPrintByLine: TStringField
      FieldName = 'f_AddressPrintByLine'
      Origin = 'PB.tb_PageLayout.f_AddressPrintByLine'
      FixedChar = True
      Size = 1
    end
    object qryPagef_PrintLogo1: TStringField
      FieldName = 'f_PrintLogo1'
      Origin = 'PB.tb_PageLayout.f_PrintLogo1'
      FixedChar = True
      Size = 1
    end
    object qryPagef_PrintLogo2: TStringField
      FieldName = 'f_PrintLogo2'
      Origin = 'PB.tb_PageLayout.f_PrintLogo2'
      FixedChar = True
      Size = 1
    end
    object qryPagef_PrintLogo3: TStringField
      FieldName = 'f_PrintLogo3'
      Origin = 'PB.tb_PageLayout.f_PrintLogo3'
      FixedChar = True
      Size = 1
    end
    object qryPagef_PrintRegAddress: TStringField
      FieldName = 'f_PrintRegAddress'
      Origin = 'PB.tb_PageLayout.f_PrintRegAddress'
      FixedChar = True
      Size = 1
    end
    object qryPagef_Logo1Top: TFloatField
      FieldName = 'f_Logo1Top'
      Origin = 'PB.tb_PageLayout.f_Logo1Top'
    end
    object qryPagef_Logo1Left: TFloatField
      FieldName = 'f_Logo1Left'
      Origin = 'PB.tb_PageLayout.f_Logo1Left'
    end
    object qryPagef_Logo1Width: TFloatField
      FieldName = 'f_Logo1Width'
      Origin = 'PB.tb_PageLayout.f_Logo1Width'
    end
    object qryPagef_Logo1Height: TFloatField
      FieldName = 'f_Logo1Height'
      Origin = 'PB.tb_PageLayout.f_Logo1Height'
    end
    object qryPagef_Logo2Top: TFloatField
      FieldName = 'f_Logo2Top'
      Origin = 'PB.tb_PageLayout.f_Logo2Top'
    end
    object qryPagef_Logo2Left: TFloatField
      FieldName = 'f_Logo2Left'
      Origin = 'PB.tb_PageLayout.f_Logo2Left'
    end
    object qryPagef_Logo2Width: TFloatField
      FieldName = 'f_Logo2Width'
      Origin = 'PB.tb_PageLayout.f_Logo2Width'
    end
    object qryPagef_Logo2Height: TFloatField
      FieldName = 'f_Logo2Height'
      Origin = 'PB.tb_PageLayout.f_Logo2Height'
    end
    object qryPagef_Logo3Top: TFloatField
      FieldName = 'f_Logo3Top'
      Origin = 'PB.tb_PageLayout.f_Logo3Top'
    end
    object qryPagef_Logo3Left: TFloatField
      FieldName = 'f_Logo3Left'
      Origin = 'PB.tb_PageLayout.f_Logo3Left'
    end
    object qryPagef_Logo3Width: TFloatField
      FieldName = 'f_Logo3Width'
      Origin = 'PB.tb_PageLayout.f_Logo3Width'
    end
    object qryPagef_Logo3Height: TFloatField
      FieldName = 'f_Logo3Height'
      Origin = 'PB.tb_PageLayout.f_Logo3Height'
    end
    object qryPagef_LogoFile1: TStringField
      FieldName = 'f_LogoFile1'
      Origin = 'PB.tb_PageLayout.f_LogoFile1'
      FixedChar = True
      Size = 255
    end
    object qryPagef_LogoFile2: TStringField
      FieldName = 'f_LogoFile2'
      Origin = 'PB.tb_PageLayout.f_LogoFile2'
      FixedChar = True
      Size = 255
    end
    object qryPagef_LogoFile3: TStringField
      FieldName = 'f_LogoFile3'
      Origin = 'PB.tb_PageLayout.f_LogoFile3'
      FixedChar = True
      Size = 255
    end
    object qryPagef_RegAddressTop: TFloatField
      FieldName = 'f_RegAddressTop'
      Origin = 'PB.tb_PageLayout.f_RegAddressTop'
    end
    object qryPagef_RegAddressLeft: TFloatField
      FieldName = 'f_RegAddressLeft'
      Origin = 'PB.tb_PageLayout.f_RegAddressLeft'
    end
    object qryPagef_RegAddressWidth: TFloatField
      FieldName = 'f_RegAddressWidth'
      Origin = 'PB.tb_PageLayout.f_RegAddressWidth'
    end
    object qryPagef_RegAddressHeight: TFloatField
      FieldName = 'f_RegAddressHeight'
      Origin = 'PB.tb_PageLayout.f_RegAddressHeight'
    end
    object qryPagef_RegAddressFontName: TStringField
      FieldName = 'f_RegAddressFontName'
      Origin = 'PB.tb_PageLayout.f_RegAddressFontName'
      FixedChar = True
      Size = 50
    end
    object qryPagef_RegAddressFontSize: TIntegerField
      FieldName = 'f_RegAddressFontSize'
      Origin = 'PB.tb_PageLayout.f_RegAddressFontSize'
    end
    object qryPagef_RegAddressFontStyle: TIntegerField
      FieldName = 'f_RegAddressFontStyle'
      Origin = 'PB.tb_PageLayout.f_RegAddressFontStyle'
    end
    object qryPagef_RegAddressAlignment: TStringField
      FieldName = 'f_RegAddressAlignment'
      Origin = 'PB.tb_PageLayout.f_RegAddressAlignment'
      FixedChar = True
      Size = 1
    end
    object qryPagef_RegAddressPrintByLine: TStringField
      FieldName = 'f_RegAddressPrintByLine'
      Origin = 'PB.tb_PageLayout.f_RegAddressPrintByLine'
      FixedChar = True
      Size = 1
    end
  end
  object dsPage: TDataSource
    AutoEdit = False
    DataSet = qryPage
    Left = 128
    Top = 64
  end
  object qryPageLookup: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT f_PageLayoutName as Name FROM tb_PageLayout')
    Left = 40
    Top = 120
  end
  object dsPageLookup: TDataSource
    AutoEdit = False
    DataSet = qryPageLookup
    Left = 128
    Top = 120
  end
  object qryLetterLookup: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT f_LetterName as Name FROM tb_LetterLayout '
      'WHERE f_LetterType = :Type')
    Left = 40
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Type'
        ParamType = ptInput
      end>
  end
  object dsLetterLookup: TDataSource
    AutoEdit = False
    DataSet = qryLetterLookup
    Left = 128
    Top = 8
  end
  object qryDelete: TQuery
    DatabaseName = 'PB'
    Left = 40
    Top = 184
  end
  object qryDefaults: TQuery
    DatabaseName = 'PB'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM tb_LetterLayout'
      'WHERE f_LetterName = :Name')
    Left = 120
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptInput
      end>
  end
end
