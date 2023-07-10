inherited frmWtMaintEdgeDtls: TfrmWtMaintEdgeDtls
  Caption = 'Edge Details'
  ClientHeight = 155
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [1]
    Left = 8
    Top = 56
    Width = 48
    Height = 13
    Caption = 'Cost Price'
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 88
    Width = 58
    Height = 13
    Caption = 'Selling Price'
  end
  inherited edtDescription: TDBEdit
    Left = 80
    DataSource = nil
  end
  inherited btnOK: TBitBtn
    Top = 120
  end
  inherited BitBtn2: TBitBtn
    Top = 120
  end
  inherited chkbxDontUse: TCheckBox
    Top = 112
  end
  object edtmnyCost: TCREditMoney
    Left = 80
    Top = 48
    Width = 105
    Height = 21
    TabOrder = 4
    Text = '0.00'
  end
  object edtmnySell: TCREditMoney
    Left = 80
    Top = 80
    Width = 105
    Height = 21
    TabOrder = 5
    Text = '0.00'
  end
end
