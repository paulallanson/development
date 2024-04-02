object CSLUSupBrchFrm: TCSLUSupBrchFrm
  Left = 195
  Top = 104
  Caption = 'Look-Up A Branch'
  ClientHeight = 358
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object SuppLabel: TLabel
    Left = 8
    Top = 6
    Width = 54
    Height = 13
    Caption = 'SuppLabel'
  end
  object CountLabel: TLabel
    Left = 270
    Top = 224
    Width = 59
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
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
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
    Left = 8
    Top = 248
    Width = 313
    Height = 49
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
  end
  object SelectBitBtn: TBitBtn
    Left = 340
    Top = 276
    Width = 75
    Height = 25
    Caption = 'Select'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = SelectBitBtnClick
  end
  object CloseBitBtn: TBitBtn
    Left = 340
    Top = 304
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 3
  end
  object ThisChkBox: TCheckBox
    Left = 16
    Top = 224
    Width = 185
    Height = 17
    Caption = 'Head Office'
    TabOrder = 4
    OnClick = ThisChkBoxClick
  end
  object FuncGrpBox: TGroupBox
    Left = 336
    Top = 128
    Width = 87
    Height = 105
    Caption = 'Function'
    TabOrder = 5
    object AddBitBtn: TBitBtn
      Left = 4
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
      Left = 4
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
      Left = 4
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
  end
  object GoToGrpBox: TGroupBox
    Left = 336
    Top = 8
    Width = 105
    Height = 81
    Caption = 'Go To'
    TabOrder = 6
    object ContactsBitBtn: TBitBtn
      Left = 6
      Top = 16
      Width = 91
      Height = 25
      Caption = 'Contacts'
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
      TabOrder = 0
      OnClick = ContactsBitBtnClick
    end
    object CapBitBtn: TBitBtn
      Left = 6
      Top = 48
      Width = 91
      Height = 25
      Caption = 'Capabilities'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
        1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
        1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
        193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
        11155557F755F777777555000755033305555577755F75F77F55555555503335
        0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
        05555757F75F75557F5505000333555505557F777FF755557F55000000355557
        07557777777F55557F5555000005555707555577777FF5557F55553000075557
        0755557F7777FFF5755555335000005555555577577777555555}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = CapBitBtnClick
    end
  end
  object DispPanel: TPanel
    Left = 9
    Top = 297
    Width = 313
    Height = 57
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 7
    object DBBranchText: TDBText
      Left = 91
      Top = 3
      Width = 206
      Height = 17
      DataField = 'Name'
      DataSource = DetsSRC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelName: TLabel
      Left = 28
      Top = 2
      Width = 32
      Height = 13
      Caption = 'Name:'
    end
    object LabelPhone: TLabel
      Left = 28
      Top = 18
      Width = 36
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
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
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
        Name = 'Code_From'
      end
      item
        Name = 'Code_From'
      end
      item
        Name = 'Supplier'
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
        Name = 'ODue_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Code_From'
      end>
  end
end
