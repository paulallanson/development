object STRPBxLabelsFrm: TSTRPBxLabelsFrm
  Left = 70
  Top = 82
  Width = 812
  Height = 612
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  Caption = 'STRPBxLabelsFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = True
  TextHeight = 14
  object STLabelsQuickReport: TQuickRep
    Left = 0
    Top = 0
    Width = 480
    Height = 378
    ShowingPreview = False
    BeforePrint = STLabelsQuickReportBeforePrint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
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
    Page.PaperSize = A4
    Page.Continuous = False
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
      Left = 0
      Top = 38
      Width = 480
      Height = 307
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        812.270833333333300000
        1270.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = STLabelsQuickReport
      DataSet = RepSQL
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBCustOrderRef: TQRDBText
        Left = 154
        Top = 94
        Width = 39
        Height = 20
        Size.Values = (
          52.916666666666660000
          407.458333333333400000
          248.708333333333300000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = RepSQL
        DataField = 'Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object lblCust: TQRLabel
        Left = 5
        Top = 94
        Width = 85
        Height = 20
        Size.Values = (
          52.916666666666660000
          13.229166666666670000
          248.708333333333300000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUSTOMER: '
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
      object lblDesc: TQRLabel
        Left = 5
        Top = 116
        Width = 95
        Height = 20
        Size.Values = (
          52.916666666666660000
          13.229166666666670000
          306.916666666666700000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DESCRIPTION:'
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
      object FromLbl: TQRLabel
        Left = 370
        Top = 247
        Width = 52
        Height = 20
        Enabled = False
        Size.Values = (
          52.916666666666660000
          978.958333333333200000
          653.520833333333400000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FromLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object lblBoxNo: TQRLabel
        Left = 5
        Top = 256
        Width = 60
        Height = 20
        Enabled = False
        Size.Values = (
          52.916666666666660000
          13.229166666666670000
          677.333333333333400000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'BOX NO:'
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
      object NumberedLbl: TQRLabel
        Left = 277
        Top = 248
        Width = 80
        Height = 20
        Enabled = False
        Size.Values = (
          52.916666666666660000
          732.895833333333400000
          656.166666666666800000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NUMBERED'
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
      object BoxQtyCaptionlbl: TQRLabel
        Left = 5
        Top = 224
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666660000
          13.229166666666670000
          592.666666666666800000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'BOX QTY:'
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
      object lblDate: TQRLabel
        Left = 277
        Top = 280
        Width = 41
        Height = 20
        Size.Values = (
          52.916666666666660000
          732.895833333333400000
          740.833333333333400000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DATE:'
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
      object DeliveryDateLbl: TQRLabel
        Left = 336
        Top = 280
        Width = 104
        Height = 20
        Size.Values = (
          52.916666666666660000
          889.000000000000000000
          740.833333333333400000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DeliveryDateLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
        Left = 5
        Top = 145
        Width = 74
        Height = 20
        Size.Values = (
          52.916666666666660000
          13.229166666666670000
          383.645833333333400000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FORM REF:'
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
        Left = 5
        Top = 169
        Width = 77
        Height = 20
        Size.Values = (
          52.916666666666660000
          13.229166666666670000
          447.145833333333400000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'STOCK REF:'
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
        Left = 5
        Top = 198
        Width = 140
        Height = 20
        Size.Values = (
          52.916666666666660000
          13.229166666666670000
          523.875000000000000000
          370.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FORM DESCRIPTION:'
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
      object QRDBTxtdesc: TQRDBText
        Left = 154
        Top = 116
        Width = 109
        Height = 20
        Size.Values = (
          52.916666666666660000
          407.458333333333400000
          306.916666666666700000
          288.395833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = RepSQL
        DataField = 'Part_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object QRDBTxtPrt: TQRDBText
        Left = 154
        Top = 169
        Width = 27
        Height = 20
        Size.Values = (
          52.916666666666660000
          407.458333333333400000
          447.145833333333400000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = RepSQL
        DataField = 'Part'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object QRLblBxqty: TQRLabel
        Left = 154
        Top = 224
        Width = 76
        Height = 20
        Size.Values = (
          52.916666666666660000
          407.458333333333400000
          592.666666666666800000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLblBxqty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object lblFormRefid: TQRLabel
        Left = 154
        Top = 145
        Width = 83
        Height = 20
        Size.Values = (
          52.916666666666660000
          407.458333333333400000
          383.645833333333400000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblFormRefid'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object lblFormRefDesc: TQRLabel
        Left = 154
        Top = 198
        Width = 103
        Height = 20
        Size.Values = (
          52.916666666666660000
          407.458333333333400000
          523.875000000000000000
          272.520833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblFormRefDesc'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object gtlblFSCClaim: TQRLabel
        Left = 6
        Top = 282
        Width = 267
        Height = 16
        Size.Values = (
          42.333333333333340000
          15.875000000000000000
          746.125000000000000000
          706.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'FSC Claim:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
  end
  object QRLblBoxno: TQRLabel
    Left = 154
    Top = 291
    Width = 59
    Height = 24
    Size.Values = (
      63.500000000000000000
      407.458333333333400000
      769.937500000000000000
      156.104166666666700000)
    XLColumn = 0
    XLNumFormat = nfGeneral
    ActiveInPreview = False
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'FromLbl'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
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
  object RepSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Int_Sel.Text100,'
      '        Int_Sel.Int_Sel_Code,'
      '        Int_Sel.Sel1,'
      '        Int_Sel.Sel2,'
      '        Part.Part,'
      '        Part.Part_Description,'
      '        Customer.Name,'
      '        Part.Sell_Pack_Quantity,'
      '        Part.FSC_Material_Claim,'
      '        Part.FSC_Mixed_Percentage'
      'FROM (Part LEFT JOIN Customer ON'
      '      Part.Customer=Customer.Customer)'
      '      INNER JOIN Int_Sel ON Part.Part=Int_Sel.Text100'
      'WHERE (Int_Sel.Int_Sel_Code = :int_sel_code)'
      ''
      ''
      ' '
      ' ')
    Left = 394
    Top = 88
    ParamData = <
      item
        Name = 'int_sel_code'
        DataType = ftInteger
      end>
  end
  object SRCRep: TDataSource
    DataSet = RepSQL
    Left = 323
    Top = 83
  end
  object FormRefSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Form_Reference'
      'where Stock_Reference = :Stock_Reference')
    Left = 256
    Top = 248
    ParamData = <
      item
        Name = 'Stock_Reference'
      end>
  end
  object qryGetFSCClaim: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from FSC_Material_Claim'
      'where FSC_Material_Claim = :FSC_Material_Claim')
    Left = 318
    Top = 142
    ParamData = <
      item
        Name = 'FSC_Material_Claim'
      end>
  end
end
