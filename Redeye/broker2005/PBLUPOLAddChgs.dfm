object PBLUPOLAddChgsfrm: TPBLUPOLAddChgsfrm
  Left = 206
  Top = 133
  BorderStyle = bsDialog
  Caption = 'Current period additional costs'
  ClientHeight = 288
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 440
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lblPONumber: TLabel
      Left = 104
      Top = 8
      Width = 62
      Height = 13
      Caption = 'lblPONumber'
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 77
      Height = 13
      Caption = 'Purchase Order:'
    end
    object Label2: TLabel
      Left = 8
      Top = 28
      Width = 47
      Height = 13
      Caption = 'Customer:'
    end
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 41
      Height = 13
      Caption = 'Supplier:'
    end
    object lblCustomer: TLabel
      Left = 104
      Top = 28
      Width = 54
      Height = 13
      Caption = 'lblCustomer'
    end
    object lblSupplier: TLabel
      Left = 104
      Top = 48
      Width = 48
      Height = 13
      Caption = 'lblSupplier'
    end
  end
  object Panel2: TPanel
    Left = 346
    Top = 73
    Width = 94
    Height = 215
    Align = alRight
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object DelBitBtn: TBitBtn
      Left = 10
      Top = 80
      Width = 75
      Height = 25
      Caption = '&Delete'
      TabOrder = 0
      OnClick = DelBitBtnClick
    end
    object chgBitBtn: TBitBtn
      Left = 10
      Top = 48
      Width = 75
      Height = 25
      Caption = '&Change'
      TabOrder = 1
      OnClick = chgBitBtnClick
    end
    object AddBitBtn: TBitBtn
      Left = 10
      Top = 16
      Width = 75
      Height = 25
      Caption = '&Add'
      TabOrder = 2
      OnClick = AddBitBtnClick
    end
    object btnClose: TBitBtn
      Left = 10
      Top = 184
      Width = 75
      Height = 25
      TabOrder = 3
      Kind = bkClose
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 73
    Width = 346
    Height = 215
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 344
      Height = 213
      Align = alClient
      DataSource = DetsSRC
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Details'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 247
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Amount'
          Title.Alignment = taRightJustify
          Title.Caption = 'Cost'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 70
          Visible = True
        end>
    end
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purch_Ord_line_Add_chg.Purchase_order,'
      '          Purch_Ord_line_Add_chg.Line,'
      '          Additional_Charge,'
      '          Details,'
      '          Amount,'
      '          Quotation_Price,'
      '          Purch_ord_Line_Add_Chg.Sales_Profit,'
      '          Sales_profit.Period'
      'from Purch_Ord_line_Add_chg, Sales_Profit'
      'where '
      '('
      '(Purch_Ord_line_Add_chg.Purchase_order = :Purchase_order) and'
      '(Purch_Ord_line_Add_chg.Line = :Line)'
      ') and'
      
        '(Purch_Ord_line_Add_chg.Sales_Profit = Sales_profit.Sales_profit' +
        ') and'
      '('
      '(Sales_profit.period = :Period) or'
      '(Purch_Ord_line_Add_chg.sales_profit is null)'
      ') ')
    Left = 176
    Top = 161
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Period'
        ParamType = ptUnknown
      end>
  end
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 176
    Top = 225
  end
  object GetPOSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Purchase_orderLine.Purchase_Order,'
      '        Purchase_orderLine.Line,'
      '        Purchase_orderLine.Customer,'
      '        Purchase_orderLine.Branch_no as Customer_Branch,'
      '        Customer.Name as Customer_Name,'
      '        Purchase_orderLine.Rep,'
      '        Rep.Name as Rep_Name,'
      '        Purchase_order.Supplier,'
      '        Purchase_order.Branch_no as Supplier_Branch,'
      '        Supplier.Name as Supplier_Name,'
      '        Purchase_Order.Office_Contact,'
      '        Purchase_order.Account_Team,'
      '        Purchase_OrderLine.Product_Type,'
      '        Product_Type.Category'
      
        'from Purchase_orderLine, Purchase_Order, Supplier, Customer, Rep' +
        ', Product_Type'
      'where'
      '('
      '(Purchase_orderLine.Purchase_Order = :Purchase_Order) and'
      '(Purchase_OrderLine.Line = :Line)'
      ') and'
      
        '(Purchase_OrderLine.Purchase_Order = Purchase_Order.Purchase_Ord' +
        'er) and'
      '(Purchase_Order.Supplier = Supplier.Supplier) and'
      '(Purchase_OrderLine.Customer = Customer.Customer) and'
      '(Purchase_OrderLine.Rep = Rep.Rep) and'
      '(Purchase_OrderLine.Product_Type = Product_Type.Product_Type)')
    Left = 264
    Top = 161
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryPeriod: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Period) as Period'
      'from period')
    Left = 56
    Top = 129
  end
end
