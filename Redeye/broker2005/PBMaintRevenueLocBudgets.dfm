object PBMaintRevenueLocBudgetsFrm: TPBMaintRevenueLocBudgetsFrm
  Left = 199
  Top = 64
  BorderStyle = bsDialog
  Caption = 'Maintain Revenue Centre Budgets'
  ClientHeight = 507
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 677
    Height = 70
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 7
      Width = 97
      Height = 13
      Caption = 'Revenue Centre:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 31
      Width = 86
      Height = 13
      Caption = 'Financial Year:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblRevenueLocationName: TLabel
      Left = 120
      Top = 7
      Width = 146
      Height = 13
      Caption = 'lblRevenueLocationName'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFinancialYear: TLabel
      Left = 120
      Top = 31
      Width = 91
      Height = 13
      Caption = 'lblFinancialYear'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 392
      Top = 2
      Width = 249
      Height = 61
      Caption = 'Copy Budget Profile from:'
      TabOrder = 0
      object lblCustBran: TLabel
        Left = 8
        Top = 16
        Width = 78
        Height = 13
        Caption = 'Revenue Centre'
      end
      object edtRevenueCentreName: TEdit
        Left = 8
        Top = 32
        Width = 196
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object btnRep: TButton
        Left = 208
        Top = 30
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnRepClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 467
    Width = 677
    Height = 40
    Align = alBottom
    TabOrder = 1
    object OKBitBtn: TBitBtn
      Left = 254
      Top = 7
      Width = 75
      Height = 25
      Enabled = False
      TabOrder = 0
      OnClick = OKBitBtnClick
      Kind = bkOK
    end
    object CancelBitBtn: TBitBtn
      Left = 342
      Top = 7
      Width = 75
      Height = 25
      TabOrder = 1
      OnClick = CancelBitBtnClick
      Kind = bkCancel
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 70
    Width = 677
    Height = 397
    ActivePage = tbshtBudgets
    Align = alClient
    TabOrder = 2
    object tbshtBudgets: TTabSheet
      Caption = 'Budgets'
      ImageIndex = 2
      object grdDetails: TStringGrid
        Left = 0
        Top = 0
        Width = 669
        Height = 369
        Align = alClient
        ColCount = 4
        DefaultRowHeight = 19
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        PopupMenu = pmnFill
        ScrollBars = ssVertical
        TabOrder = 0
        OnDrawCell = grdDetailsDrawCell
        OnExit = grdDetailsExit
        OnKeyPress = grdDetailsKeyPress
        OnSelectCell = grdDetailsSelectCell
        ColWidths = (
          155
          93
          100
          97)
        RowHeights = (
          19
          19
          19
          19
          19)
      end
    end
  end
  object qryPeriods: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Period, Description, Financial_Year'
      'from Period'
      'where Financial_Year = :Financial_Year'
      'ORDER BY Period')
    Left = 232
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Financial_Year'
        ParamType = ptUnknown
      end>
  end
  object dtsPeriods: TDataSource
    DataSet = qryPeriods
    Left = 272
    Top = 8
  end
  object qryGetRevLocBudgets: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Invoice_Location_Budget.Invoice_Location,'
      '        Invoice_Location_Budget.Period,'
      '        Invoice_Location_Budget.Turnover_Value,'
      '        Invoice_Location_Budget.Profit_Value,'
      '        Invoice_Location_Budget.Operating_Profit_Value,'
      '        Financial_Year.Financial_Year'
      'FROM (Financial_Year'
      '    INNER JOIN Period ON'
      '      Financial_Year.Financial_Year = Period.Financial_Year)'
      '    INNER JOIN Invoice_Location_Budget ON'
      '      Period.Period = Invoice_Location_Budget.Period'
      'where Financial_Year.Financial_Year = :Financial_Year and'
      '      Invoice_Location = :Invoice_Location'
      'ORDER BY Invoice_Location_Budget.Period'
      ' ')
    Left = 200
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Financial_Year'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Location'
        ParamType = ptUnknown
      end>
  end
  object qryFirstPeriod: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select top 1 Period'
      'from Period'
      'where Financial_year = :Financial_Year'
      'order by Period')
    Left = 304
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Financial_Year'
        ParamType = ptUnknown
      end>
  end
  object qryCheckBudget: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Invoice_Location_budget'
      'where Invoice_Location = :Invoice_Location and '
      'period = :Period')
    Left = 304
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Invoice_Location'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Period'
        ParamType = ptUnknown
      end>
  end
  object qryUpdBudget: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Invoice_Location_Budget'
      'set Turnover_Value = :Turnover_Value, '
      'Operating_Profit_Value = :Operating_Profit_Value,'
      'Profit_Value = :Profit_Value'
      'WHERE'
      'Invoice_Location = :Invoice_Location and'
      'Period = :Period')
    Left = 304
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Turnover_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operating_Profit_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Profit_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Location'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Period'
        ParamType = ptUnknown
      end>
  end
  object qryAddBudget: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Invoice_Location_Budget'
      
        'values (:Invoice_Location, :Period, :Turnover_Value, :Profit_Val' +
        'ue, :Operating_Profit_Value)')
    Left = 304
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Invoice_Location'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Turnover_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Profit_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operating_Profit_Value'
        ParamType = ptUnknown
      end>
  end
  object pmnFill: TPopupMenu
    Left = 176
    Top = 272
    object Filldown1: TMenuItem
      Caption = 'Fill Down'
      OnClick = Filldown1Click
    end
    object FillAcrossandDown1: TMenuItem
      Caption = 'Fill Across and Down'
      OnClick = FillAcrossandDown1Click
    end
  end
end
