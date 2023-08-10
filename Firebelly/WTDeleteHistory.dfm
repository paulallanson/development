object frmWTDeleteHistory: TfrmWTDeleteHistory
  Left = 388
  Top = 187
  BorderStyle = bsDialog
  Caption = 'Historical Records'
  ClientHeight = 213
  ClientWidth = 257
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    257
    213)
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 52
    Width = 107
    Height = 13
    Caption = 'Delete records prior to:'
  end
  object lblnoRecords: TLabel
    Left = 16
    Top = 160
    Width = 62
    Height = 13
    Caption = 'lblnoRecords'
  end
  object Label2: TLabel
    Left = 16
    Top = 20
    Width = 103
    Height = 13
    Caption = 'Delete old Quotes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 50
    Top = 181
    Width = 75
    Height = 25
    Caption = 'Run'
    Default = True
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 138
    Top = 181
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Close'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 1
  end
  object prgbrRecords: TProgressBar
    Left = 16
    Top = 136
    Width = 225
    Height = 17
    TabOrder = 2
  end
  object chkbxIncludeConfirmed: TCheckBox
    Left = 16
    Top = 80
    Width = 217
    Height = 17
    Caption = 'Delete Confirmed Quotes'
    Enabled = False
    TabOrder = 3
    OnClick = chkbxIncludeConfirmedClick
  end
  object chkbxDeleteOrders: TCheckBox
    Left = 16
    Top = 104
    Width = 209
    Height = 17
    Caption = 'Delete Sales Orders/Jobs'
    Enabled = False
    TabOrder = 4
  end
  object edtDateRequired: TEdit
    Left = 122
    Top = 48
    Width = 89
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 5
    OnChange = CheckOK
    OnExit = edtDateRequiredExit
    ExplicitLeft = 134
  end
  object btnDateRequired: TBitBtn
    Left = 218
    Top = 46
    Width = 25
    Height = 25
    Anchors = [akTop, akRight]
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
    TabOrder = 6
    OnClick = btnDateRequiredClick
    ExplicitLeft = 230
  end
  object qryQuotes: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Quote.Quote,'
      '        Install_address,'
      '        Availability,'
      '        Payment_Terms,'
      '        Extra_Notes,'
      '        Address'
      'FROM Quote'
      'WHERE (Quote_status BETWEEN 1 AND :Quote_status) AND'
      '      (Date_Raised <= :Date_From) AND'
      
        '      ((Quote.Contract_Quote = '#39'N'#39') or (Quote.Contract_Quote is ' +
        'NULL))'
      'ORDER BY Quote.Quote')
    Left = 48
    Top = 8
    ParamData = <
      item
        Name = 'Quote_status'
      end
      item
        Name = 'Date_From'
      end>
  end
  object qrySOL: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select  sales_order_line.sales_order,'
      '        sales_order.extra_notes,'
      '        sales_order.Install_Address,'
      '        sales_order.Address'
      'from Sales_Order_Line, Sales_Order'
      'where Sales_order_Line.Quote = :Quote and'
      'Sales_order_line.sales_order = sales_order.sales_order')
    Left = 80
    Top = 144
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qrySIL: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'select Sales_Invoice_Line.Sales_invoice, Sales_Invoice.Notes, Sa' +
        'les_Invoice.Internal_Notes'
      'from Sales_Invoice_Line, Sales_Invoice'
      'where Sales_Invoice_Line.Sales_Order = :Sales_Order and'
      'Sales_Invoice_Line.Sales_Invoice = Sales_Invoice.Sales_Invoice')
    Left = 136
    Top = 144
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'Wt'
    Left = 80
    Top = 136
  end
  object qryJobs: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select  Job,'
      '        Install_address,'
      '        Availability,'
      '        Payment_Terms,'
      '        Extra_Notes,'
      '        Address'
      'from Job'
      'where (Date_Raised < :Date_From)')
    Left = 208
    Top = 8
    ParamData = <
      item
        Name = 'Date_From'
      end>
  end
  object qryQintNotes: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Quote_Internal_Note'
      'where Quote = :Quote')
    Left = 144
    Top = 8
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryJSOL: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select sales_order_line.sales_order, sales_order.extra_notes'
      'from Sales_Order_Line, Sales_Order'
      'where Sales_order_Line.Job = :Job and'
      'Sales_order_line.sales_order = sales_order.sales_order')
    Left = 200
    Top = 88
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryJIntNotes: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Job_Internal_Note'
      'where Job = :Job')
    Left = 200
    Top = 136
    ParamData = <
      item
        Name = 'Job'
      end>
  end
end
