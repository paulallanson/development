object frmWTMaintQEdge: TfrmWTMaintQEdge
  Left = 381
  Top = 145
  Caption = 'Maintain Edges'
  ClientHeight = 257
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    512
    257)
  TextHeight = 13
  object lblDelete: TLabel
    Left = 40
    Top = 249
    Width = 121
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
    Left = 182
    Top = 243
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
    Left = 270
    Top = 243
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 1
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 512
    Height = 233
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Material'
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 52
      Height = 13
      Caption = 'Edge Type'
    end
    object Label3: TLabel
      Left = 16
      Top = 76
      Width = 25
      Height = 13
      Caption = 'Edge'
    end
    object Label8: TLabel
      Left = 16
      Top = 204
      Width = 33
      Height = 13
      Caption = 'Length'
    end
    object Label7: TLabel
      Left = 339
      Top = 140
      Width = 51
      Height = 13
      Caption = 'Total Price'
    end
    object Label4: TLabel
      Left = 16
      Top = 140
      Width = 46
      Height = 13
      Caption = 'Unit Price'
    end
    object Label5: TLabel
      Left = 16
      Top = 172
      Width = 43
      Height = 13
      Caption = 'Unit Cost'
    end
    object Label6: TLabel
      Left = 341
      Top = 172
      Width = 48
      Height = 13
      Caption = 'Total Cost'
    end
    object Label9: TLabel
      Left = 16
      Top = 108
      Width = 63
      Height = 13
      Caption = 'Std Sell Price'
    end
    object lblDiscount: TLabel
      Left = 304
      Top = 44
      Width = 81
      Height = 13
      Caption = 'Edge Discount %'
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
    object dblkpEdgeType: TDBLookupComboBox
      Left = 88
      Top = 40
      Width = 161
      Height = 21
      KeyField = 'Edge_Type'
      ListField = 'Edge_Type_Description'
      ListSource = dtsEdgeType
      TabOrder = 1
      OnClick = dblkpEdgeTypeClick
    end
    object dblkpEdge: TDBLookupComboBox
      Left = 88
      Top = 72
      Width = 201
      Height = 21
      KeyField = 'edge_profile'
      ListField = 'description'
      ListSource = dtsEdgeThickness
      TabOrder = 2
      OnClick = dblkpEdgeClick
    end
    object edtLength: TCREditInt
      Left = 88
      Top = 200
      Width = 89
      Height = 21
      TabOrder = 4
      Text = 'edtLength'
      OnChange = edtLengthChange
    end
    object edtUnitPrice: TCREditMoney
      Left = 88
      Top = 136
      Width = 81
      Height = 21
      TabOrder = 5
      OnChange = edtUnitPriceChange
    end
    object edtTotalPrice: TCREditMoney
      Left = 400
      Top = 136
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
    object btnEdge: TBitBtn
      Left = 296
      Top = 70
      Width = 25
      Height = 25
      Hint = 'maintain edge details'
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
      OnClick = btnEdgeClick
    end
    object edtUnitCost: TCREditMoney
      Left = 88
      Top = 168
      Width = 81
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object edtTotalCost: TCREditMoney
      Left = 400
      Top = 168
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object edtSellPrice: TCREditMoney
      Left = 88
      Top = 104
      Width = 81
      Height = 21
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 9
      OnChange = edtUnitPriceChange
    end
    object edtDiscount: TCREditMoney
      Left = 408
      Top = 40
      Width = 65
      Height = 21
      TabOrder = 10
      OnChange = edtDiscountChange
    end
  end
  object qryEdgeType: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Edge_Type'
      
        'where (inactive = '#39'N'#39' or inactive is null) OR Edge_Type = :Edge_' +
        'Type')
    Left = 216
    Top = 8
    ParamData = <
      item
        Name = 'Edge_Type'
      end>
  end
  object dtsEdgeType: TDataSource
    DataSet = qryEdgeType
    Left = 256
    Top = 8
  end
  object qryEdgeThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Edge_profile.Edge_profile,'
      '        Edge_profile.description,'
      '        Edge_thickness.price_pointer'
      'from Edge_thickness, Edge_profile'
      'where Edge_Thickness.edge_type = :edge_type and'
      'Material_Type = :Material_Type and'
      'Edge_thickness.Edge_profile = Edge_profile.Edge_profile and'
      
        '(Edge_Profile.inactive = '#39'N'#39' or Edge_Profile.inactive is NULL or' +
        ' Edge_Profile.Edge_Profile = :Edge_Profile)'
      'order by Edge_profile.description')
    Left = 360
    Top = 64
    ParamData = <
      item
        Name = 'edge_type'
      end
      item
        Name = 'Material_Type'
        DataType = ftInteger
      end
      item
        Name = 'Edge_Profile'
      end>
  end
  object dtsEdgeThickness: TDataSource
    DataSet = qryEdgeThickness
    Left = 440
    Top = 64
  end
  object qryOneEdgeThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Edge_profile,'
      '        Material_type,'
      '        Edge_type,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      '         where Price_Pointer = Edge_thickness.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Unit_Cost'
      '         from Prices'
      '         where Price_Pointer = Edge_thickness.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Cost,'
      '        (select top 1 Price_unit'
      '         from Prices'
      '         where Price_Pointer = Edge_thickness.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'from Edge_thickness'
      'where Material_Type = :Material_type and'
      'Edge_Type = :Edge_Type and'
      'Edge_profile = :Edge_profile')
    Left = 360
    Top = 232
    ParamData = <
      item
        Name = 'Material_type'
      end
      item
        Name = 'Edge_Type'
      end
      item
        Name = 'Edge_profile'
      end>
  end
  object qryContractEdge: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Edge_Profile.description,'
      '        Customer_Cutout_Edge_Group.Customer,'
      '        Customer_Cutout_Edge_Group.Group_ID,'
      '        Customer_Cutout_Edge_Group.Material_Type,'
      '        Customer_Cutout_Edge_Group.Effective_Date,'
      '        Customer_Cutout_Edge_Group.Ineffective_Date,'
      '        Customer_Cutout_Edge_Group.inactive,'
      '        Customer_Cutout_Edge_Group.Use_For_General_Quoting,'
      '        Customer_Edge.Edge_Profile,'
      '        Customer_Edge.Edge_Type,'
      '        Customer_Edge.Price_Pointer,'
      '        Edge_Profile.inactive'
      'FROM Edge_Profile'
      '        INNER JOIN (Customer_Cutout_Edge_Group'
      '        INNER JOIN Customer_Edge'
      
        '          ON Customer_Cutout_Edge_Group.Group_ID = Customer_Edge' +
        '.Group_ID)'
      
        '          ON Edge_Profile.Edge_Profile = Customer_Edge.Edge_Prof' +
        'ile'
      'WHERE Customer_Cutout_Edge_Group.Customer = :Customer and'
      '      Customer_Edge.Edge_Type = :Edge_Type and'
      
        '      Customer_Cutout_Edge_Group.Material_Type = :Material_Type ' +
        'and'
      '      Customer_Edge.Edge_Profile = Edge_Profile.Edge_Profile and'
      
        '      ((Edge_Profile.inactive = '#39'N'#39') or (Edge_Profile.inactive i' +
        's NULL) or (Edge_Profile.Edge_Profile = :Edge_Profile))'
      'ORDER BY Edge_Profile.Description')
    Left = 280
    Top = 152
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Edge_Type'
      end
      item
        Name = 'Material_Type'
        DataType = ftInteger
      end
      item
        Name = 'Edge_Profile'
      end>
  end
  object qryOneCustomerPrice: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Customer_Cutout_Edge_Group.Customer,'
      '        Customer_Cutout_Edge_Group.Material_Type,'
      '        Customer_Edge.Edge_Profile,'
      '        Customer_Edge.Price_Pointer,'
      '        Customer_Edge.Edge_Type'
      '        (select top 1 Unit_Price'
      '         from Prices'
      '         where Price_Pointer = Customer_Edge.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Unit_Cost'
      '         from Prices'
      '         where Price_Pointer = Customer_Edge.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Cost,'
      '        (select top 1 Price_unit'
      '         from Prices'
      '         where Price_Pointer = Customer_Edge.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'FROM Customer_Cutout_Edge_Group'
      '        INNER JOIN Customer_Edge'
      
        '          ON Customer_Cutout_Edge_Group.Group_ID = Customer_Edge' +
        '.Group_ID'
      'WHERE Customer_Cutout_Edge_Group.Customer = :Customer and'
      
        '      Customer_Cutout_Edge_Group.Material_Type = :Material_type ' +
        'and'
      '      Customer_Edge.Edge_Type = :Edge_Type and'
      '      Customer_Edge.Edge_Profile = :Edge_Profile')
    Left = 280
    Top = 104
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
        Name = 'Edge_Profile'
      end>
  end
  object dtsEdgePrice: TDataSource
    DataSet = qryOneEdgeThickness
    Left = 448
    Top = 232
  end
end
