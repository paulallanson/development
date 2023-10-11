object frmWtMaintProduct: TfrmWtMaintProduct
  Left = 546
  Top = 163
  BorderStyle = bsDialog
  Caption = 'Products'
  ClientHeight = 353
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    438
    353)
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 60
    Width = 65
    Height = 13
    Caption = 'Description'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 28
    Width = 78
    Height = 13
    Caption = 'Product Code'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 92
    Width = 69
    Height = 13
    Caption = 'Product Group'
  end
  object Label6: TLabel
    Left = 16
    Top = 124
    Width = 69
    Height = 13
    Caption = 'VAT Rate %'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 232
    Width = 67
    Height = 13
    Caption = 'Sales Nominal'
  end
  object Label5: TLabel
    Left = 216
    Top = 232
    Width = 86
    Height = 13
    Caption = 'Purchase Nominal'
  end
  object Label9: TLabel
    Left = 16
    Top = 196
    Width = 58
    Height = 13
    Caption = 'Selling Price'
  end
  object Label10: TLabel
    Left = 16
    Top = 164
    Width = 48
    Height = 13
    Caption = 'Cost Price'
  end
  object Label8: TLabel
    Left = 248
    Top = 196
    Width = 50
    Height = 13
    Caption = 'Selling Qty'
  end
  object Label7: TLabel
    Left = 247
    Top = 164
    Width = 51
    Height = 13
    Caption = 'Buying Qty'
  end
  object btnOK: TBitBtn
    Left = 138
    Top = 308
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 12
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 226
    Top = 308
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 13
  end
  object dblkpProductGroup: TDBLookupComboBox
    Left = 112
    Top = 88
    Width = 193
    Height = 21
    KeyField = 'Product_Group'
    ListField = 'Product_Group_Description'
    ListSource = dtsProductGroup
    TabOrder = 2
  end
  object dblkpVatRate: TDBLookupComboBox
    Left = 112
    Top = 120
    Width = 145
    Height = 21
    KeyField = 'Vat'
    ListField = 'Description'
    ListSource = dtsVAT
    TabOrder = 4
    OnClick = EnableOK
  end
  object edtCostPrice: TCREditMoney
    Left = 112
    Top = 160
    Width = 89
    Height = 21
    TabOrder = 5
    Text = '0.00'
  end
  object edtSellPrice: TCREditMoney
    Left = 112
    Top = 192
    Width = 89
    Height = 21
    TabOrder = 7
    Text = '0.00'
  end
  object edtPackSize: TCREditInt
    Left = 317
    Top = 192
    Width = 71
    Height = 21
    TabOrder = 8
    Text = '1'
  end
  object edtCostQty: TCREditInt
    Left = 317
    Top = 160
    Width = 71
    Height = 21
    TabOrder = 6
    Text = '1'
  end
  object BitBtn1: TBitBtn
    Left = 312
    Top = 87
    Width = 22
    Height = 22
    Hint = 'Search for Customer'
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object chkbxInactive: TCheckBox
    Left = 16
    Top = 264
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 11
  end
  object edtProductCode: TEdit
    Left = 112
    Top = 24
    Width = 265
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    Text = 'EDTPRODUCTCODE'
    OnChange = EnableOK
  end
  object edtProductDescription: TEdit
    Left = 112
    Top = 56
    Width = 265
    Height = 21
    TabOrder = 1
    Text = 'edtProductDescription'
    OnChange = EnableOK
  end
  object edtDefaultSalesNominal: TEdit
    Left = 112
    Top = 228
    Width = 90
    Height = 21
    TabOrder = 9
    Text = 'edtDefaultSalesNominal'
  end
  object edtDefaultPurchaseNominal: TEdit
    Left = 317
    Top = 228
    Width = 90
    Height = 21
    TabOrder = 10
    Text = 'edtDefaultPurchaseNominal'
  end
  object qryProductGroup: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Product_Group'
      'order by Product_Group_Description')
    Left = 392
    Top = 24
  end
  object qryVat: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from VAT'
      'order by VAT_Rate')
    Left = 368
    Top = 128
  end
  object dtsProductGroup: TDataSource
    DataSet = qryProductGroup
    Left = 328
    Top = 24
  end
  object dtsVAT: TDataSource
    DataSet = qryVat
    Left = 320
    Top = 128
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Product'
      'SET'
      '  Product_Code = :Product_Code,'
      '  Product_Description = :Product_Description,'
      '  Product_Group = :Product_Group,'
      '  Vat = :Vat,'
      '  Default_Sales_Nominal = :Default_Sales_Nominal,'
      '  Default_Purchase_Nominal = :Default_Purchase_Nominal,'
      '  inActive = :inactive'
      'WHERE'
      '  Product = :Product')
    Left = 64
    Top = 264
    ParamData = <
      item
        Name = 'Product_Code'
      end
      item
        Name = 'Product_Description'
      end
      item
        Name = 'Product_Group'
        DataType = ftInteger
      end
      item
        Name = 'Vat'
        DataType = ftInteger
      end
      item
        Name = 'Default_Sales_Nominal'
        DataType = ftString
      end
      item
        Name = 'Default_Purchase_Nominal'
        DataType = ftString
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Product'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Product'
      '        (Product,'
      '        Product_Code,'
      '        Product_Description,'
      '        Price_Pointer,'
      '        VAT,'
      '        inactive)'
      'Select Max(Product)+1, '#39'Code'#39', :GUID, :Price_Pointer, :Vat, '#39'N'#39
      'From Product'
      ' ')
    Left = 120
    Top = 264
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Price_Pointer'
      end
      item
        Name = 'Vat'
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Product'
      'From Product'
      'Where Product_Description = :GUID')
    Left = 232
    Top = 264
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      ''
      '')
    Left = 296
    Top = 264
  end
end
