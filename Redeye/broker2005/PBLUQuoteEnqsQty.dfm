object PBLUQuoteEnqsQtyFrm: TPBLUQuoteEnqsQtyFrm
  Left = 192
  Top = 114
  Caption = 'Lookup Enquiry Details'
  ClientHeight = 410
  ClientWidth = 834
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 347
    Width = 834
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      834
      41)
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 96
      Height = 13
      Caption = 'Description Search'
    end
    object btnClose: TButton
      Left = 753
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 1
      OnClick = btnCloseClick
    end
    object edtSearch: TEdit
      Left = 104
      Top = 12
      Width = 180
      Height = 21
      TabOrder = 0
      OnChange = edtSearchChange
    end
    object btnSelect: TButton
      Left = 665
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Select'
      TabOrder = 2
      OnClick = btnSelectClick
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 388
    Width = 834
    Height = 22
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 834
    Height = 347
    Align = alClient
    DataSource = dtmdlEnqs.dtsEnqsJB
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Enquiry'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Point'
        Title.Caption = 'Date'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Form_Description'
        Title.Caption = 'Description'
        Width = 313
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Supplier_Price'
        Title.Caption = 'Cost Price'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quotation_Price'
        Title.Caption = 'Sell Price'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price_Unit_Description'
        Title.Caption = 'Price Unit'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Supplier_Name'
        Title.Caption = 'Supplier'
        Width = 153
        Visible = True
      end>
  end
  object qryCustEnquiryQtys: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '  enquiry_linequantity.Enquiry,'
      '  enquiry_linequantity.Line,'
      '  enquiry_linequantity.Quantity,'
      '  enquiry_linequantity.supplier_price,'
      #9'enquiry_linequantity.Quotation_Price,'
      '  enquiry_linequantity.price_unit,'
      #9'Price_Unit.Price_unit_Factor,'
      #9'Price_unit.Description as Price_Unit_description,'
      #9'Supplier.name as Supplier_Name,'
      #9'Enquiry.customer,'
      #9'Enquiry.Branch_no,'
      #9'Enquiry.Date_Point,'
      #9'Enquiry.Quote_Required_By,'
      #9'Enquiryline.Form_Description,'
      #9'Enquiry.Enquiry_Status,'
      #9'Enquiry.Enq_Inactive,'
      #9'EnquiryLine.Product_Type,'
      #9'Product_Type.Description as Product_Type_Description'
      
        'from enquiry_linequantity, enquiry, enquiryline, supplier, price' +
        '_unit, Product_type'
      'where enquiry_linequantity.enquiry = enquiry.enquiry and'
      '('
      '(enquiry_linequantity.enquiry = enquiryline.enquiry) and'
      '(enquiry_linequantity.line = enquiryline.line)'
      ') and'
      'enquiry_linequantity.price_unit = price_unit.price_unit and'
      '('
      '(enquiry_linequantity.supplier = supplier.supplier)'
      ') and'
      '(EnquiryLine.Product_Type = Product_Type.Product_Type) and'
      '(EnquiryLine.Enquiry_Status < 85) and'
      '('
      
        '(enquiry_linequantity.Enquiry not in (select Enquiry from Quote_' +
        'Supply)) or'
      
        '(enquiry_linequantity.Line not in (select Line from Quote_Supply' +
        ')) or'
      
        '(enquiry_linequantity.Quantity not in (select Quantity from Quot' +
        'e_Supply))'
      ') and'
      '(Enquiry.Customer = :Customer) and'
      '(EnquiryLine.Form_Description like :Description)'
      
        'ORDER BY enquiry_linequantity.enquiry desc, enquiry_linequantity' +
        '.line, enquiry_linequantity.quantity')
    Left = 608
    Top = 104
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Description'
      end>
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 325
    OnTimer = tmrSearchTimer
    Left = 368
    Top = 128
  end
  object dtsCustEnquiryQtys: TDataSource
    DataSet = qryCustEnquiryQtys
    Left = 720
    Top = 104
  end
end
