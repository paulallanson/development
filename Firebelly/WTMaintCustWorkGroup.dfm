object frmWTMaintCustWorkGroup: TfrmWTMaintCustWorkGroup
  Left = 431
  Top = 130
  BorderStyle = bsDialog
  Caption = 'Maintain Customer Worktop Group'
  ClientHeight = 167
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    412
    167)
  TextHeight = 17
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 76
    Height = 17
    Caption = 'Group Name'
  end
  object Label2: TLabel
    Left = 8
    Top = 52
    Width = 48
    Height = 17
    Caption = 'Material'
  end
  object edtGroupDescription: TEdit
    Left = 104
    Top = 13
    Width = 265
    Height = 25
    TabOrder = 0
    Text = 'edtGroupDescription'
    OnClick = CheckOK
  end
  object dblkpMaterialType: TDBLookupComboBox
    Left = 104
    Top = 49
    Width = 145
    Height = 25
    KeyField = 'Material_Type'
    ListField = 'Description'
    ListSource = dtsMatTypes
    TabOrder = 1
    OnClick = CheckOK
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 92
    Width = 217
    Height = 17
    Caption = 'Worktop Group is inactive'
    TabOrder = 2
  end
  object btnOK: TBitBtn
    Left = 143
    Top = 126
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnOKClick
    ExplicitLeft = 94
    ExplicitTop = 115
  end
  object BitBtn2: TBitBtn
    Left = 231
    Top = 126
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitBtn2Click
    ExplicitLeft = 182
    ExplicitTop = 115
  end
  object qryMatTypes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select *'
      'from Material_Type'
      'Where Material_Type = :Material_Type OR'
      '((Inactive = NULL) or (inactive = '#39'N'#39') or (inactive = '#39#39'))'
      'ORDER BY Material_Type.Description')
    Left = 248
    Top = 48
    ParamData = <
      item
        Name = 'Material_Type'
      end>
  end
  object dtsMatTypes: TDataSource
    DataSet = qryMatTypes
    Left = 312
    Top = 48
  end
end
