object STRSStkBalRepfrm: TSTRSStkBalRepfrm
  Left = 176
  Top = 121
  BorderStyle = bsDialog
  Caption = 'Stock Balance Report'
  ClientHeight = 344
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  DesignSize = (
    418
    344)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlExportPrgrss: TPanel
    Left = 64
    Top = 136
    Width = 289
    Height = 61
    TabOrder = 14
    Visible = False
    object lblExporting: TLabel
      Left = 16
      Top = 12
      Width = 53
      Height = 13
      Caption = 'Exporting...'
    end
    object prgbrExport: TProgressBar
      Left = 16
      Top = 32
      Width = 257
      Height = 16
      Step = 1
      TabOrder = 0
    end
  end
  object CloseBitBtn: TBitBtn
    Left = 6
    Top = 311
    Width = 75
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Kind = bkCancel
  end
  object PreviewBitBtn: TBitBtn
    Left = 88
    Top = 279
    Width = 75
    Height = 25
    Caption = 'Pre&view'
    TabOrder = 1
    OnClick = PreviewBitBtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
  end
  object PrintBitBtn: TBitBtn
    Left = 171
    Top = 279
    Width = 75
    Height = 25
    Caption = '&Print'
    TabOrder = 2
    OnClick = PrintBitBtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object grpbxRange: TGroupBox
    Left = 8
    Top = 132
    Width = 305
    Height = 81
    Caption = 'Product Range'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 14
      Top = 32
      Width = 23
      Height = 13
      Caption = 'From'
    end
    object Label2: TLabel
      Left = 14
      Top = 60
      Width = 13
      Height = 13
      Caption = 'To'
    end
    object edtPartFrom: TEdit
      Left = 66
      Top = 24
      Width = 183
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edtPartFromChange
    end
    object edtPartTo: TEdit
      Left = 66
      Top = 52
      Width = 185
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object btbtnPartFrom: TBitBtn
      Left = 264
      Top = 22
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btbtnPartFromClick
    end
    object btbtnPartTo: TBitBtn
      Left = 264
      Top = 50
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btbtnPartToClick
    end
  end
  object rdgrpSort: TRadioGroup
    Left = 320
    Top = 132
    Width = 89
    Height = 81
    Caption = 'Show Stores'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'No'
      'Yes')
    ParentFont = False
    TabOrder = 4
    OnClick = rdgrpSortClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 216
    Width = 305
    Height = 57
    TabOrder = 5
    object ChkBxExcProd: TCheckBox
      Left = 17
      Top = 35
      Width = 200
      Height = 16
      Caption = 'Exclude Products not in use'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chkbxNumbers: TCheckBox
      Left = 16
      Top = 8
      Width = 273
      Height = 17
      Caption = 'Show serial numbers held in stock'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object AllOrOneRadioGroup: TRadioGroup
    Left = 8
    Top = 0
    Width = 137
    Height = 65
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'All Reps'
      'One Rep')
    ParentFont = False
    TabOrder = 6
    OnClick = AllOrOneRadioGroupClick
  end
  object RepGrpBox: TGroupBox
    Left = 152
    Top = 0
    Width = 265
    Height = 65
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Visible = False
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 13
      Caption = 'Selected Rep'
    end
    object RepLUSpeedButton: TSpeedButton
      Left = 232
      Top = 28
      Width = 25
      Height = 25
      Hint = 'Select a specific customer rep'
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = RepLUSpeedButtonClick
    end
    object RepEdit: TEdit
      Left = 8
      Top = 32
      Width = 217
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
  object CustRadioGroup: TRadioGroup
    Left = 8
    Top = 65
    Width = 137
    Height = 65
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'All Customers'
      'One Customer')
    ParentFont = False
    TabOrder = 8
    OnClick = CustRadioGroupClick
  end
  object CustGrpBox: TGroupBox
    Left = 153
    Top = 65
    Width = 265
    Height = 65
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    Visible = False
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 89
      Height = 13
      Caption = 'Selected Customer'
    end
    object CustLuSpeedButton: TSpeedButton
      Left = 232
      Top = 28
      Width = 25
      Height = 25
      Hint = 'Select a specific customer rep'
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = CustLuSpeedButtonClick
    end
    object CustEdit: TEdit
      Left = 8
      Top = 32
      Width = 217
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
  object FaxBitBtn: TBitBtn
    Left = 253
    Top = 279
    Width = 75
    Height = 25
    Caption = '&Fax'
    TabOrder = 10
    OnClick = FaxBitBtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
      333333333333337FF3333333333333903333333333333377FF33333333333399
      03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
      99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
      99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
      03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
      33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
      33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
      3333777777333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object EmailBitBtn: TBitBtn
    Left = 335
    Top = 279
    Width = 75
    Height = 25
    Caption = '&Email'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = EmailBitBtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
      000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
      FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
      FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
      9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
      0000777777777777777733333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object OleContainer1: TOleContainer
    Left = 316
    Top = 220
    Width = 98
    Height = 53
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 12
    Visible = False
  end
  object btbtnExcel: TBitBtn
    Left = 7
    Top = 280
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Excel'
    TabOrder = 13
    OnClick = btbtnExcelClick
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A6000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00A407070700FF
      FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFFA407070700FF
      FFFFFFFFFFFF07FFFFFF00000000000707070707070707070707A407070700FF
      FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA407000700FF
      FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA400000700FF
      FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFF000000000000
      00000000000000000000A4070707000707070707070700070707A40707070007
      07000700070700070707A4070707000707000000070700070707A40707070007
      07000700070700070707A4A4A4A400A4A4A400A4A4A400A4A4A4}
  end
  object GetPartsSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Distinct Customer.Name AS CustName,'
      '    Customer_Branch.Name as Branchname,'
      '    Part.Customer,'
      '    Part.Branch_No AS Custbranch,'
      '    Customer_Branch.Fax_Number,'
      '    Customer_Branch.Email,'
      '    Rep.Rep,'
      '    Rep.Name as RepName'
      
        'FROM ((Customer RIGHT JOIN ((part INNER JOIN (store_stock INNER ' +
        'JOIN'
      
        '    part_store_Levels ON store_stock.Part = part_store_Levels.Pa' +
        'rt)'
      '    ON part.Part = store_stock.Part)'
      
        '    LEFT JOIN Customer_Branch ON (part.Branch_no = Customer_Bran' +
        'ch.Branch_no)'
      '    AND (part.Customer = Customer_Branch.Customer))'
      '    ON Customer.Customer = Customer_Branch.Customer)'
      
        '    LEFT JOIN Reps_Branches ON (Customer_Branch.Branch_no = Reps' +
        '_Branches.Branch_no)'
      '    AND (Customer_Branch.Customer = Reps_Branches.Customer))'
      '    LEFT JOIN Rep ON Reps_Branches.Rep = Rep.Rep'
      
        'where      ((Store_Stock.Part >= :PartFrom) and (Store_Stock.Par' +
        't <= :PartTo)) and'
      
        '            ((part.not_in_use <> :Not_in_Use) or (:Not_In_use = ' +
        #39#39')) and'
      
        '        ((part_store_levels.part is not null) or (store_stock.pa' +
        'rt is not null))  and'
      '          ((Part.Customer = :Customer) or (:Customer = 0)) and'
      '          ((:Rep = 0) or (Rep.Rep = :Rep))'
      'Order By Customer.Name,'
      '    Customer_Branch.Name,'
      '    Part.Customer,'
      '    Part.Branch_No,'
      '    Customer_Branch.Fax_Number,'
      '    Customer_Branch.Email,'
      '    Rep.Rep,'
      '    Rep.Name'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 368
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PartFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PartTo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Not_in_Use'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Not_In_use'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
end
