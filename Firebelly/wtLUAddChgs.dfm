object frmWTLUAddChgs: TfrmWTLUAddChgs
  Left = 186
  Top = 112
  BorderStyle = bsDialog
  Caption = 'Additional charges'
  ClientHeight = 402
  ClientWidth = 690
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 690
    Height = 320
    Align = alClient
    DataSource = srclkpExtras
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
    Top = 383
    Width = 690
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    ParentBackground = False
    Left = 0
    Top = 320
    Width = 690
    Height = 63
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Label4: TLabel
      Left = 16
      Top = 16
      Width = 34
      Height = 13
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
      TabOrder = 4
      NumGlyphs = 2
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
      Height = 21
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
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Extra_Charge.*,'
      ' (select top 1 Unit_price'
      '    from Prices'
      '    where Prices.Price_pointer = Extra_Charge.price_pointer and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      '    where Prices.Price_pointer = Extra_Charge.price_pointer and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      '    where Prices.Price_pointer = Extra_Charge.price_pointer and'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= now()'
      
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
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
    object lkpExtrasExtra_Charge: TIntegerField
      FieldName = 'Extra_Charge'
    end
    object lkpExtrasDescription: TStringField
      FieldName = 'Description'
      Size = 50
    end
    object lkpExtrasPrice_pointer: TIntegerField
      FieldName = 'Price_pointer'
    end
    object lkpExtrasUnit_Price: TFloatField
      FieldName = 'Unit_Price'
      DisplayFormat = '0.00'
    end
    object lkpExtrasUnit_Cost: TFloatField
      FieldName = 'Unit_Cost'
      DisplayFormat = '0.00'
    end
    object lkpExtrasPrice_Unit_Description: TStringField
      FieldName = 'Price_Unit_Description'
    end
    object lkpExtrasinactive: TStringField
      FieldName = 'inactive'
      Size = 1
    end
    object lkpExtrasDo_Not_Discount: TStringField
      FieldName = 'Do_Not_Discount'
      Size = 1
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
end
