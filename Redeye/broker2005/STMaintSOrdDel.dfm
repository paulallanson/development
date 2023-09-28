object STMaintSOrdDelfrm: TSTMaintSOrdDelfrm
  Left = 119
  Top = 57
  BorderStyle = bsDialog
  Caption = 'Maintain Sales Order delivery details'
  ClientHeight = 352
  ClientWidth = 488
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
    Top = 14
    Width = 58
    Height = 13
    Caption = 'Sales Order:'
  end
  object lblSalesOrder: TLabel
    Left = 112
    Top = 14
    Width = 62
    Height = 13
    Caption = 'lblSalesOrder'
  end
  object Label3: TLabel
    Left = 8
    Top = 67
    Width = 33
    Height = 13
    Caption = 'Courier'
  end
  object Label4: TLabel
    Left = 8
    Top = 39
    Width = 64
    Height = 13
    Caption = 'Delivery Date'
  end
  object Label5: TLabel
    Left = 8
    Top = 133
    Width = 81
    Height = 13
    Caption = 'Consignment No.'
  end
  object Label6: TLabel
    Left = 288
    Top = 14
    Width = 89
    Height = 13
    Caption = 'Despatch Number:'
  end
  object lblDespatchNo: TLabel
    Left = 400
    Top = 14
    Width = 70
    Height = 13
    Caption = 'lblDespatchNo'
  end
  object Label8: TLabel
    Left = 8
    Top = 166
    Width = 72
    Height = 13
    Caption = 'Delivery weight'
  end
  object Label9: TLabel
    Left = 296
    Top = 166
    Width = 80
    Height = 13
    Caption = 'Number of boxes'
  end
  object Label10: TLabel
    Left = 224
    Top = 166
    Width = 22
    Height = 13
    Caption = 'Kilos'
  end
  object Label11: TLabel
    Left = 8
    Top = 192
    Width = 95
    Height = 13
    Caption = 'Delivery Instructions'
  end
  object Label12: TLabel
    Left = 288
    Top = 39
    Width = 59
    Height = 13
    Caption = 'Date Picked'
  end
  object Label13: TLabel
    Left = 8
    Top = 99
    Width = 76
    Height = 13
    Caption = 'Service Number'
  end
  object btnOK: TBitBtn
    Left = 162
    Top = 320
    Width = 75
    Height = 25
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 10
    OnClick = btnOKClick
  end
  object btnCancel: TBitBtn
    Left = 250
    Top = 320
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 11
    OnClick = btnCancelClick
  end
  object dblkpCourier: TDBLookupComboBox
    Left = 112
    Top = 63
    Width = 209
    Height = 21
    KeyField = 'Courier'
    ListField = 'Courier_Name'
    ListSource = dtsCourier
    TabOrder = 2
    OnClick = dblkpCourierClick
  end
  object edtDateDelivered: TEdit
    Left = 112
    Top = 35
    Width = 105
    Height = 21
    TabOrder = 0
    OnChange = Enableok
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 34
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
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object edtConsignment: TEdit
    Left = 112
    Top = 129
    Width = 185
    Height = 21
    TabOrder = 6
    OnChange = Enableok
  end
  object spnEdtBoxes: TSpinEdit
    Left = 400
    Top = 161
    Width = 73
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 8
    Value = 0
  end
  object memInstructions: TMemo
    Left = 8
    Top = 208
    Width = 473
    Height = 97
    TabOrder = 9
  end
  object edtDatePicked: TEdit
    Left = 368
    Top = 35
    Width = 105
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 12
  end
  object dblkpCourierService: TDBLookupComboBox
    Left = 112
    Top = 95
    Width = 209
    Height = 21
    KeyField = 'Service_no'
    ListField = 'Service_Description'
    ListSource = dtsCourierService
    TabOrder = 5
    OnClick = Enableok
  end
  object edtWeight: TEdit
    Left = 112
    Top = 161
    Width = 105
    Height = 21
    TabOrder = 7
    OnChange = Enableok
  end
  object btnCourier: TBitBtn
    Left = 328
    Top = 62
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnCourierClick
  end
  object btnClear: TBitBtn
    Left = 360
    Top = 62
    Width = 25
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
      555557777F777555F55500000000555055557777777755F75555005500055055
      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
      5555577FF77577FF555555005050110555555577F757777FF555555505099910
      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
      3055577F75F77777575F55005055090B030555775755777575755555555550B0
      B03055555F555757575755550555550B0B335555755555757555555555555550
      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
      50BB555555555555575F555555555555550B5555555555555575}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 4
    OnClick = btnClearClick
  end
  object qryCourier: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from courier')
    Left = 448
    Top = 59
  end
  object dtsCourier: TDataSource
    DataSet = qryCourier
    Left = 416
    Top = 59
  end
  object qryCourierService: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from courier_service'
      'where courier = :courier')
    Left = 448
    Top = 107
    ParamData = <
      item
        Name = 'courier'
      end>
  end
  object dtsCourierService: TDataSource
    DataSet = qryCourierService
    Left = 416
    Top = 107
  end
  object qryGetSODelivery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Sales_order_Delivery'
      'where sales_order = :Sales_Order and'
      'Sales_order_Delivery_no = :Sales_order_Delivery_no')
    Left = 328
    Top = 155
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_order_Delivery_no'
      end>
  end
  object qryUpSODelivery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update sales_order_delivery'
      'set Delivery_date = :Delivery_date,'
      'Delivery_weight_kilos = :Delivery_weight_Kilos,'
      'No_of_boxes = :No_of_Boxes,'
      'Delivery_instructions = :Delivery_instructions,'
      'Consignment_number = :Consignment_Number,'
      'Courier = :Courier,'
      'Service_no = :Service_no'
      'where sales_order = :sales_order and'
      'sales_order_delivery_no = :sales_order_delivery_no')
    Left = 328
    Top = 200
    ParamData = <
      item
        Name = 'Delivery_date'
      end
      item
        Name = 'Delivery_weight_Kilos'
      end
      item
        Name = 'No_of_Boxes'
      end
      item
        Name = 'Delivery_instructions'
      end
      item
        Name = 'Consignment_Number'
      end
      item
        Name = 'Courier'
      end
      item
        Name = 'Service_no'
      end
      item
        Name = 'sales_order'
      end
      item
        Name = 'sales_order_delivery_no'
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from company'
      'where company = 1')
    Left = 328
    Top = 107
  end
end
