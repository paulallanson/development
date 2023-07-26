object PBRPCusSupLabsFrm: TPBRPCusSupLabsFrm
  Left = 98
  Top = 95
  Width = 1276
  Height = 689
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
  Scaled = False
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
      450.000000000000000000
      1530.000000000000000000
      50.000000000000000000
      1530.000000000000000000
      50.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object QRBand1: TQRSubDetail
      Left = 19
      Top = 19
      Width = 540
      Height = 334
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
        883.708333333333300000
        1428.750000000000000000)
      Master = PBLabelsQuickReport
      DataSet = GetDetsSQL
      PrintBefore = False
      PrintIfEmpty = True
      object AddressMemo: TQRMemo
        Left = 4
        Top = 187
        Width = 308
        Height = 110
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          291.041666666666700000
          10.583333333333330000
          494.770833333333300000
          814.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lato'
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
        FontSize = 10
      end
      object lblCustomer: TQRLabel
        Left = 4
        Top = 166
        Width = 64
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          10.583333333333330000
          439.208333333333300000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DeliveryDateLbl: TQRLabel
        Left = 165
        Top = 166
        Width = 96
        Height = 19
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          436.562500000000000000
          439.208333333333300000
          254.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NEVER PRINTS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object FAOQRLabel: TQRLabel
        Left = 4
        Top = 146
        Width = 241
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          10.583333333333330000
          386.291666666666700000
          637.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrmCompany: TQRMemo
        Left = 346
        Top = 2
        Width = 177
        Height = 105
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          277.812500000000000000
          915.458333333333200000
          5.291666666666667000
          468.312500000000100000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object imgReport: TQRImage
        Left = 2
        Top = 2
        Width = 315
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          108.479166666666700000
          5.291666666666667000
          5.291666666666667000
          833.437500000000000000)
        Center = True
        Stretch = True
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
      '        Customer_Branch.County,'
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
      '        Supplier_Branch.County,'
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
