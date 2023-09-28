object PBMaintRepFinancialsFrm: TPBMaintRepFinancialsFrm
  Left = 300
  Top = 93
  Caption = 'Maintain Rep Commissions and Budgets'
  ClientHeight = 507
  ClientWidth = 642
  Color = clBtnFace
  Constraints.MinHeight = 536
  Constraints.MinWidth = 658
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 488
    Width = 642
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 447
    Width = 642
    Height = 41
    Align = alBottom
    TabOrder = 1
    object OKBitBtn: TBitBtn
      Left = 243
      Top = 8
      Width = 75
      Height = 25
      Enabled = False
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = OKBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 331
      Top = 8
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
    Width = 642
    Height = 83
    Align = alTop
    TabOrder = 2
    object grpbxBonus: TGroupBox
      Left = 440
      Top = 41
      Width = 201
      Height = 40
      TabOrder = 0
      Visible = False
      object lblBonus: TLabel
        Left = 8
        Top = 16
        Width = 56
        Height = 13
        Caption = 'Bonus Rate'
      end
      object memBonus: TMemo
        Left = 112
        Top = 13
        Width = 81
        Height = 21
        Alignment = taRightJustify
        TabOrder = 0
        WantReturns = False
        OnEnter = SaveValue
        OnExit = ValidateMoney
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
      Visible = False
      object Label4: TLabel
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
        OnEnter = SaveValue
        OnExit = ValidateMoney
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
        'Category Gross Profit'
        'Category Gross Profit + Bonus'
        'Category Specific')
      TabOrder = 4
      OnClick = rdgrpCommTypeClick
    end
  end
  object pgBudgets: TPageControl
    Left = 0
    Top = 153
    Width = 642
    Height = 294
    ActivePage = tbshtCategory
    Align = alClient
    TabOrder = 3
    object tbshtCategory: TTabSheet
      Caption = 'Category Commission Rates'
      object grdCategory: TStringGrid
        Left = 0
        Top = 0
        Width = 633
        Height = 266
        Align = alLeft
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
      Caption = 'Category Budgets'
      ImageIndex = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 645
        Height = 22
        Align = alTop
        Caption = 'Panel5'
        TabOrder = 0
        object Label3: TLabel
          Left = 6
          Top = 3
          Width = 42
          Height = 13
          Caption = 'Category'
        end
        object ScrollBox1: TScrollBox
          Left = 212
          Top = 1
          Width = 432
          Height = 20
          VertScrollBar.Visible = False
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          object StringGrid1: TStringGrid
            Left = -2
            Top = -5
            Width = 1500
            Height = 65
            ColCount = 25
            DefaultColWidth = 141
            DefaultRowHeight = 20
            FixedCols = 0
            RowCount = 2
            ScrollBars = ssNone
            TabOrder = 0
          end
        end
      end
      object grdDetails: TStringGrid
        Left = 0
        Top = 22
        Width = 645
        Height = 258
        Align = alClient
        ColCount = 25
        DefaultColWidth = 70
        DefaultRowHeight = 19
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        PopupMenu = pmuBudgets
        TabOrder = 1
        OnDrawCell = grdDetailsDrawCell
        OnExit = grdDetailsExit
        OnKeyPress = grdDetailsKeyPress
        OnSelectCell = grdDetailsSelectCell
        OnTopLeftChanged = grdDetailsTopLeftChanged
        ColWidths = (
          211
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70
          70)
        RowHeights = (
          19
          19
          19
          19
          19)
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 642
    Height = 70
    Align = alTop
    TabOrder = 4
    object Label2: TLabel
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
    object Label1: TLabel
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
  object qryPeriods: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Period, Description, Financial_Year'
      'from Period'
      'where Financial_Year = :Financial_Year'
      'ORDER BY Period')
    Left = 96
    Top = 152
    ParamData = <
      item
        Name = 'Financial_Year'
      end>
  end
  object qryReps: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Rep'
      'order by Name')
    Left = 392
    Top = 232
  end
  object dtsReps: TDataSource
    DataSet = qryReps
    Left = 520
    Top = 264
  end
  object qryGetRepBudgets: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Period.Financial_Year,'
      '        Rep_Cat_Budget.Rep,'
      '        Rep_Cat_Budget.Period,'
      '        Rep_Cat_Budget.Category,'
      '        Rep_Cat_Budget.Turnover_Value,'
      '        Rep_Cat_Budget.Profit_Value'
      'FROM Financial_Year'
      '      INNER JOIN (Category'
      '      INNER JOIN (Period'
      '      INNER JOIN Rep_Cat_Budget ON'
      '        Period.Period = Rep_Cat_Budget.Period) ON'
      '        Category.Category = Rep_Cat_Budget.Category) ON'
      '        Financial_Year.Financial_Year = Period.Financial_Year'
      'WHERE (Financial_Year.Financial_Year = :Financial_Year) and'
      '  Rep = :Rep'
      'ORDER BY  Category.Description, Rep_Cat_Budget.Period'
      '')
    Left = 88
    Top = 344
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
    Top = 152
    ParamData = <
      item
        Name = 'Financial_Year'
      end>
  end
  object qryCheckBudget: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Rep_Cat_budget'
      'where Rep = :Rep and '
      'period = :Period and Category = :Category')
    Left = 304
    Top = 216
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Period'
      end
      item
        Name = 'Category'
      end>
  end
  object qryUpdBudget: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Rep_Cat_Budget'
      'set Turnover_Value = :Turnover_Value, '
      'Profit_Value = :Profit_Value'
      'WHERE'
      'Rep = :Rep and '
      'Period = :Period and'
      'Category = :Category')
    Left = 304
    Top = 336
    ParamData = <
      item
        Name = 'Turnover_Value'
      end
      item
        Name = 'Profit_Value'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Period'
      end
      item
        Name = 'Category'
      end>
  end
  object qryAddBudget: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Rep_Cat_Budget'
      
        'values (:Rep, :Period, :Category, :Turnover_Value, :Profit_Value' +
        ')')
    Left = 304
    Top = 280
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Period'
      end
      item
        Name = 'Category'
      end
      item
        Name = 'Turnover_Value'
      end
      item
        Name = 'Profit_Value'
      end>
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
  object qryFY: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Financial_Year'
      'where Financial_Year = :Financial_Year')
    Left = 380
    Top = 298
    ParamData = <
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
    Left = 420
    Top = 354
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
    Left = 420
    Top = 410
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
  object qryDelRepCats: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'Delete from Rep_Financial_Cat'
      'where Rep = :Rep and '
      'Financial_Year = :Financial_Year')
    Left = 516
    Top = 354
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Financial_Year'
      end>
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
  object qryAddFinancials: TFDQuery
    ConnectionName = 'pb'
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
    Left = 508
    Top = 202
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
  object pmuBudgets: TPopupMenu
    Left = 188
    Top = 321
    object ApplyTurnovertofutureperiods1: TMenuItem
      Caption = 'Apply Turnover budget to future periods'
    end
    object ApplyProfitbudgettofutureperiods1: TMenuItem
      Caption = 'Apply Profit budget to future periods'
    end
    object ApplyTurnoveandBudgettofutureperiods1: TMenuItem
      Caption = 'Apply Turnover and Budget to future periods'
    end
  end
end
