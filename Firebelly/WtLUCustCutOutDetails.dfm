object frmWTLUCustCutOutDetails: TfrmWTLUCustCutOutDetails
  Left = 192
  Top = 114
  Width = 751
  Height = 420
  Caption = 'Maintain Customer Cut Out Details'
  Color = clBtnFace
  Constraints.MinHeight = 420
  Constraints.MinWidth = 751
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClick = FormClick
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 73
    Width = 743
    Height = 228
    Align = alClient
    DataSource = dtsCustCutOut
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Edge_Type_Description'
        Title.Caption = 'Edge Type'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 270
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Cost'
        Title.Caption = 'Cost Price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Price'
        Title.Caption = 'Sell Price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price_Unit_Description'
        Title.Caption = 'Price Unit'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inactive'
        Visible = False
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 301
    Width = 743
    Height = 69
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      743
      69)
    object Label4: TLabel
      Left = 16
      Top = 20
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object chkbxShowInactive: TCheckBox
      Left = 16
      Top = 44
      Width = 169
      Height = 17
      Caption = 'Show inactive cut outs'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object edtName: TEdit
      Left = 64
      Top = 16
      Width = 177
      Height = 21
      TabOrder = 1
      OnChange = edtNameChange
    end
    object BitBtn1: TBitBtn
      Left = 309
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Add'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 397
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 3
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 485
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 4
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 661
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 5
      NumGlyphs = 2
    end
    object btnExcel: TBitBtn
      Left = 573
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 6
      OnClick = btnExcelClick
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 370
    Width = 743
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 743
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      743
      73)
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Material Type'
    end
    object Label2: TLabel
      Left = 216
      Top = 16
      Width = 48
      Height = 13
      Caption = 'Edge type'
    end
    object Label3: TLabel
      Left = 501
      Top = 16
      Width = 124
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Copy Cut Out Details from '
    end
    object dblkpMaterialType: TDBLookupComboBox
      Left = 16
      Top = 32
      Width = 145
      Height = 21
      Enabled = False
      KeyField = 'Material_Type'
      ListField = 'Description'
      ListSource = srclkpMatType
      ReadOnly = True
      TabOrder = 0
      OnClick = dblkpMaterialTypeClick
    end
    object dblkpEdgeType: TDBLookupComboBox
      Left = 216
      Top = 32
      Width = 145
      Height = 21
      KeyField = 'Edge_Type'
      ListField = 'Edge_Type_Description'
      ListSource = srclkpEdgeType
      TabOrder = 1
      OnClick = dblkpEdgeTypeClick
    end
    object dblkpCopyGroup: TDBLookupComboBox
      Left = 501
      Top = 32
      Width = 145
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Group_ID'
      ListField = 'Group_Description'
      ListSource = dtsCustEdgeGroup
      TabOrder = 2
      OnClick = dblkpCopyGroupClick
    end
    object btnGo: TButton
      Left = 662
      Top = 30
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Go'
      Enabled = False
      TabOrder = 3
      OnClick = btnGoClick
    end
  end
  object dtsCustCutOut: TDataSource
    DataSet = qryCustCutOut
    OnDataChange = dtsCustCutOutDataChange
    Left = 368
    Top = 64
  end
  object qryCustCutOut: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT'
      '  Customer_Cutout.Group_Id,'
      '  Customer_Cutout.Cutout,'
      '  Customer_Cutout.Edge_Type,'
      '  Customer_Cutout.Price_pointer,'
      '  CutOut.Description,'
      '  CutOut.inactive,'
      '  Edge_Type.Edge_Type_Description,'
      '    (select top 1 Unit_price'
      '    from Prices'
      
        '    where Prices.Price_pointer = Customer_Cutout.price_pointer a' +
        'nd'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      
        '    where Prices.Price_pointer = Customer_Cutout.price_pointer a' +
        'nd'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      
        '    where Prices.Price_pointer = Customer_Cutout.price_pointer a' +
        'nd'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= now()'
      
        '    order by Prices.effective_date desc) AS Price_Unit_Descripti' +
        'on'
      'FROM CutOut'
      '      INNER JOIN(Edge_Type'
      '      INNER JOIN Customer_Cutout'
      '        ON Edge_Type.Edge_Type = Customer_Cutout.Edge_Type)'
      '        ON CutOut.CutOut = Customer_Cutout.Cutout'
      'WHERE'
      '  (Customer_Cutout.Group_Id = :Group_Id) AND'
      
        '  ((Customer_Cutout.Edge_Type = :Edge_Type) OR (:Edge_Type = 0))' +
        ' AND'
      
        '  ((CutOut.inactive = '#39'N'#39') or (CutOut.inactive is null) or (CutO' +
        'ut.inactive = :inactive)) AND'
      '  (CutOut.Description LIKE :Description)'
      'ORDER BY Edge_Type.Edge_Type_Description, CutOut.Description')
    Left = 368
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Group_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Edge_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Edge_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
    object qryCustCutOutCutout: TIntegerField
      FieldName = 'Cutout'
    end
    object qryCustCutOutEdge_Type: TIntegerField
      FieldName = 'Edge_Type'
    end
    object qryCustCutOutPrice_pointer: TIntegerField
      FieldName = 'Price_pointer'
    end
    object qryCustCutOutDescription: TStringField
      FieldName = 'Description'
      Size = 40
    end
    object qryCustCutOutUnit_Price: TFloatField
      FieldName = 'Unit_Price'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryCustCutOutUnit_Cost: TFloatField
      FieldName = 'Unit_Cost'
      DisplayFormat = '0.00'
      currency = True
    end
    object qryCustCutOutPrice_Unit_Description: TStringField
      FieldName = 'Price_Unit_Description'
    end
    object qryCustCutOutinactive: TStringField
      FieldName = 'inactive'
      Size = 1
    end
    object qryCustCutOutEdge_Type_Description: TStringField
      FieldName = 'Edge_Type_Description'
      Size = 50
    end
    object qryCustCutOutGroup_Id: TIntegerField
      FieldName = 'Group_Id'
    end
  end
  object lkpMatType: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select * from Material_Type'
      
        'where ((inactive = '#39'N'#39') or (inactive = '#39#39') or (inactive is null)' +
        ')')
    Left = 168
    Top = 8
  end
  object srclkpMatType: TDataSource
    DataSet = lkpMatType
    Left = 168
    Top = 56
  end
  object qryGetCustCutOuts: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'SELECT'
      '  Customer_Cutout.Group_Id,'
      '  Customer_Cutout.Edge_Type,'
      '  Customer_Cutout.CutOut,'
      '  Customer_Cutout.Price_pointer,'
      '  (select top 1 Unit_price'
      '    from Prices'
      
        '    where Prices.Price_pointer = Customer_Cutout.price_pointer a' +
        'nd'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      
        '    where Prices.Price_pointer = Customer_Cutout.price_pointer a' +
        'nd'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit'
      '    from Prices'
      
        '    where Prices.Price_pointer = Customer_Cutout.price_pointer a' +
        'nd'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Price_Unit'
      'FROM Customer_Cutout'
      'WHERE   Customer_Cutout.Group_Id = :Group_Id'
      'ORDER BY  Customer_Cutout.CutOut'
      '')
    Left = 136
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Group_Id'
        ParamType = ptUnknown
      end>
  end
  object qryAddCustCutOut: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      
        'Insert into Customer_Cutout (Group_Id, CutOut, Price_Pointer, Ed' +
        'ge_Type)'
      'values (:Group_Id, :CutOut, :Price_Pointer, :Edge_Type)')
    Left = 136
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Group_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CutOut'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_Pointer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Edge_Type'
        ParamType = ptUnknown
      end>
  end
  object tmrRefresh: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 504
    Top = 256
  end
  object lkpEdgeType: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select *'
      'from Edge_Type'
      
        'where ((inactive = '#39'N'#39') or (inactive = '#39#39') or (inactive is NULL)' +
        ')'
      'order by Edge_Type_Description')
    Left = 248
    Top = 8
  end
  object srclkpEdgeType: TDataSource
    DataSet = lkpEdgeType
    Left = 248
    Top = 56
  end
  object qryDelCustCutOut: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Delete From Customer_CutOut'
      'Where Price_Pointer = :Price_Pointer')
    Left = 48
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Price_Pointer'
        ParamType = ptUnknown
      end>
  end
  object lkpCustEdgeGroup: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT Group_Id, Group_Description'
      'FROM Customer_Cutout_Edge_Group'
      'WHERE Customer = :Customer'
      'ORDER BY Group_Description')
    Left = 440
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object dtsCustEdgeGroup: TDataSource
    DataSet = lkpCustEdgeGroup
    Left = 440
    Top = 64
  end
  object qryDelAllCustCutOut: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Delete From Customer_CutOut'
      'Where Group_Id = :Group_Id')
    Left = 48
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Group_Id'
        ParamType = ptUnknown
      end>
  end
end
