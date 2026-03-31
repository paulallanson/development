object frmWTLUFittingRpts: TfrmWTLUFittingRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Fitting Reports'
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
        05610100000300000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        001C41006E00740069006300690070006100740065006400200049006E007600
        6F006900630069006E00670020005200650070006F007200740013460052004D
        00570054005200530053004F0041004E00540049004E0056004F004900430045
        000000000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000001D5300
        61006C006500730020004F0072006400650072002000500072006F0064007500
        6300740069006F006E0020005200650070006F007200740013460052004D0057
        0054005200530053004F00500052004F00440055004300540049004F004E0000
        00000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000000F57006100
        7200720061006E007400790020005200650070006F007200740011460052004D
        00570054005200530053004F00570041005200520041004E0054005900000000
        00FFFFFFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = enableSelect
      OnDblClick = lstvwReportsDblClick
      ExplicitWidth = 436
      ExplicitHeight = 192
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
      Left = 345
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
