object PBLUFormRefFrm: TPBLUFormRefFrm
  Left = 168
  Top = 143
  Caption = 'Look-Up Form Reference'
  ClientHeight = 417
  ClientWidth = 507
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
    Left = 80
    Top = 6
    Width = 50
    Height = 13
    Caption = 'CustLabel'
  end
  object CountLabel: TLabel
    Left = 342
    Top = 272
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'CountLabel'
  end
  object BranchLabel: TLabel
    Left = 80
    Top = 22
    Width = 50
    Height = 13
    Caption = 'CustLabel'
  end
  object Label1: TLabel
    Left = 8
    Top = 22
    Width = 38
    Height = 13
    Caption = 'Branch:'
  end
  object Label2: TLabel
    Left = 8
    Top = 6
    Width = 52
    Height = 13
    Caption = 'Customer:'
  end
  object RefDBGrid: TDBGrid
    Left = 8
    Top = 40
    Width = 393
    Height = 225
    DataSource = DetsSRC
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnColEnter = RefDBGridColEnter
    OnDblClick = RefDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Form_Reference_ID'
        Title.Caption = 'Form Reference'
        Width = 217
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stock_Reference'
        Title.Caption = 'Stock Reference'
        Width = 143
        Visible = True
      end>
  end
  object SearchGrpBox: TGroupBox
    Left = 8
    Top = 288
    Width = 321
    Height = 49
    Caption = 'Type here to narrow the search'
    ParentBackground = False
    TabOrder = 1
    object NameEdit: TEdit
      Left = 8
      Top = 16
      Width = 305
      Height = 21
      TabOrder = 0
      OnChange = NameEditChange
    end
  end
  object SelectBitBtn: TBitBtn
    Left = 412
    Top = 332
    Width = 75
    Height = 25
    Caption = 'Select'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = SelectBitBtnClick
  end
  object CloseBitBtn: TBitBtn
    Left = 412
    Top = 360
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 3
  end
  object FuncGrpBox: TGroupBox
    Left = 408
    Top = 160
    Width = 87
    Height = 105
    Caption = 'Function'
    ParentBackground = False
    TabOrder = 4
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
  object DispPanel: TPanel
    Left = 8
    Top = 342
    Width = 321
    Height = 43
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    ParentBackground = False
    TabOrder = 5
    object DBContactText: TDBText
      Left = 83
      Top = 3
      Width = 230
      Height = 17
      DataField = 'Form_Reference_Descr'
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
      Width = 62
      Height = 13
      Caption = 'Description:'
    end
  end
  object btbtnImages: TBitBtn
    Left = 416
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Images'
    TabOrder = 6
    OnClick = btbtnImagesClick
  end
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 344
    Top = 8
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'#9'Form_Reference.Customer, '
      #9#9'Form_Reference.Branch_No, '
      #9#9'Form_Reference.Form_Reference, '
      #9#9'Form_Reference.Form_Reference_Descr, '
      #9#9'Form_Reference.Form_Reference_ID, '
      #9#9'Form_Reference.Reorder_Level, '
      #9#9'Form_Reference.Stocked_Item, '
      #9#9'Form_Reference.Stock_Reference, '
      #9#9'Part.Global_Product, Part.Part, '
      #9#9'Customer.Name as Customer_Name, '
      #9#9'Customer_Branch.Name as Branch_Name'
      'FROM Customer '
      #9#9'INNER JOIN (Customer_Branch '
      #9#9'INNER JOIN (Part '
      #9#9'RIGHT JOIN Form_Reference '
      #9#9#9'ON Part.Part = Form_Reference.Stock_Reference) '
      
        #9#9#9'ON (Customer_Branch.Branch_no = Form_Reference.Branch_No) AND' +
        ' (Customer_Branch.Customer = Form_Reference.Customer)) '
      #9#9#9'ON Customer.Customer = Customer_Branch.Customer'
      
        'WHERE ((Form_Reference_ID Like :Code_From) or (Form_Reference_De' +
        'scr Like :Code_From) or (Stock_Reference Like :Code_From)) and'
      '      ((Form_Reference.Customer = :Customer) and'
      
        '      (Form_Reference.Branch_No = :Branch_No) OR (Part.Global_Pr' +
        'oduct = '#39'Y'#39'))'
      'order by Form_reference_id')
    Left = 368
    Top = 72
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
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end>
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 200
    Top = 152
  end
end
