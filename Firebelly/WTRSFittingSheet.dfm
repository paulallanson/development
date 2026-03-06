object frmWTRSFittingSheet: TfrmWTRSFittingSheet
  Left = 591
  Top = 139
  BorderStyle = bsDialog
  Caption = 'Fitting Sheet Print'
  ClientHeight = 456
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object SelectLst: TListBox
    Left = 176
    Top = 24
    Width = 25
    Height = 105
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    Visible = False
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 376
    Width = 516
    Height = 80
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 367
    ExplicitWidth = 510
    DesignSize = (
      516
      80)
    object btnPrint: TButton
      Left = 8
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Print'
      Enabled = False
      TabOrder = 0
      OnClick = btnPrintClick
    end
    object btnPreview: TButton
      Left = 96
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'P&review'
      Enabled = False
      TabOrder = 1
      OnClick = btnPreviewClick
    end
    object btnEmail: TButton
      Left = 184
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Email'
      Enabled = False
      TabOrder = 2
      OnClick = btnEmailClick
    end
    object Button4: TButton
      Left = 432
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Close'
      TabOrder = 3
      OnClick = Button4Click
    end
    object chkbxMerge: TCheckBox
      Left = 8
      Top = 13
      Width = 345
      Height = 17
      Caption = 'Merge all selected documents to create single PDF in email'
      TabOrder = 4
    end
  end
  object pnlDocuments: TPanel
    Left = 0
    Top = 158
    Width = 516
    Height = 63
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 510
    object Label2: TLabel
      Left = 8
      Top = 5
      Width = 207
      Height = 13
      Caption = 'Include documents from selected folder:'
    end
    object cmbDocuments: TComboBox
      Left = 8
      Top = 26
      Width = 273
      Height = 22
      Style = csOwnerDrawFixed
      ItemIndex = 0
      TabOrder = 0
      Text = '<All>'
      OnChange = cmbDocumentsChange
      Items.Strings = (
        '<All>')
    end
  end
  object pnlSelection: TPanel
    Left = 0
    Top = 0
    Width = 516
    Height = 158
    Align = alTop
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 510
    object selectionGrp: TGroupBox
      Left = 8
      Top = 7
      Width = 273
      Height = 145
      Caption = 'Sales Order Selection'
      ParentBackground = False
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 80
        Width = 244
        Height = 39
        Caption = 
          'Enter order numbers and/or invoice ranges separated by commas. F' +
          'or example, 1234, 1236, 1240-1245'
        WordWrap = True
      end
      object memSelection: TMemo
        Left = 8
        Top = 20
        Width = 257
        Height = 53
        TabOrder = 0
        OnChange = memSelectionChange
        OnKeyPress = memSelectionKeyPress
      end
    end
    object chkbxPrint: TCheckBox
      Left = 300
      Top = 16
      Width = 209
      Height = 17
      Caption = 'Print/Email Remedial Sheet'
      TabOrder = 1
    end
    object chkbxIncludeVoucher: TCheckBox
      Left = 300
      Top = 38
      Width = 97
      Height = 17
      Caption = 'Include Voucher'
      TabOrder = 2
      Visible = False
    end
  end
  object pnlDocumentDetails: TPanel
    Left = 0
    Top = 221
    Width = 516
    Height = 155
    Align = alClient
    ParentBackground = False
    TabOrder = 4
    ExplicitWidth = 510
    ExplicitHeight = 146
    object pcDocumentDetails: TPageControl
      Left = 1
      Top = 1
      Width = 514
      Height = 153
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 508
      ExplicitHeight = 144
      object TabSheet1: TTabSheet
        Caption = 'Order Documents'
        object lstbxDocuments: TListBox
          Left = 0
          Top = 7
          Width = 273
          Height = 129
          ItemHeight = 13
          MultiSelect = True
          TabOrder = 0
          OnDblClick = lstbxDocumentsDblClick
        end
        object chkbxAllDocuments: TCheckBox
          Left = 288
          Top = 7
          Width = 201
          Height = 17
          Caption = 'Select ALL order documents'
          TabOrder = 1
          OnClick = chkbxAllDocumentsClick
        end
        object chkbxAllSiteDocuments: TCheckBox
          Left = 288
          Top = 31
          Width = 201
          Height = 17
          Caption = 'Select ALL Site Documents'
          TabOrder = 2
          OnClick = chkbxAllSiteDocumentsClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Site Documents'
        ImageIndex = 1
        object lstbxSiteDocuments: TListBox
          Left = 0
          Top = 7
          Width = 273
          Height = 129
          ItemHeight = 13
          MultiSelect = True
          TabOrder = 0
          OnDblClick = lstbxDocumentsDblClick
        end
      end
    end
  end
  object qryGetSORemedials: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Sales_Order_Line.Job,'
      '        Int_Sel.Int_Sel_Code'
      'FROM Sales_Order_Line'
      '        INNER JOIN Int_Sel'
      '          ON Sales_Order_Line.Sales_Order = Int_Sel.Sel1'
      'WHERE Int_Sel.Int_Sel_Code = :Int_Sel')
    Left = 408
    Top = 72
    ParamData = <
      item
        Name = 'Int_Sel'
      end>
  end
  object qryGetSalesOrderEmailsOld: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT DISTINCT'
      '      Job.*,'
      '      Operator.Operator_Name,'
      '      Sales_Order.Sales_Order,'
      '      Sales_Order.Order_ref_no,'
      '      Sales_Order.Appliance_Details,'
      '      Sales_Order.Extra_Notes as SO_Extra_Notes,'
      '      Sales_Order.Extra_Notes as Order_Extra_Notes,'
      '      Sales_Order.Extra_Notes as Sales_Order_Extra_Notes,'
      '      Sales_Order.Install_Address as Order_Install_Address,'
      '      Sales_Order.Install_Name as Order_Install_Name,'
      '      Sales_Order.Install_Phone as Order_Install_Phone,'
      
        '      Sales_Order.Installation_Address as Order_Installation_Add' +
        'ress,'
      '      Sales_Order.Email_Address as Order_Email_Address,'
      '      Sales_Order.Reference as Order_Reference,'
      '      Sales_Order.Date_Required as Order_Date_Required,'
      '      Sales_Order.Contact_Name as Order_Contact_Name,'
      '      Sales_Order.Fitter as Order_Fitter,'
      '      Sales_Order.Revenue_Centre,'
      '      Fitter.Fitter_Name,'
      '      Fitter.Email_Address as Email,'
      '      Fitter.Email_Address as Contact_Email,'
      '      '#39'Adobe Acrobat Document (*.pdf)'#39' as export_filter_desc,'
      #9'    '#39'PDF'#39' as ExportFilter,'
      '      '#39' '#39' as CC_Email'
      'FROM Fitter'
      '      RIGHT JOIN ((Operator'
      '      INNER JOIN (Int_Sel'
      '      INNER JOIN Sales_Order'
      '        ON Int_Sel.Sel1 = Sales_Order.Sales_Order)'
      '        ON Operator.Operator = Sales_Order.Operator)'
      '      INNER JOIN (Job'
      '      RIGHT JOIN Sales_Order_Line'
      '        ON Job.Job = Sales_Order_Line.Job)'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Orde' +
        'r)'
      '        ON Fitter.Fitter = Sales_Order.Fitter'
      'WHERE'
      '  (Int_sel.Int_sel_Code = :Int_sel)'
      'ORDER BY'
      '    Fitter.Fitter_Name,'
      '    sales_order.Sales_Order'
      '')
    Left = 176
    Top = 200
    ParamData = <
      item
        Name = 'Int_sel'
      end>
  end
  object qryGetSORemedialsEmails: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Sales_Order_Line.Job'
      'FROM Sales_Order_Line'
      'WHERE Sales_Order_Line.Sales_Order = :Sales_Order AND'
      'Sales_Order_Line.Job <> 0')
    Left = 296
    Top = 152
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryGetSalesOrder: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Order.Sales_Order,'
      '        Sales_Order.Location_Plan_Document,'
      '        Sales_Order.Customer_Name,'
      '        Customer_Branch.Branch_Name'
      'FROM Customer_Branch'
      '        RIGHT JOIN (Customer'
      '        INNER JOIN Sales_Order'
      '            ON Customer.Customer = Sales_Order.Customer)'
      
        '            ON (Customer_Branch.Branch_No = Sales_Order.Branch_n' +
        'o) AND (Customer_Branch.Customer = Sales_Order.Customer)'
      'WHERE Sales_Order = :Sales_Order')
    Left = 432
    Top = 16
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryDocumentStructure: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Folder_Name'
      'FROM Document_Structure'
      'WHERE Module_Id = 40'
      'ORDER BY Folder_Name')
    Left = 336
    Top = 304
  end
  object qryReport: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Job.Job,'
      '        Job.Job_Status,'
      '        Sales_Order.Customer,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Contact_name,'
      '        Sales_Order.Order_ref_no,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Address,'
      '        Sales_Order.Install_Name,'
      '        Sales_Order.Install_Phone,'
      '        Sales_Order.Install_Address,'
      '        Sales_Order.Sales_Order,'
      '        Sales_Order.Revenue_Centre,'
      '        0 as "Job_Remedial.Remedial_Number"'
      'FROM Sales_Order'
      '        INNER JOIN (Job'
      '        INNER JOIN Sales_Order_Line'
      '          ON Job.Job = Sales_Order_Line.Job)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der'
      'WHERE Job.Job = :Job AND :Remedial_Number = 0')
    Left = 304
    Top = 80
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'Remedial_Number'
      end>
  end
  object qryGetSalesOrdersOlder: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT DISTINCT'
      '      Job.*,'
      '      Operator.Operator_Name,'
      '      Sales_Order.Sales_Order,'
      '      Sales_Order.Order_ref_no,'
      '      Sales_Order.Appliance_Details,'
      '      Sales_Order.Extra_Notes as SO_Extra_Notes,'
      '      Sales_Order.Extra_Notes as Order_Extra_Notes,'
      '      Sales_Order.Extra_Notes as Sales_Order_Extra_Notes,'
      '      Sales_Order.Install_Address as Order_Install_Address,'
      '      Sales_Order.Install_Name as Order_Install_Name,'
      '      Sales_Order.Install_Phone as Order_Install_Phone,'
      
        '      Sales_Order.Installation_Address as Order_Installation_Add' +
        'ress,'
      '      Sales_Order.Email_Address as Order_Email_Address,'
      '      Sales_Order.Reference as Order_Reference,'
      '      Sales_Order.Revenue_Centre,'
      '      Sales_Order.Date_Required as Order_Date_Required'
      'FROM Int_Sel'
      '        INNER JOIN ((Operator'
      '        INNER JOIN Sales_Order'
      '          ON Operator.Operator = Sales_Order.Operator)'
      '        INNER JOIN (Job'
      '        INNER JOIN Sales_Order_Line'
      '          ON Job.Job = Sales_Order_Line.Job)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Int_Sel.Sel1 = Sales_Order.Sales_Order'
      'WHERE'
      
        '  (Int_sel.Int_sel_Code = :Int_sel) AND (Sales_Order_Line.quote ' +
        '<> 0)')
    Left = 296
    Top = 16
    ParamData = <
      item
        Name = 'Int_sel'
      end>
  end
  object qryGetSalesOrderEmailsOlder: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT DISTINCT'
      '      Job.*,'
      '      Operator.Operator_Name,'
      '      Sales_Order.Sales_Order,'
      '      Sales_Order.Order_ref_no,'
      '      Sales_Order.Appliance_Details,'
      '      Sales_Order.Extra_Notes as SO_Extra_Notes,'
      '      Sales_Order.Extra_Notes as Order_Extra_Notes,'
      '      Sales_Order.Extra_Notes as Sales_Order_Extra_Notes,'
      '      Sales_Order.Install_Address as Order_Install_Address,'
      '      Sales_Order.Install_Name as Order_Install_Name,'
      '      Sales_Order.Install_Phone as Order_Install_Phone,'
      
        '      Sales_Order.Installation_Address as Order_Installation_Add' +
        'ress,'
      '      Sales_Order.Email_Address as Order_Email_Address,'
      '      Sales_Order.Reference as Order_Reference,'
      '      Sales_Order.Date_Required as Order_Date_Required,'
      '      Sales_Order.Fitter as Order_Fitter,'
      '      Sales_Order.Revenue_Centre,'
      '      Fitter.Fitter_Name,'
      '      Fitter.Email_Address as Email,'
      '      Fitter.Email_Address as Contact_Email,'
      '      '#39'Adobe Acrobat Document (*.pdf)'#39' as export_filter_desc,'
      #9'    '#39'PDF'#39' as ExportFilter,'
      '      '#39' '#39' as CC_Email'
      'FROM Fitter'
      '      RIGHT JOIN (Int_Sel'
      '      INNER JOIN ((Operator'
      '      INNER JOIN Sales_Order'
      '        ON Operator.Operator = Sales_Order.Operator)'
      '      INNER JOIN (Job'
      '      INNER JOIN Sales_Order_Line'
      '        ON Job.Job = Sales_Order_Line.Job)'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Orde' +
        'r)'
      '        ON Int_Sel.Sel1 = Sales_Order.Sales_Order)'
      '        ON Fitter.Fitter = Sales_Order.Fitter'
      'WHERE'
      
        '  (Int_sel.Int_sel_Code = :Int_sel) AND (Sales_Order_Line.quote ' +
        '<> 0)'
      'ORDER BY'
      '    Fitter.Fitter_Name,'
      '    sales_order.Sales_Order'
      '')
    Left = 296
    Top = 200
    ParamData = <
      item
        Name = 'Int_sel'
      end>
  end
  object qrySalesOrdersOld: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT DISTINCT'
      '      Job.*,'
      '      Operator.Operator_Name,'
      '      Sales_Order.Sales_Order,'
      '      Sales_Order.Order_ref_no,'
      '      Sales_Order.Appliance_Details,'
      '      Sales_Order.Extra_Notes as SO_Extra_Notes,'
      '      Sales_Order.Extra_Notes as Order_Extra_Notes,'
      '      Sales_Order.Extra_Notes as Sales_Order_Extra_Notes,'
      '      Sales_Order.Install_Address as Order_Install_Address,'
      '      Sales_Order.Install_Name as Order_Install_Name,'
      '      Sales_Order.Install_Phone as Order_Install_Phone,'
      
        '      Sales_Order.Installation_Address as Order_Installation_Add' +
        'ress,'
      '      Sales_Order.Email_Address as Order_Email_Address,'
      '      Sales_Order.Reference as Order_Reference,'
      '      Sales_Order.Revenue_Centre,'
      '      Sales_Order.Date_Required as Order_Date_Required,'
      '      Sales_Order.Contact_Name as Order_Contact_Name,'
      '      (SELECT Customer_Branch.Special_Instructions'
      '      FROM Customer_Branch'
      '            INNER JOIN Sales_Order AS SO'
      
        '              ON (Customer_Branch.Branch_No = SO.Branch_no) AND ' +
        '(Customer_Branch.Customer = SO.Customer)'
      
        '      WHERE SO.Sales_Order = Sales_Order.Sales_Order) as Site_In' +
        'structions'
      'FROM (Operator'
      '      INNER JOIN (Int_Sel'
      '      INNER JOIN Sales_Order'
      '        ON Int_Sel.Sel1 = Sales_Order.Sales_Order)'
      '        ON Operator.Operator = Sales_Order.Operator)'
      '      INNER JOIN (Job'
      '      RIGHT JOIN Sales_Order_Line'
      '        ON Job.Job = Sales_Order_Line.Job)'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Orde' +
        'r'
      'WHERE'
      
        '  (Int_sel.Int_sel_Code = :Int_sel) AND (Sales_Order_Line.quote ' +
        '<> 0)')
    Left = 176
    Top = 16
    ParamData = <
      item
        Name = 'Int_sel'
      end>
  end
  object qryGetSalesOrders: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT DISTINCT'
      '      Job.*,'
      '      Operator.Operator_Name,'
      '      Sales_Order.Sales_Order,'
      '      Sales_Order.Order_ref_no,'
      '      Sales_Order.Appliance_Details,'
      '      Sales_Order.Extra_Notes as SO_Extra_Notes,'
      '      Sales_Order.Extra_Notes as Order_Extra_Notes,'
      '      Sales_Order.Extra_Notes as Sales_Order_Extra_Notes,'
      '      Sales_Order.Install_Address as Order_Install_Address,'
      '      Sales_Order.Install_Name as Order_Install_Name,'
      '      Sales_Order.Install_Phone as Order_Install_Phone,'
      
        '      Sales_Order.Installation_Address as Order_Installation_Add' +
        'ress,'
      '      Sales_Order.Email_Address as Order_Email_Address,'
      '      Sales_Order.Reference as Order_Reference,'
      '      Sales_Order.Revenue_Centre,'
      '      Sales_Order.Date_Required as Order_Date_Required,'
      '      Sales_Order.Contact_Name as Order_Contact_Name,'
      '      (SELECT Customer_Branch.Special_Instructions'
      '      FROM Customer_Branch'
      '            INNER JOIN Sales_Order AS SO'
      
        '              ON (Customer_Branch.Branch_No = SO.Branch_no) AND ' +
        '(Customer_Branch.Customer = SO.Customer)'
      
        '      WHERE SO.Sales_Order = Sales_Order.Sales_Order) as Site_In' +
        'structions'
      'FROM Int_Sel'
      '        INNER JOIN ((Operator'
      '        INNER JOIN Sales_Order'
      '          ON Operator.Operator = Sales_Order.Operator)'
      '        INNER JOIN (Job'
      '        INNER JOIN Sales_Order_Line'
      '          ON Job.Job = Sales_Order_Line.Job)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Int_Sel.Sel1 = Sales_Order.Sales_Order'
      'WHERE'
      
        '  (Int_sel.Int_sel_Code = :Int_sel) AND (Sales_Order_Line.quote ' +
        '<> 0)')
    Left = 64
    Top = 24
    ParamData = <
      item
        Name = 'Int_sel'
      end>
  end
  object qryGetSalesOrderEmails: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT DISTINCT'
      '      Job.*,'
      '      Operator.Operator_Name,'
      '      Sales_Order.Sales_Order,'
      '      Sales_Order.Order_ref_no,'
      '      Sales_Order.Appliance_Details,'
      '      Sales_Order.Extra_Notes as SO_Extra_Notes,'
      '      Sales_Order.Extra_Notes as Order_Extra_Notes,'
      '      Sales_Order.Extra_Notes as Sales_Order_Extra_Notes,'
      '      Sales_Order.Install_Address as Order_Install_Address,'
      '      Sales_Order.Install_Name as Order_Install_Name,'
      '      Sales_Order.Install_Phone as Order_Install_Phone,'
      
        '      Sales_Order.Installation_Address as Order_Installation_Add' +
        'ress,'
      '      Sales_Order.Email_Address as Order_Email_Address,'
      '      Sales_Order.Reference as Order_Reference,'
      '      Sales_Order.Date_Required as Order_Date_Required,'
      '      Sales_Order.Contact_Name as Order_Contact_Name,'
      '      Sales_Order.Fitter as Order_Fitter,'
      '      Sales_Order.Revenue_Centre,'
      '      Fitter.Fitter_Name,'
      '      Fitter.Email_Address as Email,'
      '      Fitter.Email_Address as Contact_Email,'
      '      '#39'Adobe Acrobat Document (*.pdf)'#39' as export_filter_desc,'
      #9'    '#39'PDF'#39' as ExportFilter,'
      '      '#39' '#39' as CC_Email'
      'FROM Fitter'
      '      RIGHT JOIN (Int_Sel'
      '      INNER JOIN ((Operator'
      '      INNER JOIN Sales_Order'
      '        ON Operator.Operator = Sales_Order.Operator)'
      '      INNER JOIN (Job'
      '      INNER JOIN Sales_Order_Line'
      '        ON Job.Job = Sales_Order_Line.Job)'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Orde' +
        'r)'
      '        ON Int_Sel.Sel1 = Sales_Order.Sales_Order)'
      '        ON Fitter.Fitter = Sales_Order.Fitter'
      'WHERE'
      
        '  (Int_sel.Int_sel_Code = :Int_sel) AND (Sales_Order_Line.quote ' +
        '<> 0)'
      'ORDER BY'
      '    Fitter.Fitter_Name,'
      '    sales_order.Sales_Order'
      '')
    Left = 56
    Top = 200
    ParamData = <
      item
        Name = 'Int_sel'
      end>
  end
  object qryOrders: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT DISTINCT'
      '      Sales_Order.Customer,'
      '      Sales_Order.Customer_Name,'
      '      Sales_Order.Contact_Name,'
      '      Sales_Order.Address,'
      '      Sales_Order.Descriptive_Reference as Description,'
      '      Operator.Operator_Name,'
      '      Sales_Order.Sales_Order,'
      '      Sales_Order.Sales_Order_Number,'
      '      Sales_Order.Order_ref_no,'
      '      Sales_Order.Appliance_Details,'
      '      Sales_Order.Extra_Notes AS SO_Extra_Notes,'
      '      Sales_Order.Extra_Notes AS Order_Extra_Notes,'
      '      Sales_Order.Extra_Notes AS Sales_Order_Extra_Notes,'
      '      Sales_Order.Install_Address AS Order_Install_Address,'
      '      Sales_Order.Install_Name AS Order_Install_Name,'
      '      Sales_Order.Install_Phone AS Order_Install_Phone,'
      
        '      Sales_Order.Installation_Address AS Order_Installation_Add' +
        'ress,'
      '      Sales_Order.Email_Address AS Order_Email_Address,'
      '      Sales_Order.Reference AS Order_Reference,'
      '      Sales_Order.Revenue_Centre,'
      '      Sales_Order.Date_Required AS Order_Date_Required,'
      '      Sales_Order.Contact_Name AS Order_Contact_Name,'
      '      (SELECT Customer_Branch.Special_Instructions'
      '       FROM Customer_Branch'
      '            INNER JOIN Sales_Order AS SO'
      
        '              ON (Customer_Branch.Branch_No = SO.Branch_no) AND ' +
        '(Customer_Branch.Customer = SO.Customer)'
      
        '       WHERE SO.Sales_Order = Sales_Order.Sales_Order) AS Site_I' +
        'nstructions,'
      '      (SELECT TOP 1 Sales_Order_Line.Quote'
      '       FROM Sales_Order_Line'
      
        '       WHERE Sales_Order_line.Sales_Order = Sales_Order.Sales_Or' +
        'der) as Quote,'
      '      (SELECT TOP 1 Sales_Order_Line.Job'
      '       FROM Sales_Order_Line'
      
        '       WHERE Sales_Order_line.Sales_Order = Sales_Order.Sales_Or' +
        'der) as Job,'
      '      (SELECT TOP 1 Job.Risk_Notes'
      '       FROM Sales_Order_Line, Job'
      
        '       WHERE Sales_Order_line.Sales_Order = Sales_Order.Sales_Or' +
        'der AND'
      #9#9#9' (Sales_order_line.Job = Job.Job)) as Risk_Notes,'
      '      (SELECT TOP 1 Job.Job_Status'
      '       FROM Sales_Order_Line, Job'
      
        '       WHERE Sales_Order_line.Sales_Order = Sales_Order.Sales_Or' +
        'der AND'
      #9#9#9' (Sales_order_line.Job = Job.Job)) as Job_Status'
      'FROM Operator'
      '      INNER JOIN (Int_Sel'
      '      INNER JOIN Sales_Order'
      '        ON Int_Sel.Sel1 = Sales_Order.Sales_Order)'
      '        ON Operator.Operator = Sales_Order.Operator'
      'WHERE'
      '  (Int_sel.Int_sel_Code = :Int_sel)'
      '')
    Left = 464
    Top = 248
    ParamData = <
      item
        Name = 'Int_sel'
      end>
  end
  object qryEmails: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT DISTINCT'
      '      Sales_Order.Customer,'
      '      Sales_Order.Customer_Name,'
      '      Sales_Order.Address,'
      '      Sales_Order.Descriptive_Reference as Description,'
      '      Operator.Operator_Name,'
      '      Sales_Order.Sales_Order,'
      '      Sales_Order.Customer,'
      '      Sales_Order.Customer_Name,'
      '      Sales_Order.Order_ref_no,'
      '      Sales_Order.Appliance_Details,'
      '      Sales_Order.Extra_Notes AS SO_Extra_Notes,'
      '      Sales_Order.Extra_Notes AS Order_Extra_Notes,'
      '      Sales_Order.Extra_Notes AS Sales_Order_Extra_Notes,'
      '      Sales_Order.Install_Address AS Order_Install_Address,'
      '      Sales_Order.Install_Name AS Order_Install_Name,'
      '      Sales_Order.Install_Phone AS Order_Install_Phone,'
      
        '      Sales_Order.Installation_Address AS Order_Installation_Add' +
        'ress,'
      '      Sales_Order.Email_Address AS Order_Email_Address,'
      '      Sales_Order.Reference AS Order_Reference,'
      '      Sales_Order.Date_Required AS Order_Date_Required,'
      '      Sales_Order.Fitter AS Order_Fitter,'
      '      Sales_Order.Revenue_Centre,'
      '      Fitter.Fitter_Name,'
      '      Fitter.Email_Address AS Email,'
      '      Fitter.Email_Address AS Contact_Email,'
      '      '#39'Adobe Acrobat Document (*.pdf)'#39' AS export_filter_desc,'
      '      '#39'PDF'#39' AS ExportFilter, '#39' '#39' AS CC_Email,'
      '      (SELECT Customer_Branch.Special_Instructions'
      '       FROM Customer_Branch'
      '            INNER JOIN Sales_Order AS SO'
      
        '              ON (Customer_Branch.Branch_No = SO.Branch_no) AND ' +
        '(Customer_Branch.Customer = SO.Customer)'
      
        '       WHERE SO.Sales_Order = Sales_Order.Sales_Order) AS Site_I' +
        'nstructions,'
      '      (SELECT TOP 1 Sales_Order_Line.Quote'
      '       FROM Sales_Order_Line'
      
        '       WHERE Sales_Order_line.Sales_Order = Sales_Order.Sales_Or' +
        'der) as Quote,'
      '      (SELECT TOP 1 Sales_Order_Line.Job'
      '       FROM Sales_Order_Line'
      
        '       WHERE Sales_Order_line.Sales_Order = Sales_Order.Sales_Or' +
        'der) as Job,'
      '      (SELECT TOP 1 Job.Risk_Notes'
      '       FROM Sales_Order_Line, Job'
      
        '       WHERE Sales_Order_line.Sales_Order = Sales_Order.Sales_Or' +
        'der AND'
      #9#9#9' (Sales_order_line.Job = Job.Job)) as Risk_Notes,'
      '      (SELECT TOP 1 Job.Job_Status'
      '       FROM Sales_Order_Line, Job'
      
        '       WHERE Sales_Order_line.Sales_Order = Sales_Order.Sales_Or' +
        'der AND'
      #9#9#9' (Sales_order_line.Job = Job.Job)) as Job_Status'
      'FROM Fitter'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN (Int_Sel'
      '      INNER JOIN Sales_Order'
      '        ON Int_Sel.Sel1 = Sales_Order.Sales_Order)'
      '        ON Operator.Operator = Sales_Order.Operator)'
      '        ON Fitter.Fitter = Sales_Order.Fitter'
      'WHERE'
      '  (Int_sel.Int_sel_Code = :Int_sel)'
      'ORDER BY'
      '    Fitter.Fitter_Name,'
      '    sales_order.Sales_Order'
      '')
    Left = 464
    Top = 304
    ParamData = <
      item
        Name = 'Int_sel'
      end>
  end
end
