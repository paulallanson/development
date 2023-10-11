object PBMaintProcessCostSubFrm: TPBMaintProcessCostSubFrm
  Left = 360
  Top = 122
  Caption = 'Maintain Process Sub Category Costs'
  ClientHeight = 216
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 534
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 13
      Width = 38
      Height = 13
      Caption = 'Process'
    end
    object lblProcessDescription: TLabel
      Left = 80
      Top = 13
      Width = 101
      Height = 13
      Caption = 'lblProcessDescription'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 175
    Width = 534
    Height = 41
    Align = alBottom
    TabOrder = 2
    object DelLabel: TLabel
      Left = 93
      Top = 14
      Width = 125
      Height = 13
      Caption = 'Delete these details ?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object OKBitBtn: TBitBtn
      Left = 229
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
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
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = OKBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 309
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
        7F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F0000FF7F7F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF007F7F
        007F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F00
        00FF00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        FFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7FFFFFFF7F7F7F7F7F7FFFFF
        FF007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00
        007F7F7F7F007F7F0000FF00007F00007F00007F00007F7F7F7F007F7F007F7F
        007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7FFFFF
        FF7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F00
        7F7F0000FF00007F00007F00007F00007F7F7F7F00007F00007F00007F00007F
        00007F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F
        7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF00
        7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00007F
        00007F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F00
        7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        0000FF00007F00007F00007F00007F00007F00007F7F7F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F00
        7F7F007F7F007F7F007F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F00007F00007F00007F00007F00007F7F7F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
        7F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
        7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F0000FF00007F00007F00007F00007F00007F7F7F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F7F7F7F00007F00
        007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00
        007F7F7F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F7F7F7FFFFF
        FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F0000FF00007F00007F7F7F7F007F7F007F7F007F7F0000FF00007F00007F
        00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F007F7F007F7F007F7F
        007F7F007F7F0000FF00007F00007F00007F007F7F007F7F007F7F007F7F007F
        7F007F7F7F7F7FFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F7F7F7FFFFFFF00
        7F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F0000FF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F00
        7F7F007F7F007F7F7F7F7FFFFFFFFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F7F7F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F}
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
      OnClick = CancelBitBtnClick
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 41
    Width = 534
    Height = 134
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object lblCostPrice: TLabel
      Left = 16
      Top = 44
      Width = 48
      Height = 13
      Caption = 'Cost Price'
    end
    object Label6: TLabel
      Left = 16
      Top = 76
      Width = 44
      Height = 13
      Caption = 'Sell Price'
    end
    object Label4: TLabel
      Left = 16
      Top = 110
      Width = 46
      Height = 13
      Caption = 'Price Unit'
    end
    object memCostPrice: TMemo
      Left = 80
      Top = 40
      Width = 89
      Height = 21
      TabOrder = 1
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateMoney3DP
      OnKeyPress = CheckKeyIsFloat
    end
    object memSellPrice: TMemo
      Left = 80
      Top = 72
      Width = 89
      Height = 21
      TabOrder = 2
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateMoney3DP
      OnKeyPress = CheckKeyIsFloat
    end
    object dblkpPriceUnit: TDBLookupComboBox
      Left = 80
      Top = 104
      Width = 145
      Height = 21
      KeyField = 'Price_Unit'
      ListField = 'Description'
      ListSource = dtsPriceUnit
      TabOrder = 3
      OnClick = CheckOK
    end
    object memDescription: TMemo
      Left = 80
      Top = 8
      Width = 417
      Height = 21
      Lines.Strings = (
        'memDescription')
      TabOrder = 0
      WantReturns = False
      WordWrap = False
      OnClick = CheckOK
    end
  end
  object qryPriceUnit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Price_Unit.Price_Unit,'
      '       Price_Unit.Description,'
      '       Price_Unit.Price_Unit_Factor'
      'from Price_Unit'
      'Order by Price_Unit.Description')
    Left = 168
    Top = 97
  end
  object dtsPriceUnit: TDataSource
    DataSet = qryPriceUnit
    Left = 240
    Top = 97
  end
  object qryGetCost: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Process_Cost_Category_Sub.Process,'
      '        Process_Cost_Category_Sub.Cost_Number,'
      '        Process_Cost_Category_Sub.Category_Number,'
      '        Process_Cost_Category_Sub.Sub_Category,'
      '        Process_Cost_Category_Sub.Cost_Description,'
      '        Process_Cost_Category_Sub.Unit_Cost,'
      '        Process_Cost_Category_Sub.Unit_Sell,'
      '        Process_Cost_Category_Sub.Price_Unit'
      'from Process_Cost_Category_Sub'
      'where Process = :Process and'
      'Customer = :Customer and'
      'Cost_Number = :Cost_Number and'
      'Category_Number = :Category_Number and'
      'Sub_Category = :Sub_Category')
    Left = 296
    Top = 8
    ParamData = <
      item
        Name = 'Process'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cost_Number'
      end
      item
        Name = 'Category_Number'
      end
      item
        Name = 'Sub_Category'
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Process_Cost_Category_Sub'
      '        (Customer,'
      '        Process,'
      '        Cost_Number,'
      '        Category_Number,'
      '        Sub_Category,'
      '        Cost_Description)'
      
        'Select :Customer, :Process, :Cost_Number, :Category_Number, ISNU' +
        'LL(Max(Sub_Category)+1,1), :GUID'
      
        'From Process_Cost_Category_Sub Where Customer = :Customer and Pr' +
        'ocess = :Process and Cost_Number = :Cost_Number and Category_Num' +
        'ber = :Category_Number'
      '')
    Left = 440
    Top = 72
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Cost_Number'
      end
      item
        Name = 'Category_Number'
      end
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Cost_Number'
      end
      item
        Name = 'Category_Number'
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Process_Cost_Category_Sub'
      'Set     Cost_Description = :Cost_Description,'
      '        Unit_Cost = :Unit_Cost,'
      '        Unit_Sell = :Unit_Sell,'
      '        Price_Unit = :Price_Unit'
      'Where'
      '(Customer = :Customer) and'
      '(Process = :Process) and'
      '(Cost_Number = :Cost_Number) and'
      '(Category_Number = :Category_Number) and'
      '(Sub_Category = :Sub_Category)'
      ''
      ' ')
    Left = 440
    Top = 8
    ParamData = <
      item
        Name = 'Cost_Description'
      end
      item
        Name = 'Unit_Cost'
      end
      item
        Name = 'Unit_Sell'
      end
      item
        Name = 'Price_Unit'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Cost_Number'
      end
      item
        Name = 'Category_Number'
      end
      item
        Name = 'Sub_Category'
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Process_Cost_Category_Sub'
      'Where'
      '  (Customer = :Customer) and'
      '  (Process = :Process) and'
      '  (Cost_Number = :Cost_Number) and'
      '  (Category_Number = :Category_Number) and'
      '  (Sub_Category) = :Sub_Category'
      '')
    Left = 376
    Top = 8
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Cost_Number'
      end
      item
        Name = 'Category_Number'
      end
      item
        Name = 'Sub_Category'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Product_Type'
      'Set     Description = :Description,'
      '        Short_Desc = :Short_Desc,'
      '        Nominal = :Nominal,'
      '        Category = :Category,'
      '        Narrative = :Narrative'
      ''
      'Where'
      '(Product_Type = :Product_Type) '
      '')
    Left = 376
    Top = 72
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Short_Desc'
      end
      item
        Name = 'Nominal'
      end
      item
        Name = 'Category'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Product_Type'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Process_Cost_Category_Sub'
      'where'
      'Customer = :Customer and'
      'Process = :Process and'
      'Cost_Number = :Cost_Number and'
      'Category_number = :Category_Number and'
      'Sub_Category = :Sub_Category')
    Left = 376
    Top = 128
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Cost_Number'
      end
      item
        Name = 'Category_Number'
      end
      item
        Name = 'Sub_Category'
      end>
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Sub_Category'
      'From Process_Cost_Category_Sub'
      
        'Where Cost_Description = :GUID and Customer = :Customer and Proc' +
        'ess = :Process and Cost_Number = :Cost_Number and Category_Numbe' +
        'r = :Category_Number')
    Left = 440
    Top = 128
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Cost_Number'
      end
      item
        Name = 'Category_Number'
      end>
  end
end
