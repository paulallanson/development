object frmWTMaintJElement: TfrmWTMaintJElement
  Left = 162
  Top = 112
  BorderStyle = bsDialog
  Caption = 'Maintain Element'
  ClientHeight = 247
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object lblDelete: TLabel
    Left = 24
    Top = 232
    Width = 154
    Height = 13
    Caption = 'Delete these element details ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 200
    Top = 224
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 288
    Top = 224
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 526
    Height = 217
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 42
      Height = 13
      Caption = 'Material'
    end
    object Label2: TLabel
      Left = 16
      Top = 72
      Width = 46
      Height = 13
      Caption = 'Worktop'
    end
    object Label3: TLabel
      Left = 16
      Top = 97
      Width = 50
      Height = 13
      Caption = 'Thickness'
    end
    object Label6: TLabel
      Left = 16
      Top = 124
      Width = 63
      Height = 13
      Caption = 'Length (mm)'
    end
    object Label5: TLabel
      Left = 16
      Top = 156
      Width = 59
      Height = 13
      Caption = 'Depth (mm)'
    end
    object Label8: TLabel
      Left = 200
      Top = 156
      Width = 44
      Height = 13
      Caption = 'Quantity'
    end
    object Label4: TLabel
      Left = 200
      Top = 96
      Width = 50
      Height = 13
      Caption = 'Unit price'
    end
    object Label7: TLabel
      Left = 352
      Top = 156
      Width = 53
      Height = 13
      Caption = 'Total price'
    end
    object SpeedButton1: TSpeedButton
      Left = 346
      Top = 63
      Width = 23
      Height = 22
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object Label9: TLabel
      Left = 16
      Top = 44
      Width = 60
      Height = 13
      Caption = 'Price Group'
    end
    object SpeedButton2: TSpeedButton
      Left = 250
      Top = 39
      Width = 23
      Height = 22
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
      OnClick = SpeedButton2Click
    end
    object Label10: TLabel
      Left = 16
      Top = 188
      Width = 59
      Height = 13
      Caption = 'Description'
    end
    object btnMaterialUse: TSpeedButton
      Left = 282
      Top = 183
      Width = 23
      Height = 22
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnMaterialUseClick
    end
    object edtDepth: TCREditInt
      Left = 88
      Top = 152
      Width = 89
      Height = 21
      TabOrder = 6
      OnChange = edtDepthChange
    end
    object edtLength: TCREditInt
      Left = 88
      Top = 120
      Width = 89
      Height = 21
      TabOrder = 5
      OnChange = edtDepthChange
    end
    object dblkpWTThickness: TDBLookupComboBox
      Left = 88
      Top = 93
      Width = 89
      Height = 21
      KeyField = 'Thickness'
      ListField = 'Thickness_mm'
      ListSource = dtsWTThickness
      TabOrder = 3
      OnClick = dblkpWTThicknessClick
    end
    object dblkpWorktop: TDBLookupComboBox
      Left = 88
      Top = 64
      Width = 249
      Height = 21
      KeyField = 'Worktop'
      ListField = 'Description'
      ListSource = dtsWorktops
      TabOrder = 2
      OnClick = dblkpWorktopClick
    end
    object edtMaterial: TEdit
      Left = 88
      Top = 8
      Width = 145
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtUnitPrice: TCREditMoney
      Left = 256
      Top = 92
      Width = 81
      Height = 21
      TabOrder = 4
      OnChange = edtDepthChange
    end
    object spnQuantity: TSpinEdit
      Left = 256
      Top = 151
      Width = 73
      Height = 22
      MaxValue = 1000
      MinValue = 1
      TabOrder = 7
      Value = 1
      OnChange = spnQuantityChange
    end
    object edtTotalPrice: TCREditMoney
      Left = 408
      Top = 152
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object dblkpWTGroup: TDBLookupComboBox
      Left = 88
      Top = 40
      Width = 145
      Height = 21
      KeyField = 'Worktop_Group'
      ListField = 'Worktop_Group_Description'
      ListSource = dtsWTGroup
      TabOrder = 1
      OnClick = dblkpWTGroupClick
    end
    object cmbMaterialUse: TComboBox
      Left = 88
      Top = 184
      Width = 185
      Height = 21
      TabOrder = 9
      Text = 'cmbMaterialUse'
    end
  end
  object qryWorktops: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * '
      'from worktop'
      'where material_type = :material_type and'
      '((worktop_group = :worktop_group) or (0 = :worktop_group))'
      'Order by Description')
    Left = 368
    Top = 64
    ParamData = <
      item
        Name = 'material_type'
        DataType = ftInteger
      end
      item
        Name = 'worktop_group'
      end
      item
        Name = 'worktop_group'
      end>
  end
  object qryWTThickness: TFDQuery
    MasterSource = dtsWorktops
    ConnectionName = 'wt'
    SQL.Strings = (
      'select'
      '  worktop_thickness.thickness,'
      '  Thickness.Thickness_mm'
      'from worktop_thickness, thickness'
      'where worktop = :worktop and'
      '  worktop_thickness.thickness = thickness.thickness'
      'order by thickness_mm')
    Left = 144
    Top = 104
    ParamData = <
      item
        Name = 'worktop'
      end>
  end
  object dtsWorktops: TDataSource
    DataSet = qryWorktops
    Left = 408
    Top = 64
  end
  object dtsWTThickness: TDataSource
    DataSet = qryWTThickness
    Left = 184
    Top = 104
  end
  object qryOneWTThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Worktop,'
      '        Thickness,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      
        '         where Price_Pointer = Worktop_thickness.Price_pointer a' +
        'nd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Price_unit'
      '         from Prices'
      
        '         where Price_Pointer = Worktop_thickness.Price_pointer a' +
        'nd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'from Worktop_thickness'
      'where worktop = :Worktop and'
      'thickness = :Thickness')
    Left = 408
    Top = 8
    ParamData = <
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end>
  end
  object qryWTGroup: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Worktop_Group.*'
      'from Worktop_Group'
      
        'where ((Material_Type = :Material_type) or (Material_Type is NUL' +
        'L))'
      'order by Worktop_group_description')
    Left = 288
    Top = 32
    ParamData = <
      item
        Name = 'Material_type'
      end>
  end
  object dtsWTGroup: TDataSource
    DataSet = qryWTGroup
    Left = 328
    Top = 32
  end
  object qryMaterialUse: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Material_Use'
      'WHERE Use_Type <= 1'
      'ORDER BY Use_Description Asc')
    Left = 384
    Top = 168
  end
  object dtsMaterialUse: TDataSource
    DataSet = qryMaterialUse
    Left = 448
    Top = 168
  end
end
