object frmWTExpiryDate: TfrmWTExpiryDate
  Left = 509
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Expiry Date Confirmation'
  ClientHeight = 151
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 17
  object Label1: TLabel
    Left = 24
    Top = 60
    Width = 96
    Height = 17
    Caption = 'New Expiry Date'
  end
  object Label2: TLabel
    Left = 24
    Top = 20
    Width = 91
    Height = 17
    Caption = 'Old Expiry Date'
  end
  object edtNewExpiryDate: TEdit
    Left = 131
    Top = 56
    Width = 89
    Height = 25
    TabOrder = 0
    Text = 'edtNewExpiryDate'
    OnChange = edtNewExpiryDateChange
    OnExit = edtNewExpiryDateExit
  end
  object btnOK: TButton
    Left = 72
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
    Left = 131
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
    ConnectionName = 'Wt'
    SQL.Strings = (
      'Update Company'
      'Set Software_CheckSum = :Software_CheckSum'
      'Where company = 1')
    Left = 240
    Top = 16
    ParamData = <
      item
        Name = 'Software_CheckSum'
      end>
  end
end
