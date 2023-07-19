object frmWTMaintTrade: TfrmWTMaintTrade
  Left = 200
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Trade Address details'
  ClientHeight = 363
  ClientWidth = 437
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 16
    Top = 12
    Width = 75
    Height = 13
    Caption = 'Company Name'
  end
  object Label11: TLabel
    Left = 16
    Top = 52
    Width = 38
    Height = 13
    Caption = 'Address'
  end
  object Label13: TLabel
    Left = 15
    Top = 100
    Width = 27
    Height = 13
    Caption = 'Town'
  end
  object Label14: TLabel
    Left = 16
    Top = 124
    Width = 45
    Height = 13
    Caption = 'Postcode'
  end
  object Label15: TLabel
    Left = 16
    Top = 148
    Width = 33
    Height = 13
    Caption = 'County'
  end
  object Label16: TLabel
    Left = 16
    Top = 188
    Width = 51
    Height = 13
    Caption = 'Telephone'
  end
  object Label12: TLabel
    Left = 16
    Top = 212
    Width = 55
    Height = 13
    Caption = 'Fax number'
  end
  object Label17: TLabel
    Left = 16
    Top = 236
    Width = 64
    Height = 13
    Caption = 'Web Address'
  end
  object Label18: TLabel
    Left = 16
    Top = 260
    Width = 66
    Height = 13
    Caption = 'Email Address'
  end
  object Label28: TLabel
    Left = 16
    Top = 292
    Width = 84
    Height = 13
    Caption = 'VAT Reg Number'
  end
  object btnOK: TBitBtn
    Left = 145
    Top = 328
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 233
    Top = 328
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    NumGlyphs = 2
  end
  object edtName: TDBEdit
    Left = 104
    Top = 8
    Width = 289
    Height = 21
    DataField = 'Trade_Name'
    DataSource = srcTrade
    TabOrder = 2
    OnChange = EnableOK
  end
  object DBEdit10: TDBEdit
    Left = 104
    Top = 48
    Width = 249
    Height = 21
    DataField = 'Street'
    DataSource = srcTrade
    TabOrder = 3
  end
  object DBEdit11: TDBEdit
    Left = 104
    Top = 72
    Width = 249
    Height = 21
    DataField = 'Locale'
    DataSource = srcTrade
    TabOrder = 4
  end
  object DBEdit12: TDBEdit
    Left = 104
    Top = 96
    Width = 169
    Height = 21
    DataField = 'Town_City'
    DataSource = srcTrade
    TabOrder = 5
  end
  object DBEdit13: TDBEdit
    Left = 104
    Top = 120
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    DataField = 'Postcode'
    DataSource = srcTrade
    TabOrder = 6
  end
  object DBEdit14: TDBEdit
    Left = 104
    Top = 144
    Width = 169
    Height = 21
    DataField = 'County_State'
    DataSource = srcTrade
    TabOrder = 7
  end
  object DBEdit15: TDBEdit
    Left = 104
    Top = 184
    Width = 241
    Height = 21
    DataField = 'Telephone_number'
    DataSource = srcTrade
    TabOrder = 8
  end
  object DBEdit16: TDBEdit
    Left = 104
    Top = 208
    Width = 241
    Height = 21
    DataField = 'Fax_Number'
    DataSource = srcTrade
    TabOrder = 9
  end
  object DBEdit17: TDBEdit
    Left = 104
    Top = 232
    Width = 297
    Height = 21
    DataField = 'Web_Address'
    DataSource = srcTrade
    TabOrder = 10
  end
  object DBEdit18: TDBEdit
    Left = 104
    Top = 256
    Width = 297
    Height = 21
    DataField = 'Email_address'
    DataSource = srcTrade
    TabOrder = 11
  end
  object DBEdit24: TDBEdit
    Left = 104
    Top = 288
    Width = 169
    Height = 21
    DataField = 'VAT_Number'
    DataSource = srcTrade
    TabOrder = 12
  end
  object srcTrade: TDataSource
    DataSet = tblTrade
    Left = 312
    Top = 144
  end
  object tblTrade: TFDTable
    ConnectionName = 'wt'
    TableName = 'Trade_Address'
    Left = 256
    Top = 144
  end
end
