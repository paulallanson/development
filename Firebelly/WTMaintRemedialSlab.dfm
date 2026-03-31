object frmWTMaintRemedialSlab: TfrmWTMaintRemedialSlab
  Left = 312
  Top = 102
  BorderStyle = bsDialog
  Caption = 'Maintain Slab'
  ClientHeight = 444
  ClientWidth = 811
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
    Width = 811
    Height = 398
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 1207
    ExplicitHeight = 391
    object Label1: TLabel
      Left = 16
      Top = 14
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
      Top = 106
      Width = 55
      Height = 17
      Caption = 'Thickness'
    end
    object Label6: TLabel
      Left = 16
      Top = 166
      Width = 73
      Height = 17
      Caption = 'Length (mm)'
    end
    object Label5: TLabel
      Left = 16
      Top = 196
      Width = 69
      Height = 17
      Caption = 'Depth (mm)'
    end
    object Label4: TLabel
      Left = 220
      Top = 224
      Width = 87
      Height = 17
      Caption = 'Unit Cost/sq m'
    end
    object Label7: TLabel
      Left = 599
      Top = 224
      Width = 87
      Height = 17
      Caption = 'Total Slab Cost'
    end
    object Label8: TLabel
      Left = 16
      Top = 45
      Width = 48
      Height = 17
      Caption = 'Supplier'
    end
    object Label9: TLabel
      Left = 16
      Top = 136
      Width = 52
      Height = 17
      Caption = 'Slab Size'
    end
    object Label10: TLabel
      Left = 16
      Top = 252
      Width = 50
      Height = 17
      Caption = 'Waste %'
    end
    object Label11: TLabel
      Left = 220
      Top = 252
      Width = 94
      Height = 17
      Caption = 'Waste Multiplier'
    end
    object Label12: TLabel
      Left = 420
      Top = 252
      Width = 65
      Height = 17
      Caption = 'Waste Cost'
    end
    object SpeedButton1: TSpeedButton
      Left = 302
      Top = 11
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
    object Label13: TLabel
      Left = 16
      Top = 224
      Width = 48
      Height = 17
      Caption = 'Quantity'
    end
    object Label14: TLabel
      Left = 428
      Top = 224
      Width = 55
      Height = 17
      Caption = 'Slab Cost'
    end
    object Label26: TLabel
      Left = 624
      Top = 252
      Width = 51
      Height = 17
      Caption = 'Area m2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDepth: TCREditInt
      Left = 108
      Top = 192
      Width = 89
      Height = 25
      TabOrder = 6
      OnChange = edtDepthChange
      OnEnter = edtDepthEnter
      OnExit = edtDepthExit
    end
    object edtLength: TCREditInt
      Left = 108
      Top = 162
      Width = 89
      Height = 25
      TabOrder = 5
      OnChange = edtDepthChange
      OnEnter = edtLengthEnter
      OnExit = edtLengthExit
    end
    object dblkpWTThickness: TDBLookupComboBox
      Left = 108
      Top = 102
      Width = 89
      Height = 25
      KeyField = 'Thickness'
      ListField = 'Thickness_mm'
      ListSource = dtsWTThickness
      TabOrder = 3
      OnClick = dblkpWTThicknessClick
    end
    object dblkpWorktop: TDBLookupComboBox
      Left = 108
      Top = 72
      Width = 249
      Height = 25
      KeyField = 'Worktop'
      ListField = 'Description'
      ListSource = dtsWorktops
      TabOrder = 2
      OnClick = dblkpWorktopClick
    end
    object edtUnitCost: TCREditMoney
      Left = 316
      Top = 220
      Width = 81
      Height = 25
      TabOrder = 8
      OnChange = edtDepthChange
      OnEnter = edtUnitCostEnter
      OnExit = edtUnitCostExit
    end
    object edtTotalCost: TCREditMoney
      Left = 693
      Top = 220
      Width = 81
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 10
      OnChange = edtTotalCostChange
    end
    object dblkpMaterial: TDBLookupComboBox
      Left = 108
      Top = 10
      Width = 177
      Height = 25
      KeyField = 'Material_Type'
      ListField = 'Description'
      ListSource = dtsMaterial
      TabOrder = 0
      OnClick = dblkpMaterialClick
    end
    object dblkpSupplier: TDBLookupComboBox
      Left = 108
      Top = 41
      Width = 249
      Height = 25
      KeyField = 'Supplier'
      ListField = 'Supplier_Name'
      ListSource = dtsSupplier
      TabOrder = 1
      OnClick = dblkpSupplierClick
    end
    object edtWastePercentage: TCREditInt
      Left = 108
      Top = 248
      Width = 89
      Height = 25
      TabOrder = 11
      OnChange = edtWastePercentageChange
    end
    object spnWasteMultiplier: TSpinEdit
      Left = 316
      Top = 248
      Width = 41
      Height = 27
      MaxValue = 10
      MinValue = 0
      TabOrder = 12
      Value = 0
      OnChange = edtWastePercentageChange
    end
    object edtTotalWasteCost: TCREditMoney
      Left = 492
      Top = 248
      Width = 81
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 13
    end
    object dblkpSlabSize: TDBLookupComboBox
      Left = 108
      Top = 132
      Width = 249
      Height = 25
      KeyField = 'Slab_Size'
      ListField = 'Slab_Description'
      ListSource = dtsSlabSize
      TabOrder = 4
      OnClick = dblkpSlabSizeClick
    end
    object edtSlabCost: TCREditMoney
      Left = 492
      Top = 220
      Width = 81
      Height = 25
      TabOrder = 9
      OnChange = edtSlabCostChange
      OnEnter = edtSlabCostEnter
      OnExit = edtSlabCostExit
    end
    object pnlAdhesive: TPanel
      Left = 0
      Top = 304
      Width = 811
      Height = 64
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 14
      ExplicitTop = 299
      ExplicitWidth = 742
      object Label19: TLabel
        Left = 16
        Top = 13
        Width = 87
        Height = 17
        Caption = 'Adhesive Code'
      end
      object Label20: TLabel
        Left = 435
        Top = 45
        Width = 48
        Height = 17
        Caption = 'Quantity'
      end
      object Label21: TLabel
        Left = 431
        Top = 13
        Width = 53
        Height = 17
        Caption = 'Unit Cost'
      end
      object btnLUProducts: TSpeedButton
        Left = 329
        Top = 8
        Width = 23
        Height = 23
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnLUProductsClick
      end
      object Label22: TLabel
        Left = 574
        Top = 42
        Width = 114
        Height = 17
        Caption = 'Total Adhesive Cost'
      end
      object Label24: TLabel
        Left = 597
        Top = 13
        Width = 53
        Height = 17
        Caption = 'Cost Unit'
      end
      object Label25: TLabel
        Left = 16
        Top = 45
        Width = 66
        Height = 17
        Caption = 'Description'
      end
      object spnAdhesiveQuantity: TSpinEdit
        Left = 492
        Top = 40
        Width = 50
        Height = 27
        MaxValue = 1000
        MinValue = 0
        TabOrder = 0
        Value = 0
        OnChange = spnAdhesiveQuantityChange
      end
      object edtAdhesiveCost: TCREditMoney
        Left = 492
        Top = 9
        Width = 81
        Height = 25
        TabOrder = 1
        OnChange = spnAdhesiveQuantityChange
      end
      object edtAdhesiveDescription: TMemo
        Left = 108
        Top = 41
        Width = 273
        Height = 21
        Lines.Strings = (
          'edtAdhesiveDescription')
        ReadOnly = True
        TabOrder = 2
        WantReturns = False
        WordWrap = False
      end
      object edtAdhesiveTotalCost: TCREditMoney
        Left = 693
        Top = 38
        Width = 81
        Height = 25
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
        OnChange = edtAdhesiveTotalCostChange
      end
      object edtAdhesiveProduct: TMemo
        Left = 108
        Top = 9
        Width = 217
        Height = 21
        Lines.Strings = (
          'edtAdhesiveProduct')
        ReadOnly = True
        TabOrder = 4
        WantReturns = False
        WordWrap = False
      end
      object btnClear: TBitBtn
        Left = 359
        Top = 7
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
        TabOrder = 5
        OnClick = btnClearClick
      end
      object edtAdhesiveCostUnit: TMemo
        Left = 691
        Top = 9
        Width = 80
        Height = 21
        TabOrder = 6
        WantReturns = False
        WordWrap = False
        OnChange = edtAdhesiveCostUnitChange
      end
    end
    object pnlPrices: TPanel
      Left = 0
      Top = 280
      Width = 811
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 15
      ExplicitTop = 275
      ExplicitWidth = 742
      object Label15: TLabel
        Left = 16
        Top = 5
        Width = 60
        Height = 17
        Caption = 'Markup %'
      end
      object Label16: TLabel
        Left = 220
        Top = 5
        Width = 89
        Height = 17
        Caption = 'Unit Price/sq m'
      end
      object Label17: TLabel
        Left = 428
        Top = 5
        Width = 57
        Height = 17
        Caption = 'Slab Price'
      end
      object Label18: TLabel
        Left = 596
        Top = 5
        Width = 89
        Height = 17
        Caption = 'Total Slab Price'
      end
      object edtMarkupPercentage: TCREditInt
        Left = 108
        Top = 1
        Width = 89
        Height = 25
        TabOrder = 0
        OnChange = edtMarkupPercentageChange
        OnEnter = edtMarkupPercentageEnter
        OnExit = edtMarkupPercentageExit
      end
      object edtUnitPrice: TCREditMoney
        Left = 316
        Top = 1
        Width = 81
        Height = 25
        TabOrder = 1
        OnChange = edtUnitPriceChange
        OnEnter = edtUnitPriceEnter
        OnExit = edtUnitPriceExit
      end
      object edtSlabPrice: TCREditMoney
        Left = 492
        Top = 1
        Width = 81
        Height = 25
        TabOrder = 2
        OnChange = edtSlabPriceChange
        OnEnter = edtSlabPriceEnter
        OnExit = edtSlabPriceExit
      end
      object edtTotalPrice: TCREditMoney
        Left = 691
        Top = 2
        Width = 81
        Height = 25
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 3
      end
    end
    object pnlTotal: TPanel
      Left = 0
      Top = 368
      Width = 811
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 16
      ExplicitWidth = 1207
      object Label23: TLabel
        Left = 628
        Top = 7
        Width = 62
        Height = 17
        Caption = 'Total Cost'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtTotalOverallCost: TCREditMoney
        Left = 696
        Top = 1
        Width = 81
        Height = 25
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
    end
    object edtQuantity: TCREditFloat
      Left = 108
      Top = 220
      Width = 89
      Height = 25
      TabOrder = 7
      OnChange = edtQuantityChange
      OnEnter = edtQuantityEnter
      OnExit = edtQuantityExit
    end
    object edtSlabArea: TCREditMoney
      Left = 693
      Top = 248
      Width = 81
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 17
      OnChange = edtTotalCostChange
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 398
    Width = 811
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 387
    ExplicitWidth = 742
    DesignSize = (
      811
      46)
    object lblDelete: TLabel
      Left = 152
      Top = 15
      Width = 157
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Delete these slab details?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOK: TBitBtn
      Left = 324
      Top = 11
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
      Left = 412
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object qryWorktops: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * '
      'from worktop'
      'where material_type = :material_type and'
      
        '(worktop.inactive = '#39'N'#39' or worktop.inactive is null) OR worktop ' +
        '= :worktop'
      'Order by Description')
    Left = 256
    Top = 120
    ParamData = <
      item
        Name = 'material_type'
        DataType = ftInteger
      end
      item
        Name = 'worktop'
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
      'where (worktop = :worktop and'
      '  worktop_thickness.thickness = thickness.thickness)'
      'order by thickness_mm')
    Left = 196
    Top = 160
    ParamData = <
      item
        Name = 'worktop'
      end>
  end
  object dtsWorktops: TDataSource
    DataSet = qryWorktops
    Left = 246
    Top = 70
  end
  object dtsWTThickness: TDataSource
    DataSet = qryWTThickness
    Left = 346
    Top = 140
  end
  object qryOneWTThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Worktop,'
      '        Thickness,'
      '        (select top 1 Unit_Cost'
      '         from Prices'
      
        '         where Price_Pointer = Supplier_Worktop_thickness.Price_' +
        'pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Cost,'
      '        (select top 1 Price_unit'
      '         from Prices'
      
        '         where Price_Pointer = Supplier_Worktop_thickness.Price_' +
        'pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'from Supplier_Worktop_thickness'
      'where supplier = :supplier and'
      '      worktop = :Worktop and'
      '      thickness = :Thickness')
    Left = 316
    Top = 70
    ParamData = <
      item
        Name = 'supplier'
      end
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
      'where (inactive = '#39'N'#39' or inactive is null) '
      'order by Description')
    Left = 306
    Top = 10
  end
  object dtsMaterial: TDataSource
    DataSet = qryMaterial
    Left = 246
    Top = 10
  end
  object qrySupplier: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Supplier.*'
      'from Supplier'
      
        'where ((inactive = '#39'N'#39') or (inactive is null)) OR ((Supplier = :' +
        'Supplier) OR (:Supplier = 0))'
      'order by Supplier_Name')
    Left = 126
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Supplier'
      end>
  end
  object dtsSupplier: TDataSource
    DataSet = qrySupplier
    Left = 156
    Top = 40
  end
  object qrySlabSize: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Slab_Size.*'
      'from Slab_Size'
      'where (inactive = '#39'N'#39' or inactive is null) '
      'order by Slab_Size_Description')
    Left = 146
    Top = 110
  end
  object dtsSlabSize: TDataSource
    DataSet = qryMTSlabSize
    Left = 136
    Top = 200
  end
  object qryMTSlabSize: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Material_Type_Slab_Size.Slab_Size,'
      '       Material_Type_Slab_Size.Length,'
      '       Material_Type_Slab_Size.Depth,'
      '       Material_Type_Slab_Size.Slab_Size_Description,'
      
        '       CSTR(Material_Type_Slab_Size.Length) + '#39'mm x '#39' + CSTR(Mat' +
        'erial_Type_Slab_Size.Depth) + '#39'mm '#39' + Material_Type_Slab_Size.Sl' +
        'ab_Size_Description as Slab_Description'
      'FROM Material_Type_Slab_Size'
      'WHERE Material_Type = :Material_Type'
      'ORDER BY Length')
    Left = 306
    Top = 310
    ParamData = <
      item
        Name = 'Material_Type'
      end>
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
    Left = 346
    Top = 220
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
      '        (select top 1 Unit_Cost'
      '         from Prices'
      
        '         where Price_Pointer = Customer_Worktop_Group_Thick.Pric' +
        'e_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Cost,'
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
    Left = 526
    Top = 230
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
  object qryGetContractSupplier: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Worktop_Group.Supplier'
      'FROM  Customer_Worktop_Group'
      'WHERE Customer_Worktop_Group.Customer = :Customer AND'
      '      Customer_Worktop_Group.Group_Number = :Group_Number')
    Left = 526
    Top = 160
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Group_Number'
      end>
  end
  object qryGetSupplierWorktop: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '    Supplier_Worktop.Supplier,'
      '    Supplier_Worktop.Worktop,'
      '    Supplier_Worktop.inactive,'
      '    Supplier_Worktop.Adhesive_Product_Code,'
      '    Supplier_Worktop.Adhesive_Quantity_Per_Slab,'
      '    Supplier_Product.Description as Adhesive_Description,'
      '    Supplier_Product.Price_Pointer,'
      '    Supplier_Product.Cost_Pack_Quantity,'
      '    Supplier_Product.Sell_Pack_Quantity,'
      '    (select top 1 Unit_price'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '      from Prices'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.effective_date <= now()'
      '      order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '      from Prices, Price_unit'
      
        '      where Prices.Price_pointer = Supplier_Product.price_pointe' +
        'r and'
      '            Prices.Price_unit = Price_Unit.Price_Unit and'
      '            Prices.effective_date <= now()'
      
        '      order by Prices.effective_date desc) AS Price_Unit_Descrip' +
        'tion'
      'FROM Supplier_Product'
      '        INNER JOIN Supplier_Worktop'
      
        '          ON (Supplier_Product.Supplier_Product_Code = Supplier_' +
        'Worktop.Adhesive_Product_Code)'
      
        '            AND (Supplier_Product.Supplier = Supplier_Worktop.Su' +
        'pplier)'
      
        'WHERE Supplier_Worktop.Supplier = :Supplier AND Supplier_Worktop' +
        '.Worktop = :Worktop')
    Left = 446
    Top = 10
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Worktop'
      end>
  end
  object qryGetOneMaterialType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Material_Type,'
      '        Allow_Bespoke_Slab_Sizes'
      'FROM Material_Type'
      'WHERE Material_Type = :Material_Type')
    Left = 288
    Top = 259
    ParamData = <
      item
        Name = 'MATERIAL_TYPE'
        ParamType = ptInput
      end>
  end
end
