object frmWTLUTemplatingRpts: TfrmWTLUTemplatingRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Templating Reports'
  ClientHeight = 242
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 442
    Height = 201
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 442
      Height = 201
      Align = alClient
      Columns = <
        item
          Caption = 'Description'
          Width = 250
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
        05870100000300000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        001F530061006C006500730020004F0072006400650072007300200064007500
        6500200066006F0072002000740065006D0070006C006100740069006E006700
        15460052004D00570054005200530053004F005200440045005200540045004D
        0050004C004100540045000000000000000000FFFFFFFFFFFFFFFF01000000FF
        FFFFFF000000001B41006E007400690063006900700061007400650064002000
        4F00720064006500720069006E00670020005200650070006F00720074001446
        0052004D00570054005200530053004F0041004E0054004F0052004400450052
        0049004E0047000000000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF00
        0000001C41006E00740069006300690070006100740065006400200049006E00
        76006F006900630069006E00670020005200650070006F007200740013460052
        004D00570054005200530053004F0041004E00540049004E0056004F00490043
        00450000000000FFFFFFFFFFFF}
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
    Top = 201
    Width = 442
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      442
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
      Left = 357
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
