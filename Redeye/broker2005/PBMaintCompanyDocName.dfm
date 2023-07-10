object PBMaintCompanyDocNameFrm: TPBMaintCompanyDocNameFrm
  Left = 377
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Maintain Details'
  ClientHeight = 96
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 20
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object btnOK: TBitBtn
    Left = 125
    Top = 55
    Width = 75
    Height = 25
    Enabled = False
    TabOrder = 0
    OnClick = btnOKClick
    Kind = bkOK
  end
  object CancelBitBtn: TBitBtn
    Left = 221
    Top = 55
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = CancelBitBtnClick
    Kind = bkCancel
  end
  object edtName: TEdit
    Left = 72
    Top = 16
    Width = 289
    Height = 21
    TabOrder = 2
    Text = 'edtName'
    OnChange = EnableOK
  end
end
