object frmWTMaintSupplierWTThicknessCost: TfrmWTMaintSupplierWTThicknessCost
  Left = 371
  Top = 143
  Width = 395
  Height = 250
  Caption = 'Maintain Worktop Thickness Cost'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 80
    Width = 63
    Height = 13
    Caption = 'Thickness:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 48
    Width = 53
    Height = 13
    Caption = 'Worktop:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 116
    Width = 48
    Height = 13
    Caption = 'Cost Price'
  end
  object Label5: TLabel
    Left = 224
    Top = 116
    Width = 61
    Height = 13
    Caption = 'per sq. metre'
  end
  object lblWorktop: TLabel
    Left = 104
    Top = 48
    Width = 62
    Height = 13
    Caption = 'lblWorktop'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 24
    Top = 16
    Width = 51
    Height = 13
    Caption = 'Supplier:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSupplierName: TLabel
    Left = 104
    Top = 16
    Width = 92
    Height = 13
    Caption = 'lblSupplierName'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblThickness: TLabel
    Left = 104
    Top = 80
    Width = 72
    Height = 13
    Caption = 'lblThickness'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 200
    Top = 168
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 288
    Top = 168
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = BitBtn2Click
    NumGlyphs = 2
  end
  object edtmnyCost: TCREditMoney
    Left = 104
    Top = 112
    Width = 105
    Height = 21
    TabOrder = 2
    Text = '0.00'
  end
end
