object frmWTMaintDesigner: TfrmWTMaintDesigner
  Left = 580
  Top = 211
  BorderStyle = bsDialog
  Caption = 'Maintain Designer Details'
  ClientHeight = 114
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    357
    114)
  TextHeight = 13
  object label1: TLabel
    Left = 8
    Top = 20
    Width = 42
    Height = 13
    Caption = 'Designer'
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 77
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnOKClick
    ExplicitTop = 78
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 77
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 3
    ExplicitTop = 78
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 58
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 1
  end
  object edtDesignerName: TEdit
    Left = 88
    Top = 16
    Width = 225
    Height = 21
    TabOrder = 0
    Text = 'edtDesignerName'
    OnChange = EnableOK
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Designer'
      'SET'
      '  Designer_Name = :Designer_Name,'
      '  inActive = :inactive'
      'WHERE'
      '  Designer = :Designer')
    Left = 64
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Designer_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Designer'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Designer'
      '        (Designer,'
      '        Designer_Name,'
      '        inactive)'
      'Select Max(Designer)+1, :GUID, '#39'N'#39
      'From Designer'
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
      'Select Designer'
      'From Designer'
      'Where Designer_Name = :GUID')
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
