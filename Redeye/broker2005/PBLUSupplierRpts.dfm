object frmPBLUSupplierRpts: TfrmPBLUSupplierRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Supplier Reports'
  ClientHeight = 271
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
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
        05960100000400000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        00114300610070006100620069006C0069007400790020007200650070006F00
        720074001150004200520053004300410050004100420049004C004900540059
        00460052004D000000000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF00
        0000001A53007500700070006C00690065007200200043006100700061006200
        69006C0069007400790020007200650070006F00720074000D50004200520053
        00530055005000430041005000460052004D000000000000000000FFFFFFFFFF
        FFFFFF01000000FFFFFFFF000000000F53007500700070006C00690065007200
        20005200650070006F00720074000E5000420052005300530055005000500044
        0045005400460052004D000000000000000000FFFFFFFFFFFFFFFF01000000FF
        FFFFFF000000001153007500700070006C00690065007200200043006F006E00
        74006100630074007300125000420052005300530055005000500043004F004E
        005400440045005400460052004D0000000000FFFFFFFFFFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lstvwReportsDblClick
      ExplicitWidth = 413
      ExplicitHeight = 242
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
