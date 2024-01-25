object frmPBLUJobReturns: TfrmPBLUJobReturns
  Left = 118
  Top = 111
  Caption = 'Job Returns'
  ClientHeight = 428
  ClientWidth = 943
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object stsBrDetails: TStatusBar
    Left = 0
    Top = 409
    Width = 943
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
    Top = 368
    Width = 943
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    object Panel2: TPanel
      Left = 669
      Top = 1
      Width = 273
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        273
        39)
      object Label2: TLabel
        Left = 14
        Top = 13
        Width = 62
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
    Left = 848
    Top = 105
    Width = 95
    Height = 263
    Align = alRight
    ParentBackground = False
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
    Width = 943
    Height = 105
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    DesignSize = (
      943
      105)
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 40
      Height = 13
      Caption = 'Product'
    end
    object lblProduct: TLabel
      Left = 96
      Top = 16
      Width = 53
      Height = 13
      Caption = 'lblProduct'
    end
    object Label3: TLabel
      Left = 24
      Top = 40
      Width = 59
      Height = 13
      Caption = 'Description'
    end
    object lblDescription: TLabel
      Left = 96
      Top = 40
      Width = 72
      Height = 13
      Caption = 'lblDescription'
    end
    object Label6: TLabel
      Left = 24
      Top = 64
      Width = 49
      Height = 13
      Caption = 'Customer'
    end
    object lblCustomer: TLabel
      Left = 96
      Top = 64
      Width = 72
      Height = 13
      Caption = 'lblDescription'
    end
    object GroupBox1: TGroupBox
      Left = 658
      Top = 8
      Width = 273
      Height = 93
      Anchors = [akTop, akRight]
      Caption = 'Current Production Quantities'
      ParentBackground = False
      TabOrder = 0
      object Label4: TLabel
        Left = 17
        Top = 24
        Width = 55
        Height = 13
        Caption = 'Requested'
      end
      object Label5: TLabel
        Left = 18
        Top = 48
        Width = 61
        Height = 13
        Caption = 'Despatched'
      end
      object lblQtyOrdered: TLabel
        Left = 144
        Top = 24
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'lblQtyOrdered'
      end
      object lblQtyDespatched: TLabel
        Left = 126
        Top = 48
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = 'lblQtyDespatched'
      end
      object Label7: TLabel
        Left = 18
        Top = 72
        Width = 80
        Height = 13
        Caption = 'Projected Overs'
      end
      object lblQtyOvers: TLabel
        Left = 158
        Top = 72
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = 'lblQtyOvers'
      end
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 105
    Width = 848
    Height = 263
    Align = alClient
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
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
  object qryPart: TFDQuery
    ConnectionName = 'pb'
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
        Name = 'Part'
      end>
  end
end
