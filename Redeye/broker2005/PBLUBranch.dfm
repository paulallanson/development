object PBLUBranchFrm: TPBLUBranchFrm
  Left = 179
  Top = 124
  BorderStyle = bsDialog
  Caption = 'Look-Up A Branch'
  ClientHeight = 433
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    451
    433)
  TextHeight = 13
  object CustLabel: TLabel
    Left = 8
    Top = 6
    Width = 50
    Height = 13
    Caption = 'CustLabel'
  end
  object CountLabel: TLabel
    Left = 270
    Top = 224
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'CountLabel'
  end
  object pnlImport: TPanel
    Left = 24
    Top = 112
    Width = 377
    Height = 97
    ParentBackground = False
    TabOrder = 8
    Visible = False
    object lblImport: TLabel
      Left = 16
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Importing'
    end
    object lblProgress: TLabel
      Left = 232
      Top = 64
      Width = 121
      Height = 13
      Alignment = taRightJustify
      Caption = 'x of y Records Imported'
    end
    object ProgressBar1: TProgressBar
      Left = 16
      Top = 40
      Width = 337
      Height = 16
      Step = 1
      TabOrder = 0
    end
  end
  object DetsDBGrid: TDBGrid
    Left = 8
    Top = 24
    Width = 320
    Height = 193
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
        FieldName = 'Name'
        Title.Caption = 'Branch Name'
        Width = 284
        Visible = True
      end>
  end
  object SearchGrpBox: TGroupBox
    Left = 8
    Top = 242
    Width = 313
    Height = 63
    Caption = 'Type here to narrow the search'
    ParentBackground = False
    TabOrder = 1
    object NameEdit: TEdit
      Left = 8
      Top = 16
      Width = 297
      Height = 21
      TabOrder = 0
      OnChange = NameEditChange
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 42
      Width = 209
      Height = 17
      Caption = 'Only show active branches'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = chkbxShowInactiveClick
    end
  end
  object SelectBitBtn: TBitBtn
    Left = 343
    Top = 356
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Select'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = SelectBitBtnClick
  end
  object CloseBitBtn: TBitBtn
    Left = 343
    Top = 384
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'C&lose'
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
    Top = 120
    Width = 89
    Height = 109
    Caption = 'Function'
    ParentBackground = False
    TabOrder = 5
    object DelBitBtn: TBitBtn
      Left = 6
      Top = 76
      Width = 75
      Height = 25
      Caption = '&Delete'
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
      TabOrder = 0
      OnClick = DelBitBtnClick
    end
    object ChgBitBtn: TBitBtn
      Left = 6
      Top = 45
      Width = 75
      Height = 25
      Caption = '&Change'
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
    object AddBitBtn: TBitBtn
      Left = 6
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Add'
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
      TabOrder = 2
      OnClick = AddBitBtnClick
    end
  end
  object GoToGrpBox: TGroupBox
    Left = 336
    Top = 8
    Width = 89
    Height = 103
    Caption = 'Go To'
    ParentBackground = False
    TabOrder = 6
    object ContactsBitBtn: TBitBtn
      Left = 6
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Contacts'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        003333377777777777F3333091111111103333F7F3F3F3F3F7F3311098080808
        10333777F737373737F313309999999910337F373F3F3F3F3733133309808089
        03337FFF7F7373737FFF1000109999901000777777FFFFF77777701110000000
        111037F337777777F3373099901111109990373F373333373337330999999999
        99033373FFFFFFFFFF7333310000000001333337777777777733333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = ContactsBitBtnClick
    end
    object CRepsBitBtn: TBitBtn
      Left = 6
      Top = 44
      Width = 75
      Height = 25
      Caption = 'Reps'
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
      TabOrder = 1
      OnClick = CRepsBitBtnClick
    end
    object FormRefBitBtn: TBitBtn
      Left = 6
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Stock'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555550
        00555555555FFF57775F55555500050BBB0555FFF57775777775500050EEE000
        777057775777777775F709990777777770F0777775FFFFFFF7F7099990000000
        F0F07F5557777777F7F70FFFFFFFFFF0F0F07F5555555557F7F70FFFFFFFFFF0
        F0F07F5555555557F7F70FFFFFFFFFF0F0F07F5FF5FF5F57F7F70F77F77F7FF0
        F0F07F7757757557F7F70FFFFFFFFFF0F0F07F5FF5FFF557F7F70F77F777FFF0
        F0F07F7757775557F7F70FFFFFFFFFF0F0F07FF5F5F5F5F7F7F700F0F0F0F0F0
        F00577F7F7F7F7F7F77F0070707070700005777777777777777F707070707070
        55055757575757575F7555050505050500555575757575757755}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = FormRefBitBtnClick
    end
  end
  object DispPanel: TPanel
    Left = 9
    Top = 340
    Width = 313
    Height = 72
    Anchors = [akLeft, akBottom]
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    ParentBackground = False
    TabOrder = 7
    object DBBranchText: TDBText
      Left = 83
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
    object DBBPhoneText: TDBText
      Left = 83
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
    object DBBFaxText: TDBText
      Left = 83
      Top = 35
      Width = 214
      Height = 15
      DataField = 'Fax_Number'
      DataSource = DetsSRC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
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
    object RepLabel: TLabel
      Left = 28
      Top = 50
      Width = 23
      Height = 13
      Caption = 'Rep:'
    end
    object DBRepText: TDBText
      Left = 83
      Top = 50
      Width = 206
      Height = 17
      DataField = 'Rep_Name'
      DataSource = DetsSRC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object btbtnImport: TBitBtn
    Left = 342
    Top = 235
    Width = 75
    Height = 25
    Caption = '&Import'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
      FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
      00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
      F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
      00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
      F033777777777337F73309999990FFF0033377777777FFF77333099999000000
      3333777777777777333333399033333333333337773333333333333903333333
      3333333773333333333333303333333333333337333333333333}
    NumGlyphs = 2
    TabOrder = 9
    OnClick = btbtnImportClick
  end
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 96
    Top = 80
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'Select top 200 Customer_Branch.*,'
      '       (SELECT top 1 Rep.Name'
      
        #9'FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Re' +
        'p'
      
        #9'WHERE (((Reps_Branches.Customer)=Customer_Branch.Customer) AND ' +
        '((Reps_Branches.Branch_no)=Customer_Branch.Branch_no))) as Rep_N' +
        'ame'
      'From Customer_Branch'
      'Where'
      '      ('
      '      (Customer_Branch.Name Like :Code_from) or'
      '      (Customer_Branch.Account_Code Like :Code_From) or'
      '      (Customer_Branch.Short_Code Like :Code_From)'
      '      )  and'
      
        '      ((inActive = '#39'N'#39') or (inActive = NULL) or (:inactive = '#39'Y'#39 +
        '))'
      '      and (Customer_Branch.Customer = :Customer)'
      'Order By Customer_Branch.Name'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 56
    Top = 80
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 16
    Top = 80
  end
  object OpenDialog1: TOpenDialog
    Filter = 'CSV Files(*.csv)|*.csv'
    Left = 128
    Top = 24
  end
  object qryInsBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into customer_branch'
      '(customer, branch_no, Name, Building_No_name,'
      
        ' Street, Locale, Town, Postcode, phone, Short_Code, HO_Departmen' +
        't)'
      'values'
      '(:custNo, :branchNo, :name, :addr1,'
      ' :addr2, :addr3, :addr4, :postCode, :phone, :code, :HOInd)'
      ''
      ' '
      ' ')
    Left = 240
    Top = 80
    ParamData = <
      item
        Name = 'custNo'
      end
      item
        Name = 'branchNo'
      end
      item
        Name = 'name'
      end
      item
        Name = 'addr1'
      end
      item
        Name = 'addr2'
      end
      item
        Name = 'addr3'
      end
      item
        Name = 'addr4'
      end
      item
        Name = 'postCode'
      end
      item
        Name = 'phone'
      end
      item
        Name = 'code'
      end
      item
        Name = 'HOInd'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryUpdBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update customer_branch'
      'set'
      ' Name = :name,'
      ' Building_No_name = :addr1,'
      ' Street = :addr2,'
      ' Locale = :addr3,'
      ' Town = :addr4,'
      ' Postcode = :postCode,'
      ' Short_Code = :code, '
      ' HO_Department = :HOInd'
      'where customer = :custNo'
      ' and branch_no = :branchNo'
      ' '
      ' ')
    Left = 208
    Top = 80
    ParamData = <
      item
        Name = 'name'
      end
      item
        Name = 'addr1'
      end
      item
        Name = 'addr2'
      end
      item
        Name = 'addr3'
      end
      item
        Name = 'addr4'
      end
      item
        Name = 'postCode'
      end
      item
        Name = 'code'
      end
      item
        Name = 'HOInd'
      end
      item
        Name = 'custNo'
      end
      item
        Name = 'branchNo'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qrySelBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from customer_branch '
      'where customer = :customer and '
      '  Short_Code = :code;')
    Left = 208
    Top = 48
    ParamData = <
      item
        Name = 'customer'
      end
      item
        Name = 'code'
      end>
  end
  object qryNextBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select (max(branch_No)  + 1) as next_branch '
      'from customer_branch '
      'where customer = :customer ')
    Left = 240
    Top = 48
    ParamData = <
      item
        Name = 'customer'
      end>
  end
end
