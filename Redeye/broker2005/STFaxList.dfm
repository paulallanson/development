object STFaxListFrm: TSTFaxListFrm
  Left = 41
  Top = 111
  Caption = 'STFaxListFrm'
  ClientHeight = 310
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 267
    Width = 681
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 501
      Top = 0
      Width = 180
      Height = 43
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
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
    Width = 681
    Height = 267
    Align = alClient
    Caption = 'Panel3'
    ParentBackground = False
    TabOrder = 1
    object FaxListGrid: TStringGrid
      Left = 1
      Top = 1
      Width = 679
      Height = 265
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
