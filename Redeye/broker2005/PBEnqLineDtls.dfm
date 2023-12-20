object PBEnqLineDtlsFrm: TPBEnqLineDtlsFrm
  Left = 127
  Top = 122
  Caption = 'Add Enquiry Line details'
  ClientHeight = 404
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 635
    Height = 348
    Shape = bsFrame
  end
  object Label7: TLabel
    Left = 34
    Top = 19
    Width = 59
    Height = 13
    Caption = 'Description'
  end
  object Label9: TLabel
    Left = 26
    Top = 47
    Width = 66
    Height = 13
    Caption = 'Product Type'
  end
  object Label12: TLabel
    Left = 64
    Top = 134
    Width = 32
    Height = 13
    Caption = 'Depth'
  end
  object Label13: TLabel
    Left = 66
    Top = 163
    Width = 32
    Height = 13
    Caption = 'Width'
  end
  object Label10: TLabel
    Left = 7
    Top = 195
    Width = 83
    Height = 13
    Caption = 'Number of Parts'
  end
  object Label15: TLabel
    Left = 36
    Top = 251
    Width = 58
    Height = 13
    Caption = 'Qty per Box'
  end
  object Label11: TLabel
    Left = 482
    Top = 283
    Width = 88
    Height = 13
    Caption = 'Number of Plates'
  end
  object Label1: TLabel
    Left = 56
    Top = 275
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'Artwork'
  end
  object Label2: TLabel
    Left = 8
    Top = 224
    Width = 82
    Height = 13
    Caption = 'NCR/OTC/Mixed'
  end
  object Label5: TLabel
    Left = 8
    Top = 75
    Width = 80
    Height = 13
    Caption = 'Form Reference'
  end
  object Label3: TLabel
    Left = 434
    Top = 227
    Width = 87
    Height = 13
    Caption = 'Run On Quantity'
  end
  object Label4: TLabel
    Left = 36
    Top = 104
    Width = 53
    Height = 13
    Caption = 'Form Desc'
  end
  object Label6: TLabel
    Left = 188
    Top = 195
    Width = 44
    Height = 13
    Caption = 'Job Type'
  end
  object LineDescEdit: TEdit
    Tag = 1
    Left = 108
    Top = 11
    Width = 359
    Height = 21
    Ctl3D = True
    MaxLength = 80
    ParentCtl3D = False
    TabOrder = 0
    OnChange = LineDescEditChange
  end
  object DepthEdit: TEdit
    Tag = 3
    Left = 108
    Top = 126
    Width = 65
    Height = 21
    TabOrder = 7
    OnChange = DepthEditChange
    OnKeyPress = DepthEditKeyPress
  end
  object WidthEdit: TEdit
    Tag = 4
    Left = 108
    Top = 155
    Width = 65
    Height = 21
    TabOrder = 10
    OnChange = WidthEditChange
    OnKeyPress = WidthEditKeyPress
  end
  object NoPartSpin: TSpinEdit
    Tag = 7
    Left = 108
    Top = 187
    Width = 41
    Height = 22
    MaxValue = 100
    MinValue = 0
    TabOrder = 13
    Value = 0
    OnChange = NoPartSpinChange
  end
  object BoxQtyEdit: TEdit
    Tag = 8
    Left = 108
    Top = 243
    Width = 221
    Height = 21
    MaxLength = 40
    TabOrder = 15
    OnChange = BoxQtyEditChange
  end
  object PlateSpin: TSpinEdit
    Tag = 12
    Left = 582
    Top = 275
    Width = 41
    Height = 22
    MaxValue = 100
    MinValue = 0
    TabOrder = 18
    Value = 0
  end
  object QtyGrid: TStringGrid
    Tag = 20
    Left = 532
    Top = 11
    Width = 89
    Height = 201
    ColCount = 1
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 19
    OnDrawCell = QtyGridDrawCell
    OnKeyPress = QtyGridKeyPress
    OnKeyUp = QtyGridKeyUp
    OnMouseUp = QtyGridMouseUp
    ColWidths = (
      83)
  end
  object OKBtn: TBitBtn
    Left = 236
    Top = 355
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    Glyph.Data = {
      BE060000424DBE06000000000000360400002800000024000000120000000100
      0800000000008802000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      03030303030303030303030303030303030303030303FF030303030303030303
      03030303030303040403030303030303030303030303030303F8F8FF03030303
      03030303030303030303040202040303030303030303030303030303F80303F8
      FF030303030303030303030303040202020204030303030303030303030303F8
      03030303F8FF0303030303030303030304020202020202040303030303030303
      0303F8030303030303F8FF030303030303030304020202FA0202020204030303
      0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
      040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
      03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
      FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
      0303030303030303030303FA0202020403030303030303030303030303F8FF03
      03F8FF03030303030303030303030303FA020202040303030303030303030303
      0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
      03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
      030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
      0202040303030303030303030303030303F8FF03F8FF03030303030303030303
      03030303FA0202030303030303030303030303030303F8FFF803030303030303
      030303030303030303FA0303030303030303030303030303030303F803030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303}
    NumGlyphs = 2
    TabOrder = 21
    OnClick = OKBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 324
    Top = 355
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 22
    OnClick = CancelBitBtnClick
  end
  object Unit1: TEdit
    Tag = 5
    Left = 178
    Top = 126
    Width = 49
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 8
    Text = 'mm'
  end
  object UpDown1: TUpDown
    Left = 210
    Top = 126
    Width = 16
    Height = 23
    TabOrder = 9
    TabStop = True
    OnChanging = UpDown1Changing
  end
  object Unit2: TEdit
    Tag = 6
    Left = 178
    Top = 155
    Width = 49
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 11
    Text = 'mm'
  end
  object UpDown2: TUpDown
    Left = 210
    Top = 155
    Width = 16
    Height = 23
    TabOrder = 12
    TabStop = True
    OnChanging = UpDown2Changing
  end
  object NCR_OTCCombo: TComboBox
    Tag = 10
    Left = 108
    Top = 216
    Width = 167
    Height = 21
    Style = csDropDownList
    TabOrder = 14
    OnChange = NCR_OTCComboChange
    OnClick = NCR_OTCComboClick
    OnDropDown = NCR_OTCComboDropDown
  end
  object NCR_OTCEdit: TEdit
    Tag = 11
    Left = 490
    Top = 107
    Width = 33
    Height = 21
    TabStop = False
    TabOrder = 23
    Visible = False
  end
  object ProductTypeEdit: TEdit
    Tag = 2
    Left = 108
    Top = 39
    Width = 255
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 1
    OnChange = ProductTypeEditChange
  end
  object CheckBox1: TCheckBox
    Tag = 13
    Left = 0
    Top = 363
    Width = 137
    Height = 17
    TabStop = False
    Caption = 'Firm Order received'
    TabOrder = 24
    Visible = False
  end
  object FormRefEdit: TEdit
    Tag = 14
    Left = 108
    Top = 68
    Width = 255
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 3
  end
  object FormRefDescEdit: TEdit
    Tag = 15
    Left = 108
    Top = 96
    Width = 345
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object ProductTypeBitBtn: TBitBtn
    Left = 370
    Top = 39
    Width = 25
    Height = 25
    Hint = 'select Product Type'
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ProductTypeBitBtnClick
  end
  object FormRefBitBtn: TBitBtn
    Left = 370
    Top = 68
    Width = 25
    Height = 25
    Hint = 'select Form Reference'
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = FormRefBitBtnClick
  end
  object BitBtn1: TBitBtn
    Left = 402
    Top = 68
    Width = 75
    Height = 25
    Hint = 'Clear Form Reference'
    Caption = 'Clear'
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object ArtEdit: TMemo
    Tag = 9
    Left = 108
    Top = 275
    Width = 329
    Height = 65
    MaxLength = 80
    ScrollBars = ssVertical
    TabOrder = 16
  end
  object ArtworkBitBtn: TBitBtn
    Left = 442
    Top = 275
    Width = 25
    Height = 25
    Hint = 'select Product Type'
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    OnClick = ArtworkBitBtnClick
  end
  object edtRunOnQty: TEdit
    Tag = 17
    Left = 532
    Top = 219
    Width = 89
    Height = 21
    TabOrder = 20
  end
  object btnDefaultSize: TBitBtn
    Left = 234
    Top = 124
    Width = 25
    Height = 25
    Hint = 'select Form Reference'
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 25
    OnClick = btnDefaultSizeClick
  end
  object cmbbxJobType: TComboBox
    Left = 256
    Top = 188
    Width = 213
    Height = 21
    TabOrder = 26
    OnChange = cmbbxJobTypeChange
  end
  object btbtnDelJobType: TBitBtn
    Left = 474
    Top = 188
    Width = 27
    Height = 25
    Hint = 'Clear Form Reference'
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 27
    OnClick = btbtnDelJobTypeClick
  end
  object ProductSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from Product_Type')
    Left = 400
    Top = 40
  end
  object NCRSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from NCR_OTC_Mix')
    Left = 480
    Top = 16
  end
  object StdSizeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from  Paper_size'
      'order by Description')
    Left = 408
    Top = 104
  end
  object qrySelJobType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from job_type')
    Left = 404
    Top = 184
  end
end
