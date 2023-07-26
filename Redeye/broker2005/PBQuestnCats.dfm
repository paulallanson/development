object PBQuestnCatsFrm: TPBQuestnCatsFrm
  Left = 415
  Top = 133
  BorderStyle = bsDialog
  Caption = 'Questions For Categories'
  ClientHeight = 446
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    489
    446)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 47
    Height = 13
    Caption = 'Questions'
  end
  object Label2: TLabel
    Left = 322
    Top = 8
    Width = 64
    Height = 13
    Anchors = [akRight]
    Caption = 'Product Type'
  end
  object QuestnDBGrid: TDBGrid
    Left = 16
    Top = 24
    Width = 291
    Height = 402
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = QuestnsDS
    Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = QuestnDBGridCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Question_Text'
        Title.Caption = 'Text'
        Width = 160
        Visible = True
      end>
  end
  object dblkpProductType: TDBLookupComboBox
    Left = 322
    Top = 25
    Width = 145
    Height = 21
    Anchors = [akRight]
    KeyField = 'Product_type'
    ListField = 'Description'
    ListSource = dtsProdType
    TabOrder = 1
    OnClick = dblkpProductTypeClick
  end
  object CloseBitBtn: TBitBtn
    Left = 392
    Top = 403
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 2
    Kind = bkClose
  end
  object OKBitBtn: TBitBtn
    Left = 392
    Top = 371
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Add'
    Default = True
    TabOrder = 3
    OnClick = OKBitBtnClick
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
  end
  object AddMemo: TMemo
    Left = 321
    Top = 254
    Width = 145
    Height = 89
    Anchors = [akRight, akBottom]
    Enabled = False
    Lines.Strings = (
      'Click ADD to add the '
      'selected question(s) onto all '
      'the product groups in the '
      'selected category.'
      'Note that this action cannot '
      'be undone.')
    TabOrder = 4
  end
  object GetQuestnsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Question'
      'Order By Sequence_Reference'
      ' ')
    Left = 104
    Top = 72
  end
  object QuestnsDS: TDataSource
    DataSet = GetQuestnsSQL
    Left = 57
    Top = 120
  end
  object GetCatsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Category, Description'
      'From Category'
      'Order By Description')
    Left = 40
    Top = 320
  end
  object CatsDS: TDataSource
    DataSet = GetCatsSQL
    Left = 105
    Top = 320
  end
  object GetCatsProdTypesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Product_Type'
      'From Product_Type'
      'Where Category = :Category')
    Left = 344
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Category'
        ParamType = ptUnknown
      end>
  end
  object GetLastNoSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Question) as Last_No'
      'From Product_TypeQuestion'
      'Where (Product_Type = :Product_Type)')
    Left = 48
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Product_TypeQuestion'
      
        '(Product_Type, Question, Question_Text, Sequence_Reference, Prom' +
        'pt_Type, Question_Category)'
      'Values'
      
        '(:Product_Type, :Question, :Question_Text, :Sequence_Reference, ' +
        ':Prompt_Type, :Question_Category)')
    Left = 216
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Question'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Question_Text'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sequence_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Prompt_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Question_Category'
        ParamType = ptUnknown
      end>
  end
  object AddQListSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Product_TypeQList'
      '(Product_Type, Question, Question_List_No, Question_List_Descr)'
      
        'Select :Product_Type, :PT_Question, Question_List_No, Question_L' +
        'ist_Descr'
      'From QList'
      'Where (Question = :Question)')
    Left = 152
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PT_Question'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Question'
        ParamType = ptUnknown
      end>
  end
  object qryProdType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Product_Type, Description'
      'From Product_Type'
      'Order By Description')
    Left = 224
    Top = 32
  end
  object dtsProdType: TDataSource
    DataSet = qryProdType
    Left = 289
    Top = 32
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
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end>
  end
end
