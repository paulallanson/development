object PBEmailListFrm: TPBEmailListFrm
  Left = 726
  Top = 485
  Caption = 'PBEmailListFrm'
  ClientHeight = 271
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 697
    Height = 230
    Align = alClient
    Caption = 'Panel1'
    ParentBackground = False
    TabOrder = 0
    object EmailListGrid: TStringGrid
      Left = 1
      Top = 1
      Width = 695
      Height = 228
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
    Top = 230
    Width = 697
    Height = 41
    Align = alBottom
    ParentBackground = False
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
  end
  object ExFilterSQL: TFDQuery
    ConnectionName = 'PB'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Supplier_BranchContacts'
      'set Email = :Email,'
      'ExportFilter = :ExportFilter'
      'where Supplier = :Code and'
      'Branch_no = :Branch_no and'
      'Contact_no = :Contact_no')
    Left = 296
    Top = 8
    ParamData = <
      item
        Name = 'Email'
      end
      item
        Name = 'ExportFilter'
      end
      item
        Name = 'Code'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object UpCustSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Contact'
      'set Email = :Email,'
      'ExportFilter = :ExportFilter'
      'where Customer = :Code and'
      'Branch_no = :Branch_no and'
      'Contact_no = :Contact_no')
    Left = 360
    Top = 8
    ParamData = <
      item
        Name = 'Email'
      end
      item
        Name = 'ExportFilter'
      end
      item
        Name = 'Code'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object qryContacts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Customer_Contact.Contact_no, Customer_Contact.Name, Custo' +
        'mer_Contact.Email'
      'from Customer_Contact'
      'where Customer = :Customer and'
      'Branch_no = :Branch_no and'
      '((inactive = '#39'N'#39') OR (inactive IS NULL))'
      'Order By Name')
    Left = 216
    Top = 128
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object dtsContacts: TDataSource
    DataSet = qryContacts
    Left = 280
    Top = 128
  end
  object qrySuppliers: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Supplier_BranchContacts.Contact_no, Supplier_BranchContac' +
        'ts.Name, Supplier_BranchContacts.Email'
      'from Supplier_BranchContacts'
      'where Supplier = :Supplier and'
      'Branch_no = :Branch_no and'
      '((inactive = '#39'N'#39') OR (inactive IS NULL))'
      'Order By Name')
    Left = 216
    Top = 184
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object UpInvoiceSQL: TFDQuery
    ConnectionName = 'PB'
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
end
