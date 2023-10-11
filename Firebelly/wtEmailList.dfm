object frmWTEmailList: TfrmWTEmailList
  Left = 67
  Top = 99
  Caption = 'frmWTEmailList'
  ClientHeight = 259
  ClientWidth = 689
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 689
    Height = 218
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object EmailListGrid: TStringGrid
      Left = 1
      Top = 1
      Width = 687
      Height = 216
      Align = alClient
      ColCount = 6
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
      OnClick = EmailListGridClick
      OnDrawCell = EmailListGridDrawCell
      OnSelectCell = EmailListGridSelectCell
      ColWidths = (
        64
        186
        126
        139
        116
        64)
    end
    object cmbExportFilter: TDBLookupComboBox
      Left = 432
      Top = 88
      Width = 145
      Height = 21
      KeyField = 'ExportFilter'
      ListField = 'Description'
      ListSource = ExFilterSRC
      TabOrder = 1
      Visible = False
      OnClick = cmbExportFilterClick
    end
    object cmbContacts: TDBLookupComboBox
      Left = 216
      Top = 88
      Width = 145
      Height = 21
      KeyField = 'Contact_no'
      ListField = 'Name'
      ListSource = dtsContacts
      TabOrder = 2
      Visible = False
      OnClick = cmbContactsClick
      OnEnter = cmbContactsEnter
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 218
    Width = 689
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 517
      Top = 8
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 605
      Top = 8
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
    object btnEmail: TButton
      Left = 16
      Top = 8
      Width = 121
      Height = 25
      Caption = 'Copy Email Details'
      TabOrder = 2
      OnClick = btnEmailClick
    end
  end
  object ExFilterSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select ExportFilter, Description'
      'from Exportfilter')
    Left = 432
    Top = 128
  end
  object ExFilterSRC: TDataSource
    DataSet = ExFilterSQL
    Left = 472
    Top = 128
  end
  object UpSuppSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Supplier_Contact'
      'set Email_Address = :Email'
      'where Supplier = :Code and'
      'Contact_no = :Contact_no')
    Left = 296
    Top = 8
    ParamData = <
      item
        Name = 'Email'
      end
      item
        Name = 'Code'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object UpCustSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Customer_Contact'
      'set Email_Address = :Email'
      'where Customer = :Code and'
      'Contact_no = :Contact_no')
    Left = 360
    Top = 8
    ParamData = <
      item
        Name = 'Email'
      end
      item
        Name = 'Code'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object qryContacts: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'select Customer_Contact.Contact_no, Customer_Contact.Contact_Nam' +
        'e as Name, Customer_Contact.Email_address'
      'from Customer_Contact'
      'where Customer = :Customer'
      'Order By Contact_Name')
    Left = 216
    Top = 128
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object dtsContacts: TDataSource
    DataSet = qryContacts
    Left = 280
    Top = 128
  end
  object qrySuppliers: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'select Supplier_Contact.Contact_no, Supplier_Contact.Contact_Nam' +
        'e as Name, Supplier_Contact.Email_Address'
      'from Supplier_Contact'
      'where Supplier = :Supplier'
      'Order By Contact_Name')
    Left = 216
    Top = 184
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object UpInvoiceSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Customer_Branch'
      'set Inv_To_Contact = :Contact_no'
      'from Sales_Invoice'
      'where Sales_Invoice_no = :Sales_Invoice_No and'
      'Sales_Invoice.Customer = Customer_Branch.Customer and'
      'Sales_Invoice.Branch_No = Customer_Branch.Branch_no')
    Left = 432
    Top = 8
    ParamData = <
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Sales_Invoice_No'
      end>
  end
  object qryFitters: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Fitter as Contact_no,'
      '        Fitter_Name as Name,'
      '        Email_Address'
      'from Fitter'
      'where ((inactive = '#39'N'#39') or (inactive = '#39#39'))'
      'Order By Fitter_Name')
    Left = 40
    Top = 128
  end
  object dtsFitters: TDataSource
    DataSet = qryFitters
    Left = 96
    Top = 128
  end
  object UpSalesOrderTemplaterSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Sales_Order'
      'set Templater = :Templater'
      'where Sales_Order = :Sales_Order')
    Left = 532
    Top = 8
    ParamData = <
      item
        Name = 'Templater'
      end
      item
        Name = 'Sales_Order'
      end>
  end
  object UpSalesOrderFitterSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Sales_Order'
      'set Fitter = :Fitter'
      'where Sales_Order = :Sales_Order')
    Left = 532
    Top = 56
    ParamData = <
      item
        Name = 'Fitter'
      end
      item
        Name = 'Sales_Order'
      end>
  end
end
