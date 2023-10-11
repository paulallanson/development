object frmWTLUWorktopPrices: TfrmWTLUWorktopPrices
  Left = 465
  Top = 122
  Caption = 'frmWTLUWorktopPrices'
  ClientHeight = 299
  ClientWidth = 696
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 696
    Height = 299
    Align = alClient
    DataSource = srcLUWorktops
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Material_Description'
        Title.Caption = 'Material'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 257
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Thickness_mm'
        Title.Caption = 'Thickness'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Worktop_Group_Description'
        Title.Caption = 'Group'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Cost'
        Title.Caption = 'Cost'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Price'
        Title.Caption = 'Price'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price_Unit_Description'
        Title.Caption = 'Price Unit'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Inactive'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Finish_Description'
        Title.Caption = 'Finish'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Discount_Label'
        Title.Caption = 'Discount'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Discount_Type'
        Title.Caption = 'Discount Type'
        Width = 86
        Visible = True
      end>
  end
  object qryWorktops: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '    Worktop_thickness.Worktop,'
      '    Worktop_thickness.Thickness,'
      '    Worktop_thickness.Price_pointer,'
      '    Worktop.Description,'
      '    Worktop.Material_Type,'
      '    Worktop.Worktop_Group,'
      '    Worktop.inactive,'
      '    Material_Type.Description AS Material_Description,'
      '    Worktop_Group.Worktop_Group_Description,'
      '    Thickness.Thickness_mm,'
      '    (select top 1 Unit_price'
      '    from Prices'
      
        '    where Prices.Price_pointer = worktop_thickness.price_pointer' +
        ' and'
      '    Prices.effective_date <= now()'
      
        '    order by Prices.effective_date desc) AS Unit_Price, (select ' +
        'top 1 Unit_cost'
      '    from Prices'
      
        '    where Prices.Price_pointer = worktop_thickness.price_pointer' +
        ' and'
      '    Prices.effective_date <= now()'
      
        '    order by Prices.effective_date desc) AS Unit_Cost, (select t' +
        'op 1 Price_Unit_Description'
      '    from Prices, Price_unit'
      
        '    where Prices.Price_pointer = worktop_thickness.price_pointer' +
        ' and'
      '    Prices.Price_unit = Price_Unit.Price_Unit and'
      '    Prices.effective_date <= now()'
      
        '    order by Prices.effective_date desc) AS Price_Unit_Descripti' +
        'on,'
      '    Discount.Discount_Label,'
      '    Discount.Discount_Type,'
      '    Worktop_Finish.Description as Finish_Description'
      'FROM Worktop_Finish'
      '      RIGHT JOIN (Discount'
      '      RIGHT JOIN ((Worktop_Group'
      '      RIGHT JOIN (Material_Type'
      '      RIGHT JOIN Worktop'
      '        ON Material_Type.Material_Type = Worktop.Material_Type)'
      '        ON Worktop_Group.Worktop_Group = Worktop.Worktop_Group)'
      '      INNER JOIN (Thickness'
      '      INNER JOIN Worktop_thickness'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop)'
      '        ON Discount.Discount = Worktop.Discount)'
      
        '        ON Worktop_Finish.Worktop_Finish = Worktop.Worktop_Finis' +
        'h'
      
        'WHERE ((Worktop.Material_Type = :Material_Type) OR (:Material_Ty' +
        'pe = 0)) AND'
      
        '      ((Worktop.inactive = :inactive) OR (Worktop.inactive = '#39'N'#39 +
        ') or (Worktop.inactive is NULL)) AND'
      '      (Worktop.Description LIKE :Description)'
      
        'ORDER BY Material_Type.Description, Worktop.Description, Thickne' +
        'ss.Thickness_mm'
      '')
    Left = 392
    Top = 176
    ParamData = <
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Description'
      end>
  end
  object srcLUWorktops: TDataSource
    DataSet = qryWorktops
    Left = 472
    Top = 176
  end
end
