object PBAccExport1Frm: TPBAccExport1Frm
  Left = 177
  Top = 122
  BorderStyle = bsSingle
  Caption = 'Import and Export Wizard'
  ClientHeight = 478
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 17
  object Label1: TLabel
    Left = 16
    Top = 4
    Width = 172
    Height = 17
    Caption = 'Choose an action to perform:'
  end
  object NextBitBtn: TBitBtn
    Left = 206
    Top = 439
    Width = 75
    Height = 25
    Caption = 'Next'
    TabOrder = 0
    OnClick = NextBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 302
    Top = 439
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = CancelBitBtnClick
  end
  object ActionListBox: TListBox
    Left = 16
    Top = 24
    Width = 361
    Height = 312
    ItemHeight = 17
    Items.Strings = (
      'Export Customer details'
      'Export Supplier details'
      'Export Sales Invoices'
      'Export Purchase Invoices'
      'Export New Order Customer Accounts'
      'Import Currency Rates'
      'Import Stock References'
      'Import Credit Limits'
      'Import Sage Line 50 Customer details'
      'Import Sage Line 50 Supplier details'
      'Import Sage Payments'
      'Import Quickbooks Customer/Supplier details'
      'Import CSV Customer/Supplier/Products/Orders/Invoices'
      'Import Maximiser Contacts'
      'Export Factoring Invoices'
      'Export Invoice Direct Debit details'
      'Import Order and Invoice details')
    TabOrder = 2
    OnClick = ActionListBoxClick
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 337
    Width = 361
    Height = 89
    Caption = 'Description'
    ParentBackground = False
    TabOrder = 3
    object DescriptionLbl: TLabel
      Left = 15
      Top = 22
      Width = 330
      Height = 64
      AutoSize = False
      Caption = 
        'Once upon a time there were three little bears who all lived hap' +
        'pily in the woods.'
      WordWrap = True
    end
  end
  object UpdateBitBtn: TBitBtn
    Left = 14
    Top = 439
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 4
    OnClick = UpdateBitBtnClick
  end
  object ResetBitBtn: TBitBtn
    Left = 110
    Top = 439
    Width = 75
    Height = 25
    Caption = 'Reset'
    TabOrder = 5
    OnClick = ResetBitBtnClick
  end
end
