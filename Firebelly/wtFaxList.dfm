object frmWTFaxList: TfrmWTFaxList
  Left = 121
  Top = 124
  Caption = 'frmWTFaxList'
  ClientHeight = 211
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 168
    Width = 466
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 286
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
    Width = 466
    Height = 168
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 1
    object FaxListGrid: TStringGrid
      Left = 1
      Top = 1
      Width = 464
      Height = 166
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
        226
        126)
    end
  end
end
