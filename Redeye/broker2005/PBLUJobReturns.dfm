object frmPBLUJobReturns: TfrmPBLUJobReturns
  Left = 118
  Top = 111
  Width = 959
  Height = 467
  Caption = 'Job Returns'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object stsBrDetails: TStatusBar
    Left = 0
    Top = 414
    Width = 951
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 373
    Width = 951
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Panel2: TPanel
      Left = 677
      Top = 1
      Width = 273
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        273
        39)
      object Label2: TLabel
        Left = 14
        Top = 13
        Width = 57
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Job Number'
      end
      object btnClose: TButton
        Left = 192
        Top = 7
        Width = 75
        Height = 25
        Caption = 'Clos&e'
        TabOrder = 0
        OnClick = btnCloseClick
      end
      object edtNumber: TEdit
        Left = 87
        Top = 9
        Width = 90
        Height = 21
        Anchors = [akRight, akBottom]
        TabOrder = 1
      end
    end
  end
  object Panel3: TPanel
    Left = 856
    Top = 105
    Width = 95
    Height = 268
    Align = alRight
    TabOrder = 2
    object btnReturns: TButton
      Left = 12
      Top = 15
      Width = 75
      Height = 25
      Caption = '&Returns'
      TabOrder = 0
      OnClick = btnReturnsClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 951
    Height = 105
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      951
      105)
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Product'
    end
    object lblProduct: TLabel
      Left = 96
      Top = 16
      Width = 47
      Height = 13
      Caption = 'lblProduct'
    end
    object Label3: TLabel
      Left = 24
      Top = 40
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object lblDescription: TLabel
      Left = 96
      Top = 40
      Width = 63
      Height = 13
      Caption = 'lblDescription'
    end
    object Label6: TLabel
      Left = 24
      Top = 64
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object lblCustomer: TLabel
      Left = 96
      Top = 64
      Width = 63
      Height = 13
      Caption = 'lblDescription'
    end
    object GroupBox1: TGroupBox
      Left = 664
      Top = 8
      Width = 273
      Height = 93
      Anchors = [akTop, akRight]
      Caption = 'Current Production Quantities'
      TabOrder = 0
      object Label4: TLabel
        Left = 17
        Top = 24
        Width = 52
        Height = 13
        Caption = 'Requested'
      end
      object Label5: TLabel
        Left = 18
        Top = 48
        Width = 58
        Height = 13
        Caption = 'Despatched'
      end
      object lblQtyOrdered: TLabel
        Left = 153
        Top = 24
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'lblQtyOrdered'
      end
      object lblQtyDespatched: TLabel
        Left = 133
        Top = 48
        Width = 84
        Height = 13
        Alignment = taRightJustify
        Caption = 'lblQtyDespatched'
      end
      object Label7: TLabel
        Left = 18
        Top = 72
        Width = 76
        Height = 13
        Caption = 'Projected Overs'
      end
      object lblQtyOvers: TLabel
        Left = 163
        Top = 72
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'lblQtyOvers'
      end
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 105
    Width = 856
    Height = 268
    Align = alClient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Job_Bag'
        Title.Caption = 'Job Bag'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer_Name'
        Title.Caption = 'Customer'
        Width = 197
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Part'
        Title.Caption = 'Product'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Part_Description'
        Title.Caption = 'Description'
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qty_to_Return'
        Title.Caption = 'Qty to Return'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rep_Name'
        Title.Caption = 'Rep'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Account_Manager'
        Title.Caption = 'Account Manager'
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Goods_Required'
        Title.Caption = 'Required Date'
        Width = 79
        Visible = True
      end>
  end
  object qryPart: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select  Part.Part,'
      '        Part.Part_Description,'
      '        Customer.Name as Customer_Name,'
      '        Part.Customer'
      'from Part, Customer'
      'where Part.Part = :Part and'
      'part.customer = customer.customer')
    Left = 616
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
end
