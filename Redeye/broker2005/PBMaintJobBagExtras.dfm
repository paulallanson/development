object PBMaintJobBagExtrasFrm: TPBMaintJobBagExtrasFrm
  Left = 262
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Maintain Job bag extras'
  ClientHeight = 348
  ClientWidth = 488
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
  object DelLabel: TLabel
    Left = 109
    Top = 317
    Width = 184
    Height = 15
    Caption = 'Really Delete This Job Bag Item?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OKBitBtn: TBitBtn
    Left = 325
    Top = 312
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    TabOrder = 1
    OnClick = OKBitBtnClick
    Glyph.Data = {
      CE070000424DCE07000000000000360000002800000024000000120000000100
      1800000000009807000000000000000000000000000000000000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F7F00007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F7F0000007F00007F007F0000007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F0000007F00007F00007F0000
      7F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F000000
      7F00007F00007F00007F00007F00007F007F0000007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F
      7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F7F0000007F00007F00007F0000FF00007F00007F00007F00007F00
      7F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFF
      FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F00007F00007F0000FF00007F7F
      00FF00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F7F7F7FFFFFFF007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00
      007F0000FF00007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F00
      7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F00FF
      00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F
      7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF0000
      7F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F
      7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00
      007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFF
      FFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F00FF00007F00007F007F0000007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F
      7F7FFFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00007F
      00007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F}
    NumGlyphs = 2
  end
  object CancelBitBtn: TBitBtn
    Left = 405
    Top = 312
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object grpbxDetails: TGroupBox
    Left = 8
    Top = 8
    Width = 473
    Height = 289
    TabOrder = 0
    object Label7: TLabel
      Left = 8
      Top = 22
      Width = 82
      Height = 13
      Caption = 'Product Category'
    end
    object Label8: TLabel
      Left = 8
      Top = 52
      Width = 64
      Height = 13
      Caption = 'Product Type'
    end
    object Label1: TLabel
      Left = 8
      Top = 80
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object Label2: TLabel
      Left = 8
      Top = 188
      Width = 39
      Height = 13
      Caption = 'Quantity'
    end
    object Label3: TLabel
      Left = 8
      Top = 212
      Width = 58
      Height = 13
      Caption = 'Selling Price'
    end
    object Label4: TLabel
      Left = 8
      Top = 236
      Width = 46
      Height = 13
      Caption = 'Price Unit'
    end
    object Label5: TLabel
      Left = 8
      Top = 260
      Width = 42
      Height = 13
      Caption = 'Vat Rate'
    end
    object edtProductType: TEdit
      Left = 104
      Top = 48
      Width = 185
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = 'edtProductType'
    end
    object btnProdType: TButton
      Left = 300
      Top = 94
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnProdTypeClick
    end
    object memQuantity: TMemo
      Left = 104
      Top = 184
      Width = 105
      Height = 21
      TabOrder = 4
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateQty
      OnKeyPress = CheckKeyIsNumber
    end
    object memSellPrice: TMemo
      Left = 104
      Top = 208
      Width = 105
      Height = 21
      TabOrder = 5
      WantReturns = False
      WordWrap = False
      OnChange = memSellPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney
      OnKeyPress = CheckKeyIsFloat
    end
    object dblkpPriceUnit: TDBLookupComboBox
      Left = 104
      Top = 232
      Width = 145
      Height = 21
      KeyField = 'Price_Unit'
      ListField = 'Description'
      ListSource = dtsPriceUnit
      TabOrder = 6
      OnClick = CheckOK
    end
    object dblkpVat: TDBLookupComboBox
      Left = 104
      Top = 256
      Width = 105
      Height = 21
      KeyField = 'Vat_Code'
      ListField = 'VAT_Rate'
      ListSource = dtsVat
      TabOrder = 7
      OnClick = CheckOK
    end
    object edtDescription: TRichEdit
      Left = 104
      Top = 80
      Width = 361
      Height = 97
      Lines.Strings = (
        'edtDescription')
      MaxLength = 255
      TabOrder = 3
      OnChange = CheckOK
    end
    object dblkpProductCat: TDBLookupComboBox
      Left = 104
      Top = 18
      Width = 185
      Height = 21
      KeyField = 'Category'
      ListField = 'Description'
      ListSource = dtsProductCat
      TabOrder = 0
      OnClick = dblkpProductCatClick
    end
  end
  object qryVat: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select * '
      'from Vat_Code'
      'order by Vat_Rate')
    Left = 280
    Top = 296
  end
  object qryPriceUnit: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'order by Description')
    Left = 280
    Top = 256
  end
  object qryProductCat: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select *'
      'from Category'
      'order by Description')
    Left = 184
    Top = 72
  end
  object dtsProductCat: TDataSource
    DataSet = qryProductCat
    Left = 224
    Top = 72
  end
  object dtsPriceUnit: TDataSource
    DataSet = qryPriceUnit
    Left = 320
    Top = 256
  end
  object dtsVat: TDataSource
    DataSet = qryVat
    Left = 320
    Top = 296
  end
  object qryGetPUnit: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'where Price_Unit = :Price_Unit')
    Left = 184
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end>
  end
  object qryGetProductType: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select * from Product_Type'
      'where Product_Type = :Product_Type')
    Left = 312
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end>
  end
  object qryWOProcess: TQuery
    DatabaseName = 'pb'
    DataSource = dtsJobBagWO
    SQL.Strings = (
      'SELECT Works_Order_Process.Works_Order,'
      '        Works_Order_Process.Process,'
      '        Process.Process_Description,'
      '        Process.Product_Type,'
      '        Product_Type.Description as Product_Type_description,'
      '        Product_Type.Category'
      'FROM Product_Type'
      '      RIGHT JOIN (Process'
      '      INNER JOIN Works_Order_Process ON'
      '        Process.Process = Works_Order_Process.Process) ON'
      '        Product_Type.Product_Type = Process.Product_Type'
      'where Works_Order = :Works_Order'
      'order by Process_Description')
    Left = 328
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Works_Order'
        ParamType = ptUnknown
      end>
  end
  object dtsWOProcess: TDataSource
    DataSet = qryWOProcess
    Left = 392
    Top = 48
  end
  object qryGetProcess: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'SELECT Works_Order_Process.Works_Order,'
      '        Works_Order_Process.Process,'
      '        Process.Process_Description,'
      '        Process.Product_Type,'
      '        Product_Type.Description as Product_Type_description,'
      '        Product_Type.Category,'
      '        Process.Price_unit'
      'FROM Product_Type'
      '      RIGHT JOIN (Process'
      '      INNER JOIN Works_Order_Process ON'
      '        Process.Process = Works_Order_Process.Process) ON'
      '        Product_Type.Product_Type = Process.Product_Type'
      
        'where Works_Order = :Works_Order and Works_Order_Process.Process' +
        ' = :Process'
      'order by Process_Description')
    Left = 392
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Works_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Process'
        ParamType = ptUnknown
      end>
  end
  object qryJobBagWO: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      
        'select Job_Bag, Job_Bag_Works_Order.Works_Order, Works_Order_Num' +
        'ber'
      'from Job_Bag_Works_Order, Works_Order'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Works_Order.Works_Order = Works_Order.Works_Order'
      'ORDER BY Works_Order.Works_Order_Number')
    Left = 328
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object dtsJobBagWO: TDataSource
    DataSet = qryJobBagWO
    Left = 376
    Top = 16
  end
end
