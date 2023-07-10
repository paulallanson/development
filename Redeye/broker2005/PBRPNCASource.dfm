object PBRPNCASourceFrm: TPBRPNCASourceFrm
  Left = 309
  Top = 114
  Width = 1235
  Height = 563
  Caption = 'PBRPNCASourceFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object qrReport: TQuickRep
    Left = 40
    Top = 40
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = qryNCASource
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
    Page.PaperSize = A4
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
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 435
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
        1150.937500000000000000
        2770.187500000000000000)
      BandType = rbTitle
      object QRLabel1: TQRLabel
        Left = 552
        Top = 80
        Width = 106
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          211.666666666666700000
          280.458333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Can you see this?'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblCount: TQRLabel
        Left = 552
        Top = 112
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          296.333333333333400000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblCount'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DBChart1: TDBChart
        Left = 0
        Top = 0
        Width = 505
        Height = 345
        AllowPanning = pmNone
        AllowZoom = False
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        Title.Text.Strings = (
          'TDBChart')
        AxisVisible = False
        ClipPoints = False
        Frame.Visible = False
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        View3DWalls = False
        TabOrder = 2
        object Series1: TPieSeries
          Marks.ArrowLength = 8
          Marks.Visible = True
          DataSource = qryNCASource
          SeriesColor = clRed
          XLabelsSource = 'non_conform_dept_descr'
          OtherSlice.Text = 'Other'
          PieValues.DateTime = False
          PieValues.Name = 'Pie'
          PieValues.Multiplier = 1.000000000000000000
          PieValues.Order = loNone
          PieValues.ValueSource = 'Cost'
        end
      end
    end
  end
  object qryNCASource: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select non_conform_dept.non_conform_dept_descr,'
      #9'sum(Total_cost) as Cost'
      'from Job_bag_non_conform, Non_conform_dept'
      
        'where job_Bag_non_conform.non_conform_dept = non_conform_dept.no' +
        'n_conform_dept and'
      '((Date_Point >= '#39'2009-10-01'#39' and Date_Point <= '#39'2009-10-31'#39'))'
      'GROUP BY non_conform_dept.non_conform_dept_descr')
    Left = 72
    Top = 88
  end
  object dtsNCASource: TDataSource
    DataSet = qryNCASource
    Left = 144
    Top = 88
  end
end
