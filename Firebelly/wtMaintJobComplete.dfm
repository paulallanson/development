object frmWTMaintJobComplete: TfrmWTMaintJobComplete
  Left = 173
  Top = 125
  BorderStyle = bsDialog
  Caption = 'Set Job Complete'
  ClientHeight = 291
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 46
    Height = 17
    Caption = 'Job No.'
  end
  object Label2: TLabel
    Left = 24
    Top = 80
    Width = 66
    Height = 17
    Caption = 'Description'
  end
  object Label3: TLabel
    Left = 24
    Top = 53
    Width = 56
    Height = 17
    Caption = 'Customer'
  end
  object Label4: TLabel
    Left = 24
    Top = 188
    Width = 57
    Height = 51
    Caption = 'Proposed Fitting Date'
    WordWrap = True
  end
  object Label5: TLabel
    Left = 389
    Top = 195
    Width = 105
    Height = 17
    Caption = 'Actual Fitting Date'
  end
  object Label6: TLabel
    Left = 389
    Top = 52
    Width = 58
    Height = 17
    Caption = 'Reference'
  end
  object Label7: TLabel
    Left = 389
    Top = 79
    Width = 114
    Height = 17
    Caption = 'Installation Address'
  end
  object Label8: TLabel
    Left = 232
    Top = 24
    Width = 27
    Height = 17
    Caption = 'Date'
  end
  object Label9: TLabel
    Left = 389
    Top = 23
    Width = 54
    Height = 17
    Caption = 'Operator'
  end
  object edtJobNumber: TEdit
    Left = 104
    Top = 20
    Width = 105
    Height = 25
    Color = clBtnFace
    TabOrder = 0
    Text = 'edtJobNumber'
  end
  object edtDescription: TMemo
    Left = 104
    Top = 80
    Width = 265
    Height = 89
    Color = clBtnFace
    Lines.Strings = (
      'edtDescription')
    TabOrder = 1
  end
  object edtCustomerName: TEdit
    Left = 104
    Top = 49
    Width = 265
    Height = 25
    Color = clBtnFace
    TabOrder = 2
    Text = 'edtCustomerName'
  end
  object btnOK: TButton
    Left = 298
    Top = 240
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 386
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object edtFittingDate: TEdit
    Left = 104
    Top = 192
    Width = 121
    Height = 25
    Color = clBtnFace
    TabOrder = 5
    Text = 'edtFittingDate'
  end
  object dtpckFitting: TDateTimePicker
    Left = 512
    Top = 192
    Width = 121
    Height = 25
    Date = 38361.000000000000000000
    Time = 0.793762291672464900
    TabOrder = 6
  end
  object edtReference: TEdit
    Left = 512
    Top = 49
    Width = 161
    Height = 25
    Color = clBtnFace
    TabOrder = 7
    Text = 'edtReference'
  end
  object memInstallAdd: TMemo
    Left = 512
    Top = 80
    Width = 233
    Height = 89
    Color = clBtnFace
    Lines.Strings = (
      'memInstallAdd')
    TabOrder = 8
  end
  object edtDate: TEdit
    Left = 272
    Top = 20
    Width = 97
    Height = 25
    Color = clBtnFace
    TabOrder = 9
    Text = 'edtDate'
  end
  object dblkpOperator: TDBLookupComboBox
    Left = 512
    Top = 20
    Width = 145
    Height = 25
    Color = clBtnFace
    KeyField = 'Operator'
    ListField = 'Operator_Name'
    ListSource = dtsOperator
    ReadOnly = True
    TabOrder = 10
  end
  object qryOperator: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Operator')
    Left = 136
    Top = 176
  end
  object dtsOperator: TDataSource
    DataSet = qryOperator
    Left = 200
    Top = 176
  end
end
