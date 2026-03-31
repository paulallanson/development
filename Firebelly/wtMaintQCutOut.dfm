object frmWTMaintQCutOut: TfrmWTMaintQCutOut
  Left = 447
  Top = 181
  BorderStyle = bsDialog
  Caption = 'Maintain Cutouts'
  ClientHeight = 285
  ClientWidth = 499
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    499
    285)
  TextHeight = 17
  object lblDelete: TLabel
    Left = 32
    Top = 246
    Width = 106
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Delete these details?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 167
    Top = 238
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOKClick
    ExplicitTop = 229
  end
  object BitBtn2: TBitBtn
    Left = 255
    Top = 238
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
    ExplicitTop = 229
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 499
    Height = 232
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 493
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 48
      Height = 17
      Caption = 'Material'
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 61
      Height = 17
      Caption = 'Edge Type'
    end
    object Label3: TLabel
      Left = 16
      Top = 76
      Width = 38
      Height = 17
      Caption = 'Cutout'
    end
    object Label8: TLabel
      Left = 16
      Top = 106
      Width = 48
      Height = 17
      Caption = 'Quantity'
    end
    object Label4: TLabel
      Left = 16
      Top = 172
      Width = 55
      Height = 17
      Caption = 'Unit Price'
    end
    object Label7: TLabel
      Left = 334
      Top = 172
      Width = 60
      Height = 17
      Caption = 'Total Price'
    end
    object Label5: TLabel
      Left = 16
      Top = 204
      Width = 53
      Height = 17
      Caption = 'Unit Cost'
    end
    object Label6: TLabel
      Left = 336
      Top = 204
      Width = 58
      Height = 17
      Caption = 'Total Cost'
    end
    object lblDiscount: TLabel
      Left = 303
      Top = 44
      Width = 107
      Height = 17
      Caption = 'Cutout Discount %'
    end
    object Label9: TLabel
      Left = 16
      Top = 140
      Width = 75
      Height = 17
      Caption = 'Std Sell Price'
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
    object dblkpEdgeType: TDBLookupComboBox
      Left = 97
      Top = 40
      Width = 145
      Height = 25
      KeyField = 'Edge_Type'
      ListField = 'Edge_Type_Description'
      ListSource = dtsEdgeType
      TabOrder = 1
      OnClick = dblkpEdgeTypeClick
    end
    object dblkpCutOut: TDBLookupComboBox
      Left = 97
      Top = 72
      Width = 350
      Height = 25
      KeyField = 'cutout'
      ListField = 'description'
      ListSource = dtsCOThickness
      TabOrder = 3
      OnClick = dblkpCutOutClick
    end
    object spnQuantity: TSpinEdit
      Left = 97
      Top = 103
      Width = 65
      Height = 27
      MaxValue = 1000
      MinValue = 1
      TabOrder = 5
      Value = 1
      OnChange = spnQuantityChange
    end
    object edtUnitPrice: TCREditMoney
      Left = 97
      Top = 168
      Width = 81
      Height = 25
      TabOrder = 6
      OnChange = edtUnitPriceChange
    end
    object edtTotalPrice: TCREditMoney
      Left = 402
      Top = 168
      Width = 81
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object btnCutOuts: TBitBtn
      Left = 458
      Top = 72
      Width = 25
      Height = 25
      Hint = 'maintain cut out details'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnCutOutsClick
    end
    object edtUnitCost: TCREditMoney
      Left = 97
      Top = 200
      Width = 81
      Height = 25
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object edtTotalCost: TCREditMoney
      Left = 402
      Top = 200
      Width = 81
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 9
    end
    object edtDiscount: TCREditMoney
      Left = 418
      Top = 40
      Width = 65
      Height = 25
      TabOrder = 2
      OnChange = edtDiscountChange
    end
    object edtSellPrice: TCREditMoney
      Left = 97
      Top = 136
      Width = 81
      Height = 25
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 10
      OnChange = edtUnitPriceChange
    end
  end
  object qryEdgeType: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Edge_Type'
      
        'where (inactive = '#39'N'#39' or inactive is null) OR Edge_Type = :Edge_' +
        'Type'
      '')
    Left = 196
    Top = 173
    ParamData = <
      item
        Name = 'Edge_Type'
      end>
  end
  object dtsEdgeType: TDataSource
    DataSet = qryEdgeType
    Left = 196
    Top = 122
  end
  object qryCOThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  cutout.cutout,'
      '        cutout.description,'
      '        cutout_thickness.price_pointer'
      'from Cutout_thickness, cutout'
      'where CutOut_Thickness.Edge_Type = :Edge_Type and'
      'Material_Type = :Material_Type and'
      'CutOut_thickness.cutout = cutout.cutout and'
      
        '(CutOut.inactive = '#39'N'#39' or CutOut.inactive is NULL or CutOut.CutO' +
        'ut = :CutOut)'
      'order by cutout.description')
    Left = 232
    Top = 48
    ParamData = <
      item
        Name = 'Edge_Type'
      end
      item
        Name = 'Material_Type'
        DataType = ftInteger
      end
      item
        Name = 'CutOut'
      end>
  end
  object qryOneCOThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  CutOut,'
      '        Material_type,'
      '        Edge_Type,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      
        '         where Price_Pointer = CutOut_thickness.Price_pointer an' +
        'd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Unit_Cost'
      '         from Prices'
      
        '         where Price_Pointer = CutOut_thickness.Price_pointer an' +
        'd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Cost,'
      '        (select top 1 Price_unit'
      '         from Prices'
      
        '         where Price_Pointer = CutOut_thickness.Price_pointer an' +
        'd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'from Cutout_thickness'
      'where Material_Type = :Material_type and'
      'Edge_Type = :Edge_Type and'
      'cutout = :cutout')
    Left = 320
    Top = 200
    ParamData = <
      item
        Name = 'Material_type'
      end
      item
        Name = 'Edge_Type'
      end
      item
        Name = 'cutout'
      end>
  end
  object dtsCOThickness: TDataSource
    DataSet = qryCOThickness
    Left = 318
    Top = 112
  end
  object qryContractCutOut: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  cutout.description,'
      '        Customer_Cutout_Edge_Group.Customer,'
      '        Customer_Cutout_Edge_Group.Group_ID,'
      '        Customer_Cutout_Edge_Group.Material_Type,'
      '        Customer_Cutout_Edge_Group.Effective_Date,'
      '        Customer_Cutout_Edge_Group.Ineffective_Date,'
      '        Customer_Cutout_Edge_Group.inactive as Group_Inactive,'
      '        Customer_Cutout_Edge_Group.Use_For_General_Quoting,'
      '        Customer_Cutout.CutOut,'
      '        Customer_Cutout.Edge_Type,'
      '        Customer_Cutout.Price_Pointer,'
      '        cutout.inactive as CutOut_Inactive'
      'FROM cutout'
      '        INNER JOIN (Customer_Cutout_Edge_Group'
      '        INNER JOIN Customer_Cutout'
      
        '          ON Customer_Cutout_Edge_Group.Group_ID = Customer_Cuto' +
        'ut.Group_ID)'
      '          ON cutout.CutOut = Customer_Cutout.Cutout'
      'WHERE Customer_Cutout_Edge_Group.Customer = :Customer and'
      '      Customer_Cutout.Edge_Type = :Edge_Type and'
      
        '      Customer_Cutout_Edge_Group.Material_Type = :Material_Type ' +
        'and'
      '      Customer_Cutout.Cutout = Cutout.Cutout and'
      
        '      ((CutOut.inactive = '#39'N'#39') or (CutOut.inactive is NULL) or (' +
        'CutOut.CutOut = :CutOut))'
      'ORDER BY Cutout.Description')
    Left = 416
    Top = 97
    ParamData = <
      item
        Name = 'Customer'
        ParamType = ptInput
      end
      item
        Name = 'Edge_Type'
        ParamType = ptInput
      end
      item
        Name = 'Material_Type'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CutOut'
        ParamType = ptInput
      end>
  end
  object qryOneCustomerPrice: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Customer_Cutout_Edge_Group.Customer,'
      '        Customer_Cutout_Edge_Group.Material_Type,'
      '        Customer_Cutout.CutOut,'
      '        Customer_Cutout.Price_Pointer,'
      '        Customer_Cutout.Edge_Type,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      '         where Price_Pointer = Customer_Cutout.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Unit_Cost'
      '         from Prices'
      '         where Price_Pointer = Customer_Cutout.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Cost,'
      '        (select top 1 Price_unit'
      '         from Prices'
      '         where Price_Pointer = Customer_Cutout.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'FROM Customer_Cutout_Edge_Group'
      '        INNER JOIN Customer_Cutout'
      
        '          ON Customer_Cutout_Edge_Group.Group_ID = Customer_Cuto' +
        'ut.Group_ID'
      'WHERE Customer_Cutout_Edge_Group.Customer = :Customer and'
      
        '      Customer_Cutout_Edge_Group.Material_Type = :Material_type ' +
        'and'
      '      Customer_Cutout.Edge_Type = :Edge_Type and'
      '      Customer_Cutout.CutOut = :cutout')
    Left = 284
    Top = 67
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Material_type'
      end
      item
        Name = 'Edge_Type'
      end
      item
        Name = 'cutout'
      end>
  end
  object dtsCutOutPrice: TDataSource
    DataSet = qryCOThickness
    Left = 416
    Top = 200
  end
end
