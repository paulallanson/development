object frmPBLUActivityReports: TfrmPBLUActivityReports
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Activity Reports'
  ClientHeight = 263
  ClientWidth = 403
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
    Width = 403
    Height = 222
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 403
      Height = 222
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
        05650000000100000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        000F4100630074006900760069007400790020005200650070006F0072007400
        1350004200520053004100430054004900560049005400590043005500530054
        00460052004D0000000000FFFF}
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
    Top = 222
    Width = 403
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      403
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
