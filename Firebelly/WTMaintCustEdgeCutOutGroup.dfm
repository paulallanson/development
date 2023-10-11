object frmWTMaintCustEdgeCutOutGroup: TfrmWTMaintCustEdgeCutOutGroup
  Left = 332
  Top = 152
  BorderStyle = bsDialog
  Caption = 'Maintain Customer Edge and Cutout Group'
  ClientHeight = 244
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    379
    244)
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 65
    Height = 13
    Caption = 'Description'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 52
    Width = 78
    Height = 13
    Caption = 'Material Type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 100
    Width = 68
    Height = 13
    Caption = 'Effective Date'
  end
  object Label5: TLabel
    Left = 8
    Top = 132
    Width = 76
    Height = 13
    Caption = 'Ineffective Date'
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 208
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 6
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 208
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 7
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 208
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 8
    OnClick = BitBtn2Click
  end
  object edtDescription: TEdit
    Left = 96
    Top = 16
    Width = 257
    Height = 21
    TabOrder = 0
    Text = 'edtDescription'
    OnChange = CheckOK
  end
  object dblkpMaterialType: TDBLookupComboBox
    Left = 96
    Top = 48
    Width = 169
    Height = 21
    DataField = 'Material_Type'
    DataSource = frmWTLUCustWTGroups.srcCustWTGroup
    KeyField = 'Material_Type'
    ListField = 'Description'
    ListSource = srcMaterialtype
    TabOrder = 1
    OnClick = CheckOK
  end
  object edtDateEffective: TEdit
    Left = 95
    Top = 96
    Width = 106
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 2
    OnExit = edtDateEffectiveExit
  end
  object btnDateEffective: TBitBtn
    Left = 215
    Top = 94
    Width = 25
    Height = 25
    Anchors = [akTop, akRight]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
      F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
      F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
      F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
      F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
      F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
      F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
      333337FFFFFFFF77333330000000000333333777777777733333}
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnDateEffectiveClick
  end
  object edtDateInEffective: TEdit
    Left = 95
    Top = 128
    Width = 106
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 4
    OnExit = btnDateEffectiveClick
  end
  object btnDateInEffective: TBitBtn
    Left = 215
    Top = 126
    Width = 25
    Height = 25
    Anchors = [akTop, akRight]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
      F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
      F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
      F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
      F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
      F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
      F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
      333337FFFFFFFF77333330000000000333333777777777733333}
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btnDateInEffectiveClick
  end
  object chkbxUseForGeneralQuoting: TCheckBox
    Left = 8
    Top = 172
    Width = 281
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Use for General Quoting'
    TabOrder = 9
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Customer_Cutout_Edge_Group'
      '('
      'Group_Description,'
      'Customer,'
      'Material_Type,'
      'Use_For_General_Quoting,'
      'Effective_Date,'
      'InEffective_Date'
      ')'
      'VALUES'
      '('
      ':Group_Description,'
      ':Customer,'
      ':Material_Type,'
      ':Use_For_General_Quoting,'
      ':Effective_Date,'
      ':InEffective_Date'
      ')')
    Left = 336
    Top = 48
    ParamData = <
      item
        Name = 'Group_Description'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Use_For_General_Quoting'
      end
      item
        Name = 'Effective_Date'
      end
      item
        Name = 'InEffective_Date'
      end>
  end
  object qryUpd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Customer_Cutout_Edge_Group'
      'SET Group_Description = :Group_Description,'
      '    Material_Type = :Material_Type,'
      '    Use_For_General_Quoting = :Use_For_General_Quoting,'
      '    Effective_Date = :Effective_Date,'
      '    InEffective_Date = :InEffective_Date,'
      '    inactive = :inactive'
      'WHERE Group_ID = :Group_ID')
    Left = 336
    Top = 104
    ParamData = <
      item
        Name = 'Group_Description'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Use_For_General_Quoting'
      end
      item
        Name = 'Effective_Date'
      end
      item
        Name = 'InEffective_Date'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Group_ID'
      end>
  end
  object qryMaterialType: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT *'
      'FROM Material_Type'
      'WHERE Material_Type = :Material_Type OR'
      '((Inactive = '#39'N'#39') OR (Inactive = '#39#39') OR (Inactive is NULL))'
      'ORDER BY Description')
    Left = 280
    ParamData = <
      item
        Name = 'Material_Type'
      end>
  end
  object srcMaterialtype: TDataSource
    DataSet = qryMaterialType
    Left = 320
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT max(Group_Id) as Max_Group_Id'
      'FROM Customer_Cutout_Edge_Group')
    Left = 336
    Top = 160
  end
end
