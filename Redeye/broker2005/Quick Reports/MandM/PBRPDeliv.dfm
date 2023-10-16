object PBRPDelivFrm: TPBRPDelivFrm
  Left = 186
  Top = 104
  Width = 1101
  Height = 701
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  Caption = 'Delivery Note'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -16
  Font.Name = 'Courier New'
  Font.Style = []
  Scaled = True
  TextHeight = 18
  object PBDelivQuickReport: TQuickRep
    Left = 74
    Top = 8
    Width = 794
    Height = 1123
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
      250.000000000000000000
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
    object QRBand1: TQRSubDetail
      Left = 38
      Top = 38
      Width = 718
      Height = 779
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
        2061.104166666667000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = PBDelivQuickReport
      DataSet = PODelivSQL
      PrintBefore = False
      PrintIfEmpty = True
      object Accountlbl: TQRLabel
        Left = 1
        Top = 450
        Width = 81
        Height = 24
        Size.Values = (
          63.500000000000000000
          2.645833333333333000
          1190.625000000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'XXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object PONumberLbl: TQRLabel
        Left = 632
        Top = 451
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          1672.166666666667000000
          1193.270833333333000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'XXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object DateLbl: TQRLabel
        Left = 504
        Top = 450
        Width = 99
        Height = 24
        Size.Values = (
          63.500000000000000000
          1333.500000000000000000
          1190.625000000000000000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'XX/XX/XXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 632
        Top = 540
        Width = 61
        Height = 20
        Size.Values = (
          52.916666666666670000
          1672.166666666667000000
          1428.750000000000000000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NNNNNN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QtyOrderedLbl: TQRLabel
        Left = 1
        Top = 540
        Width = 71
        Height = 20
        Size.Values = (
          52.916666666666670000
          2.645833333333333000
          1428.750000000000000000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NNNNNNN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object OrderRefLbl: TQRLabel
        Left = 397
        Top = 450
        Width = 78
        Height = 24
        Size.Values = (
          63.500000000000000000
          1050.395833333333000000
          1190.625000000000000000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'XXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 129
        Top = 450
        Width = 122
        Height = 24
        Size.Values = (
          63.500000000000000000
          341.312500000000000000
          1190.625000000000000000
          322.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'XXXXXXXXXXX'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRDBText2: TQRDBText
        Left = 129
        Top = 451
        Width = 256
        Height = 20
        Size.Values = (
          52.916666666666670000
          341.312500000000000000
          1193.270833333333000000
          677.333333333333300000)
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
        Font.Height = -16
        Font.Name = 'Calibri'
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
        Left = 397
        Top = 451
        Width = 105
        Height = 20
        Size.Values = (
          52.916666666666670000
          1050.395833333333000000
          1193.270833333333000000
          277.812500000000000000)
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
        Font.Height = -16
        Font.Name = 'Calibri'
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
        Left = 1
        Top = 540
        Width = 57
        Height = 20
        Size.Values = (
          52.916666666666670000
          2.645833333333333000
          1428.750000000000000000
          150.812500000000000000)
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
        Font.Height = -16
        Font.Name = 'Calibri'
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
        Left = 497
        Top = 540
        Width = 99
        Height = 20
        Size.Values = (
          52.916666666666670000
          1314.979166666667000000
          1428.750000000000000000
          261.937500000000000000)
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
        Font.Height = -16
        Font.Name = 'Calibri'
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
        Left = 121
        Top = 540
        Width = 361
        Height = 45
        Size.Values = (
          119.062500000000000000
          320.145833333333300000
          1428.750000000000000000
          955.145833333333300000)
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
        Font.Height = -16
        Font.Name = 'Calibri'
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
        Left = 1
        Top = 263
        Width = 331
        Height = 154
        Size.Values = (
          407.458333333333300000
          2.645833333333333000
          695.854166666666700000
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
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        Lines.Strings = (
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          ''
          ''
          '8')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
      object DeliveryMemo: TQRMemo
        Left = 397
        Top = 263
        Width = 311
        Height = 146
        Size.Values = (
          386.291666666666700000
          1050.395833333333000000
          695.854166666666700000
          822.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
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
        Left = 1
        Top = 450
        Width = 94
        Height = 20
        Size.Values = (
          52.916666666666670000
          2.645833333333333000
          1190.625000000000000000
          248.708333333333300000)
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
        Font.Height = -16
        Font.Name = 'Calibri'
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
        Left = 120
        Top = 656
        Width = 561
        Height = 41
        Size.Values = (
          108.479166666666700000
          317.500000000000000000
          1735.666666666667000000
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
        Font.Height = -16
        Font.Name = 'Calibri'
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
        Left = 121
        Top = 592
        Width = 71
        Height = 20
        Size.Values = (
          52.916666666666670000
          320.145833333333300000
          1566.333333333333000000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object FormRefDescLbl: TQRLabel
        Left = 120
        Top = 624
        Width = 79
        Height = 20
        Size.Values = (
          52.916666666666670000
          317.500000000000000000
          1651.000000000000000000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object DeliveryDateLbl: TQRLabel
        Left = 504
        Top = 451
        Width = 105
        Height = 20
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          1193.270833333333000000
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
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel1: TQRLabel
        Left = 1
        Top = 240
        Width = 115
        Height = 20
        Size.Values = (
          52.916666666666670000
          2.645833333333333000
          635.000000000000000000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery Address'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object lblDelInst: TQRLabel
        Left = 397
        Top = 240
        Width = 142
        Height = 20
        Size.Values = (
          52.916666666666670000
          1050.395833333333000000
          635.000000000000000000
          375.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery Instructions'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel3: TQRLabel
        Left = 1
        Top = 427
        Width = 96
        Height = 20
        Size.Values = (
          52.916666666666670000
          2.645833333333333000
          1129.770833333333000000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account Code'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel4: TQRLabel
        Left = 129
        Top = 427
        Width = 92
        Height = 20
        Size.Values = (
          52.916666666666670000
          341.312500000000000000
          1129.770833333333000000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel5: TQRLabel
        Left = 397
        Top = 427
        Width = 85
        Height = 20
        Size.Values = (
          52.916666666666670000
          1050.395833333333000000
          1129.770833333333000000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel6: TQRLabel
        Left = 504
        Top = 427
        Width = 93
        Height = 20
        Size.Values = (
          52.916666666666670000
          1333.500000000000000000
          1129.770833333333000000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel7: TQRLabel
        Left = 632
        Top = 427
        Width = 52
        Height = 20
        Size.Values = (
          52.916666666666670000
          1672.166666666667000000
          1129.770833333333000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel8: TQRLabel
        Left = 1
        Top = 517
        Width = 70
        Height = 20
        Size.Values = (
          52.916666666666670000
          2.645833333333333000
          1367.895833333333000000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel9: TQRLabel
        Left = 121
        Top = 517
        Width = 79
        Height = 20
        Size.Values = (
          52.916666666666670000
          320.145833333333300000
          1367.895833333333000000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel10: TQRLabel
        Left = 496
        Top = 517
        Width = 86
        Height = 20
        Size.Values = (
          52.916666666666670000
          1312.333333333333000000
          1367.895833333333000000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel11: TQRLabel
        Left = 632
        Top = 517
        Width = 86
        Height = 20
        Size.Values = (
          52.916666666666670000
          1672.166666666667000000
          1367.895833333333000000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No. of Boxes'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel2: TQRLabel
        Left = 120
        Top = 755
        Width = 136
        Height = 20
        Size.Values = (
          52.916666666666670000
          317.500000000000000000
          1997.604166666667000000
          359.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Picking Information'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object gtlblFSCClaim: TQRLabel
        Left = 0
        Top = 709
        Width = 53
        Height = 16
        Size.Values = (
          42.333333333333330000
          0.000000000000000000
          1875.895833333333000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FSC Claim'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object ReportImage: TQRImage
        Left = 477
        Top = 0
        Width = 241
        Height = 85
        Enabled = False
        Size.Values = (
          224.895833333333300000
          1262.062500000000000000
          0.000000000000000000
          637.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Center = True
        Stretch = True
      end
      object QRMemoCmpnyNm: TQRMemo
        Left = 508
        Top = 87
        Width = 103
        Height = 122
        Size.Values = (
          322.791666666666700000
          1344.083333333333000000
          230.187500000000000000
          272.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
    end
    object QRBand2: TQRSubDetail
      Left = 38
      Top = 817
      Width = 718
      Height = 28
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.083333333333330000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = PBDelivQuickReport
      DataSet = PBPODM.GetPickCallOffSQL
      PrintBefore = False
      PrintIfEmpty = True
      object QRShape1: TQRShape
        Left = 448
        Top = 0
        Width = 89
        Height = 23
        Size.Values = (
          60.854166666666700000
          1185.333333333330000000
          0.000000000000000000
          235.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel13: TQRLabel
        Left = 120
        Top = 3
        Width = 72
        Height = 20
        Size.Values = (
          52.916666666666670000
          317.500000000000000000
          7.937500000000000000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLabel13'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel14: TQRLabel
        Left = 352
        Top = 3
        Width = 50
        Height = 20
        Size.Values = (
          52.916666666666660000
          931.333333333333500000
          7.937500000000000000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLabel14'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
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
  object PODelivSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Delivery_Detail.Purchase_Order,'
      #9'Delivery_Detail.Line, '
      #9'Delivery_Detail.Delivery_no, '
      #9'Delivery_Detail.Ad_hoc_Address, '
      #9'Delivery_Detail.Supplier, '
      #9'Delivery_Detail.Branch_no, '
      #9'Delivery_Detail.Rep, '
      #9'Delivery_Detail.Qty_to_Deliver, '
      #9'Delivery_Detail.Qty_Delivered, '
      #9'Delivery_Detail.Qty_Invoiced, '
      #9'Delivery_Detail.Branch_No0, '
      #9'Delivery_Detail.Customer, '
      #9'Delivery_Detail.Is_Updated, '
      #9'Delivery_Detail.No_Of_Boxes, '
      #9'Delivery_Detail.Delivery_Instructions, '
      #9'Delivery_Detail.Deliver_via_Company, '
      #9'Delivery_Detail.Date_Deliv_Actual, '
      #9'Delivery_Detail.Delivery_to_Stock,'
      #9'Delivery_Detail.Delivery_note_printed,'
      '        Delivery_Detail.Contact_name,'
      '        Delivery_Detail.date_point,'
      #9'Purchase_OrderLine.Cust_Order_No,'
      #9'Purchase_OrderLine.Customers_Desc, '
      #9'Purchase_OrderLine.Quantity, '
      #9'Purchase_OrderLine.Customer as iCustomer, '
      #9'Purchase_OrderLine.Branch_no as iBranch, '
      #9'Purchase_OrderLine.Number_Instructions,'
      '  Purchase_OrderLine.Original_Order,'
      '  Purchase_OrderLine.Original_OrderLine,   '
      #9'Form_Reference.Form_Reference_ID, '
      #9'Form_Reference.Form_Reference_Descr,'
      '  Purchase_Orderline.FSC_Material_Claim,'
      '  Purchase_Orderline.FSC_Mixed_Percentage'
      'FROM Form_Reference'
      #9'RIGHT JOIN (Purchase_OrderLine '
      #9'INNER JOIN Delivery_Detail ON '
      #9'(Purchase_OrderLine.Line = Delivery_Detail.Line) AND '
      
        #9'(Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_O' +
        'rder)) ON '
      
        #9'Form_Reference.Form_Reference = Purchase_OrderLine.Form_Referen' +
        'ce'
      'WHERE'
      '('
      '(Delivery_Detail.Purchase_Order = :Purchase_Order ) AND'
      '(Delivery_Detail.Line = :Line) and'
      '(Delivery_Detail.Delivery_no = :Delivery_no)'
      ')'
      'ORDER BY Delivery_Detail.Line, Delivery_Detail.Delivery_no'
      ''
      ' '
      ' '
      ' '
      ' '
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
        Name = 'Line'
      end
      item
        Name = 'Delivery_no'
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
      ''
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
      'Phone,'
      'Email,'
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
  object GetPickDataSource: TDataSource
    DataSet = GetPickSQL
    Left = 409
    Top = 272
  end
  object GetPickSQL: TFDQuery
    ConnectionName = 'PB '
    SQL.Strings = (
      'select *'
      'from Picking_Detail'
      'where Purchase_Order = :Purchase_Order and'
      '  line = :LineNo'
      '')
    Left = 321
    Top = 296
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'LineNo'
      end>
  end
  object GetPickCallOffSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Picking_Detail.*, Delivery_Detail.Stock_Location_Desc, De' +
        'livery_Location.Description'
      'FROM (Delivery_Detail RIGHT JOIN Delivery_Location ON'
      
        '  (Delivery_Detail.Delivery_no = Delivery_Location.Delivery_no) ' +
        'AND'
      '  (Delivery_Detail.Line = Delivery_Location.Line) AND'
      
        '  (Delivery_Detail.Purchase_Order = Delivery_Location.Purchase_O' +
        'rder))'
      
        '  RIGHT JOIN Picking_Detail ON (Delivery_Location.Location_no = ' +
        'Picking_Detail.Location_no) AND'
      
        '  (Delivery_Location.Delivery_no = Picking_Detail.Delivery_no) A' +
        'ND'
      '  (Delivery_Location.Line = Picking_Detail.Line) AND'
      
        '  (Delivery_Location.Purchase_Order = Picking_Detail.Purchase_Or' +
        'der)'
      'where Picking_Detail.Purchase_Order = :Purchase_order and'
      'Picking_Detail.Line = :Line and'
      'Picking_Detail.CallOff_Delivery = :Delivery_no and'
      'Calloff_order = :calloff_order and'
      'Calloff_line = :Calloff_Line'
      'order by Delivery_Location.Description'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 360
    Top = 60
    ParamData = <
      item
        Name = 'Purchase_order'
        DataType = ftFloat
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Delivery_no'
        DataType = ftInteger
      end
      item
        Name = 'calloff_order'
        DataType = ftFloat
      end
      item
        Name = 'Calloff_Line'
        DataType = ftInteger
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
