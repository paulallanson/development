object PBRSPOnotonJBfrm: TPBRSPOnotonJBfrm
  Left = 5
  Top = 33
  Caption = 'Purchase Orders not in Job Bags'
  ClientHeight = 443
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object stsDetails: TStatusBar
    Left = 0
    Top = 424
    Width = 768
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 383
    Width = 768
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      768
      41)
    object PreviewReportBitBtn: TBitBtn
      Left = 499
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Preview'
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
      OnClick = PreviewReportBitBtnClick
    end
    object PrintReportBitBtn: TBitBtn
      Left = 587
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Print'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = PrintReportBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 677
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 2
    end
    object chkbxIncCallOffs: TCheckBox
      Left = 16
      Top = 12
      Width = 157
      Height = 17
      Caption = 'Include Call Off Orders'
      TabOrder = 3
      OnClick = chkbxIncCallOffsClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 81
    Width = 768
    Height = 302
    Align = alClient
    DataSource = dtsReport
    DrawingStyle = gdsGradient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Purchase_Order'
        Title.Caption = 'PO Number'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Point'
        Title.Caption = 'Date'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer_Name'
        Title.Caption = 'Customer'
        Width = 173
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customers_Desc'
        Title.Caption = 'Description'
        Width = 178
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Supplier_name'
        Title.Caption = 'Supplier'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rep_Name'
        Title.Caption = 'Rep'
        Width = 155
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 768
    Height = 81
    Align = alTop
    ParentBackground = False
    TabOrder = 3
    object rgCustomer: TRadioGroup
      Left = 8
      Top = 8
      Width = 113
      Height = 65
      Caption = 'By Customer'
      ItemIndex = 0
      Items.Strings = (
        'All Customers'
        'One Customer ')
      ParentBackground = False
      TabOrder = 0
      OnClick = rgCustomerClick
    end
    object pnlCustSearch: TPanel
      Left = 128
      Top = 8
      Width = 329
      Height = 65
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object lblCustBran: TLabel
        Left = 8
        Top = 8
        Width = 94
        Height = 13
        Caption = 'Customer / Branch'
      end
      object edtCustomer: TEdit
        Left = 8
        Top = 24
        Width = 257
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object btnCustomer: TButton
        Left = 288
        Top = 24
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnCustomerClick
      end
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purchase_OrderLine.Customer,'
      '        Purchase_OrderLine.Branch_no,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer.Name as Customer_Name,'
      '        Purchase_OrderLine.Cust_Order_No,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Purchase_OrderLine.Quantity,'
      '        Purchase_OrderLine.Order_Price,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Purchase_OrderLine.Sell_Unit,'
      '        Purchase_OrderLine.Order_Unit,'
      '        Rep.Name as Rep_Name,'
      '        Price_Unit.Description as Cost_Unit_Description,'
      '        Price_Unit.Price_Unit_Factor as Cost_Factor,'
      '        Price_Unit_sell.Description as Sell_Unit_Description,'
      '        Price_Unit_sell.Price_Unit_Factor as Sell_Factor,'
      '        Purchase_Order.Date_Point,'
      '        Supplier_Branch.Name as Supplier_branch_Name,'
      '        Supplier.Name as Supplier_name,'
      '        Job_Bag_Line_Dets.Job_Bag'
      'FROM (Supplier'
      '      INNER JOIN Supplier_Branch ON'
      '        Supplier.Supplier = Supplier_Branch.Supplier)'
      '      INNER JOIN (Rep'
      '      INNER JOIN(Purchase_Order'
      '      INNER JOIN ((Customer'
      '      INNER JOIN Customer_Branch ON'
      '        Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN ((Price_Unit AS Price_Unit_sell'
      '      INNER JOIN (Price_Unit'
      '      INNER JOIN Purchase_OrderLine ON'
      
        '        Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) O' +
        'N'
      
        '        Price_Unit_sell.Price_Unit = Purchase_OrderLine.Sell_Uni' +
        't)'
      '      LEFT JOIN Job_Bag_Line_Dets ON'
      '        (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.P' +
        'urchase_Order)) ON'
      
        '        (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_n' +
        'o) AND'
      
        '        (Customer_Branch.Customer = Purchase_OrderLine.Customer)' +
        ') ON'
      
        '        Purchase_Order.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order) ON'
      '        Rep.Rep = Purchase_OrderLine.Rep) ON'
      
        '        (Supplier_Branch.Branch_no = Purchase_Order.Branch_No) A' +
        'ND'
      '        (Supplier_Branch.Supplier = Purchase_Order.Supplier)'
      'WHERE Job_bag is null'
      ' ')
    Left = 240
    Top = 52
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 184
    Top = 48
  end
end
