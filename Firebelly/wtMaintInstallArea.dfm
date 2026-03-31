object frmWTMaintInstallArea: TfrmWTMaintInstallArea
  Left = 442
  Top = 150
  Caption = 'Installation Areas'
  ClientHeight = 228
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 28
    Height = 17
    Caption = 'Area'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 52
    Width = 50
    Height = 17
    Caption = 'Country'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 84
    Width = 70
    Height = 17
    Caption = 'Templating'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 119
    Width = 41
    Height = 17
    Caption = 'Fitting'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
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
    NumGlyphs = 2
    TabOrder = 6
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 264
    Top = 184
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 7
  end
  object dblkpCountry: TDBLookupComboBox
    Left = 86
    Top = 48
    Width = 161
    Height = 25
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
    Left = 86
    Top = 16
    Width = 257
    Height = 25
    TabOrder = 0
    Text = 'edtDescription'
    OnChange = EnableOK
  end
  object edtTemplatingPrice: TCREditMoney
    Left = 86
    Top = 80
    Width = 97
    Height = 25
    TabOrder = 3
    Text = 'edtTemplatingPrice'
  end
  object edtFittingPrice: TCREditMoney
    Left = 86
    Top = 112
    Width = 97
    Height = 25
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
    Left = 292
    Top = 42
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Country'
        DataType = ftInteger
      end
      item
        Name = 'Templating_Price'
      end
      item
        Name = 'Fitting_Price'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Installation_Area'
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
        Name = 'Description'
      end
      item
        Name = 'Country'
        DataType = ftInteger
      end
      item
        Name = 'Templating_Price'
      end
      item
        Name = 'Fitting_Price'
      end
      item
        Name = 'inactive'
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
