object PBMaintWOrderStatusFrm: TPBMaintWOrderStatusFrm
  Left = 367
  Top = 120
  BorderStyle = bsDialog
  Caption = 'Set Works Instruction Status'
  ClientHeight = 121
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 65
    Height = 17
    Caption = 'New Status'
  end
  object dblkpWOStatus: TDBLookupComboBox
    Left = 104
    Top = 20
    Width = 185
    Height = 25
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
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TBitBtn
    Left = 257
    Top = 72
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object qryWOStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Works_Order_Status'
      'WHERE ((inactive = '#39'N'#39') or (inactive is NULL))'
      'ORDER BY Works_Order_Status')
    Left = 18
    Top = 52
  end
  object dtsWOStatus: TDataSource
    DataSet = qryWOStatus
    Left = 96
    Top = 52
  end
end
