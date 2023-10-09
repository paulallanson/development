object frmPBLUProductionRpts: TfrmPBLUProductionRpts
  Left = 394
  Top = 155
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Production Reports'
  ClientHeight = 271
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
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
        055D0100000300000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        0021500072006F00640075006300740069006F006E0020004400610074006100
        200043006F006C006C0065006300740069006F006E0020005200650070006F00
        72007400115000420052005300500052004F00440041004D0045004E00440053
        00460052004D000000000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF00
        000000185700650065006B006C0079002000500072006F006400750063007400
        69006F006E0020005200650070006F0072007400115000420052005300500052
        004F0044005700450045004B004C005900460052004D000000000000000000FF
        FFFFFFFFFFFFFF01000000FFFFFFFF0000000015440061007400610020004300
        6100700074007500720065002000520061007700200044006100740061000D50
        0042004C0055004A004F0042004C004F004700460052004D0000000000FFFFFF
        FFFFFF}
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
