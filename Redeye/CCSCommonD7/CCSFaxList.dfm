object CCSFaxListFrm: TCCSFaxListFrm
  Left = 64
  Top = 175
  Caption = 'CCSFaxListFrm'
  ClientHeight = 298
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 255
    Width = 673
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 493
      Top = 0
      Width = 180
      Height = 43
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 6
        Top = 8
        Width = 75
        Height = 25
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
      end
      object BitBtn2: TBitBtn
        Left = 94
        Top = 8
        Width = 75
        Height = 25
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 673
    Height = 255
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 1
    object FaxListGrid: TStringGrid
      Left = 1
      Top = 1
      Width = 671
      Height = 253
      Align = alClient
      ColCount = 3
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
      OnKeyPress = FaxListGridKeyPress
      OnSelectCell = FaxListGridSelectCell
      ColWidths = (
        64
        425
        126)
    end
  end
end
