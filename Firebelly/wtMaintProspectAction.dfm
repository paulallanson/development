object frmWTMaintProspectAction: TfrmWTMaintProspectAction
  Left = 306
  Top = 143
  BorderStyle = bsDialog
  Caption = 'Prospect Action Details'
  ClientHeight = 104
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    392
    104)
  TextHeight = 13
  object lblName: TLabel
    Left = 8
    Top = 20
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 57
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
    Top = 57
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
  end
  object edtProspectActionDescription: TEdit
    Left = 80
    Top = 16
    Width = 281
    Height = 21
    TabOrder = 0
    Text = 'edtProspectActionDescription'
    OnChange = EnableOK
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Prospect_Action'
      'SET'
      '  Prospect_Action_Description = :Prospect_Action_Description'
      'WHERE'
      '  Prospect_Action = :Prospect_Action')
    Left = 64
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Prospect_Action_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Prospect_Action'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Prospect_Action'
      '        (Prospect_Action,'
      '        Prospect_Action_Description)'
      'Select Max(Prospect_Action)+1, :GUID'
      'From Prospect_Action'
      ' ')
    Left = 120
    Top = 24
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
      'Select Prospect_Action'
      'From Prospect_Action'
      'Where Prospect_Action_Description = :GUID')
    Left = 232
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
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
