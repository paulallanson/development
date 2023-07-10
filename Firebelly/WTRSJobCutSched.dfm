inherited frmWTRSJobCutSched: TfrmWTRSJobCutSched
  Caption = 'Print Cutting schedule'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label1: TLabel
    Width = 41
    Caption = 'Job No'#39's'
  end
  object Button1: TButton [7]
    Left = 96
    Top = 160
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'P&review'
    Enabled = False
    TabOrder = 6
    OnClick = Button1Click
  end
  inherited btnPreview: TButton
    TabOrder = 7
  end
  inherited btnEmail: TButton
    TabOrder = 8
  end
end
