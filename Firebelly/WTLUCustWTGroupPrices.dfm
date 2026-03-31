object frmWTLUCustWTGroupPrices: TfrmWTLUCustWTGroupPrices
  Left = 459
  Top = 111
  BorderStyle = bsDialog
  Caption = 'Customer Worktop Contract Prices'
  ClientHeight = 350
  ClientWidth = 525
  Color = clBtnFace
  Constraints.MinWidth = 425
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 17
  object dbgDetails: TDBGrid
    Left = 0
    Top = 41
    Width = 525
    Height = 239
    Align = alClient
    DataSource = srclkpCustWTGroupPrices
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Group_Description'
        Title.Caption = 'Group'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Thickness_mm'
        Title.Caption = 'Thickness'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Cost'
        Title.Caption = 'Cost Price'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Price'
        Title.Caption = 'Sell Price'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Markup_Percentage'
        Title.Caption = 'Markup %'
        Width = 71
        Visible = True
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 331
    Width = 525
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 280
    Width = 525
    Height = 51
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      525
      51)
    object BitBtn1: TBitBtn
      Left = 8
      Top = 17
      Width = 75
      Height = 25
      Caption = '&Add'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 90
      Top = 17
      Width = 75
      Height = 25
      Caption = '&Edit'
      Enabled = False
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 172
      Top = 17
      Width = 75
      Height = 25
      Caption = '&Delete'
      Enabled = False
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 423
      Top = 17
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 3
    end
    object btnExcel: TBitBtn
      Left = 341
      Top = 17
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 4
      OnClick = btnExcelClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 525
    Height = 41
    Align = alTop
    TabOrder = 3
    object Label3: TLabel
      Left = 4
      Top = 10
      Width = 42
      Height = 17
      Caption = 'Group:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblGroupName: TLabel
      Left = 54
      Top = 10
      Width = 90
      Height = 17
      Caption = 'lblGroupName'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 240
      Top = 10
      Width = 55
      Height = 17
      Caption = 'Material:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMaterialType: TLabel
      Left = 304
      Top = 10
      Width = 96
      Height = 17
      Caption = 'lblMaterialType'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object qryDelCustWTGroupPrices: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Delete from Customer_Worktop_Group_Thick'
      'where price_pointer = :price_pointer')
    Left = 364
    Top = 180
    ParamData = <
      item
        Name = 'price_pointer'
      end>
  end
  object srclkpCustWTGroupPrices: TDataSource
    DataSet = lkpCustWTGroupPrices
    OnDataChange = srclkpCustWTGroupPricesDataChange
    Left = 192
    Top = 112
  end
  object lkpCustWTGroupPrices: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '    Customer_Worktop_Group_Thick.*,'
      '    Thickness.Thickness_mm,'
      '    Customer_Worktop_Group.Group_Description,'
      '    (select top 1 Unit_price'
      '    from Prices'
      
        '    where Prices.Price_pointer =  Customer_Worktop_Group_Thick.p' +
        'rice_pointer and'
      '    Prices.effective_date <= now()'
      
        '    order by Prices.effective_date desc) AS Unit_Price, (select ' +
        'top 1 Unit_cost'
      '    from Prices'
      
        '    where Prices.Price_pointer =  Customer_Worktop_Group_Thick.p' +
        'rice_pointer and'
      '    Prices.effective_date <= now()'
      
        '    order by Prices.effective_date desc) AS Unit_Cost, (select t' +
        'op 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      
        '    where Prices.Price_pointer =  Customer_Worktop_Group_Thick.p' +
        'rice_pointer and'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= now()'
      
        '    order by Prices.effective_date desc) AS Price_Unit_Descripti' +
        'on'
      'FROM Customer_Worktop_Group'
      '      INNER JOIN (Thickness'
      '      INNER JOIN Customer_Worktop_Group_Thick'
      
        '        ON Thickness.Thickness = Customer_Worktop_Group_Thick.Th' +
        'ickness)'
      
        '        ON (Customer_Worktop_Group.Group_Number = Customer_Workt' +
        'op_Group_Thick.Group_Number)'
      
        '          AND (Customer_Worktop_Group.Customer = Customer_Workto' +
        'p_Group_Thick.Customer)'
      'WHERE Customer_Worktop_Group.Customer = :Customer AND'
      '      Customer_Worktop_Group.Group_Number = :Group_Number'
      'ORDER BY Thickness.Thickness_mm'
      ''
      '')
    Left = 112
    Top = 112
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Group_Number'
      end>
  end
end
