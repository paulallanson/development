object PBRPPODueFrm: TPBRPPODueFrm
  Left = 0
  Top = 96
  Width = 1342
  Height = 612
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  AutoScroll = False
  Caption = 'Purchase Orders Due'
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
  object PrintPOsDueEnqQuickReport: TQuickRep
    Left = 56
    Top = -4
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = PrintPOsDueEnqQuickReportBeforePrint
    DataSet = GetPOsSQL
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
    Page.Orientation = poLandscape
    Page.PaperSize = Default
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      100.000000000000000000
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
    ReportTitle = 'Purchase Orders Due'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object PageHeaderQRBand: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 147
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        388.937500000000000000
        2770.187500000000000000)
      BandType = rbPageHeader
      object QRLabel3: TQRLabel
        Left = 302
        Top = 10
        Width = 302
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          799.041666666666700000
          26.458333333333330000
          799.041666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Purchase Orders Due for Delivery - '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object ODueDateQRLabel: TQRLabel
        Left = 16
        Top = 16
        Width = 108
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          42.333333333333330000
          285.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Orders due before:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object SelSuppsQRLabel: TQRLabel
        Left = 16
        Top = 32
        Width = 71
        Height = 23
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666670000
          42.333333333333330000
          84.666666666666670000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'For Supplier'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object SupNamQRDBText: TQRDBText
        Left = 96
        Top = 72
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          190.500000000000000000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetPOsSQL
        DataField = 'Name'
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
      object QRLabel9: TQRLabel
        Left = 16
        Top = 113
        Width = 66
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          42.333333333333330000
          298.979166666666700000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PO Number'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel11: TQRLabel
        Left = 163
        Top = 113
        Width = 87
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          431.270833333333300000
          298.979166666666700000
          230.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Job Description'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel10: TQRLabel
        Left = 544
        Top = 113
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1439.333333333333000000
          298.979166666666700000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date Due'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel13: TQRLabel
        Left = 37
        Top = 88
        Width = 42
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          97.895833333333330000
          232.833333333333300000
          111.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Phone:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object OurPhoneQRDBText: TQRDBText
        Left = 96
        Top = 88
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          232.833333333333300000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetPOsSQL
        DataField = 'Phone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 432
        Top = 113
        Width = 107
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1143.000000000000000000
          298.979166666666700000
          283.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Supplier Reference'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QtyQRLabel: TQRLabel
        Left = 634
        Top = 113
        Width = 45
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1677.458333333333000000
          298.979166666666700000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object RunDateQRLabel: TQRLabel
        Left = 603
        Top = 10
        Width = 85
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1595.437500000000000000
          26.458333333333330000
          224.895833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Run Date:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object SelCustQRLabel: TQRLabel
        Left = 16
        Top = 48
        Width = 80
        Height = 19
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          42.333333333333330000
          127.000000000000000000
          211.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'For Customer'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object SupplierNameLbl: TQRLabel
        Left = 16
        Top = 72
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          190.500000000000000000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Supplier: '
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
      object ReportSelectionLbl: TQRLabel
        Left = 240
        Top = 40
        Width = 505
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          635.000000000000000000
          105.833333333333300000
          1336.145833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'ReportSelectionLbl'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 128
        Width = 1049
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          338.666666666666700000
          2775.479166666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object Cust_SuppLbl: TQRLabel
        Left = 688
        Top = 112
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1820.333333333333000000
          296.333333333333300000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer/Order No'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 809
        Top = 16
        Width = 186
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          2140.479166666667000000
          42.333333333333330000
          492.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = GetCompSQL
        DataField = 'Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 849
        Top = 33
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2246.312500000000000000
          87.312500000000000000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetCompSQL
        DataField = 'Phone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 848
        Top = 49
        Width = 75
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2243.666666666667000000
          129.645833333333300000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetCompSQL
        DataField = 'Fax_Number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 809
        Top = 33
        Width = 22
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2140.479166666667000000
          87.312500000000000000
          58.208333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tel:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 809
        Top = 49
        Width = 27
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2140.479166666667000000
          129.645833333333300000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fax:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel1: TQRLabel
        Left = 88
        Top = 113
        Width = 61
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          232.833333333333300000
          298.979166666666700000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel2: TQRLabel
        Left = 878
        Top = 112
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2323.041666666667000000
          296.333333333333300000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Operator'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel3: TQRLabel
        Left = 934
        Top = 96
        Width = 57
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.312500000000000000
          2471.208333333333000000
          254.000000000000000000
          150.812500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Account Manager'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel4: TQRLabel
        Left = 997
        Top = 112
        Width = 48
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2637.895833333333000000
          296.333333333333300000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'On Hold'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object DetailQRBand: TQRBand
      Left = 38
      Top = 233
      Width = 1047
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = DetailQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = DetailQRBandBeforePrint
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        100.541666666666700000
        2770.187500000000000000)
      BandType = rbDetail
      object gtQRDBText1: TQRDBText
        Left = 88
        Top = 2
        Width = 116
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          232.833333333333300000
          5.291666666666667000
          306.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetPOsSQL
        DataField = 'Order_Created_Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object Quantity: TQRDBText
        Left = 603
        Top = 2
        Width = 78
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1595.437500000000000000
          5.291666666666667000
          206.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetPOsSQL
        DataField = 'Qty_to_deliver'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object DateQRDBText: TQRDBText
        Left = 544
        Top = 2
        Width = 59
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1439.333333333333000000
          5.291666666666667000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetPOsSQL
        DataField = 'date_point'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object SuppRefQRDBText: TQRDBText
        Left = 432
        Top = 2
        Width = 92
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1143.000000000000000000
          5.291666666666667000
          243.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetPOsSQL
        DataField = 'Supplier_job_ref'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText1: TQRDBText
        Left = 688
        Top = 18
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1820.333333333333000000
          47.625000000000000000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetPOsSQL
        DataField = 'cust_order_no'
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText2: TQRDBText
        Left = 688
        Top = 2
        Width = 185
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1820.333333333333000000
          5.291666666666667000
          489.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GetPOsSQL
        DataField = 'customer_name'
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText3: TQRDBText
        Left = 163
        Top = 19
        Width = 113
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          431.270833333333300000
          50.270833333333330000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetPOsSQL
        DataField = 'Form_Reference_ID'
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object OnHoldLbl: TQRLabel
        Left = 984
        Top = 2
        Width = 60
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          2603.500000000000000000
          5.291666666666667000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'OnHoldLbl'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object JobDescrQRDBText: TQRDBText
        Left = 163
        Top = 2
        Width = 262
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          431.270833333333300000
          5.291666666666667000
          693.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GetPOsSQL
        DataField = 'Suppliers_Desc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRDBText2: TQRDBText
        Left = 883
        Top = 2
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          2336.270833333333000000
          5.291666666666667000
          108.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GetPOsSQL
        DataField = 'Operator_Short_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRDBText3: TQRDBText
        Left = 940
        Top = 2
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          2487.083333333333000000
          5.291666666666667000
          108.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GetPOsSQL
        DataField = 'Account_Manager_Short_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRDBText4: TQRDBText
        Left = -18
        Top = 2
        Width = 92
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          -47.625000000000000000
          5.291666666666667000
          243.416666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetPOsSQL
        DataField = 'Purchase_Order'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object FooterQRBand: TQRBand
      Left = 38
      Top = 383
      Width = 1047
      Height = 41
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = FooterQRBandBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        108.479166666666700000
        2770.187500000000000000)
      BandType = rbPageFooter
      object PageNoQRLabel: TQRLabel
        Left = 520
        Top = 12
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1375.833333333333000000
          31.750000000000000000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Page No.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object SuppQRGroup: TQRGroup
      Left = 38
      Top = 185
      Width = 1047
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      Expression = 'GetPOsSQL.Name'
      FooterBand = SuppgrpFooter
      Master = PrintPOsDueEnqQuickReport
      ReprintOnNewPage = False
    end
    object SuppBranchQRGroup: TQRGroup
      Left = 38
      Top = 225
      Width = 1047
      Height = 8
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      LinkBand = SuppQRGroup
      Size.Values = (
        21.166666666666670000
        2770.187500000000000000)
      Expression = 'GetPOsSQL.Branch_Name'
      Master = PrintPOsDueEnqQuickReport
      ReprintOnNewPage = False
    end
    object SuppgrpFooter: TQRBand
      Left = 38
      Top = 271
      Width = 1047
      Height = 58
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        153.458333333333300000
        2770.187500000000000000)
      BandType = rbGroupFooter
      object QRShape2: TQRShape
        Left = 16
        Top = 16
        Width = 601
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          108.479166666667000000
          42.333333333333300000
          42.333333333333300000
          1590.145833333330000000)
        Pen.Color = clRed
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 24
        Top = 24
        Width = 506
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          63.500000000000000000
          1338.791666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'PLEASE CHECK THAT THE DELIVERY DATES SHOWN AGAINST EACH PURCHASE' +
          ' ORDER WILL BE MET.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 24
        Top = 37
        Width = 286
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          97.895833333333330000
          756.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PLEASE CALL US NOW IF ANY JOBS ARE RUNNING LATE.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object SuppGrpFooterChild: TQRChildBand
      Left = 38
      Top = 329
      Width = 1047
      Height = 54
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        142.875000000000000000
        2770.187500000000000000)
      ParentBand = SuppgrpFooter
      object qrshpSupplierTerms: TQRShape
        Left = 16
        Top = 13
        Width = 601
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.312500000000000000
          42.333333333333340000
          34.395833333333340000
          1590.145833333333000000)
        Pen.Color = clRed
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object memSupplierNotes: TQRRichText
        Left = 24
        Top = 21
        Width = 585
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          55.562500000000000000
          1547.812500000000000000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'memSupplierNotes')
      end
    end
  end
  object POsDataSource: TDataSource
    DataSet = GetPOsSQL
    Left = 288
    Top = 56
  end
  object CompDataSource: TDataSource
    DataSet = GetCompSQL
    Left = 411
    Top = 65
  end
  object GetCompSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select * from Company'
      'Where Company = 1')
    Left = 504
    Top = 103
  end
  object GetPOsSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Delivery_Detail.Purchase_Order,'
      '        Delivery_Detail.Line,'
      '        Delivery_Detail.Delivery_no,'
      '        Delivery_Detail.Date_Point,'
      '        Purchase_OrderLine.Suppliers_Desc,'
      '        Purchase_OrderLine.Customer,'
      '        Purchase_OrderLine.Branch_no AS CustBranch,'
      '        Delivery_Detail.Qty_to_Deliver,'
      '        Purchase_OrderLine.Supplier_Job_Ref,'
      '        Purchase_Order.Date_Point as Order_Created_Date,'
      '        Purchase_Order.Supplier,'
      '        Purchase_Order.Branch_No AS suppbranch,'
      '        Supplier.Name,'
      '        Supplier_Branch.Name AS Branch_Name,'
      '        Supplier_Branch.Building_No_name,'
      '        Supplier_Branch.Street,'
      '        Supplier_Branch.Locale,'
      '        Supplier_Branch.Town,'
      '        Supplier_Branch.Postcode,'
      '        Supplier_Branch.Phone,'
      '        Supplier_Branch.Fax_Number,'
      '        Purch_Ord_Line_Status.Description AS purch_stat_desc,'
      '        Customer.Name AS Customer_Name,'
      '        Purchase_OrderLine.Cust_Order_No,'
      '        Form_Reference.Form_Reference_ID,'
      '        Purchase_OrderLine.On_Hold,'
      '        Purchase_Order.Contact_no,'
      '        Supplier_BranchContacts.Name as Contact_Name,'
      
        '        Supplier_BranchContacts.Fax_Number as Contact_Fax_Number' +
        ','
      ' '#9'      Supplier_BranchContacts.Salutation,'
      '        Operator.Name as Operator_Name,'
      '        Account_Manager.Name as Account_Manager_Name,'
      '        Operator.Short_Name as Operator_Short_Name,'
      '        Account_Manager.Short_Name as Account_Manager_Short_Name'
      'FROM ((((Supplier'
      '        INNER JOIN Supplier_Branch'
      '            ON Supplier.Supplier = Supplier_Branch.Supplier)'
      '        INNER JOIN Supplier_BranchContacts'
      
        '            ON (Supplier_Branch.Branch_no = Supplier_BranchConta' +
        'cts.Branch_no) AND (Supplier_Branch.Supplier = Supplier_BranchCo' +
        'ntacts.Supplier))'
      '        INNER JOIN ((Purch_Ord_Line_Status'
      '        INNER JOIN (Form_Reference'
      '        RIGHT JOIN (Customer'
      '        INNER JOIN Purchase_OrderLine'
      '            ON Customer.Customer = Purchase_OrderLine.Customer)'
      
        '            ON Form_Reference.Form_Reference = Purchase_OrderLin' +
        'e.Form_Reference)'
      
        '            ON Purch_Ord_Line_Status.Purch_Ord_Line_Status = Pur' +
        'chase_OrderLine.Purch_Ord_Line_Status)'
      '        INNER JOIN (Purchase_Order'
      '        INNER JOIN Delivery_Detail'
      
        '          ON Purchase_Order.Purchase_Order = Delivery_Detail.Pur' +
        'chase_Order)'
      
        '          ON (Purchase_Order.Purchase_Order = Purchase_OrderLine' +
        '.Purchase_Order)'
      '            AND (Purchase_OrderLine.Line = Delivery_Detail.Line)'
      
        '            AND (Purchase_OrderLine.Purchase_Order = Delivery_De' +
        'tail.Purchase_Order))'
      
        '          ON (Supplier_BranchContacts.Contact_no = Purchase_Orde' +
        'r.Contact_No)'
      
        '            AND (Supplier_BranchContacts.Branch_no = Purchase_Or' +
        'der.Branch_No)'
      
        '            AND (Supplier_BranchContacts.Supplier = Purchase_Ord' +
        'er.Supplier))'
      '        INNER JOIN Operator'
      '          ON Purchase_Order.Operator = Operator.Operator)'
      '        INNER JOIN Operator AS Account_Manager'
      
        '          ON Purchase_Order.Office_Contact = Account_Manager.Ope' +
        'rator'
      'WHERE ('
      '      (Purchase_orderline.Inactive <> '#39'Y'#39') or'
      '      (Purchase_orderline.Inactive is null)'
      '      ) and'
      '      (delivery_detail.date_point < :ODue_Date) and'
      '       ('
      '       (delivery_detail.date_deliv_actual is null)'
      '       ) and'
      '       ('
      
        '       ((purchase_orderline.purch_ord_line_status >= 20) and (pu' +
        'rchase_orderline.purch_ord_line_status <= 21)) OR'
      '       (purchase_orderline.Ready_to_Invoice = '#39'Y'#39')'
      '       ) and'
      '     (((Supplier_Branch.Supplier = :Supplier) and'
      '               (Supplier_Branch.Branch_no = :Branch_No ) and'
      
        '               ((Supplier_BranchContacts.Contact_no = :Contact_n' +
        'o) or (:Contact_no = 0))) or'
      '       (:Supplier = 0)) and'
      
        '     (((Purchase_OrderLine.Customer = :Customer) or (:Customer =' +
        ' 0)) and ((Purchase_OrderLine.Branch_no = :CustBranch) or (:Cust' +
        'Branch = 999))) and'
      
        '     ((Purchase_Order.Office_Contact = :Account_Manager) or (:Ac' +
        'count_Manager = 0))'
      'Order By Supplier.Name,'
      '    Supplier_Branch.Name,'
      '    Purchase_OrderLine.Purchase_Order,'
      '    Purchase_OrderLine.Line'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ''
      '')
    Left = 688
    Top = 90
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'ODue_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CustBranch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CustBranch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Manager'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Manager'
        ParamType = ptUnknown
      end>
  end
  object oldGetPOsSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT'
      '    Delivery_Detail.Purchase_Order,'
      '    Delivery_Detail.Line,'
      '    Delivery_Detail.Delivery_no,'
      '    Delivery_Detail.Date_Point,'
      '    Purchase_OrderLine.Suppliers_Desc,'
      '    Purchase_OrderLine.Customer,'
      '    Purchase_OrderLine.Branch_no AS CustBranch,'
      '    Delivery_Detail.Qty_to_Deliver,'
      '    Purchase_OrderLine.Supplier_Job_Ref,'
      '    Purchase_Order.Supplier,'
      '    Purchase_Order.Branch_No AS suppbranch,'
      '    Supplier.Name,'
      '    Supplier_Branch.Name as Branch_Name,'
      '    Supplier_Branch.Building_No_name,'
      '    Supplier_Branch.Street,'
      '    Supplier_Branch.Locale,'
      '    Supplier_Branch.Town,'
      '    Supplier_Branch.Postcode,'
      '    Supplier_Branch.Phone,'
      '    Supplier_Branch.Fax_Number,'
      '    Purch_Ord_Line_Status.Description AS purch_stat_desc,'
      '    Customer.Name AS Customer_Name,'
      '    Purchase_OrderLine.Cust_Order_No,'
      '    Form_Reference.Form_Reference_ID,'
      '    Purchase_OrderLine.On_Hold'
      'FROM Form_Reference'
      '    RIGHT JOIN (Supplier'
      '    INNER JOIN ((Purch_Ord_Line_Status'
      '    INNER JOIN (Customer'
      '    INNER JOIN Purchase_OrderLine ON'
      '      Customer.Customer = Purchase_OrderLine.Customer) ON'
      
        '      Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Ord' +
        'erLine.Purch_Ord_Line_Status)'
      '    INNER JOIN (Supplier_Branch'
      '    INNER JOIN (Purchase_Order'
      '    INNER JOIN Delivery_Detail ON'
      
        '      Purchase_Order.Purchase_Order = Delivery_Detail.Purchase_O' +
        'rder) ON'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_No)) ON'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      '      (Purchase_OrderLine.Line = Delivery_Detail.Line) AND'
      
        '      (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purch' +
        'ase_Order)) ON'
      '      Supplier.Supplier = Supplier_Branch.Supplier) ON'
      
        '      Form_Reference.Form_Reference = Purchase_OrderLine.Form_Re' +
        'ference'
      'where ('
      '      (Purchase_orderline.Inactive <> '#39'Y'#39') or'
      '      (Purchase_orderline.Inactive is null)'
      '      ) and'
      '      (delivery_detail.date_point < :ODue_Date) and'
      '       ('
      '       (delivery_detail.date_deliv_actual is null)'
      '       ) and'
      '       ('
      
        '       ((purchase_orderline.purch_ord_line_status >= 20) and (pu' +
        'rchase_orderline.purch_ord_line_status <= 21)) OR'
      '       (purchase_orderline.Ready_to_Invoice = '#39'Y'#39')'
      '       ) and'
      '     (((Supplier_Branch.Supplier = :Supplier) and'
      '               (Supplier_Branch.Branch_no = :Branch_No )) or'
      '       (:Supplier = 0)) and'
      
        '     (((Purchase_OrderLine.Customer = :Customer) or (:Customer =' +
        ' 0)) and ((Purchase_OrderLine.Branch_no = :CustBranch) or (:Cust' +
        'Branch = 999)))'
      
        'Order By Supplier.Name, Supplier_Branch.Name, Purchase_OrderLine' +
        '.Purchase_Order,'
      '         Purchase_OrderLine.Line'
      ' '
      ' '
      ' '
      '')
    Left = 878
    Top = 82
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ODue_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CustBranch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CustBranch'
        ParamType = ptUnknown
      end>
  end
  object GetNarrSQL: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select Narrative_Text'
      'From Narrative_Line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line'
      '')
    Left = 454
    Top = 98
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end>
  end
end
