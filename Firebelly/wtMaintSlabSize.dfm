object frmwtMaintSlabSize: TfrmwtMaintSlabSize
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Slab Sizes'
  ClientHeight = 150
  ClientWidth = 301
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    301
    150)
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 33
    Height = 13
    Caption = 'Length'
  end
  object Label3: TLabel
    Left = 16
    Top = 60
    Width = 29
    Height = 13
    Caption = 'Depth'
  end
  object Label2: TLabel
    Left = 171
    Top = 24
    Width = 16
    Height = 13
    Caption = 'mm'
  end
  object Label4: TLabel
    Left = 171
    Top = 64
    Width = 16
    Height = 13
    Caption = 'mm'
  end
  object edtLength: TDBEdit
    Left = 88
    Top = 16
    Width = 81
    Height = 21
    DataField = 'Length'
    DataSource = frmwtLUSlabSizes.srcSlabSize
    TabOrder = 0
    OnChange = EnableOK
  end
  object edtDepth: TDBEdit
    Left = 88
    Top = 56
    Width = 81
    Height = 21
    DataField = 'Depth'
    DataSource = frmwtLUSlabSizes.srcSlabSize
    TabOrder = 1
    OnChange = EnableOK
  end
  object btnOK: TBitBtn
    Left = 128
    Top = 112
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 112
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object chkbxInactive: TCheckBox
    Left = 16
    Top = 96
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 4
  end
end
