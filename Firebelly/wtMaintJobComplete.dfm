object frmWTMaintJobComplete: TfrmWTMaintJobComplete
  Left = 173
  Top = 125
  BorderStyle = bsDialog
  Caption = 'Set Job Complete'
  ClientHeight = 278
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 37
    Height = 13
    Caption = 'Job No.'
  end
  object Label2: TLabel
    Left = 24
    Top = 80
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label3: TLabel
    Left = 24
    Top = 53
    Width = 44
    Height = 13
    Caption = 'Customer'
  end
  object Label4: TLabel
    Left = 24
    Top = 188
    Width = 54
    Height = 26
    Caption = 'Proposed Fitting Date'
    WordWrap = True
  end
  object Label5: TLabel
    Left = 232
    Top = 196
    Width = 87
    Height = 13
    Caption = 'Actual Fitting Date'
  end
  object Label6: TLabel
    Left = 368
    Top = 53
    Width = 50
    Height = 13
    Caption = 'Reference'
  end
  object Label7: TLabel
    Left = 368
    Top = 80
    Width = 91
    Height = 13
    Caption = 'Installation Address'
  end
  object Label8: TLabel
    Left = 216
    Top = 24
    Width = 23
    Height = 13
    Caption = 'Date'
  end
  object Label9: TLabel
    Left = 368
    Top = 24
    Width = 41
    Height = 13
    Caption = 'Operator'
  end
  object edtJobNumber: TEdit
    Left = 88
    Top = 20
    Width = 105
    Height = 21
    Color = clBtnFace
    TabOrder = 0
    Text = 'edtJobNumber'
  end
  object edtDescription: TMemo
    Left = 88
    Top = 80
    Width = 265
    Height = 89
    Color = clBtnFace
    Lines.Strings = (
      'edtDescription')
    TabOrder = 1
  end
  object edtCustomerName: TEdit
    Left = 88
    Top = 49
    Width = 265
    Height = 21
    Color = clBtnFace
    TabOrder = 2
    Text = 'edtCustomerName'
  end
  object btnOK: TButton
    Left = 280
    Top = 240
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 368
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object edtFittingDate: TEdit
    Left = 88
    Top = 192
    Width = 121
    Height = 21
    Color = clBtnFace
    TabOrder = 5
    Text = 'edtFittingDate'
  end
  object dtpckFitting: TDateTimePicker
    Left = 336
    Top = 192
    Width = 121
    Height = 21
    Date = 38361.793762291670000000
    Time = 38361.793762291670000000
    TabOrder = 6
  end
  object edtReference: TEdit
    Left = 472
    Top = 49
    Width = 161
    Height = 21
    Color = clBtnFace
    TabOrder = 7
    Text = 'edtReference'
  end
  object memInstallAdd: TMemo
    Left = 472
    Top = 80
    Width = 233
    Height = 89
    Color = clBtnFace
    Lines.Strings = (
      'memInstallAdd')
    TabOrder = 8
  end
  object edtDate: TEdit
    Left = 256
    Top = 20
    Width = 97
    Height = 21
    Color = clBtnFace
    TabOrder = 9
    Text = 'edtDate'
  end
  object dblkpOperator: TDBLookupComboBox
    Left = 472
    Top = 20
    Width = 145
    Height = 21
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
