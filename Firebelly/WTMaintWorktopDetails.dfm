object frmWTMaintWorktopDetails: TfrmWTMaintWorktopDetails
  Left = 477
  Top = 112
  Caption = 'Worktops'
  ClientHeight = 376
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label3: TLabel
    Left = 8
    Top = 52
    Width = 64
    Height = 13
    Caption = 'Material Type'
  end
  object Label2: TLabel
    Left = 8
    Top = 84
    Width = 29
    Height = 13
    Caption = 'Group'
  end
  object Label4: TLabel
    Left = 8
    Top = 119
    Width = 49
    Height = 13
    Caption = 'Thickness'
  end
  object Label5: TLabel
    Left = 8
    Top = 152
    Width = 48
    Height = 13
    Caption = 'Cost Price'
  end
  object Label6: TLabel
    Left = 8
    Top = 184
    Width = 58
    Height = 13
    Caption = 'Selling Price'
  end
  object Label7: TLabel
    Left = 200
    Top = 152
    Width = 61
    Height = 13
    Caption = 'per sq. metre'
  end
  object Label8: TLabel
    Left = 200
    Top = 184
    Width = 61
    Height = 13
    Caption = 'per sq. metre'
  end
  object edtDescription: TDBEdit
    Left = 80
    Top = 16
    Width = 273
    Height = 21
    TabOrder = 0
  end
  object dblkpMatType: TDBLookupComboBox
    Left = 80
    Top = 48
    Width = 161
    Height = 21
    KeyField = 'Material_Type'
    ListField = 'Description'
    ListSource = srclkpMatType
    TabOrder = 1
  end
  object dblkpWTGroup: TDBLookupComboBox
    Left = 80
    Top = 80
    Width = 161
    Height = 21
    KeyField = 'Worktop_Group'
    ListField = 'Worktop_Group_Description'
    ListSource = dtsGroup
    TabOrder = 2
    OnClick = dblkpWTGroupClick
  end
  object btnOK: TBitBtn
    Left = 192
    Top = 224
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 280
    Top = 224
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 4
  end
  object Button1: TButton
    Left = 248
    Top = 78
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button1Click
  end
  object btnClear: TBitBtn
    Left = 280
    Top = 78
    Width = 25
    Height = 25
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
    TabOrder = 6
    OnClick = btnClearClick
  end
  object dblkpThickness: TDBLookupComboBox
    Left = 80
    Top = 111
    Width = 105
    Height = 21
    KeyField = 'Thickness'
    ListField = 'Thickness_mm'
    TabOrder = 7
  end
  object edtmnyCost: TCREditMoney
    Left = 80
    Top = 144
    Width = 105
    Height = 21
    TabOrder = 8
    Text = '0.00'
  end
  object edtmnySell: TCREditMoney
    Left = 80
    Top = 176
    Width = 105
    Height = 21
    TabOrder = 9
    Text = '0.00'
  end
  object tblWorktops: TFDTable
    Filtered = True
    IndexFieldNames = 'Description'
    ConnectionName = 'WT'
    TableName = 'Worktop'
    Left = 16
    Top = 224
    object tblWorktopsWorktop: TIntegerField
      FieldName = 'Worktop'
    end
    object tblWorktopsDescription: TStringField
      FieldName = 'Description'
      Size = 40
    end
    object tblWorktopsNot_used_for_quoting: TStringField
      FieldName = 'Not_used_for_quoting'
      Size = 1
    end
    object tblWorktopsMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
    end
    object tblWorktopsWorktop_Group: TIntegerField
      FieldName = 'Worktop_Group'
    end
    object tblWorktopsWorktop_Group_Desc: TStringField
      FieldKind = fkLookup
      FieldName = 'Worktop_Group_Desc'
      LookupKeyFields = 'Worktop_Group'
      LookupResultField = 'Worktop_Group_Description'
      KeyFields = 'Worktop_Group'
      Size = 30
      Lookup = True
    end
    object tblWorktopsinactive: TStringField
      FieldName = 'inactive'
      Size = 1
    end
  end
  object qryNewWorktops: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select max(val(worktop))+1'
      'from worktop')
    Left = 72
    Top = 224
  end
  object lkpGroup: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from worktop_group'
      'where material_type = :Material_type AND'
      '((inactive = '#39'N'#39') or (inactive = '#39#39') or (inactive is NULL)) OR'
      'Worktop_Group = :Worktop_Group'
      'order by worktop_group_description')
    Left = 8
    Top = 320
    ParamData = <
      item
        Name = 'Material_type'
      end
      item
        Name = 'Worktop_Group'
      end>
  end
  object lkpMatType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * from Material_Type'
      
        'where ((inactive = '#39'N'#39') or (inactive is NULL) or (inactive = '#39#39')' +
        ') OR'
      'Material_Type = :Material_Type')
    Left = 16
    Top = 272
    ParamData = <
      item
        Name = 'Material_Type'
      end>
  end
  object srclkpMatType: TDataSource
    DataSet = lkpMatType
    Left = 72
    Top = 272
  end
  object dtsGroup: TDataSource
    DataSet = lkpGroup
    Left = 72
    Top = 320
  end
end
