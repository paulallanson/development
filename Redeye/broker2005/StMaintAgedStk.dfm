object StMaintAgedStkFrm: TStMaintAgedStkFrm
  Left = 26
  Top = 60
  Caption = 'Manage Aged Stock'
  ClientHeight = 443
  ClientWidth = 749
  Color = clBtnFace
  Constraints.MinHeight = 425
  Constraints.MinWidth = 503
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 169
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 318
      Top = 131
      Width = 58
      Height = 39
      Caption = 'No. of days held in stock'
      WordWrap = True
    end
    object grpbxRange: TGroupBox
      Left = 5
      Top = 84
      Width = 300
      Height = 80
      Caption = 'Product Range'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        300
        80)
      object Label2: TLabel
        Left = 14
        Top = 23
        Width = 26
        Height = 13
        Caption = 'From'
      end
      object Label3: TLabel
        Left = 14
        Top = 52
        Width = 12
        Height = 13
        Caption = 'To'
      end
      object edtPartFrom: TEdit
        Left = 50
        Top = 19
        Width = 214
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 0
        Text = '000000'
        OnChange = edtPartFromChange
      end
      object edtPartTo: TEdit
        Left = 50
        Top = 48
        Width = 214
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 1
        Text = 'ZZZZZZ'
        OnChange = edtPartToChange
      end
      object btbtnPartFrom: TBitBtn
        Left = 267
        Top = 18
        Width = 25
        Height = 25
        Anchors = [akTop, akRight]
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
        Left = 267
        Top = 47
        Width = 25
        Height = 25
        Anchors = [akTop, akRight]
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
    object edtNoOfDays: TEdit
      Left = 394
      Top = 135
      Width = 57
      Height = 21
      TabOrder = 1
      Text = '90'
      OnChange = edtNoOfDaysChange
      OnKeyPress = edtNoOfDaysKeyPress
    end
    object UpDown1: TUpDown
      Left = 451
      Top = 135
      Width = 15
      Height = 21
      Associate = edtNoOfDays
      Max = 10000
      Position = 90
      TabOrder = 2
    end
    object CustRadioGroup: TRadioGroup
      Left = 4
      Top = 4
      Width = 121
      Height = 77
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'All Customers'
        'One Customer')
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = CustRadioGroupClick
    end
    object CustGrpBox: TGroupBox
      Left = 133
      Top = 4
      Width = 332
      Height = 77
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      Visible = False
      DesignSize = (
        332
        77)
      object Label5: TLabel
        Left = 8
        Top = 12
        Width = 95
        Height = 13
        Caption = 'Selected Customer'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object CustLuSpeedButton: TSpeedButton
        Left = 292
        Top = 27
        Width = 25
        Height = 25
        Hint = 'Select a specific customer rep'
        Anchors = [akTop, akRight]
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
        Top = 28
        Width = 277
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 0
      end
      object chkbxBranch: TCheckBox
        Left = 8
        Top = 54
        Width = 121
        Height = 16
        Caption = 'Branch Specific'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = chkbxBranchClick
      end
    end
  end
  object DetsDBGrid: TDBGrid
    Left = 0
    Top = 169
    Width = 749
    Height = 233
    Align = alClient
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    PopupMenu = ppmnGrid
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Part'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sales_Value'
        Title.Caption = 'Value'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sell_Pack_Size'
        Title.Caption = 'Sell Pack'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Part_Store_Name'
        Title.Caption = 'Part Store'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CustName'
        Title.Caption = 'Customer'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bin'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lot'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stock_Ref'
        Title.Caption = 'Stock Ref.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pack_Size'
        Title.Caption = 'Pack Size'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stock_Value'
        Title.Caption = 'Stock Value'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_received'
        Title.Caption = 'Received'
        Visible = True
      end>
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 402
    Width = 749
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      749
      41)
    object CloseBitBtn: TBitBtn
      Left = 662
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
    end
    object btbtnOKInvoice: TBitBtn
      Left = 12
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Invoice'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555500000
        55555555000BB3B30555555030BB3303305555030BB0B3B3330555033BBBB333
        330550B3B3BB3BB3B33050B3B33BBBBB333050B3B33BBBBB3B3050B3B333BB0B
        33B050B33333BBB3B3B050BB33333333BB05550B33B3333BB305550BB33330BB
        B0555550BB33B3BB0555555500B3333055555555550000055555}
      TabOrder = 1
      OnClick = SetReadyforInvoicng1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = qrySelUnPaidAgedStk
    Left = 64
    Top = 212
  end
  object qrySelUnPaidAgedStk: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select    store_stock.part as Part,'
      '          part.part_description as Description,'
      '          part.part_Cost_Cat as Sales_Value,'
      '          part.Sell_Pack_Quantity as Sell_Pack_Size,'
      '          part_store.part_store_name as Part_Store_Name,'
      '          Part.Not_In_Use,'
      '          Customer.name+'#39'\'#39'+customer_branch.name as CustName,'
      '          store_stock.part_bin as Bin,'
      '          store_Stock.Part_Store_Lot as Lot,'
      '          store_stock.Store_stock_description as Stock_Ref,'
      '          store_stock.store_quantity as Quantity,'
      '          store_Stock.Stock_Pack_Quantity as Pack_Size,'
      '          (store_stock.store_Cost) as Stock_Value,'
      '          Store_Stock.Part_Store,'
      '          store_stock.date_received,'
      '          store_stock.store_stock'
      
        'FROM ((Customer RIGHT JOIN ((part INNER JOIN (store_stock INNER ' +
        'JOIN'
      '  part_store ON store_stock.Part_Store = part_store.Part_Store)'
      '    ON part.Part = store_stock.Part)'
      
        '    LEFT JOIN Customer_Branch ON (part.Branch_no = Customer_Bran' +
        'ch.Branch_no)'
      '    AND (part.Customer = Customer_Branch.Customer))'
      '    ON Customer.Customer = Customer_Branch.Customer))'
      'where'
      '  (((:theDate - store_stock.date_received) > :noOfDays) and'
      
        '  (Store_Stock.Part >= :PartFrom) and (Store_Stock.Part <= :Part' +
        'To)) and'
      
        '  (((Part.Customer = :Customer) and ((Part.Branch_No = :CustBran' +
        'ch)or(:CustBranch = -1)))'
      '    or (:Customer = 0)) and'
      '  (store_stock.invoice_upfront = '#39'N'#39')'
      'order by  store_stock.part'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 28
    Top = 212
    ParamData = <
      item
        Name = 'theDate'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'noOfDays'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'PartFrom'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'PartTo'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CustBranch'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CustBranch'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qrySelUnPaidAgedStkPart: TWideStringField
      FieldName = 'Part'
      FixedChar = True
      Size = 30
    end
    object qrySelUnPaidAgedStkDescription: TWideStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 120
    end
    object qrySelUnPaidAgedStkSales_Value: TCurrencyField
      FieldName = 'Sales_Value'
    end
    object qrySelUnPaidAgedStkSell_Pack_Size: TIntegerField
      FieldName = 'Sell_Pack_Size'
    end
    object qrySelUnPaidAgedStkPart_Store_Name: TWideStringField
      FieldName = 'Part_Store_Name'
      FixedChar = True
      Size = 60
    end
    object qrySelUnPaidAgedStkNot_In_Use: TWideStringField
      FieldName = 'Not_In_Use'
      FixedChar = True
      Size = 2
    end
    object qrySelUnPaidAgedStkCustName: TWideStringField
      FieldName = 'CustName'
      FixedChar = True
      Size = 80
    end
    object qrySelUnPaidAgedStkBin: TWideStringField
      FieldName = 'Bin'
      FixedChar = True
    end
    object qrySelUnPaidAgedStkLot: TWideStringField
      FieldName = 'Lot'
      FixedChar = True
      Size = 40
    end
    object qrySelUnPaidAgedStkStock_Ref: TWideStringField
      FieldName = 'Stock_Ref'
      FixedChar = True
      Size = 60
    end
    object qrySelUnPaidAgedStkQuantity: TIntegerField
      FieldName = 'Quantity'
    end
    object qrySelUnPaidAgedStkPack_Size: TIntegerField
      FieldName = 'Pack_Size'
    end
    object qrySelUnPaidAgedStkStock_Value: TCurrencyField
      FieldName = 'Stock_Value'
    end
    object qrySelUnPaidAgedStkPart_Store: TIntegerField
      FieldName = 'Part_Store'
    end
    object qrySelUnPaidAgedStkdate_received: TDateTimeField
      FieldName = 'date_received'
    end
    object qrySelUnPaidAgedStkstore_stock: TIntegerField
      FieldName = 'store_stock'
    end
  end
  object ppmnGrid: TPopupMenu
    OnPopup = ppmnGridPopup
    Left = 440
    Top = 216
    object SetReadyforInvoicng1: TMenuItem
      Caption = 'Set Ready for Invoicing'
      OnClick = SetReadyforInvoicng1Click
    end
    object ResetGrid1: TMenuItem
      Caption = 'Reset Grid'
      OnClick = ResetGrid1Click
    end
  end
  object qryUpdPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update purchase_orderline '
      'set invoice_upfront = '#39'Y'#39' '
      'where purchase_order = :PO and '
      ' line = :line;'
      ' ')
    Left = 28
    Top = 276
    ParamData = <
      item
        Name = 'PO'
      end
      item
        Name = 'line'
      end>
  end
  object tmrGridRefresh: TTimer
    OnTimer = tmrGridRefreshTimer
    Left = 256
    Top = 256
  end
  object qrySelPOrd: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from purchase_order'
      'where purchase_order = :PO;')
    Left = 28
    Top = 244
    ParamData = <
      item
        Name = 'PO'
      end>
  end
  object qryUpdStoreStock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update store_stock '
      'set invoice_upfront = '#39'Y'#39' '
      'where Store_Stock = :store_stock')
    Left = 64
    Top = 276
    ParamData = <
      item
        Name = 'store_stock'
      end>
  end
end
