object frmWTMaintCustWTGroup: TfrmWTMaintCustWTGroup
  Left = 472
  Top = 226
  BorderStyle = bsDialog
  Caption = 'Maintain Customer Worktop Groups'
  ClientHeight = 280
  ClientWidth = 391
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
    391
    280)
  TextHeight = 13
  object label1: TLabel
    Left = 8
    Top = 20
    Width = 59
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
    Width = 71
    Height = 13
    Caption = 'Material Type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 108
    Width = 43
    Height = 13
    Caption = 'Supplier'
  end
  object SpeedButton4: TSpeedButton
    Left = 314
    Top = 102
    Width = 25
    Height = 25
    Hint = 'Clear Supplier'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
      305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
      005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
      B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
      B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
      B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
      B0557777FF577777F7F500000E055550805577777F7555575755500000555555
      05555777775555557F5555000555555505555577755555557555}
    NumGlyphs = 2
    ParentFont = False
    OnClick = SpeedButton4Click
  end
  object Label4: TLabel
    Left = 8
    Top = 140
    Width = 70
    Height = 13
    Caption = 'Effective Date'
  end
  object Label5: TLabel
    Left = 8
    Top = 172
    Width = 80
    Height = 13
    Caption = 'Ineffective Date'
  end
  object lblGroupID: TLabel
    Left = 8
    Top = 81
    Width = 47
    Height = 13
    Caption = 'Group ID'
  end
  object btnOK: TBitBtn
    Left = 192
    Top = 235
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    NumGlyphs = 2
    TabOrder = 10
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 280
    Top = 235
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 11
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 235
    Width = 97
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Inactive'
    TabOrder = 9
  end
  object dblkpMaterialType: TDBLookupComboBox
    Left = 96
    Top = 48
    Width = 169
    Height = 21
    KeyField = 'Material_Type'
    ListField = 'Description'
    ListSource = srcMaterialtype
    TabOrder = 1
    OnClick = dblkpMaterialTypeClick
  end
  object dblkpSupplier: TDBLookupComboBox
    Left = 96
    Top = 104
    Width = 169
    Height = 21
    KeyField = 'Supplier'
    ListField = 'Supplier_Name'
    ListSource = srcSupplier
    TabOrder = 2
    OnClick = EnableOK
  end
  object btnSupplier: TBitBtn
    Left = 278
    Top = 102
    Width = 25
    Height = 25
    Hint = 'Select Supplier'
    Anchors = [akTop, akRight]
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnSupplierClick
  end
  object chkbxUseForGeneralQuoting: TCheckBox
    Left = 8
    Top = 195
    Width = 281
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Use for General Quoting'
    TabOrder = 8
  end
  object edtDateEffective: TEdit
    Left = 96
    Top = 136
    Width = 106
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 4
    OnExit = edtDateEffectiveExit
  end
  object btnDateEffective: TBitBtn
    Left = 214
    Top = 134
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
    OnClick = btnDateEffectiveClick
  end
  object edtDateInEffective: TEdit
    Left = 96
    Top = 168
    Width = 106
    Height = 21
    Anchors = [akTop, akRight]
    TabOrder = 6
    OnExit = edtDateEffectiveExit
  end
  object btnDateInEffective: TBitBtn
    Left = 214
    Top = 166
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
    TabOrder = 7
    OnClick = btnDateInEffectiveClick
  end
  object edtGroupDescription: TEdit
    Left = 96
    Top = 16
    Width = 225
    Height = 21
    TabOrder = 0
    Text = 'edtGroupDescription'
    OnChange = EnableOK
  end
  object edtID: TCREditInt
    Left = 96
    Top = 77
    Width = 89
    Height = 21
    TabOrder = 12
    Text = 'edtID'
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
  object qrySupplier: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT *'
      'FROM Supplier'
      'WHERE Supplier = :Supplier OR'
      '((Inactive = '#39'N'#39') OR (Inactive = '#39#39') OR (Inactive is NULL))'
      'ORDER BY Supplier_Name')
    Left = 296
    Top = 48
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object srcSupplier: TDataSource
    DataSet = qrySupplier
    Left = 328
    Top = 48
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Customer_Worktop_Group'
      'SET'
      '  Group_Description = :Group_Description,'
      '  Material_Type = :Material_Type,'
      '  Supplier = :Supplier,'
      '  Effective_Date = :Effective_Date,'
      '  InEffective_Date = :Ineffective_Date,'
      '  Use_For_General_Quoting = :Use_For_General_Quoting,'
      '  inActive = :inactive'
      'WHERE'
      '  Customer = :Customer AND'
      '  Group_Number = :Group_Number')
    Left = 72
    Top = 200
    ParamData = <
      item
        Name = 'Group_Description'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Effective_Date'
      end
      item
        Name = 'Ineffective_Date'
      end
      item
        Name = 'Use_For_General_Quoting'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Group_Number'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Customer_Worktop_Group'
      '        (Customer,'
      '        Group_Number,'
      '        Group_Description,'
      '        Material_Type)'
      'Select :Customer, Max(Group_Number)+1, :GUID, :Material_Type'
      'From Customer_Worktop_Group'
      ' ')
    Left = 128
    Top = 200
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Material_Type'
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Group_Number'
      'From Customer_Worktop_Group'
      'Where Customer = :Customer AND Group_Description = :GUID')
    Left = 240
    Top = 200
    ParamData = <
      item
        Name = 'Customer'
      end
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
    Left = 304
    Top = 200
  end
  object qryPatch: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Customer_Worktop_Group'
      '        (Customer,'
      '        Group_Number,'
      '        Group_Description,'
      '        Material_Type)'
      'Values (:Customer, :Group_Number, '#39'Patch'#39', :Material_Type)'
      ''
      ' ')
    Left = 176
    Top = 200
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Group_Number'
      end
      item
        Name = 'Material_Type'
      end>
  end
end
