object PBMaintPOrdLInactiveFrm: TPBMaintPOrdLInactiveFrm
  Left = 244
  Top = 145
  BorderStyle = bsDialog
  Caption = 'Cancel Call Off Order'
  ClientHeight = 92
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 37
    Height = 13
    Caption = 'Reason'
  end
  object DBLUReason: TDBLookupComboBox
    Left = 72
    Top = 16
    Width = 257
    Height = 21
    KeyField = 'InActive_Reason'
    ListField = 'Description'
    ListSource = srcReason
    TabOrder = 0
    OnClick = DBLUReasonClick
  end
  object BitBtn1: TBitBtn
    Left = 336
    Top = 16
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object btnOK: TBitBtn
    Left = 200
    Top = 56
    Width = 75
    Height = 25
    Enabled = False
    TabOrder = 2
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 288
    Top = 56
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object chkReActivate: TCheckBox
    Left = 16
    Top = 64
    Width = 97
    Height = 17
    Caption = 'Re-activate'
    TabOrder = 4
    OnClick = chkReActivateClick
  end
  object qryReason: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Inactive_reason')
    Left = 104
    Top = 41
  end
  object srcReason: TDataSource
    DataSet = qryReason
    Left = 168
    Top = 41
  end
end
