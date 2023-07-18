object frmWTRSSODeliveryNote: TfrmWTRSSODeliveryNote
  Left = 473
  Top = 128
  BorderStyle = bsDialog
  Caption = 'Delivery Note'
  ClientHeight = 217
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
    Top = 137
    Width = 365
    Height = 80
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      365
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
      Left = 272
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Close'
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object pnlSelection: TPanel
    Left = 0
    Top = 0
    Width = 365
    Height = 138
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object selectionGrp: TGroupBox
      Left = 8
      Top = 7
      Width = 345
      Height = 121
      Caption = 'Sales Order Selection'
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 80
        Width = 255
        Height = 26
        Caption = 
          'Enter order numbers and/or invoice ranges separated by commas. F' +
          'or example, 1234, 1236, 1240-1245'
        WordWrap = True
      end
      object memSelection: TMemo
        Left = 8
        Top = 20
        Width = 329
        Height = 53
        TabOrder = 0
        OnChange = memSelectionChange
        OnKeyPress = memSelectionKeyPress
      end
    end
  end
  object qryGetSalesOrderEmailsOlder: TQuery
    DatabaseName = 'WT'
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
        DataType = ftUnknown
        Name = 'Int_sel'
        ParamType = ptUnknown
      end>
  end
  object qryGetSalesOrderEmailsOld: TQuery
    DatabaseName = 'WT'
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
        DataType = ftUnknown
        Name = 'Int_sel'
        ParamType = ptUnknown
      end>
  end
  object qryGetSalesOrders: TQuery
    DatabaseName = 'Wt'
    SQL.Strings = (
      'SELECT DISTINCT'
      '      Sales_Order.Sales_order,'
      '      Sales_Order.Date_Required,'
      '      Sales_Order.customer_name,'
      '      Sales_Order.reference,'
      '      Sales_Order.address,'
      '      Sales_Order.customer,'
      '      Sales_Order.contact_name,'
      '      Sales_Order.Contact_no,'
      '      Sales_Order.Install_address,'
      '      Sales_Order.Install_Name,'
      '      Sales_Order.Install_Phone,'
      '      Sales_Order.Account_Manager,'
      '      Sales_Order.Extra_Notes,'
      '      Sales_Order.Template_Date,'
      '      Sales_Order.Location_Plan_Document,'
      '      Sales_Order.Revenue_Centre,'
      '      Sales_Order.Installation_address,'
      '      Operator.Operator_Name AS Account_Manager_Name,'
      '      Operator.Telephone_number,'
      '      Address.Postcode,'
      '      Fitter.Fitter,'
      '      Fitter.Fitter_Name,'
      '      Fitter.Email_Address'
      'FROM Fitter'
      '        RIGHT JOIN (Address'
      '        INNER JOIN (Operator'
      '        RIGHT JOIN (Int_Sel'
      '        INNER JOIN Sales_Order'
      '            ON Int_Sel.Sel1 = Sales_Order.Sales_Order)'
      '            ON Operator.Operator = Sales_Order.Account_Manager)'
      
        '            ON Address.Address = Sales_Order.Installation_Addres' +
        's)'
      '            ON Fitter.Fitter = Sales_Order.Fitter'
      'WHERE'
      '  (Int_sel.Int_sel_Code = :Int_sel)'
      'ORDER BY Address.PostCode'
      '')
    Left = 48
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_sel'
        ParamType = ptUnknown
      end>
  end
  object qryGetSalesOrderEmails: TQuery
    DatabaseName = 'Wt'
    SQL.Strings = (
      'SELECT DISTINCT'
      '        Sales_Order.Customer,'
      '        Sales_Order.Customer_Name,'
      #9#9'    Sales_Order.Fitter,'
      #9#9'    Fitter.Fitter_Name,'
      #9#9'    Fitter.Email_Address as Email,'
      '        '#39'Adobe Acrobat Document (*.pdf)'#39' as export_filter_desc,'
      #9'      '#39'PDF'#39' as ExportFilter,'
      '        '#39' '#39' as CC_Email,'
      '        Address.PostCode'
      'FROM Fitter '
      #9'RIGHT JOIN (Address '
      #9'INNER JOIN (Int_Sel '
      #9'INNER JOIN Sales_Order '
      #9#9'ON Int_Sel.Sel1 = Sales_Order.Sales_Order) '
      #9#9'ON Address.Address = Sales_Order.Installation_Address) '
      #9#9'ON Fitter.Fitter = Sales_Order.Fitter'
      'WHERE'
      '  (Int_sel.Int_sel_Code = :Int_Sel)'
      'GROUP BY'
      '    Sales_Order.Customer,'
      '    Sales_Order.Customer_Name,'
      '    Sales_Order.Fitter,'
      #9#9'Fitter.Fitter_Name,'
      #9#9'Fitter.Email_Address,'
      '    Address.PostCode')
    Left = 248
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_Sel'
        ParamType = ptUnknown
      end>
  end
  object qryGetSalesOrderEmail: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT DISTINCT'
      '      Sales_Order.Sales_order,'
      '      Sales_Order.Date_Required,'
      '      Sales_Order.customer_name,'
      '      Sales_Order.reference,'
      '      Sales_Order.address,'
      '      Sales_Order.customer,'
      '      Sales_Order.contact_name,'
      '      Sales_Order.Contact_no,'
      '      Sales_Order.Install_address,'
      '      Sales_Order.Install_Name,'
      '      Sales_Order.Install_Phone,'
      '      Sales_Order.Account_Manager,'
      '      Sales_Order.Extra_Notes,'
      '      Sales_Order.Template_Date,'
      '      Sales_Order.Location_Plan_Document,'
      '      Sales_Order.Revenue_Centre,'
      '      Sales_Order.Installation_address,'
      '      Operator.Operator_Name AS Account_Manager_Name,'
      '      Operator.Telephone_number,'
      '      Address.Postcode,'
      '      Fitter.Fitter,'
      '      Fitter.Fitter_Name,'
      '      Fitter.Email_Address'
      'FROM Fitter'
      '        RIGHT JOIN (Address'
      '        INNER JOIN (Operator'
      '        RIGHT JOIN (Int_Sel'
      '        INNER JOIN Sales_Order'
      '            ON Int_Sel.Sel1 = Sales_Order.Sales_Order)'
      '            ON Operator.Operator = Sales_Order.Account_Manager)'
      
        '            ON Address.Address = Sales_Order.Installation_Addres' +
        's)'
      '            ON Fitter.Fitter = Sales_Order.Fitter'
      'WHERE'
      '  Int_sel.Int_sel_Code = :Int_sel AND'
      '  Address.Postcode = :Postcode'
      'ORDER BY Address.PostCode')
    Left = 248
    Top = 79
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_sel'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Postcode'
        ParamType = ptUnknown
      end>
  end
end
