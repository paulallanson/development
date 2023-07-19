object frmWtMaintColourGroup: TfrmWtMaintColourGroup
  Left = 483
  Top = 173
  BorderStyle = bsDialog
  Caption = 'Colour Group'
  ClientHeight = 234
  ClientWidth = 388
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
    388
    234)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label2: TLabel
    Left = 8
    Top = 52
    Width = 49
    Height = 13
    Caption = 'Hex Value'
  end
  object Label3: TLabel
    Left = 248
    Top = 47
    Width = 68
    Height = 13
    Caption = 'Sample Colour'
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 197
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 4
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 197
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
    NumGlyphs = 2
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 202
    Width = 97
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Inactive'
    TabOrder = 3
  end
  object chkbxShowOnline: TCheckBox
    Left = 8
    Top = 170
    Width = 161
    Height = 17
    Caption = 'Show Colour Group Online'
    TabOrder = 2
  end
  object memColour: TMemo
    Left = 248
    Top = 64
    Width = 89
    Height = 73
    Color = 16514043
    TabOrder = 6
    OnDblClick = memColourDblClick
  end
  object edtColourCode: TEdit
    Left = 72
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edtColourCode'
    OnChange = edtColourCodeChange
  end
  object edtDescription: TEdit
    Left = 72
    Top = 16
    Width = 185
    Height = 21
    TabOrder = 0
    Text = 'edtDescription'
    OnChange = EnableOK
  end
  object ColorDialog1: TColorDialog
    Left = 328
    Top = 3
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Colour_Group'
      'SET'
      '      Description = :Description,'
      '      Colour_Code = :Colour_Code,'
      '      Show_Online = :Show_Online,'
      '      inActive = :inactive'
      'WHERE'
      '  Colour_Group = :Colour_Group')
    Left = 40
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Colour_Code'
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
        Name = 'Colour_Group'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Colour_Group'
      '        (Colour_Group,'
      '        Description,'
      '        inactive)'
      'Select Max(Colour_Group)+1, :GUID, '#39'N'#39
      'From Colour_Group'
      ' ')
    Left = 120
    Top = 104
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
      'Select Colour_Group'
      'From Colour_Group'
      'Where Description = :GUID')
    Left = 232
    Top = 104
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
    Top = 104
  end
end
