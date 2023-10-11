object WTopMainFrm: TWTopMainFrm
  Left = 34
  Top = 48
  Width = 741
  Height = 478
  Caption = 'Maintain Worktop Details'
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 481
    Top = 49
    Width = 252
    Height = 402
    Align = alRight
    TabOrder = 0
    object DBText1: TDBText
      Left = 16
      Top = 144
      Width = 65
      Height = 17
      DataField = 'Thickness_Desc'
      DataSource = WorkTop_ThickSrc
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 16
      Top = 168
      Width = 233
      Height = 17
      DataField = 'Description'
      DataSource = WorkTopSrc
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DBGrid2: TDBGrid
      Left = 16
      Top = 40
      Width = 161
      Height = 153
      Columns = <
        item
          FieldName = 'Thickness_Desc'
          Title.Caption = 'Thickness'
          Width = 98
        end>
      DataSource = WorkTop_ThickSrc
      TabOrder = 0
      TitleFont.Color = clBlack
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object DBNavigator2: TDBNavigator
      Left = 16
      Top = 8
      Width = 145
      Height = 25
      DataSource = WorkTop_ThickSrc
      VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 256
      Width = 250
      Height = 145
      Align = alBottom
      TabOrder = 2
      object Label2: TLabel
        Left = 38
        Top = 32
        Width = 31
        Height = 16
        Caption = 'Price'
      end
      object Label3: TLabel
        Left = 42
        Top = 88
        Width = 27
        Height = 16
        Caption = 'Cost'
      end
      object Label4: TLabel
        Left = 8
        Top = 120
        Width = 61
        Height = 16
        Caption = 'Sales Unit'
      end
      object Label5: TLabel
        Left = 48
        Top = 56
        Width = 20
        Height = 16
        Caption = 'per'
      end
      object DBText3: TDBText
        Left = 80
        Top = 56
        Width = 145
        Height = 17
        DataField = 'Price_Basis_Desc'
        DataSource = Worktop_PriceSRC
      end
      object DBEdit1: TDBEdit
        Left = 80
        Top = 24
        Width = 81
        Height = 24
        DataField = 'Unit_Price'
        DataSource = Worktop_PriceSRC
        Enabled = False
        MaxLength = 0
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 80
        Top = 80
        Width = 81
        Height = 24
        DataField = 'Unit_Cost'
        DataSource = Worktop_PriceSRC
        Enabled = False
        MaxLength = 0
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 80
        Top = 112
        Width = 81
        Height = 24
        DataField = 'Sales_Unit'
        DataSource = Worktop_PriceSRC
        Enabled = False
        MaxLength = 0
        TabOrder = 2
      end
      object BitBtn3: TBitBtn
        Left = 168
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Change'
        TabOrder = 3
        OnClick = BitBtn3Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 733
    Height = 49
    Align = alTop
    Caption = 'Panel2'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 88
      Height = 33
      Caption = 'Worktops'
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBNavigator1: TDBNavigator
      Left = 264
      Top = 16
      Width = 145
      Height = 25
      DataSource = WorkTopSrc
      VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 481
    Height = 402
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 479
      Height = 400
      Align = alClient
      Columns = <
        item
          FieldName = 'Description'
          Width = 217
        end
        item
          FieldName = 'Mat_Desc'
          Title.Caption = 'Material Type'
          Width = 107
        end
        item
          FieldName = 'Stocked'
          Title.Caption = 'Stocked (Y/N)'
          Width = 91
        end>
      DataSource = WorkTopSrc
      TabOrder = 0
      TitleFont.Color = clBlack
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object WorkTop: TFDTable
    OnNewRecord = WorkTopNewRecord
    ConnectionName = 'worktop'
    IndexFieldNames = 'Description'
    TableName = 'Worktop'
    Left = 32
    Top = 104
    object WorkTopMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
    end
    object WorkTopMat_Desc: TStringField
      FieldName = 'Mat_Desc'
      Lookup = True
      LookupDataSet = MatLU
      LookupKeyFields = 'Material_Type'
      LookupResultField = 'Description'
      KeyFields = 'Material_Type'
      Size = 15
    end
    object WorkTopWorktop: TStringField
      FieldName = 'Worktop'
      Size = 16
    end
    object WorkTopDescription: TStringField
      FieldName = 'Description'
      Size = 80
    end
    object WorkTopStocked: TStringField
      FieldName = 'Stocked'
      Size = 2
    end
    object WorkTopUse_For_Estimating: TStringField
      FieldName = 'Use_For_Estimating'
      Size = 2
    end
  end
  object WorkTopSrc: TDataSource
    DataSet = WorkTop
    Left = 88
    Top = 104
  end
  object WorkTop_Thick: TFDTable
    AfterInsert = WorkTop_ThickAfterInsert
    OnNewRecord = WorkTop_ThickNewRecord
    ConnectionName = 'worktop'
    IndexFieldNames = 'Worktop;Thickness'
    MasterFields = 'Worktop'
    MasterSource = WorkTopSrc
    TableName = 'Worktop_Thickness'
    Left = 440
    Top = 152
    object WorkTop_ThickThickness: TSmallintField
      FieldName = 'Thickness'
    end
    object WorkTop_ThickPrice_Pointer: TIntegerField
      FieldName = 'Price_Pointer'
    end
    object WorkTop_ThickThickness_Desc: TStringField
      FieldName = 'Thickness_Desc'
      Lookup = True
      LookupDataSet = ThicknessLU
      LookupKeyFields = 'Thickness'
      LookupResultField = 'Thickness_mm'
      KeyFields = 'Thickness'
      Size = 15
    end
    object WorkTop_ThickWorktop: TStringField
      FieldName = 'Worktop'
      Size = 16
    end
  end
  object WorkTop_ThickSrc: TDataSource
    DataSet = WorkTop_Thick
    Left = 424
    Top = 104
  end
  object Worktop_Price: TFDTable
    ConnectionName = 'worktop'
    IndexFieldNames = 'Price_Pointer'
    MasterFields = 'Price_Pointer'
    MasterSource = WorkTop_ThickSrc
    TableName = 'Prices'
    Left = 184
    Top = 216
    object Worktop_PricePrice_Pointer: TIntegerField
      FieldName = 'Price_Pointer'
    end
    object Worktop_PriceEffective_Date: TDateTimeField
      FieldName = 'Effective_Date'
    end
    object Worktop_PriceUnit_Price: TFloatField
      FieldName = 'Unit_Price'
      Currency = True
    end
    object Worktop_PriceUnit_Cost: TFloatField
      FieldName = 'Unit_Cost'
      Currency = True
    end
    object Worktop_PriceSales_Unit: TIntegerField
      FieldName = 'Sales_Unit'
    end
    object Worktop_PriceDate_Changed: TDateTimeField
      FieldName = 'Date_Changed'
    end
    object Worktop_PriceCost_Unit: TIntegerField
      FieldName = 'Cost_Unit'
    end
    object Worktop_PricePrice_Basis_Desc: TStringField
      FieldName = 'Price_Basis_Desc'
      Lookup = True
      LookupDataSet = WorkTopDataMod.Price_BasisLU
      LookupKeyFields = 'Price_Basis'
      LookupResultField = 'Description'
      KeyFields = 'Price_Basis'
    end
    object Worktop_PriceMason_Cost: TFloatField
      FieldName = 'Mason_Cost'
    end
    object Worktop_PricePrice_Basis: TStringField
      FieldName = 'Price_Basis'
      Size = 2
    end
    object Worktop_PriceChanged_By: TStringField
      FieldName = 'Changed_By'
      Size = 60
    end
    object Worktop_PricePiece_Cost: TFloatField
      FieldName = 'Piece_Cost'
    end
  end
  object Worktop_PriceSRC: TDataSource
    DataSet = PriceSQL
    Left = 128
    Top = 248
  end
  object MaxWTSQL: TFDQuery
    ConnectionName = 'worktop'
    SQL.Strings = (
      'select max(val(worktop))+1'
      'from worktop')
    Left = 240
    Top = 128
  end
  object ThicknessLU: TFDQuery
    Filtered = True
    OnFilterRecord = ThicknessLUFilterRecord
    ConnectionName = 'worktop'
    MasterSource = WorkTopSrc
    SQL.Strings = (
      'select * '
      'from thickness')
    Left = 616
    Top = 136
    object ThicknessLUThickness: TSmallintField
      FieldName = 'Thickness'
    end
    object ThicknessLUThickness_mm: TStringField
      FieldName = 'Thickness_mm'
      Size = 10
    end
    object ThicknessLUPrice_Pointer: TIntegerField
      FieldName = 'Price_Pointer'
    end
    object ThicknessLUMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
    end
  end
  object MatLU: TFDQuery
    ConnectionName = 'worktop'
    SQL.Strings = (
      'select * from Material_Type')
    Left = 312
    Top = 136
  end
  object MatSRC: TDataSource
    DataSet = MatLU
    Left = 312
    Top = 184
  end
  object PriceSQL: TFDQuery
    ConnectionName = 'worktop'
    MasterSource = WorkTop_ThickSrc
    Params.Data = {010001000D50726963655F506F696E74657200030400000000000100}
    SQL.Strings = (
      'select Prices.*, Description as Price_Basis_Desc'
      'from Prices, Price_Basis'
      'where'
      '('
      '((Prices.Price_Pointer)=:Price_Pointer) AND'
      '((Prices.Effective_Date)<=Now())'
      ') AND'
      'Prices.Price_Basis = Price_Basis.Price_Basis'
      'order by effective_Date desc')
    Left = 224
    Top = 264
    object PriceSQLPrice_Pointer: TIntegerField
      FieldName = 'Price_Pointer'
    end
    object PriceSQLEffective_Date: TDateTimeField
      FieldName = 'Effective_Date'
    end
    object PriceSQLUnit_Price: TFloatField
      FieldName = 'Unit_Price'
      Currency = True
    end
    object PriceSQLUnit_Cost: TFloatField
      FieldName = 'Unit_Cost'
      Currency = True
    end
    object PriceSQLSales_Unit: TIntegerField
      FieldName = 'Sales_Unit'
    end
    object PriceSQLDate_Changed: TDateTimeField
      FieldName = 'Date_Changed'
    end
    object PriceSQLCost_Unit: TIntegerField
      FieldName = 'Cost_Unit'
    end
    object PriceSQLPiece_Cost: TFloatField
      FieldName = 'Piece_Cost'
    end
    object PriceSQLMason_Cost: TFloatField
      FieldName = 'Mason_Cost'
    end
    object PriceSQLPrice_Basis_Desc: TStringField
      FieldName = 'Price_Basis_Desc'
      Size = 40
    end
    object PriceSQLPrice_Basis: TStringField
      FieldName = 'Price_Basis'
      Size = 1
    end
    object PriceSQLChanged_By: TStringField
      FieldName = 'Changed_By'
      Size = 30
    end
    object PriceSQLPiece_Basis: TStringField
      FieldName = 'Piece_Basis'
      Size = 1
    end
    object PriceSQLMason_Basis: TStringField
      FieldName = 'Mason_Basis'
      Size = 1
    end
  end
end
