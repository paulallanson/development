object frmWTRSFittingConfirm: TfrmWTRSFittingConfirm
  Left = 476
  Top = 115
  BorderStyle = bsDialog
  Caption = 'Fitting Confirmation'
  ClientHeight = 423
  ClientWidth = 536
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
    Top = 343
    Width = 536
    Height = 80
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 342
    ExplicitWidth = 532
    DesignSize = (
      536
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
      Top = 5
      Width = 345
      Height = 17
      Caption = 'Merge all selected documents to create single PDF in email'
      TabOrder = 4
    end
  end
  object pnlDocumentDetails: TPanel
    Left = 0
    Top = 193
    Width = 536
    Height = 150
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 192
    ExplicitWidth = 532
    object lstbxDocuments: TListBox
      Left = 8
      Top = 15
      Width = 273
      Height = 129
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
      OnDblClick = lstbxDocumentsDblClick
    end
    object chkbxAllDocuments: TCheckBox
      Left = 296
      Top = 15
      Width = 201
      Height = 17
      Caption = 'Select ALL additional order documents'
      TabOrder = 1
      OnClick = chkbxAllDocumentsClick
    end
  end
  object pnlDocuments: TPanel
    Left = 0
    Top = 138
    Width = 536
    Height = 55
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 532
    ExplicitHeight = 54
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
    Width = 536
    Height = 138
    Align = alTop
    ParentBackground = False
    TabOrder = 4
    ExplicitWidth = 532
    object selectionGrp: TGroupBox
      Left = 8
      Top = 7
      Width = 273
      Height = 121
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
    object chkbxAttachTerms: TCheckBox
      Left = 296
      Top = 25
      Width = 249
      Height = 17
      Caption = 'Attach Sales Terms && Conditions document'
      TabOrder = 1
    end
    object chkbxAttachColour: TCheckBox
      Left = 295
      Top = 49
      Width = 249
      Height = 17
      Caption = 'Attach Colour Sample'
      TabOrder = 2
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
    Left = 456
    Top = 32
    ParamData = <
      item
        Name = 'Int_Sel'
      end>
  end
  object qryGetSalesOrders: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_Order.*,'
      '        Operator.Operator_Name,'
      '        Operator.Telephone_number,'
      '        Account_Manager.Operator_Name AS Account_Manager_Name,'
      '        Account_Manager.Telephone_number AS AM_Telephone_Number,'
      '        Customer.Is_retail_customer,'
      '        Customer.Customer_is_Speculative,'
      '        Customer.Account_is_Factored,'
      '        Customer.Credit_Status,'
      '        Customer.Credit_Limit'
      'FROM Int_Sel'
      '        INNER JOIN (Operator AS Account_Manager'
      '        RIGHT JOIN (Customer'
      '        INNER JOIN (Operator'
      '        INNER JOIN Sales_Order'
      '          ON Operator.Operator = Sales_Order.Operator)'
      '          ON Customer.Customer = Sales_Order.Customer)'
      
        '          ON Account_Manager.Operator = Sales_Order.Account_Mana' +
        'ger)'
      '          ON Int_Sel.Sel1 = Sales_Order.Sales_Order'
      'WHERE'
      '  (Int_sel.Int_sel_Code = :Int_sel)')
    Left = 48
    Top = 24
    ParamData = <
      item
        Name = 'Int_sel'
      end>
  end
  object qryGetSalesOrderEmails: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Order.*,'
      '        Operator.Operator_Name,'
      '        Operator.Telephone_number,'
      '        Account_Manager.Operator_Name AS Account_Manager_Name,'
      '        Account_Manager.Telephone_number AS AM_Telephone_Number,'
      '        Customer_contact.Email_address as Email,'
      '        Customer_contact.Contact_name,'
      '        '#39'Adobe Acrobat Document (*.pdf)'#39' as export_filter_desc,'
      #9'      '#39'PDF'#39' as ExportFilter,'
      '        '#39' '#39' as CC_Email,'
      '        Customer.Is_retail_customer,'
      '        Customer.Customer_is_Speculative'
      'FROM Customer'
      '        INNER JOIN (Operator AS Account_Manager'
      '        RIGHT JOIN (Customer_contact'
      '        RIGHT JOIN (Int_Sel'
      '        INNER JOIN (Operator'
      '        INNER JOIN Sales_Order'
      '          ON Operator.Operator = Sales_Order.Operator)'
      '          ON Int_Sel.Sel1 = Sales_Order.Sales_Order)'
      
        '          ON (Customer_contact.Contact_no = Sales_Order.Contact_' +
        'no) AND (Customer_contact.Customer = Sales_Order.Customer))'
      
        '          ON Account_Manager.Operator = Sales_Order.Account_Mana' +
        'ger)'
      '          ON Customer.Customer = Sales_Order.Customer'
      'WHERE'
      '  (Int_sel.Int_sel_Code = :Int_sel)'
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
    Left = 456
    Top = 208
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryGetSalesOrder: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Location_Plan_Document'
      'FROM Sales_Order'
      'WHERE Sales_Order = :Sales_Order')
    Left = 456
    Top = 136
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
    Left = 48
    Top = 88
  end
  object qryGetMaterialDescription: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1  Quote_Element.Quote,'
      '              Thickness.Thickness_mm,'
      '              Worktop.Description,'
      '              Material_Type.Description,'
      
        '              Thickness.Thickness_mm + '#39' '#39' + Worktop.Description' +
        ' + '#39' '#39' + Material_Type.Description as Material_Description,'
      '              Material_type.Warranty_Description,'
      '              Material_type.Maintenance_Description,'
      '              Worktop.Image_Path'
      'FROM Material_Type'
      '        INNER JOIN (((Quote_Element'
      '        INNER JOIN Sales_Order_Line'
      '            ON Quote_Element.Quote = Sales_Order_Line.Quote)'
      '        INNER JOIN Worktop'
      '            ON Quote_Element.Worktop = Worktop.Worktop)'
      '        INNER JOIN Thickness'
      '            ON Quote_Element.Thickness = Thickness.Thickness)'
      
        '            ON Material_Type.Material_Type = Worktop.Material_Ty' +
        'pe'
      'WHERE Sales_Order_line.Sales_Order = :Sales_Order'
      '')
    Left = 496
    Top = 269
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
end
