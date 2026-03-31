object frmWTMaintClient: TfrmWTMaintClient
  Left = 156
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Maintain Client Parameters'
  ClientHeight = 270
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    454
    270)
  TextHeight = 17
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 130
    Height = 17
    Caption = 'Client Mail Application'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 61
    Width = 160
    Height = 17
    Caption = 'Default Attachment file type'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 170
    Width = 125
    Height = 17
    Caption = 'Fax storage Directory'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 117
    Width = 120
    Height = 17
    Caption = 'Default Mail Account'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object AttachDirecEdit: TEdit
    Left = 16
    Top = 189
    Width = 305
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = AttachDirecEditChange
  end
  object BitBtn1: TBitBtn
    Left = 360
    Top = 189
    Width = 75
    Height = 25
    Caption = 'Browse'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 176
    Top = 233
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ModalResult = 1
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn2Click
    ExplicitTop = 191
  end
  object CancelBitBtn: TBitBtn
    Left = 256
    Top = 233
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ModalResult = 2
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 3
    ExplicitTop = 191
  end
  object ApplicDBLCB: TDBLookupComboBox
    Left = 16
    Top = 28
    Width = 249
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    KeyField = 'Email_Application'
    ListField = 'Email_Description'
    ListSource = GepApplicDataSource
    ParentFont = False
    TabOrder = 4
    OnClick = ApplicDBLCBClick
  end
  object TypeDBLCB: TDBLookupComboBox
    Left = 15
    Top = 82
    Width = 249
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    KeyField = 'ExportFilter'
    ListField = 'Description'
    ListSource = GetDefTypDataSource
    ParentFont = False
    TabOrder = 5
    OnClick = TypeDBLCBClick
  end
  object ApplicClrBitBtn: TBitBtn
    Left = 270
    Top = 28
    Width = 25
    Height = 25
    Hint = 'Clear Deafult Client Application'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
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
    ParentFont = False
    TabOrder = 6
    OnClick = ApplicClrBitBtnClick
  end
  object AttachClrBitBtn: TBitBtn
    Left = 270
    Top = 82
    Width = 25
    Height = 25
    Hint = 'Clear Default Attachment file type'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
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
    ParentFont = False
    TabOrder = 7
    OnClick = AttachClrBitBtnClick
  end
  object DirectClrBitBtn: TBitBtn
    Left = 326
    Top = 189
    Width = 25
    Height = 25
    Hint = 'Clear Default Attachment Storage Directory'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
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
    ParentFont = False
    TabOrder = 8
    OnClick = DirectClrBitBtnClick
  end
  object edtEMailAccount: TEdit
    Left = 16
    Top = 137
    Width = 305
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object GetApplicQuery: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from'
      'Email_application')
    Left = 280
    Top = 8
  end
  object GetTypQuery: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from'
      'ExportFilter')
    Left = 358
    Top = 16
  end
  object GepApplicDataSource: TDataSource
    DataSet = GetApplicQuery
    Left = 400
    Top = 8
  end
  object GetDefTypDataSource: TDataSource
    DataSet = GetTypQuery
    Left = 400
    Top = 64
  end
end
