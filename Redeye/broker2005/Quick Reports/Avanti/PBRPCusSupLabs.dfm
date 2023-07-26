object PBRPCusSupLabsFrm: TPBRPCusSupLabsFrm
  Left = 132
  Top = 88
  Width = 550
  Height = 450
  HorzScrollBar.Range = 1200
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
    Left = 32
    Top = 0
    Width = 480
    Height = 378
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
    Page.Orientation = poPortrait
    Page.PaperSize = NexusLabel
    Page.Values = (
      0.000000000000000000
      1000.000000000000000000
      100.000000000000000000
      1270.000000000000000000
      0.000000000000000000
      0.000000000000000000
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
    PreviewInitialState = wsNormal
    object QRBand1: TQRSubDetail
      Left = 0
      Top = 38
      Width = 480
      Height = 326
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        862.541666666666900000
        1270.000000000000000000)
      Master = PBLabelsQuickReport
      DataSet = GetDetsSQL
      PrintBefore = False
      PrintIfEmpty = True
      object AddressMemo: TQRMemo
        Left = 69
        Top = 113
        Width = 308
        Height = 128
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          338.666666666666700000
          182.562500000000000000
          298.979166666666700000
          814.916666666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
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
      object FAOQRLabel: TQRLabel
        Left = 69
        Top = 87
        Width = 97
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          182.562500000000000000
          230.187500000000000000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FAOQRLabel'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
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
