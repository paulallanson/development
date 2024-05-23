object frmpbluContacts: TfrmpbluContacts
  Left = 108
  Top = 150
  Caption = 'Contact Details'
  ClientHeight = 335
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 599
    Height = 260
    Align = alClient
    DataSource = dtsContacts
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Contact_Name'
        Title.Caption = 'Name'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Branch_Name'
        Title.Caption = 'Branch'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Phone'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Mobile_No'
        Title.Caption = 'Mobile No'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Email'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fax_Number'
        Title.Caption = 'Fax'
        Width = 72
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 316
    Width = 699
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
    Top = 260
    Width = 699
    Height = 56
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      699
      56)
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object btnClose: TButton
      Left = 593
      Top = 17
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Clos&e'
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 33
      Width = 129
      Height = 17
      Caption = 'show inactive contacts'
      TabOrder = 1
      OnClick = chkbxShowInactiveClick
    end
    object edtName: TEdit
      Left = 56
      Top = 8
      Width = 177
      Height = 21
      TabOrder = 2
      OnChange = edtNameChange
    end
    object Button2: TButton
      Left = 250
      Top = 6
      Width = 75
      Height = 25
      Caption = 'S&weep'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 599
    Top = 0
    Width = 100
    Height = 260
    Align = alRight
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      100
      260)
    object btnAdd: TButton
      Left = 17
      Top = 17
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnChange: TButton
      Left = 17
      Top = 55
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Change'
      TabOrder = 1
      OnClick = btnChangeClick
    end
    object btnDelete: TButton
      Left = 17
      Top = 93
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Delete'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object btnOnline: TButton
      Left = 17
      Top = 241
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Online'
      TabOrder = 5
      OnClick = btnOnlineClick
    end
    object btnMove: TButton
      Left = 17
      Top = 132
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Move'
      TabOrder = 3
      OnClick = btnMoveClick
    end
    object btnExcel: TBitBtn
      Left = 17
      Top = 173
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Excel'
      TabOrder = 4
      OnClick = btnExcelClick
    end
  end
  object dtsContacts: TDataSource
    DataSet = qryCContacts
    OnDataChange = SetButtons
    Left = 336
    Top = 80
  end
  object qryCContacts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer_Contact.Contact_no,'
      '        Customer_Contact.Name as Contact_Name,'
      '        Customer_Contact.Email,'
      '        Customer_Contact.Phone,'
      '        Customer_Contact.Mobile_No,'
      '        Customer_Contact.Fax_Number,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Contact.Customer,'
      '        Customer_Contact.Branch_no,'
      '        Customer_Contact.inactive'
      'FROM Customer_Branch'
      '      INNER JOIN Customer_Contact ON'
      
        '      (Customer_Branch.Branch_no = Customer_Contact.Branch_no) A' +
        'ND'
      '      (Customer_Branch.Customer = Customer_Contact.Customer)'
      'WHERE Customer_Contact.Customer = :Customer and'
      '      Customer_Contact.name like :Name and'
      
        '      ((Customer_Contact.Inactive = '#39'N'#39') or (Customer_Contact.In' +
        'active is NULL)'
      '      or (Customer_Contact.Inactive = :Inactive))       '
      'ORDER BY Customer_Contact.Name'
      ' ')
    Left = 128
    Top = 80
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Name'
      end
      item
        Name = 'Inactive'
      end>
  end
  object qrySContacts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Supplier_BranchContacts.Contact_no,'
      '        Supplier_BranchContacts.Name as Contact_Name,'
      '        Supplier_BranchContacts.Email,'
      '        Supplier_BranchContacts.Phone,'
      '        Supplier_BranchContacts.Mobile_No,'
      '        Supplier_BranchContacts.Fax_Number,'
      '        Supplier_Branch.Name as Branch_Name,'
      '        Supplier_BranchContacts.Supplier,'
      '        Supplier_BranchContacts.Branch_no,'
      '        Supplier_BranchContacts.inactive'
      'FROM Supplier_Branch'
      '      INNER JOIN Supplier_BranchContacts ON'
      
        '      (Supplier_Branch.Branch_no = Supplier_BranchContacts.Branc' +
        'h_no) AND'
      
        '      (Supplier_Branch.Supplier = Supplier_BranchContacts.Suppli' +
        'er)'
      'WHERE Supplier_BranchContacts.Supplier = :Supplier and'
      '      Supplier_BranchContacts.name like :Name and'
      
        '      ((Supplier_BranchContacts.Inactive = '#39'N'#39') or (Supplier_Bra' +
        'nchContacts.Inactive is NULL)'
      '      or (Supplier_BranchContacts.Inactive = :Inactive))'
      'ORDER BY Supplier_BranchContacts.Name'
      ' '
      ' ')
    Left = 128
    Top = 144
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Name'
      end
      item
        Name = 'Inactive'
      end>
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 200
    Top = 152
  end
  object qryGetCContactDetails: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer, Branch_no, Contact_no, enquiry as Order_no'
      'from Enquiry'
      'where'
      'Customer = :Customer and'
      'Branch_no = :Branch_no and'
      'Contact_no = :Contact_no'
      'UNION'
      
        'select Customer, Branch_no, Contact_no, Purchase_order as Order_' +
        'no'
      'from Purchase_OrderLine'
      'where'
      'Customer = :Customer and'
      'Branch_no = :Branch_no and'
      'Contact_no = :Contact_no'
      'UNION'
      'select Customer, Branch_no, Contact_no, Job_bag as Order_no'
      'from Job_Bag'
      'where'
      'Customer = :Customer and'
      'Branch_no = :Branch_no and'
      'Contact_no = :Contact_no'
      'UNION'
      'select Customer, Branch_no, Contact_no, Sales_order as Order_no'
      'from Sales_Order'
      'where'
      'Customer = :Customer and'
      'Branch_no = :Branch_no and'
      'Contact_no = :Contact_no'
      '')
    Left = 488
    Top = 48
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object qryGetSContactDetails: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Supplier, Branch_no, Contact_no, enquiry as Order_no'
      'from Supplier_Enquiry'
      'where'
      'Supplier = :Supplier and'
      'Branch_no = :Branch_no and'
      'Contact_no = :Contact_no'
      'UNION'
      
        'select Supplier, Branch_no, Contact_no, Purchase_order as Order_' +
        'no'
      'from Purchase_Order'
      'where'
      'Supplier = :Supplier and'
      'Branch_no = :Branch_no and'
      'Contact_no = :Contact_no')
    Left = 488
    Top = 152
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object qrySetCContactInactive: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Contact'
      'set inactive = '#39'Y'#39
      'where'
      'Customer = :Customer and '
      'Branch_no = :Branch_no and '
      'Contact_no = :Contact_no')
    Left = 488
    Top = 96
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object qrySetSContactInactive: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Supplier_BranchContacts'
      'set inactive = '#39'Y'#39
      'where'
      'Supplier = :Supplier and'
      'Branch_no = :Branch_no and '
      'Contact_no = :Contact_no')
    Left = 488
    Top = 200
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object qryAddContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Customer_Contact'
      '        (Customer,'
      '        Branch_No,'
      '        Contact_No,'
      '        Name,'
      '        Contact_Type,'
      '        Email,'
      '        Phone,'
      '        Narrative,'
      '        Mobile_no,'
      '        Salutation,'
      '        Contact_Level,'
      '        Fax_Number,'
      '        Receive_Mail,'
      '        ExportFilter,'
      '        Contact_Status,'
      '        Def_markup_Perc,'
      '        inactive,'
      '        Contact_info,'
      '        Title,'
      '        First_Name,'
      '        Surname)'
      'Select'#9':Customer,'
      #9#9'    :Branch_No,'
      #9#9'    (SELECT ISNULL(Max(Customer_Contact.Contact_No),0)+1'
      #9#9'      FROM Customer_Contact'
      
        #9#9'      WHERE (Customer_Contact.Customer = :Customer) AND (Custo' +
        'mer_Contact.Branch_no = :Branch_No)),'
      #9#9'    CC.Name,'
      '        CC.Contact_Type,'
      '        CC.Email,'
      '        CC.Phone,'
      '        CC.Narrative,'
      '        CC.Mobile_no,'
      '        CC.Salutation,'
      '        CC.Contact_Level,'
      '        CC.Fax_Number,'
      '        CC.Receive_Mail,'
      '        CC.ExportFilter,'
      '        CC.Contact_Status,'
      '        CC.Def_markup_Perc,'
      '        '#39'N'#39','
      '        CC.Contact_info,'
      '        CC.Title,'
      '        CC.First_Name,'
      '        CC.Surname'
      'FROM Customer_Contact CC, Customer_Contact'
      
        'WHERE (CC.Customer = :OldCustomer and CC.Branch_No = :OldBranch ' +
        'and CC.Contact_no = :OldContact)'
      'GROUP BY '#9#9
      #9#9'CC.Name, '
      '        CC.Contact_Type,'
      '        CC.Email,'
      '        CC.Phone,'
      '        CC.Narrative,'
      '        CC.Mobile_no,'
      '        CC.Salutation,'
      '        CC.Contact_Level,'
      '        CC.Fax_Number,'
      '        CC.Receive_Mail,'
      '        CC.ExportFilter,'
      '        CC.Contact_Status,'
      '        CC.Def_markup_Perc,'
      '        CC.Contact_info,'
      '        CC.Title,'
      '        CC.First_Name,'
      '        CC.Surname'
      '')
    Left = 488
    Top = 272
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'OldCustomer'
      end
      item
        Name = 'OldBranch'
      end
      item
        Name = 'OldContact'
      end>
  end
  object qrySetCContactActive: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Contact'
      'set inactive = '#39'N'#39
      'where'
      'Customer = :Customer and '
      'Branch_no = :Branch_no and '
      'Contact_no = :Contact_no')
    Left = 336
    Top = 144
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object qryCheckName: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Contact_no'
      'FROM Customer_Contact'
      
        'WHERE Customer = :Customer AND Branch_no = :Branch_no AND Name =' +
        ' :Name')
    Left = 336
    Top = 208
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Name'
      end>
  end
end
