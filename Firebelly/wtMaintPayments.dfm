object frmWTMaintPayments: TfrmWTMaintPayments
  Left = 306
  Top = 143
  BorderStyle = bsDialog
  Caption = 'Payment Details'
  ClientHeight = 196
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    452
    196)
  TextHeight = 13
  object lblName: TLabel
    Left = 8
    Top = 24
    Width = 23
    Height = 13
    Caption = 'Date'
  end
  object Label2: TLabel
    Left = 8
    Top = 120
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 36
    Height = 13
    Caption = 'Amount'
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 36
    Height = 13
    Caption = 'Method'
  end
  object btnOK: TBitBtn
    Left = 148
    Top = 157
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btnOKClick
    ExplicitTop = 166
  end
  object BitBtn2: TBitBtn
    Left = 236
    Top = 157
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 6
    ExplicitTop = 166
  end
  object dblkpPaymentMethod: TDBLookupComboBox
    Left = 96
    Top = 84
    Width = 161
    Height = 21
    KeyField = 'Payment_Method'
    ListField = 'Payment_Method_Description'
    ListSource = dtsPaymentMethod
    TabOrder = 3
    OnClick = EnableOK
  end
  object edtDate: TEdit
    Left = 96
    Top = 20
    Width = 81
    Height = 21
    TabOrder = 0
    OnChange = EnableOK
    OnExit = edtDateExit
  end
  object btnDate: TBitBtn
    Left = 184
    Top = 18
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
    OnClick = btnDateClick
  end
  object edtPaymentDescription: TEdit
    Left = 96
    Top = 120
    Width = 313
    Height = 21
    TabOrder = 4
    Text = 'edtPaymentDescription'
    OnChange = EnableOK
  end
  object edtPaidAmount: TCREditMoney
    Left = 96
    Top = 52
    Width = 80
    Height = 21
    TabOrder = 2
    Text = 'edtPaidAmount'
  end
  object qryPaymentMethod: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Payment_Method_Description, Payment_Method'
      'FROM Payment_Method'
      'ORDER BY Payment_Method_Description')
    Left = 304
    Top = 24
  end
  object dtsPaymentMethod: TDataSource
    DataSet = qryPaymentMethod
    Left = 352
    Top = 24
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Payment'
      '('
      '        Payment_Description,'
      '        Payment_Date,'
      '        Paid_Amount,'
      '        Payment_Method,'
      '        Sales_Order,'
      '        Sales_Invoice'
      ')'
      'Values'
      '('
      '        :Payment_Description,'
      '        :Payment_Date,'
      '        :Paid_Amount,'
      '        :Payment_Method,'
      '        :Sales_Order,'
      '        :Sales_Invoice'
      ')'
      ' ')
    Left = 72
    Top = 128
    ParamData = <
      item
        Name = 'Payment_Description'
      end
      item
        Name = 'Payment_Date'
      end
      item
        Name = 'Paid_Amount'
      end
      item
        Name = 'Payment_Method'
      end
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Invoice'
        DataType = ftInteger
      end>
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Payment'
      'SET'
      '      Payment_Description = :Payment_Description,'
      '      Paid_Amount = :Paid_Amount,'
      '      Payment_Date = :Payment_Date,'
      '      Payment_Method = :Payment_Method,'
      '      Sales_Order = :Sales_Order,'
      '      Sales_invoice = :Sales_Invoice'
      'WHERE'
      '  Payment = :Payment')
    Left = 16
    Top = 128
    ParamData = <
      item
        Name = 'Payment_Description'
      end
      item
        Name = 'Paid_Amount'
      end
      item
        Name = 'Payment_Date'
      end
      item
        Name = 'Payment_Method'
      end
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Invoice'
        DataType = ftInteger
      end
      item
        Name = 'Payment'
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select max(Payment) as Last_Payment'
      'From Payment')
    Left = 136
    Top = 128
  end
end
