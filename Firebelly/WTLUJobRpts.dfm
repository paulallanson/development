object frmWTLUJobRpts: TfrmWTLUJobRpts
  Left = 581
  Top = 265
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Job Production Reports'
  ClientHeight = 184
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 143
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 412
      Height = 143
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
        05A00100000400000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        001757006F0072006B00200069006E002000500072006F006700720065007300
        730020005200650070006F00720074000E460052004D0057005400520053004F
        00550054004A004F00420053000000000000000000FFFFFFFFFFFFFFFF010000
        00FFFFFFFF00000000104A006F0062002000560061006C007500650020005200
        650070006F00720074000F460052004D0057005400520053004A004F00420056
        0041004C00550045000000000000000000FFFFFFFFFFFFFFFF01000000FFFFFF
        FF0000000010520065006D0065006400690061006C0073002000520065007000
        6F007200740013460052004D0057005400520053004A004F004200520045004D
        0045004400490041004C0053000000000000000000FFFFFFFFFFFFFFFF010000
        00FFFFFFFF0000000014520065006D0065006400690061006C00200054007900
        7000650020005200650070006F007200740013460052004D0057005400520053
        00520045004D0045004400490041004C00540059005000450000000000FFFFFF
        FFFFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = enableSelect
      OnDblClick = lstvwReportsDblClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 143
    Width = 412
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      412
      41)
    object btnselect: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Select'
      Enabled = False
      TabOrder = 0
      OnClick = btnselectClick
    end
    object Button2: TButton
      Left = 327
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
