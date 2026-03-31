object frmwtRSSalesInvoice: TfrmwtRSSalesInvoice
  Left = 278
  Top = 138
  BorderStyle = bsDialog
  Caption = 'Print Sales Invoices'
  ClientHeight = 143
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 17
  object btnPrint: TButton
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Caption = '&Print'
    TabOrder = 0
    OnClick = btnPrintClick
  end
  object Button4: TButton
    Left = 224
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = Button4Click
  end
  object SelectionGroup: TRadioGroup
    Left = 8
    Top = 10
    Width = 161
    Height = 68
    Caption = 'Invoice Selection'
    ItemIndex = 0
    Items.Strings = (
      'Print selected'
      'Print ALL unprinted')
    ParentBackground = False
    TabOrder = 2
  end
  object btnPreview: TButton
    Left = 96
    Top = 104
    Width = 75
    Height = 25
    Caption = 'P&review'
    TabOrder = 3
    OnClick = btnPreviewClick
  end
  object rdgrpType: TRadioGroup
    Left = 184
    Top = 10
    Width = 113
    Height = 68
    Caption = 'Print Type'
    ItemIndex = 0
    Items.Strings = (
      'Summary'
      'Detailed')
    ParentBackground = False
    TabOrder = 4
  end
end
