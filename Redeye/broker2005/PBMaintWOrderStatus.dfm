object PBMaintWOrderStatusFrm: TPBMaintWOrderStatusFrm
  Left = 367
  Top = 120
  BorderStyle = bsDialog
  Caption = 'Set Works Instruction Status'
  ClientHeight = 121
  ClientWidth = 469
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
    Top = 24
    Width = 55
    Height = 13
    Caption = 'New Status'
  end
  object dblkpWOStatus: TDBLookupComboBox
    Left = 104
    Top = 20
    Width = 185
    Height = 21
    KeyField = 'Works_Order_Status'
    ListField = 'Works_Order_Status_Descr'
    ListSource = dtsWOStatus
    TabOrder = 0
    OnClick = EnableOK
  end
  object btnOK: TBitBtn
    Left = 169
    Top = 72
    Width = 75
    Height = 25
    Enabled = False
    TabOrder = 1
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 257
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object qryWOStatus: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Works_Order_Status'
      'WHERE ((inactive = '#39'N'#39') or (inactive is NULL))'
      'ORDER BY Works_Order_Status')
    Left = 328
    Top = 16
  end
  object dtsWOStatus: TDataSource
    DataSet = qryWOStatus
    Left = 384
    Top = 16
  end
end
