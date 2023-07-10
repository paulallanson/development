object PBMaintPOLAddChgsfrm: TPBMaintPOLAddChgsfrm
  Left = 216
  Top = 171
  BorderStyle = bsDialog
  Caption = 'Current period charges'
  ClientHeight = 124
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Details'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 21
    Height = 13
    Caption = 'Cost'
  end
  object delLabel: TLabel
    Left = 64
    Top = 96
    Width = 103
    Height = 15
    Caption = 'Delete this charge'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OKbitbtn: TBitBtn
    Left = 176
    Top = 88
    Width = 75
    Height = 25
    Enabled = False
    TabOrder = 2
    OnClick = OKbitbtnClick
    Kind = bkOK
  end
  object Cancelbtn: TBitBtn
    Left = 264
    Top = 88
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object edtDetails: TEdit
    Left = 64
    Top = 16
    Width = 321
    Height = 21
    TabOrder = 0
    OnChange = CheckOK
  end
  object memCost: TMemo
    Left = 64
    Top = 48
    Width = 89
    Height = 23
    Alignment = taRightJustify
    TabOrder = 1
    WantReturns = False
    WordWrap = False
    OnChange = CheckOK
    OnEnter = memCostEnter
    OnExit = memCostExit
  end
  object UpdSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Purch_ord_line_Add_Chg'
      'set Details = :Details,'
      'Amount = :amount,'
      'Quotation_Price = :Quotation_Price'
      'where'
      'Purchase_Order = :Purchase_order and'
      'Line = :Line and'
      'Additional_Charge = :Additional_Charge')
    Left = 352
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Details'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quotation_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Additional_Charge'
        ParamType = ptUnknown
      end>
  end
  object AddSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert Into Purch_ord_Line_Add_Chg'
      '        (Purchase_order,'
      '         Line,'
      '         Additional_Charge,'
      '         Details,'
      '         Amount,'
      '         Quotation_Price,'
      '         Sales_Profit)'
      'Values'
      '        (:Purchase_Order,'
      '         :Line,'
      '         :Additional_Charge,'
      '         :Details,'
      '         :Amount,'
      '         :Quotation_Price,'
      '         :Sales_Profit)')
    Left = 304
    Top = 48
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
      end
      item
        DataType = ftUnknown
        Name = 'Additional_Charge'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Details'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quotation_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Profit'
        ParamType = ptUnknown
      end>
  end
  object GetLastSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select max(Additional_Charge) as Last_Charge'
      'from Purch_ord_line_Add_Chg'
      'where Purchase_order = :Purchase_order and'
      'Line = :line')
    Left = 248
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qryDel: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from Purch_Ord_Line_Add_Chg'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :Line and'
      'Additional_Charge = :Additional_Charge')
    Left = 168
    Top = 48
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
      end
      item
        DataType = ftUnknown
        Name = 'Additional_Charge'
        ParamType = ptUnknown
      end>
  end
  object getLastProfitSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select max(Sales_Profit) as Last_Profit'
      'from Sales_Profit')
    Left = 40
    Top = 48
  end
  object addSalesProfitSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Sales_Profit'
      '  (Sales_Profit,'
      '  Sales_invoice,'
      '  Total_Sales_Value,'
      '  Customer,'
      '  Branch_no0,'
      '  Rep,'
      '  Purchase_Order,'
      '  Line,'
      '  Supplier,'
      '  Branch_no,'
      '  Total_Cost_Value,'
      '  Sales_order,'
      '  Period,'
      '  Product_Type,'
      '  Category,'
      '  Office_Contact,'
      '  Account_Team,'
      '  Rep_Team,'
      '  Job_bag,'
      '  Job_Bag_Line)'
      'Values'
      '  (:Sales_Profit,'
      '  :Sales_invoice,'
      '  :Total_Sales_Value,'
      '  :Customer,'
      '  :Branch_no0,'
      '  :Rep,'
      '  :Purchase_Order,'
      '  :Line,'
      '  :Supplier,'
      '  :Branch_no,'
      '  :Total_Cost_Value,'
      '  :Sales_order,'
      '  :Period,'
      '  :Product_Type,'
      '  :Category,'
      '  :Office_Contact,'
      '  :Account_Team,'
      '  :Rep_Team,'
      '  :Job_bag,'
      '  :Job_Bag_Line)')
    Left = 144
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Profit'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Total_Sales_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Total_Cost_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Category'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Account_Team'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep_Team'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Job_bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Job_Bag_Line'
        ParamType = ptUnknown
      end>
  end
  object updSalesProfitSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Sales_Profit'
      'set Total_Cost_Value = :Total_Cost_Value'
      'where Sales_Profit = :Sales_Profit')
    Left = 224
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Total_Cost_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Profit'
        ParamType = ptUnknown
      end>
  end
  object qryDelSalesProfit: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from Sales_Profit'
      'where Sales_Profit = :Sales_Profit')
    Left = 352
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Profit'
        ParamType = ptUnknown
      end>
  end
end
