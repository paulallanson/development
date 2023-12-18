object frmPBLUEnquiryRpts: TfrmPBLUEnquiryRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Enquiry Reports'
  ClientHeight = 271
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 405
    Height = 230
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
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
        05600200000600000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        0011430075007200720065006E007400200045006E0071007500690072006900
        650073000D500042005200530045004E005100530045004C00460052004D0000
        00000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF00000000194F007600
        650072002000640075006500200045006E007100750069007200690065007300
        20007200650070006F00720074000E50004200520053004F0044005500450045
        004E005100460052004D000000000000000000FFFFFFFFFFFFFFFF01000000FF
        FFFFFF000000001A4F0076006500720020006400750065002000510075006F00
        74006100740069006F006E00730020007200650070006F00720074000E500042
        00520053004F00440055004500510054004500460052004D0000000000000000
        00FFFFFFFFFFFFFFFF01000000FFFFFFFF00000000135000720069006E007400
        2F00460061007800200045006E0071007500690072006900650073000A500042
        005200530045004E005100460052004D000000000000000000FFFFFFFFFFFFFF
        FF01000000FFFFFFFF00000000145000720069006E0074002F00460061007800
        2000510075006F0074006100740069006F006E0073000A500042005200530051
        0055004F00460052004D000000000000000000FFFFFFFFFFFFFFFF01000000FF
        FFFFFF000000001353007500700070006C00690065007200200043006F006D00
        700061007200690073006F006E0012500042005200530045004E005100530055
        005000500043004F004D005000460052004D0000000000FFFFFFFFFFFFFFFFFF
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
    ParentBackground = False
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
