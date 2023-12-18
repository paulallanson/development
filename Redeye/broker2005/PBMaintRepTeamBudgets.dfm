object PBMaintRepTeamBudgetsFrm: TPBMaintRepTeamBudgetsFrm
  Left = 199
  Top = 64
  BorderStyle = bsDialog
  Caption = 'Maintain Rep Team Budgets'
  ClientHeight = 507
  ClientWidth = 677
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 677
    Height = 70
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 7
      Width = 53
      Height = 13
      Caption = 'Rep Team:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 31
      Width = 74
      Height = 13
      Caption = 'Financial Year:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblRepTeamName: TLabel
      Left = 112
      Top = 7
      Width = 91
      Height = 13
      Caption = 'lblRepTeamName'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFinancialYear: TLabel
      Left = 112
      Top = 31
      Width = 81
      Height = 13
      Caption = 'lblFinancialYear'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 392
      Top = 2
      Width = 249
      Height = 61
      Caption = 'Copy Budget Profile from:'
      ParentBackground = False
      TabOrder = 0
      object lblCustBran: TLabel
        Left = 8
        Top = 16
        Width = 49
        Height = 13
        Caption = 'Rep Team'
      end
      object edtRepTeam: TEdit
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
        Font.Name = 'Segoe UI'
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
    ParentBackground = False
    TabOrder = 1
    object OKBitBtn: TBitBtn
      Left = 254
      Top = 7
      Width = 75
      Height = 25
      Enabled = False
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = OKBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 342
      Top = 7
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      OnClick = CancelBitBtnClick
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
  object qryPeriods: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Period, Description, Financial_Year'
      'from Period'
      'where Financial_Year = :Financial_Year'
      'ORDER BY Period')
    Left = 232
    Top = 8
    ParamData = <
      item
        Name = 'Financial_Year'
      end>
  end
  object dtsPeriods: TDataSource
    DataSet = qryPeriods
    Left = 272
    Top = 8
  end
  object qryGetRepBudgets: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Rep_Team_Budget.Rep_Team,'
      '        Rep_Team_Budget.Period,'
      '        Rep_Team_Budget.Turnover_Value,'
      '        Rep_Team_Budget.Profit_Value,'
      '        Rep_Team_Budget.Operating_Profit_Value,'
      '        Financial_Year.Financial_Year'
      'FROM (Financial_Year'
      '    INNER JOIN Period ON'
      '      Financial_Year.Financial_Year = Period.Financial_Year)'
      '    INNER JOIN Rep_Team_Budget ON'
      '      Period.Period = Rep_Team_Budget.Period'
      'where Financial_Year.Financial_Year = :Financial_Year and'
      '      Rep_Team = :Rep_Team'
      'ORDER BY Rep_Team_Budget.Period'
      ' ')
    Left = 200
    Top = 136
    ParamData = <
      item
        Name = 'Financial_Year'
      end
      item
        Name = 'Rep_Team'
      end>
  end
  object qryFirstPeriod: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 Period'
      'from Period'
      'where Financial_year = :Financial_Year'
      'order by Period')
    Left = 304
    Top = 136
    ParamData = <
      item
        Name = 'Financial_Year'
      end>
  end
  object qryCheckBudget: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Rep_Team_budget'
      'where Rep_Team = :Rep_Team and '
      'period = :Period')
    Left = 304
    Top = 200
    ParamData = <
      item
        Name = 'Rep_Team'
      end
      item
        Name = 'Period'
      end>
  end
  object qryUpdBudget: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Rep_Team_Budget'
      'set Turnover_Value = :Turnover_Value, '
      'Operating_Profit_Value = :Operating_Profit_Value,'
      'Profit_Value = :Profit_Value'
      'WHERE'
      'Rep_Team = :Rep_Team and'
      'Period = :Period')
    Left = 304
    Top = 296
    ParamData = <
      item
        Name = 'Turnover_Value'
      end
      item
        Name = 'Operating_Profit_Value'
      end
      item
        Name = 'Profit_Value'
      end
      item
        Name = 'Rep_Team'
      end
      item
        Name = 'Period'
      end>
  end
  object qryAddBudget: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Rep_Team_Budget'
      
        'values (:Rep_Team, :Period, :Turnover_Value, :Profit_Value, :Ope' +
        'rating_Profit_Value)')
    Left = 304
    Top = 248
    ParamData = <
      item
        Name = 'Rep_Team'
      end
      item
        Name = 'Period'
      end
      item
        Name = 'Turnover_Value'
      end
      item
        Name = 'Profit_Value'
      end
      item
        Name = 'Operating_Profit_Value'
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
