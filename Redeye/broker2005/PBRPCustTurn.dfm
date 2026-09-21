object PBRPCustTurnFrm: TPBRPCustTurnFrm
  Left = 0
  Top = 100
  Caption = 'Sales By Invoice Report Print Preview'
  ClientHeight = 573
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qckrpSalesByInv: TQuickRep
    Left = 16
    Top = 24
    Width = 992
    Height = 1403
    ShowingPreview = False
    BeforePrint = qckrpSalesByInvBeforePrint
    DataSet = QryCustTurn
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
    object qrbndPageHeader: TQRBand
      Left = 47
      Top = 47
      Width = 898
      Height = 134
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        283.633333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLblTitle: TQRLabel
        Left = 231
        Top = 10
        Width = 436
        Height = 29
        Size.Values = (
          61.383333333333330000
          488.950000000000000000
          21.166666666666670000
          922.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Customer Turnover Report - Run Date: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRLabel2: TQRLabel
        Left = 10
        Top = 99
        Width = 76
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          209.550000000000000000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 459
        Top = 99
        Width = 80
        Height = 21
        Size.Values = (
          44.450000000000000000
          971.550000000000000000
          209.550000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Sales'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblCost: TQRLabel
        Left = 590
        Top = 99
        Width = 73
        Height = 21
        Size.Values = (
          44.450000000000000000
          1248.833333333333000000
          209.550000000000000000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Cost'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblDateRange: TQRLabel
        Left = 355
        Top = 40
        Width = 187
        Height = 21
        Size.Values = (
          44.450000000000000000
          751.416666666666700000
          84.666666666666670000
          395.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'For Invoices Dated from: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 1156
        Top = 10
        Width = 74
        Height = 21
        Size.Values = (
          44.450000000000000000
          2446.866666666667000000
          21.166666666666670000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page No.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRSysData1: TQRSysData
        Left = 1236
        Top = 10
        Width = 60
        Height = 21
        Size.Values = (
          44.450000000000000000
          2616.200000000000000000
          21.166666666666670000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 315
        Top = 79
        Width = 61
        Height = 21
        Size.Values = (
          44.450000000000000000
          666.750000000000000000
          167.216666666666700000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 315
        Top = 99
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          666.750000000000000000
          209.550000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Code'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object MarginQRLabel: TQRLabel
        Left = 726
        Top = 99
        Width = 51
        Height = 21
        Size.Values = (
          44.450000000000000000
          1536.700000000000000000
          209.550000000000000000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Margin'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblGPM1: TQRLabel
        Left = 698
        Top = 79
        Width = 88
        Height = 21
        Size.Values = (
          44.450000000000000000
          1477.433333333333000000
          167.216666666666700000
          186.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Gross Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblGPMUp1: TQRLabel
        Left = 798
        Top = 79
        Width = 88
        Height = 21
        Size.Values = (
          44.450000000000000000
          1689.100000000000000000
          167.216666666666700000
          186.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Gross Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblGPMUp2: TQRLabel
        Left = 804
        Top = 99
        Width = 81
        Height = 21
        Size.Values = (
          44.450000000000000000
          1701.800000000000000000
          209.550000000000000000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Mark-up %'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRSysData2: TQRSysData
        Left = 811
        Top = 10
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          1716.616666666667000000
          21.166666666666670000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page: '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrshpTitleLine: TQRShape
        Left = 11
        Top = 120
        Width = 881
        Height = 18
        Size.Values = (
          37.041666666666700000
          23.812500000000000000
          254.000000000000000000
          1865.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 47
      Top = 181
      Width = 898
      Height = 35
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.083333333333330000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qckrpSalesByInv
      DataSet = QryCustTurn
      PrintBefore = False
      PrintIfEmpty = True
      object lblDescription: TQRLabel
        Left = 10
        Top = 10
        Width = 301
        Height = 21
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          21.166666666666700000
          637.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'lblDescription'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrdbtxtAccCode: TQRDBText
        Left = 315
        Top = 10
        Width = 109
        Height = 21
        Size.Values = (
          44.450000000000000000
          666.750000000000000000
          21.166666666666670000
          230.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = QryCustTurn
        DataField = 'Account_Code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLblTotSell: TQRLabel
        Left = 435
        Top = 10
        Width = 106
        Height = 21
        Size.Values = (
          44.979166666666700000
          920.750000000000000000
          21.166666666666700000
          224.895833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotCstQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object TotCstQRLbl: TQRLabel
        Left = 545
        Top = 10
        Width = 116
        Height = 21
        Size.Values = (
          44.979166666666700000
          1153.583333333330000000
          21.166666666666700000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotCstQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object MargQRLbl: TQRLabel
        Left = 670
        Top = 10
        Width = 121
        Height = 21
        Size.Values = (
          44.979166666666700000
          1418.166666666670000000
          21.166666666666700000
          256.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'MargQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLblMargPerc: TQRLabel
        Left = 806
        Top = 10
        Width = 81
        Height = 21
        Size.Values = (
          44.979166666666700000
          1706.562500000000000000
          21.166666666666700000
          171.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'MargQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 47
      Top = 216
      Width = 898
      Height = 50
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLblRepSel: TQRLabel
        Left = 435
        Top = 20
        Width = 106
        Height = 21
        Size.Values = (
          44.979166666666700000
          920.750000000000000000
          42.333333333333300000
          224.895833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotCstQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLblRepCst: TQRLabel
        Left = 545
        Top = 20
        Width = 116
        Height = 21
        Size.Values = (
          44.979166666666700000
          1153.583333333330000000
          42.333333333333300000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotCstQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLblRepMrg: TQRLabel
        Left = 670
        Top = 20
        Width = 121
        Height = 21
        Size.Values = (
          44.979166666666700000
          1418.166666666670000000
          42.333333333333300000
          256.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'MargQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLblRepPerc: TQRLabel
        Left = 806
        Top = 20
        Width = 81
        Height = 21
        Size.Values = (
          44.979166666666700000
          1706.562500000000000000
          42.333333333333300000
          171.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'MargQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 330
        Top = 20
        Width = 48
        Height = 21
        Size.Values = (
          44.450000000000000000
          698.500000000000000000
          42.333333333333330000
          101.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrshpTotalLine: TQRShape
        Left = 435
        Top = 6
        Width = 455
        Height = 12
        Size.Values = (
          26.458333333333300000
          920.750000000000000000
          13.229166666666700000
          963.083333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object QryCustTurn: TFDQuery
    OnCalcFields = QryCustTurnCalcFields
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '        Customer.Name,'
      '        Int_Sel.*,'
      '        Customer_Branch.Account_Code,'
      '        Customer_Type.Customer_Type,'
      '        Customer_Type.Description as Customer_Type_Name'
      'FROM Int_Sel'
      '      INNER JOIN (Customer_type'
      '      INNER JOIN (Customer'
      '      INNER JOIN Customer_Branch'
      '        ON Customer.Customer = Customer_Branch.Customer)'
      '        ON (Int_Sel.Sel2 = Customer_Branch.Branch_no)'
      '        AND (Int_Sel.Sel1 = Customer_Branch.Customer)'
      
        '        AND (Customer.Customer_Type = Customer_type.Customer_typ' +
        'e)'
      'where (int_sel.Int_Sel_Code = :int_sel)'
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 182
    Top = 70
    ParamData = <
      item
        Name = 'int_sel'
        DataType = ftFloat
        ParamType = ptInput
        Value = 1
      end>
    object QryCustTurnName: TWideStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object QryCustTurnSel1: TFloatField
      FieldName = 'Sel1'
    end
    object QryCustTurnSel3: TFloatField
      FieldName = 'Sel3'
    end
    object QryCustTurnSel4: TFloatField
      FieldName = 'Sel4'
    end
    object QryCustTurnAccount_Code: TWideStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object QryCustTurnMargPerc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MargPerc'
      Calculated = True
    end
    object QryCustTurnCustomer_Type_Name: TWideStringField
      FieldName = 'Customer_Type_Name'
      Size = 50
    end
  end
end
