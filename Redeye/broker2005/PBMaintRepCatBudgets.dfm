object PBMaintRepCatBudgetsFrm: TPBMaintRepCatBudgetsFrm
  Left = 178
  Top = 91
  Width = 790
  Height = 538
  Caption = 'Maintain Rep, Product Category Budgets'
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 485
    Width = 782
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 444
    Width = 782
    Height = 41
    Align = alBottom
    TabOrder = 1
    object OKBitBtn: TBitBtn
      Left = 312
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Save'
      Default = True
      Enabled = False
      TabOrder = 0
      OnClick = OKBitBtnClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object CancelBitBtn: TBitBtn
      Left = 400
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      OnClick = CancelBitBtnClick
      Kind = bkCancel
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 73
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 14
      Width = 67
      Height = 13
      Caption = 'Financial Year'
    end
    object Label2: TLabel
      Left = 16
      Top = 46
      Width = 20
      Height = 13
      Caption = 'Rep'
    end
    object edtFY: TEdit
      Left = 120
      Top = 10
      Width = 121
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object dblkpReps: TDBLookupComboBox
      Left = 120
      Top = 42
      Width = 193
      Height = 21
      KeyField = 'Rep'
      ListField = 'Name'
      ListSource = dtsReps
      TabOrder = 1
      OnClick = dblkpRepsClick
    end
  end
  object grdDetails: TStringGrid
    Left = 0
    Top = 95
    Width = 782
    Height = 349
    Align = alClient
    ColCount = 25
    DefaultColWidth = 70
    DefaultRowHeight = 19
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 3
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
  object Panel5: TPanel
    Left = 0
    Top = 73
    Width = 782
    Height = 22
    Align = alTop
    Caption = 'Panel5'
    TabOrder = 4
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
      Width = 569
      Height = 20
      VertScrollBar.Visible = False
      Align = alRight
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object StringGrid1: TStringGrid
        Left = -2
        Top = -3
        Width = 1500
        Height = 56
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
        DataType = ftUnknown
        Name = 'Financial_Year'
        ParamType = ptUnknown
      end>
  end
  object qryReps: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Rep'
      'order by Name')
    Left = 328
    Top = 32
  end
  object dtsReps: TDataSource
    DataSet = qryReps
    Left = 376
    Top = 32
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
    Left = 160
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Financial_Year'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Financial_Year'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Category'
        ParamType = ptUnknown
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
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Category'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Category'
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
end
