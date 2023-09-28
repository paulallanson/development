object PBRSProofStatusFrm: TPBRSProofStatusFrm
  Left = 28
  Top = 18
  Caption = 'Proof Status'
  ClientHeight = 496
  ClientWidth = 712
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 640
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlDisplay: TPanel
    Left = 0
    Top = 169
    Width = 712
    Height = 286
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    object dbgrdProofStatus: TDBGrid
      Left = 1
      Top = 1
      Width = 710
      Height = 284
      Align = alClient
      DataSource = dtsrcCurrentProofStatus
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
    end
  end
  object pnlControls: TPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 169
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      712
      169)
    object Label3: TLabel
      Left = 8
      Top = 126
      Width = 57
      Height = 14
      Caption = 'Sort first by'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 160
      Top = 126
      Width = 58
      Height = 14
      Caption = 'then sort by'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 312
      Top = 126
      Width = 86
      Height = 14
      Caption = 'and finally sort by'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object rgCustomer: TRadioGroup
      Left = 6
      Top = 65
      Width = 113
      Height = 58
      Caption = 'By Customer'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'All Customers'
        'One Customer ')
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = rgCustomerClick
    end
    object pnlCustSearch: TPanel
      Left = 126
      Top = 66
      Width = 329
      Height = 57
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object lblCustBran: TLabel
        Left = 8
        Top = 8
        Width = 90
        Height = 14
        Caption = 'Customer / Branch'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object edtCustomer: TEdit
        Left = 8
        Top = 24
        Width = 257
        Height = 23
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
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnCustomerClick
      end
    end
    object pnlStatusSelect: TPanel
      Left = 542
      Top = 4
      Width = 161
      Height = 57
      Anchors = [akTop, akRight]
      ParentBackground = False
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 31
        Height = 14
        Caption = 'Status'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object cmbbxProofStatus: TComboBox
        Left = 8
        Top = 24
        Width = 145
        Height = 23
        TabOrder = 0
        Text = 'In Studio'
        OnChange = cmbbxProofStatusChange
      end
    end
    object cbSort1: TComboBox
      Left = 8
      Top = 140
      Width = 145
      Height = 23
      Style = csDropDownList
      TabOrder = 3
      OnChange = cbSortChange
      Items.Strings = (
        'Order Number'
        'Customer'
        'Status'
        'Status Date'
        'Form Title'
        'Delivery Date'
        'Supplier')
    end
    object cbSort2: TComboBox
      Left = 160
      Top = 140
      Width = 145
      Height = 23
      Style = csDropDownList
      TabOrder = 4
      OnChange = cbSortChange
      Items.Strings = (
        'Order Number'
        'Customer'
        'Status'
        'Status Date'
        'Form Title'
        'Delivery Date'
        'Supplier')
    end
    object cbSort3: TComboBox
      Left = 312
      Top = 140
      Width = 145
      Height = 23
      Style = csDropDownList
      TabOrder = 5
      OnChange = cbSortChange
      Items.Strings = (
        'Order Number'
        'Customer'
        'Status'
        'Status Date'
        'Form Title'
        'Delivery Date'
        'Supplier')
    end
    object rgSupplier: TRadioGroup
      Left = 6
      Top = 4
      Width = 113
      Height = 58
      Caption = 'By Supplier'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'All Suppliers'
        'One Supplier ')
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
      OnClick = rgSupplierClick
    end
    object pnlSuppSearch: TPanel
      Left = 126
      Top = 4
      Width = 329
      Height = 57
      ParentBackground = False
      TabOrder = 7
      Visible = False
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 83
        Height = 14
        Caption = 'Supplier / Branch'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object edtSupplier: TEdit
        Left = 8
        Top = 24
        Width = 257
        Height = 23
        Enabled = False
        TabOrder = 0
      end
      object btnSupplier: TButton
        Left = 288
        Top = 24
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnSupplierClick
      end
    end
  end
  object pnlPrintControl: TPanel
    Left = 0
    Top = 455
    Width = 712
    Height = 41
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object lblRecordCount: TLabel
      Left = 104
      Top = 16
      Width = 3
      Height = 13
    end
    object Label6: TLabel
      Left = 24
      Top = 16
      Width = 69
      Height = 13
      Caption = 'Record Count:'
    end
    object Panel1: TPanel
      Left = 479
      Top = 1
      Width = 232
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object PreviewReportBitBtn: TBitBtn
        Left = 30
        Top = 8
        Width = 75
        Height = 25
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
        Left = 126
        Top = 8
        Width = 75
        Height = 25
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
    end
    object CancelBitBtn: TBitBtn
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object qryCurrentProofStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      ' SELECT'
      '  PHist.Purchase_Order,'
      '  PHist.Line, '
      '  PHist.Proof_Date, '
      '  PHist.Proof_Status,'
      '  Customers_Desc,'
      '  Purchase_OrderLine.Customer,'
      '  Purchase_OrderLine.Branch_no,'
      '  Customer.Name as Customer_Name,'
      '  Goods_Required,'
      '  Purchase_Order.Supplier,'
      '  Purchase_Order.Branch_No,'
      '  Supplier.Name as Supplier_Name,'
      '  Cust_Order_No,'
      '  Purch_Ord_Line_Status,'
      '  Description'
      '  FROM (((((Proof_History PHist'
      
        '  INNER JOIN Proof_Status ON (PHist.Proof_Status = Proof_Status.' +
        'Proof_Status))'
      
        '  INNER JOIN Purchase_OrderLine ON (PHist.Purchase_Order=Purchas' +
        'e_OrderLine.Purchase_Order AND PHist.Line = Purchase_OrderLine.L' +
        'ine)) '
      
        '  INNER JOIN Customer ON (Purchase_OrderLine.Customer=Customer.C' +
        'ustomer))'
      
        '  INNER JOIN Purchase_Order ON (PHist.Purchase_Order = Purchase_' +
        'Order.Purchase_Order))'
      
        '  INNER JOIN Supplier ON (Purchase_Order.Supplier = Supplier.Sup' +
        'plier))'
      
        '  WHERE ((Purchase_OrderLine.Inactive <> '#39'Y'#39') or (Purchase_Order' +
        'Line.Inactive is null)) AND'
      '    (PHist.Proof_Date = (SELECT MAX(Proof_Date)'
      '    FROM Proof_History '
      
        '    WHERE (Purchase_Order = PHist.Purchase_Order AND Line = PHis' +
        't.Line)'
      '  GROUP BY Purchase_Order, Line)'
      '  AND Purch_Ord_Line_Status = 20)'
      ' '
      ' '
      ' ')
    Left = 112
    Top = 160
    object qryCurrentProofStatusPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
      Visible = False
    end
    object qryCurrentProofStatusLine: TIntegerField
      FieldName = 'Line'
      Visible = False
    end
    object qryCurrentProofStatusPOLine: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'POLine'
      OnGetText = qryCurrentProofStatusPOLineGetText
      Calculated = True
    end
    object qryCurrentProofStatusProof_Date: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 10
      FieldName = 'Proof_Date'
    end
    object qryCurrentProofStatusProof_Status: TStringField
      DisplayLabel = 'Status'
      FieldName = 'Proof_Status'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qryCurrentProofStatusCustomers_Desc: TStringField
      DisplayLabel = 'Customers Desc.'
      DisplayWidth = 25
      FieldName = 'Customers_Desc'
      FixedChar = True
      Size = 80
    end
    object qryCurrentProofStatusCustomer: TIntegerField
      DisplayLabel = 'Customer No.'
      FieldName = 'Customer'
      Visible = False
    end
    object qryCurrentProofStatusBranch_no: TIntegerField
      DisplayLabel = 'Customer Branch'
      FieldName = 'Branch_no'
      Visible = False
    end
    object qryCurrentProofStatusCustomer_Name: TStringField
      DisplayLabel = 'Customer'
      DisplayWidth = 25
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object qryCurrentProofStatusGoods_Required: TDateTimeField
      DisplayLabel = 'Deliver by'
      DisplayWidth = 10
      FieldName = 'Goods_Required'
    end
    object qryCurrentProofStatusSupplier: TIntegerField
      DisplayLabel = 'Supplier No.'
      FieldName = 'Supplier'
      Visible = False
    end
    object qryCurrentProofStatusBranch_No_1: TIntegerField
      FieldName = 'Branch_No_1'
      Visible = False
    end
    object qryCurrentProofStatusSupplier_Name: TStringField
      DisplayLabel = 'Supplier Name'
      DisplayWidth = 25
      FieldName = 'Supplier_Name'
      FixedChar = True
      Size = 80
    end
    object qryCurrentProofStatusCust_Order_No: TStringField
      DisplayLabel = 'Customer Ref.'
      DisplayWidth = 20
      FieldName = 'Cust_Order_No'
      FixedChar = True
      Size = 50
    end
    object qryCurrentProofStatusPurch_Ord_Line_Status: TIntegerField
      FieldName = 'Purch_Ord_Line_Status'
      Visible = False
    end
    object qryCurrentProofStatusDescription: TStringField
      DisplayLabel = 'Status Desc.'
      DisplayWidth = 15
      FieldName = 'Description'
      FixedChar = True
      Size = 80
    end
  end
  object dtsrcCurrentProofStatus: TDataSource
    DataSet = qryCurrentProofStatus
    Left = 24
    Top = 168
  end
  object qryProofStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select proof_status.description from proof_status')
    Left = 600
    Top = 8
  end
end
