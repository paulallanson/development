object frmWTRSJobFitting: TfrmWTRSJobFitting
  Left = 215
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Print Job Fitting Sheet'
  ClientHeight = 148
  ClientWidth = 349
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    349
    148)
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 41
    Height = 13
    Caption = 'Job No'#39's'
  end
  object memSelection: TMemo
    Left = 8
    Top = 24
    Width = 233
    Height = 57
    ReadOnly = True
    TabOrder = 0
    OnChange = EnableRun
  end
  object btnRun: TButton
    Left = 8
    Top = 116
    Width = 75
    Height = 25
    Anchors = [akBottom]
    Caption = '&Run'
    Enabled = False
    TabOrder = 1
    OnClick = btnRunClick
  end
  object Button4: TButton
    Left = 264
    Top = 116
    Width = 75
    Height = 25
    Anchors = [akBottom]
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button4Click
  end
  object rdgrpOutput: TRadioGroup
    Left = 248
    Top = 18
    Width = 92
    Height = 63
    Caption = '&Output'
    ItemIndex = 1
    Items.Strings = (
      'Print'
      'Preview')
    ParentBackground = False
    TabOrder = 3
  end
  object chkbxAccounts: TCheckBox
    Left = 8
    Top = 88
    Width = 97
    Height = 17
    Caption = 'Accounts copy'
    TabOrder = 4
    Visible = False
  end
end
