object PBLUCContaEventsFrm: TPBLUCContaEventsFrm
  Left = 176
  Top = 23
  Caption = 'Look-Up Customer/Branch Contacts Events'
  ClientHeight = 538
  ClientWidth = 439
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object CustLabel: TLabel
    Left = 85
    Top = 6
    Width = 50
    Height = 13
    Caption = 'CustLabel'
  end
  object CountLabel: TLabel
    Left = 275
    Top = 316
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'CountLabel'
  end
  object BranchLabel: TLabel
    Left = 85
    Top = 22
    Width = 50
    Height = 13
    Caption = 'CustLabel'
  end
  object Label1: TLabel
    Left = 13
    Top = 22
    Width = 38
    Height = 13
    Caption = 'Branch:'
  end
  object Label2: TLabel
    Left = 13
    Top = 6
    Width = 52
    Height = 13
    Caption = 'Customer:'
  end
  object Label3: TLabel
    Left = 13
    Top = 38
    Width = 43
    Height = 13
    Caption = 'Contact:'
  end
  object ContactLabel: TLabel
    Left = 85
    Top = 38
    Width = 40
    Height = 13
    Caption = 'Contact'
  end
  object LblPhone: TLabel
    Left = 13
    Top = 54
    Width = 36
    Height = 13
    Caption = 'Phone:'
  end
  object LblTelNo: TLabel
    Left = 85
    Top = 54
    Width = 33
    Height = 13
    Caption = 'Phone'
  end
  object DetsDBGrid: TDBGrid
    Left = 13
    Top = 72
    Width = 320
    Height = 241
    DataSource = DetsSRC
    DrawingStyle = gdsGradient
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnColEnter = DetsDBGridColEnter
    OnDblClick = DetsDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'EventDate'
        Title.Caption = 'Date'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Operator'
        Width = 166
        Visible = True
      end>
  end
  object SelectBitBtn: TBitBtn
    Left = 345
    Top = 449
    Width = 75
    Height = 26
    Caption = 'Select'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = SelectBitBtnClick
  end
  object CloseBitBtn: TBitBtn
    Left = 345
    Top = 477
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 2
  end
  object FuncGrpBox: TGroupBox
    Left = 341
    Top = 168
    Width = 87
    Height = 129
    Caption = 'Function'
    ParentBackground = False
    TabOrder = 3
    object AddBitBtn: TBitBtn
      Left = 6
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Add'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = AddBitBtnClick
    end
    object ChgBitBtn: TBitBtn
      Left = 6
      Top = 44
      Width = 75
      Height = 25
      Caption = 'Change'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = ChgBitBtnClick
    end
    object DelBitBtn: TBitBtn
      Left = 6
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Delete'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = DelBitBtnClick
    end
    object AppBitBtn: TBitBtn
      Left = 6
      Top = 100
      Width = 75
      Height = 25
      Hint = 'Set appointment'
      Caption = 'App'#39'ts'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
        777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
        79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
        777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
        79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
        CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = AppBitBtnClick
    end
  end
  object DispPanel: TPanel
    Left = 13
    Top = 334
    Width = 321
    Height = 171
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    ParentBackground = False
    TabOrder = 4
    object TextMemo: TMemo
      Left = 0
      Top = 0
      Width = 321
      Height = 169
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    OnDataChange = DetsSRCDataChange
    Left = 141
    Top = 184
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'Select Customer_Contact_Event.Customer_Cont_Event_No,'
      '       Customer_Contact_Event.Customer,'
      '       Customer_Contact_Event.Operator,'
      '       Customer_Contact_Event.Branch_No,'
      '       Customer_Contact_Event.Contact_no,'
      '       Customer_Contact_Event.Date_Time_Entered,'
      '       Customer_Contact_Event.Narrative,'
      '       Operator.Name'
      'From Customer_Contact_Event, Operator'
      'Where (Contact_No = :Contact_No) and'
      '      (Customer = :Customer) and'
      '      (Branch_No = :Branch_No) and'
      '      (Customer_Contact_Event.Operator = Operator.Operator)'
      'Order By Date_Time_Entered desc'
      ' '
      ' ')
    Left = 69
    Top = 160
    ParamData = <
      item
        Name = 'Contact_No'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end>
    object GetDetsSQLCustomer_Cont_Event_No: TIntegerField
      FieldName = 'Customer_Cont_Event_No'
    end
    object GetDetsSQLCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object GetDetsSQLOperator: TIntegerField
      FieldName = 'Operator'
    end
    object GetDetsSQLBranch_No: TIntegerField
      FieldName = 'Branch_No'
    end
    object GetDetsSQLContact_no: TIntegerField
      FieldName = 'Contact_no'
    end
    object GetDetsSQLDate_Time_Entered: TDateTimeField
      FieldName = 'Date_Time_Entered'
    end
    object GetDetsSQLNarrative: TIntegerField
      FieldName = 'Narrative'
    end
    object GetDetsSQLName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object GetDetsSQLEventDate: TDateField
      FieldKind = fkCalculated
      FieldName = 'EventDate'
      OnGetText = GetDetsSQLEventDateGetText
      Calculated = True
    end
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 205
    Top = 192
  end
end
