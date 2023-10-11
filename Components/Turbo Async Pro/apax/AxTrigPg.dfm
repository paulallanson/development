object ApxTriggerPage: TApxTriggerPage
  Left = 381
  Top = 287
  Width = 358
  Height = 300
  Caption = 'Data Triggers'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object sgTriggers: TStringGrid
    Left = 0
    Top = 0
    Width = 350
    Height = 266
    Align = alClient
    ColCount = 2
    DefaultRowHeight = 18
    RowCount = 100
    Options = [goFixedHorzLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goTabs]
    TabOrder = 0
    OnSetEditText = sgTriggersSetEditText
  end
end
