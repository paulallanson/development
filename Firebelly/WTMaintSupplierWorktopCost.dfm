object frmWTMaintSupplierWorktopCost: TfrmWTMaintSupplierWorktopCost
  Left = 349
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Maintain Worktop Costs'
  ClientHeight = 241
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object lblPriceChange: TLabel
    Left = 16
    Top = 114
    Width = 61
    Height = 13
    Caption = 'Cost Change'
  end
  object Label2: TLabel
    Left = 16
    Top = 154
    Width = 68
    Height = 13
    Caption = 'Effective Date'
  end
  object Label5: TLabel
    Left = 232
    Top = 154
    Width = 23
    Height = 13
    Caption = 'Time'
  end
  object BasisGroup: TRadioGroup
    Left = 16
    Top = 10
    Width = 143
    Height = 87
    Caption = 'Cost Change type'
    ItemIndex = 0
    Items.Strings = (
      'Set specific cost'
      'Uplift cost by %'
      'Reduce cost by %')
    TabOrder = 0
    OnClick = BasisGroupClick
  end
  object edtChange: TCREditFloat
    Left = 104
    Top = 110
    Width = 103
    Height = 21
    TabOrder = 1
    OnChange = edtChangeChange
  end
  object dtpckEffective: TDateTimePicker
    Left = 104
    Top = 150
    Width = 103
    Height = 21
    Date = 37563.000000000000000000
    Time = 0.834117939812131200
    TabOrder = 2
  end
  object edtTime: TMaskEdit
    Left = 260
    Top = 150
    Width = 51
    Height = 21
    EditMask = '!90:00;1;_'
    MaxLength = 5
    TabOrder = 3
    Text = '00:01'
  end
  object btnOK: TBitBtn
    Left = 104
    Top = 194
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 200
    Top = 194
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 5
    OnClick = BitBtn2Click
  end
end
