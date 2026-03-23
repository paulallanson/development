object frmWTLUAddChgs: TfrmWTLUAddChgs
  Left = 186
  Top = 112
  BorderStyle = bsDialog
  Caption = 'Additional charges'
  ClientHeight = 404
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 705
    Height = 322
    Align = alClient
    DataSource = srclkpExtras
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    OnTitleClick = dbgDetailsTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Description'
        Width = 367
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
        Title.Caption = 'Sales Price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price_Unit_Description'
        Title.Caption = 'Price Unit'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inactive'
        Title.Caption = 'Inactive'
        Visible = False
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 385
    Width = 705
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    ExplicitTop = 365
    ExplicitWidth = 678
  end
  object Panel1: TPanel
    Left = 0
    Top = 322
    Width = 705
    Height = 63
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 302
    ExplicitWidth = 678
    object Label4: TLabel
      Left = 16
      Top = 16
      Width = 39
      Height = 17
      Caption = 'Search'
    end
    object chkbxShowInactive: TCheckBox
      Left = 16
      Top = 41
      Width = 169
      Height = 17
      Caption = 'Show inactive charges'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object btnAdd: TBitBtn
      Left = 275
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Add'
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 355
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Edit'
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 435
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Delete'
      TabOrder = 3
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 603
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 4
    end
    object btnExcel: TBitBtn
      Left = 518
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Excel'
      TabOrder = 5
      OnClick = btnExcelClick
    end
    object edtName: TEdit
      Left = 64
      Top = 12
      Width = 177
      Height = 25
      TabOrder = 6
      OnChange = edtNameChange
    end
  end
  object srclkpExtras: TDataSource
    DataSet = lkpExtras
    OnDataChange = srclkpExtrasDataChange
    Left = 112
    Top = 160
  end
  object lkpExtras: TFDQuery
    Connection = dtmdlWorktops.dtbsWorktops
    SQL.Strings = (
      'select Extra_Charge.*,'
      ' (select top 1 Unit_price'
      '    from Prices'
      '    where Prices.Price_pointer = Extra_Charge.price_pointer and'
      '    Prices.effective_date <= GetDate()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      '    where Prices.Price_pointer = Extra_Charge.price_pointer and'
      '    Prices.effective_date <= GetDate()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      '    where Prices.Price_pointer = Extra_Charge.price_pointer and'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= GetDate()'
      
        '    order by Prices.effective_date desc) AS Price_Unit_Descripti' +
        'on'
      'from Extra_Charge'
      'where'
      
        '((inactive = '#39'N'#39') or (inactive is NULL) or (inactive = '#39#39') or (i' +
        'nactive = :inactive)) AND'
      '  (Extra_Charge.Description LIKE :Description)'
      'order by Description')
    Left = 56
    Top = 160
    ParamData = <
      item
        Name = 'inactive'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Description'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object lkpExtrasExtra_Charge: TIntegerField
      FieldName = 'Extra_Charge'
      Origin = 'Extra_Charge'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object lkpExtrasDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Required = True
      Size = 50
    end
    object lkpExtrasPrice_pointer: TIntegerField
      FieldName = 'Price_pointer'
      Origin = 'Price_pointer'
      Required = True
    end
    object lkpExtrasinactive: TWideStringField
      FieldName = 'inactive'
      Origin = 'inactive'
      Size = 1
    end
    object lkpExtrasDo_Not_Discount: TWideStringField
      FieldName = 'Do_Not_Discount'
      Origin = 'Do_Not_Discount'
      Size = 1
    end
    object lkpExtrasAllow_Bespoke_Detail: TWideStringField
      FieldName = 'Allow_Bespoke_Detail'
      Origin = 'Allow_Bespoke_Detail'
      Size = 1
    end
    object lkpExtrasUnit_Price: TCurrencyField
      FieldName = 'Unit_Price'
      Origin = 'Unit_Price'
      ReadOnly = True
    end
    object lkpExtrasUnit_Cost: TCurrencyField
      FieldName = 'Unit_Cost'
      Origin = 'Unit_Cost'
      ReadOnly = True
    end
    object lkpExtrasPrice_Unit_Description: TWideStringField
      FieldName = 'Price_Unit_Description'
      Origin = 'Price_Unit_Description'
      ReadOnly = True
    end
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 176
    Top = 160
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 440
    Top = 120
  end
  object qryDummy: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Extra_Charge.*,'
      ' (select top 1 Unit_price'
      '    from Prices'
      '    where Prices.Price_pointer = Extra_Charge.price_pointer and'
      '    Prices.effective_date <= GetDate()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      '    where Prices.Price_pointer = Extra_Charge.price_pointer and'
      '    Prices.effective_date <= GetDate()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      '    where Prices.Price_pointer = Extra_Charge.price_pointer and'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= GetDate()'
      
        '    order by Prices.effective_date desc) AS Price_Unit_Descripti' +
        'on'
      'from Extra_Charge'
      'where'
      
        '((inactive = '#39'N'#39') or (inactive is NULL) or (inactive = '#39#39') or (i' +
        'nactive = :inactive)) AND'
      '  (Extra_Charge.Description LIKE :Description)'
      ''
      ''
      ' ')
    Left = 240
    Top = 160
    ParamData = <
      item
        Name = 'INACTIVE'
        ParamType = ptInput
      end
      item
        Name = 'DESCRIPTION'
        ParamType = ptInput
      end>
  end
end
