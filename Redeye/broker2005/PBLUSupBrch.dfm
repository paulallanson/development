object PBLUSupBrchFrm: TPBLUSupBrchFrm
  Left = 195
  Top = 104
  AutoScroll = False
  Caption = 'Look-Up A Branch'
  ClientHeight = 387
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SuppLabel: TLabel
    Left = 8
    Top = 6
    Width = 51
    Height = 13
    Caption = 'SuppLabel'
  end
  object CountLabel: TLabel
    Left = 275
    Top = 224
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = 'CountLabel'
  end
  object DetsDBGrid: TDBGrid
    Left = 8
    Top = 24
    Width = 320
    Height = 193
    DataSource = DetsSRC
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnColEnter = DetsDBGridColEnter
    OnDblClick = DetsDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Branch Name'
        Width = 284
        Visible = True
      end>
  end
  object SearchGrpBox: TGroupBox
    ParentBackground = False
    Left = 8
    Top = 236
    Width = 313
    Height = 61
    Caption = 'Type here to narrow the search'
    TabOrder = 1
    object NameEdit: TEdit
      Left = 8
      Top = 16
      Width = 297
      Height = 21
      TabOrder = 0
      OnChange = NameEditChange
    end
    object ThisChkBox: TCheckBox
      Left = 8
      Top = 40
      Width = 185
      Height = 17
      Caption = 'Head Office'
      TabOrder = 1
      OnClick = ThisChkBoxClick
    end
  end
  object SelectBitBtn: TBitBtn
    Left = 340
    Top = 284
    Width = 75
    Height = 25
    Caption = 'Select'
    TabOrder = 2
    OnClick = SelectBitBtnClick
    Kind = bkOK
  end
  object CloseBitBtn: TBitBtn
    Left = 340
    Top = 312
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkClose
  end
  object FuncGrpBox: TGroupBox
    ParentBackground = False
    Left = 336
    Top = 128
    Width = 87
    Height = 105
    Caption = 'Function'
    TabOrder = 4
    object AddBitBtn: TBitBtn
      Left = 4
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
      Left = 4
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
      Left = 4
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
  object GoToGrpBox: TGroupBox
    ParentBackground = False
    Left = 336
    Top = 8
    Width = 105
    Height = 49
    Caption = 'Go To'
    TabOrder = 5
    object ContactsBitBtn: TBitBtn
      Left = 6
      Top = 16
      Width = 91
      Height = 25
      Caption = 'Contacts'
      TabOrder = 0
      OnClick = ContactsBitBtnClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
        BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
        BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
        BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
        BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
        EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
        EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
        EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
        EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
      NumGlyphs = 2
    end
  end
  object DispPanel: TPanel
    ParentBackground = False
    Left = 9
    Top = 305
    Width = 313
    Height = 57
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 6
    object DBBranchText: TDBText
      Left = 91
      Top = 3
      Width = 206
      Height = 17
      DataField = 'Name'
      DataSource = DetsSRC
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBBPhoneText: TDBText
      Left = 91
      Top = 19
      Width = 206
      Height = 13
      DataField = 'Phone'
      DataSource = DetsSRC
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBBFaxText: TDBText
      Left = 91
      Top = 35
      Width = 206
      Height = 15
      DataField = 'Fax_Number'
      DataSource = DetsSRC
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelName: TLabel
      Left = 28
      Top = 2
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object LabelPhone: TLabel
      Left = 28
      Top = 18
      Width = 34
      Height = 13
      Caption = 'Phone:'
    end
    object LabelFax: TLabel
      Left = 28
      Top = 34
      Width = 20
      Height = 13
      Caption = 'Fax:'
    end
  end
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 136
    Top = 24
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From Supplier_Branch'
      'Where '
      '      ('
      '      (Name Like :Code_From) or'
      '      (Account_Code Like :Code_From)'
      '      ) and'
      '      (Supplier = :Supplier) '
      'Order By Name')
    Left = 24
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Code_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Code_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 200
    Top = 152
  end
  object GetODueEnqDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT  distinct Supplier_Branch.Name, Supplier_Branch.Branch_No' +
        ','
      '      Supplier_Branch.Fax_Number, Supplier_Branch.Phone'
      'FROM Supplier_Branch, EnquiryLine, Supplier_Enquiry'
      'WHERE (EnquiryLine.Req_Response_Date < :ODue_Date ) and'
      '      (Supplier_Enquiry.Act_Response_Date is Null) and'
      '      (Supplier_Enquiry.Supplier = :Supplier) and'
      '      (EnquiryLine.Line = Supplier_Enquiry.Line) AND'
      '      (EnquiryLine.Enquiry = Supplier_Enquiry.Enquiry) AND'
      '      (Supplier_Branch.Supplier = Supplier_Enquiry.Supplier) AND'
      
        '      (Supplier_Branch.Branch_No = Supplier_Enquiry.Branch_No) A' +
        'ND'
      '      (Supplier_Branch.Name Like :Code_From) '
      'Order By Supplier_Branch.Name'
      ' ')
    Left = 104
    Top = 112
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'ODue_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Code_From'
        ParamType = ptUnknown
      end>
  end
end
