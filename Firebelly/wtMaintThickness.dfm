object frmWtMaintThickness: TfrmWtMaintThickness
  Left = 253
  Top = 202
  BorderStyle = bsDialog
  Caption = 'Thickness'
  ClientHeight = 153
  ClientWidth = 286
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
    286
    153)
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 74
    Height = 13
    Caption = 'Thickness (mm)'
  end
  object btnOK: TBitBtn
    Left = 64
    Top = 112
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 152
    Top = 112
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 4
  end
  object chkbxInactive: TCheckBox
    Left = 16
    Top = 84
    Width = 97
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Inactive'
    TabOrder = 2
  end
  object chkbxShowOnline: TCheckBox
    Left = 16
    Top = 50
    Width = 161
    Height = 17
    Caption = 'Show Thickness Online'
    TabOrder = 1
  end
  object edtThicknessmm: TEdit
    Left = 104
    Top = 20
    Width = 75
    Height = 21
    TabOrder = 0
    Text = 'edtThicknessmm'
    OnChange = EnableOK
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Thickness'
      'SET'
      '      Thickness_mm = :Thickness_mm,'
      '      Show_Online = :Show_Online,'
      '      inActive = :inactive'
      'WHERE'
      '  Thickness = :Thickness')
    Left = 72
    Top = 72
    ParamData = <
      item
        Name = 'Thickness_mm'
      end
      item
        Name = 'Show_Online'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Thickness'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Thickness'
      '        (Thickness,'
      '        Thickness_mm,'
      '        inactive)'
      'Select Max(Thickness)+1, :GUID, '#39'N'#39
      'From Thickness'
      ' ')
    Left = 128
    Top = 72
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
      'Select Thickness'
      'From Thickness'
      'Where Thickness_mm = :GUID')
    Left = 184
    Top = 72
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    Left = 248
    Top = 72
  end
end
