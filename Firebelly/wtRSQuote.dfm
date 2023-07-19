object frmWTRSQuote: TfrmWTRSQuote
  Left = 215
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Print Quote'
  ClientHeight = 356
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    444
    356)
  TextHeight = 13
  object btnPrint: TButton
    Left = 8
    Top = 319
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    Enabled = False
    TabOrder = 14
    OnClick = btnPrintClick
    ExplicitTop = 318
  end
  object Button4: TButton
    Left = 368
    Top = 319
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    TabOrder = 17
    OnClick = Button4Click
    ExplicitTop = 318
  end
  object chkbxprintLogo: TCheckBox
    Left = 8
    Top = 144
    Width = 200
    Height = 17
    Caption = 'Print your logo'
    TabOrder = 2
  end
  object SelectLst: TListBox
    Left = 408
    Top = 152
    Width = 25
    Height = 105
    ItemHeight = 13
    Sorted = True
    TabOrder = 18
    Visible = False
  end
  object chkbxShowDetail: TCheckBox
    Left = 8
    Top = 168
    Width = 200
    Height = 17
    Caption = 'Show price breakdown'
    TabOrder = 3
    OnClick = chkbxShowDetailClick
  end
  object btnPreview: TButton
    Left = 96
    Top = 319
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'P&review'
    Enabled = False
    TabOrder = 15
    OnClick = btnPreviewClick
    ExplicitTop = 318
  end
  object btnEmail: TButton
    Left = 184
    Top = 319
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Email'
    Enabled = False
    TabOrder = 16
    OnClick = btnEmailClick
    ExplicitTop = 318
  end
  object chkbxOnlyShowGrandTotal: TCheckBox
    Left = 8
    Top = 264
    Width = 200
    Height = 17
    Caption = 'ONLY Show Grand Total'
    TabOrder = 7
    OnClick = chkbxOnlyShowGrandTotalClick
  end
  object selectionGrp: TGroupBox
    Left = 8
    Top = 8
    Width = 313
    Height = 129
    Caption = 'Quote Number Selection'
    ParentBackground = False
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 88
      Width = 265
      Height = 26
      Caption = 
        'Enter quote numbers and/or quote ranges separated by commas. For' +
        ' example, 1234, 1236, 1240-1245'
      WordWrap = True
    end
    object memSelection: TMemo
      Left = 8
      Top = 16
      Width = 294
      Height = 68
      TabOrder = 0
      OnChange = EnableRun
      OnKeyPress = memSelectionKeyPress
    end
  end
  object chkbxIncludeConfirm: TCheckBox
    Left = 216
    Top = 168
    Width = 145
    Height = 17
    Caption = 'Include Order Confirmation'
    TabOrder = 10
  end
  object chkbxExcludeTemplate: TCheckBox
    Left = 8
    Top = 216
    Width = 200
    Height = 17
    Caption = 'Exclude Template && Fitting Charges'
    TabOrder = 5
  end
  object chkbxShowDiscount: TCheckBox
    Left = 8
    Top = 192
    Width = 200
    Height = 17
    Caption = 'Highlight Discount offered'
    TabOrder = 4
  end
  object chkbxPrintTemplate: TCheckBox
    Left = 216
    Top = 192
    Width = 233
    Height = 17
    Caption = 'Print/Email Template Conditions Document'
    Checked = True
    State = cbChecked
    TabOrder = 11
  end
  object chkbxPrintAvailability: TCheckBox
    Left = 216
    Top = 216
    Width = 225
    Height = 17
    Caption = 'Print/Email Availability Terms Document'
    Checked = True
    State = cbChecked
    TabOrder = 12
  end
  object chkbxPrintTerms: TCheckBox
    Left = 216
    Top = 240
    Width = 233
    Height = 17
    Caption = 'Print/Email Terms && Conditions Document'
    Checked = True
    State = cbChecked
    TabOrder = 13
  end
  object chkbxShowOffer: TCheckBox
    Left = 216
    Top = 144
    Width = 177
    Height = 17
    Caption = 'Show Offer Image'
    TabOrder = 9
  end
  object rdgrpType: TRadioGroup
    Left = 328
    Top = 8
    Width = 105
    Height = 65
    Caption = 'Type '
    ItemIndex = 0
    Items.Strings = (
      'Detailed'
      'Summary')
    ParentBackground = False
    TabOrder = 1
  end
  object chkbxEndUserMarkup: TCheckBox
    Left = 8
    Top = 240
    Width = 200
    Height = 17
    Caption = 'Apply End User Markup/Multiplier'
    TabOrder = 6
  end
  object chkbxHideAllPrices: TCheckBox
    Left = 8
    Top = 288
    Width = 200
    Height = 17
    Caption = 'Hide ALL prices and totals'
    TabOrder = 8
    OnClick = chkbxHideAllPricesClick
  end
  object qryGetQuotes: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Int_Sel.Int_Sel_Code,'
      '        Int_Sel.Sel1,'
      '        Quote.Quote,'
      '        Quote.Customer,'
      '        Quote.Customer_Name,'
      '        Quote.Contact_Name,'
      '        Customer_contact.Email_address as Contact_Email,'
      '        Customer.Email_Address AS Customer_Email,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Customer_is_Speculative,'
      '        Address.Fax_number,'
      '        Address.Email_Address,'
      '        '#39'Adobe Acrobat Document (*.pdf)'#39' AS export_filter_desc,'
      '        '#39'PDF'#39' AS ExportFilter,'
      '        '#39' '#39' AS CC_Email'
      'FROM Customer_contact'
      '        RIGHT JOIN (Customer'
      '        INNER JOIN (Address'
      '        RIGHT JOIN (Int_Sel'
      '        INNER JOIN Quote'
      '          ON Int_Sel.Sel1 = Quote.Quote)'
      '          ON Address.Address = Quote.Address)'
      '          ON Customer.Customer = Quote.Customer)'
      
        '          ON (Customer_contact.Contact_name = Quote.Contact_Name' +
        ') AND (Customer_contact.Customer = Quote.Customer)'
      'WHERE Int_Sel.Int_Sel_Code = :Int_Sel_Code'
      'ORDER BY Quote.Customer_Name, Quote.Quote'
      '')
    Left = 136
    Top = 50
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end>
  end
  object qryQuoteMaterial: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  TOP 1'
      '        Quote_Element.Quote,'
      '        Quote_Element.Element_Number,'
      '        Quote_Element.Thickness,'
      '        Thickness.Thickness_mm,'
      '        Worktop.Description as Colour_Description,'
      '        Material_Type.Description as Material_Description,'
      '        Worktop_Type.Worktop_Type,'
      '        Worktop_Type.Description AS Worktop_Material'
      'FROM Worktop_Type'
      '      RIGHT JOIN (Material_Type'
      '      INNER JOIN ((Quote_Element'
      '      LEFT JOIN Thickness'
      '        ON Quote_Element.Thickness = Thickness.Thickness)'
      '      LEFT JOIN Worktop'
      '        ON Quote_Element.Worktop = Worktop.Worktop)'
      
        '        ON Material_Type.Material_Type = Quote_Element.Material_' +
        'type)'
      
        '        ON Worktop_Type.Worktop_Type = Material_Type.Worktop_Typ' +
        'e'
      'WHERE Quote = :Quote'
      'ORDER BY Quote, Element_Number')
    Left = 267
    Top = 62
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object OldqryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Quote.*,'
      '        Operator.Operator_Name,'
      '        Operator.Telephone_number,'
      '        Account_Manager.Operator_Name AS Account_Manager_Name,'
      '        Account_Manager.Telephone_number as AM_Telephone_Number,'
      '        Vat.Vat_rate,'
      '        Sales_Lead_Source.Sales_Lead_Source,'
      '        Sales_Lead_Source.Sales_Lead_Source_Descr,'
      '        Material_Type.Material_Type,'
      '        Material_Type.Description as Material_Description'
      'FROM Sales_Lead_Source'
      '      RIGHT JOIN (Material_Type'
      '      INNER JOIN (Vat'
      '      INNER JOIN (Operator AS Account_Manager'
      '      RIGHT JOIN (Int_Sel'
      '      INNER JOIN (Operator'
      '      INNER JOIN Quote'
      '        ON Operator.Operator = Quote.Operator)'
      '        ON Int_Sel.Sel1 = Quote.Quote)'
      '        ON Account_Manager.Operator = Quote.Account_Manager)'
      '        ON Vat.Vat = Quote.Vat)'
      '        ON Material_Type.Material_Type = Quote.Material_Type)'
      
        '        ON Sales_Lead_Source.Sales_Lead_Source = Quote.Sales_Lea' +
        'd_Source'
      'WHERE Int_Sel.Int_Sel_Code = :Int_Sel')
    Left = 267
    Top = 6
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_Sel'
        ParamType = ptUnknown
      end>
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote.*,'
      '        Operator.Operator_Name,'
      '        Operator.Telephone_number,'
      '        Account_Manager.Operator_Name AS Account_Manager_Name,'
      '        Account_Manager.Telephone_number AS AM_Telephone_Number,'
      '        Vat.Vat_rate,'
      '        Sales_Lead_Source.Sales_Lead_Source,'
      '        Sales_Lead_Source.Sales_Lead_Source_Descr,'
      '        Material_Type.Material_Type,'
      '        Material_Type.Description AS Material_Description,'
      '        Customer.Customer_is_Speculative'
      'FROM Customer'
      '      INNER JOIN (Vat'
      '      INNER JOIN (Sales_Lead_Source'
      '      RIGHT JOIN (Material_Type'
      '      INNER JOIN (Operator AS Account_Manager'
      '      RIGHT JOIN (Int_Sel'
      '      INNER JOIN (Operator'
      '      INNER JOIN Quote'
      '        ON Operator.Operator = Quote.Operator)'
      '        ON Int_Sel.Sel1 = Quote.Quote)'
      '        ON Account_Manager.Operator = Quote.Account_Manager)'
      '        ON Material_Type.Material_Type = Quote.Material_Type)'
      
        '        ON Sales_Lead_Source.Sales_Lead_Source = Quote.Sales_Lea' +
        'd_Source)'
      '        ON Vat.Vat = Quote.Vat)'
      '        ON Customer.Customer = Quote.Customer'
      'WHERE Int_Sel.Int_Sel_Code = :Int_Sel')
    Left = 347
    Top = 6
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_Sel'
        ParamType = ptUnknown
      end>
  end
end
