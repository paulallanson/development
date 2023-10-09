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
  Position = poScreenCenter
  OnActivate = FormActivate
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
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = OKbitbtnClick
  end
  object Cancelbtn: TBitBtn
    Left = 264
    Top = 88
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
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
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Details'
      end
      item
        Name = 'amount'
      end
      item
        Name = 'Quotation_Price'
      end
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Additional_Charge'
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Additional_Charge'
      end
      item
        Name = 'Details'
      end
      item
        Name = 'Amount'
      end
      item
        Name = 'Quotation_Price'
      end
      item
        Name = 'Sales_Profit'
      end>
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select max(Additional_Charge) as Last_Charge'
      'from Purch_ord_line_Add_Chg'
      'where Purchase_order = :Purchase_order and'
      'Line = :line')
    Left = 248
    Top = 48
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'line'
      end>
  end
  object qryDel: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Purch_Ord_Line_Add_Chg'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :Line and'
      'Additional_Charge = :Additional_Charge')
    Left = 168
    Top = 48
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Additional_Charge'
      end>
  end
  object getLastProfitSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Sales_Profit) as Last_Profit'
      'from Sales_Profit')
    Left = 40
    Top = 48
  end
  object addSalesProfitSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Sales_Profit'
      end
      item
        Name = 'Sales_invoice'
        DataType = ftInteger
      end
      item
        Name = 'Total_Sales_Value'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no0'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Total_Cost_Value'
      end
      item
        Name = 'Sales_order'
        DataType = ftInteger
      end
      item
        Name = 'Period'
      end
      item
        Name = 'Product_Type'
        DataType = ftInteger
      end
      item
        Name = 'Category'
        DataType = ftInteger
      end
      item
        Name = 'Office_Contact'
        DataType = ftInteger
      end
      item
        Name = 'Account_Team'
        DataType = ftInteger
      end
      item
        Name = 'Rep_Team'
        DataType = ftInteger
      end
      item
        Name = 'Job_bag'
        DataType = ftInteger
      end
      item
        Name = 'Job_Bag_Line'
        DataType = ftInteger
      end>
  end
  object updSalesProfitSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Sales_Profit'
      'set Total_Cost_Value = :Total_Cost_Value'
      'where Sales_Profit = :Sales_Profit')
    Left = 224
    Top = 8
    ParamData = <
      item
        Name = 'Total_Cost_Value'
      end
      item
        Name = 'Sales_Profit'
      end>
  end
  object qryDelSalesProfit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Sales_Profit'
      'where Sales_Profit = :Sales_Profit')
    Left = 352
    Top = 56
    ParamData = <
      item
        Name = 'Sales_Profit'
      end>
  end
end
