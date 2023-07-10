inherited frmWTLUCoutThickness: TfrmWTLUCoutThickness
  Caption = 'Cut Out thickness prices'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Label1: TLabel
    Width = 44
    Caption = 'Cut Out'
  end
  inherited DBText1: TDBText
    DataSource = dtmdlDatabase.srcCutOuts
  end
end
