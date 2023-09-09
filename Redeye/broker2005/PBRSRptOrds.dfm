object PBRSRptOrdsFrm: TPBRSRptOrdsFrm
  Left = 15
  Top = 30
  Caption = 'Expected Reorder Report'
  ClientHeight = 427
  ClientWidth = 726
  Color = clBtnFace
  Constraints.MinHeight = 462
  Constraints.MinWidth = 735
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 726
    Height = 113
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 742
    object lblOrderBy1: TLabel
      Left = 8
      Top = 84
      Width = 37
      Height = 13
      Caption = 'Sort By:'
    end
    object Label1: TLabel
      Left = 240
      Top = 84
      Width = 43
      Height = 13
      Caption = 'Then By:'
    end
    object Label2: TLabel
      Left = 480
      Top = 84
      Width = 120
      Height = 13
      Caption = 'Show Orders Due in Next'
    end
    object Label3: TLabel
      Left = 688
      Top = 84
      Width = 22
      Height = 13
      Caption = 'days'
    end
    object AllOrOneRadioGroup: TRadioGroup
      Left = 8
      Top = 8
      Width = 105
      Height = 65
      ItemIndex = 0
      Items.Strings = (
        'All Reps '
        'One Reps ')
      ParentBackground = False
      TabOrder = 0
      OnClick = AllOrOneRadioGroupClick
    end
    object customerrg: TRadioGroup
      Left = 368
      Top = 8
      Width = 121
      Height = 65
      ItemIndex = 0
      Items.Strings = (
        'All Customers'
        'One Customer')
      ParentBackground = False
      TabOrder = 1
      OnClick = customerrgClick
    end
    object cmbbxOrderBy1: TComboBox
      Left = 64
      Top = 80
      Width = 145
      Height = 21
      TabOrder = 2
      OnChange = cmbbxOrderBy1Change
      Items.Strings = (
        'Rep'
        'Customer'
        'Expiry Date')
    end
    object cmbbxOrderBy2: TComboBox
      Left = 296
      Top = 80
      Width = 145
      Height = 21
      TabOrder = 3
      OnChange = cmbbxOrderBy1Change
      Items.Strings = (
        'Rep'
        'Customer'
        'Expiry Date')
    end
    object UpDown1: TUpDown
      Left = 665
      Top = 80
      Width = 15
      Height = 21
      Associate = edtDueDays
      TabOrder = 4
      OnClick = UpDown1Click
    end
    object edtDueDays: TEdit
      Left = 632
      Top = 80
      Width = 33
      Height = 21
      TabOrder = 5
      Text = '0'
      OnExit = edtDueDaysExit
    end
    object grpbxReps: TGroupBox
      Left = 117
      Top = 8
      Width = 249
      Height = 65
      ParentBackground = False
      TabOrder = 6
      Visible = False
      object lblRep: TLabel
        Left = 8
        Top = 16
        Width = 20
        Height = 13
        Caption = 'Rep'
        Visible = False
      end
      object LUSuppSpeedButton: TSpeedButton
        Left = 216
        Top = 30
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
      object edtRep: TEdit
        Left = 8
        Top = 32
        Width = 201
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Visible = False
      end
    end
    object grpbxCustomers: TGroupBox
      Left = 493
      Top = 8
      Width = 240
      Height = 65
      ParentBackground = False
      TabOrder = 7
      Visible = False
      object Customerlbl: TLabel
        Left = 6
        Top = 16
        Width = 83
        Height = 13
        Caption = 'Customer/Branch'
        Visible = False
      end
      object LUCustSpeedButton: TSpeedButton
        Left = 208
        Top = 30
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
      object CustEdit: TEdit
        Left = 8
        Top = 32
        Width = 193
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Visible = False
      end
    end
  end
  object pnlButton: TPanel
    Left = 0
    Top = 367
    Width = 726
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 389
    ExplicitWidth = 742
    DesignSize = (
      726
      41)
    object CancelBitBtn: TBitBtn
      Left = 14
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Cancel'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
    end
    object btbtnRepeat: TBitBtn
      Left = 165
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Repeat'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555FFFFFFFFFF55555000000000055555577777777775FFFF00B8B8B8B8B0
        0000775F5555555777770B0B8B8B8B8B0FF07F75F555555575F70FB0B8B8B8B8
        B0F07F575FFFFFFFF7F70BFB0000000000F07F557777777777570FBFBF0FFFFF
        FFF07F55557F5FFFFFF70BFBFB0F000000F07F55557F777777570FBFBF0FFFFF
        FFF075F5557F5FFFFFF750FBFB0F000000F0575FFF7F777777575700000FFFFF
        FFF05577777F5FF55FF75555550F00FF00005555557F775577775555550FFFFF
        0F055555557F55557F755555550FFFFF00555555557FFFFF7755555555000000
        0555555555777777755555555555555555555555555555555555}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btbtnRepeatClick
    end
    object btbtnChange: TBitBtn
      Left = 245
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
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
      TabOrder = 2
      OnClick = btbtnChangeClick
    end
    object PreviewBitBtn: TBitBtn
      Left = 548
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
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
      TabOrder = 3
      OnClick = PreviewBitBtnClick
      ExplicitLeft = 560
    end
    object PrintBitBtn: TBitBtn
      Left = 636
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Print'
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
      TabOrder = 4
      OnClick = PrintBitBtnClick
      ExplicitLeft = 648
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 113
    Width = 726
    Height = 254
    Align = alClient
    DataSource = dtsrcLive
    DefaultDrawing = False
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'purchase_order'
        Title.Caption = 'Order'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Point'
        Title.Caption = 'Order Date'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CustName'
        Title.Caption = 'Customer'
        Width = 242
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'customers_desc'
        Title.Caption = 'Description'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Form_Reference_ID'
        Title.Caption = 'Form Ref.'
        Width = 192
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Form_Reference_Descr'
        Title.Caption = 'Form Ref. Description'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'selling_price'
        Title.Caption = 'Sales Price'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sell_unit'
        Title.Caption = 'Sales Unit'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'order_price'
        Title.Caption = 'Order Price'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'order_unit'
        Title.Caption = 'Order Unit'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'repName'
        Title.Caption = 'Rep'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'original_order'
        Title.Caption = 'Repeat Of'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'expDate'
        Title.Caption = 'Reorder Date'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_order_no'
        Title.Caption = 'Cust Ref'
        Width = 136
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 408
    Width = 726
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    ExplicitTop = 430
    ExplicitWidth = 742
  end
  object qryLive: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select purchase_orderline.purchase_order ,'
      ' purchase_orderline.line ,'
      ' purchase_orderline.cust_order_no ,'
      ' purchase_orderline.customer ,'
      ' purchase_orderline.branch_no ,'
      ' purchase_orderline.customers_desc ,'
      ' purchase_orderline.Quantity ,'
      ' purchase_orderline.selling_price,'
      ' sell_unit.description as sell_unit,'
      ' purchase_orderline.order_price,'
      ' order_unit.description as order_unit,'
      ' purchase_orderline.original_order ,'
      ' rep.Name as repName,'
      ' customer.name as CustName,'
      
        ' (purchase_orderline.Goods_reqd_by_customer + purchase_orderline' +
        '.expected_life) as expDate ,'
      ' (purchase_orderline.Goods_reqd_by_customer +'
      '      purchase_orderline.expected_life) as expLife,'
      '  form_reference.Form_Reference_ID,'
      '  Form_Reference.Form_Reference_Descr,'
      '  purchase_order.Date_Point,'
      '  purchase_orderline.purch_ord_line_status as Order_Status,'
      '  purch_ord_line_status.Description as Status_Description'
      'from ((((((((purchase_orderline'
      '  inner join rep on (purchase_orderline.rep = rep.rep))'
      
        '  inner join purch_ord_line_status on (purchase_orderline.purch_' +
        'ord_line_status = purch_ord_line_status.purch_ord_line_status))'
      
        '  inner join price_unit as sell_unit on (purchase_orderline.sell' +
        '_unit = sell_unit.price_unit))'
      
        '  inner join price_unit as order_unit on (purchase_orderline.ord' +
        'er_unit = order_unit.price_unit))'
      
        '  inner join customer on (purchase_orderline.customer = customer' +
        '.customer))'
      
        '  inner join purchase_order on (purchase_orderline.purchase_orde' +
        'r = purchase_order.purchase_order))'
      
        '  left join form_reference on (purchase_orderline.form_reference' +
        ' = form_reference.form_reference)))'
      'where purchase_orderline.Goods_reqd_by_customer is not null'
      '  and purchase_orderline.expected_life is not null'
      
        '  and ((purchase_orderline.purchase_order - round(purchase_order' +
        'line.purchase_order, 0)) = 0)'
      ''
      ' '
      ' '
      ' ')
    Left = 80
    Top = 232
    object qryLivepurchase_order: TFloatField
      FieldName = 'purchase_order'
    end
    object qryLiveline: TIntegerField
      FieldName = 'line'
    end
    object qryLivecust_order_no: TStringField
      FieldName = 'cust_order_no'
      FixedChar = True
      Size = 50
    end
    object qryLivecustomer: TIntegerField
      FieldName = 'customer'
    end
    object qryLivebranch_no: TIntegerField
      FieldName = 'branch_no'
    end
    object qryLivecustomers_desc: TStringField
      FieldName = 'customers_desc'
      FixedChar = True
      Size = 80
    end
    object qryLiveQuantity: TFloatField
      FieldName = 'Quantity'
    end
    object qryLiveselling_price: TCurrencyField
      FieldName = 'selling_price'
    end
    object qryLivesell_unit: TStringField
      FieldName = 'sell_unit'
      FixedChar = True
      Size = 80
    end
    object qryLiveorder_price: TCurrencyField
      FieldName = 'order_price'
    end
    object qryLiveorder_unit: TStringField
      FieldName = 'order_unit'
      FixedChar = True
      Size = 80
    end
    object qryLiveoriginal_order: TFloatField
      FieldName = 'original_order'
    end
    object qryLiverepName: TStringField
      FieldName = 'repName'
      FixedChar = True
      Size = 80
    end
    object qryLiveCustName: TStringField
      FieldName = 'CustName'
      FixedChar = True
      Size = 80
    end
    object qryLiveexpDate: TDateTimeField
      FieldName = 'expDate'
    end
    object qryLiveexpLife: TDateTimeField
      FieldName = 'expLife'
    end
    object qryLiveForm_Reference_ID: TStringField
      FieldName = 'Form_Reference_ID'
      FixedChar = True
      Size = 100
    end
    object qryLiveForm_Reference_Descr: TStringField
      FieldName = 'Form_Reference_Descr'
      FixedChar = True
      Size = 100
    end
    object qryLiveDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryLiveOrder_Status: TIntegerField
      FieldName = 'Order_Status'
    end
    object qryLiveStatus_Description: TStringField
      FieldName = 'Status_Description'
      FixedChar = True
      Size = 80
    end
  end
  object dtsrcLive: TDataSource
    DataSet = qryLive
    Left = 184
    Top = 256
  end
  object PopupMenu1: TPopupMenu
    Left = 200
    Top = 176
    object ResetGrid1: TMenuItem
      Caption = 'Reset Grid'
      OnClick = ResetGrid1Click
    end
  end
  object qryBaseSQL: TFDQuery
    SQL.Strings = (
      'select purchase_orderline.purchase_order ,'
      ' purchase_orderline.line ,'
      ' purchase_orderline.cust_order_no ,'
      ' purchase_orderline.customer ,'
      ' purchase_orderline.branch_no ,'
      ' purchase_orderline.customers_desc ,'
      ' purchase_orderline.Quantity ,'
      ' purchase_orderline.selling_price,'
      ' sell_unit.description as sell_unit,'
      ' purchase_orderline.order_price,'
      ' order_unit.description as order_unit,'
      ' purchase_orderline.original_order ,'
      ' rep.Name as repName,'
      ' customer.name as CustName,'
      
        ' (purchase_orderline.Goods_reqd_by_customer + purchase_orderline' +
        '.expected_life) as expDate ,'
      ' (purchase_orderline.Goods_reqd_by_customer +'
      '      purchase_orderline.expected_life) as expLife,'
      '  form_reference.Form_Reference_ID,'
      '  Form_Reference.Form_Reference_Descr,'
      '  purchase_order.Date_Point,'
      '  purchase_orderline.purch_ord_line_status as Order_Status,'
      '  purch_ord_line_status.Description as Status_Description'
      'from ((((((((purchase_orderline'
      '  inner join rep on (purchase_orderline.rep = rep.rep))'
      
        '  inner join purch_ord_line_status on (purchase_orderline.purch_' +
        'ord_line_status = purch_ord_line_status.purch_ord_line_status))'
      
        '  inner join price_unit as sell_unit on (purchase_orderline.sell' +
        '_unit = sell_unit.price_unit))'
      
        '  inner join price_unit as order_unit on (purchase_orderline.ord' +
        'er_unit = order_unit.price_unit))'
      
        '  inner join customer on (purchase_orderline.customer = customer' +
        '.customer))'
      
        '  inner join purchase_order on (purchase_orderline.purchase_orde' +
        'r = purchase_order.purchase_order))'
      
        '  left join form_reference on (purchase_orderline.form_reference' +
        ' = form_reference.form_reference)))'
      'where purchase_orderline.Goods_reqd_by_customer is not null'
      '  and purchase_orderline.expected_life is not null'
      
        '  and ((purchase_orderline.purchase_order - round(purchase_order' +
        'line.purchase_order, 0)) = 0)'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 80
    Top = 168
  end
end
