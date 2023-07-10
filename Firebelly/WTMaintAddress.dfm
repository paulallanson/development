object frmWTMaintAddress: TfrmWTMaintAddress
  Left = 435
  Top = 173
  BorderStyle = bsDialog
  Caption = 'Maintain Address Details'
  ClientHeight = 304
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    429
    304)
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 16
    Top = 16
    Width = 53
    Height = 13
    Caption = 'Customer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label18: TLabel
    Left = 16
    Top = 43
    Width = 35
    Height = 13
    Caption = 'Street'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label23: TLabel
    Left = 16
    Top = 81
    Width = 59
    Height = 13
    Caption = 'Town/City'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label20: TLabel
    Left = 16
    Top = 124
    Width = 54
    Height = 13
    Caption = 'Postcode'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 16
    Top = 153
    Width = 37
    Height = 13
    Caption = 'Contact'
  end
  object Telephone: TLabel
    Left = 16
    Top = 182
    Width = 61
    Height = 13
    Caption = 'Telephone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Email: TLabel
    Left = 16
    Top = 209
    Width = 25
    Height = 13
    Caption = 'Email'
  end
  object Label24: TLabel
    Left = 200
    Top = 101
    Width = 33
    Height = 13
    Caption = 'County'
  end
  object edtTelephone: TEdit
    Left = 104
    Top = 178
    Width = 289
    Height = 21
    TabOrder = 0
  end
  object edtEmail: TEdit
    Left = 104
    Top = 204
    Width = 289
    Height = 21
    TabOrder = 1
  end
  object edtCustomerName: TEdit
    Left = 104
    Top = 12
    Width = 287
    Height = 21
    TabOrder = 2
  end
  object edtStreet: TEdit
    Left = 104
    Top = 39
    Width = 287
    Height = 21
    TabOrder = 3
  end
  object edtlocale: TEdit
    Left = 104
    Top = 67
    Width = 287
    Height = 21
    TabOrder = 4
  end
  object edtTown: TEdit
    Left = 104
    Top = 96
    Width = 287
    Height = 21
    TabOrder = 5
  end
  object edtPostcode: TEdit
    Left = 104
    Top = 124
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 6
  end
  object edtCounty: TEdit
    Left = 248
    Top = 124
    Width = 143
    Height = 21
    TabOrder = 7
  end
  object edtContact: TEdit
    Left = 104
    Top = 152
    Width = 288
    Height = 21
    TabOrder = 8
  end
  object btnOK: TBitBtn
    Left = 137
    Top = 256
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    TabOrder = 9
    NumGlyphs = 2
  end
  object btnCancel: TBitBtn
    Left = 217
    Top = 256
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 10
    NumGlyphs = 2
  end
end
