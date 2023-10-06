object frmWTLUSalesInvoiceRpts: TfrmWTLUSalesInvoiceRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Sales Invoice Reports'
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
        05FC0100000400000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        0017530061006C0065007300200062007900200049006E0076006F0069006300
        650020005200650070006F007200740015460052004D00570054005200530053
        0041004C00450053004200590049004E0056004F004900430045000000000000
        000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000000E5000610079006D00
        65006E00740020005200650070006F007200740011460052004D005700540052
        005300530049005000410059004D0045004E00540053000000000000000000FF
        FFFFFFFFFFFFFF01000000FFFFFFFF0000000027530061006C00650073002000
        49006E0076006F0069006300650020005000610079006D0065006E0074002000
        43006F006D00700061007200690073006F006E0020005200650070006F007200
        74001B460052004D005700540052005300530041004C004500530049004E0056
        004F004900430045005000410059004D0045004E005400530000000000000000
        00FFFFFFFFFFFFFFFF01000000FFFFFFFF00000000184D006100740065007200
        690061006C0073002000530061006C0065007300200041006E0061006C007900
        73006900730017460052004D0057005400520053004D00410054004500520049
        0041004C0041004E0041004C00590053004900530000000000FFFFFFFFFFFFFF
        FF}
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
