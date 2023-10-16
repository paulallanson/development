object STRPLabelsDelivFrm: TSTRPLabelsDelivFrm
  Left = 126
  Top = 101
  Width = 663
  Height = 591
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  Caption = 'STRPLabelsDelivFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = True
  TextHeight = 14
  object STLabelsQuickReport: TQuickRep
    Left = 40
    Top = 0
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = STLabelsQuickReportBeforePrint
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
    Page.Columns = 2
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      0.000000000000000000
      2970.000000000000000000
      5.000000000000000000
      2100.000000000000000000
      40.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 2
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand1: TQRSubDetail
      Left = 15
      Top = 2
      Width = 380
      Height = 280
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        740.833333333333300000
        1005.416666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = STLabelsQuickReport
      DataSet = SODelivSQL
      PrintBefore = False
      PrintIfEmpty = True
      object FormRefLbl: TQRLabel
        Left = 93
        Top = 208
        Width = 81
        Height = 16
        Size.Values = (
          42.333333333333330000
          246.062500000000000000
          550.333333333333300000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'XXXXXXXXXX'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object DescrQRLabel: TQRLabel
        Left = 93
        Top = 226
        Width = 244
        Height = 16
        Size.Values = (
          42.333333333333300000
          246.062500000000000000
          597.958333333333000000
          645.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'lblCustomer'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape3: TQRShape
        Left = 16
        Top = 24
        Width = 345
        Height = 6
        Size.Values = (
          15.875000000000000000
          42.333333333333300000
          63.500000000000000000
          912.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object CompNameQRLabel: TQRLabel
        Left = 16
        Top = 30
        Width = 345
        Height = 24
        Size.Values = (
          63.500000000000000000
          42.333333333333300000
          79.375000000000000000
          912.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Company Name'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 13
      end
      object CompAddrQRLabel: TQRLabel
        Left = 16
        Top = 50
        Width = 345
        Height = 15
        Size.Values = (
          39.687500000000000000
          42.333333333333300000
          132.291666666667000000
          912.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Company Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRShape4: TQRShape
        Left = 16
        Top = 64
        Width = 345
        Height = 6
        Size.Values = (
          15.875000000000000000
          42.333333333333300000
          169.333333333333000000
          912.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel7: TQRLabel
        Left = 21
        Top = 208
        Width = 67
        Height = 16
        Size.Values = (
          42.333333333333330000
          55.562500000000000000
          550.333333333333300000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel1: TQRLabel
        Left = 21
        Top = 226
        Width = 68
        Height = 16
        Size.Values = (
          42.333333333333300000
          55.562500000000000000
          597.958333333333000000
          179.916666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Doc Ref:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel2: TQRLabel
        Left = 176
        Top = 251
        Width = 21
        Height = 17
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          664.104166666666700000
          55.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Box'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 200
        Top = 248
        Width = 57
        Height = 25
        Size.Values = (
          66.145833333333300000
          529.166666666667000000
          656.166666666667000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel4: TQRLabel
        Left = 262
        Top = 251
        Width = 12
        Height = 17
        Size.Values = (
          44.979166666666670000
          693.208333333333300000
          664.104166666666700000
          31.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'of'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRShape2: TQRShape
        Left = 280
        Top = 248
        Width = 57
        Height = 25
        Size.Values = (
          66.145833333333300000
          740.833333333333000000
          656.166666666667000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 21
        Top = 186
        Width = 47
        Height = 20
        Size.Values = (
          52.916666666666670000
          55.562500000000000000
          492.125000000000000000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'F.A.O.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object FAOQRLabel: TQRLabel
        Left = 96
        Top = 186
        Width = 241
        Height = 19
        Size.Values = (
          50.270833333333300000
          254.000000000000000000
          492.125000000000000000
          637.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'lblCustomer'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object AddressMemo: TQRMemo
        Left = 21
        Top = 99
        Width = 308
        Height = 81
        Size.Values = (
          214.312500000000000000
          55.562500000000000000
          261.937500000000000000
          814.916666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
      object lblCustomer: TQRLabel
        Left = 21
        Top = 78
        Width = 84
        Height = 19
        Size.Values = (
          50.270833333333330000
          55.562500000000000000
          206.375000000000000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblCustomer'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object DeliveryDateLbl: TQRLabel
        Left = 157
        Top = 78
        Width = 116
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          415.395833333333300000
          206.375000000000000000
          306.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NEVER PRINTS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
    end
  end
  object SODelivSRC: TDataSource
    DataSet = SODelivSQL
    Left = 335
    Top = 96
  end
  object AddressSRC: TDataSource
    DataSet = CustomerSQL
    Left = 88
    Top = 360
  end
  object AdhocSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode,'
      '        Name as branch_Name'
      'from Ad_hoc_Address'
      'where Ad_hoc_Address = :Ad_hoc_Address')
    Left = 161
    Top = 336
    ParamData = <
      item
        Name = 'Ad_hoc_Address'
      end>
  end
  object CustomerSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode,'
      'Customer_Branch.Name as Branch_Name,'
      'Customer_Branch.Use_Branch_Name'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Customer = :Customer) and'
      #9#9#9'(Branch_no = :Branch_no)) and'
      '        Customer_Branch.Customer = Customer.Customer'
      ' '
      ' ')
    Left = 406
    Top = 360
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object SODelivSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Int_Sel.*,'
      '        Sales_Order.*,'
      '        Customer_Contact.Name as Contact_Name'
      'FROM Customer_Contact'
      '      INNER JOIN (Sales_Order'
      '      INNER JOIN Int_Sel ON'
      '        Sales_Order.Sales_Order = Int_Sel.Sel2) ON'
      
        '        (Customer_Contact.Contact_no = Sales_Order.Contact_no) A' +
        'ND'
      '        (Customer_Contact.Branch_no = Sales_Order.Branch_no) AND'
      '        (Customer_Contact.Customer = Sales_Order.Customer)'
      'WHERE Int_Sel.Int_sel_Code = :Int_Sel_Code'
      'ORDER BY Int_Sel.Sel1,Int_Sel.Sel2, Int_sel.Sel3, Int_sel.Sel4 ')
    Left = 331
    Top = 51
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end>
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
    Left = 349
    Top = 360
  end
end
