object frmWTMaintQElement: TfrmWTMaintQElement
  Left = 115
  Top = 112
  BorderStyle = bsDialog
  Caption = 'Maintain Element'
  ClientHeight = 287
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
    Left = 24
    Top = 245
    Width = 186
    Height = 17
    Caption = 'Delete these element details ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 218
    Top = 237
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 306
    Top = 237
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
    Height = 225
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 599
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 48
      Height = 17
      Caption = 'Material'
    end
    object Label2: TLabel
      Left = 16
      Top = 76
      Width = 50
      Height = 17
      Caption = 'Worktop'
    end
    object Label3: TLabel
      Left = 16
      Top = 105
      Width = 55
      Height = 17
      Caption = 'Thickness'
    end
    object Label6: TLabel
      Left = 16
      Top = 132
      Width = 73
      Height = 17
      Caption = 'Length (mm)'
    end
    object Label5: TLabel
      Left = 16
      Top = 164
      Width = 69
      Height = 17
      Caption = 'Depth (mm)'
    end
    object Label8: TLabel
      Left = 208
      Top = 164
      Width = 48
      Height = 17
      Caption = 'Quantity'
    end
    object Label4: TLabel
      Left = 208
      Top = 104
      Width = 56
      Height = 17
      Caption = 'Unit price'
    end
    object Label7: TLabel
      Left = 359
      Top = 164
      Width = 61
      Height = 17
      Caption = 'Total price'
    end
    object btnWorktops: TSpeedButton
      Left = 591
      Top = 75
      Width = 23
      Height = 22
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnWorktopsClick
    end
    object Label9: TLabel
      Left = 16
      Top = 44
      Width = 69
      Height = 17
      Caption = 'Price Group'
    end
    object btnPriceGroup: TSpeedButton
      Left = 250
      Top = 43
      Width = 23
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
      OnClick = btnPriceGroupClick
    end
    object Label10: TLabel
      Left = 16
      Top = 196
      Width = 66
      Height = 17
      Caption = 'Description'
    end
    object SpeedButton1: TSpeedButton
      Left = 290
      Top = 193
      Width = 23
      Height = 22
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object edtDepth: TCREditInt
      Left = 96
      Top = 160
      Width = 89
      Height = 25
      TabOrder = 6
      OnChange = edtDepthChange
    end
    object edtLength: TCREditInt
      Left = 96
      Top = 128
      Width = 89
      Height = 25
      TabOrder = 5
      OnChange = edtDepthChange
    end
    object dblkpWTThickness: TDBLookupComboBox
      Left = 96
      Top = 101
      Width = 89
      Height = 25
      KeyField = 'Thickness'
      ListField = 'Thickness_mm'
      ListSource = dtsWTThickness
      TabOrder = 3
      OnClick = dblkpWTThicknessClick
    end
    object dblkpWorktop: TDBLookupComboBox
      Left = 96
      Top = 72
      Width = 481
      Height = 25
      KeyField = 'Worktop'
      ListField = 'Description'
      ListSource = dtsWorktops
      TabOrder = 2
      OnClick = dblkpWorktopClick
    end
    object edtUnitPrice: TCREditMoney
      Left = 271
      Top = 100
      Width = 81
      Height = 25
      TabOrder = 4
      OnChange = edtDepthChange
    end
    object spnQuantity: TSpinEdit
      Left = 271
      Top = 159
      Width = 65
      Height = 27
      MaxValue = 1000
      MinValue = 1
      TabOrder = 7
      Value = 1
      OnChange = spnQuantityChange
    end
    object edtTotalPrice: TCREditMoney
      Left = 430
      Top = 160
      Width = 81
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object dblkpWTGroup: TDBLookupComboBox
      Left = 96
      Top = 42
      Width = 145
      Height = 25
      KeyField = 'Worktop_Group'
      ListField = 'Worktop_Group_Description'
      ListSource = dtsWTGroup
      TabOrder = 1
      OnClick = dblkpWTGroupClick
    end
    object dblkpMaterial: TDBLookupComboBox
      Left = 96
      Top = 12
      Width = 145
      Height = 25
      KeyField = 'Material_Type'
      ListField = 'Description'
      ListSource = dtsMaterial
      TabOrder = 0
      OnClick = dblkpMaterialClick
    end
    object cmbMaterialUse: TComboBox
      Left = 96
      Top = 192
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
      '((worktop_group = :worktop_group) or (0 = :worktop_group)) and'
      
        '(worktop.inactive = '#39'N'#39' or worktop.inactive is null) OR worktop ' +
        '= :worktop'
      'Order by Description')
    Left = 220
    Top = 137
    ParamData = <
      item
        Name = 'material_type'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'worktop_group'
        ParamType = ptInput
      end
      item
        Name = 'worktop'
        ParamType = ptInput
      end>
  end
  object qryWTThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select'
      '  worktop_thickness.thickness,'
      '  Thickness.Thickness_mm'
      'from worktop_thickness, thickness'
      'where (worktop = :worktop and'
      '  worktop_thickness.thickness = thickness.thickness) and'
      
        '  ((worktop_thickness.inactive = '#39'N'#39') OR (worktop_thickness.inac' +
        'tive IS NULL) OR (worktop_thickness.thickness = :Thickness))'
      'order by thickness_mm')
    Left = 320
    Top = 158
    ParamData = <
      item
        Name = 'worktop'
        ParamType = ptInput
      end
      item
        Name = 'THICKNESS'
        ParamType = ptInput
      end>
  end
  object dtsWorktops: TDataSource
    DataSet = qryWorktops
    Left = 315
    Top = 36
  end
  object dtsWTThickness: TDataSource
    DataSet = qryWTThickness
    Left = 370
    Top = 158
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
    Left = 443
    Top = 18
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
      
        'where (((Material_Type = :Material_type) or (Material_Type is NU' +
        'LL)) and'
      
        '(inactive = '#39'N'#39' or inactive is null)) OR Worktop_Group = :Workto' +
        'p_Group'
      'order by Worktop_group_description')
    Left = 261
    Top = 139
    ParamData = <
      item
        Name = 'Material_type'
      end
      item
        Name = 'Worktop_Group'
      end>
  end
  object dtsWTGroup: TDataSource
    DataSet = qryWTGroup
    Left = 345
    Top = 143
  end
  object qryMaterial: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Material_Type,'
      '      Description,'
      '      inactive,'
      '      Commission_Rate,'
      '      Sales_Nominal,'
      '      Purchase_Nominal,'
      '      Show_Online,'
      '      Long_Description,'
      '      Short_Description,'
      '      Worktop_Type,'
      '      Image_Path,'
      '      Preferred_Supplier,'
      '      Warranty_Description,'
      '      Maintenance_Description'
      'from Material_Type'
      
        'where (inactive = '#39'N'#39' or inactive is null) OR Material_Type = :M' +
        'aterial_Type'
      'order by Description')
    Left = 305
    Top = 2
    ParamData = <
      item
        Name = 'Material_Type'
        ParamType = ptInput
      end>
  end
  object dtsMaterial: TDataSource
    DataSet = qryMaterial
    Left = 491
    Top = 10
  end
  object qryContractWorktops: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Worktop_Group.Customer,'
      '        Customer_Worktop_Group.Group_Number,'
      '        Customer_Worktop.Worktop,'
      '        Worktop.Description,'
      '        Customer_Worktop_Group.Material_Type,'
      '        Material_Type.Description'
      'FROM Material_Type'
      '        INNER JOIN (Worktop'
      '        INNER JOIN (Customer_Worktop_Group'
      '        INNER JOIN Customer_Worktop'
      
        '          ON (Customer_Worktop_Group.Group_Number = Customer_Wor' +
        'ktop.Group_Number) AND (Customer_Worktop_Group.Customer = Custom' +
        'er_Worktop.Customer))'
      '          ON Worktop.Worktop = Customer_Worktop.Worktop)'
      
        '          ON Material_Type.Material_Type = Customer_Worktop_Grou' +
        'p.Material_Type'
      'WHERE Customer_Worktop_Group.Customer = :Customer AND'
      '      Customer_Worktop_Group.Group_Number = :Group_Number and'
      
        '      (worktop.inactive = '#39'N'#39' or worktop.inactive is null) OR Wo' +
        'rktop.worktop = :worktop'
      'ORDER BY Worktop.Description')
    Left = 476
    Top = 170
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Group_Number'
      end
      item
        Name = 'worktop'
      end>
  end
  object qryContractPrice: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Worktop_Group_Thick.Customer,'
      '        Customer_Worktop_Group_Thick.Group_Number,'
      '        Customer_Worktop_Group_Thick.Thickness,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      
        '         where Price_Pointer = Customer_Worktop_Group_Thick.Pric' +
        'e_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Price_unit'
      '         from Prices'
      
        '         where Price_Pointer = Customer_Worktop_Group_Thick.Pric' +
        'e_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'FROM Customer_Worktop_Group'
      '      LEFT JOIN Customer_Worktop_Group_Thick'
      
        '        ON (Customer_Worktop_Group.Group_Number = Customer_Workt' +
        'op_Group_Thick.Group_Number)'
      
        '        AND (Customer_Worktop_Group.Customer = Customer_Worktop_' +
        'Group_Thick.Customer)'
      'WHERE'
      '  Customer_Worktop_Group_Thick.Customer = :Customer AND'
      '  Customer_Worktop_Group_Thick.Group_Number = :Group_Number AND'
      '  Customer_Worktop_Group_Thick.Thickness = :Thickness')
    Left = 256
    Top = 60
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Group_Number'
      end
      item
        Name = 'Thickness'
      end>
  end
  object qryCustomerWorktops: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Worktop_Group.Customer,'
      '        Customer_Worktop_Group.Group_Number,'
      '        Customer_Worktop.Worktop,'
      '        Worktop.Description,'
      '        Customer_Worktop_Group.Material_Type'
      'FROM Material_Type'
      '        INNER JOIN (Worktop'
      '        INNER JOIN (Customer_Worktop_Group'
      '        INNER JOIN Customer_Worktop'
      
        '          ON (Customer_Worktop_Group.Group_Number = Customer_Wor' +
        'ktop.Group_Number) AND (Customer_Worktop_Group.Customer = Custom' +
        'er_Worktop.Customer))'
      '          ON Worktop.Worktop = Customer_Worktop.Worktop)'
      
        '          ON Material_Type.Material_Type = Customer_Worktop_Grou' +
        'p.Material_Type'
      'WHERE (Customer_Worktop_Group.Customer = :Customer) AND'
      
        '      (Customer_Worktop_Group.Material_Type = :Material_Type) an' +
        'd'
      
        '      ((Worktop.Worktop_Group = :Worktop_Group) or (0 = :Worktop' +
        '_Group)) and'
      '      (Customer_Worktop_Group.Use_For_General_Quoting = '#39'Y'#39') AND'
      
        '      ((Worktop.inactive = '#39'N'#39') or (Worktop.inactive is null) OR' +
        ' (Worktop.worktop = :worktop))'
      'ORDER BY Worktop.Description')
    Left = 329
    Top = 124
    ParamData = <
      item
        Name = 'Customer'
        ParamType = ptInput
      end
      item
        Name = 'Material_Type'
        ParamType = ptInput
      end
      item
        Name = 'Worktop_Group'
        ParamType = ptInput
      end
      item
        Name = 'worktop'
        ParamType = ptInput
      end>
  end
  object qryCustomerPrice: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Worktop_Group_Thick.Customer,'
      '        Customer_Worktop_Group_Thick.Group_Number,'
      '        Customer_Worktop_Group_Thick.Thickness,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      
        '         where Price_Pointer = Customer_Worktop_Group_Thick.Pric' +
        'e_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Price_unit'
      '         from Prices'
      
        '         where Price_Pointer = Customer_Worktop_Group_Thick.Pric' +
        'e_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'FROM Customer_Worktop_Group'
      '      LEFT JOIN Customer_Worktop_Group_Thick'
      
        '        ON (Customer_Worktop_Group.Group_Number = Customer_Workt' +
        'op_Group_Thick.Group_Number)'
      
        '        AND (Customer_Worktop_Group.Customer = Customer_Worktop_' +
        'Group_Thick.Customer)'
      'WHERE'
      '  Customer_Worktop_Group_Thick.Customer = :Customer AND'
      '  Customer_Worktop_Group_Thick.Group_Number = :Group_Number AND'
      '  Customer_Worktop_Group_Thick.Thickness = :Thickness')
    Left = 450
    Top = 108
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Group_Number'
      end
      item
        Name = 'Thickness'
      end>
  end
  object qryMaterialUse: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Material_Use'
      'WHERE Use_Type <= 1'
      'ORDER BY Use_Description ASC')
    Left = 192
    Top = 96
  end
  object dtsMaterialUse: TDataSource
    DataSet = qryMaterialUse
    Left = 192
    Top = 16
  end
end
