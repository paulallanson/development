object PBMaintClientFrm: TPBMaintClientFrm
  Left = 387
  Top = 107
  Anchors = [akLeft, akTop, akBottom]
  BorderStyle = bsDialog
  Caption = 'Maintain Client Parameters'
  ClientHeight = 426
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    458
    426)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 103
    Height = 13
    Caption = 'Client Mail Application'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 130
    Height = 13
    Caption = 'Default Attachment file type'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 197
    Width = 108
    Height = 13
    Caption = 'Email storage Directory'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 104
    Width = 139
    Height = 13
    Caption = 'Default General Mail Account'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 344
    Width = 120
    Height = 13
    Caption = 'Activity Reminder Interval'
  end
  object Label6: TLabel
    Left = 88
    Top = 365
    Width = 21
    Height = 13
    Caption = 'mins'
  end
  object Label7: TLabel
    Left = 16
    Top = 152
    Width = 145
    Height = 13
    Caption = 'Default Invoicing Mail Account'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 16
    Top = 248
    Width = 89
    Height = 13
    Caption = 'Default Email Font:'
  end
  object AttachDirecEdit: TEdit
    Left = 16
    Top = 213
    Width = 305
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    OnChange = AttachDirecEditChange
  end
  object BitBtn1: TBitBtn
    Left = 368
    Top = 213
    Width = 75
    Height = 25
    Caption = 'Browse'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = BitBtn1Click
  end
  object btnOK: TBitBtn
    Left = 288
    Top = 391
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 368
    Top = 391
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    Kind = bkCancel
  end
  object ApplicDBLCB: TDBLookupComboBox
    Left = 16
    Top = 24
    Width = 249
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'Email_Application'
    ListField = 'Email_Description'
    ListSource = GepApplicDataSource
    ParentFont = False
    TabOrder = 0
    OnClick = ApplicDBLCBClick
  end
  object TypeDBLCB: TDBLookupComboBox
    Left = 16
    Top = 72
    Width = 249
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'ExportFilter'
    ListField = 'Description'
    ListSource = GetDefTypDataSource
    ParentFont = False
    TabOrder = 2
    OnClick = TypeDBLCBClick
  end
  object ApplicClrBitBtn: TBitBtn
    Left = 270
    Top = 24
    Width = 25
    Height = 25
    Hint = 'Clear Deafult Client Application'
    TabOrder = 1
    OnClick = ApplicClrBitBtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
      555557777F777555F55500000000555055557777777755F75555005500055055
      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
      5555577FF77577FF555555005050110555555577F757777FF555555505099910
      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
      3055577F75F77777575F55005055090B030555775755777575755555555550B0
      B03055555F555757575755550555550B0B335555755555757555555555555550
      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
      50BB555555555555575F555555555555550B5555555555555575}
    NumGlyphs = 2
  end
  object AttachClrBitBtn: TBitBtn
    Left = 270
    Top = 71
    Width = 25
    Height = 25
    Hint = 'Clear Default Attachment file type'
    TabOrder = 3
    OnClick = AttachClrBitBtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
      555557777F777555F55500000000555055557777777755F75555005500055055
      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
      5555577FF77577FF555555005050110555555577F757777FF555555505099910
      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
      3055577F75F77777575F55005055090B030555775755777575755555555550B0
      B03055555F555757575755550555550B0B335555755555757555555555555550
      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
      50BB555555555555575F555555555555550B5555555555555575}
    NumGlyphs = 2
  end
  object DirectClrBitBtn: TBitBtn
    Left = 326
    Top = 212
    Width = 25
    Height = 25
    Hint = 'Clear Default Attachment Storage Directory'
    TabOrder = 7
    OnClick = DirectClrBitBtnClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
      555557777F777555F55500000000555055557777777755F75555005500055055
      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
      5555577FF77577FF555555005050110555555577F757777FF555555505099910
      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
      3055577F75F77777575F55005055090B030555775755777575755555555550B0
      B03055555F555757575755550555550B0B335555755555757555555555555550
      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
      50BB555555555555575F555555555555550B5555555555555575}
    NumGlyphs = 2
  end
  object edtEMailAccount: TEdit
    Left = 16
    Top = 118
    Width = 425
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object spnInterval: TSpinEdit
    Left = 16
    Top = 360
    Width = 65
    Height = 22
    Increment = 15
    MaxValue = 600
    MinValue = 15
    TabOrder = 9
    Value = 15
    OnChange = spnIntervalChange
  end
  object edtInvoiceEmailAccount: TEdit
    Left = 16
    Top = 166
    Width = 425
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object FontName: TComboBox
    Left = 16
    Top = 268
    Width = 173
    Height = 21
    Hint = 'Font Name|Select font name'
    Ctl3D = False
    DropDownCount = 10
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 12
    OnClick = FontNameClick
  end
  object edtFontSize: TEdit
    Left = 201
    Top = 267
    Width = 26
    Height = 22
    Hint = 'Font Size|Select font size'
    TabOrder = 13
    Text = '8'
  end
  object UpDown1: TUpDown
    Left = 227
    Top = 267
    Width = 15
    Height = 22
    Associate = edtFontSize
    Position = 8
    TabOrder = 14
  end
  object GetApplicQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from'
      'Email_application')
    Left = 320
    Top = 24
  end
  object GetTypQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from'
      'ExportFilter'
      ''
      ' ')
    Left = 320
    Top = 72
  end
  object GepApplicDataSource: TDataSource
    DataSet = GetApplicQuery
    Left = 360
    Top = 24
  end
  object GetDefTypDataSource: TDataSource
    DataSet = GetTypQuery
    Left = 352
    Top = 72
  end
end
