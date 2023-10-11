object PBMaintPOrdLViewFrm: TPBMaintPOrdLViewFrm
  Left = 96
  Top = 95
  Caption = 'View Order Line details'
  ClientHeight = 385
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object pnlLines: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 350
    Align = alClient
    Caption = 'pnlLines'
    ParentBackground = False
    TabOrder = 0
    object LineDetsStringGrid: TStringGrid
      Left = 1
      Top = 1
      Width = 592
      Height = 348
      Align = alClient
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      TabOrder = 0
      OnDblClick = LineDetsStringGridDblClick
      OnDrawCell = LineDetsStringGridDrawCell
      ColWidths = (
        41
        203
        201
        68
        64)
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 350
    Width = 594
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 217
      Top = 5
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 297
      Top = 5
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
end
