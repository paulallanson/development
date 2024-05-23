object PBMaintProdCatsFrm: TPBMaintProdCatsFrm
  Left = 316
  Top = 151
  BorderStyle = bsDialog
  Caption = 'Maintain Product Type Categories'
  ClientHeight = 428
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 336
    Top = 41
    Width = 5
    Height = 346
    Align = alRight
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 387
    Width = 691
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      691
      41)
    object btbtnClose: TBitBtn
      Left = 599
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 691
    Height = 41
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 165
      Height = 13
      Caption = 'Select the category to maintain: '
    end
    object dblucmbbxCategories: TDBLookupComboBox
      Left = 168
      Top = 8
      Width = 145
      Height = 21
      KeyField = 'Category'
      ListField = 'Description'
      ListSource = dtsrcCategories
      TabOrder = 0
      OnCloseUp = dblucmbbxCategoriesCloseUp
      OnDropDown = dblucmbbxCategoriesDropDown
    end
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 41
    Width = 336
    Height = 346
    Align = alClient
    ParentBackground = False
    TabOrder = 2
    object dbgrdOut: TDBGrid
      Left = 1
      Top = 1
      Width = 334
      Height = 344
      Align = alClient
      DataSource = dtsrcNotInCat
      DrawingStyle = gdsGradient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'product_type'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'description'
          Title.Caption = 'Product Type'
          Width = 162
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'category'
          Title.Caption = 'Category'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'description_1'
          Title.Caption = 'Category'
          Visible = True
        end>
    end
  end
  object pnlRight: TPanel
    Left = 341
    Top = 41
    Width = 350
    Height = 346
    Align = alRight
    ParentBackground = False
    TabOrder = 3
    object pnlRight2: TPanel
      Left = 97
      Top = 1
      Width = 252
      Height = 344
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object dbgrdIn: TDBGrid
        Left = 0
        Top = 0
        Width = 252
        Height = 344
        Align = alClient
        DataSource = dtsrcInCat
        DrawingStyle = gdsGradient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'product_type'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'description'
            Title.Caption = 'Product Type'
            Width = 165
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'category'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'description_1'
            Title.Caption = 'Category'
            Width = 69
            Visible = True
          end>
      end
    end
    object pnlButtons: TPanel
      Left = 1
      Top = 1
      Width = 96
      Height = 344
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object btnAdd: TButton
        Left = 12
        Top = 152
        Width = 75
        Height = 25
        Caption = 'Add >>'
        TabOrder = 0
        OnClick = btnAddClick
      end
    end
  end
  object qrySelProdCatsFalse: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select product_type.product_type,'
      '  product_type.description,'
      '  product_type.category,'
      '  category.description'
      
        'from product_type join category on (product_type.category = cate' +
        'gory.category) '
      'where product_type.category <> :category '
      'order by product_type.description;'
      ' ')
    Left = 32
    Top = 81
    ParamData = <
      item
        Name = 'category'
        DataType = ftInteger
      end>
  end
  object qryProdCatsTrue: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select product_type.product_type,'
      '  product_type.description,'
      '  product_type.category,'
      '  category.description'
      
        'from product_type join category on (product_type.category = cate' +
        'gory.category) '
      'where product_type.category = :category '
      'order by product_type.description;')
    Left = 312
    Top = 81
    ParamData = <
      item
        Name = 'category'
        DataType = ftInteger
      end>
    object qryProdCatsTrueproduct_type: TIntegerField
      FieldName = 'product_type'
    end
    object qryProdCatsTruedescription: TWideStringField
      FieldName = 'description'
      FixedChar = True
      Size = 80
    end
    object qryProdCatsTruecategory: TIntegerField
      FieldName = 'category'
    end
    object qryProdCatsTruedescription_1: TWideStringField
      FieldName = 'description_1'
      FixedChar = True
      Size = 80
    end
  end
  object qrySelCategories: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from category'
      'order by Category.Description')
    Left = 352
    Top = 8
  end
  object dtsrcCategories: TDataSource
    DataSet = qrySelCategories
    Left = 392
    Top = 8
  end
  object dtsrcNotInCat: TDataSource
    DataSet = qrySelProdCatsFalse
    Left = 72
    Top = 81
  end
  object dtsrcInCat: TDataSource
    DataSet = qryProdCatsTrue
    Left = 355
    Top = 82
  end
  object qryUpdProdType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update product_type '
      'set '
      'category = :category '
      'where product_type = :product_type;')
    Left = 409
    Top = 194
    ParamData = <
      item
        Name = 'category'
      end
      item
        Name = 'product_type'
      end>
  end
end
