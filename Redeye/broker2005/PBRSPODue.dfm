object PBRSPODueFrm: TPBRSPODueFrm
  Left = 420
  Top = 112
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'P.O.s Due For Delivery'
  ClientHeight = 324
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    427
    324)
  TextHeight = 13
  object SupplierLabel: TLabel
    Left = 152
    Top = 16
    Width = 77
    Height = 13
    Caption = 'Supplier/Branch'
    Visible = False
  end
  object DateLabel: TLabel
    Left = 8
    Top = 260
    Width = 67
    Height = 13
    Caption = 'ie: Due before'
  end
  object Label1: TLabel
    Left = 8
    Top = 228
    Width = 72
    Height = 13
    Caption = 'Due in the next'
  end
  object Label2: TLabel
    Left = 152
    Top = 228
    Width = 25
    Height = 13
    Caption = 'days.'
  end
  object LUSuppSpeedButton: TSpeedButton
    Left = 392
    Top = 32
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    OnClick = LUSuppSpeedButtonClick
  end
  object Customerlbl: TLabel
    Left = 152
    Top = 88
    Width = 83
    Height = 13
    Caption = 'Customer/Branch'
    Visible = False
  end
  object LUCustSpeedButton: TSpeedButton
    Left = 392
    Top = 104
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    OnClick = LUCustSpeedButtonClick
  end
  object luOperatorSpeedbutton: TSpeedButton
    Left = 392
    Top = 176
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    OnClick = luOperatorSpeedbuttonClick
  end
  object operatorlbl: TLabel
    Left = 152
    Top = 160
    Width = 85
    Height = 13
    Caption = 'Account Manager'
    Visible = False
  end
  object OleContainer1: TOleContainer
    Left = 200
    Top = 104
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 12
    Visible = False
  end
  object AllOrOneRadioGroup: TRadioGroup
    ParentBackground = False
    Left = 8
    Top = 8
    Width = 121
    Height = 65
    ItemIndex = 0
    Items.Strings = (
      'All Suppliers'
      'One Supplier')
    TabOrder = 0
    OnClick = AllOrOneRadioGroupClick
  end
  object PrintBitBtn: TBitBtn
    Left = 264
    Top = 288
    Width = 75
    Height = 25
    Caption = '&Print'
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
    TabOrder = 1
    OnClick = PrintBitBtnClick
  end
  object PreviewBitBtn: TBitBtn
    Left = 184
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Pre&view'
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
    TabOrder = 2
    OnClick = PreviewBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 8
    Top = 288
    Width = 75
    Height = 25
    Caption = '&Cancel'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object DateEdit: TEdit
    Left = 96
    Top = 256
    Width = 217
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object SuppEdit: TEdit
    Left = 152
    Top = 32
    Width = 233
    Height = 21
    ReadOnly = True
    TabOrder = 5
    Visible = False
  end
  object DaysSpinEdit: TSpinEdit
    Left = 96
    Top = 224
    Width = 49
    Height = 22
    MaxLength = 3
    MaxValue = 200
    MinValue = 0
    TabOrder = 6
    Value = 30
    OnChange = DaysSpinEditChange
  end
  object customerrg: TRadioGroup
    ParentBackground = False
    Left = 8
    Top = 80
    Width = 121
    Height = 65
    ItemIndex = 0
    Items.Strings = (
      'All Customers'
      'One Customer')
    TabOrder = 7
    OnClick = customerrgClick
  end
  object CustEdit: TEdit
    Left = 152
    Top = 104
    Width = 233
    Height = 21
    ReadOnly = True
    TabOrder = 8
    Visible = False
  end
  object chkbxBranches: TCheckBox
    Left = 152
    Top = 128
    Width = 201
    Height = 17
    Caption = 'Report on all branches'
    Checked = True
    State = cbChecked
    TabOrder = 9
    Visible = False
  end
  object EmailBitBtn: TBitBtn
    Left = 344
    Top = 288
    Width = 75
    Height = 25
    Caption = '&Email'
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
    TabOrder = 10
    OnClick = EmailBitBtnClick
  end
  object btnExcel: TBitBtn
    Left = 104
    Top = 288
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Excel'
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
    TabOrder = 11
    OnClick = btnExcelClick
    ExplicitLeft = 100
  end
  object pnlExportPrgrss: TPanel
    ParentBackground = False
    Left = 82
    Top = 68
    Width = 289
    Height = 61
    TabOrder = 13
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
  object Operatorrg: TRadioGroup
    ParentBackground = False
    Left = 8
    Top = 152
    Width = 121
    Height = 65
    ItemIndex = 0
    Items.Strings = (
      'All Account Mgrs'
      'One Account Mgr')
    TabOrder = 14
    OnClick = OperatorrgClick
  end
  object Operatoredit: TEdit
    Left = 152
    Top = 176
    Width = 233
    Height = 21
    ReadOnly = True
    TabOrder = 15
    Visible = False
  end
  object GetPOsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT '
      #9'Supplier.Name, '
      #9'Supplier_Branch.Name AS Branchname, '
      #9'Purchase_Order.Supplier, '
      #9'Purchase_Order.Branch_No AS suppbranch, '
      #9'Supplier_Branch.Fax_Number, '
      #9'Supplier_BranchContacts.Email, '
      #9'ExportFilter.Description AS export_filter_desc, '
      #9'ExportFilter.ExportFilter,'
      #9#39' '#39' AS CC_Email, '
      #9'Supplier_BranchContacts.Contact_no, '
      #9'Supplier_BranchContacts.Name as Contact_Name,'
      #9'Supplier_BranchContacts.Fax_Number as Contact_Fax_Number,'
      ' '#9'Supplier_BranchContacts.Salutation'
      'FROM ExportFilter'
      #9'RIGHT JOIN (((Supplier '
      #9'INNER JOIN Supplier_Branch '
      #9#9'ON Supplier.Supplier = Supplier_Branch.Supplier) '
      #9'INNER JOIN Supplier_BranchContacts '
      
        #9#9'ON (Supplier_Branch.Branch_no = Supplier_BranchContacts.Branch' +
        '_no) AND (Supplier_Branch.Supplier = Supplier_BranchContacts.Sup' +
        'plier)) '
      #9'INNER JOIN ((Purch_Ord_Line_Status '
      #9'INNER JOIN (Form_Reference RIGHT JOIN (Customer '
      #9'INNER JOIN Purchase_OrderLine '
      #9#9'ON Customer.Customer = Purchase_OrderLine.Customer) '
      
        #9#9'ON Form_Reference.Form_Reference = Purchase_OrderLine.Form_Ref' +
        'erence) '
      
        #9#9'ON Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Orde' +
        'rLine.Purch_Ord_Line_Status) '
      #9'INNER JOIN (Purchase_Order '
      #9'INNER JOIN Delivery_Detail '
      
        #9#9'ON Purchase_Order.Purchase_Order = Delivery_Detail.Purchase_Or' +
        'der) '
      
        #9#9'ON (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchas' +
        'e_Order) '
      #9#9#9'AND (Purchase_OrderLine.Line = Delivery_Detail.Line) '
      
        #9#9#9'AND (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purc' +
        'hase_Order)) '
      
        #9#9'ON (Supplier_BranchContacts.Contact_no = Purchase_Order.Contac' +
        't_No) '
      
        #9#9#9'AND (Supplier_BranchContacts.Branch_no = Purchase_Order.Branc' +
        'h_No) '
      
        #9#9#9'AND (Supplier_BranchContacts.Supplier = Purchase_Order.Suppli' +
        'er)) '
      
        #9#9'ON ExportFilter.ExportFilter = Supplier_BranchContacts.ExportF' +
        'ilter'
      'where ('
      '      (Purchase_orderline.Inactive <> '#39'Y'#39') or'
      '      (Purchase_orderline.Inactive is null)'
      '      ) and'
      '      (delivery_detail.date_point < :ODue_Date) and'
      '       ('
      '       (delivery_detail.date_deliv_actual is null)'
      '       ) and'
      '       ('
      
        '       ((purchase_orderline.purch_ord_line_status >= 20) and (pu' +
        'rchase_orderline.purch_ord_line_status <= 21)) OR'
      '       (purchase_orderline.Ready_to_Invoice = '#39'Y'#39')'
      '       ) and'
      '     (((Supplier_Branch.Supplier = :Supplier) and'
      '               (Supplier_Branch.Branch_no = :Branch_No ) and'
      
        '               ((Supplier_BranchContacts.Contact_no = :Contact_n' +
        'o) or (:Contact_no = 0))) or'
      '       (:Supplier = 0)) and'
      
        '     (((Purchase_OrderLine.Customer = :Customer) or (:Customer =' +
        ' 0)) and ((Purchase_OrderLine.Branch_no = :CustBranch) or (:Cust' +
        'Branch = 999))) and'
      
        '     ((Purchase_Order.Office_Contact = :Account_Manager) or (:Ac' +
        'count_Manager = 0))'
      'Order By Supplier.Name,'
      '    Supplier_Branch.Name,'
      '    Purchase_Order.Supplier,'
      '    Purchase_Order.Branch_No,'
      '    Supplier_Branch.Fax_Number'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 198
    Top = 210
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'ODue_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Supplier'
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
        Name = 'CustBranch'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CustBranch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Manager'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Manager'
        ParamType = ptUnknown
      end>
  end
  object oldGetPOsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Distinct'
      '    Supplier.Name,'
      '    Supplier_Branch.Name as Branchname,'
      '    Purchase_Order.Supplier,'
      '    Purchase_Order.Branch_No AS suppbranch,'
      '    Supplier_Branch.Fax_Number,'
      '    Supplier_Branch.Email,'
      #9'  '#39'Adobe Acrobat Document (*.pdf)'#39' as export_filter_desc,'
      #9'  '#39'PDF'#39' as ExportFilter,'
      '    '#39' '#39' as CC_Email'
      'FROM Form_Reference'
      '    RIGHT JOIN (Supplier'
      '    INNER JOIN ((Purch_Ord_Line_Status'
      '    INNER JOIN (Customer'
      '    INNER JOIN Purchase_OrderLine ON'
      '      Customer.Customer = Purchase_OrderLine.Customer) ON'
      
        '      Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Ord' +
        'erLine.Purch_Ord_Line_Status)'
      '    INNER JOIN (Supplier_Branch'
      '    INNER JOIN (Purchase_Order'
      '    INNER JOIN Delivery_Detail ON'
      
        '      Purchase_Order.Purchase_Order = Delivery_Detail.Purchase_O' +
        'rder) ON'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_No)) ON'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      '      (Purchase_OrderLine.Line = Delivery_Detail.Line) AND'
      
        '      (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purch' +
        'ase_Order)) ON'
      '      Supplier.Supplier = Supplier_Branch.Supplier) ON'
      
        '      Form_Reference.Form_Reference = Purchase_OrderLine.Form_Re' +
        'ference'
      'where ('
      '      (Purchase_orderline.Inactive <> '#39'Y'#39') or'
      '      (Purchase_orderline.Inactive is null)'
      '      ) and'
      '      (delivery_detail.date_point < :ODue_Date) and'
      '       ('
      '       (delivery_detail.date_deliv_actual is null)'
      '       ) and'
      
        '       ((purchase_orderline.purch_ord_line_status >= 20) and (pu' +
        'rchase_orderline.purch_ord_line_status <= 21)) and'
      '     (((Supplier_Branch.Supplier = :Supplier) and'
      '               (Supplier_Branch.Branch_no = :Branch_No )) or'
      '       (:Supplier = 0)) and'
      
        '     (((Purchase_OrderLine.Customer = :Customer) and (Purchase_O' +
        'rderLine.Branch_no = :CustBranch)) or'
      '       (:Customer = 0))'
      'Order By Supplier.Name,'
      '    Supplier_Branch.Name,'
      '    Purchase_Order.Supplier,'
      '    Purchase_Order.Branch_No,'
      '    Supplier_Branch.Fax_Number'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 294
    Top = 210
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'ODue_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CustBranch'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
end
