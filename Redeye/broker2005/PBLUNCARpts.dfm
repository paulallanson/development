object frmPBLUNCARpts: TfrmPBLUNCARpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Non Conformance Reports'
  ClientHeight = 272
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 409
    Height = 231
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 409
      Height = 231
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
        05F60100000400000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        00194E006F006E00200043006F006E0066006F0072006D0061006E0063006500
        200062007900200052006500610073006F006E001050004200520053004E0043
        00410052004500410053004F004E00460052004D000000000000000000FFFFFF
        FFFFFFFFFF01000000FFFFFFFF00000000214E006F006E00200043006F006E00
        66006F0072006D0061006E0063006500200053006F0075007200630065002000
        41006C006C006F0063006100740069006F006E001050004200520053004E0043
        00410053004F005500520043004500460052004D000000000000000000FFFFFF
        FFFFFFFFFF01000000FFFFFFFF000000001F43006F007300740020006F006600
        20004E006F006E00200043006F006E0066006F0072006D0061006E0063006500
        200062007900200059006500610072001350004200520053004E004300410043
        004F005300540047005200410050004800460052004D000000000000000000FF
        FFFFFFFFFFFFFF01000000FFFFFFFF000000001D4E006F006E00200043006F00
        6E0066006F0072006D0061006E0063006500200043006F0075006E0074002000
        62007900200059006500610072001050004200520053004E004300410043004C
        00490045004E005400460052004D0000000000FFFFFFFFFFFFFFFF}
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
    Top = 231
    Width = 409
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      409
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
      Left = 332
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
