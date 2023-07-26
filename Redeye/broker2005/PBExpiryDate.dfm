object frmPBExpiryDate: TfrmPBExpiryDate
  Left = 509
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Expiry Date Confirmation'
  ClientHeight = 151
  ClientWidth = 275
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 60
    Width = 79
    Height = 13
    Caption = 'New Expiry Date'
  end
  object Label2: TLabel
    Left = 24
    Top = 20
    Width = 73
    Height = 13
    Caption = 'Old Expiry Date'
  end
  object edtNewExpiryDate: TEdit
    Left = 112
    Top = 56
    Width = 89
    Height = 21
    TabOrder = 0
    Text = 'edtNewExpiryDate'
    OnChange = edtNewExpiryDateChange
    OnExit = edtNewExpiryDateExit
  end
  object btnOK: TButton
    Left = 56
    Top = 112
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOKClick
  end
  object Button2: TButton
    Left = 160
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = Button2Click
  end
  object edtoldExpiryDate: TEdit
    Left = 112
    Top = 16
    Width = 89
    Height = 21
    Color = clBtnFace
    Enabled = False
    ReadOnly = True
    TabOrder = 3
    Text = 'edtoldExpiryDate'
  end
  object qryUpCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Company_CheckSum = :Company_CheckSum'
      'Where company = 1')
    Left = 216
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Company_CheckSum'
        ParamType = ptUnknown
      end>
  end
end
