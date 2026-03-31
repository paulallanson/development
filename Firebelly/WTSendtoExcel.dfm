object frmWTSendtoExcel: TfrmWTSendtoExcel
  Left = 345
  Top = 115
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Exporting to Excel'
  ClientHeight = 72
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object OleContainer1: TOleContainer
    Left = 101
    Top = 16
    Width = 60
    Height = 33
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 0
    Visible = False
  end
  object pnlExportPrgrss: TPanel
    Left = 0
    Top = 1
    Width = 292
    Height = 69
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 1
    Visible = False
    object lblExporting: TLabel
      Left = 16
      Top = 12
      Width = 65
      Height = 17
      Caption = 'Exporting...'
    end
    object prgbrExport: TProgressBar
      Left = 16
      Top = 32
      Width = 257
      Height = 16
      Step = 1
      TabOrder = 0
    end
  end
end
