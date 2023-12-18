object frmWTMaintSupplierWTThicknessCost: TfrmWTMaintSupplierWTThicknessCost
  Left = 371
  Top = 143
  Caption = 'Maintain Worktop Thickness Cost'
  ClientHeight = 203
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 80
    Width = 53
    Height = 13
    Caption = 'Thickness:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 48
    Width = 49
    Height = 13
    Caption = 'Worktop:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 116
    Width = 50
    Height = 13
    Caption = 'Cost Price'
  end
  object Label5: TLabel
    Left = 224
    Top = 116
    Width = 67
    Height = 13
    Caption = 'per sq. metre'
  end
  object lblWorktop: TLabel
    Left = 104
    Top = 48
    Width = 59
    Height = 13
    Caption = 'lblWorktop'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 24
    Top = 16
    Width = 46
    Height = 13
    Caption = 'Supplier:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSupplierName: TLabel
    Left = 104
    Top = 16
    Width = 87
    Height = 13
    Caption = 'lblSupplierName'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblThickness: TLabel
    Left = 104
    Top = 80
    Width = 63
    Height = 13
    Caption = 'lblThickness'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
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
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 288
    Top = 168
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn2Click
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
