object frmWTLUWTThickness: TfrmWTLUWTThickness
  Left = 214
  Top = 127
  BorderStyle = bsDialog
  Caption = 'Worktop thickness prices'
  ClientHeight = 260
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 53
    Height = 13
    Caption = 'Worktop:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbtWorktopDesc: TDBText
    Left = 72
    Top = 16
    Width = 297
    Height = 17
    DataField = 'Description'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbgDetails: TDBGrid
    Left = 8
    Top = 48
    Width = 385
    Height = 120
    DataSource = srclkpWTThickness
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
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'Thickness_mm'
        Title.Caption = 'Thickness'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Cost'
        Title.Caption = 'Cost Price'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Price'
        Title.Caption = 'Sell Price'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price_unit_description'
        Title.Caption = 'Price Unit'
        Width = 91
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 80
    Top = 208
    Width = 75
    Height = 25
    Caption = '&Add'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object btnPrices: TBitBtn
    Left = 160
    Top = 208
    Width = 75
    Height = 25
    Caption = '&Prices'
    Enabled = False
    TabOrder = 2
    OnClick = btnPricesClick
  end
  object btnDelete: TBitBtn
    Left = 240
    Top = 208
    Width = 75
    Height = 25
    Caption = '&Delete'
    Enabled = False
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object BitBtn4: TBitBtn
    Left = 320
    Top = 208
    Width = 75
    Height = 25
    Caption = '&Close'
    ModalResult = 2
    TabOrder = 4
    NumGlyphs = 2
  end
  object chkbxShowInactive: TCheckBox
    Left = 8
    Top = 180
    Width = 169
    Height = 17
    Caption = 'Show inactive prices'
    TabOrder = 5
    OnClick = chkbxShowInactiveClick
  end
  object srclkpWTThickness: TDataSource
    DataSet = lkpWTThickness
    OnDataChange = srclkpWTThicknessDataChange
    Left = 80
    Top = 16
  end
  object lkpWTThickness: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Worktop_thickness.Worktop,'
      '      Worktop_thickness.Thickness,'
      '      Worktop_thickness.inactive,'
      '      Thickness.Thickness_mm,'
      '      Worktop_thickness.Price_Pointer,'
      '    (select top 1 Unit_price'
      '    from Prices'
      
        '    where Prices.Price_pointer = worktop_thickness.price_pointer' +
        ' and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Price,'
      '    (select top 1 Unit_cost'
      '    from Prices'
      
        '    where Prices.Price_pointer = worktop_thickness.price_pointer' +
        ' and'
      '    Prices.effective_date <= now()'
      '    order by Prices.effective_date desc) AS Unit_Cost,'
      '    (select top 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      
        '    where Prices.Price_pointer = worktop_thickness.price_pointer' +
        ' and'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= now()'
      
        '    order by Prices.effective_date desc) AS Price_Unit_Descripti' +
        'on'
      
        'FROM Thickness INNER JOIN Worktop_thickness ON Thickness.Thickne' +
        'ss = Worktop_thickness.Thickness'
      'WHERE (((Worktop_thickness.Worktop)=:Worktop)) AND'
      
        '      ((Worktop_thickness.inactive = '#39'N'#39') OR (Worktop_thickness.' +
        'inactive IS NULL) OR (Worktop_thickness.inactive = :Inactive))'
      'ORDER BY Thickness.Thickness_mm'
      '')
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Worktop'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inactive'
        ParamType = ptUnknown
      end>
    object lkpWTThicknessWorktop: TIntegerField
      FieldName = 'Worktop'
    end
    object lkpWTThicknessThickness: TIntegerField
      FieldName = 'Thickness'
    end
    object lkpWTThicknessThickness_mm: TStringField
      FieldName = 'Thickness_mm'
      Size = 10
    end
    object lkpWTThicknessUnit_Price: TFloatField
      FieldName = 'Unit_Price'
      DisplayFormat = '0.00'
    end
    object lkpWTThicknessUnit_Cost: TFloatField
      FieldName = 'Unit_Cost'
      DisplayFormat = '0.00'
    end
    object lkpWTThicknessPrice_unit_description: TStringField
      FieldName = 'Price_unit_description'
    end
    object lkpWTThicknessPrice_Pointer: TIntegerField
      FieldName = 'Price_Pointer'
    end
    object lkpWTThicknessinactive: TStringField
      FieldName = 'inactive'
      Size = 1
    end
  end
  object qryDelWTThick: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Delete from worktop_thickness'
      'where price_pointer = :price_pointer')
    Left = 360
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'price_pointer'
        ParamType = ptUnknown
      end>
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'UPDATE Worktop_Thickness'
      'SET inactive = :inactive'
      'WHERE Price_Pointer = :Price_Pointer')
    Left = 224
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'price_pointer'
        ParamType = ptUnknown
      end>
  end
end
