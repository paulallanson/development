object frmPBLUSalesOrdersRpts: TfrmPBLUSalesOrdersRpts
  Left = 210
  Top = 109
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Sales Order Reports'
  ClientHeight = 271
  ClientWidth = 405
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
    Width = 405
    Height = 230
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 399
    ExplicitHeight = 221
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
        05F90200000700000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        001543007500730074006F006D00650072002000530061006C00650073002000
        7200650070006F0072007400125300540052005300530041004C004500530042
        0059004300550053005400460052004D000000000000000000FFFFFFFFFFFFFF
        FF01000000FFFFFFFF000000000F440065006C00690076006500720079002000
        7200650070006F007200740012530054005200530053004F0052004400450052
        00440045004C0049005600460052004D000000000000000000FFFFFFFFFFFFFF
        FF01000000FFFFFFFF000000000D500072006F00660069007400200072006500
        70006F0072007400105300540052005300500052004F00460049005400520045
        005000460052004D000000000000000000FFFFFFFFFFFFFFFF01000000FFFFFF
        FF0000000019500072006F00640075006300740069006F006E00200052006500
        7400750072006E00730020005200650070006F00720074001053005400520053
        0053004F00520045005400550052004E005300460052004D0000000000000000
        00FFFFFFFFFFFFFFFF01000000FFFFFFFF0000000014530061006C0065007300
        200048006900730074006F007200790020007200650070006F00720074001053
        0054005200530053004F0048004900530054004F0052005900460052004D0000
        00000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000001757006F00
        72006B00200069006E002000500072006F006700720065007300730020007200
        650070006F00720074000D530054005200530057004F0052004B004900500046
        0052004D000000000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        0020530061006C0065007300200048006900730074006F007200790020005200
        650070006F007200740020002D00200049006E0063006C007500730069007600
        6500135300540052005300530041004C004500530048004900530054004F0052
        005900460052004D0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF}
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
    ExplicitTop = 221
    ExplicitWidth = 399
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
      Left = 322
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 1
      OnClick = Button2Click
      ExplicitLeft = 316
    end
  end
end
