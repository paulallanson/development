object frmWTMaintJElement: TfrmWTMaintJElement
  Left = 162
  Top = 112
  BorderStyle = bsDialog
  Caption = 'Maintain Element'
  ClientHeight = 268
  ClientWidth = 627
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 17
  object lblDelete: TLabel
    Left = 19
    Top = 226
    Width = 182
    Height = 17
    Caption = 'Delete these element details?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 208
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
    Left = 296
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
    Width = 627
    Height = 217
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 573
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 48
      Height = 17
      Caption = 'Material'
    end
    object Label2: TLabel
      Left = 16
      Top = 68
      Width = 50
      Height = 17
      Caption = 'Worktop'
    end
    object Label3: TLabel
      Left = 16
      Top = 97
      Width = 55
      Height = 17
      Caption = 'Thickness'
    end
    object Label6: TLabel
      Left = 16
      Top = 127
      Width = 73
      Height = 17
      Caption = 'Length (mm)'
    end
    object Label5: TLabel
      Left = 16
      Top = 156
      Width = 69
      Height = 17
      Caption = 'Depth (mm)'
    end
    object Label8: TLabel
      Left = 209
      Top = 156
      Width = 48
      Height = 17
      Caption = 'Quantity'
    end
    object Label4: TLabel
      Left = 209
      Top = 97
      Width = 56
      Height = 17
      Caption = 'Unit price'
    end
    object Label7: TLabel
      Left = 361
      Top = 156
      Width = 61
      Height = 17
      Caption = 'Total price'
    end
    object SpeedButton1: TSpeedButton
      Left = 355
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
      Top = 40
      Width = 69
      Height = 17
      Caption = 'Price Group'
    end
    object SpeedButton2: TSpeedButton
      Left = 259
      Top = 37
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
      Width = 66
      Height = 17
      Caption = 'Description'
    end
    object btnMaterialUse: TSpeedButton
      Left = 291
      Top = 185
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
      Left = 97
      Top = 152
      Width = 89
      Height = 25
      TabOrder = 6
      OnChange = edtDepthChange
    end
    object edtLength: TCREditInt
      Left = 97
      Top = 123
      Width = 89
      Height = 25
      TabOrder = 5
      OnChange = edtDepthChange
    end
    object dblkpWTThickness: TDBLookupComboBox
      Left = 97
      Top = 93
      Width = 89
      Height = 25
      KeyField = 'Thickness'
      ListField = 'Thickness_mm'
      ListSource = dtsWTThickness
      TabOrder = 3
      OnClick = dblkpWTThicknessClick
    end
    object dblkpWorktop: TDBLookupComboBox
      Left = 97
      Top = 64
      Width = 504
      Height = 25
      KeyField = 'Worktop'
      ListField = 'Description'
      ListSource = dtsWorktops
      TabOrder = 2
      OnClick = dblkpWorktopClick
    end
    object edtMaterial: TEdit
      Left = 97
      Top = 8
      Width = 145
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtUnitPrice: TCREditMoney
      Left = 272
      Top = 93
      Width = 81
      Height = 25
      TabOrder = 4
      OnChange = edtDepthChange
    end
    object spnQuantity: TSpinEdit
      Left = 272
      Top = 151
      Width = 73
      Height = 27
      MaxValue = 1000
      MinValue = 1
      TabOrder = 7
      Value = 1
      OnChange = spnQuantityChange
    end
    object edtTotalPrice: TCREditMoney
      Left = 433
      Top = 152
      Width = 81
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object dblkpWTGroup: TDBLookupComboBox
      Left = 97
      Top = 36
      Width = 145
      Height = 25
      KeyField = 'Worktop_Group'
      ListField = 'Worktop_Group_Description'
      ListSource = dtsWTGroup
      TabOrder = 1
      OnClick = dblkpWTGroupClick
    end
    object cmbMaterialUse: TComboBox
      Left = 97
      Top = 184
      Width = 185
      Height = 25
      TabOrder = 9
      Text = 'cmbMaterialUse'
    end
  end
  object qryWorktops: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Worktop,'
      '      Description,'
      '      Not_used_for_quoting,'
      '      Material_Type,'
      '      Worktop_Group,'
      '      inactive,'
      '      Long_Description,'
      '      Short_Description,'
      '      Show_Online,'
      '      Worktop_Finish,'
      '      Image_Path,'
      '      Discount'
      'from worktop'
      'where material_type = :material_type and'
      '((worktop_group = :worktop_group) or (0 = :worktop_group))'
      'Order by Description')
    Left = 242
    Top = 125
    ParamData = <
      item
        Name = 'material_type'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'worktop_group'
        ParamType = ptInput
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
    Left = 469
    Top = 89
    ParamData = <
      item
        Name = 'worktop'
      end>
  end
  object dtsWorktops: TDataSource
    DataSet = qryWorktops
    Left = 315
    Top = 59
  end
  object dtsWTThickness: TDataSource
    DataSet = qryWTThickness
    Left = 378
    Top = 27
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
    Left = 232
    Top = 25
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
    Left = 528
    Top = 120
    ParamData = <
      item
        Name = 'Material_type'
      end>
  end
  object dtsWTGroup: TDataSource
    DataSet = qryWTGroup
    Left = 291
    Top = 24
  end
  object qryMaterialUse: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Material_Use'
      'WHERE Use_Type <= 1'
      'ORDER BY Use_Description Asc')
    Left = 504
    Top = 106
  end
  object dtsMaterialUse: TDataSource
    DataSet = qryMaterialUse
    Left = 368
    Top = 130
  end
end
