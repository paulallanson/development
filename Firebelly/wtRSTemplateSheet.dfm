object frmWTRSTemplateSheet: TfrmWTRSTemplateSheet
  Left = 473
  Top = 128
  BorderStyle = bsDialog
  Caption = 'Template Sheet Print'
  ClientHeight = 456
  ClientWidth = 520
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
    Width = 520
    Height = 80
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      520
      80)
    object btnPrint: TButton
      Left = 8
      Top = 47
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
      Top = 47
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
      Top = 47
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Email'
      Enabled = False
      TabOrder = 2
      OnClick = btnEmailClick
    end
    object Button4: TButton
      Left = 424
      Top = 47
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
    Width = 520
    Height = 62
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
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
    Width = 520
    Height = 158
    Align = alTop
    ParentBackground = False
    TabOrder = 3
    object selectionGrp: TGroupBox
      Left = 8
      Top = 7
      Width = 273
      Height = 138
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
      Left = 296
      Top = 16
      Width = 209
      Height = 17
      Caption = 'Print/Email associated quote details'
      TabOrder = 1
    end
    object chkbxPrintPlan: TCheckBox
      Left = 296
      Top = 40
      Width = 209
      Height = 17
      Caption = 'Print/Email associated Kitchen Plan'
      TabOrder = 2
    end
  end
  object pnlDocumentDetails: TPanel
    Left = 0
    Top = 220
    Width = 520
    Height = 156
    Align = alClient
    Caption = 'pnlDocumentDetails'
    ParentBackground = False
    TabOrder = 4
    object pgDocumentDetails: TPageControl
      Left = 1
      Top = 1
      Width = 524
      Height = 163
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 518
      ExplicitHeight = 154
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
  object qryGetSOQuotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Sales_Order_Line.Quote,'
      '        Int_Sel.Int_Sel_Code'
      'FROM Sales_Order_Line'
      '        INNER JOIN Int_Sel'
      '          ON Sales_Order_Line.Sales_Order = Int_Sel.Sel1'
      'WHERE Int_Sel.Int_Sel_Code = :Int_Sel')
    Left = 264
    Top = 24
    ParamData = <
      item
        Name = 'Int_Sel'
      end>
  end
  object qryGetSalesOrders: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT Sales_Order_Line.Quote,'
      '        Sales_Order.Sales_order,'
      '        Sales_Order_Line.description,'
      '        Sales_Order.customer_name,'
      '        Sales_Order.reference,'
      '        Sales_Order.address,'
      '        Sales_Order.customer,'
      '        Sales_Order.contact_name,'
      '        sales_order.Contact_no,'
      '        Sales_Order.Install_address,'
      '        Sales_Order.Install_Name,'
      '        Sales_Order.Install_Phone,'
      '        Sales_Order.Account_Manager,'
      '        Sales_Order.Extra_Notes,'
      '        sales_order.Template_Date,'
      '        Sales_Order.Location_Plan_Document,'
      '        Sales_Order.Revenue_Centre,'
      '        Operator.Operator_Name AS Account_Manager_Name,'
      '        Operator.Telephone_number'
      'FROM Int_Sel'
      '        INNER JOIN (Operator'
      '        RIGHT JOIN (Sales_Order'
      '        INNER JOIN (Sales_Order_Line'
      '        LEFT JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Operator.Operator = Sales_Order.Account_Manager)'
      '          ON Int_Sel.Sel1 = Sales_Order.Sales_Order'
      'WHERE'
      
        '  (Int_sel.Int_sel_Code = :Int_sel) AND (Sales_Order_Line.quote ' +
        '<> 0)')
    Left = 48
    Top = 24
    ParamData = <
      item
        Name = 'Int_sel'
        ParamType = ptInput
      end>
  end
  object qryGetSalesOrderEmails: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT DISTINCT'
      '        Sales_Order_Line.sales_order,'
      '        Sales_Order.customer_name,'
      '        Sales_Order.reference,'
      '        Sales_Order.address,'
      '        Sales_Order.customer,'
      '        Sales_Order.contact_name,'
      '        Sales_Order.Install_address,'
      '        Sales_Order.Install_Name,'
      '        Sales_Order.Install_Phone,'
      '        Sales_Order.Account_Manager,'
      '        Sales_Order.Extra_Notes,'
      '        Sales_Order.Templater,'
      '        Sales_Order.Location_Plan_Document,'
      '        Sales_Order.Revenue_Centre,'
      '        Fitter.Fitter_Name,'
      '        Fitter.Email_Address as Email,'
      '        Fitter.Email_Address as Contact_Email,'
      '        '#39'Adobe Acrobat Document (*.pdf)'#39' as export_filter_desc,'
      #9'      '#39'PDF'#39' as ExportFilter,'
      '        '#39' '#39' as CC_Email'
      'FROM Fitter'
      '        RIGHT JOIN ((Int_Sel'
      '        INNER JOIN Sales_Order'
      '          ON Int_Sel.Sel1 = Sales_Order.Sales_Order)'
      '        INNER JOIN (Sales_Order_Line'
      '        LEFT JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Fitter.Fitter = Sales_Order.Templater'
      'WHERE'
      
        '  (Int_sel.Int_sel_Code = :Int_sel) AND (Sales_Order_Line.quote ' +
        '<> 0)'
      'ORDER BY'
      '    Fitter.Fitter_Name,'
      '    sales_order_line.Sales_Order'
      '')
    Left = 56
    Top = 200
    ParamData = <
      item
        Name = 'Int_sel'
      end>
  end
  object qryGetSOQuotesEmails: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Sales_Order_Line.Quote'
      'FROM Sales_Order_Line'
      'WHERE Sales_Order_Line.Sales_Order = :Sales_Order AND'
      'Sales_Order_Line.Quote <> 0')
    Left = 176
    Top = 200
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryGetSalesOrderEmailsOlder: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Order_Line.quote,'
      '        Sales_Order_Line.description,'
      '        Sales_Order.customer_name,'
      '        Sales_Order.reference,'
      '        Sales_Order.address,'
      '        Sales_Order.customer,'
      '        Sales_Order.contact_name,'
      '        Sales_Order_Line.Sales_order,'
      '        Sales_Order.Install_address,'
      '        Sales_Order.Install_Name,'
      '        Sales_Order.Install_Phone,'
      '        Sales_Order.Account_Manager,'
      '        Sales_Order.Extra_Notes,'
      '        Sales_Order.Templater,'
      '        Fitter.Fitter_Name,'
      '        Fitter.Email_Address as Email,'
      '        Fitter.Email_Address as Contact_Email,'
      '        '#39'Adobe Acrobat Document (*.pdf)'#39' as export_filter_desc,'
      #9'      '#39'PDF'#39' as ExportFilter,'
      '        '#39' '#39' as CC_Email'
      'FROM Fitter'
      '        RIGHT JOIN ((Int_Sel'
      '        INNER JOIN Sales_Order'
      '          ON Int_Sel.Sel1 = Sales_Order.Sales_Order)'
      '        INNER JOIN (Sales_Order_Line'
      '        LEFT JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Fitter.Fitter = Sales_Order.Templater'
      'WHERE'
      
        '  (Int_sel.Int_sel_Code = :Int_sel) AND (Sales_Order_Line.quote ' +
        '<> 0)'
      'ORDER BY sales_order_line.quote')
    Left = 56
    Top = 288
    ParamData = <
      item
        Name = 'Int_sel'
      end>
  end
  object qryGetSalesOrderEmailsOld: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Sales_Order_Line.quote,'
      '        Sales_Order_Line.description,'
      '        Sales_Order.customer_name,'
      '        Sales_Order.reference,'
      '        Sales_Order.address,'
      '        Sales_Order.customer,'
      '        Sales_Order.contact_name,'
      '        Sales_Order_Line.Sales_order,'
      '        Sales_Order.Install_address,'
      '        Sales_Order.Install_Name,'
      '        Sales_Order.Install_Phone,'
      '        Sales_Order.Account_Manager,'
      '        Sales_Order.Extra_Notes,'
      '        Sales_Order.Templater,'
      '        Sales_Order.Location_Plan_Document,'
      '        Fitter.Fitter_Name,'
      '        Fitter.Email_Address as Email,'
      '        Fitter.Email_Address as Contact_Email,'
      '        '#39'Adobe Acrobat Document (*.pdf)'#39' as export_filter_desc,'
      #9'      '#39'PDF'#39' as ExportFilter,'
      '        '#39' '#39' as CC_Email'
      'FROM Fitter'
      '        RIGHT JOIN ((Int_Sel'
      '        INNER JOIN Sales_Order'
      '          ON Int_Sel.Sel1 = Sales_Order.Sales_Order)'
      '        INNER JOIN (Sales_Order_Line'
      '        LEFT JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Fitter.Fitter = Sales_Order.Templater'
      'WHERE'
      
        '  (Int_sel.Int_sel_Code = :Int_sel) AND (Sales_Order_Line.quote ' +
        '<> 0)'
      'ORDER BY'
      '    Fitter.Fitter_Name,'
      '    sales_order_line.Sales_Order,'
      '    sales_order_line.Sales_Order_Line_No'
      '')
    Left = 56
    Top = 248
    ParamData = <
      item
        Name = 'Int_sel'
      end>
  end
  object qryDocumentStructure: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Folder_Name'
      'FROM Document_Structure'
      'WHERE Module_Id = 40'
      'ORDER BY Folder_Name')
    Left = 440
    Top = 64
  end
  object qryGetSalesOrdersOld: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_Order_Line.quote,'
      '        Sales_Order_Line.description,'
      '        Sales_Order.customer_name,'
      '        Sales_Order.reference,'
      '        Sales_Order.address,'
      '        Sales_Order.customer,'
      '        Sales_Order.contact_name,'
      '        sales_order.Contact_no,'
      '        Sales_Order_Line.Sales_order,'
      '        Sales_Order.Install_address,'
      '        Sales_Order.Install_Name,'
      '        Sales_Order.Install_Phone,'
      '        Sales_Order.Account_Manager,'
      '        Sales_Order.Extra_Notes,'
      '        sales_order.Template_Date,'
      '        Sales_Order.Location_Plan_Document,'
      '        Operator.Operator_Name AS Account_Manager_Name,'
      '        Operator.Telephone_number'
      'FROM Int_Sel'
      '        INNER JOIN (Operator'
      '        RIGHT JOIN (Sales_Order'
      '        INNER JOIN (Sales_Order_Line'
      '        LEFT JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Operator.Operator = Sales_Order.Account_Manager)'
      '          ON Int_Sel.Sel1 = Sales_Order.Sales_Order'
      'WHERE'
      
        '  (Int_sel.Int_sel_Code = :Int_sel) AND (Sales_Order_Line.quote ' +
        '<> 0)'
      'ORDER BY sales_order_line.quote')
    Left = 326
    Top = 132
    ParamData = <
      item
        Name = 'Int_sel'
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
    Left = 380
    Top = 76
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
end
