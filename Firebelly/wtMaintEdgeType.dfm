object frmWTMaintEdgeType: TfrmWTMaintEdgeType
  Left = 192
  Top = 128
  BorderStyle = bsDialog
  Caption = 'Edge Types'
  ClientHeight = 136
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    361
    136)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 96
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 96
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    NumGlyphs = 2
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 88
    Width = 97
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Inactive'
    TabOrder = 3
  end
  object chkbxShowOnline: TCheckBox
    Left = 8
    Top = 58
    Width = 161
    Height = 17
    Caption = 'Show Edge Type Online'
    TabOrder = 4
  end
  object edtEdgeTypeDescription: TEdit
    Left = 90
    Top = 20
    Width = 225
    Height = 21
    TabOrder = 0
    Text = 'edtEdgeTypeDescription'
    OnChange = EnableOK
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Edge_Type'
      'SET'
      '  Edge_Type_Description = :Edge_Type_Description,'
      '  Show_Online = :Show_Online,'
      '  inActive = :inactive'
      'WHERE'
      '  Edge_Type = :Edge_Type')
    Left = 64
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Edge_Type_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Show_Online'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Edge_Type'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Edge_Type'
      '        (Edge_Type,'
      '        Edge_Type_Description,'
      '        inactive)'
      'Select Max(Edge_Type)+1, :GUID, '#39'N'#39
      'From Edge_Type'
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
      'Select Edge_Type'
      'From Edge_Type'
      'Where Edge_Type_Description = :GUID')
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
