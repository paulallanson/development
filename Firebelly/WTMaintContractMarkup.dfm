object frmWTMaintContractMarkup: TfrmWTMaintContractMarkup
  Left = 357
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Maintain Markup Percentage'
  ClientHeight = 254
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Label15: TLabel
    Left = 16
    Top = 21
    Width = 47
    Height = 13
    Caption = 'Markup %'
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 208
    Width = 364
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    DesignSize = (
      364
      46)
    object btnOK: TBitBtn
      Left = 100
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 188
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object rdgrpMarkupType: TRadioGroup
    Left = 212
    Top = 8
    Width = 130
    Height = 81
    Caption = 'Apply Markup to:'
    Items.Strings = (
      'Selected Column'
      'Selected Row'
      'Whole Contract')
    TabOrder = 6
  end
  object chkbxMarkupCutOuts: TCheckBox
    Left = 16
    Top = 64
    Width = 97
    Height = 17
    Caption = 'Markup Cut Outs'
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object chkbxMarkupEdges: TCheckBox
    Left = 16
    Top = 92
    Width = 97
    Height = 17
    Caption = 'Markup Edges'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object chkbxMarkupMaterials: TCheckBox
    Left = 16
    Top = 120
    Width = 97
    Height = 17
    Caption = 'Markup Materials'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object chkbxMarkupFitting: TCheckBox
    Left = 16
    Top = 176
    Width = 257
    Height = 17
    Caption = 'Markup Template, Fitting and Delivery'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object edtMarkup: TMemo
    Left = 80
    Top = 17
    Width = 81
    Height = 21
    Alignment = taRightJustify
    TabOrder = 0
    WantReturns = False
    WordWrap = False
    OnEnter = SaveValue
    OnExit = ValidateDouble
  end
  object chkbxMarkupCharges: TCheckBox
    Left = 16
    Top = 148
    Width = 193
    Height = 17
    Caption = 'Markup Additional Charges'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
end
