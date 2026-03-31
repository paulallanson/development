object frmWTLUQuoteSQL: TfrmWTLUQuoteSQL
  Left = 254
  Top = 117
  Caption = 'Quotes'
  ClientHeight = 636
  ClientWidth = 1289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 595
    Width = 1289
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 99
      Height = 17
      Caption = 'Customer Search'
    end
    object edtSearch: TEdit
      Left = 120
      Top = 8
      Width = 169
      Height = 25
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 998
      Top = 1
      Width = 290
      Height = 39
      Align = alRight
      Alignment = taRightJustify
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        290
        39)
      object Label3: TLabel
        Left = 10
        Top = 12
        Width = 88
        Height = 17
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'Quote Number'
      end
      object edtNumber: TEdit
        Left = 105
        Top = 8
        Width = 73
        Height = 25
        Anchors = [akRight, akBottom]
        TabOrder = 0
      end
      object Button1: TButton
        Left = 207
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Close'
        TabOrder = 1
      end
    end
    object btnSearch: TBitBtn
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Search'
      TabOrder = 2
    end
    object chkbxHighImportance: TCheckBox
      Left = 384
      Top = 12
      Width = 241
      Height = 17
      Caption = 'Show only high importance quotes'
      TabOrder = 3
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 1289
    Height = 595
    Align = alClient
    DataSource = dtmdlQuote.dtsAllQuotes
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Quote'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Raised'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer_name'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 203
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Reference'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Supply_Price'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Install_Price'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Survey_price'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Delivery_Price'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Required'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Material_Description'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Contact_Name'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status_Text'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Is_Retail_Customer'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quote_Reference'
        Visible = True
      end>
  end
end
