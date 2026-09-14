object PBMaintCompanyFYfrm: TPBMaintCompanyFYfrm
  Left = 253
  Top = 152
  BorderStyle = bsDialog
  Caption = 'Current Financial Year details'
  ClientHeight = 222
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object OKBitBtn: TBitBtn
    Left = 64
    Top = 176
    Width = 75
    Height = 25
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
    OnClick = OKBitBtnClick
  end
  object BitBtn2: TBitBtn
    Left = 150
    Top = 176
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object grpbxDetails: TGroupBox
    Left = 8
    Top = 8
    Width = 313
    Height = 145
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 56
      Top = 81
      Width = 25
      Height = 17
      Caption = 'Year'
    end
    object Label2: TLabel
      Left = 56
      Top = 112
      Width = 38
      Height = 17
      Caption = 'Period'
    end
    object Label3: TLabel
      Left = 7
      Top = 16
      Width = 272
      Height = 51
      Caption = 
        'Enter the date in which the financial year will start. This date' +
        ' is fixed once transactions have been posted.'
      WordWrap = True
    end
    object dblkpYear: TDBLookupComboBox
      Left = 112
      Top = 73
      Width = 105
      Height = 25
      KeyField = 'Financial_Year'
      ListField = 'Title'
      TabOrder = 0
      OnClick = dblkpYearClick
    end
    object dblkpPeriod: TDBLookupComboBox
      Left = 112
      Top = 104
      Width = 145
      Height = 25
      KeyField = 'Period'
      ListField = 'Description'
      TabOrder = 1
      OnClick = EnableOK
    end
  end
  object qryCheckSalesProfit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sales_profit '
      'from sales_profit, period'
      'where sales_profit.period = period.period and'
      'period.financial_year = :Financial_year')
    Left = 72
    Top = 8
    ParamData = <
      item
        Name = 'Financial_year'
      end>
  end
  object UpdDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set'
      'Financial_Year = :Financial_Year,'
      'Period = :Period'
      '')
    Left = 24
    Top = 72
    ParamData = <
      item
        Name = 'Financial_Year'
      end
      item
        Name = 'Period'
      end>
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Financial_Year, Period'
      'From Company')
    Left = 64
    Top = 64
  end
  object qryYear: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Financial_Year'
      'where Year_Closed_Off = '#39'N'#39
      'order by Financial_Year')
    Left = 200
    Top = 8
  end
  object dtsYear: TDataSource
    DataSet = qryYear
    Left = 240
    Top = 8
  end
  object qryPeriod: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '
      '* from'
      'Period'
      'where Financial_Year = :Financial_Year'
      'order by Period')
    Left = 200
    Top = 72
    ParamData = <
      item
        Name = 'Financial_Year'
        DataType = ftInteger
      end>
  end
  object dtsPeriod: TDataSource
    DataSet = qryPeriod
    Left = 240
    Top = 72
  end
end
