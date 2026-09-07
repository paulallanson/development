object frmPBExpiryDate: TfrmPBExpiryDate
  Left = 509
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Expiry Date Confirmation'
  ClientHeight = 159
  ClientWidth = 269
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 17
  object Label1: TLabel
    Left = 10
    Top = 60
    Width = 96
    Height = 17
    Caption = 'New Expiry Date'
  end
  object Label2: TLabel
    Left = 15
    Top = 20
    Width = 91
    Height = 17
    Caption = 'Old Expiry Date'
  end
  object edtNewExpiryDate: TEdit
    Left = 112
    Top = 56
    Width = 89
    Height = 25
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
    Height = 25
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
    Left = 206
    Top = 12
    ParamData = <
      item
        Name = 'Company_CheckSum'
      end>
  end
end
