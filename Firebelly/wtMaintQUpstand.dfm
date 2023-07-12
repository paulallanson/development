object frmWTMaintQUpstand: TfrmWTMaintQUpstand
  Left = 364
  Top = 167
  BorderStyle = bsDialog
  Caption = 'Maintain upstand'
  ClientHeight = 287
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    603
    287)
  PixelsPerInch = 96
  TextHeight = 13
  object lblDelete: TLabel
    Left = 88
    Top = 258
    Width = 121
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Delete these details?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 216
    Top = 250
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    TabOrder = 1
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 312
    Top = 250
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    NumGlyphs = 2
  end
  object pnlDetails: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 601
    Height = 241
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Material'
    end
    object Label2: TLabel
      Left = 16
      Top = 44
      Width = 41
      Height = 13
      Caption = 'Worktop'
    end
    object Label3: TLabel
      Left = 16
      Top = 73
      Width = 49
      Height = 13
      Caption = 'Thickness'
    end
    object Label4: TLabel
      Left = 424
      Top = 72
      Width = 45
      Height = 13
      Caption = 'Unit price'
    end
    object Label5: TLabel
      Left = 16
      Top = 100
      Width = 56
      Height = 13
      Caption = 'Height (mm)'
    end
    object Label6: TLabel
      Left = 16
      Top = 132
      Width = 58
      Height = 13
      Caption = 'Length (mm)'
    end
    object Label8: TLabel
      Left = 16
      Top = 164
      Width = 39
      Height = 13
      Caption = 'Quantity'
    end
    object Label7: TLabel
      Left = 424
      Top = 164
      Width = 50
      Height = 13
      Caption = 'Total price'
    end
    object Label9: TLabel
      Left = 424
      Top = 100
      Width = 68
      Height = 13
      Caption = 'Polish Price/m'
    end
    object Label10: TLabel
      Left = 16
      Top = 200
      Width = 59
      Height = 13
      Caption = 'Material Use'
    end
    object SpeedButton1: TSpeedButton
      Left = 282
      Top = 195
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
    object Label11: TLabel
      Left = 424
      Top = 132
      Width = 65
      Height = 13
      Caption = 'Polish Cost/m'
    end
    object Label12: TLabel
      Left = 200
      Top = 100
      Width = 105
      Height = 13
      Caption = 'No. of Polished Edges'
    end
    object Label13: TLabel
      Left = 200
      Top = 132
      Width = 113
      Height = 13
      Caption = 'No. of Polished Lengths'
    end
    object Label14: TLabel
      Left = 424
      Top = 200
      Width = 88
      Height = 13
      Caption = 'Total No of Pieces'
    end
    object dblkpWorktop: TDBLookupComboBox
      Left = 88
      Top = 40
      Width = 249
      Height = 21
      KeyField = 'Worktop'
      ListField = 'Description'
      ListSource = dtsWorktops
      TabOrder = 1
      OnClick = dblkpWorktopClick
    end
    object dblkpWTThickness: TDBLookupComboBox
      Left = 88
      Top = 69
      Width = 89
      Height = 21
      KeyField = 'Thickness'
      ListField = 'Thickness_mm'
      ListSource = dtsWTThickness
      TabOrder = 2
      OnClick = dblkpWTThicknessClick
    end
    object edtUnitPrice: TCREditMoney
      Left = 504
      Top = 68
      Width = 81
      Height = 21
      TabOrder = 3
      OnChange = edtDepthChange
    end
    object edtDepth: TCREditInt
      Left = 88
      Top = 96
      Width = 89
      Height = 21
      TabOrder = 4
      OnChange = edtDepthChange
    end
    object edtLength: TCREditInt
      Left = 88
      Top = 128
      Width = 89
      Height = 21
      TabOrder = 7
      OnChange = edtDepthChange
    end
    object spnQuantity: TSpinEdit
      Left = 88
      Top = 159
      Width = 49
      Height = 22
      MaxValue = 100
      MinValue = 1
      TabOrder = 10
      Value = 1
      OnChange = spnQuantityChange
    end
    object edtTotalPrice: TCREditMoney
      Left = 504
      Top = 160
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 11
    end
    object edtPolishPrice: TCREditMoney
      Left = 504
      Top = 96
      Width = 81
      Height = 21
      TabOrder = 6
      OnChange = edtDepthChange
    end
    object dblkpMaterial: TDBLookupComboBox
      Left = 88
      Top = 12
      Width = 145
      Height = 21
      KeyField = 'Material_Type'
      ListField = 'Description'
      ListSource = dtsMaterial
      TabOrder = 0
      OnClick = dblkpMaterialClick
    end
    object dblkpMaterialUse: TDBLookupComboBox
      Left = 88
      Top = 196
      Width = 185
      Height = 21
      KeyField = 'Material_Use'
      ListField = 'Use_Description'
      ListSource = dtsMaterialUse
      TabOrder = 12
      OnClick = dblkpMaterialClick
    end
    object edtPolishCost: TCREditMoney
      Left = 504
      Top = 128
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 9
    end
    object spnNoOfDepths: TSpinEdit
      Left = 320
      Top = 95
      Width = 49
      Height = 22
      MaxValue = 2
      MinValue = 0
      TabOrder = 5
      Value = 0
      OnChange = spnQuantityChange
    end
    object spnNoOfLengths: TSpinEdit
      Left = 320
      Top = 127
      Width = 49
      Height = 22
      MaxValue = 2
      MinValue = 0
      TabOrder = 8
      Value = 1
      OnChange = spnQuantityChange
    end
    object spnNoOfPieces: TSpinEdit
      Left = 536
      Top = 195
      Width = 49
      Height = 22
      MaxValue = 100
      MinValue = 1
      TabOrder = 13
      Value = 1
      OnChange = spnQuantityChange
    end
  end
  object qryWorktops: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select * '
      'from worktop'
      'where material_type = :material_type and'
      '(inactive = '#39'N'#39' or inactive is null) or worktop = :worktop'
      'Order by Description')
    Left = 512
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'material_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'worktop'
        ParamType = ptUnknown
      end>
  end
  object qryWTThickness: TQuery
    DatabaseName = 'wt'
    DataSource = dtsWorktops
    SQL.Strings = (
      'select'
      '  worktop_thickness.thickness,'
      '  Thickness.Thickness_mm'
      'from worktop_thickness, thickness'
      'where worktop = :worktop and'
      '  worktop_thickness.thickness = thickness.thickness'
      'order by thickness_mm')
    Left = 440
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'worktop'
        ParamType = ptUnknown
      end>
  end
  object dtsWorktops: TDataSource
    DataSet = qryWorktops
    Left = 552
    Top = 176
  end
  object dtsWTThickness: TDataSource
    DataSet = qryWTThickness
    Left = 480
    Top = 8
  end
  object qryOneWTThickness: TQuery
    DatabaseName = 'wt'
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
    Left = 336
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Worktop'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end>
  end
  object qryMaterial: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select Material_Type.*'
      'from Material_Type'
      
        'where (inactive = '#39'N'#39' or inactive is null) OR Material_Type = :M' +
        'aterial_Type'
      'order by Description')
    Left = 328
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end>
  end
  object dtsMaterial: TDataSource
    DataSet = qryMaterial
    Left = 368
    Top = 8
  end
  object qryMaterialUse: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select Material_Use.*'
      'from Material_Use'
      
        'WHERE ((Use_Type = 0) OR (Use_Type IS NULL) OR (Use_Type = 2)) A' +
        'ND'
      
        '      (inactive = '#39'N'#39' or inactive is null) OR Material_Use = :Ma' +
        'terial_Use'
      'order by Use_Description ASC')
    Left = 328
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Material_Use'
        ParamType = ptUnknown
      end>
  end
  object dtsMaterialUse: TDataSource
    DataSet = qryMaterialUse
    Left = 368
    Top = 64
  end
  object qryContractWorktops: TQuery
    DatabaseName = 'WT'
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
      'WHERE (Customer_Worktop_Group.Customer = :Customer) AND'
      '      (Customer_Worktop_Group.Group_Number = :Group_Number) and'
      
        '      ((worktop.inactive = '#39'N'#39') or (worktop.inactive is null) OR' +
        ' (Worktop.worktop = :worktop))'
      'ORDER BY Worktop.Description')
    Left = 336
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'worktop'
        ParamType = ptUnknown
      end>
  end
  object qryContractPrice: TQuery
    DatabaseName = 'WT'
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
    Left = 432
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end>
  end
  object qryCustomerWorktops: TQuery
    DatabaseName = 'WT'
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
      '      Customer_Worktop_Group.Material_Type = :Material_Type and'
      '      (Customer_Worktop_Group.Use_For_General_Quoting = '#39'Y'#39') AND'
      
        '      ((Worktop.inactive = '#39'N'#39') or (Worktop.inactive is null) OR' +
        ' (Worktop.worktop = :worktop))'
      'ORDER BY Worktop.Description')
    Left = 336
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'worktop'
        ParamType = ptUnknown
      end>
  end
  object qryCustomerPrice: TQuery
    DatabaseName = 'WT'
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
    Left = 432
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end>
  end
end
