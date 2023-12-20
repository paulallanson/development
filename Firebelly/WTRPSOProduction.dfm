object frmWTRPSOProduction: TfrmWTRPSOProduction
  Left = 203
  Top = 110
  Caption = 'Sales Order Production Report'
  ClientHeight = 472
  ClientWidth = 1152
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object qrpdetails: TQuickRep
    Left = 144
    Top = 8
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = qrpdetailsBeforePrint
    DataSet = qryWorktops
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
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
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
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
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
    object qrSubMaterial: TQRSubDetail
      Left = 38
      Top = 155
      Width = 718
      Height = 27
      AfterPrint = qrSubMaterialAfterPrint
      AlignToBottom = False
      BeforePrint = qrSubMaterialBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        71.437500000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpdetails
      DataSet = qryWorktops
      FooterBand = qrgrpFootMaterial
      HeaderBand = qrgrpHeadMaterial
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblMaterialDescription: TQRLabel
        Left = 64
        Top = 4
        Width = 136
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          10.583333333333330000
          359.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblMaterialDescription'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblArea: TQRLabel
        Left = 480
        Top = 4
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          10.583333333333330000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblArea'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrgrpHeadMaterial: TQRBand
      Left = 38
      Top = 153
      Width = 718
      Height = 2
      AlignToBottom = False
      BeforePrint = qrgrpHeadMaterialBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        5.291666666666667000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object qrlblMaterialTitle: TQRLabel
        Left = 64
        Top = 8
        Width = 117
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          21.166666666666670000
          309.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Material Type/Brand'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblMaterialCount: TQRLabel
        Left = 434
        Top = 8
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          1148.291666666667000000
          21.166666666666670000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Area (sqm)'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrSubCutOuts: TQRSubDetail
      Left = 38
      Top = 214
      Width = 718
      Height = 32
      AfterPrint = qrSubCutOutsAfterPrint
      AlignToBottom = False
      BeforePrint = qrSubCutOutsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpdetails
      DataSet = qryCutOuts
      HeaderBand = qrgrpHeadCutOuts
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblCutOutDescription: TQRLabel
        Left = 64
        Top = 8
        Width = 393
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          21.166666666666670000
          1039.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblCutOutDescription'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblQuantity: TQRLabel
        Left = 458
        Top = 8
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1211.791666666667000000
          21.166666666666670000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblQuantity'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrgrpHeadCutOuts: TQRBand
      Left = 38
      Top = 212
      Width = 718
      Height = 2
      AfterPrint = qrgrpHeadCutOutsAfterPrint
      AlignToBottom = False
      BeforePrint = qrgrpHeadCutOutsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        5.291666666666667000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object qrlblCutOutTitle: TQRLabel
        Left = 64
        Top = 6
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          15.875000000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cut Outs'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblCutOutCount: TQRLabel
        Left = 454
        Top = 6
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          1201.208333333333000000
          15.875000000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Number'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrsubEdgeProfile: TQRSubDetail
      Left = 38
      Top = 248
      Width = 718
      Height = 32
      AfterPrint = qrsubEdgeProfileAfterPrint
      AlignToBottom = False
      BeforePrint = qrsubEdgeProfileBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpdetails
      DataSet = qryEdges
      FooterBand = qrgrpFootEdgeProfile
      HeaderBand = qrgrpEdgeProfile
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblEdgeProfileDescription: TQRLabel
        Left = 64
        Top = 8
        Width = 393
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          21.166666666666670000
          1039.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblEdgeProfileDescription'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblLength: TQRLabel
        Left = 468
        Top = 8
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          1238.250000000000000000
          21.166666666666670000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblLength'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrgrpEdgeProfile: TQRBand
      Left = 38
      Top = 246
      Width = 718
      Height = 2
      AfterPrint = qrgrpEdgeProfileAfterPrint
      AlignToBottom = False
      BeforePrint = qrgrpEdgeProfileBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        5.291666666666667000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object qrlblEdgeTitle: TQRLabel
        Left = 64
        Top = 7
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          18.520833333333330000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Edge Profiles'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblEdgeCount: TQRLabel
        Left = 437
        Top = 7
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          1156.229166666667000000
          18.520833333333330000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Length (m)'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 115
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        304.270833333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblCaption: TQRLabel
        Left = 226
        Top = 2
        Width = 269
        Height = 23
        Size.Values = (
          60.854166666666670000
          597.958333333333300000
          5.291666666666667000
          711.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Production Requirement Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object qrlblDateRange: TQRLabel
        Left = 316
        Top = 26
        Width = 88
        Height = 17
        Size.Values = (
          44.979166666666670000
          836.083333333333300000
          68.791666666666670000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblDateRange'
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
      object gtQRSysData1: TQRSysData
        Left = 654
        Top = 8
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          1730.375000000000000000
          21.166666666666670000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRSysData2: TQRSysData
        Left = 640
        Top = 23
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          1693.333333333333000000
          60.854166666666670000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page: '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblSelection: TQRLabel
        Left = 183
        Top = 46
        Width = 353
        Height = 17
        Size.Values = (
          44.979166666666670000
          484.187500000000000000
          121.708333333333300000
          933.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblSelection'
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
      object qrlblCategoryTitle: TQRLabel
        Left = 64
        Top = 94
        Width = 169
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          248.708333333333300000
          447.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CNC - Cut Out Requirements'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblCategoryCount: TQRLabel
        Left = 486
        Top = 94
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          1285.875000000000000000
          248.708333333333300000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Number'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrgrpFootMaterial: TQRBand
      Left = 38
      Top = 182
      Width = 718
      Height = 30
      AlignToBottom = False
      BeforePrint = qrgrpFootMaterialBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object gtQRLabel1: TQRLabel
        Left = 312
        Top = 8
        Width = 105
        Height = 17
        Size.Values = (
          44.979166666666670000
          825.500000000000000000
          21.166666666666670000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Area (sqm)'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblTotalArea: TQRLabel
        Left = 472
        Top = 8
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          21.166666666666670000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblArea'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape1: TQRShape
        Left = 284
        Top = 0
        Width = 249
        Height = 8
        Size.Values = (
          21.166666666666670000
          751.416666666666700000
          0.000000000000000000
          658.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object qrgrpFootEdgeProfile: TQRBand
      Left = 38
      Top = 280
      Width = 718
      Height = 30
      AlignToBottom = False
      BeforePrint = qrgrpFootEdgeProfileBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblTotalLength: TQRLabel
        Left = 426
        Top = 8
        Width = 106
        Height = 17
        Size.Values = (
          44.979166666666670000
          1127.125000000000000000
          21.166666666666670000
          280.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalLength'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel2: TQRLabel
        Left = 304
        Top = 8
        Width = 125
        Height = 17
        Size.Values = (
          44.979166666666670000
          804.333333333333300000
          21.166666666666670000
          330.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Linear metres'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape3: TQRShape
        Left = 284
        Top = 0
        Width = 249
        Height = 8
        Size.Values = (
          21.166666666666670000
          751.416666666666700000
          0.000000000000000000
          658.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qryWorktops: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Material_Type.Description AS Material_Description,'
      
        '        Sum(((Quote_Element.Depth*Quote_Element.Length)/1000000)' +
        '*Quote_Element.Quantity) AS Total_Area'
      'FROM Customer'
      '        INNER JOIN (Material_Type'
      '        INNER JOIN (Sales_Order'
      '        INNER JOIN (((Quote_Element'
      '        INNER JOIN (Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '          ON Quote_Element.Quote = Quote.Quote)'
      '        INNER JOIN Worktop'
      '          ON Quote_Element.Worktop = Worktop.Worktop)'
      '        INNER JOIN Thickness'
      '          ON Quote_Element.Thickness = Thickness.Thickness)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      '          ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      '      (Sales_Order.Sales_Order_Status < 1000) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      ''
      '')
    Left = 976
    Top = 192
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
  end
  object qryCutOuts: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Material_Type.Description AS Material_Description,'
      '        Edge_Type.Edge_Type_Description,'
      '        CutOut.Description AS CutOut_Description,'
      '        Sum(Quote_Cutout.Quantity) AS Total_Quantity'
      'FROM Customer'
      '        INNER JOIN (Sales_Order'
      '        INNER JOIN (CutOut'
      '        INNER JOIN ((Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '        INNER JOIN ((Quote_Cutout'
      '        INNER JOIN Material_Type'
      
        '          ON Quote_Cutout.Material_Type = Material_Type.Material' +
        '_Type)'
      '        INNER JOIN Edge_Type'
      '          ON Quote_Cutout.Edge_Type = Edge_Type.Edge_Type)'
      '          ON Quote.Quote = Quote_Cutout.Quote)'
      '          ON CutOut.CutOut = Quote_Cutout.Cutout)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      '      (Sales_Order.Sales_Order_Status < 90) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      ((Customer.Is_Retail_Customer = :TradeRetail) OR (:TradeRe' +
        'tail = '#39'A'#39'))'
      '')
    Left = 976
    Top = 248
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'TradeRetail'
      end
      item
        Name = 'TradeRetail'
      end>
  end
  object qryEdges: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Edge_profile.Description AS Edge_Profile_Description,'
      '        Material_Type.Description as Material_Description,'
      '        Edge_Type.Edge_Type_Description,'
      '        Sum(Quote_Edge.Length/1000) AS Total_Length'
      'FROM Customer'
      '      INNER JOIN (Sales_Order'
      '      INNER JOIN (Edge_profile'
      '      INNER JOIN ((Sales_Order_Line'
      '      INNER JOIN Quote'
      '        ON Sales_Order_Line.Quote = Quote.Quote)'
      '      INNER JOIN ((Quote_Edge'
      '      INNER JOIN Material_Type'
      
        '        ON Quote_Edge.Material_Type = Material_Type.Material_Typ' +
        'e)'
      '      INNER JOIN Edge_Type'
      '        ON Quote_Edge.Edge_Type = Edge_Type.Edge_Type)'
      '        ON Quote.Quote = Quote_Edge.Quote)'
      '        ON Edge_profile.Edge_profile = Quote_Edge.Edge_profile)'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Orde' +
        'r)'
      '        ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      '      (Sales_Order.Sales_Order_Status < 90) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      ((Customer.Is_Retail_Customer = :TradeRetail) OR (:TradeRe' +
        'tail = '#39'A'#39'))'
      '')
    Left = 976
    Top = 312
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'TradeRetail'
      end
      item
        Name = 'TradeRetail'
      end>
  end
  object qryBaseCutOuts: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'FROM Customer'
      '        INNER JOIN (Sales_Order'
      '        INNER JOIN (CutOut'
      '        INNER JOIN ((Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '        INNER JOIN ((Quote_Cutout'
      '        INNER JOIN Material_Type'
      
        '          ON Quote_Cutout.Material_Type = Material_Type.Material' +
        '_Type)'
      '        INNER JOIN Edge_Type'
      '          ON Quote_Cutout.Edge_Type = Edge_Type.Edge_Type)'
      '          ON Quote.Quote = Quote_Cutout.Quote)'
      '          ON CutOut.CutOut = Quote_Cutout.Cutout)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      '      (Sales_Order.Sales_Order_Status < 1000) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      '')
    Left = 1048
    Top = 248
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
  end
  object qryBaseEdges: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'FROM Customer'
      '      INNER JOIN (Sales_Order'
      '      INNER JOIN (Edge_profile'
      '      INNER JOIN ((Sales_Order_Line'
      '      INNER JOIN Quote'
      '        ON Sales_Order_Line.Quote = Quote.Quote)'
      '      INNER JOIN ((Quote_Edge'
      '      INNER JOIN Material_Type'
      
        '        ON Quote_Edge.Material_Type = Material_Type.Material_Typ' +
        'e)'
      '      INNER JOIN Edge_Type'
      '        ON Quote_Edge.Edge_Type = Edge_Type.Edge_Type)'
      '        ON Quote.Quote = Quote_Edge.Quote)'
      '        ON Edge_profile.Edge_profile = Quote_Edge.Edge_profile)'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Orde' +
        'r)'
      '        ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      '      (Sales_Order.Sales_Order_Status < 1000) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      '')
    Left = 1048
    Top = 312
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
  end
end
