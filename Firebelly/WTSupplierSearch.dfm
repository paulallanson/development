object frmWTSupplierSearch: TfrmWTSupplierSearch
  Left = 274
  Top = 166
  BorderStyle = bsDialog
  Caption = 'Supplier Search'
  ClientHeight = 335
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    261
    335)
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 36
    Width = 28
    Height = 13
    Caption = 'Street'
  end
  object Label2: TLabel
    Left = 10
    Top = 63
    Width = 32
    Height = 13
    Caption = 'Locale'
  end
  object lblMaterial: TLabel
    Left = 10
    Top = 90
    Width = 27
    Height = 13
    Caption = 'Town'
  end
  object Label3: TLabel
    Left = 80
    Top = 8
    Width = 117
    Height = 13
    Caption = 'Type search criteria here'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 10
    Top = 118
    Width = 45
    Height = 13
    Caption = 'Postcode'
  end
  object Label5: TLabel
    Left = 10
    Top = 145
    Width = 33
    Height = 13
    Caption = 'County'
  end
  object Label6: TLabel
    Left = 10
    Top = 172
    Width = 31
    Height = 13
    Caption = 'Phone'
  end
  object edtStreet: TEdit
    Left = 80
    Top = 32
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object edtlocale: TEdit
    Left = 80
    Top = 59
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object btnSearch: TButton
    Left = 16
    Top = 295
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Search'
    Default = True
    TabOrder = 3
    OnClick = btnSearchClick
  end
  object edtTown: TEdit
    Left = 80
    Top = 86
    Width = 153
    Height = 21
    TabOrder = 2
  end
  object edtPostcode: TEdit
    Left = 80
    Top = 114
    Width = 153
    Height = 21
    TabOrder = 4
  end
  object ClearButton: TButton
    Left = 162
    Top = 295
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 5
    OnClick = ClearButtonClick
  end
  object edtCounty: TEdit
    Left = 80
    Top = 141
    Width = 153
    Height = 21
    TabOrder = 6
  end
  object edtPhone: TEdit
    Left = 80
    Top = 168
    Width = 153
    Height = 21
    TabOrder = 7
  end
end
