object frmWTMaintQElementM: TfrmWTMaintQElementM
  Left = 480
  Top = 206
  BorderStyle = bsDialog
  Caption = 'Global change elements'
  ClientHeight = 245
  ClientWidth = 611
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
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 611
    Height = 201
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 602
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
      Top = 107
      Width = 55
      Height = 17
      Caption = 'Thickness'
    end
    object Label4: TLabel
      Left = 208
      Top = 106
      Width = 56
      Height = 17
      Caption = 'Unit price'
    end
    object btnWorktops: TSpeedButton
      Left = 562
      Top = 73
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
      Top = 45
      Width = 69
      Height = 17
      Caption = 'Price Group'
    end
    object btnPriceGroup: TSpeedButton
      Left = 250
      Top = 42
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
      OnClick = btnPriceGroupClick
    end
    object dblkpWTThickness: TDBLookupComboBox
      Left = 96
      Top = 103
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
      Width = 450
      Height = 25
      KeyField = 'Worktop'
      ListField = 'Description'
      ListSource = dtsWorktops
      TabOrder = 2
      OnClick = dblkpWorktopClick
    end
    object edtUnitPrice: TCREditMoney
      Left = 274
      Top = 102
      Width = 81
      Height = 25
      TabOrder = 4
      OnClick = EnableOK
    end
    object dblkpWTGroup: TDBLookupComboBox
      Left = 96
      Top = 41
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
    object GroupBox1: TGroupBox
      Left = 8
      Top = 136
      Width = 521
      Height = 64
      Caption = 'Upstands etc.'
      ParentBackground = False
      TabOrder = 5
      object Label5: TLabel
        Left = 8
        Top = 28
        Width = 55
        Height = 17
        Caption = 'Thickness'
      end
      object Label6: TLabel
        Left = 200
        Top = 28
        Width = 56
        Height = 17
        Caption = 'Unit price'
      end
      object dblkpUPThickness: TDBLookupComboBox
        Left = 88
        Top = 24
        Width = 89
        Height = 25
        KeyField = 'Thickness'
        ListField = 'Thickness_mm'
        ListSource = dtsUPThickness
        TabOrder = 0
        OnClick = dblkpUPThicknessClick
      end
      object edtUPUnitPrice: TCREditMoney
        Left = 267
        Top = 24
        Width = 81
        Height = 25
        TabOrder = 1
        OnClick = EnableOK
      end
    end
  end
  object btnOK: TBitBtn
    Left = 227
    Top = 207
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
    Left = 308
    Top = 208
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
  end
  object qryWTGroup: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Worktop_Group.*'
      'from Worktop_Group'
      
        'where ((Material_Type = :Material_type) or (Material_Type is NUL' +
        'L)) and'
      
        '((inactive = '#39'N'#39' or inactive is null)) OR Worktop_Group = :Workt' +
        'op_Group'
      'order by Worktop_group_description')
    Left = 417
    Top = 93
    ParamData = <
      item
        Name = 'material_type'
      end
      item
        Name = 'Worktop_Group'
      end>
  end
  object dtsWTGroup: TDataSource
    DataSet = qryWTGroup
    Left = 121
    Top = 80
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
    Left = 333
    Top = 42
    ParamData = <
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end>
  end
  object dtsWorktops: TDataSource
    DataSet = qryWorktops
    Left = 321
    Top = 105
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
    Left = 228
    Top = 10
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
  object dtsWTThickness: TDataSource
    DataSet = qryWTThickness
    Left = 308
    Top = 10
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
    Left = 258
    Top = 105
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
  object qryMaterial: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Material_Type.*'
      'from Material_Type'
      
        'where (inactive = '#39'N'#39' or inactive is null) OR Material_Type = :M' +
        'aterial_Type'
      'order by Description')
    Left = 258
    Top = 17
    ParamData = <
      item
        Name = 'Material_Type'
      end>
  end
  object dtsMaterial: TDataSource
    DataSet = qryMaterial
    Left = 158
    Top = 5
  end
  object qryUpThickness: TFDQuery
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
    Left = 172
    Top = 88
    ParamData = <
      item
        Name = 'worktop'
      end>
  end
  object dtsUPThickness: TDataSource
    DataSet = qryUpThickness
    Left = 436
    Top = 64
  end
  object qryContractWorktops: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Worktop_Group.Customer,'
      '        Customer_Worktop_Group.Group_Number,'
      '        Customer_Worktop.Worktop,'
      '        Worktop.Description as Worktop_Description,'
      '        Customer_Worktop_Group.Material_Type,'
      '        Material_Type.Description as Material_Type_Description'
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
    Left = 148
    Top = 132
    ParamData = <
      item
        Name = 'Customer'
        ParamType = ptInput
      end
      item
        Name = 'Group_Number'
        ParamType = ptInput
      end
      item
        Name = 'worktop'
        ParamType = ptInput
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
    Left = 238
    Top = 132
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
      '        Worktop.Description as Worktop_Description,'
      '        Customer_Worktop_Group.Material_Type,'
      '        Material_Type.Description as Material_type_Description'
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
    Left = 92
    Top = 10
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
    Left = 182
    Top = 10
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
end
