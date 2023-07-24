object PBRS4CastSummfrm: TPBRS4CastSummfrm
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Forecast Summary report'
  ClientHeight = 203
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 160
    Top = 96
    Width = 67
    Height = 13
    Caption = 'Forecast from:'
  end
  object RadioGroup1: TRadioGroup
    ParentBackground = False
    Left = 16
    Top = 8
    Width = 129
    Height = 65
    Caption = 'Selection'
    ItemIndex = 0
    Items.Strings = (
      'All Reps'
      'One Rep')
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object RadioGroup2: TRadioGroup
    ParentBackground = False
    Left = 16
    Top = 80
    Width = 129
    Height = 73
    Caption = 'Period type'
    ItemIndex = 0
    Items.Strings = (
      'Weekly'
      'Monthly')
    TabOrder = 1
    OnClick = RadioGroup2Click
  end
  object PrintBitBtn: TBitBtn
    Left = 344
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Print'
    TabOrder = 2
    OnClick = PrintBitBtnClick
  end
  object PreviewBitBtn: TBitBtn
    Left = 256
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Preview'
    TabOrder = 3
    OnClick = PreviewBitBtnClick
  end
  object pnlRepSearch: TPanel
    ParentBackground = False
    Left = 155
    Top = 16
    Width = 329
    Height = 57
    TabOrder = 4
    Visible = False
    object lblCustBran: TLabel
      Left = 8
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Rep Name'
    end
    object edtRep: TEdit
      Left = 8
      Top = 24
      Width = 257
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnRep: TButton
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
      OnClick = btnRepClick
    end
  end
  object DateFromEdit: TEdit
    Left = 160
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 5
    OnChange = DateFromEditChange
    OnExit = DateFromEditExit
  end
  object DateFromBitBtn: TBitBtn
    Left = 288
    Top = 112
    Width = 25
    Height = 25
    TabOrder = 6
    OnClick = DateFromBitBtnClick
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
  end
  object CancelBitBtn: TBitBtn
    Left = 16
    Top = 168
    Width = 75
    Height = 25
    TabOrder = 7
    Kind = bkCancel
  end
  object qrySalesComm: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'SELECT '#9'Delivery_Detail.Purchase_Order,'
      #9'Delivery_Detail.Line,'
      #9'Delivery_Detail.Delivery_no,'
      #9'Delivery_Detail.Qty_to_Deliver,'
      #9'Delivery_Detail.Delivery_to_Stock,'
      #9'Delivery_Detail.Date_Point,'
      #9'Purchase_OrderLine.Order_Price,'
      #9'Purchase_OrderLine.Selling_Price,'
      #9'Sell_Unit.Price_Unit_Factor,'
      #9'Order_Unit.Price_Unit_Factor,'
      #9'Rep.Rep,'
      #9'Rep.Name,'
      #9'Customer_Branch.Name,'
      #9'Customer.Name,'
      #9'Delivery_Detail.Qty_Delivered,'
      #9'Delivery_Detail.Date_Deliv_Actual,'
      #9'Purchase_OrderLine.Inactive'
      'FROM Rep'
      #9'INNER JOIN (((Price_Unit AS Order_Unit'
      #9'INNER JOIN (Price_Unit AS Sell_Unit'
      #9'INNER JOIN Purchase_OrderLine ON'
      #9#9'Sell_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit) ON'
      #9#9'Order_Unit.Price_Unit = Purchase_OrderLine.Order_Unit)'
      #9'INNER JOIN (Customer'
      #9'INNER JOIN Delivery_Detail ON'
      #9#9'Customer.Customer = Delivery_Detail.Customer) ON'
      #9#9'(Purchase_OrderLine.Line = Delivery_Detail.Line) AND'
      
        #9#9'(Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_' +
        'Order))'
      #9'INNER JOIN Customer_Branch ON'
      #9#9'(Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) AND'
      #9#9'(Customer_Branch.Customer = Purchase_OrderLine.Customer) AND'
      #9#9'(Customer.Customer = Customer_Branch.Customer)) ON'
      #9#9'Rep.Rep = Purchase_OrderLine.Rep'
      'WHERE (Delivery_Detail.Date_Deliv_Actual Is Null) AND'
      '('
      '(Purchase_OrderLine.Inactive<>'#39'Y'#39') Or'
      '(Purchase_OrderLine.Inactive Is Null)'
      ')'
      'ORDER BY Purchase_OrderLine.Rep, Delivery_Detail.Date_Point'
      ' ')
    Left = 384
    Top = 96
  end
end
