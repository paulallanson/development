object frmPBLUStocktake: TfrmPBLUStocktake
  Left = 394
  Top = 155
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Stocktake'
  ClientHeight = 271
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 405
    Height = 230
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 405
      Height = 230
      Align = alClient
      Columns = <
        item
          Caption = 'Description'
          Width = 200
        end
        item
          Caption = 'File Name'
          Width = 100
        end
        item
          Caption = 'Item No'
          Width = 0
        end>
      Items.ItemData = {
        05620200000700000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        000F5000720069006E007400200057006F0072006B0073006800650065007400
        0C53005400530054004B0054004B0053004C00460052004D0000000000000000
        00FFFFFFFFFFFFFFFF01000000FFFFFFFF000000001246007200650065007A00
        65002000530074006F0063006B00200043006F0075006E0074000E5300540053
        0054004B0054004B00530045004C00460052004D0031000000000000000000FF
        FFFFFFFFFFFFFF01000000FFFFFFFF000000001545006E007400650072002000
        530074006F0063006B00740061006B006500200043006F0075006E0074000E53
        005400530054004B0054004B00530045004C00460052004D0032000000000000
        000000FFFFFFFFFFFFFFFF01000000FFFFFFFF0000000013530074006F006300
        6B00740061006B0065002000560061006C0075006100740069006F006E000E53
        005400530054004B0054004B00530045004C00460052004D0033000000000000
        000000FFFFFFFFFFFFFFFF01000000FFFFFFFF0000000014530074006F006300
        6B00200043006F0075006E0074002000560061007200690061006E0063006500
        0E53005400530054004B0054004B00530045004C00460052004D003400000000
        0000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF0000000012550070006400
        6100740065002000530074006F0063006B00200043006F0075006E0074000E53
        005400530054004B0054004B00530045004C00460052004D0035000000000000
        000000FFFFFFFFFFFFFFFF00000000FFFFFFFF0000000000FFFFFFFFFFFFFFFF
        FFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lstvwReportsDblClick
      ExplicitWidth = 413
      ExplicitHeight = 235
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 230
    Width = 405
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      405
      41)
    object btnRun: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Run'
      TabOrder = 0
      OnClick = btnRunClick
    end
    object Button2: TButton
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
