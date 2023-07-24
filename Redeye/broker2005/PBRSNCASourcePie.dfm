object PBRSNCASourcePieFrm: TPBRSNCASourcePieFrm
  Left = 104
  Top = 97
  Width = 1165
  Height = 695
  Caption = 'Source Department Allocation of Non Conformance'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbchart1: TDBChart
    Left = 136
    Top = 56
    Width = 457
    Height = 257
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    LeftWall.Brush.Color = clWhite
    LeftWall.Brush.Style = bsClear
    LeftWall.Color = clBlack
    PrintProportional = False
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -13
    Title.Font.Name = 'Comic Sans MS'
    Title.Font.Style = []
    Title.Text.Strings = (
      'FMM Allocation of Non Conformance')
    AxisVisible = False
    ClipPoints = False
    Frame.Visible = False
    LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
    LeftAxis.LabelsFont.Color = clBlack
    LeftAxis.LabelsFont.Height = -9
    LeftAxis.LabelsFont.Name = 'Arial'
    LeftAxis.LabelsFont.Style = []
    LeftAxis.Visible = False
    Legend.ColorWidth = 5
    Legend.Font.Charset = DEFAULT_CHARSET
    Legend.Font.Color = clBlack
    Legend.Font.Height = -9
    Legend.Font.Name = 'Arial'
    Legend.Font.Style = []
    Legend.Inverted = True
    Legend.LegendStyle = lsValues
    Legend.ShadowSize = 0
    Legend.Visible = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DOptions.ZoomText = False
    View3DWalls = False
    BorderStyle = bsSingle
    TabOrder = 0
    object Series1: TPieSeries
      Marks.Arrow.Color = clBlack
      Marks.Arrow.Width = 2
      Marks.ArrowLength = 8
      Marks.BackColor = clWhite
      Marks.Frame.Visible = False
      Marks.Style = smsLabelValue
      Marks.Transparent = True
      Marks.Visible = True
      DataSource = qryGraph1
      SeriesColor = clRed
      ShowInLegend = False
      ValueFormat = #163'#,##0'
      XLabelsSource = 'non_conform_dept_descr'
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1.000000000000000000
      PieValues.Order = loNone
      PieValues.ValueSource = 'Cost'
    end
  end
  object DBChart2: TDBChart
    Left = 608
    Top = 56
    Width = 457
    Height = 257
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    PrintProportional = False
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -13
    Title.Font.Name = 'Comic Sans MS'
    Title.Font.Style = []
    Title.Text.Strings = (
      'Cost of Non Conformance')
    AxisVisible = False
    Chart3DPercent = 10
    ClipPoints = False
    Frame.Visible = False
    LeftAxis.Visible = False
    Legend.ColorWidth = 10
    Legend.Visible = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DOptions.ZoomText = False
    View3DWalls = False
    BorderStyle = bsSingle
    TabOrder = 1
    object PieSeries1: TPieSeries
      Marks.Arrow.Color = clBlack
      Marks.Arrow.Width = 2
      Marks.ArrowLength = 8
      Marks.BackColor = clWhite
      Marks.Frame.Visible = False
      Marks.Style = smsLabelValue
      Marks.Transparent = True
      Marks.Visible = True
      DataSource = qryGraph2
      SeriesColor = clRed
      ShowInLegend = False
      ValueFormat = #163'#,##0'
      XLabelsSource = 'non_conform_dept_descr'
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1.000000000000000000
      PieValues.Order = loNone
      PieValues.ValueSource = 'Cost'
    end
  end
  object DBChart4: TDBChart
    Left = 608
    Top = 320
    Width = 457
    Height = 257
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    PrintProportional = False
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -13
    Title.Font.Name = 'Comic Sans MS'
    Title.Font.Style = []
    Title.Text.Strings = (
      'Cost of Non Conformance')
    AxisVisible = False
    Chart3DPercent = 10
    ClipPoints = False
    Frame.Visible = False
    LeftAxis.Visible = False
    Legend.ColorWidth = 10
    Legend.Visible = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DOptions.ZoomText = False
    View3DWalls = False
    BorderStyle = bsSingle
    TabOrder = 2
    object PieSeries3: TPieSeries
      Marks.Arrow.Color = clBlack
      Marks.Arrow.Width = 2
      Marks.ArrowLength = 8
      Marks.BackColor = clWhite
      Marks.Frame.Visible = False
      Marks.Style = smsLabelValue
      Marks.Transparent = True
      Marks.Visible = True
      DataSource = qryGraph4
      SeriesColor = clRed
      ShowInLegend = False
      ValueFormat = #163'#,##0'
      XLabelsSource = 'non_conform_dept_descr'
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1.000000000000000000
      PieValues.Order = loNone
      PieValues.ValueSource = 'Cost'
    end
  end
  object Panel2: TPanel
    ParentBackground = False
    Left = 0
    Top = 621
    Width = 1157
    Height = 40
    Align = alBottom
    TabOrder = 3
    object Panel1: TPanel
      ParentBackground = False
      Left = 899
      Top = 1
      Width = 257
      Height = 38
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
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
        TabOrder = 0
        OnClick = btnPrintClick
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
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    PrintProportional = False
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -13
    Title.Font.Name = 'Comic Sans MS'
    Title.Font.Style = []
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
    BorderStyle = bsSingle
    TabOrder = 4
    object Series2: TPieSeries
      Marks.Arrow.Color = clBlack
      Marks.ArrowLength = 8
      Marks.BackColor = clWhite
      Marks.Frame.Visible = False
      Marks.Style = smsLabelValue
      Marks.Transparent = True
      Marks.Visible = True
      DataSource = qryGraph3
      SeriesColor = clRed
      ShowInLegend = False
      ValueFormat = #163'#,##0'
      XLabelsSource = 'non_conform_dept_descr'
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1.000000000000000000
      PieValues.Order = loNone
      PieValues.ValueSource = 'Cost'
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
