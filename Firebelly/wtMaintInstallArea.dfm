object frmWTMaintInstallArea: TfrmWTMaintInstallArea
  Left = 442
  Top = 150
  Width = 376
  Height = 261
  Caption = 'Installation Areas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 27
    Height = 13
    Caption = 'Area'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 52
    Width = 44
    Height = 13
    Caption = 'Country'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 84
    Width = 63
    Height = 13
    Caption = 'Templating'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 119
    Width = 36
    Height = 13
    Caption = 'Fitting'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 168
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 5
  end
  object btnOK: TBitBtn
    Left = 176
    Top = 184
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 6
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 264
    Top = 184
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 7
    NumGlyphs = 2
  end
  object dblkpCountry: TDBLookupComboBox
    Left = 80
    Top = 48
    Width = 161
    Height = 21
    KeyField = 'Country'
    ListField = 'Description'
    ListSource = dtsCountry
    TabOrder = 1
  end
  object Button2: TButton
    Left = 256
    Top = 46
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object edtDescription: TEdit
    Left = 80
    Top = 16
    Width = 257
    Height = 21
    TabOrder = 0
    Text = 'edtDescription'
    OnChange = EnableOK
  end
  object edtTemplatingPrice: TCREditMoney
    Left = 80
    Top = 80
    Width = 97
    Height = 21
    TabOrder = 3
    Text = 'edtTemplatingPrice'
  end
  object edtFittingPrice: TCREditMoney
    Left = 80
    Top = 112
    Width = 97
    Height = 21
    TabOrder = 4
    Text = 'edtFittingPrice'
  end
  object qryCountry: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Country, '
      '               Description'
      'FROM Country'
      'ORDER BY Description')
    Left = 256
    Top = 96
  end
  object dtsCountry: TDataSource
    DataSet = qryCountry
    Left = 312
    Top = 96
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Installation_Area'
      'SET'
      '  Description = :Description,'
      '  Country = :Country,'
      '  Templating_Price = :Templating_Price,'
      '  Fitting_Price = :Fitting_Price,'
      '  inActive = :inactive'
      'WHERE'
      '  Installation_Area = :Installation_Area')
    Left = 80
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Country'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Templating_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fitting_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Installation_Area'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Installation_Area'
      '('
      '  Description,'
      '  Country,'
      '  Templating_Price,'
      '  Fitting_Price,'
      '  inActive'
      ')'
      'Values'
      '('
      '  :Description,'
      '  :Country,'
      '  :Templating_Price,'
      '  :Fitting_Price,'
      '  :inActive'
      ')'
      ' ')
    Left = 136
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Country'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Templating_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fitting_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select max(Installation_Area) as Installation_Area'
      'From Installation_Area')
    Left = 200
    Top = 40
  end
end
