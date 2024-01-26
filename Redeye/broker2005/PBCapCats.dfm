object PBCapCatsFrm: TPBCapCatsFrm
  Left = 436
  Top = 119
  BorderStyle = bsDialog
  Caption = 'Capabilities For Categories'
  ClientHeight = 422
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    454
    422)
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 60
    Height = 13
    Caption = 'Capabilities'
  end
  object Label2: TLabel
    Left = 302
    Top = 8
    Width = 66
    Height = 13
    Anchors = [akRight]
    Caption = 'Product Type'
  end
  object CapDBGrid: TDBGrid
    Left = 16
    Top = 24
    Width = 265
    Height = 385
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = CapsDS
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnCellClick = CapDBGridCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Description'
        Title.Caption = 'Text'
        Width = 160
        Visible = True
      end>
  end
  object CloseBitBtn: TBitBtn
    Left = 363
    Top = 381
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 1
  end
  object OKBitBtn: TBitBtn
    Left = 363
    Top = 349
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Add'
    Default = True
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
    TabOrder = 2
    OnClick = OKBitBtnClick
  end
  object AddMemo: TMemo
    Left = 302
    Top = 245
    Width = 137
    Height = 89
    Anchors = [akRight, akBottom]
    Enabled = False
    Lines.Strings = (
      'Click ADD to add the '
      'selected capabilities(s) '
      'onto '
      'all the product groups '
      'in the '
      'selected category.'
      'Note that this action '
      'cannot '
      'be undone.')
    TabOrder = 3
  end
  object dblkpProductType: TDBLookupComboBox
    Left = 301
    Top = 25
    Width = 145
    Height = 21
    Anchors = [akRight]
    KeyField = 'Product_type'
    ListField = 'Description'
    ListSource = dtsProdType
    TabOrder = 4
    OnClick = dblkpProductTypeClick
  end
  object GetCapsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Capability'
      'Order By Description'
      ' ')
    Left = 104
    Top = 72
  end
  object CapsDS: TDataSource
    DataSet = GetCapsSQL
    Left = 57
    Top = 120
  end
  object GetCatsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Category, Description'
      'From Category'
      'Order By Description')
    Left = 216
    Top = 88
  end
  object CatsDS: TDataSource
    DataSet = GetCatsSQL
    Left = 265
    Top = 128
  end
  object GetCatsProdTypesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Product_Type'
      'From Product_Type'
      'Where Category = :Category')
    Left = 112
    Top = 152
    ParamData = <
      item
        Name = 'Category'
      end>
  end
  object GetLastNoSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Capability) as Last_No'
      'From Product_TypeCapability'
      'Where (Product_Type = :Product_Type)')
    Left = 128
    Top = 184
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Product_TypeCapability'
      '(Product_Type, Capability, Description)'
      'Values'
      '(:Product_Type, :Capability, :Description)'
      '')
    Left = 216
    Top = 160
    ParamData = <
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Capability'
      end
      item
        Name = 'Description'
      end>
  end
  object qryProdType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Product_Type, Description'
      'From Product_Type'
      'Order By Description')
    Left = 128
    Top = 24
  end
  object dtsProdType: TDataSource
    DataSet = qryProdType
    Left = 201
    Top = 24
  end
  object qryGetProductType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Product_Type'
      'From Product_Type'
      'Where Product_Type = :Product_Type'
      '')
    Left = 344
    Top = 160
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
end
