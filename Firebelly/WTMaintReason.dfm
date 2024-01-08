object frmWTMaintReason: TfrmWTMaintReason
  Left = 251
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Maintain Reason Details'
  ClientHeight = 91
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    361
    91)
  TextHeight = 13
  object label1: TLabel
    Left = 8
    Top = 20
    Width = 38
    Height = 13
    Caption = 'Reason'
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 54
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 54
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
  end
  object edtInactiveReasonDescr: TEdit
    Left = 64
    Top = 16
    Width = 281
    Height = 21
    TabOrder = 0
    Text = 'edtInactiveReasonDescr'
    OnChange = EnableOK
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Inactive_Reason'
      'SET'
      '  Inactive_Reason_Descr = :Inactive_Reason_Descr,'
      '  Inactive_Type = :Inactive_Type'
      'WHERE'
      '  Inactive_Reason = :Inactive_Reason')
    Left = 64
    Top = 24
    ParamData = <
      item
        Name = 'Inactive_Reason_Descr'
      end
      item
        Name = 'Inactive_Type'
      end
      item
        Name = 'Inactive_Reason'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Inactive_Reason'
      '        (Inactive_Reason,'
      '        Inactive_Reason_Descr,'
      '        Inactive_Type)'
      'Select Max(Inactive_Reason)+1, :GUID, '#39'Q'#39
      'From Inactive_Reason'
      ' ')
    Left = 120
    Top = 24
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Inactive_Reason'
      'From Inactive_Reason'
      'Where Inactive_Reason_Descr = :GUID')
    Left = 232
    Top = 24
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      ''
      '')
    Left = 296
    Top = 24
  end
end
