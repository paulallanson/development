object PBRSNCACostGraphFrm: TPBRSNCACostGraphFrm
  Left = 90
  Top = 101
  Width = 1234
  Height = 610
  Caption = 'Cost of Non Conformance by Year'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 557
    Width = 1226
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 1056
    Top = 33
    Width = 170
    Height = 265
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      170
      265)
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 106
      Height = 13
      Caption = 'Select Required Years'
    end
    object Button1: TButton
      Left = 24
      Top = 192
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = Button1Click
    end
    object lstbxYears: TListBox
      Left = 16
      Top = 56
      Width = 121
      Height = 113
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 1
    end
    object btnPrint: TBitBtn
      Left = 22
      Top = 238
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Print'
      TabOrder = 2
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
  end
  object Panel3: TPanel
    Left = 0
    Top = 298
    Width = 1226
    Height = 259
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 2
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 89
      Height = 259
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
    end
    object Panel6: TPanel
      Left = 1056
      Top = 0
      Width = 170
      Height = 259
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        170
        259)
      object btnClose: TButton
        Left = 24
        Top = 222
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Close'
        TabOrder = 0
        OnClick = btnCloseClick
      end
    end
    object dbChart2: TDBChart
      Left = 89
      Top = 0
      Width = 967
      Height = 259
      BackWall.Brush.Color = clWhite
      BackWall.Brush.Style = bsClear
      Title.Font.Charset = ANSI_CHARSET
      Title.Font.Color = clBlack
      Title.Font.Height = -13
      Title.Font.Name = 'Comic Sans MS'
      Title.Font.Style = []
      Title.Text.Strings = (
        'Number of Non Comformance and'
        'Customer Complaints')
      Legend.ColorWidth = 20
      Legend.LegendStyle = lsSeries
      View3D = False
      Align = alClient
      TabOrder = 2
      object BarSeries1: TBarSeries
        Marks.ArrowLength = 20
        Marks.Frame.Visible = False
        Marks.Style = smsValue
        Marks.Transparent = True
        Marks.Visible = True
        DataSource = qryYear1Chart2
        SeriesColor = clRed
        ValueFormat = '#,##0'
        XLabelsSource = 'COLUMN1'
        BarWidthPercent = 50
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'COLUMN2'
      end
      object BarSeries2: TBarSeries
        Marks.ArrowLength = 20
        Marks.Frame.Visible = False
        Marks.Style = smsValue
        Marks.Transparent = True
        Marks.Visible = True
        DataSource = qryYear2Chart2
        SeriesColor = clGreen
        ValueFormat = '#,##0'
        BarWidthPercent = 50
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'COLUMN2'
      end
      object BarSeries3: TBarSeries
        Marks.ArrowLength = 20
        Marks.Frame.Visible = False
        Marks.Style = smsValue
        Marks.Transparent = True
        Marks.Visible = True
        DataSource = qryYear3Chart2
        SeriesColor = clYellow
        ValueFormat = '#,##0'
        BarWidthPercent = 50
        XValues.DateTime = False
        XValues.Name = 'X'
        XValues.Multiplier = 1.000000000000000000
        XValues.Order = loAscending
        YValues.DateTime = False
        YValues.Name = 'Bar'
        YValues.Multiplier = 1.000000000000000000
        YValues.Order = loNone
        YValues.ValueSource = 'COLUMN2'
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 1226
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 89
    Height = 265
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 4
  end
  object dbChart1: TDBChart
    Left = 89
    Top = 33
    Width = 967
    Height = 265
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -13
    Title.Font.Name = 'Comic Sans MS'
    Title.Font.Style = []
    Title.Text.Strings = (
      'Cost of Non Conformance and '
      'Customer Complaints')
    Legend.ColorWidth = 20
    Legend.LegendStyle = lsSeries
    View3D = False
    Align = alClient
    TabOrder = 5
    object Series1: TBarSeries
      Marks.ArrowLength = 20
      Marks.Frame.Visible = False
      Marks.Style = smsValue
      Marks.Transparent = True
      Marks.Visible = True
      DataSource = qryYear1Chart1
      SeriesColor = clRed
      ValueFormat = #163'#,##0'
      XLabelsSource = 'COLUMN1'
      BarWidthPercent = 75
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'COLUMN2'
    end
    object Series2: TBarSeries
      Marks.ArrowLength = 20
      Marks.Frame.Visible = False
      Marks.Style = smsValue
      Marks.Transparent = True
      Marks.Visible = True
      DataSource = qryYear2Chart1
      SeriesColor = clGreen
      ValueFormat = #163'#,##0'
      XLabelsSource = 'COLUMN1'
      BarWidthPercent = 75
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'COLUMN2'
    end
    object Series3: TBarSeries
      Marks.ArrowLength = 20
      Marks.Frame.Visible = False
      Marks.Style = smsValue
      Marks.Transparent = True
      Marks.Visible = True
      DataSource = qryYear3Chart1
      SeriesColor = clYellow
      ValueFormat = #163'#,##0'
      XLabelsSource = 'COLUMN1'
      BarWidthPercent = 75
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'COLUMN2'
    end
  end
  object qryYear1Chart1: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select '#9'datename(mm,period.period_end_date),'
      #9'sum(Total_Cost) '
      'from period, Job_Bag_non_Conform'
      'where period >= :First_Period and period <= :Last_Period and'
      
        'datename(mm,period.period_end_date) *= datename(mm,job_bag_non_c' +
        'onform.date_point) and'
      
        'Job_bag_non_conform.date_point >= :First_Date and Job_bag_non_co' +
        'nform.date_point <= :Last_Date'
      'GROUP BY Period.Period,'
      #9'datename(mm,period.period_end_date)'
      'ORDER BY Period.Period')
    Left = 1088
    Top = 305
    ParamData = <
      item
        DataType = ftInteger
        Name = 'First_Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Last_Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'First_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Last_Date'
        ParamType = ptUnknown
      end>
  end
  object qryYear2Chart1: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select '#9'datename(mm,period.period_end_date),'
      #9'sum(Total_Cost) '
      'from period, Job_Bag_non_Conform'
      'where period >= :First_Period and period <= :Last_Period and'
      
        'datename(mm,period.period_end_date) *= datename(mm,job_bag_non_c' +
        'onform.date_point) and'
      
        'Job_bag_non_conform.date_point >= :First_Date and Job_bag_non_co' +
        'nform.date_point <= :Last_Date'
      'GROUP BY Period.Period,'
      #9'datename(mm,period.period_end_date)'
      'ORDER BY Period.Period')
    Left = 1088
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'First_Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Last_Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'First_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Last_Date'
        ParamType = ptUnknown
      end>
  end
  object qryYear3Chart1: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select '#9'datename(mm,period.period_end_date),'
      #9'sum(Total_Cost) '
      'from period, Job_Bag_non_Conform'
      'where period >= :First_Period and period <= :Last_Period and'
      
        'datename(mm,period.period_end_date) *= datename(mm,job_bag_non_c' +
        'onform.date_point) and'
      
        'Job_bag_non_conform.date_point >= :First_Date and Job_bag_non_co' +
        'nform.date_point <= :Last_Date'
      'GROUP BY Period.Period,'
      #9'datename(mm,period.period_end_date)'
      'ORDER BY Period.Period')
    Left = 1088
    Top = 425
    ParamData = <
      item
        DataType = ftInteger
        Name = 'First_Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Last_Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'First_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Last_Date'
        ParamType = ptUnknown
      end>
  end
  object qryYear1Chart2: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select '#9'datename(mm,period.period_end_date),'
      #9'count(Job_Bag_non_conform)'
      'from period, Job_Bag_non_Conform'
      'where period >= :First_Period and period <= :Last_Period and'
      
        'datename(mm,period.period_end_date) *= datename(mm,job_bag_non_c' +
        'onform.date_point) and'
      
        'Job_bag_non_conform.date_point >= :First_Date and Job_bag_non_co' +
        'nform.date_point <= :Last_Date'
      'GROUP BY Period.Period,'
      #9'datename(mm,period.period_end_date)'
      'ORDER BY Period.Period')
    Left = 1160
    Top = 305
    ParamData = <
      item
        DataType = ftInteger
        Name = 'First_Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Last_Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'First_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Last_Date'
        ParamType = ptUnknown
      end>
  end
  object qryYears: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select distinct Period_Year from period'
      'order by Period_Year desc')
    Left = 1080
    Top = 25
  end
  object dtsYears: TDataSource
    DataSet = qryYears
    Left = 1144
    Top = 16
  end
  object qryYear2Chart2: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select '#9'datename(mm,period.period_end_date),'
      #9'count(Job_Bag_non_conform)'
      'from period, Job_Bag_non_Conform'
      'where period >= :First_Period and period <= :Last_Period and'
      
        'datename(mm,period.period_end_date) *= datename(mm,job_bag_non_c' +
        'onform.date_point) and'
      
        'Job_bag_non_conform.date_point >= :First_Date and Job_bag_non_co' +
        'nform.date_point <= :Last_Date'
      'GROUP BY Period.Period,'
      #9'datename(mm,period.period_end_date)'
      'ORDER BY Period.Period')
    Left = 1160
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'First_Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Last_Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'First_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Last_Date'
        ParamType = ptUnknown
      end>
  end
  object qryYear3Chart2: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select '#9'datename(mm,period.period_end_date),'
      #9'count(Job_Bag_non_conform)'
      'from period, Job_Bag_non_Conform'
      'where period >= :First_Period and period <= :Last_Period and'
      
        'datename(mm,period.period_end_date) *= datename(mm,job_bag_non_c' +
        'onform.date_point) and'
      
        'Job_bag_non_conform.date_point >= :First_Date and Job_bag_non_co' +
        'nform.date_point <= :Last_Date'
      'GROUP BY Period.Period,'
      #9'datename(mm,period.period_end_date)'
      'ORDER BY Period.Period')
    Left = 1160
    Top = 425
    ParamData = <
      item
        DataType = ftInteger
        Name = 'First_Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Last_Period'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'First_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Last_Date'
        ParamType = ptUnknown
      end>
  end
  object qryGetYearPeriods: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select min(Period) as First_Period, max(period) as Last_period'
      'from period'
      'where period_year = :Period_Year')
    Left = 1096
    Top = 265
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Period_Year'
        ParamType = ptUnknown
      end>
  end
end
