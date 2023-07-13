object frmWTMaintContactType: TfrmWTMaintContactType
  Left = 251
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Maintain Contact Type Details'
  ClientHeight = 89
  ClientWidth = 378
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
    378
    89)
  TextHeight = 13
  object label1: TLabel
    Left = 8
    Top = 20
    Width = 64
    Height = 13
    Caption = 'Contact Type'
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 52
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
    ExplicitTop = 53
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 52
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
    ExplicitTop = 53
  end
  object edtContactTypeDescription: TEdit
    Left = 80
    Top = 16
    Width = 280
    Height = 21
    TabOrder = 0
    Text = 'edtContactTypeDescription'
    OnChange = EnableOK
  end
  object qryUpdate: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'UPDATE Contact_Type'
      'SET'
      '      Contact_Type_Description = :Contact_Type_Description'
      'WHERE'
      '  Contact_Type = :Contact_Type')
    Left = 80
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contact_Type_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Type'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Insert Into Contact_Type'
      '        (Contact_Type,'
      '        Contact_Type_Description)'
      'Select Max(Contact_Type)+1, :GUID'
      'From Contact_Type'
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
  object qryGetLast: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Select Contact_Type'
      'From Contact_Type'
      'Where Contact_Type_Description = :GUID')
    Left = 248
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryZero: TQuery
    DatabaseName = 'WT'
    Left = 312
    Top = 40
  end
end
