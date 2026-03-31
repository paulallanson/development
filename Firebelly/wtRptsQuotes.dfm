object frmwtRptsQuotes: TfrmwtRptsQuotes
  Left = 169
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Quote reports'
  ClientHeight = 288
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  Position = poDefault
  Visible = True
  TextHeight = 17
  object ListView1: TListView
    Left = 8
    Top = 8
    Width = 393
    Height = 150
    Columns = <
      item
        Caption = 'Report Name'
      end
      item
        Caption = 'File Name'
      end>
    TabOrder = 0
    ViewStyle = vsReport
  end
end
