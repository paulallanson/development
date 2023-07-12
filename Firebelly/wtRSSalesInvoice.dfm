object frmwtRSSalesInvoice: TfrmwtRSSalesInvoice
  Left = 278
  Top = 138
  BorderStyle = bsDialog
  Caption = 'Print Sales Invoices'
  ClientHeight = 145
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
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
    ParentBackground = False
    Left = 8
    Top = 10
    Width = 161
    Height = 73
    Caption = 'Invoice Selection'
    ItemIndex = 0
    Items.Strings = (
      'Print selected'
      'Print ALL unprinted')
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
    ParentBackground = False
    Left = 184
    Top = 10
    Width = 113
    Height = 73
    Caption = 'Print Type'
    ItemIndex = 0
    Items.Strings = (
      'Summary'
      'Detailed')
    TabOrder = 4
  end
end
