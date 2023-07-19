object frmWTMaintPaymentTerms: TfrmWTMaintPaymentTerms
  Left = 555
  Top = 282
  BorderStyle = bsDialog
  Caption = 'Payment Terms'
  ClientHeight = 152
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    451
    152)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 87
    Height = 13
    Caption = 'Payment Terms'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 91
    Height = 13
    Caption = 'Number of Days'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 94
    Width = 97
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Inactive'
    TabOrder = 2
  end
  object btnOK: TBitBtn
    Left = 272
    Top = 110
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 3
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 360
    Top = 110
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
    NumGlyphs = 2
  end
  object edtNumberofDays: TCREditInt
    Left = 112
    Top = 52
    Width = 65
    Height = 21
    TabOrder = 1
    Text = 'edtNumberofDays'
  end
  object edtPaymentTermsDescription: TEdit
    Left = 112
    Top = 16
    Width = 321
    Height = 21
    TabOrder = 0
    Text = 'edtPaymentTermsDescription'
    OnChange = EnableOK
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Payment_Terms'
      'SET'
      '      Payment_Terms_Description = :Payment_Terms_Description,'
      '      Number_of_Days = :Number_of_Days'
      'WHERE'
      '  Payment_Terms = :Payment_Terms')
    Left = 80
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Payment_Terms_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Number_of_Days'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Payment_Terms'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Payment_Terms'
      '        (Payment_Terms,'
      '        Payment_Terms_Description)'
      'Select Max(Payment_Terms)+1, :GUID'
      'From Payment_Terms'
      ' ')
    Left = 136
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Payment_Terms'
      'From Payment_Terms'
      'Where Payment_Terms_Description = :GUID')
    Left = 248
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    Left = 312
    Top = 40
  end
end
