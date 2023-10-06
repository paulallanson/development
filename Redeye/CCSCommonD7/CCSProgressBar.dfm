object frmCCSProgressBar: TfrmCCSProgressBar
  Left = 322
  Top = 114
  BorderStyle = bsSingle
  Caption = 'frmCCSProgressBar'
  ClientHeight = 81
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 64
    Width = 189
    Height = 13
    Caption = 'Please wait ............................................'
  end
  object pnlExportPrgrss: TPanel
    Left = 0
    Top = 0
    Width = 289
    Height = 61
    ParentBackground = False
    TabOrder = 0
    Visible = False
    object lblExporting: TLabel
      Left = 16
      Top = 12
      Width = 53
      Height = 13
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
  object OleContainer1: TOleContainer
    Left = 183
    Top = 12
    Width = 98
    Height = 53
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 1
    Visible = False
  end
end
