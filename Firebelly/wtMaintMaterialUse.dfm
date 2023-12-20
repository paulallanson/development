object frmWtMaintMaterialUse: TfrmWtMaintMaterialUse
  Left = 255
  Top = 197
  BorderStyle = bsDialog
  Caption = 'Material Uses'
  ClientHeight = 221
  ClientWidth = 380
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
    380
    221)
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 59
    Height = 13
    Caption = 'Description'
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 168
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 168
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 1
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 160
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 2
  end
  object edtUseDescription: TEdit
    Left = 72
    Top = 20
    Width = 273
    Height = 21
    TabOrder = 3
    Text = 'edtUseDescription'
    OnChange = EnableOK
  end
  object rdgrpUseFor: TRadioGroup
    Left = 8
    Top = 56
    Width = 185
    Height = 81
    Caption = 'Use for:'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'Worktops'
      'Splashbacks etc')
    ParentBackground = False
    TabOrder = 4
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Material_Use'
      'SET'
      '      Use_Description = :Use_Description,'
      '      inActive = :inactive,'
      '      Use_Type = :Use_Type'
      'WHERE'
      '  Material_Use = :Material_Use')
    Left = 80
    Top = 40
    ParamData = <
      item
        Name = 'Use_Description'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Use_Type'
      end
      item
        Name = 'Material_Use'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Material_Use'
      '        (Material_Use,'
      '        Use_Description,'
      '        inactive)'
      'Select Max(Material_Use)+1, :GUID, '#39'N'#39
      'From Material_Use'
      ' ')
    Left = 136
    Top = 40
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
      'Select Material_Use'
      'From Material_Use'
      'Where Use_Description = :GUID')
    Left = 248
    Top = 40
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
      'Update Category'
      'Set     Description = :Description,'
      '        Commission_rate = :Commission_Rate,'
      '        lnvoice_immediately = :Invoice_Immediately,'
      '        Cleared_Funds_Required = :Cleared_Funds_Required,'
      '        Use_Separate_Invoice_Seq = :Use_Separate_Invoice_Seq,'
      '        Inv_Narrative = :Inv_Narrative'
      'Where'
      '(Category = :Category) '
      '')
    Left = 312
    Top = 40
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Commission_Rate'
      end
      item
        Name = 'Invoice_Immediately'
      end
      item
        Name = 'Cleared_Funds_Required'
      end
      item
        Name = 'Use_Separate_Invoice_Seq'
      end
      item
        Name = 'Inv_Narrative'
      end
      item
        Name = 'Category'
      end>
  end
end
