object frmWTMaintCustAssociateCharge: TfrmWTMaintCustAssociateCharge
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Associate Charge'
  ClientHeight = 298
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 698
    Height = 258
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 841
    ExplicitHeight = 292
    object Label1: TLabel
      Left = 10
      Top = 54
      Width = 75
      Height = 15
      Caption = 'Product Code'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 289
      Top = 113
      Width = 45
      Height = 15
      Caption = 'Unit Size'
    end
    object Label4: TLabel
      Left = 10
      Top = 112
      Width = 78
      Height = 15
      Caption = 'Sell Price/unit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 10
      Top = 145
      Width = 47
      Height = 15
      Caption = 'Vat Rate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 10
      Top = 84
      Width = 64
      Height = 15
      Caption = 'Description'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 10
      Top = 25
      Width = 109
      Height = 15
      Caption = 'Associate Customer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtProduct: TEdit
      Left = 136
      Top = 49
      Width = 137
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = EnableOK
      OnKeyPress = edtProductKeyPress
    end
    object btnLUProducts: TButton
      Left = 289
      Top = 49
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnLUProductsClick
    end
    object edtDescription: TEdit
      Left = 136
      Top = 80
      Width = 471
      Height = 23
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edtPackSize: TEdit
      Left = 340
      Top = 109
      Width = 81
      Height = 23
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object memSellPrice: TMemo
      Left = 136
      Top = 109
      Width = 81
      Height = 21
      Alignment = taRightJustify
      TabOrder = 4
      WantReturns = False
      WordWrap = False
      OnChange = EnableOK
      OnEnter = SaveValue
      OnExit = ValidateMoney
    end
    object dblkpVAT: TDBLookupComboBox
      Left = 136
      Top = 141
      Width = 144
      Height = 23
      KeyField = 'Vat'
      ListField = 'Description'
      ListSource = dtsVat
      TabOrder = 5
    end
    object Button1: TButton
      Left = 286
      Top = 139
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
    object edtCustomerName: TEdit
      Left = 136
      Top = 20
      Width = 471
      Height = 23
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
      OnChange = EnableOK
    end
    object Button2: TButton
      Left = 622
      Top = 20
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = Button2Click
    end
    object chkbxInactive: TCheckBox
      Left = 10
      Top = 192
      Width = 97
      Height = 17
      Caption = 'Inactive'
      TabOrder = 9
    end
  end
  object pnlFunctions: TPanel
    Left = 0
    Top = 258
    Width = 698
    Height = 40
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    TabStop = True
    ExplicitTop = 292
    ExplicitWidth = 841
    DesignSize = (
      698
      40)
    object lblDelete: TLabel
      Left = 358
      Top = 12
      Width = 145
      Height = 15
      Anchors = [akRight, akBottom]
      Caption = 'Delete the above details ?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 302
    end
    object btnOK: TBitBtn
      Left = 518
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnOKClick
      ExplicitLeft = 661
    end
    object btnCancel: TBitBtn
      Left = 598
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelClick
      ExplicitLeft = 741
    end
  end
  object qryGetCharge: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Associate_Charge.ID,'
      '        Customer_Associate_Charge.Customer,'
      '        Customer_Associate_Charge.Associate_Customer,'
      
        '        Associate_Customer.Customer_Name as Associate_Customer_N' +
        'ame,'
      '        Customer_Associate_Charge.Product,'
      '        Customer_Associate_Charge.Price_Pointer,'
      '        Product.Product_code,'
      '        (select top 1 Unit_price'
      '        from Prices'
      
        '        where Prices.Price_pointer = Customer_Associate_Charge.p' +
        'rice_pointer and'
      '              Prices.effective_date <= now()'
      '        order by Prices.effective_date desc) AS Unit_Price,'
      '        (select top 1 Unit_cost'
      '        from Prices'
      
        '        where Prices.Price_pointer = Customer_Associate_Charge.p' +
        'rice_pointer and'
      '              Prices.effective_date <= now()'
      '        order by Prices.effective_date desc) AS Unit_Cost,'
      '        (select top 1 Price_Unit_Description'
      '        from Prices, Price_unit'
      
        '        where Prices.Price_pointer = Customer_Associate_Charge.p' +
        'rice_pointer and'
      '              Prices.Price_unit = Price_Unit.Price_Unit and'
      '              Prices.effective_date <= now()'
      
        '        order by Prices.effective_date desc) AS Price_Unit_Descr' +
        'iption,'
      '        Customer_Associate_Charge.Vat,'
      '        Product.Product_Description,'
      '        Customer_Associate_Charge.Inactive'
      'FROM Product'
      '        INNER JOIN (Customer AS Associate_Customer'
      '        INNER JOIN Customer_Associate_Charge'
      
        '          ON Associate_Customer.Customer = Customer_Associate_Ch' +
        'arge.Associate_Customer)'
      '          ON Product.Product = Customer_Associate_Charge.Product'
      'WHERE Customer_Associate_Charge.ID = :ID'
      'ORDER BY Associate_Customer.Customer_Name, Product.Product_code'
      '')
    Left = 161
    Top = 21
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object lkpVat: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * from VAT')
    Left = 377
    Top = 21
  end
  object dtsVat: TDataSource
    DataSet = lkpVat
    Left = 444
    Top = 21
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Customer_Associate_Charge'
      'SET'
      '  Customer = :Customer,'
      '  Associate_Customer = :Associate_Customer,'
      '  Product = :Product,'
      '  VAT = :VAT,'
      '  inactive = :inactive'
      'WHERE'
      '  ID = :ID')
    Left = 153
    Top = 181
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ASSOCIATE_CUSTOMER'
        ParamType = ptInput
      end
      item
        Name = 'PRODUCT'
        ParamType = ptInput
      end
      item
        Name = 'VAT'
        ParamType = ptInput
      end
      item
        Name = 'INACTIVE'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Customer_Associate_Charge'
      '('
      '        Customer,'
      '        Associate_Customer,'
      '        Product,'
      '        Price_Pointer,'
      '        VAT,'
      '        inactive'
      ')'
      'Values'
      '('
      '        :Customer,'
      '        :Associate_Customer,'
      '        :Product,'
      '        :Price_Pointer,'
      '        :VAT,'
      '        :inactive'
      ')'
      '')
    Left = 265
    Top = 181
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ASSOCIATE_CUSTOMER'
        ParamType = ptInput
      end
      item
        Name = 'PRODUCT'
        ParamType = ptInput
      end
      item
        Name = 'PRICE_POINTER'
        ParamType = ptInput
      end
      item
        Name = 'VAT'
        ParamType = ptInput
      end
      item
        Name = 'INACTIVE'
        ParamType = ptInput
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select max(ID) as ID'
      'From Customer_Associate_Charge')
    Left = 361
    Top = 181
  end
end
