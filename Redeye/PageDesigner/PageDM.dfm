object dmPage: TdmPage
  OldCreateOrder = False
  Left = 285
  Top = 161
  Height = 479
  Width = 741
  object qryPage: TFDQuery
    ConnectionName = 'PB'
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
    object qryPagef_PageLayoutName: TWideStringField
      FieldName = 'f_PageLayoutName'

      FixedChar = True
      Size = 50
    end
    object qryPagef_TopMargin: TFloatField
      FieldName = 'f_TopMargin'

    end
    object qryPagef_LeftMargin: TFloatField
      FieldName = 'f_LeftMargin'

    end
    object qryPagef_BottomMargin: TFloatField
      FieldName = 'f_BottomMargin'

    end
    object qryPagef_RightMargin: TFloatField
      FieldName = 'f_RightMargin'

    end
    object qryPagef_Preprinted: TWideStringField
      FieldName = 'f_Preprinted'

      FixedChar = True
      Size = 1
    end
    object qryPagef_PrintLogo: TWideStringField
      FieldName = 'f_PrintLogo'

      FixedChar = True
      Size = 1
    end
    object qryPagef_PrintAddress: TWideStringField
      FieldName = 'f_PrintAddress'

      FixedChar = True
      Size = 1
    end
    object qryPagef_LogoTop: TFloatField
      FieldName = 'f_LogoTop'

    end
    object qryPagef_LogoLeft: TFloatField
      FieldName = 'f_LogoLeft'

    end
    object qryPagef_LogoWidth: TFloatField
      FieldName = 'f_LogoWidth'

    end
    object qryPagef_LogoHeight: TFloatField
      FieldName = 'f_LogoHeight'

    end
    object qryPagef_AddressTop: TFloatField
      FieldName = 'f_AddressTop'

    end
    object qryPagef_AddressLeft: TFloatField
      FieldName = 'f_AddressLeft'

    end
    object qryPagef_AddressWidth: TFloatField
      FieldName = 'f_AddressWidth'

    end
    object qryPagef_AddressHeight: TFloatField
      FieldName = 'f_AddressHeight'

    end
    object qryPagef_PaperSize: TWideStringField
      FieldName = 'f_PaperSize'

      FixedChar = True
    end
    object qryPagef_Portrait: TWideStringField
      FieldName = 'f_Portrait'

      FixedChar = True
      Size = 1
    end
    object qryPagef_Units: TWideStringField
      FieldName = 'f_Units'

      FixedChar = True
    end
    object qryPagef_PPTop: TFloatField
      FieldName = 'f_PPTop'

    end
    object qryPagef_PPLeft: TFloatField
      FieldName = 'f_PPLeft'

    end
    object qryPagef_PPWidth: TFloatField
      FieldName = 'f_PPWidth'

    end
    object qryPagef_PPHeight: TFloatField
      FieldName = 'f_PPHeight'

    end
    object qryPagef_LogoFile: TWideStringField
      FieldName = 'f_LogoFile'

      FixedChar = True
      Size = 255
    end
    object qryPagef_FaxDefault: TWideStringField
      FieldName = 'f_FaxDefault'

      FixedChar = True
      Size = 1
    end
    object qryPagef_PrintDefault: TWideStringField
      FieldName = 'f_PrintDefault'

      FixedChar = True
      Size = 1
    end
    object qryPagef_AddressFontName: TWideStringField
      FieldName = 'f_AddressFontName'

      FixedChar = True
      Size = 50
    end
    object qryPagef_AddressFontSize: TIntegerField
      FieldName = 'f_AddressFontSize'

    end
    object qryPagef_AddressFontStyle: TIntegerField
      FieldName = 'f_AddressFontStyle'

    end
    object qryPagef_AddressAlignment: TWideStringField
      FieldName = 'f_AddressAlignment'

      FixedChar = True
      Size = 1
    end
    object qryPagef_AddressPrintByLine: TWideStringField
      FieldName = 'f_AddressPrintByLine'

      FixedChar = True
      Size = 1
    end
    object qryPagef_PrintLogo1: TWideStringField
      FieldName = 'f_PrintLogo1'

      FixedChar = True
      Size = 1
    end
    object qryPagef_PrintLogo2: TWideStringField
      FieldName = 'f_PrintLogo2'

      FixedChar = True
      Size = 1
    end
    object qryPagef_PrintLogo3: TWideStringField
      FieldName = 'f_PrintLogo3'

      FixedChar = True
      Size = 1
    end
    object qryPagef_PrintRegAddress: TWideStringField
      FieldName = 'f_PrintRegAddress'

      FixedChar = True
      Size = 1
    end
    object qryPagef_Logo1Top: TFloatField
      FieldName = 'f_Logo1Top'

    end
    object qryPagef_Logo1Left: TFloatField
      FieldName = 'f_Logo1Left'

    end
    object qryPagef_Logo1Width: TFloatField
      FieldName = 'f_Logo1Width'

    end
    object qryPagef_Logo1Height: TFloatField
      FieldName = 'f_Logo1Height'

    end
    object qryPagef_Logo2Top: TFloatField
      FieldName = 'f_Logo2Top'

    end
    object qryPagef_Logo2Left: TFloatField
      FieldName = 'f_Logo2Left'

    end
    object qryPagef_Logo2Width: TFloatField
      FieldName = 'f_Logo2Width'

    end
    object qryPagef_Logo2Height: TFloatField
      FieldName = 'f_Logo2Height'

    end
    object qryPagef_Logo3Top: TFloatField
      FieldName = 'f_Logo3Top'

    end
    object qryPagef_Logo3Left: TFloatField
      FieldName = 'f_Logo3Left'

    end
    object qryPagef_Logo3Width: TFloatField
      FieldName = 'f_Logo3Width'

    end
    object qryPagef_Logo3Height: TFloatField
      FieldName = 'f_Logo3Height'

    end
    object qryPagef_LogoFile1: TWideStringField
      FieldName = 'f_LogoFile1'

      FixedChar = True
      Size = 255
    end
    object qryPagef_LogoFile2: TWideStringField
      FieldName = 'f_LogoFile2'

      FixedChar = True
      Size = 255
    end
    object qryPagef_LogoFile3: TWideStringField
      FieldName = 'f_LogoFile3'

      FixedChar = True
      Size = 255
    end
    object qryPagef_RegAddressTop: TFloatField
      FieldName = 'f_RegAddressTop'

    end
    object qryPagef_RegAddressLeft: TFloatField
      FieldName = 'f_RegAddressLeft'

    end
    object qryPagef_RegAddressWidth: TFloatField
      FieldName = 'f_RegAddressWidth'

    end
    object qryPagef_RegAddressHeight: TFloatField
      FieldName = 'f_RegAddressHeight'

    end
    object qryPagef_RegAddressFontName: TWideStringField
      FieldName = 'f_RegAddressFontName'

      FixedChar = True
      Size = 50
    end
    object qryPagef_RegAddressFontSize: TIntegerField
      FieldName = 'f_RegAddressFontSize'

    end
    object qryPagef_RegAddressFontStyle: TIntegerField
      FieldName = 'f_RegAddressFontStyle'

    end
    object qryPagef_RegAddressAlignment: TWideStringField
      FieldName = 'f_RegAddressAlignment'

      FixedChar = True
      Size = 1
    end
    object qryPagef_RegAddressPrintByLine: TWideStringField
      FieldName = 'f_RegAddressPrintByLine'

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
  object qryPageLookup: TFDQuery
    ConnectionName = 'PB'
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
  object qryLetterLookup: TFDQuery
    ConnectionName = 'PB'
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
  object qryDelete: TFDQuery
    ConnectionName = 'PB'
    Left = 40
    Top = 184
  end
  object qryDefaults: TFDQuery
    ConnectionName = 'PB'
    UpdateOptions.RequestLive = True
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
