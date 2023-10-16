object PBRPCusSupLabsFrm: TPBRPCusSupLabsFrm
  Left = 98
  Top = 95
  Width = 674
  Height = 450
  HorzScrollBar.Range = 1200
  VertScrollBar.Position = 5
  VertScrollBar.Range = 2000
  AutoScroll = False
  Caption = 'PBRPCusSupLabsFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Scaled = True
  PixelsPerInch = 96
  TextHeight = 14
  object PBLabelsQuickReport: TQuickRep
    Left = -8
    Top = -5
    Width = 578
    Height = 578
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = PBLabelsQuickReportBeforePrint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = []
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = Custom
    Page.Values = (
      490
      1530
      50
      1530
      50
      50
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object QRBand1: TQRSubDetail
      Left = 19
      Top = 19
      Width = 540
      Height = 329
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        870.479166666667
        1428.75)
      Master = PBLabelsQuickReport
      DataSet = GetDetsSQL
      PrintBefore = False
      PrintIfEmpty = True
      object AddressMemo: TQRMemo
        Left = 79
        Top = 155
        Width = 308
        Height = 89
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          235.479166666667
          209.020833333333
          410.104166666667
          814.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object lblCustomer: TQRLabel
        Left = 79
        Top = 134
        Width = 100
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          209.020833333333
          354.541666666667
          264.583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XXXXXXXXX'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object DeliveryDateLbl: TQRLabel
        Left = 197
        Top = 134
        Width = 116
        Height = 19
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          521.229166666667
          354.541666666667
          306.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NEVER PRINTS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object FAOQRLabel: TQRLabel
        Left = 79
        Top = 114
        Width = 241
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          209.020833333333
          301.625
          637.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXX'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object qrmCompany: TQRMemo
        Left = 344
        Top = 8
        Width = 193
        Height = 92
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          243.416666666667
          910.166666666667
          21.1666666666667
          510.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Int_Sel.*'
      'FROM Int_Sel'
      'WHERE'#9'(Int_Sel.Int_Sel_Code = :Int_sel_code) and'
      '        (sel1 <> 0)'
      'ORDER BY Int_Sel.sel1 ASC'
      ' '
      ' '
      ' ')
    Left = 320
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_sel_code'
        ParamType = ptUnknown
      end>
  end
  object PODelivSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 287
    Top = 288
  end
  object CustomerSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Customer.Name as Name,'
      '        Customer_Branch.Building_no_name,'
      '        Customer_Branch.Street,'
      '        Customer_Branch.Locale,'
      '        Customer_Branch.Town,'
      '        Customer_Branch.Postcode,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Contact.Name as Contact_Name'
      'FROM Customer INNER JOIN (Customer_Branch'
      
        'LEFT JOIN Customer_Contact ON (Customer_Branch.Branch_no = Custo' +
        'mer_Contact.Branch_no) AND'
      
        '(Customer_Branch.Customer = Customer_Contact.Customer)) ON Custo' +
        'mer.Customer = Customer_Branch.Customer'
      
        'WHERE (((Customer_Branch.Customer)= :Customer And (Customer_Bran' +
        'ch.Customer)=Customer.Customer) AND'
      
        '((Customer_Branch.Branch_no)= :Branch_no) AND ((((Customer_Conta' +
        'ct.Contact_no)= :Contact_No)) or (:Contact_No = 0)))'
      ''
      '')
    Left = 214
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end>
  end
  object AddressSRC: TDataSource
    DataSet = CustomerSQL
    Left = 88
    Top = 360
  end
  object CompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Company.Name as Company_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode,'
      '        Phone'
      'from Company'
      'where Company = 1'
      ' '
      ' ')
    Left = 357
    Top = 352
  end
  object SupplierSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Supplier.Name as Name,'
      '        Supplier_Branch.Building_no_name,'
      '        Supplier_Branch.Street,'
      '        Supplier_Branch.Locale,'
      '        Supplier_Branch.Town,'
      '        Supplier_Branch.Postcode,'
      '        Supplier_Branch.Name as Branch_Name,'
      '        Supplier_BranchContacts.Name as Contact_Name'
      
        'FROM (Supplier INNER JOIN Supplier_Branch ON Supplier.Supplier =' +
        ' Supplier_Branch.Supplier)'
      
        'LEFT JOIN Supplier_BranchContacts ON (Supplier_Branch.Branch_no ' +
        '= Supplier_BranchContacts.Branch_no) AND'
      '(Supplier_Branch.Supplier = Supplier_BranchContacts.Supplier)'
      
        'WHERE (((Supplier_Branch.Supplier)= :Supplier And (Supplier_Bran' +
        'ch.Supplier)= Supplier.Supplier) AND'
      
        ' ((Supplier_Branch.Branch_no)=:Branch_no) AND ((((Supplier_Branc' +
        'hContacts.Contact_no)= :Contact_No)) or (:Contact_No = 0)))'
      '')
    Left = 254
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end>
  end
end
