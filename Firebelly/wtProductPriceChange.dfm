object frmWTProductPriceChange: TfrmWTProductPriceChange
  Left = 237
  Top = 117
  BorderStyle = bsDialog
  Caption = 'Product Price Changes'
  ClientHeight = 420
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object lblPriceChange: TLabel
    Left = 16
    Top = 310
    Width = 64
    Height = 13
    Caption = 'Price Change'
  end
  object Label2: TLabel
    Left = 16
    Top = 340
    Width = 68
    Height = 13
    Caption = 'Effective Date'
  end
  object Label5: TLabel
    Left = 224
    Top = 340
    Width = 23
    Height = 13
    Caption = 'Time'
  end
  object Label4: TLabel
    Left = 16
    Top = 16
    Width = 69
    Height = 13
    Caption = 'Product Group'
  end
  object rdGrpProducts: TRadioGroup
    Left = 16
    Top = 80
    Width = 105
    Height = 57
    Caption = 'Products'
    ItemIndex = 0
    Items.Strings = (
      'All '
      'Selected')
    TabOrder = 0
    OnClick = rdGrpProductsClick
  end
  object lstbxProductsCode: TListBox
    Left = 96
    Top = 80
    Width = 25
    Height = 105
    ItemHeight = 13
    TabOrder = 1
    Visible = False
  end
  object grpbxProducts: TGroupBox
    Left = 128
    Top = 80
    Width = 249
    Height = 113
    Enabled = False
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 42
      Height = 13
      Caption = 'Products'
    end
    object btnProducts: TButton
      Left = 216
      Top = 24
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnProductsClick
    end
    object lstbxProducts: TListBox
      Left = 8
      Top = 24
      Width = 201
      Height = 83
      ItemHeight = 13
      Items.Strings = (
        'All Products')
      MultiSelect = True
      TabOrder = 1
    end
  end
  object BasisGroup: TRadioGroup
    Left = 16
    Top = 216
    Width = 141
    Height = 73
    Caption = 'Price Change type'
    ItemIndex = 0
    Items.Strings = (
      'Uplift price by %'
      'Reduce price by %'
      'Set Specific Price')
    TabOrder = 3
    OnClick = BasisGroupClick
  end
  object edtChange: TCREditFloat
    Left = 104
    Top = 304
    Width = 103
    Height = 21
    TabOrder = 4
    OnChange = EnableOK
  end
  object dtpckEffective: TDateTimePicker
    Left = 104
    Top = 336
    Width = 101
    Height = 21
    Date = 37563.834117939810000000
    Time = 37563.834117939810000000
    TabOrder = 5
  end
  object edtTime: TMaskEdit
    Left = 252
    Top = 336
    Width = 51
    Height = 21
    EditMask = '!90:00;1;_'
    MaxLength = 5
    TabOrder = 6
    Text = '00:01'
  end
  object BitBtn2: TBitBtn
    Left = 207
    Top = 376
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 7
    NumGlyphs = 2
  end
  object btnOK: TBitBtn
    Left = 119
    Top = 376
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    TabOrder = 8
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object dblkpProductGroup: TDBLookupComboBox
    Left = 16
    Top = 32
    Width = 169
    Height = 21
    KeyField = 'Product_Group'
    ListField = 'Product_Group_Description'
    ListSource = dtsProductGroup
    TabOrder = 9
  end
  object qryProductGroup: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select *'
      'from Product_Group'
      'ORDER BY Product_Group_Description')
    Left = 232
    Top = 24
  end
  object dtsProductGroup: TDataSource
    DataSet = qryProductGroup
    Left = 272
    Top = 24
  end
  object qryProducts: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Product.Product,'
      '        Product.Price_pointer,'
      '        Product.Product_Group,'
      '        Product.inactive'
      'FROM Product'
      'WHERE ((Product_Group = :Product_Group) or (:Product_Group = 0))'
      '')
    Left = 352
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Product_Group'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_Group'
        ParamType = ptUnknown
      end>
  end
  object qryPrice: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select top 1 *'
      'from prices'
      'where (Price_pointer = :Price_pointer) and'
      #9#9'(effective_date <= now())'
      'order by effective_date desc')
    Left = 344
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Price_pointer'
        ParamType = ptUnknown
      end>
  end
end
