object PBLUProcessCostFrm: TPBLUProcessCostFrm
  Left = 198
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Maintain Process Operation Costs'
  ClientHeight = 429
  ClientWidth = 754
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 369
    Width = 754
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      754
      41)
    object btnOK: TBitBtn
      Left = 291
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Select'
      Enabled = False
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TBitBtn
      Left = 379
      Top = 8
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
    object btnClose: TBitBtn
      Left = 645
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 410
    Width = 754
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 113
    Align = alTop
    ParentBackground = False
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 14
      Width = 42
      Height = 13
      Caption = 'Process:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblProcessDescription: TLabel
      Left = 520
      Top = 14
      Width = 110
      Height = 13
      Caption = 'lblProcessDescription'
      Visible = False
    end
    object rgCustomer: TRadioGroup
      Left = 8
      Top = 40
      Width = 100
      Height = 60
      Caption = 'By Customer'
      ItemIndex = 0
      Items.Strings = (
        'All Customers'
        'One Customer ')
      ParentBackground = False
      TabOrder = 0
      OnClick = rgCustomerClick
    end
    object pnlCustSearch: TPanel
      Left = 112
      Top = 43
      Width = 273
      Height = 57
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object lblCustBran: TLabel
        Left = 8
        Top = 9
        Width = 49
        Height = 13
        Caption = 'Customer'
      end
      object edtCustomer: TEdit
        Left = 8
        Top = 25
        Width = 225
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object btnCustomer: TButton
        Left = 240
        Top = 23
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCustomerClick
      end
    end
    object dblkpProcess: TDBLookupComboBox
      Left = 80
      Top = 10
      Width = 185
      Height = 21
      KeyField = 'Process'
      ListField = 'Process_Description'
      ListSource = dtsProcess
      TabOrder = 2
      OnClick = dblkpProcessClick
    end
    object grpbxCopy: TGroupBox
      Left = 416
      Top = 43
      Width = 329
      Height = 57
      Caption = 'Copy costs from selected Customer:'
      ParentBackground = False
      TabOrder = 3
      object edtCopyCustomer: TEdit
        Left = 8
        Top = 24
        Width = 196
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object btnRep: TButton
        Left = 208
        Top = 22
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnRepClick
      end
      object btnCopy: TButton
        Left = 240
        Top = 22
        Width = 75
        Height = 25
        Caption = 'Copy'
        TabOrder = 2
        OnClick = btnCopyClick
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 113
    Width = 754
    Height = 256
    Align = alClient
    Caption = 'Panel3'
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Operation'
    end
    object lblCategory: TLabel
      Left = 464
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Category'
    end
    object Label3: TLabel
      Left = 608
      Top = 8
      Width = 69
      Height = 13
      Caption = 'Sub Category'
    end
    object Label4: TLabel
      Left = 8
      Top = 228
      Width = 48
      Height = 13
      Caption = 'Unit Cost'
    end
    object Label5: TLabel
      Left = 168
      Top = 228
      Width = 70
      Height = 13
      Caption = 'Unit Sell Price'
    end
    object lblTask: TLabel
      Left = 8
      Top = 200
      Width = 46
      Height = 13
      Caption = 'Selected:'
    end
    object dbPriceUnit: TDBText
      Left = 344
      Top = 228
      Width = 65
      Height = 12
      DataField = 'Price_Unit_Description'
      DataSource = dtsProcessCosts
    end
    object dbtxtPriceUnit: TDBText
      Left = 448
      Top = 226
      Width = 81
      Height = 17
      DataField = 'Price_unit'
      DataSource = dtsProcessCosts
      Visible = False
    end
    object lblDescription: TLabel
      Left = 64
      Top = 200
      Width = 72
      Height = 13
      Caption = 'lblDescription'
    end
    object dblstProcessCosts: TDBLookupListBox
      Left = 8
      Top = 24
      Width = 441
      Height = 160
      KeyField = 'Cost_Number'
      ListField = 'Cost_Description'
      ListSource = dtsProcessCosts
      PopupMenu = pmnDescription
      TabOrder = 0
      OnClick = dblstProcessCostsClick
      OnDblClick = dblstProcessCostsDblClick
    end
    object dbedtUnitCost: TDBEdit
      Left = 64
      Top = 224
      Width = 81
      Height = 21
      DataField = 'Unit_Cost'
      DataSource = dtsProcessCosts
      TabOrder = 1
    end
    object dbedtUnitSell: TDBEdit
      Left = 240
      Top = 224
      Width = 81
      Height = 21
      DataField = 'Unit_Sell'
      DataSource = dtsProcessCosts
      TabOrder = 2
    end
    object dblstProcessCostCat: TDBLookupListBox
      Left = 464
      Top = 24
      Width = 129
      Height = 160
      KeyField = 'Category_Number'
      ListField = 'Cost_Description'
      ListSource = dtsProcessCostCat
      PopupMenu = pmnCategory
      TabOrder = 3
      OnClick = dblstProcessCostCatClick
      OnDblClick = dblstProcessCostCatDblClick
    end
    object dblstProcessCostSub: TDBLookupListBox
      Left = 608
      Top = 24
      Width = 129
      Height = 160
      KeyField = 'Sub_Category'
      ListField = 'Cost_Description'
      ListSource = dtsProcessCostSub
      PopupMenu = pmnSubCategory
      TabOrder = 4
      OnClick = dblstProcessCostSubClick
      OnDblClick = dblstProcessCostSubDblClick
    end
  end
  object pmnDescription: TPopupMenu
    OnPopup = pmnDescriptionPopup
    Left = 168
    Top = 113
    object btnAddPCost: TMenuItem
      Caption = 'Add'
      OnClick = btnAddPCostClick
    end
    object btnChgPCost: TMenuItem
      Caption = 'Change'
      OnClick = btnChgPCostClick
    end
    object btnDelPCost: TMenuItem
      Caption = 'Delete'
      OnClick = btnDelPCostClick
    end
    object btnCopyPCost: TMenuItem
      Caption = 'Copy'
      OnClick = btnCopyPCostClick
    end
  end
  object pmnCategory: TPopupMenu
    OnPopup = pmnCategoryPopup
    Left = 496
    Top = 137
    object MenuItem1: TMenuItem
      Caption = 'Add'
      OnClick = MenuItem1Click
    end
    object btnChgPCostCat: TMenuItem
      Caption = 'Change'
      OnClick = btnChgPCostCatClick
    end
    object btnDelPCostCat: TMenuItem
      Caption = 'Delete'
      OnClick = btnDelPCostCatClick
    end
  end
  object pmnSubCategory: TPopupMenu
    OnPopup = pmnSubCategoryPopup
    Left = 648
    Top = 73
    object MenuItem4: TMenuItem
      Caption = 'Add'
      OnClick = MenuItem4Click
    end
    object btnChgPCostSub: TMenuItem
      Caption = 'Change'
      OnClick = btnChgPCostSubClick
    end
    object btnDelPCostSub: TMenuItem
      Caption = 'Delete'
      OnClick = btnDelPCostSubClick
    end
  end
  object qryProcessCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Process_Cost.Customer,'
      '       Process_Cost.Process,'
      '        Process_Cost.Cost_Number,'
      '        Process_Cost.Cost_Description,'
      '        Process_Cost.Unit_Cost,'
      '        Process_Cost.Unit_Sell,'
      '        Process_Cost.Price_Unit,'
      '        Price_Unit.Description as Price_Unit_Description'
      'from Process_Cost, Price_Unit'
      'where Process = :Process and'
      'Customer = :Customer and'
      '(Process_Cost.Price_Unit = Price_Unit.Price_Unit)'
      'order by Cost_description')
    Left = 168
    Top = 169
    ParamData = <
      item
        Name = 'process'
      end
      item
        Name = 'Customer'
      end>
  end
  object dtsProcessCosts: TDataSource
    DataSet = qryProcessCosts
    Left = 168
    Top = 225
  end
  object qryProcessCostCat: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Process_Cost_Category.Customer,'
      '        Process_Cost_Category.Process,'
      '        Process_Cost_Category.Cost_Number,'
      '        Process_Cost_Category.Category_Number,'
      '        Process_Cost_Category.Cost_Description,'
      '        Process_Cost_Category.Unit_Cost,'
      '        Process_Cost_Category.Unit_Sell,'
      '        Process_Cost_Category.Price_Unit,'
      '        Price_Unit.Description as Price_Unit_Description'
      'from Process_Cost_Category, Price_Unit'
      'where process = :Process and'
      'Customer = :Customer and'
      'Cost_Number = :Cost_Number and'
      '(Process_Cost_Category.Price_unit = Price_unit.Price_Unit)'
      'order by Cost_Description')
    Left = 496
    Top = 201
    ParamData = <
      item
        Name = 'process'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cost_Number'
      end>
  end
  object qryProcessCostSub: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Process_Cost_Category_Sub.Customer,'
      '        Process_Cost_Category_Sub.Process,'
      '        Process_Cost_Category_Sub.Cost_Number,'
      '        Process_Cost_Category_Sub.Category_Number,'
      '        Process_Cost_Category_Sub.Sub_Category,'
      '        Process_Cost_Category_Sub.Cost_Description,'
      '        Process_Cost_Category_Sub.Unit_Cost,'
      '        Process_Cost_Category_Sub.Unit_Sell,'
      '        Process_Cost_Category_Sub.Price_Unit,'
      '        Price_Unit.Description as Price_Unit_Description'
      'from Process_Cost_Category_Sub, Price_unit'
      'where process = :process and'
      'Customer = :Customer and'
      'Cost_Number = :Cost_Number and'
      'Category_Number = :Category_Number and'
      '(Process_Cost_Category_Sub.Price_unit = Price_unit.Price_Unit)'
      'order by Cost_Description')
    Left = 648
    Top = 129
    ParamData = <
      item
        Name = 'process'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cost_Number'
      end
      item
        Name = 'Category_Number'
      end>
  end
  object dtsProcessCostCat: TDataSource
    DataSet = qryProcessCostCat
    Left = 496
    Top = 257
  end
  object dtsProcessCostSub: TDataSource
    DataSet = qryProcessCostSub
    Left = 648
    Top = 185
  end
  object qryAddProcessCost: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Process_Cost'
      '        (Customer,'
      '         Process,'
      '        Cost_Number,'
      '        Cost_Description,'
      '        Unit_Cost,'
      '        Unit_Sell,'
      '        Price_Unit)'
      
        'Select :Customer, :Process, ISNULL(Max(Cost_Number)+1,1), :Cost_' +
        'Description, :Unit_Cost, :Unit_Sell, :Price_Unit'
      
        'From Process_Cost Where Process = :Process and Customer = :Custo' +
        'mer'
      ' ')
    Left = 248
    Top = 120
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Cost_Description'
      end
      item
        Name = 'Unit_Cost'
      end
      item
        Name = 'Unit_Sell'
      end
      item
        Name = 'Price_Unit'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Customer'
      end>
  end
  object qryAddProcessCostCat: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Process_Cost_Category'
      '        (Customer,'
      '        Process,'
      '        Cost_Number,'
      '        Category_Number,'
      '        Cost_Description,'
      '        Unit_Cost,'
      '        Unit_Sell,'
      '        Price_Unit)'
      
        'Select :Customer, :Process, :Cost_Number, ISNULL(Max(Category_Nu' +
        'mber)+1,1), :Cost_Description, :Unit_Cost, :Unit_Sell, :Price_Un' +
        'it'
      
        'From Process_Cost_Category Where Process = :Process and Cost_Num' +
        'ber = :Cost_Number and Customer = :Customer'
      ' ')
    Left = 552
    Top = 160
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Cost_Number'
      end
      item
        Name = 'Cost_Description'
      end
      item
        Name = 'Unit_Cost'
      end
      item
        Name = 'Unit_Sell'
      end
      item
        Name = 'Price_Unit'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Cost_Number'
      end
      item
        Name = 'Customer'
      end>
  end
  object qryLastCostNumber: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select max(Cost_Number) as Last_Number'
      'From Process_Cost'
      'Where Process = :Process and Customer = :Customer')
    Left = 248
    Top = 176
    ParamData = <
      item
        Name = 'Process'
      end
      item
        Name = 'Customer'
      end>
  end
  object qryLastCatNumber: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select max(Category_Number) as Last_Number'
      'From Process_Cost_Category'
      
        'Where Process = :Process and Customer = :Customer and Cost_Numbe' +
        'r = :Cost_Number')
    Left = 552
    Top = 240
    ParamData = <
      item
        Name = 'Process'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cost_Number'
      end>
  end
  object qryAddProcessCostSub: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Process_Cost_Category_Sub'
      '        (Customer,'
      '        Process,'
      '        Cost_Number,'
      '        Category_Number,'
      '        Sub_Category,'
      '        Cost_Description,'
      '        Unit_Cost,'
      '        Unit_Sell,'
      '        Price_Unit)'
      
        'Select :Customer, :Process, :Cost_Number, :Category_Number, ISNU' +
        'LL(Max(Sub_Category)+1,1), :Cost_Description, :Unit_Cost, :Unit_' +
        'Sell, :Price_Unit'
      
        'From Process_Cost_Category_Sub Where Customer = :Customer and Pr' +
        'ocess = :Process and Cost_Number = :Cost_Number and Category_Num' +
        'ber = :Category_Number'
      '')
    Left = 656
    Top = 256
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Cost_Number'
      end
      item
        Name = 'Category_Number'
      end
      item
        Name = 'Cost_Description'
      end
      item
        Name = 'Unit_Cost'
      end
      item
        Name = 'Unit_Sell'
      end
      item
        Name = 'Price_Unit'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Cost_Number'
      end
      item
        Name = 'Category_Number'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'PB'
    Left = 368
    Top = 161
  end
  object qryProcess: TFDQuery
    ConnectionName = 'PB'
    Left = 288
    Top = 8
  end
  object dtsProcess: TDataSource
    DataSet = qryProcess
    Left = 344
    Top = 8
  end
  object qryGetPTProcess: TFDQuery
    SQL.Strings = (
      'select *'
      'from Process'
      'where Product_Type = :Product_Type'
      'Order By Process_Description')
    Left = 424
    Top = 72
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object qryGetProcess: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Process'
      'order By Process_Description')
    Left = 480
    Top = 72
  end
end
