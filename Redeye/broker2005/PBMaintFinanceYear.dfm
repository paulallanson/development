object PBMaintFinanceYearFrm: TPBMaintFinanceYearFrm
  Left = 152
  Top = 121
  BorderStyle = bsDialog
  Caption = 'Maintain Financial Year'
  ClientHeight = 260
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    424
    260)
  TextHeight = 13
  object DelLabel: TLabel
    Left = 120
    Top = 237
    Width = 125
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Delete these details ?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DetsGrpBox: TGroupBox
    Left = 16
    Top = 8
    Width = 393
    Height = 209
    Caption = 'Details'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 20
      Height = 13
      Caption = 'Title'
    end
    object Label2: TLabel
      Left = 8
      Top = 84
      Width = 22
      Height = 13
      Caption = 'Year'
    end
    object Label3: TLabel
      Left = 8
      Top = 52
      Width = 55
      Height = 13
      Caption = 'Start Month'
    end
    object Label4: TLabel
      Left = 8
      Top = 117
      Width = 66
      Height = 13
      Caption = 'No. of periods'
    end
    object Label19: TLabel
      Left = 8
      Top = 176
      Width = 57
      Height = 13
      Caption = 'Budget type'
    end
    object Label5: TLabel
      Left = 8
      Top = 144
      Width = 83
      Height = 13
      Caption = 'Commission Basis'
    end
    object edtTitle: TEdit
      Left = 102
      Top = 16
      Width = 252
      Height = 21
      MaxLength = 40
      TabOrder = 0
      OnChange = CheckOK
    end
    object edtYear: TEdit
      Left = 102
      Top = 80
      Width = 75
      Height = 21
      MaxLength = 15
      TabOrder = 2
      OnChange = CheckOK
      OnKeyPress = edtYearKeyPress
    end
    object cmbMonth: TComboBox
      Left = 102
      Top = 48
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnChange = CheckOK
      Items.Strings = (
        'January'
        'February'
        'March'
        'April'
        'May'
        'June'
        'July'
        'August'
        'September'
        'October'
        'November'
        'December')
    end
    object spnNoOfPeriods: TSpinEdit
      Left = 102
      Top = 112
      Width = 51
      Height = 22
      MaxValue = 24
      MinValue = 1
      TabOrder = 3
      Value = 12
    end
    object cmbBudgetType: TComboBox
      Left = 102
      Top = 172
      Width = 201
      Height = 21
      Style = csDropDownList
      TabOrder = 5
      OnChange = CheckOK
      Items.Strings = (
        'by Period'
        'by Category & Period')
    end
    object cmbCommission: TComboBox
      Left = 102
      Top = 140
      Width = 201
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      OnChange = CheckOK
      Items.Strings = (
        'by Period'
        'by Category')
    end
  end
  object OKBitBtn: TBitBtn
    Left = 256
    Top = 229
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    Glyph.Data = {
      CE070000424DCE07000000000000360000002800000024000000120000000100
      1800000000009807000000000000000000000000000000000000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F7F00007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F7F0000007F00007F007F0000007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F0000007F00007F00007F0000
      7F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F000000
      7F00007F00007F00007F00007F00007F007F0000007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F
      7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F7F0000007F00007F00007F0000FF00007F00007F00007F00007F00
      7F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFF
      FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F00007F00007F0000FF00007F7F
      00FF00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F7F7F7FFFFFFF007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00
      007F0000FF00007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F00
      7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F00FF
      00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F
      7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF0000
      7F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F
      7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00
      007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFF
      FFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F00FF00007F00007F007F0000007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F
      7F7FFFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00007F
      00007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F}
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 336
    Top = 229
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    Glyph.Data = {
      CE070000424DCE07000000000000360000002800000024000000120000000100
      1800000000009807000000000000000000000000000000000000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
      7F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F0000FF7F7F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF007F7F
      007F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F00
      00FF00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
      FFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7FFFFFFF7F7F7F7F7F7FFFFF
      FF007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00
      007F7F7F7F007F7F0000FF00007F00007F00007F00007F7F7F7F007F7F007F7F
      007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7FFFFF
      FF7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F00
      7F7F0000FF00007F00007F00007F00007F7F7F7F00007F00007F00007F00007F
      00007F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F
      7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF00
      7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00007F
      00007F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F00
      7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      0000FF00007F00007F00007F00007F00007F00007F7F7F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F00
      7F7F007F7F007F7F007F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F00007F00007F00007F00007F00007F7F7F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
      7F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
      7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F0000FF00007F00007F00007F00007F00007F7F7F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
      007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F7F7F7F00007F00
      007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00
      007F7F7F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F7F7F7FFFFF
      FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F0000FF00007F00007F7F7F7F007F7F007F7F007F7F0000FF00007F00007F
      00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
      7F007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F007F7F007F7F007F7F
      007F7F007F7F0000FF00007F00007F00007F007F7F007F7F007F7F007F7F007F
      7F007F7F7F7F7FFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F7F7F7FFFFFFF00
      7F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F0000FF007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F00
      7F7F007F7F007F7F7F7F7FFFFFFFFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F7F7F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F}
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
    OnClick = CancelBitBtnClick
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Financial_Year'
      'From Financial_Year'
      'Where Title = :GUID')
    Left = 192
    Top = 24
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Financial_Year'
      '        (Financial_Year,'
      '        Title,'
      '        Start_period_no,'
      '        Start_Period_year,'
      '        No_of_Periods,'
      '        Year_Closed_off)'
      
        'Select Max(Financial_Year)+1, :GUID, 0, 0, 0, '#39'N'#39' From Financial' +
        '_Year'
      ''
      ''
      ''
      ' ')
    Left = 276
    Top = 32
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Financial_Year'
      'Set     Title = :Title,'
      '        Start_Period_no = :Start_Period_no,'
      '        Start_Period_Year = :Start_Period_Year,'
      '        No_of_periods = :No_of_Periods,'
      '        Performance_Target_type = :Performance_Target_Type,'
      '        Commission_Basis = :Commission_Basis'
      'Where'
      '(Financial_Year = :Financial_Year) '
      '')
    Left = 144
    Top = 16
    ParamData = <
      item
        Name = 'Title'
      end
      item
        Name = 'Start_Period_no'
      end
      item
        Name = 'Start_Period_Year'
      end
      item
        Name = 'No_of_Periods'
      end
      item
        Name = 'Performance_Target_Type'
      end
      item
        Name = 'Commission_Basis'
      end
      item
        Name = 'Financial_Year'
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Financial_Year'
      'Where'
      '(Financial_Year = :Financial_Year)')
    Left = 240
    Top = 16
    ParamData = <
      item
        Name = 'Financial_Year'
      end>
  end
  object DetsSRC: TDataSource
    DataSet = AddSQL
    Left = 320
    Top = 16
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    Left = 360
    Top = 52
  end
  object qryGetLastPeriod: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Period) as Last_Period'
      'from Period')
    Left = 216
    Top = 64
  end
  object qryChkPeriod: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from period'
      'where Period_Year = :Period_Year and'
      'Period_no = :Period_no')
    Left = 288
    Top = 64
    ParamData = <
      item
        Name = 'Period_Year'
      end
      item
        Name = 'Period_no'
      end>
  end
  object qryAddPeriod: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Period'
      '        (Period,'
      '        Period_Year,'
      '        Description,'
      '        Period_no,'
      '        Period_End_date,'
      '        Last_Period_End_Date,'
      '        Financial_Year)'
      'Values (:Period,'
      '        :Period_Year,'
      '        :Description,'
      '        :Period_no,'
      '        :Period_End_date,'
      '        :Last_Period_End_Date,'
      '        :Financial_Year)'
      ''
      ' ')
    Left = 368
    Top = 112
    ParamData = <
      item
        Name = 'Period'
      end
      item
        Name = 'Period_Year'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Period_no'
      end
      item
        Name = 'Period_End_date'
      end
      item
        Name = 'Last_Period_End_Date'
      end
      item
        Name = 'Financial_Year'
      end>
  end
  object DelPeriodsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Period'
      'where Financial_Year = :Financial_Year')
    Left = 40
    Top = 104
    ParamData = <
      item
        Name = 'Financial_Year'
      end>
  end
  object qryUpPeriod: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Period'
      'set Financial_year = :Financial_Year'
      'where Period_Year = :Period_Year and'
      'Period_no = :Period_no')
    Left = 56
    Top = 64
    ParamData = <
      item
        Name = 'Financial_Year'
      end
      item
        Name = 'Period_Year'
      end
      item
        Name = 'Period_no'
      end>
  end
  object DelBudgetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Rep_Budget'
      'where '
      
        'Period in (select Period from Period where Financial_Year = :Fin' +
        'ancial_Year)')
    Left = 144
    Top = 88
    ParamData = <
      item
        Name = 'Financial_Year'
      end>
  end
  object DelRepCatsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Rep_Financial_Cat'
      'where Financial_Year = :Financial_Year')
    Left = 80
    Top = 24
    ParamData = <
      item
        Name = 'Financial_Year'
      end>
  end
  object DelRepFinanceSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Rep_Financial'
      'where Financial_Year = :Financial_Year')
    Left = 80
    Top = 128
    ParamData = <
      item
        Name = 'Financial_Year'
      end>
  end
  object UpdBasicSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Financial_Year'
      'Set     Title = :Title,'
      '        Performance_Target_type = :Performance_Target_Type,'
      '        Commission_Basis = :Commission_Basis'
      'Where'
      '(Financial_Year = :Financial_Year) '
      '')
    Left = 272
    Top = 120
    ParamData = <
      item
        Name = 'Title'
      end
      item
        Name = 'Performance_Target_Type'
      end
      item
        Name = 'Commission_Basis'
      end
      item
        Name = 'Financial_Year'
      end>
  end
end
