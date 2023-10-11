object frmWTMaintCustWorkGroup: TfrmWTMaintCustWorkGroup
  Left = 431
  Top = 130
  BorderStyle = bsDialog
  Caption = 'Maintain Customer Worktop Group'
  ClientHeight = 156
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    363
    156)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 60
    Height = 13
    Caption = 'Group Name'
  end
  object Label2: TLabel
    Left = 8
    Top = 52
    Width = 37
    Height = 13
    Caption = 'Material'
  end
  object edtGroupDescription: TEdit
    Left = 80
    Top = 12
    Width = 265
    Height = 21
    TabOrder = 0
    Text = 'edtGroupDescription'
    OnClick = CheckOK
  end
  object dblkpMaterialType: TDBLookupComboBox
    Left = 80
    Top = 48
    Width = 145
    Height = 21
    KeyField = 'Material_Type'
    ListField = 'Description'
    ListSource = dtsMatTypes
    TabOrder = 1
    OnClick = CheckOK
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 80
    Width = 153
    Height = 17
    Caption = 'Worktop Group is inactive'
    TabOrder = 2
  end
  object btnOK: TBitBtn
    Left = 100
    Top = 115
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 3
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 188
    Top = 115
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = BitBtn2Click
    NumGlyphs = 2
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
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end>
  end
  object dtsMatTypes: TDataSource
    DataSet = qryMatTypes
    Left = 312
    Top = 48
  end
end
