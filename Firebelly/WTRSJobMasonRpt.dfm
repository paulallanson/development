object frmWTRSJobMasonRpt: TfrmWTRSJobMasonRpt
  Left = 232
  Top = 129
  BorderStyle = bsDialog
  Caption = 'Print Mason report'
  ClientHeight = 171
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 44
    Height = 13
    Caption = 'Job No'#39's'
  end
  object memSelection: TMemo
    Left = 8
    Top = 24
    Width = 233
    Height = 97
    TabOrder = 0
    OnChange = EnableRun
  end
  object btnPrint: TButton
    Left = 8
    Top = 136
    Width = 75
    Height = 25
    Caption = '&Print'
    Enabled = False
    TabOrder = 1
    OnClick = btnPrintClick
  end
  object Button4: TButton
    Left = 264
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 2
    OnClick = Button4Click
  end
  object btnPreview: TButton
    Left = 96
    Top = 136
    Width = 75
    Height = 25
    Caption = 'P&review'
    Enabled = False
    TabOrder = 3
    OnClick = btnPreviewClick
  end
end
