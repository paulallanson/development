object frmWTMaintLastNumbers: TfrmWTMaintLastNumbers
  Left = 572
  Top = 135
  BorderStyle = bsDialog
  Caption = 'Maintain Last Numbers'
  ClientHeight = 336
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 17
  object Label4: TLabel
    Left = 32
    Top = 28
    Width = 115
    Height = 17
    Caption = 'Last Quote Number'
  end
  object Label5: TLabel
    Left = 32
    Top = 92
    Width = 100
    Height = 17
    Caption = 'Last Job Number'
  end
  object Label19: TLabel
    Left = 32
    Top = 124
    Width = 109
    Height = 17
    Caption = 'Last Sales Number'
  end
  object Label21: TLabel
    Left = 32
    Top = 188
    Width = 119
    Height = 17
    Caption = 'Last Invoice Number'
  end
  object Label50: TLabel
    Left = 32
    Top = 220
    Width = 114
    Height = 17
    Caption = 'Last Credit Number'
  end
  object Label51: TLabel
    Left = 32
    Top = 60
    Width = 128
    Height = 17
    Caption = 'Last Contract Number'
  end
  object Label65: TLabel
    Left = 32
    Top = 156
    Width = 96
    Height = 17
    Caption = 'Last PO Number'
  end
  object edtLastQuoteNumber: TCREditInt
    Left = 171
    Top = 24
    Width = 100
    Height = 25
    TabOrder = 0
    Text = 'edtLastQuoteNumber'
  end
  object edtLastContractQuoteNumber: TCREditInt
    Left = 171
    Top = 56
    Width = 100
    Height = 25
    TabOrder = 1
    Text = 'edtLastContractQuoteNumber'
  end
  object edtLastJobNumber: TCREditInt
    Left = 171
    Top = 88
    Width = 100
    Height = 25
    TabOrder = 2
    Text = 'edtLastJobNumber'
  end
  object edtLastSalesOrderNumber: TCREditInt
    Left = 171
    Top = 120
    Width = 100
    Height = 25
    TabOrder = 3
    Text = 'edtLastSalesOrderNumber'
  end
  object edtLastPurchaseOrderNumber: TCREditInt
    Left = 171
    Top = 152
    Width = 100
    Height = 25
    TabOrder = 4
    Text = 'edtLastPurchaseOrderNumber'
  end
  object edtLastInvoiceNumber: TCREditInt
    Left = 171
    Top = 184
    Width = 100
    Height = 25
    TabOrder = 5
    Text = 'edtLastInvoiceNumber'
  end
  object edtLastCreditNoteNumber: TCREditInt
    Left = 171
    Top = 216
    Width = 100
    Height = 25
    TabOrder = 6
    Text = 'edtLastCreditNoteNumber'
  end
  object btnOK: TBitBtn
    Left = 59
    Top = 268
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 7
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 147
    Top = 268
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 8
  end
  object qryUpCompany: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Company'
      'SET'
      '  Last_Quote_Number = :Last_Quote_Number,'
      '  Last_Contract_Quote_Number = :Last_Contract_Quote_Number,'
      '  Last_Job_Number = :Last_Job_Number,'
      '  Last_Sales_Order_Number = :Last_Sales_Order_Number,'
      '  Last_Purchase_Order_Number = :Last_Purchase_Order_Number,'
      '  Last_Invoice_Number = :Last_Invoice_Number,'
      '  Last_Credit_Note_Number = :Last_Credit_Note_Number'
      'WHERE Company = 1')
    Left = 228
    Top = 224
    ParamData = <
      item
        Name = 'Last_Quote_Number'
      end
      item
        Name = 'Last_Contract_Quote_Number'
      end
      item
        Name = 'Last_Job_Number'
      end
      item
        Name = 'Last_Sales_Order_Number'
      end
      item
        Name = 'Last_Purchase_Order_Number'
      end
      item
        Name = 'Last_Invoice_Number'
      end
      item
        Name = 'Last_Credit_Note_Number'
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT * FROM Company'
      'WHERE Company = 1')
    Left = 24
    Top = 232
  end
end
