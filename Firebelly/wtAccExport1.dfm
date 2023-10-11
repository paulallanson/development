object frmWTAccExport1: TfrmWTAccExport1
  Left = 177
  Top = 122
  BorderStyle = bsSingle
  Caption = 'Import and Export Wizard'
  ClientHeight = 385
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 136
    Height = 13
    Caption = 'Choose an action to perform:'
  end
  object NextBitBtn: TBitBtn
    Left = 176
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Next'
    TabOrder = 0
    OnClick = NextBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 256
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = CancelBitBtnClick
  end
  object ActionListBox: TListBox
    Left = 16
    Top = 24
    Width = 313
    Height = 225
    ItemHeight = 13
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
      'Import CSV Customer/Supplier/Worktops/Edges/CutOuts details'
      'Import Maximiser Contacts'
      'Export Factoring Invoices')
    TabOrder = 2
    OnClick = ActionListBoxClick
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 256
    Width = 313
    Height = 89
    Caption = 'Description'
    ParentBackground = False
    TabOrder = 3
    object DescriptionLbl: TLabel
      Left = 8
      Top = 17
      Width = 289
      Height = 64
      AutoSize = False
      Caption = 
        'Once upon a time there were three little bears who all lived hap' +
        'pily in the woods.'
      WordWrap = True
    end
  end
  object UpdateBitBtn: TBitBtn
    Left = 16
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 4
    OnClick = UpdateBitBtnClick
  end
  object ResetBitBtn: TBitBtn
    Left = 96
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Reset'
    TabOrder = 5
    OnClick = ResetBitBtnClick
  end
end
