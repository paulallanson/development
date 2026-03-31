object frmWTMaintTrade: TfrmWTMaintTrade
  Left = 200
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Trade Address details'
  ClientHeight = 396
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object Label8: TLabel
    Left = 16
    Top = 12
    Width = 94
    Height = 17
    Caption = 'Company Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 16
    Top = 47
    Width = 48
    Height = 17
    Caption = 'Address'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 15
    Top = 101
    Width = 30
    Height = 17
    Caption = 'Town'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 16
    Top = 128
    Width = 54
    Height = 17
    Caption = 'Postcode'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 16
    Top = 156
    Width = 40
    Height = 17
    Caption = 'County'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel
    Left = 16
    Top = 188
    Width = 60
    Height = 17
    Caption = 'Telephone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 16
    Top = 217
    Width = 68
    Height = 17
    Caption = 'Fax number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel
    Left = 16
    Top = 245
    Width = 78
    Height = 17
    Caption = 'Web Address'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label18: TLabel
    Left = 16
    Top = 274
    Width = 83
    Height = 17
    Caption = 'Email Address'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label28: TLabel
    Left = 16
    Top = 316
    Width = 100
    Height = 17
    Caption = 'VAT Reg Number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 145
    Top = 363
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ModalResult = 1
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 0
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 233
    Top = 363
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ModalResult = 2
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 1
  end
  object edtName: TDBEdit
    Left = 123
    Top = 8
    Width = 289
    Height = 25
    DataField = 'Trade_Name'
    DataSource = srcTrade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = EnableOK
  end
  object DBEdit10: TDBEdit
    Left = 123
    Top = 43
    Width = 249
    Height = 25
    DataField = 'Street'
    DataSource = srcTrade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object DBEdit11: TDBEdit
    Left = 123
    Top = 70
    Width = 249
    Height = 25
    DataField = 'Locale'
    DataSource = srcTrade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBEdit12: TDBEdit
    Left = 123
    Top = 97
    Width = 169
    Height = 25
    DataField = 'Town_City'
    DataSource = srcTrade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object DBEdit13: TDBEdit
    Left = 123
    Top = 124
    Width = 121
    Height = 25
    CharCase = ecUpperCase
    DataField = 'Postcode'
    DataSource = srcTrade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object DBEdit14: TDBEdit
    Left = 123
    Top = 152
    Width = 169
    Height = 25
    DataField = 'County_State'
    DataSource = srcTrade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object DBEdit15: TDBEdit
    Left = 123
    Top = 184
    Width = 241
    Height = 25
    DataField = 'Telephone_number'
    DataSource = srcTrade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object DBEdit16: TDBEdit
    Left = 123
    Top = 213
    Width = 241
    Height = 25
    DataField = 'Fax_Number'
    DataSource = srcTrade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object DBEdit17: TDBEdit
    Left = 123
    Top = 241
    Width = 297
    Height = 25
    DataField = 'Web_Address'
    DataSource = srcTrade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object DBEdit18: TDBEdit
    Left = 123
    Top = 270
    Width = 297
    Height = 25
    DataField = 'Email_address'
    DataSource = srcTrade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
  end
  object DBEdit24: TDBEdit
    Left = 123
    Top = 312
    Width = 169
    Height = 25
    DataField = 'VAT_Number'
    DataSource = srcTrade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
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
