object PBMaintSuppInvoicePassFrm: TPBMaintSuppInvoicePassFrm
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Pass/Revoke Supplier Invoice'
  ClientHeight = 122
  ClientWidth = 267
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object rdgrpSelection: TRadioGroup
    Left = 40
    Top = 8
    Width = 193
    Height = 65
    Caption = 'rdgrpSelection'
    ItemIndex = 0
    Items.Strings = (
      'Selected Invoice'
      'All Invoices')
    ParentBackground = False
    TabOrder = 0
  end
  object CloseBitBtn: TBitBtn
    Left = 140
    Top = 88
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object OKBitBtn: TBitBtn
    Left = 52
    Top = 88
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = OKBitBtnClick
  end
end
