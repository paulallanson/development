object PBMaintFYRepBudgetsFrm: TPBMaintFYRepBudgetsFrm
  Left = 199
  Top = 64
  BorderStyle = bsDialog
  Caption = 'Maintain Financial Year Rep Budgets'
  ClientHeight = 464
  ClientWidth = 431
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
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 67
    Height = 13
    Caption = 'Financial Year'
  end
  object Label2: TLabel
    Left = 8
    Top = 36
    Width = 20
    Height = 13
    Caption = 'Rep'
  end
  object dblkpReps: TDBLookupComboBox
    Left = 112
    Top = 32
    Width = 193
    Height = 21
    KeyField = 'Rep'
    ListField = 'Name'
    ListSource = dtsReps
    TabOrder = 0
    OnClick = dblkpRepsClick
  end
  object edtFY: TEdit
    Left = 112
    Top = 5
    Width = 121
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object OKBitBtn: TBitBtn
    Left = 144
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Save'
    Default = True
    Enabled = False
    TabOrder = 2
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
    Left = 232
    Top = 424
    Width = 75
    Height = 25
    TabOrder = 3
    OnClick = CancelBitBtnClick
    Kind = bkCancel
  end
  object grdDetails: TStringGrid
    Left = 8
    Top = 64
    Width = 409
    Height = 345
    ColCount = 3
    DefaultRowHeight = 19
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ScrollBars = ssVertical
    TabOrder = 4
    OnDrawCell = grdDetailsDrawCell
    OnExit = grdDetailsExit
    OnKeyPress = grdDetailsKeyPress
    OnSelectCell = grdDetailsSelectCell
    ColWidths = (
      155
      93
      100)
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
  object dtsPeriods: TDataSource
    DataSet = qryPeriods
    Left = 40
    Top = 152
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
      'SELECT  Rep_Budget.Rep,'
      '        Rep_Budget.Period,'
      '        Rep_Budget.Turnover_Value,'
      '        Rep_Budget.Profit_Value,'
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
      'from Rep_budget'
      'where Rep = :Rep and '
      'period = :Period')
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
      end>
  end
  object qryUpdBudget: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Rep_Budget'
      'set Turnover_Value = :Turnover_Value, '
      'Profit_Value = :Profit_Value'
      'WHERE'
      'Rep = :Rep and '
      'Period = :Period ')
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
      end>
  end
  object qryAddBudget: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Rep_Budget'
      'values (:Rep, :Period, :Turnover_Value, :Profit_Value)')
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
        Name = 'Turnover_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Profit_Value'
        ParamType = ptUnknown
      end>
  end
end
