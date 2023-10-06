object frmWTLUPOrderRpts: TfrmWTLUPOrderRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Purchase Order Reports'
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
        05770100000300000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        00155000750072006300680061007300650020004F0072006400650072002000
        5200650070006F007200740014460052004D0057005400520053005000550052
        00430048004100530045004F0052004400450052000000000000000000FFFFFF
        FFFFFFFFFF01000000FFFFFFFF000000001E4F00720064006500720073002000
        440075006500200066006F0072002000440065006C0069007600650072007900
        20005200650070006F007200740012460052004D00570054005200530050004F
        004F00520044004500520053004400550045000000000000000000FFFFFFFFFF
        FFFFFF01000000FFFFFFFF00000000184F00750074007300740061006E006400
        69006E00670020004F00720064006500720020005200650070006F0072007400
        19460052004D00570054005200530050004F00520044004500520053004F0055
        0054005300540041004E00440049004E00470000000000FFFFFFFFFFFF}
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
