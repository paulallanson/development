object frmWTMaintContractConvertOrder: TfrmWTMaintContractConvertOrder
  Left = 425
  Top = 59
  Caption = 'Convert to Order'
  ClientHeight = 621
  ClientWidth = 594
  Color = clBtnFace
  Constraints.MinWidth = 560
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object pnlFooter: TPanel
    Left = 0
    Top = 576
    Width = 594
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      594
      45)
    object btnOK: TBitBtn
      Left = 375
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      Enabled = False
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 463
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object pnlReference: TPanel
    Left = 0
    Top = 514
    Width = 594
    Height = 62
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 60
      Height = 13
      Caption = 'Reference'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 16
      Top = 40
      Width = 74
      Height = 13
      Caption = 'Customer PO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtReference: TEdit
      Left = 96
      Top = 4
      Width = 294
      Height = 21
      TabOrder = 0
      Text = 'edtReference'
      OnChange = EnableOK
    end
    object edtCustomerPO: TEdit
      Left = 96
      Top = 36
      Width = 294
      Height = 21
      TabOrder = 1
      Text = 'edtCustomerPO'
      OnChange = EnableOK
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 129
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 49
      Height = 13
      Caption = 'Worktop'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 59
      Height = 13
      Caption = 'Thickness'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNoOfOrders: TLabel
      Left = 376
      Top = 16
      Width = 100
      Height = 13
      Caption = 'Number of Orders'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 16
      Top = 80
      Width = 48
      Height = 13
      Caption = 'Upstand'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 16
      Top = 107
      Width = 53
      Height = 13
      Caption = 'Customer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblkpWorktops: TDBLookupComboBox
      Left = 96
      Top = 12
      Width = 210
      Height = 21
      KeyField = 'Worktop'
      ListField = 'Description'
      ListSource = dtsWorktops
      TabOrder = 0
      OnClick = rktopsClick
    end
    object dblkpThickness: TDBLookupComboBox
      Left = 96
      Top = 44
      Width = 129
      Height = 21
      KeyField = 'Thickness'
      ListField = 'Thickness_mm'
      ListSource = dtsThickness
      TabOrder = 1
      OnClick = dblkpThicknessClick
    end
    object spnNoOfOrders: TSpinEdit
      Left = 480
      Top = 11
      Width = 57
      Height = 22
      MaxValue = 1000
      MinValue = 1
      TabOrder = 2
      Value = 1
    end
    object dblkpUpstand: TDBLookupComboBox
      Left = 96
      Top = 76
      Width = 210
      Height = 21
      KeyField = 'Worktop'
      ListField = 'Description'
      ListSource = dtsWorktops
      TabOrder = 3
      OnClick = EnableOK
    end
    object edtCustomerName: TEdit
      Left = 96
      Top = 103
      Width = 401
      Height = 21
      ReadOnly = True
      TabOrder = 4
      Text = 'edtCustomerName'
      OnChange = EnableOK
    end
    object btnCustomer: TBitBtn
      Left = 509
      Top = 102
      Width = 22
      Height = 22
      Hint = 'Select Customer'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnCustomerClick
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 393
    Width = 594
    Height = 121
    Align = alClient
    DataSource = dtsSalesOrders
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Sales_Order'
        Title.Caption = 'Sales Order'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Raised'
        Title.Caption = 'Order Date'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descriptive_Reference'
        Title.Caption = 'Descriptive'
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Reference'
        Width = 140
        Visible = True
      end>
  end
  object pnlSiteLocation: TPanel
    Left = 0
    Top = 129
    Width = 594
    Height = 264
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label4: TLabel
      Left = 16
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Developer'
    end
    object Label5: TLabel
      Left = 16
      Top = 208
      Width = 71
      Height = 13
      Caption = 'Site Contact'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 239
      Width = 63
      Height = 13
      Caption = 'Site Phone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 67
      Width = 46
      Height = 13
      Caption = 'Address'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 16
      Top = 123
      Width = 49
      Height = 13
      Caption = 'Town/City'
    end
    object Label11: TLabel
      Left = 16
      Top = 151
      Width = 54
      Height = 13
      Caption = 'Postcode'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 16
      Top = 179
      Width = 33
      Height = 13
      Caption = 'County'
    end
    object edtDeveloper: TEdit
      Left = 96
      Top = 4
      Width = 441
      Height = 21
      TabOrder = 0
      Text = 'edtDeveloper'
      OnChange = EnableOK
    end
    object edtSitePhone: TEdit
      Left = 96
      Top = 235
      Width = 233
      Height = 21
      TabOrder = 7
      Text = 'edtSitePhone'
      OnChange = EnableOK
    end
    object edtSiteContact: TEdit
      Left = 96
      Top = 204
      Width = 233
      Height = 21
      TabOrder = 6
      Text = 'edtSiteContact'
      OnChange = EnableOK
    end
    object edtStreet: TEdit
      Left = 96
      Top = 63
      Width = 441
      Height = 21
      TabOrder = 1
      Text = 'edtStreet'
      OnChange = EnableOK
    end
    object edtLocale: TEdit
      Left = 96
      Top = 91
      Width = 441
      Height = 21
      TabOrder = 2
      Text = 'edtLocale'
      OnChange = EnableOK
    end
    object edtTown: TEdit
      Left = 96
      Top = 119
      Width = 233
      Height = 21
      TabOrder = 3
      Text = 'edtTown'
      OnChange = EnableOK
    end
    object edtPostcode: TEdit
      Left = 96
      Top = 147
      Width = 97
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 4
      Text = 'EDTPOSTCODE'
      OnChange = EnableOK
    end
    object edtCounty: TEdit
      Left = 96
      Top = 175
      Width = 233
      Height = 21
      TabOrder = 5
      Text = 'edtCounty'
      OnChange = EnableOK
    end
    object pnlCustomerBranch: TPanel
      Left = 0
      Top = 30
      Width = 505
      Height = 27
      BevelOuter = bvNone
      TabOrder = 8
      DesignSize = (
        505
        27)
      object Label14: TLabel
        Left = 16
        Top = 7
        Width = 49
        Height = 13
        Caption = 'Site Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object btnClearCustomerBranch: TSpeedButton
        Left = 408
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Clear Revenue Centre'
        Anchors = [akLeft, akBottom]
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
        ParentShowHint = False
        ShowHint = True
        OnClick = btnClearCustomerBranchClick
      end
      object edtSiteName: TEdit
        Left = 96
        Top = 3
        Width = 270
        Height = 21
        ReadOnly = True
        TabOrder = 0
        Text = 'edtSiteName'
      end
      object btnCustomerBranch: TBitBtn
        Left = 376
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Select Customer'
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnCustomerBranchClick
      end
    end
  end
  object qryWorktops: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Worktop_Group.Customer,'
      '        Customer_Worktop_Group.Group_Number,'
      '        Customer_Worktop_Group.Supplier,'
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
      '      Customer_Worktop_Group.Group_Number = :Group_Number'
      'ORDER BY Worktop.Description')
    Left = 360
    Top = 120
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Group_Number'
      end>
  end
  object dtsWorktops: TDataSource
    DataSet = qryWorktops
    Left = 408
    Top = 112
  end
  object qryGetQElement: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1 Quote_Element.Thickness'
      'FROM Quote_Element'
      'WHERE Quote_Element.Quote = :Quote')
    Left = 352
    Top = 56
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryGetWTThickness: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Price_Pointer'
      'FROM Worktop_Thickness'
      'WHERE Worktop = :Worktop AND'
      'Thickness = :Thickness')
    Left = 440
    Top = 56
    ParamData = <
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end>
  end
  object qryThickness: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Worktop_Group_Thick.Customer,'
      '        Customer_Worktop_Group_Thick.Group_Number,'
      '        Customer_Worktop_Group_Thick.Thickness,'
      '        Thickness.Thickness_mm, Thickness.inactive,'
      '        (select top 1 Unit_cost'
      '          from Prices'
      
        '          where Prices.Price_pointer =  Customer_Worktop_Group_T' +
        'hick.price_pointer and'
      '          Prices.effective_date <= now()'
      '          order by Prices.effective_date desc) AS Unit_Cost,'
      '        (select top 1 Price_Unit'
      '          from Prices'
      
        '          where Prices.Price_pointer =  Customer_Worktop_Group_T' +
        'hick.price_pointer and'
      '          Prices.effective_date <= now()'
      '          order by Prices.effective_date desc) AS Price_Unit'
      'FROM Thickness'
      
        '        INNER JOIN Customer_Worktop_Group_Thick ON Thickness.Thi' +
        'ckness = Customer_Worktop_Group_Thick.Thickness'
      'WHERE   Customer_Worktop_Group_Thick.Customer = :Customer AND'
      
        '        Customer_Worktop_Group_Thick.Group_Number = :Group_Numbe' +
        'r'
      'ORDER BY Thickness_mm'
      '')
    Left = 416
    Top = 184
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Group_Number'
      end>
  end
  object dtsThickness: TDataSource
    DataSet = qryThickness
    Left = 344
    Top = 176
  end
  object dtsSalesOrders: TDataSource
    DataSet = qrySalesOrders
    Left = 256
    Top = 217
  end
  object qrySalesOrders: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Sales_Order'
      'Where Customer = :Customer'
      'ORDER BY Sales_Order Desc')
    Left = 184
    Top = 233
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryGetMaterialSlabSize: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select top 1 Length, Depth'
      'from Material_Type_Slab_Size'
      'Where Material_Type = :Material_Type')
    Left = 448
    Top = 224
    ParamData = <
      item
        Name = 'Material_Type'
      end>
  end
  object qryGetQSlab: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1 Quote_Slab.Thickness'
      'FROM Quote_Slab'
      'WHERE Quote_Slab.Quote = :Quote')
    Left = 464
    Top = 144
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
end
