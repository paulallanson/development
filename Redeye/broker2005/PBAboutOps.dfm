object PBAboutOpsFrm: TPBAboutOpsFrm
  Left = 340
  Top = 109
  Caption = 'Purchase Ordering Authorisation Levels'
  ClientHeight = 418
  ClientWidth = 679
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
    Width = 679
    Height = 137
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      679
      137)
    object GroupBox1: TGroupBox
      Left = 8
      Top = 5
      Width = 661
      Height = 124
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Your Purchase Order Settings'
      ParentBackground = False
      TabOrder = 0
      object lblName: TLabel
        Left = 16
        Top = 24
        Width = 32
        Height = 13
        Caption = 'Name:'
      end
      object lblPOCost: TLabel
        Left = 16
        Top = 48
        Width = 142
        Height = 13
        Caption = 'Max Unauthorised PO Cost:'
      end
      object lblMinSales: TLabel
        Left = 16
        Top = 74
        Width = 83
        Height = 13
        Caption = 'Min Sales Value:'
      end
      object lblAuthoriseLevel: TLabel
        Left = 16
        Top = 98
        Width = 102
        Height = 13
        Caption = 'Authorisation Level:'
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 377
    Width = 679
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      679
      41)
    object Button1: TButton
      Left = 587
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 137
    Width = 679
    Height = 240
    Align = alClient
    DataSource = dtsOperator
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'Can_Authorise_Desc'
        Title.Caption = 'Authorisation Level'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'max_unauthorised_po_value'
        Title.Caption = 'Max PO Cost Value'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'min_po_sales_Value'
        Title.Caption = 'Min PO Sales Value'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sales_Value_Type_Desc'
        Title.Caption = 'Value Type'
        Width = 98
        Visible = True
      end>
  end
  object qryOperator: TFDQuery
    OnCalcFields = qryOperatorCalcFields
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'operator, '
      #9'Name, '
      #9'can_authorise_po,'
      #9'max_unauthorised_po_value, '
      #9'min_po_sales_Value, '
      #9'min_po_sales_value_type,'
      #9'delete_po_from_job_bag,'
      #9'override_paid_stock'
      'from operator'
      'where operator_can_login = '#39'Y'#39' and'
      '((can_authorise_po = '#39'P'#39') or (can_authorise_po = '#39'F'#39'))'
      'order by can_authorise_po, name')
    Left = 392
    Top = 72
    object qryOperatoroperator: TIntegerField
      FieldName = 'operator'
    end
    object qryOperatorName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object qryOperatorcan_authorise_po: TStringField
      FieldName = 'can_authorise_po'
      FixedChar = True
      Size = 2
    end
    object qryOperatormax_unauthorised_po_value: TCurrencyField
      FieldName = 'max_unauthorised_po_value'
    end
    object qryOperatormin_po_sales_Value: TCurrencyField
      FieldName = 'min_po_sales_Value'
      currency = False
    end
    object qryOperatormin_po_sales_value_type: TStringField
      FieldName = 'min_po_sales_value_type'
      FixedChar = True
      Size = 2
    end
    object qryOperatordelete_po_from_job_bag: TStringField
      FieldName = 'delete_po_from_job_bag'
      FixedChar = True
      Size = 2
    end
    object qryOperatoroverride_paid_stock: TStringField
      FieldName = 'override_paid_stock'
      FixedChar = True
      Size = 2
    end
    object qryOperatorCan_Authorise_Desc: TStringField
      FieldKind = fkCalculated
      FieldName = 'Can_Authorise_Desc'
      Calculated = True
    end
    object qryOperatorSales_Value_Type_Desc: TStringField
      FieldKind = fkCalculated
      FieldName = 'Sales_Value_Type_Desc'
      Calculated = True
    end
  end
  object dtsOperator: TDataSource
    DataSet = qryOperator
    Left = 328
    Top = 80
  end
end
