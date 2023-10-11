object frmWTMaintWTGPrices: TfrmWTMaintWTGPrices
  Left = 219
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Worktop Group Prices'
  ClientHeight = 215
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 20
    Width = 29
    Height = 13
    Caption = 'Group'
  end
  object Label3: TLabel
    Left = 24
    Top = 55
    Width = 49
    Height = 13
    Caption = 'Thickness'
  end
  object Label4: TLabel
    Left = 24
    Top = 88
    Width = 48
    Height = 13
    Caption = 'Cost Price'
  end
  object Label5: TLabel
    Left = 24
    Top = 120
    Width = 58
    Height = 13
    Caption = 'Selling Price'
  end
  object Label6: TLabel
    Left = 224
    Top = 88
    Width = 61
    Height = 13
    Caption = 'per sq. metre'
  end
  object Label7: TLabel
    Left = 224
    Top = 120
    Width = 58
    Height = 13
    Caption = 'per sq.metre'
  end
  object dblkpWorktopGroup: TDBLookupComboBox
    Left = 104
    Top = 16
    Width = 145
    Height = 21
    KeyField = 'Worktop_Group'
    ListField = 'Worktop_Group_Description'
    ListSource = stclkpWTGroup
    TabOrder = 0
    OnClick = dblkpWorktopGroupClick
  end
  object dblkpThickness: TDBLookupComboBox
    Left = 104
    Top = 47
    Width = 105
    Height = 21
    KeyField = 'Thickness'
    ListField = 'Thickness_mm'
    ListSource = srclkpThickness
    TabOrder = 1
    OnClick = EnableOK
  end
  object edtmnyCost: TCREditMoney
    Left = 104
    Top = 80
    Width = 105
    Height = 21
    TabOrder = 2
    Text = '0.00'
    OnClick = EnableOK
  end
  object edtmnySell: TCREditMoney
    Left = 104
    Top = 112
    Width = 105
    Height = 21
    TabOrder = 3
    Text = '0.00'
    OnClick = EnableOK
  end
  object btnOK: TBitBtn
    Left = 152
    Top = 184
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 246
    Top = 184
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 5
  end
  object Button1: TButton
    Left = 264
    Top = 14
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = Button1Click
  end
  object lkpThickness: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Thickness'
      'where (thickness not in (select thickness'
      '                        from worktop_group_prices'
      '                        where worktop_group = :worktop_group and'
      
        '                              material_type = :material_type)) a' +
        'nd'
      
        '      ((inactive = '#39'N'#39') or (inactive = '#39#39') or (inactive is NULL)' +
        ') or'
      '      Thickness = :thickness'
      'order by thickness_mm')
    Left = 176
    Top = 56
    ParamData = <
      item
        Name = 'worktop_group'
      end
      item
        Name = 'material_type'
      end
      item
        Name = 'thickness'
      end>
  end
  object srclkpThickness: TDataSource
    DataSet = lkpThickness
    Left = 224
    Top = 56
  end
  object lkpWTGroup: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * '
      'from Worktop_Group'
      'where (material_type = :Material_type and'
      
        '((inactive = '#39'N'#39') or (inactive = '#39#39'))) or Worktop_group = :Workt' +
        'op_Group'
      'order by worktop_group_description')
    Left = 176
    Top = 16
    ParamData = <
      item
        Name = 'Material_type'
      end
      item
        Name = 'Worktop_Group'
      end>
  end
  object stclkpWTGroup: TDataSource
    DataSet = lkpWTGroup
    Left = 224
    Top = 16
  end
  object qryWTThickness: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Worktop_thickness.*'
      'from Worktop_thickness, worktop'
      'where Worktop.Worktop_Group = :Worktop_Group AND'
      'Worktop.Material_Type = :Material_Type AND'
      'Worktop_Thickness.Thickness = :Thickness AND'
      'Worktop.worktop = Worktop_thickness.worktop')
    Left = 40
    Top = 144
    ParamData = <
      item
        Name = 'Worktop_Group'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Thickness'
      end>
  end
  object qryGetGroupWT: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Worktop_Group.Worktop_Group,'
      '        Worktop_Group.Worktop_Group_Description,'
      '        Worktop_Group.Material_Type,'
      '        worktop.Worktop,'
      '        worktop.Description'
      'FROM Worktop_Group'
      
        '      INNER JOIN worktop ON Worktop_Group.Worktop_Group = workto' +
        'p.Worktop_Group'
      'WHERE Worktop.Worktop_Group = :Worktop_Group AND'
      '      Worktop.Material_Type = :Material_Type'
      'ORDER BY worktop.Worktop')
    Left = 24
    Top = 32
    ParamData = <
      item
        Name = 'Worktop_Group'
      end
      item
        Name = 'Material_Type'
      end>
  end
  object qryCheckWTThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Worktop, Thickness'
      'FROM Worktop_Thickness'
      'WHERE Worktop = :Worktop AND'
      '      Thickness = :Thickness')
    Left = 104
    Top = 104
    ParamData = <
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end>
  end
  object qryAddWTThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'insert into Worktop_Thickness (Worktop, Thickness, Price_Pointer' +
        ')'
      'values (:Worktop, :Thickness, :Price_Pointer)')
    Left = 248
    Top = 120
    ParamData = <
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Price_Pointer'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'INSERT INTO Worktop_Group_Prices'
      '('
      '  Material_Type,'
      '  Worktop_Group,'
      '  Thickness,'
      '  Price_Pointer'
      ')'
      'VALUES'
      '('
      '  :Material_Type,'
      '  :Worktop_Group,'
      '  :Thickness,'
      '  :Price_Pointer'
      ')'
      '')
    Left = 104
    Top = 152
    ParamData = <
      item
        Name = 'Material_Type'
      end
      item
        Name = 'Worktop_Group'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'price_pointer'
      end>
  end
end
