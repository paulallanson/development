object PBRPDelivFrm: TPBRPDelivFrm
  Left = 198
  Top = 12
  Width = 1046
  Height = 700
  HorzScrollBar.Position = 126
  HorzScrollBar.Range = 1200
  VertScrollBar.Position = 327
  VertScrollBar.Range = 2000
  Caption = 'Delivery Note'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -16
  Font.Name = 'Courier New'
  Font.Style = []
  Scaled = False
  TextHeight = 18
  object PBDelivQuickReport: TQuickRep
    Left = 26
    Top = -15
    Width = 992
    Height = 1403
    ShowingPreview = False
    BeforePrint = PBDelivQuickReportBeforePrint
    DataSet = PODelivSQL
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Gill Sans MT'
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
      65.000000000000000000
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
    object QRBand1: TQRSubDetail
      Left = 31
      Top = 47
      Width = 938
      Height = 915
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Gill Sans MT'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        1936.750000000000000000
        1985.433333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = PBDelivQuickReport
      DataSet = PODelivSQL
      PrintBefore = False
      PrintIfEmpty = True
      object Accountlbl: TQRLabel
        Left = 20
        Top = 420
        Width = 141
        Height = 30
        Size.Values = (
          63.500000000000000000
          42.333333333333330000
          889.000000000000000000
          298.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'XXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object PONumberLbl: TQRLabel
        Left = 790
        Top = 421
        Width = 141
        Height = 30
        Size.Values = (
          63.500000000000000000
          1672.166666666667000000
          891.116666666666700000
          298.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'XXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object DateLbl: TQRLabel
        Left = 660
        Top = 423
        Width = 125
        Height = 30
        Size.Values = (
          63.500000000000000000
          1397.000000000000000000
          895.350000000000000000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'XX/XX/XXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object BoxesLbl: TQRLabel
        Left = 820
        Top = 543
        Width = 97
        Height = 30
        Size.Values = (
          63.500000000000000000
          1735.666666666667000000
          1149.350000000000000000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NNNNNN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QtyOrderedLbl: TQRLabel
        Left = 10
        Top = 543
        Width = 113
        Height = 30
        Size.Values = (
          63.500000000000000000
          21.166666666666670000
          1149.350000000000000000
          239.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NNNNNNN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object OrderRefLbl: TQRLabel
        Left = 520
        Top = 423
        Width = 99
        Height = 30
        Size.Values = (
          63.500000000000000000
          1100.666666666667000000
          895.350000000000000000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'XXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object YourRefLbl: TQRLabel
        Left = 180
        Top = 423
        Width = 155
        Height = 30
        Size.Values = (
          63.500000000000000000
          381.000000000000000000
          895.350000000000000000
          328.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'XXXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QuantityLbl: TQRLabel
        Left = 641
        Top = 539
        Width = 113
        Height = 30
        Size.Values = (
          63.500000000000000000
          1356.783333333333000000
          1140.883333333333000000
          239.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NNNNNNN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object DescLbl: TQRLabel
        Left = 150
        Top = 545
        Width = 421
        Height = 30
        Size.Values = (
          63.500000000000000000
          317.500000000000000000
          1153.583333333333000000
          891.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRDBText2: TQRDBText
        Left = 180
        Top = 421
        Width = 321
        Height = 30
        Size.Values = (
          63.500000000000000000
          381.000000000000000000
          891.645833333333300000
          679.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Cust_Order_no'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRDBText3: TQRDBText
        Left = 520
        Top = 421
        Width = 138
        Height = 30
        Size.Values = (
          63.500000000000000000
          1100.666666666667000000
          891.116666666666700000
          292.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Purchase_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRDBText4: TQRDBText
        Left = 20
        Top = 543
        Width = 73
        Height = 30
        Size.Values = (
          63.500000000000000000
          42.333333333333330000
          1149.350000000000000000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRDBText5: TQRDBText
        Left = 641
        Top = 543
        Width = 133
        Height = 30
        Size.Values = (
          63.500000000000000000
          1356.783333333333000000
          1149.350000000000000000
          281.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Qty_to_Deliver'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRDBText6: TQRDBText
        Left = 150
        Top = 543
        Width = 431
        Height = 86
        Size.Values = (
          182.562500000000000000
          317.500000000000000000
          1148.291666666667000000
          912.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Customers_Desc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object AddressMemo: TQRMemo
        Left = 20
        Top = 209
        Width = 414
        Height = 183
        Size.Values = (
          386.291666666666700000
          42.333333333333330000
          441.854166666666700000
          875.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        Lines.Strings = (
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          ''
          '')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
      object DeliveryMemo: TQRMemo
        Left = 511
        Top = 209
        Width = 414
        Height = 183
        Size.Values = (
          386.291666666666700000
          1082.145833333333000000
          441.854166666666700000
          875.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        Lines.Strings = (
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          '')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
      object Account: TQRDBText
        Left = 20
        Top = 420
        Width = 126
        Height = 30
        Size.Values = (
          63.500000000000000000
          42.333333333333330000
          889.000000000000000000
          266.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = CustDetsSQL
        DataField = 'Account_Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object DelInstructMemo: TQRMemo
        Left = 150
        Top = 708
        Width = 701
        Height = 51
        Size.Values = (
          108.479166666666700000
          317.500000000000000000
          1497.541666666667000000
          1484.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        Lines.Strings = (
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          '')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
      object FormRefLbl: TQRLabel
        Left = 150
        Top = 638
        Width = 89
        Height = 30
        Size.Values = (
          63.500000000000000000
          317.500000000000000000
          1350.433333333333000000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object FormRefDescLbl: TQRLabel
        Left = 150
        Top = 668
        Width = 101
        Height = 30
        Size.Values = (
          63.500000000000000000
          317.500000000000000000
          1413.933333333333000000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object DeliveryDateLbl: TQRLabel
        Left = 650
        Top = 421
        Width = 131
        Height = 30
        Size.Values = (
          63.500000000000000000
          1375.833333333333000000
          891.645833333333300000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'DeliveryDateLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel1: TQRLabel
        Left = 3
        Top = 494
        Width = 132
        Height = 20
        Size.Values = (
          42.333333333333330000
          6.350000000000000000
          1045.633333333333000000
          279.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QUANTITY ORDERED'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 150
        Top = 494
        Width = 87
        Height = 20
        Size.Values = (
          42.333333333333330000
          317.500000000000000000
          1045.633333333333000000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DESCRIPTION'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 610
        Top = 494
        Width = 141
        Height = 20
        Size.Values = (
          42.333333333333330000
          1291.166666666667000000
          1045.633333333333000000
          298.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QUANTITY DELIVERED'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 810
        Top = 494
        Width = 128
        Height = 20
        Size.Values = (
          42.333333333333330000
          1714.500000000000000000
          1045.633333333333000000
          270.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NUMBER OF PACKS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object ReportImage: TQRImage
        Left = 23
        Top = 11
        Width = 286
        Height = 60
        Enabled = False
        Size.Values = (
          127.000000000000000000
          48.683333333333330000
          23.283333333333330000
          605.366666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object gtlblFSCClaim: TQRLabel
        Left = 20
        Top = 806
        Width = 66
        Height = 26
        Size.Values = (
          55.033333333333330000
          42.333333333333330000
          1706.033333333333000000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FSC Claim'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Gill Sans MT'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
  end
  object PODelivSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Delivery_Detail.*,'
      'Purchase_OrderLine.Cust_Order_no,'
      'Purchase_OrderLine.Customers_Desc,'
      'Purchase_OrderLine.Quantity,'
      'Purchase_Order.Operator,'
      'Purchase_OrderLine.Customer as iCustomer,'
      'Purchase_OrderLine.Branch_No as iBranch,'
      'Form_Reference.Form_Reference_id,'
      'Form_Reference.Form_Reference_Descr,'
      'Purchase_OrderLine.Number_Instructions,'
      '  Purchase_Orderline.FSC_Material_Claim,'
      '  Purchase_Orderline.FSC_Mixed_Percentage'
      'FROM'
      '((Delivery_Detail INNER JOIN Purchase_Order'
      
        'ON Delivery_Detail.Purchase_Order = Purchase_Order.Purchase_Orde' +
        'r)'
      'INNER JOIN Purchase_Orderline'
      
        'ON Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase_O' +
        'rder)'
      'LEFT JOIN Form_reference'
      
        'ON Purchase_orderLine.Form_reference = Form_Reference.Form_refer' +
        'ence'
      'WHERE'
      '('
      '(Delivery_Detail.Purchase_Order = :Purchase_Order ) OR'
      '(:Purchase_Order = 0)'
      ') AND'
      '(Delivery_Detail.Line = :Line) and'
      '('
      '(Delivery_Detail.Delivery_no = :Delivery_no) or'
      '(:Delivery_no = 0)'
      ') and'
      '('
      '(Purchase_Order.Operator = :Operator ) OR (:Operator = 0)'
      ')'
      'ORDER BY Delivery_Detail.Line, Delivery_Detail.Delivery_no'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 896
    Top = 176
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Delivery_no'
      end
      item
        Name = 'Delivery_no'
      end
      item
        Name = 'Operator'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Operator'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object PODelivSRC: TDataSource
    DataSet = PODelivSQL
    Left = 896
    Top = 232
  end
  object CustomerSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Delivery_Narrative,'
      'Account_Code,'
      'Customer_Branch.Name as Branch_Name,'
      'Customer_Branch.Use_Branch_Name'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' '
      ' '
      ' ')
    Left = 888
    Top = 72
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_no'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object AdhocSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name,'
      '  Building_no_name,'
      '  Street,'
      '  Locale,'
      '  Town,'
      '  Postcode,'
      '  Delivery_Narrative'
      'from Ad_hoc_Address'
      'where Ad_hoc_Address = :Ad_hoc_Address'
      ' ')
    Left = 896
    Top = 120
    ParamData = <
      item
        Name = 'Ad_hoc_Address'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object RepSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode'
      'from Rep'
      'where Rep = :Rep'
      ' ')
    Left = 816
    Top = 24
    ParamData = <
      item
        Name = 'Rep'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object AddressSRC: TDataSource
    DataSet = CustomerSQL
    Left = 888
    Top = 24
  end
  object SupplierSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Supplier.Name as Supplier_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode'
      'from Supplier_Branch, Supplier'
      'where'
      '((Supplier_Branch.Supplier = :Supplier) and'
      ' (Supplier_Branch.Branch_no = :Branch_no)) and'
      '(Supplier_Branch.Supplier = Supplier.Supplier)'
      ' '
      ' '
      ' ')
    Left = 560
    Top = 32
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_no'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object GetNarrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'From Narrative_Line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line')
    Left = 816
    Top = 136
    ParamData = <
      item
        Name = 'Narrative'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object CompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Company.Name as Company_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Delivery_Narrative'
      'from Company'
      'where Company = 1'
      ' ')
    Left = 816
    Top = 192
  end
  object CustDetsSQL: TFDQuery
    MasterSource = PODelivSRC
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Delivery_Narrative,'
      'Account_Code'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :iCustomer) and'
      '   (Branch_no = :iBranch)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' '
      ' '
      ' ')
    Left = 904
    Top = 296
    ParamData = <
      item
        Name = 'iCustomer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'iBranch'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryGetFSCClaim: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from FSC_Material_Claim'
      'where FSC_Material_Claim = :FSC_Material_Claim')
    Left = 406
    Top = 350
    ParamData = <
      item
        Name = 'FSC_Material_Claim'
      end>
  end
end
