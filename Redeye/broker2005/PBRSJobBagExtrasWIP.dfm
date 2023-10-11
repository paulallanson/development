object PBRSJobBagExtrasWIPfrm: TPBRSJobBagExtrasWIPfrm
  Left = 2
  Top = 4
  Caption = 'Job Bag Work In Progress - Production Charges'
  ClientHeight = 516
  ClientWidth = 781
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 768
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object pnlControl: TPanel
    Left = 0
    Top = 475
    Width = 781
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      781
      41)
    object pnlRightControl: TPanel
      Left = 450
      Top = 0
      Width = 331
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object PreviewBitBtn: TBitBtn
        Left = 144
        Top = 8
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
        TabOrder = 0
        OnClick = PreviewBitBtnClick
      end
      object PrintBitBtn: TBitBtn
        Left = 232
        Top = 8
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
    end
    object CancelBitBtn: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Cancel'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
    object btnExcel: TBitBtn
      Left = 514
      Top = 8
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
      TabOrder = 2
      OnClick = btnExcelClick
    end
  end
  object pnlDetail: TPanel
    Left = 0
    Top = 201
    Width = 781
    Height = 274
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid: TDBGrid
      Left = 0
      Top = 0
      Width = 781
      Height = 274
      Align = alClient
      DataSource = dsReport
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Job_Bag'
          Title.Caption = 'Job Bag'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date_Point'
          Title.Caption = 'Order Date'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Customer_Name'
          Title.Caption = 'Customer Name'
          Width = 137
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Job_bag_Descr'
          Title.Caption = 'Description'
          Width = 153
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Delivery_Date'
          Title.Caption = 'Delivery Date'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Account_Code'
          Title.Caption = 'Supplier'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cust_Order_No'
          Title.Caption = 'Order Ref'
          Width = 78
          Visible = True
        end>
    end
    object OleContainer1: TOleContainer
      Left = 432
      Top = 64
      Width = 129
      Height = 89
      Caption = 'OleContainer1'
      Color = clBtnFace
      TabOrder = 1
      Visible = False
    end
    object pnlExportPrgrss: TPanel
      Left = 284
      Top = 92
      Width = 289
      Height = 61
      TabOrder = 2
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
  end
  object pnlSelections: TPanel
    Left = 0
    Top = 0
    Width = 781
    Height = 201
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      781
      201)
    object Label3: TLabel
      Left = 8
      Top = 155
      Width = 52
      Height = 13
      Caption = 'Sort first by'
    end
    object Label4: TLabel
      Left = 160
      Top = 155
      Width = 55
      Height = 13
      Caption = 'then sort by'
    end
    object Label5: TLabel
      Left = 312
      Top = 155
      Width = 81
      Height = 13
      Caption = 'and finally sort by'
    end
    object Label1: TLabel
      Left = 415
      Top = 3
      Width = 86
      Height = 13
      Caption = 'Delivery due after:'
    end
    object DateFromButton: TSpeedButton
      Left = 520
      Top = 14
      Width = 25
      Height = 25
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      OnClick = DateFromButtonClick
    end
    object Label2: TLabel
      Left = 415
      Top = 48
      Width = 95
      Height = 13
      Caption = 'Delivery due before:'
    end
    object DateToButton: TSpeedButton
      Left = 520
      Top = 59
      Width = 25
      Height = 25
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      OnClick = DateToButtonClick
    end
    object rgCustomer: TRadioGroup
      Left = 8
      Top = 63
      Width = 100
      Height = 60
      Caption = ' By customer '
      ItemIndex = 0
      Items.Strings = (
        'All Customers'
        'One Customer')
      TabOrder = 0
      OnClick = rgCustomerClick
    end
    object CustomerPanel: TPanel
      Left = 115
      Top = 68
      Width = 281
      Height = 57
      TabOrder = 1
      object lblCustomer: TLabel
        Left = 8
        Top = 1
        Width = 83
        Height = 13
        Caption = 'Customer/Branch'
      end
      object edtCustomer: TEdit
        Left = 8
        Top = 17
        Width = 233
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnCustomer: TButton
        Left = 248
        Top = 16
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCustomerClick
      end
      object chkbxBranches: TCheckBox
        Left = 8
        Top = 38
        Width = 193
        Height = 17
        Caption = 'Report on all branches'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
    object cbSort1: TComboBox
      Left = 8
      Top = 171
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnChange = cbSortChange
      Items.Strings = (
        'Customer'
        'Supplier'
        'Job Bag'
        'Order Date'
        'Delivery Date'
        'Rep'
        'Job Bag Status')
    end
    object cbSort2: TComboBox
      Left = 160
      Top = 171
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      OnChange = cbSortChange
      Items.Strings = (
        'Customer'
        'Supplier'
        'Job Bag'
        'Order Date'
        'Delivery Date'
        'Rep'
        'Job Bag Status')
    end
    object cbSort3: TComboBox
      Left = 312
      Top = 171
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      OnChange = cbSortChange
      Items.Strings = (
        'Customer'
        'Supplier'
        'Job Bag'
        'Order Date'
        'Delivery Date'
        'Rep'
        'Job Bag Status')
    end
    object pnlDates: TPanel
      Left = 557
      Top = 0
      Width = 224
      Height = 201
      Align = alRight
      BevelOuter = bvNone
      Constraints.MinHeight = 201
      Constraints.MinWidth = 224
      TabOrder = 5
      object TotByRadioGroup: TRadioGroup
        Left = 1
        Top = 4
        Width = 136
        Height = 113
        Caption = 'Report Totals'
        ItemIndex = 4
        Items.Strings = (
          'By Customer'
          'By Supplier'
          'By Rep'
          'By Account Manager'
          'Do not total')
        TabOrder = 0
        OnClick = TotByRadioGroupClick
      end
      object rdgrpRepType: TRadioGroup
        Left = 141
        Top = 5
        Width = 79
        Height = 55
        Caption = 'Report Type'
        ItemIndex = 0
        Items.Strings = (
          'Summary'
          'Detail')
        TabOrder = 1
      end
      object chkbxComplete: TCheckBox
        Left = 56
        Top = 176
        Width = 161
        Height = 17
        Caption = 'Show Jobs Fully Despatched'
        TabOrder = 2
        OnClick = chkbxCompleteClick
      end
    end
    object DateFromEdit: TEdit
      Left = 415
      Top = 16
      Width = 98
      Height = 21
      MaxLength = 10
      TabOrder = 6
      OnExit = DateFromEditExit
    end
    object DateToEdit: TEdit
      Left = 415
      Top = 61
      Width = 98
      Height = 21
      MaxLength = 10
      TabOrder = 7
      OnExit = DateToEditExit
    end
    object rgRep: TRadioGroup
      Left = 8
      Top = 2
      Width = 100
      Height = 60
      Caption = ' By Rep'
      ItemIndex = 0
      Items.Strings = (
        'All Reps'
        'One Rep')
      TabOrder = 8
      OnClick = rgRepClick
    end
    object RepPanel: TPanel
      Left = 115
      Top = 8
      Width = 281
      Height = 50
      TabOrder = 9
      Visible = False
      object lblRep: TLabel
        Left = 8
        Top = 4
        Width = 51
        Height = 13
        Caption = 'Rep Name'
      end
      object edtRep: TEdit
        Left = 8
        Top = 20
        Width = 233
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnRep: TButton
        Left = 248
        Top = 19
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnRepClick
      end
    end
    object chkbxPageBreak: TCheckBox
      Left = 463
      Top = 116
      Width = 128
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Page break on total'
      Enabled = False
      TabOrder = 10
    end
    object chkbxShowAllLines: TCheckBox
      Left = 463
      Top = 175
      Width = 144
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Show all outstanding lines'
      TabOrder = 11
      WordWrap = True
      OnClick = chkbxShowAllLinesClick
    end
    object chkbxShowSales: TCheckBox
      Left = 463
      Top = 157
      Width = 145
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Hide sales value'
      TabOrder = 12
    end
    object chkbxExcludeOnHold: TCheckBox
      Left = 463
      Top = 139
      Width = 145
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Exclude on hold items'
      Checked = True
      State = cbChecked
      TabOrder = 13
      OnClick = chkbxExcludeOnHoldClick
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Job_Bag_Line_Dets.Job_Bag, '
      #9'Job_Bag_Line_Dets.Job_Bag_Line, '
      #9'Job_Bag_Line_Dets.Job_Bag_Line_Type, '
      #9'Job_Bag_Line_Dets.Job_Bag_Line_Descr, '
      #9'Job_Bag_Line_Dets.Job_Bag_Line_Cost, '
      #9'Job_Bag_Line_Dets.Job_Bag_Line_Sell, '
      #9'Job_Bag_Line_Dets.Job_Bag_Line_Invoiced, '
      #9'Job_Bag_Line_Dets.Job_Bag_Quantity, '
      #9'Job_Bag_Line_Dets.VAT_Code, '
      #9'Job_Bag_Line_Dets.supp_inv_recd, '
      #9'Job_Bag_Line_Dets.Product_Type, '
      #9'Job_Bag_Line_Dets.works_order, '
      #9'Job_Bag_Line_Dets.sales_order, '
      #9'Job_Bag_Line_Dets.sales_order_line_no, '
      #9'Job_Bag_Line_Dets.price_unit, '
      #9'Job_Bag_Line_Dets.selling_price, '
      #9'Job_Bag.Customer, '
      #9'Job_Bag.Branch_No, '
      #9'Job_Bag.Date_Point, '
      #9'Job_Bag.Cust_Order_No, '
      #9'Job_Bag.Goods_Required as Delivery_Date, '
      #9'Job_Bag.InActive, '
      #9'Job_Bag.Office_Contact, '
      #9'Job_Bag.Job_Bag_Status,'
      '  Job_Bag.Ready_for_Invoicing, '
      #9'Customer_Branch.Account_Code, '
      #9'Customer.Name, Rep.Name, '
      #9'Product_Type.Description, '
      #9'Product_Type.Category, '
      #9'Category.Description, '
      #9'Vat_Code.Vat_Rate, '
      #9'Vat_Code.Description, '
      #9'Operator.Name, '
      #9'Price_Unit.Description, '
      #9'Price_Unit.Price_Unit_Factor'
      'FROM Operator '
      #9'RIGHT JOIN (Category '
      #9'INNER JOIN (Product_Type '
      #9'INNER JOIN (Vat_Code '
      #9'INNER JOIN (Price_Unit '
      #9'INNER JOIN (Rep '
      #9'INNER JOIN (Customer '
      #9'INNER JOIN (Customer_Branch '
      #9'INNER JOIN (Job_Bag '
      #9'INNER JOIN Job_Bag_Line_Dets '
      #9#9'ON Job_Bag.Job_Bag = Job_Bag_Line_Dets.Job_Bag) '
      
        #9#9'ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (Custom' +
        'er_Branch.Customer = Job_Bag.Customer)) '
      #9#9'ON Customer.Customer = Customer_Branch.Customer) '
      #9#9'ON Rep.Rep = Job_Bag.Rep) '
      #9#9'ON Price_Unit.Price_Unit = Job_Bag_Line_Dets.price_unit) '
      #9#9'ON Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code) '
      
        #9#9'ON Product_Type.Product_Type = Job_Bag_Line_Dets.Product_Type)' +
        ' '
      #9#9'ON Category.Category = Product_Type.Category) '
      #9#9'ON Operator.Operator = Job_Bag.Office_Contact'
      'WHERE Job_Bag_Line_Dets.Job_Bag_Line_Type = '#39'A'#39' AND'
      #9#9'Job_Bag_Line_Dets.Job_Bag_Line_Invoiced = '#39'P'#39' OR'
      #9#9'Job_Bag_Line_Dets.Job_Bag_Line_Invoiced = '#39'N'#39' ')
    Left = 408
    Top = 48
  end
  object dsReport: TDataSource
    AutoEdit = False
    DataSet = qryReport
    Left = 400
    Top = 88
  end
  object qryRepName: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Rep.Name'
      'From Rep'
      'Where (Rep.Rep = :sel_rep)'
      ' ')
    Left = 384
    Top = 208
    ParamData = <
      item
        Name = 'sel_rep'
      end>
  end
end
