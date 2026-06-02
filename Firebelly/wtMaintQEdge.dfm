object frmWTMaintQEdge: TfrmWTMaintQEdge
  Left = 381
  Top = 145
  Caption = 'Maintain Edges'
  ClientHeight = 291
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    538
    291)
  TextHeight = 17
  object lblDelete: TLabel
    Left = 40
    Top = 251
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
    Left = 189
    Top = 245
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
    ExplicitTop = 236
  end
  object BitBtn2: TBitBtn
    Left = 270
    Top = 245
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 1
    ExplicitTop = 236
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 538
    Height = 233
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 502
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
      Width = 30
      Height = 17
      Caption = 'Edge'
    end
    object Label8: TLabel
      Left = 16
      Top = 204
      Width = 39
      Height = 17
      Caption = 'Length'
    end
    object Label7: TLabel
      Left = 379
      Top = 140
      Width = 60
      Height = 17
      Caption = 'Total Price'
    end
    object Label4: TLabel
      Left = 16
      Top = 140
      Width = 55
      Height = 17
      Caption = 'Unit Price'
    end
    object Label5: TLabel
      Left = 16
      Top = 172
      Width = 53
      Height = 17
      Caption = 'Unit Cost'
    end
    object Label6: TLabel
      Left = 381
      Top = 172
      Width = 58
      Height = 17
      Caption = 'Total Cost'
    end
    object Label9: TLabel
      Left = 16
      Top = 108
      Width = 75
      Height = 17
      Caption = 'Std Sell Price'
    end
    object lblDiscount: TLabel
      Left = 352
      Top = 46
      Width = 99
      Height = 17
      Caption = 'Edge Discount %'
    end
    object edtMaterial: TEdit
      Left = 96
      Top = 8
      Width = 145
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object dblkpEdgeType: TDBLookupComboBox
      Left = 96
      Top = 40
      Width = 161
      Height = 25
      KeyField = 'Edge_Type'
      ListField = 'Edge_Type_Description'
      ListSource = dtsEdgeType
      TabOrder = 1
      OnClick = dblkpEdgeTypeClick
    end
    object dblkpEdge: TDBLookupComboBox
      Left = 96
      Top = 72
      Width = 400
      Height = 25
      KeyField = 'edge_profile'
      ListField = 'description'
      ListSource = dtsEdgeThickness
      TabOrder = 2
      OnClick = dblkpEdgeClick
    end
    object edtLength: TCREditInt
      Left = 96
      Top = 200
      Width = 89
      Height = 25
      TabOrder = 4
      Text = 'edtLength'
      OnChange = edtLengthChange
    end
    object edtUnitPrice: TCREditMoney
      Left = 96
      Top = 136
      Width = 81
      Height = 25
      TabOrder = 5
      OnChange = edtUnitPriceChange
    end
    object edtTotalPrice: TCREditMoney
      Left = 446
      Top = 136
      Width = 81
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
    object btnEdge: TBitBtn
      Left = 502
      Top = 73
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
      Left = 96
      Top = 168
      Width = 81
      Height = 25
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object edtTotalCost: TCREditMoney
      Left = 446
      Top = 168
      Width = 81
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object edtSellPrice: TCREditMoney
      Left = 96
      Top = 104
      Width = 81
      Height = 25
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 9
      OnChange = edtUnitPriceChange
    end
    object edtDiscount: TCREditMoney
      Left = 462
      Top = 42
      Width = 65
      Height = 25
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
    Left = 206
    Top = 71
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
    Left = 159
    Top = 118
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
    Left = 126
    Top = 96
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
      '        Customer_Cutout_Edge_Group.inactive as Group_Inactive,'
      '        Customer_Cutout_Edge_Group.Use_For_General_Quoting,'
      '        Customer_Edge.Edge_Profile,'
      '        Customer_Edge.Edge_Type,'
      '        Customer_Edge.Price_Pointer,'
      '        Edge_Profile.inactive as Edge_Inactive'
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
        Name = 'Edge_Profile'
        ParamType = ptInput
      end>
  end
  object qryOneCustomerPrice: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Customer_Cutout_Edge_Group.Customer,'
      '        Customer_Cutout_Edge_Group.Material_Type,'
      '        Customer_Edge.Edge_Profile,'
      '        Customer_Edge.Price_Pointer,'
      '        Customer_Edge.Edge_Type,'
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
    Left = 238
    Top = 114
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
