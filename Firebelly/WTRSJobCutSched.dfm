inherited frmWTRSJobCutSched: TfrmWTRSJobCutSched
  Caption = 'Print Cutting schedule'
  ClientHeight = 352
  ClientWidth = 428
  ExplicitWidth = 444
  ExplicitHeight = 391
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 334
    Top = 79
    Width = 41
    Height = 13
    Caption = 'Job No'#39's'
  end
  inherited btnPrint: TButton
    Top = 315
    ExplicitTop = 315
  end
  inherited Button4: TButton
    Top = 315
    ExplicitTop = 315
  end
  inherited btnPreview: TButton
    Top = 315
    ExplicitTop = 315
  end
  object Button1: TButton [7]
    Left = 96
    Top = 157
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'P&review'
    Enabled = False
    TabOrder = 19
    OnClick = Button1Click
  end
  inherited btnEmail: TButton
    Top = 315
    ExplicitTop = 315
  end
  inherited selectionGrp: TGroupBox
    Left = 9
    ExplicitLeft = 9
  end
end
