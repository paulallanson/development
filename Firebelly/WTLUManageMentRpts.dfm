object frmWTLUManagementRpts: TfrmWTLUManagementRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Management Reports'
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
        05EE0100000400000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        001F530061006C006500730020004F0072006400650072007300200064007500
        6500200066006F0072002000740065006D0070006C006100740069006E006700
        15460052004D00570054005200530053004F005200440045005200540045004D
        0050004C004100540045000000000000000000FFFFFFFFFFFFFFFF01000000FF
        FFFFFF000000001C41006E007400690063006900700061007400650064002000
        49006E0076006F006900630069006E00670020005200650070006F0072007400
        13460052004D00570054005200530053004F0041004E00540049004E0056004F
        004900430045000000000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF00
        00000014530061006C006500730020004F007200640065007200200053006300
        68006500640075006C00650015460052004D00570054005200530053004F0052
        004400450052005300430048004500440055004C0045000000000000000000FF
        FFFFFFFFFFFFFF01000000FFFFFFFF000000001B4A006F006200200057006F00
        72006B00200069006E002000500072006F006700720065007300730020005200
        650070006F00720074000E460052004D0057005400520053004F00550054004A
        004F004200530000000000FFFFFFFFFFFFFFFF}
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
