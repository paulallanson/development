object frmPBLUProspectRpts: TfrmPBLUProspectRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Prospect Reports'
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
        05DC0000000200000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        0016500072006F00730070006500630074002F004200720061006E0063006800
        20005200650070006F00720074000E5000420052005300430055005300540044
        0045005400460052004D000000000000000000FFFFFFFFFFFFFFFF01000000FF
        FFFFFF0000000017500072006F0073007000650063007400200043006F006E00
        740061006300740020005200650070006F007200740012500042005200530043
        0055005300540043004F004E005400440045005400460052004D0000000000FF
        FFFFFF}
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
