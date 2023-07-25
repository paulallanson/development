object PBRSNCASourcePieFrm: TPBRSNCASourcePieFrm
  Left = 104
  Top = 97
  Caption = 'Source Department Allocation of Non Conformance'
  ClientHeight = 637
  ClientWidth = 1089
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  WindowState = wsMaximized
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 13
  object dbchart1: TDBChart
    Left = 136
    Top = 56
    Width = 457
    Height = 257
    AllowPanning = pmNone
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Border.Visible = True
    LeftWall.Brush.Style = bsClear
    LeftWall.Color = clBlack
    PrintProportional = False
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Name = 'Comic Sans MS'
    Title.Text.Strings = (
      'FMM Allocation of Non Conformance')
    AxisVisible = False
    ClipPoints = False
    Frame.Visible = False
    LeftAxis.LabelsFormat.Font.Height = -9
    LeftAxis.Visible = False
    Legend.ColorWidth = 5
    Legend.Font.Height = -9
    Legend.Inverted = True
    Legend.LegendStyle = lsValues
    Legend.Shadow.HorizSize = 0
    Legend.Shadow.VertSize = 0
    Legend.Symbol.Width = 5
    Legend.Visible = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DWalls = False
    Zoom.Allow = False
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TPieSeries
      HoverElement = []
      Legend.Visible = False
      Marks.Frame.Visible = False
      Marks.Transparent = True
      Marks.Style = smsLabelValue
      Marks.Arrow.Color = clBlack
      Marks.Arrow.Width = 2
      Marks.BackColor = clWhite
      Marks.Callout.Arrow.Color = clBlack
      Marks.Callout.Arrow.Width = 2
      Marks.Tail.Margin = 2
      Marks.Color = clWhite
      DataSource = qryGraph1
      SeriesColor = clRed
      ShowInLegend = False
      ValueFormat = #163'#,##0'
      XLabelsSource = 'non_conform_dept_descr'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'Cost'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
  end
  object DBChart2: TDBChart
    Left = 608
    Top = 56
    Width = 457
    Height = 257
    AllowPanning = pmNone
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Border.Visible = True
    PrintProportional = False
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Name = 'Comic Sans MS'
    Title.Text.Strings = (
      'Cost of Non Conformance')
    AxisVisible = False
    Chart3DPercent = 10
    ClipPoints = False
    Frame.Visible = False
    LeftAxis.Visible = False
    Legend.ColorWidth = 10
    Legend.Symbol.Width = 10
    Legend.Visible = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DWalls = False
    Zoom.Allow = False
    TabOrder = 1
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object PieSeries1: TPieSeries
      HoverElement = []
      Legend.Visible = False
      Marks.Frame.Visible = False
      Marks.Transparent = True
      Marks.Style = smsLabelValue
      Marks.Arrow.Color = clBlack
      Marks.Arrow.Width = 2
      Marks.BackColor = clWhite
      Marks.Callout.Arrow.Color = clBlack
      Marks.Callout.Arrow.Width = 2
      Marks.Tail.Margin = 2
      Marks.Color = clWhite
      DataSource = qryGraph2
      SeriesColor = clRed
      ShowInLegend = False
      ValueFormat = #163'#,##0'
      XLabelsSource = 'non_conform_dept_descr'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'Cost'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
  end
  object DBChart4: TDBChart
    Left = 608
    Top = 320
    Width = 457
    Height = 257
    AllowPanning = pmNone
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Border.Visible = True
    PrintProportional = False
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Name = 'Comic Sans MS'
    Title.Text.Strings = (
      'Cost of Non Conformance')
    AxisVisible = False
    Chart3DPercent = 10
    ClipPoints = False
    Frame.Visible = False
    LeftAxis.Visible = False
    Legend.ColorWidth = 10
    Legend.Symbol.Width = 10
    Legend.Visible = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DWalls = False
    Zoom.Allow = False
    TabOrder = 2
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object PieSeries3: TPieSeries
      HoverElement = []
      Legend.Visible = False
      Marks.Frame.Visible = False
      Marks.Transparent = True
      Marks.Style = smsLabelValue
      Marks.Arrow.Color = clBlack
      Marks.Arrow.Width = 2
      Marks.BackColor = clWhite
      Marks.Callout.Arrow.Color = clBlack
      Marks.Callout.Arrow.Width = 2
      Marks.Tail.Margin = 2
      Marks.Color = clWhite
      DataSource = qryGraph4
      SeriesColor = clRed
      ShowInLegend = False
      ValueFormat = #163'#,##0'
      XLabelsSource = 'non_conform_dept_descr'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'Cost'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 597
    Width = 1089
    Height = 40
    Align = alBottom
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = -40
    ExplicitWidth = 148
    object Panel1: TPanel
      Left = 831
      Top = 1
      Width = 257
      Height = 38
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = -110
      DesignSize = (
        257
        38)
      object btnPrint: TBitBtn
        Left = 30
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Print'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnPrintClick
      end
      object btnClose: TButton
        Left = 158
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Close'
        TabOrder = 1
        OnClick = btnCloseClick
      end
    end
  end
  object DBChart3: TDBChart
    Left = 136
    Top = 320
    Width = 457
    Height = 257
    AllowPanning = pmNone
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Border.Visible = True
    PrintProportional = False
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Name = 'Comic Sans MS'
    Title.Text.Strings = (
      'Cost of Non Conformance ')
    AxisVisible = False
    ClipPoints = False
    Frame.Visible = False
    Legend.ResizeChart = False
    Legend.Visible = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DWalls = False
    Zoom.Allow = False
    TabOrder = 4
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series2: TPieSeries
      HoverElement = []
      Legend.Visible = False
      Marks.Frame.Visible = False
      Marks.Transparent = True
      Marks.Style = smsLabelValue
      Marks.Arrow.Color = clBlack
      Marks.BackColor = clWhite
      Marks.Callout.Arrow.Color = clBlack
      Marks.Tail.Margin = 2
      Marks.Color = clWhite
      DataSource = qryGraph3
      SeriesColor = clRed
      ShowInLegend = False
      ValueFormat = #163'#,##0'
      XLabelsSource = 'non_conform_dept_descr'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'Cost'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
      OtherSlice.Text = 'Other'
    end
  end
  object qryGraph1: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select non_conform_dept.non_conform_dept_descr,'
      #9'sum(Total_cost) as Cost'
      'from Job_bag_non_conform, Non_conform_dept'
      
        'where job_Bag_non_conform.non_conform_dept = non_conform_dept.no' +
        'n_conform_dept and'
      '((Date_Point >= :Date_From) and (Date_Point <= :Date_To)) and'
      '(Total_Cost <> 0)'
      'GROUP BY non_conform_dept.non_conform_dept_descr')
    Left = 40
    Top = 48
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_To'
        ParamType = ptUnknown
      end>
  end
  object qryGraph2: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select non_conform_dept.non_conform_dept_descr,'
      #9'sum(Total_cost) as Cost'
      'from Job_bag_non_conform, Non_conform_dept'
      
        'where job_Bag_non_conform.non_conform_dept = non_conform_dept.no' +
        'n_conform_dept and'
      '((Date_Point >= :Date_From) and (Date_Point <= :Date_To)) and'
      '(Total_Cost <> 0)'
      'GROUP BY non_conform_dept.non_conform_dept_descr')
    Left = 40
    Top = 112
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_To'
        ParamType = ptUnknown
      end>
  end
  object qryGraph3: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select non_conform_dept.non_conform_dept_descr,'
      #9'sum(Total_cost) as Cost'
      'from Job_bag_non_conform, Non_conform_dept'
      
        'where job_Bag_non_conform.non_conform_dept = non_conform_dept.no' +
        'n_conform_dept and'
      '((Date_Point >= :Date_From) and (Date_Point <= :Date_To)) and'
      '(Total_Cost <> 0)'
      'GROUP BY non_conform_dept.non_conform_dept_descr')
    Left = 40
    Top = 168
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_To'
        ParamType = ptUnknown
      end>
  end
  object qryGraph4: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select non_conform_dept.non_conform_dept_descr,'
      #9'sum(Total_cost) as Cost'
      'from Job_bag_non_conform, Non_conform_dept'
      
        'where job_Bag_non_conform.non_conform_dept = non_conform_dept.no' +
        'n_conform_dept and'
      '((Date_Point >= :Date_From) and (Date_Point <= :Date_To)) and'
      '(Total_Cost <> 0)'
      'GROUP BY non_conform_dept.non_conform_dept_descr')
    Left = 40
    Top = 224
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_To'
        ParamType = ptUnknown
      end>
  end
end
