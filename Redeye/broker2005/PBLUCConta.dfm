object PBLUCContaFrm: TPBLUCContaFrm
  Left = 198
  Top = 162
  BorderStyle = bsDialog
  Caption = 'Look-Up Customer/Branch Contacts'
  ClientHeight = 400
  ClientWidth = 459
  Color = clBtnFace
  Constraints.MinHeight = 408
  Constraints.MinWidth = 430
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    459
    400)
  PixelsPerInch = 96
  TextHeight = 13
  object CustLabel: TLabel
    Left = 85
    Top = 6
    Width = 47
    Height = 13
    Caption = 'CustLabel'
  end
  object CountLabel: TLabel
    Left = 299
    Top = 245
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'CountLabel'
  end
  object BranchLabel: TLabel
    Left = 85
    Top = 22
    Width = 47
    Height = 13
    Caption = 'CustLabel'
  end
  object Label1: TLabel
    Left = 13
    Top = 22
    Width = 37
    Height = 13
    Caption = 'Branch:'
  end
  object Label2: TLabel
    Left = 13
    Top = 6
    Width = 47
    Height = 13
    Caption = 'Customer:'
  end
  object DetsDBGrid: TDBGrid
    Left = 13
    Top = 40
    Width = 339
    Height = 196
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DetsSRC
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnColEnter = DetsDBGridColEnter
    OnDrawColumnCell = DetsDBGridDrawColumnCell
    OnDblClick = DetsDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Contact Name'
        Width = 284
        Visible = True
      end>
  end
  object SearchGrpBox: TGroupBox
    ParentBackground = False
    Left = 8
    Top = 261
    Width = 348
    Height = 65
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Type here to narrow the search'
    TabOrder = 1
    DesignSize = (
      348
      65)
    object NameEdit: TEdit
      Left = 8
      Top = 16
      Width = 332
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      OnChange = NameEditChange
    end
    object chkbxActiveOnly: TCheckBox
      Left = 8
      Top = 42
      Width = 217
      Height = 17
      Caption = 'Only show active customer contacts'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = ShowGrid
    end
  end
  object SelectBitBtn: TBitBtn
    Left = 370
    Top = 332
    Width = 75
    Height = 26
    Anchors = [akRight, akBottom]
    Caption = 'Select'
    TabOrder = 2
    OnClick = SelectBitBtnClick
    Kind = bkOK
  end
  object CloseBitBtn: TBitBtn
    Left = 370
    Top = 365
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 3
    Kind = bkClose
  end
  object FuncGrpBox: TGroupBox
    ParentBackground = False
    Left = 364
    Top = 112
    Width = 87
    Height = 105
    Anchors = [akTop, akRight]
    Caption = 'Function'
    TabOrder = 4
    object AddBitBtn: TBitBtn
      Left = 6
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 0
      OnClick = AddBitBtnClick
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
    end
    object ChgBitBtn: TBitBtn
      Left = 6
      Top = 44
      Width = 75
      Height = 25
      Caption = 'Change'
      TabOrder = 1
      OnClick = ChgBitBtnClick
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
    end
    object DelBitBtn: TBitBtn
      Left = 6
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Delete'
      TabOrder = 2
      OnClick = DelBitBtnClick
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
    end
  end
  object DispPanel: TPanel
    ParentBackground = False
    Left = 8
    Top = 331
    Width = 349
    Height = 59
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 5
    object DBContactText: TDBText
      Left = 67
      Top = 3
      Width = 214
      Height = 17
      DataField = 'Name'
      DataSource = DetsSRC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBCPhoneText: TDBText
      Left = 67
      Top = 19
      Width = 214
      Height = 13
      DataField = 'Phone'
      DataSource = DetsSRC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBCMobileText: TDBText
      Left = 67
      Top = 35
      Width = 214
      Height = 15
      DataField = 'Mobile_No'
      DataSource = DetsSRC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelName: TLabel
      Left = 4
      Top = 2
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object LabelPhone: TLabel
      Left = 4
      Top = 18
      Width = 34
      Height = 13
      Caption = 'Phone:'
    end
    object LabelFax: TLabel
      Left = 4
      Top = 34
      Width = 34
      Height = 13
      Caption = 'Mobile:'
    end
  end
  object GoToGrpBox: TGroupBox
    ParentBackground = False
    Left = 359
    Top = 8
    Width = 97
    Height = 49
    Anchors = [akTop, akRight]
    Caption = 'Go To'
    TabOrder = 6
    object EventsBitBtn: TBitBtn
      Left = 7
      Top = 16
      Width = 83
      Height = 25
      Caption = '&Events'
      TabOrder = 0
      OnClick = EventsBitBtnClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000333300
        0000377777F3337777770FFFF099990FFFF07FFFF7FFFF7FFFF7000000999900
        00007777777777777777307703399330770337FF7F37F337FF7F300003399330
        000337777337F337777333333339933333333FFFFFF7F33FFFFF000000399300
        0000777777F7F37777770FFFF099990FFFF07FFFF7F7FF7FFFF7000000999900
        00007777777777777777307703399330770337FF7F37F337FF7F300003399330
        0003377773F7FFF77773333330000003333333333777777F3333333330FFFF03
        3333333337FFFF7F333333333000000333333333377777733333333333077033
        33333333337FF7F3333333333300003333333333337777333333}
      NumGlyphs = 2
    end
  end
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 141
    Top = 24
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select'
      '  Customer_Contact.*,'
      '  contact_info.*'
      'From Customer_Contact'
      
        '  left join contact_info on (customer_contact.contact_info = con' +
        'tact_info.contact_info)'
      'Where (Name Like :Code_From) and'
      '      (Customer = :Customer) and'
      '      (Branch_No = :Branch_No) and'
      
        '      ((Inactive = '#39'N'#39') or (Inactive is NULL) or (Inactive = :In' +
        'active))'
      'Order By Name'
      '')
    Left = 29
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Code_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inactive'
        ParamType = ptUnknown
      end>
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 205
    Top = 152
  end
  object NullSRC: TDataSource
    Left = 224
    Top = 24
  end
end
