object frmWTMaintDataSource: TfrmWTMaintDataSource
  Left = 663
  Top = 262
  BorderStyle = bsDialog
  Caption = 'Data Source Details'
  ClientHeight = 120
  ClientWidth = 360
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
    360
    120)
  TextHeight = 13
  object label1: TLabel
    Left = 8
    Top = 20
    Width = 60
    Height = 13
    Caption = 'Data Source'
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 82
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
    Top = 82
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 58
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 3
  end
  object edtDataSourceTitle: TEdit
    Left = 88
    Top = 16
    Width = 225
    Height = 21
    TabOrder = 0
    Text = 'edtDataSourceTitle'
    OnChange = EnableOK
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Data_Source'
      'SET'
      '  Data_Source_Title = :Data_Source_Title,'
      '  inActive = :inactive'
      'WHERE'
      '  Data_Source = :Data_Source')
    Left = 64
    Top = 24
    ParamData = <
      item
        Name = 'Data_Source_Title'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Data_Source'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Data_Source'
      '        (Data_Source,'
      '        Data_Source_Title,'
      '        inactive)'
      'Select Max(Data_Source)+1, :GUID, '#39'N'#39
      'From Data_Source'
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
      'Select Data_Source'
      'From Data_Source'
      'Where Data_Source_Title = :GUID')
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
