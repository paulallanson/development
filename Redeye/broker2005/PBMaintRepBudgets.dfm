object PBMaintRepBudgetsFrm: TPBMaintRepBudgetsFrm
  Left = 199
  Top = 64
  BorderStyle = bsDialog
  Caption = 'Maintain Rep Budgets'
  ClientHeight = 498
  ClientWidth = 671
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
    Width = 671
    Height = 70
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 7
      Width = 28
      Height = 13
      Caption = 'Rep:'
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
    object lblRepName: TLabel
      Left = 112
      Top = 7
      Width = 69
      Height = 13
      Caption = 'lblRepName'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFinancialYear: TLabel
      Left = 112
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
        Width = 51
        Height = 13
        Caption = 'Rep Name'
      end
      object edtRep: TEdit
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
    Top = 458
    Width = 671
    Height = 40
    Align = alBottom
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
  object pnlBonus: TPanel
    Left = 0
    Top = 70
    Width = 671
    Height = 85
    Align = alTop
    TabOrder = 2
    object grpbxBonus: TGroupBox
      Left = 440
      Top = 41
      Width = 201
      Height = 40
      TabOrder = 0
      object lblBonus: TLabel
        Left = 8
        Top = 16
        Width = 41
        Height = 13
        Caption = 'Bonus %'
      end
      object memBonus: TMemo
        Left = 112
        Top = 13
        Width = 81
        Height = 21
        Alignment = taRightJustify
        TabOrder = 0
        WantReturns = False
      end
    end
    object rdgrpBonus: TRadioGroup
      Left = 192
      Top = 1
      Width = 113
      Height = 77
      Caption = 'Bonus Period'
      ItemIndex = 0
      Items.Strings = (
        'Monthly'
        'Quarterly'
        'Half Yearly')
      TabOrder = 1
    end
    object rdgrpBonusType: TRadioGroup
      Left = 312
      Top = 1
      Width = 121
      Height = 64
      Caption = 'Bonus Type'
      ItemIndex = 0
      Items.Strings = (
        'Percentage Rate'
        'Fixed Amount')
      TabOrder = 2
      OnClick = rdgrpBonusTypeClick
    end
    object grpbxCommission: TGroupBox
      Left = 440
      Top = 1
      Width = 201
      Height = 40
      TabOrder = 3
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 92
        Height = 13
        Caption = 'Commission Rate %'
      end
      object memCommission: TMemo
        Left = 112
        Top = 11
        Width = 81
        Height = 21
        Alignment = taRightJustify
        TabOrder = 0
        WantReturns = False
      end
    end
    object rdgrpCommType: TRadioGroup
      Left = 8
      Top = 1
      Width = 177
      Height = 77
      Caption = 'Commission basis'
      ItemIndex = 0
      Items.Strings = (
        'Gross Profit'
        'Gross Profit + Bonus'
        'Period Specific')
      TabOrder = 4
      OnClick = rdgrpCommTypeClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 155
    Width = 671
    Height = 303
    ActivePage = tbshtCommission
    Align = alClient
    TabOrder = 3
    object tbshtCommission: TTabSheet
      Caption = 'Commission'
      object grdCategory: TStringGrid
        Left = 0
        Top = 0
        Width = 663
        Height = 275
        Align = alClient
        DefaultColWidth = 200
        DefaultRowHeight = 19
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        ScrollBars = ssVertical
        TabOrder = 0
        OnClick = grdCategoryClick
        OnDrawCell = grdDetailsDrawCell
        OnExit = grdCategoryExit
        OnKeyPress = grdDetailsKeyPress
        OnSelectCell = grdCategorySelectCell
        ColWidths = (
          200
          94
          97
          121
          101)
        RowHeights = (
          19
          19
          19
          19
          19)
      end
      object cmbxCommissionBasis: TComboBox
        Left = 184
        Top = 208
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        Visible = False
        OnClick = cmbxCommissionBasisClick
        Items.Strings = (
          'Turnover'
          'Gross Profit')
      end
    end
    object tbshtBudgets: TTabSheet
      Caption = 'Budgets'
      ImageIndex = 2
      object grdDetails: TStringGrid
        Left = 0
        Top = 0
        Width = 669
        Height = 284
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
      'SELECT  Rep_Budget.Rep,'
      '        Rep_Budget.Period,'
      '        Rep_Budget.Turnover_Value,'
      '        Rep_Budget.Profit_Value,'
      '        Rep_Budget.Operating_Profit_Value,'
      '        Financial_Year.Financial_Year'
      'FROM (Financial_Year'
      '    INNER JOIN Period ON'
      '      Financial_Year.Financial_Year = Period.Financial_Year)'
      '    INNER JOIN Rep_Budget ON'
      '      Period.Period = Rep_Budget.Period'
      'where Financial_Year.Financial_Year = :Financial_Year and'
      '      Rep = :Rep'
      'ORDER BY Rep_Budget.Period'
      ' ')
    Left = 200
    Top = 136
    ParamData = <
      item
        Name = 'Financial_Year'
      end
      item
        Name = 'Rep'
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
      'from Rep_budget'
      'where Rep = :Rep and '
      'period = :Period')
    Left = 304
    Top = 200
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Period'
      end>
  end
  object qryUpdBudget: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Rep_Budget'
      'set Turnover_Value = :Turnover_Value, '
      'Operating_Profit_Value = :Operating_Profit_Value,'
      'Profit_Value = :Profit_Value'
      'WHERE'
      'Rep = :Rep and'
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
        Name = 'Rep'
      end
      item
        Name = 'Period'
      end>
  end
  object qryAddBudget: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Rep_Budget'
      
        'values (:Rep, :Period, :Turnover_Value, :Profit_Value, :Operatin' +
        'g_Profit_Value)')
    Left = 304
    Top = 248
    ParamData = <
      item
        Name = 'Rep'
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
  object qryAddFinancials: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Rep_Financial'
      
        '(Rep, Financial_Year, Commission_Type, Commission_Rate, Bonus_Ra' +
        'te, Bonus_Period, Bonus_Type)'
      'values'
      
        '(:Rep, :Financial_Year, :Commission_Type, :Commission_Rate, :Bon' +
        'us_Rate, :Bonus_Period, :Bonus_Type)')
    Left = 460
    Top = 154
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Financial_Year'
      end
      item
        Name = 'Commission_Type'
      end
      item
        Name = 'Commission_Rate'
      end
      item
        Name = 'Bonus_Rate'
      end
      item
        Name = 'Bonus_Period'
      end
      item
        Name = 'Bonus_Type'
      end>
  end
  object qryDelFinancials: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Rep_Financial'
      'where Rep = :Rep and Financial_Year = :Financial_Year')
    Left = 464
    Top = 208
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Financial_Year'
      end>
  end
  object qryCheckExists: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Rep_Financial'
      'where Rep = :Rep and Financial_Year = :Financial_Year')
    Left = 460
    Top = 258
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Financial_Year'
      end>
  end
  object qryUpdFinancials: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Rep_Financial'
      'set Commission_Type = :Commission_Type, '
      'Commission_Rate = :Commission_Rate, '
      'Bonus_Rate = :Bonus_Rate,'
      'Bonus_Type = :Bonus_Type,'
      'Bonus_Period = :Bonus_Period'
      'where '
      '(Rep = :Rep) and (Financial_Year = :Financial_Year)')
    Left = 460
    Top = 322
    ParamData = <
      item
        Name = 'Commission_Type'
      end
      item
        Name = 'Commission_Rate'
      end
      item
        Name = 'Bonus_Rate'
      end
      item
        Name = 'Bonus_Type'
      end
      item
        Name = 'Bonus_Period'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Financial_Year'
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
  object qryCategory: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from category'
      'order by description')
    Left = 96
    Top = 208
  end
  object qryGetRepCategory: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Rep_Financial_Cat.Category,'
      '        Rep_Financial_Cat.Rep,'
      '        Rep_Financial_Cat.Financial_Year,'
      '        Rep_Financial_Cat.Commission_Rate,'
      '        Rep_Financial_Cat.Bonus_Rate,'
      '        Rep_Financial_Cat.Commission_Basis,'
      '        Rep_Financial_Cat.New_Business_Rate'
      'FROM Rep_Financial_Cat'
      'WHERE Rep = :Rep and'
      'Financial_Year = :Financial_Year and'
      'Category = :Category')
    Left = 92
    Top = 282
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Financial_Year'
      end
      item
        Name = 'Category'
      end>
  end
  object qryDelRepCats: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'Delete from Rep_Financial_Cat'
      'where Rep = :Rep and '
      'Financial_Year = :Financial_Year')
    Left = 572
    Top = 154
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Financial_Year'
      end>
  end
  object qryAddRepCats: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'Insert into Rep_Financial_Cat'
      ' (Rep,'
      ' Financial_Year,'
      ' Category,'
      ' Commission_Rate,'
      ' Bonus_Rate,'
      ' Commission_Basis,'
      ' New_Business_Rate)'
      'Values'
      ' (:Rep,'
      ' :Financial_Year,'
      ' :Category,'
      ' :Commission_Rate,'
      ' :Bonus_Rate,'
      ' :Commission_Basis,'
      ' :New_Business_Rate)')
    Left = 572
    Top = 210
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Financial_Year'
      end
      item
        Name = 'Category'
      end
      item
        Name = 'Commission_Rate'
      end
      item
        Name = 'Bonus_Rate'
      end
      item
        Name = 'Commission_Basis'
      end
      item
        Name = 'New_Business_Rate'
      end>
  end
end
