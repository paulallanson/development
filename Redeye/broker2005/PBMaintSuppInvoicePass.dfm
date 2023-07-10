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
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
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
    TabOrder = 0
  end
  object CloseBitBtn: TBitBtn
    Left = 140
    Top = 88
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object OKBitBtn: TBitBtn
    Left = 52
    Top = 88
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = OKBitBtnClick
    Kind = bkOK
  end
end
