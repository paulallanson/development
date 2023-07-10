object PBMaintProduct1Frm: TPBMaintProduct1Frm
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Product Create Wizard'
  ClientHeight = 312
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgWizard: TPageControl
    Left = 0
    Top = 0
    Width = 452
    Height = 269
    ActivePage = tsDescription
    Align = alClient
    TabOrder = 0
    object tsCustomer: TTabSheet
      Caption = 'tsCustomer'
      TabVisible = False
      OnShow = tsCustomerShow
      object Label1: TLabel
        Left = 5
        Top = 20
        Width = 89
        Height = 13
        Caption = 'Selected Customer'
      end
      object edtCustomer: TEdit
        Left = 101
        Top = 16
        Width = 305
        Height = 21
        ReadOnly = True
        TabOrder = 0
        OnChange = edtCustomerChange
      end
      object btnCustomer: TBitBtn
        Left = 416
        Top = 15
        Width = 25
        Height = 23
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCustomerClick
      end
    end
    object tsTemplate: TTabSheet
      Caption = 'tsTemplate'
      ImageIndex = 1
      TabVisible = False
      OnShow = tsTemplateShow
      object Label2: TLabel
        Left = 8
        Top = 56
        Width = 95
        Height = 13
        Caption = 'Available Templates'
      end
      object Label4: TLabel
        Left = 232
        Top = 56
        Width = 65
        Height = 13
        Caption = 'Product Code'
      end
      object Label3: TLabel
        Left = 5
        Top = 20
        Width = 89
        Height = 13
        Caption = 'Selected Customer'
      end
      object dblstTemplate: TDBLookupListBox
        Left = 8
        Top = 72
        Width = 209
        Height = 160
        KeyField = 'Template_no'
        ListField = 'Product_Mask'
        ListSource = dtsTemplate
        TabOrder = 0
        OnClick = dblstTemplateClick
      end
      object edtTemplate: TMaskEdit
        Left = 232
        Top = 72
        Width = 209
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 1
        OnChange = edtTemplateChange
      end
      object edtCustomer1: TEdit
        Left = 101
        Top = 16
        Width = 305
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object Panel2: TPanel
        Left = 237
        Top = 112
        Width = 143
        Height = 121
        BevelOuter = bvNone
        TabOrder = 3
        object Label16: TLabel
          Left = 0
          Top = 32
          Width = 130
          Height = 13
          Caption = '\ - Next character is a literal'
        end
        object Label17: TLabel
          Left = 0
          Top = 48
          Width = 134
          Height = 13
          Caption = 'L - alphabetic character only'
        end
        object Label18: TLabel
          Left = 0
          Top = 64
          Width = 127
          Height = 13
          Caption = 'A - alphanumeric character'
        end
        object Label19: TLabel
          Left = 0
          Top = 80
          Width = 122
          Height = 13
          Caption = '0 - numeric character only'
        end
        object Label20: TLabel
          Left = 0
          Top = 96
          Width = 128
          Height = 13
          Caption = 'S - auto sequential numeric'
        end
        object Label21: TLabel
          Left = 0
          Top = 8
          Width = 99
          Height = 13
          Caption = 'Template Legend'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object tsProduct: TTabSheet
      Caption = 'tsProduct'
      ImageIndex = 4
      TabVisible = False
      OnShow = tsProductShow
      object Label14: TLabel
        Left = 5
        Top = 20
        Width = 89
        Height = 13
        Caption = 'Selected Customer'
      end
      object Label15: TLabel
        Left = 5
        Top = 52
        Width = 65
        Height = 13
        Caption = 'Product Code'
      end
      object edtCustomer4: TEdit
        Left = 101
        Top = 16
        Width = 305
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object edtProduct: TEdit
        Left = 101
        Top = 48
        Width = 260
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 25
        TabOrder = 1
        OnChange = edtProductChange
        OnKeyPress = edtProductKeyPress
      end
    end
    object tsDescription: TTabSheet
      Caption = 'tsDescription'
      ImageIndex = 2
      TabVisible = False
      OnShow = tsDescriptionShow
      object Label6: TLabel
        Left = 5
        Top = 52
        Width = 65
        Height = 13
        Caption = 'Product Code'
      end
      object Label7: TLabel
        Left = 5
        Top = 132
        Width = 64
        Height = 13
        Caption = 'Product Type'
      end
      object Label8: TLabel
        Left = 5
        Top = 100
        Width = 20
        Height = 13
        Caption = 'Size'
      end
      object Label5: TLabel
        Left = 5
        Top = 20
        Width = 89
        Height = 13
        Caption = 'Selected Customer'
      end
      object Label9: TLabel
        Left = 5
        Top = 196
        Width = 53
        Height = 13
        Caption = 'Description'
      end
      object Bevel1: TBevel
        Left = 0
        Top = 184
        Width = 441
        Height = 17
        Shape = bsTopLine
      end
      object Bevel2: TBevel
        Left = 3
        Top = 80
        Width = 441
        Height = 17
        Shape = bsTopLine
      end
      object Label10: TLabel
        Left = 5
        Top = 220
        Width = 45
        Height = 13
        Caption = 'Free Text'
      end
      object edtProductCode: TEdit
        Left = 101
        Top = 48
        Width = 217
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object edtProductType: TEdit
        Left = 101
        Top = 128
        Width = 217
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object edtSize: TEdit
        Left = 101
        Top = 96
        Width = 161
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object BitBtn1: TBitBtn
        Left = 277
        Top = 95
        Width = 25
        Height = 23
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 325
        Top = 127
        Width = 25
        Height = 23
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = BitBtn2Click
      end
      object edtCustomer2: TEdit
        Left = 101
        Top = 16
        Width = 305
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 5
      end
      object edtDescription: TEdit
        Left = 101
        Top = 192
        Width = 252
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 6
        OnChange = edtDescriptionChange
      end
      object edtFreeText: TEdit
        Left = 101
        Top = 216
        Width = 332
        Height = 21
        TabOrder = 7
        OnChange = edtDescriptionChange
        OnKeyPress = edtFreeTextKeyPress
      end
    end
    object tsFinish: TTabSheet
      Caption = 'tsFinish'
      ImageIndex = 3
      TabVisible = False
      OnShow = tsFinishShow
      object Label11: TLabel
        Left = 5
        Top = 20
        Width = 89
        Height = 13
        Caption = 'Selected Customer'
      end
      object Label12: TLabel
        Left = 5
        Top = 52
        Width = 65
        Height = 13
        Caption = 'Product Code'
      end
      object Label13: TLabel
        Left = 5
        Top = 84
        Width = 53
        Height = 13
        Caption = 'Description'
      end
      object edtCustomer3: TEdit
        Left = 101
        Top = 16
        Width = 305
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object edtProductCode1: TEdit
        Left = 101
        Top = 48
        Width = 217
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object edtFullDescription: TEdit
        Left = 101
        Top = 80
        Width = 340
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 2
      end
      object chkbxRunReceipts: TCheckBox
        Left = 8
        Top = 136
        Width = 257
        Height = 17
        Caption = 'Receive stock for this product'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 269
    Width = 452
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      452
      43)
    object btnBack: TBitBtn
      Left = 208
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Back'
      TabOrder = 0
      OnClick = btnBackClick
    end
    object btnNext: TBitBtn
      Left = 288
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Next'
      Default = True
      Enabled = False
      TabOrder = 1
      OnClick = btnNextClick
    end
    object btnCancel: TBitBtn
      Left = 368
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = btnCancel1Click
    end
  end
  object qryTemplate: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select  Template_no,'
      '        Product_Code_Prefix,'
      '        Product_Template,'
      '        (Product_Code_Prefix+Product_Template) as Product_Mask'
      'from Customer_Product_Template'
      'where Customer = :Customer'
      'Order By Product_Template')
    Left = 376
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object dtsTemplate: TDataSource
    DataSet = qryTemplate
    Left = 304
    Top = 16
  end
  object qryAddLevels: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Part_Store_Levels'
      'select top 1 :Part, '
      '          Part_Store_type,'
      '          0,:Stock_Levels,'#39'P'#39',NULL,0'
      'from Part_Store_type')
    Left = 192
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Levels'
        ParamType = ptUnknown
      end>
  end
  object qryAddPart: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert Into Part'
      
        '(Part, Part_Description, Part_Cost_List, Part_Cost_Cat, Vat_Code' +
        ', Part_Updated,'
      
        '       Auto_Update, Part_Group, Purch_Pack_Quantity, Sell_Pack_Q' +
        'uantity,'
      '       Part_Purchase_Price, Part_Mark_Up_List, Part_Mark_Up_Cat,'
      '       Not_In_Use, Track_Serial_No, Last_Store_Lot,'
      
        '       Numbered, Price_Unit, Customer, Branch_No, Sales_Nominal,' +
        ' Purchase_Nominal,'
      
        '       Markup_Type, Markup_Value, Product_Class, Product_Type, U' +
        'nit_of_Measure,'
      
        '       Order_Part_online, Inactive_When_Balance_Zero, Product_ID' +
        ')'
      'Values'
      
        '(:Part, :Part_Description, :Part_Cost_List, :Part_Cost_Cat, :Vat' +
        ', '#39'Y'#39','
      
        '       :Auto_Update, :Part_Group, :Purch_Pack_Quantity, :Sell_Pa' +
        'ck_Quantity,'
      
        '       :Part_Purchase_Price, :Part_Mark_Up_List, :Part_Mark_Up_C' +
        'at,'
      '       :Not_In_Use, :Track_Serial_No, '#39'LOT00000'#39','
      
        '       :Numbered, :Price_Unit, :Customer, :Branch, :Sales_Nom, :' +
        'Purch_Nom,'
      
        '       :Markup_Type, :Markup_Val, :Prod_Class, :Product_Type, :U' +
        'nit_of_Measure,'
      
        '       :Order_Part_Online, :Inactive_When_Balance_Zero, :Product' +
        '_ID)'
      ''
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' ')
    Left = 120
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Cost_List'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Cost_Cat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Auto_Update'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part_Group'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sell_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Purchase_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Mark_Up_List'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Mark_Up_Cat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Not_In_Use'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Track_Serial_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Numbered'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Sales_Nom'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Purch_Nom'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Markup_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Markup_Val'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Prod_Class'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Unit_of_Measure'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Order_Part_Online'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inactive_When_Balance_Zero'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_ID'
        ParamType = ptUnknown
      end>
  end
  object qryCheckProductCode: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Part From Part Where Part = :Part'
      ' ')
    Left = 376
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
end
