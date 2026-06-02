object frmWTMaintQUpstand: TfrmWTMaintQUpstand
  Left = 364
  Top = 167
  BorderStyle = bsDialog
  Caption = 'Maintain upstand'
  ClientHeight = 297
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    656
    297)
  TextHeight = 17
  object lblDelete: TLabel
    Left = 115
    Top = 263
    Width = 128
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Delete these details?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 243
    Top = 260
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOKClick
    ExplicitTop = 251
  end
  object BitBtn2: TBitBtn
    Left = 339
    Top = 260
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
    ExplicitTop = 251
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 649
    Height = 241
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 48
      Height = 17
      Caption = 'Material'
    end
    object Label2: TLabel
      Left = 16
      Top = 44
      Width = 50
      Height = 17
      Caption = 'Worktop'
    end
    object Label3: TLabel
      Left = 16
      Top = 73
      Width = 55
      Height = 17
      Caption = 'Thickness'
    end
    object Label4: TLabel
      Left = 433
      Top = 72
      Width = 56
      Height = 17
      Caption = 'Unit price'
    end
    object Label5: TLabel
      Left = 16
      Top = 100
      Width = 72
      Height = 17
      Caption = 'Height (mm)'
    end
    object Label6: TLabel
      Left = 16
      Top = 132
      Width = 73
      Height = 17
      Caption = 'Length (mm)'
    end
    object Label8: TLabel
      Left = 16
      Top = 164
      Width = 48
      Height = 17
      Caption = 'Quantity'
    end
    object Label7: TLabel
      Left = 433
      Top = 164
      Width = 61
      Height = 17
      Caption = 'Total price'
    end
    object Label9: TLabel
      Left = 433
      Top = 100
      Width = 82
      Height = 17
      Caption = 'Polish Price/m'
    end
    object Label10: TLabel
      Left = 16
      Top = 200
      Width = 74
      Height = 17
      Caption = 'Material Use'
    end
    object SpeedButton1: TSpeedButton
      Left = 292
      Top = 197
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
    object Label11: TLabel
      Left = 433
      Top = 132
      Width = 80
      Height = 17
      Caption = 'Polish Cost/m'
    end
    object Label12: TLabel
      Left = 210
      Top = 100
      Width = 130
      Height = 17
      Caption = 'No. of Polished Edges'
    end
    object Label13: TLabel
      Left = 210
      Top = 132
      Width = 139
      Height = 17
      Caption = 'No. of Polished Lengths'
    end
    object Label14: TLabel
      Left = 433
      Top = 200
      Width = 106
      Height = 17
      Caption = 'Total No of Pieces'
    end
    object dblkpWorktop: TDBLookupComboBox
      Left = 98
      Top = 40
      Width = 507
      Height = 25
      KeyField = 'Worktop'
      ListField = 'Description'
      ListSource = dtsWorktops
      TabOrder = 1
      OnClick = dblkpWorktopClick
    end
    object dblkpWTThickness: TDBLookupComboBox
      Left = 98
      Top = 69
      Width = 89
      Height = 25
      KeyField = 'Thickness'
      ListField = 'Thickness_mm'
      ListSource = dtsWTThickness
      TabOrder = 2
      OnClick = dblkpWTThicknessClick
    end
    object edtUnitPrice: TCREditMoney
      Left = 524
      Top = 68
      Width = 81
      Height = 25
      TabOrder = 3
      OnChange = edtDepthChange
    end
    object edtDepth: TCREditInt
      Left = 98
      Top = 96
      Width = 89
      Height = 25
      TabOrder = 4
      OnChange = edtDepthChange
    end
    object edtLength: TCREditInt
      Left = 98
      Top = 128
      Width = 89
      Height = 25
      TabOrder = 7
      OnChange = edtDepthChange
    end
    object spnQuantity: TSpinEdit
      Left = 98
      Top = 159
      Width = 49
      Height = 27
      MaxValue = 100
      MinValue = 1
      TabOrder = 10
      Value = 1
      OnChange = spnQuantityChange
    end
    object edtTotalPrice: TCREditMoney
      Left = 524
      Top = 160
      Width = 81
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 11
    end
    object edtPolishPrice: TCREditMoney
      Left = 524
      Top = 96
      Width = 81
      Height = 25
      TabOrder = 6
      OnChange = edtDepthChange
    end
    object dblkpMaterial: TDBLookupComboBox
      Left = 98
      Top = 12
      Width = 145
      Height = 25
      KeyField = 'Material_Type'
      ListField = 'Description'
      ListSource = dtsMaterial
      TabOrder = 0
      OnClick = dblkpMaterialClick
    end
    object dblkpMaterialUse: TDBLookupComboBox
      Left = 98
      Top = 196
      Width = 185
      Height = 25
      KeyField = 'Material_Use'
      ListField = 'Use_Description'
      ListSource = dtsMaterialUse
      TabOrder = 12
      OnClick = dblkpMaterialClick
    end
    object edtPolishCost: TCREditMoney
      Left = 524
      Top = 128
      Width = 81
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 9
    end
    object spnNoOfDepths: TSpinEdit
      Left = 359
      Top = 95
      Width = 49
      Height = 27
      MaxValue = 2
      MinValue = 0
      TabOrder = 5
      Value = 0
      OnChange = spnQuantityChange
    end
    object spnNoOfLengths: TSpinEdit
      Left = 359
      Top = 127
      Width = 49
      Height = 27
      MaxValue = 2
      MinValue = 0
      TabOrder = 8
      Value = 1
      OnChange = spnQuantityChange
    end
    object spnNoOfPieces: TSpinEdit
      Left = 556
      Top = 195
      Width = 49
      Height = 27
      MaxValue = 100
      MinValue = 1
      TabOrder = 13
      Value = 1
      OnChange = spnQuantityChange
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
      '(inactive = '#39'N'#39' or inactive is null) or worktop = :worktop'
      'Order by Description')
    Left = 68
    Top = 26
    ParamData = <
      item
        Name = 'material_type'
        DataType = ftInteger
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
    Left = 522
    Top = 73
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
    Left = 147
    Top = 26
  end
  object dtsWTThickness: TDataSource
    DataSet = qryWTThickness
    Left = 256
    Top = 33
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
    Left = 348
    Top = 80
    ParamData = <
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
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
    Left = 281
    Top = 33
    ParamData = <
      item
        Name = 'Material_Type'
      end>
  end
  object dtsMaterial: TDataSource
    DataSet = qryMaterial
    Left = 343
    Top = 33
  end
  object qryMaterialUse: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Material_Use.*'
      'from Material_Use'
      
        'WHERE ((Use_Type = 0) OR (Use_Type IS NULL) OR (Use_Type = 2)) A' +
        'ND'
      
        '      (inactive = '#39'N'#39' or inactive is null) OR Material_Use = :Ma' +
        'terial_Use'
      'order by Use_Description ASC')
    Left = 338
    ParamData = <
      item
        Name = 'Material_Use'
      end>
  end
  object dtsMaterialUse: TDataSource
    DataSet = qryMaterialUse
    Left = 388
  end
  object qryContractWorktops: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Worktop_Group.Customer,'
      '        Customer_Worktop_Group.Group_Number,'
      '        Customer_Worktop.Worktop,'
      '        Worktop.Description,'
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
      'WHERE (Customer_Worktop_Group.Customer = :Customer) AND'
      '      (Customer_Worktop_Group.Group_Number = :Group_Number) and'
      
        '      ((worktop.inactive = '#39'N'#39') or (worktop.inactive is null) OR' +
        ' (Worktop.worktop = :worktop))'
      'ORDER BY Worktop.Description')
    Left = 348
    Top = 140
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
    Left = 172
    Top = 140
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
      'WHERE Customer_Worktop_Group.Customer = :Customer AND'
      '      Customer_Worktop_Group.Material_Type = :Material_Type and'
      '      (Customer_Worktop_Group.Use_For_General_Quoting = '#39'Y'#39') AND'
      
        '      ((Worktop.inactive = '#39'N'#39') or (Worktop.inactive is null) OR' +
        ' (Worktop.worktop = :worktop))'
      'ORDER BY Worktop.Description')
    Left = 308
    Top = 194
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
    Left = 460
    Top = 170
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
