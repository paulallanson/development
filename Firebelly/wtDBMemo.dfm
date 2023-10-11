object frmwtDBMemo: TfrmwtDBMemo
  Left = 193
  Top = 142
  BorderStyle = bsDialog
  Caption = 'Notes'
  ClientHeight = 278
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object DataMemo: TMemo
    Left = 8
    Top = 8
    Width = 289
    Height = 225
    ScrollBars = ssVertical
    TabOrder = 4
    Visible = False
  end
  object DispMemo: TMemo
    Left = 8
    Top = 8
    Width = 289
    Height = 225
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object CancelBitBtn: TBitBtn
    Left = 224
    Top = 240
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object OkBitBtn: TBitBtn
    Left = 144
    Top = 240
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = OkBitBtnClick
  end
  object CloseBitBtn: TBitBtn
    Left = 224
    Top = 240
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 3
  end
  object ClearBitBtn: TBitBtn
    Left = 8
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Clear'
    Default = True
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
    TabOrder = 5
    OnClick = ClearBitBtnClick
  end
end
