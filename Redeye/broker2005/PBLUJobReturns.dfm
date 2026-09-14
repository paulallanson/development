object frmPBLUJobReturns: TfrmPBLUJobReturns
  Left = 118
  Top = 111
  Caption = 'Job Returns'
  ClientHeight = 428
  ClientWidth = 943
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 17
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
    ExplicitTop = 400
    ExplicitWidth = 937
  end
  object Panel1: TPanel
    Left = 0
    Top = 368
    Width = 943
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 359
    ExplicitWidth = 937
    object Panel2: TPanel
      Left = 669
      Top = 1
      Width = 273
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 663
      DesignSize = (
        273
        39)
      object Label2: TLabel
        Left = 5
        Top = 13
        Width = 73
        Height = 17
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
        Height = 25
        Anchors = [akRight, akBottom]
        TabOrder = 1
      end
    end
  end
  object Panel3: TPanel
    Left = 848
    Top = 114
    Width = 95
    Height = 254
    Align = alRight
    ParentBackground = False
    TabOrder = 2
    ExplicitLeft = 842
    ExplicitTop = 105
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
    Height = 114
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    DesignSize = (
      943
      114)
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 45
      Height = 17
      Caption = 'Product'
    end
    object lblProduct: TLabel
      Left = 96
      Top = 16
      Width = 59
      Height = 17
      Caption = 'lblProduct'
    end
    object Label3: TLabel
      Left = 24
      Top = 40
      Width = 66
      Height = 17
      Caption = 'Description'
    end
    object lblDescription: TLabel
      Left = 96
      Top = 40
      Width = 80
      Height = 17
      Caption = 'lblDescription'
    end
    object Label6: TLabel
      Left = 24
      Top = 64
      Width = 56
      Height = 17
      Caption = 'Customer'
    end
    object lblCustomer: TLabel
      Left = 96
      Top = 64
      Width = 80
      Height = 17
      Caption = 'lblDescription'
    end
    object GroupBox1: TGroupBox
      Left = 652
      Top = 8
      Width = 273
      Height = 93
      Anchors = [akTop, akRight]
      Caption = 'Current Production Quantities'
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 646
      object Label4: TLabel
        Left = 17
        Top = 24
        Width = 62
        Height = 17
        Caption = 'Requested'
      end
      object Label5: TLabel
        Left = 18
        Top = 48
        Width = 69
        Height = 17
        Caption = 'Despatched'
      end
      object lblQtyOrdered: TLabel
        Left = 149
        Top = 24
        Width = 84
        Height = 17
        Alignment = taRightJustify
        Caption = 'lblQtyOrdered'
      end
      object lblQtyDespatched: TLabel
        Left = 130
        Top = 48
        Width = 103
        Height = 17
        Alignment = taRightJustify
        Caption = 'lblQtyDespatched'
      end
      object Label7: TLabel
        Left = 18
        Top = 72
        Width = 93
        Height = 17
        Caption = 'Projected Overs'
      end
      object lblQtyOvers: TLabel
        Left = 165
        Top = 72
        Width = 68
        Height = 17
        Alignment = taRightJustify
        Caption = 'lblQtyOvers'
      end
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 114
    Width = 848
    Height = 254
    Align = alClient
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
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
