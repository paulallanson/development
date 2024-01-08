object PBMaintJobBagLinesFrm: TPBMaintJobBagLinesFrm
  Left = 262
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Maintain Job bag extras'
  ClientHeight = 445
  ClientWidth = 495
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
    495
    445)
  TextHeight = 13
  object DelLabel: TLabel
    Left = 117
    Top = 413
    Width = 184
    Height = 15
    Anchors = [akLeft, akBottom]
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
    Top = 408
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
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
    TabOrder = 1
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 405
    Top = 408
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object grpbxDetails: TGroupBox
    Left = 8
    Top = 8
    Width = 481
    Height = 337
    ParentBackground = False
    TabOrder = 0
    object Label7: TLabel
      Left = 8
      Top = 22
      Width = 89
      Height = 13
      Caption = 'Product Category'
    end
    object Label8: TLabel
      Left = 8
      Top = 52
      Width = 66
      Height = 13
      Caption = 'Product Type'
    end
    object Label1: TLabel
      Left = 8
      Top = 80
      Width = 59
      Height = 13
      Caption = 'Description'
    end
    object Label2: TLabel
      Left = 8
      Top = 188
      Width = 44
      Height = 13
      Caption = 'Quantity'
    end
    object Label3: TLabel
      Left = 8
      Top = 236
      Width = 62
      Height = 13
      Caption = 'Selling Price'
    end
    object Label4: TLabel
      Left = 8
      Top = 284
      Width = 49
      Height = 13
      Caption = 'Price Unit'
    end
    object Label5: TLabel
      Left = 8
      Top = 308
      Width = 42
      Height = 13
      Caption = 'Vat Rate'
    end
    object lblCostPrice: TLabel
      Left = 8
      Top = 212
      Width = 56
      Height = 13
      Caption = 'Direct Cost'
    end
    object lblResellerPrice: TLabel
      Left = 8
      Top = 260
      Width = 67
      Height = 13
      Caption = 'Reseller Price'
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
      Top = 46
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
      Top = 232
      Width = 105
      Height = 21
      TabOrder = 6
      WantReturns = False
      WordWrap = False
      OnChange = memSellPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney4DP
      OnKeyPress = CheckKeyIsFloat
    end
    object dblkpPriceUnit: TDBLookupComboBox
      Left = 104
      Top = 280
      Width = 145
      Height = 21
      KeyField = 'Price_Unit'
      ListField = 'Description'
      ListSource = dtsPriceUnit
      TabOrder = 8
      OnClick = CheckOK
    end
    object dblkpVat: TDBLookupComboBox
      Left = 104
      Top = 304
      Width = 105
      Height = 21
      KeyField = 'Vat_Code'
      ListField = 'VAT_Rate'
      ListSource = dtsVat
      TabOrder = 9
      OnClick = CheckOK
    end
    object edtDescription: TRichEdit
      Left = 104
      Top = 80
      Width = 337
      Height = 97
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Lines.Strings = (
        'edtDescription')
      MaxLength = 255
      ParentFont = False
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
    object memCostPrice: TMemo
      Left = 104
      Top = 208
      Width = 105
      Height = 21
      TabOrder = 5
      WantReturns = False
      WordWrap = False
      OnChange = memSellPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney4DP
      OnKeyPress = CheckKeyIsFloat
    end
    object chkbxInactive: TCheckBox
      Left = 352
      Top = 312
      Width = 97
      Height = 17
      Caption = 'Line Inactive'
      TabOrder = 10
    end
    object btnProducts: TButton
      Left = 448
      Top = 80
      Width = 25
      Height = 25
      Caption = '...'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = btnProductsClick
    end
    object memResellerPrice: TMemo
      Left = 104
      Top = 256
      Width = 105
      Height = 21
      TabOrder = 7
      WantReturns = False
      WordWrap = False
      OnChange = memSellPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney4DP
      OnKeyPress = CheckKeyIsFloat
    end
  end
  object grpbxInternalCost: TGroupBox
    Left = 8
    Top = 352
    Width = 481
    Height = 41
    ParentBackground = False
    TabOrder = 3
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 52
      Height = 13
      Caption = 'Markup %'
    end
    object memMarkupPerc: TMemo
      Left = 104
      Top = 12
      Width = 105
      Height = 21
      TabOrder = 0
      WantReturns = False
      WordWrap = False
      OnChange = memSellPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney3DP
      OnKeyPress = CheckKeyIsFloat
    end
  end
  object chkbxInternalCost: TCheckBox
    Left = 8
    Top = 408
    Width = 97
    Height = 17
    Caption = 'Internal Cost'
    TabOrder = 4
    OnClick = chkbxInternalCostClick
  end
  object qryVat: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * '
      'from Vat_Code'
      'order by Vat_Rate')
    Left = 280
    Top = 296
  end
  object qryPriceUnit: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'order by Description')
    Left = 280
    Top = 256
  end
  object qryProductCat: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Category'
      'order by Description')
    Left = 128
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
  object qryGetPUnit: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'where Price_Unit = :Price_Unit')
    Left = 184
    Top = 112
    ParamData = <
      item
        Name = 'Price_Unit'
      end>
  end
  object qryGetProductType: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from Product_Type'
      'where Product_Type = :Product_Type')
    Left = 312
    Top = 168
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object qryWOProcess: TFDQuery
    ConnectionName = 'pb'
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
        Name = 'Works_Order'
      end>
  end
  object dtsWOProcess: TDataSource
    DataSet = qryWOProcess
    Left = 392
    Top = 48
  end
  object qryGetProcess: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT  Process.Process_Description,'
      '        Process.Product_Type,'
      '        Product_Type.Description as Product_Type_description,'
      '        Product_Type.Category,'
      '        Process.Price_unit'
      'FROM Product_Type '
      
        #9'RIGHT JOIN Process ON Product_Type.Product_Type = Process.Produ' +
        'ct_Type'
      'WHERE Process.Process = :Process'
      'order by Process_Description')
    Left = 400
    Top = 112
    ParamData = <
      item
        Name = 'Process'
      end>
  end
end
