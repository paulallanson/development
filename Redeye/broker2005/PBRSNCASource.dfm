object PBRSNCASourceFrm: TPBRSNCASourceFrm
  Left = 365
  Top = 156
  BorderStyle = bsDialog
  Caption = 'Non Conformance Source Allocation'
  ClientHeight = 193
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    467
    193)
  TextHeight = 13
  object PreviewBitBtn: TBitBtn
    Left = 374
    Top = 156
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Run'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    TabOrder = 0
    OnClick = PreviewBitBtnClick
    ExplicitTop = 162
  end
  object CancelBitBtn: TBitBtn
    Left = 20
    Top = 156
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
    ExplicitTop = 162
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 11
    Width = 217
    Height = 65
    Caption = 'Graph 1'
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 28
      Width = 33
      Height = 13
      Caption = 'Period'
    end
    object dblkpGraph1: TDBLookupComboBox
      Left = 64
      Top = 24
      Width = 145
      Height = 21
      KeyField = 'Period'
      ListField = 'Description'
      ListSource = dsPeriods1
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 236
    Top = 11
    Width = 217
    Height = 65
    Caption = 'Graph 2'
    ParentBackground = False
    TabOrder = 3
    object Label3: TLabel
      Left = 16
      Top = 28
      Width = 33
      Height = 13
      Caption = 'Period'
    end
    object dblkpGraph2: TDBLookupComboBox
      Left = 64
      Top = 24
      Width = 145
      Height = 21
      KeyField = 'Period'
      ListField = 'Description'
      ListSource = dsPeriods2
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 12
    Top = 83
    Width = 217
    Height = 65
    Caption = 'Graph 3'
    ParentBackground = False
    TabOrder = 4
    object Label2: TLabel
      Left = 16
      Top = 28
      Width = 33
      Height = 13
      Caption = 'Period'
    end
    object dblkpGraph3: TDBLookupComboBox
      Left = 64
      Top = 24
      Width = 145
      Height = 21
      KeyField = 'Period'
      ListField = 'Description'
      ListSource = dsPeriods3
      TabOrder = 0
    end
  end
  object GroupBox4: TGroupBox
    Left = 236
    Top = 83
    Width = 217
    Height = 65
    Caption = 'Graph 4'
    ParentBackground = False
    TabOrder = 5
    object Label4: TLabel
      Left = 16
      Top = 28
      Width = 33
      Height = 13
      Caption = 'Period'
    end
    object dblkpGraph4: TDBLookupComboBox
      Left = 64
      Top = 24
      Width = 145
      Height = 21
      KeyField = 'Period'
      ListField = 'Description'
      ListSource = dsPeriods4
      TabOrder = 0
    end
  end
  object qryPeriods1: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select 99999 as Period,'
      #39'Rolling 12 Month'#39' as Description'
      'From Company'
      'where 1=1'
      'UNion'
      'select top 12 Period, Description '
      'from period'
      'where period <= :Period'
      'order by period desc')
    Left = 28
    Top = 27
    ParamData = <
      item
        Name = 'Period'
      end>
  end
  object dsPeriods1: TDataSource
    DataSet = qryPeriods1
    Left = 28
    Top = 35
  end
  object qryGetDates: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from period '
      'where period = :Period')
    Left = 116
    Top = 131
    ParamData = <
      item
        Name = 'Period'
      end>
  end
  object qryPeriods2: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select 99999 as Period,'
      #39'Rolling 12 Month'#39' as Description'
      'From Company'
      'where 1=1'
      'UNion'
      'select top 12 Period, Description '
      'from period'
      'where period <= :Period'
      'order by period desc')
    Left = 244
    Top = 27
    ParamData = <
      item
        Name = 'Period'
      end>
  end
  object dsPeriods2: TDataSource
    DataSet = qryPeriods2
    Left = 244
    Top = 35
  end
  object qryPeriods3: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select 99999 as Period,'
      #39'Rolling 12 Month'#39' as Description'
      'From Company'
      'where 1=1'
      'UNion'
      'select top 12 Period, Description '
      'from period'
      'where period <= :Period'
      'order by period desc')
    Left = 20
    Top = 99
    ParamData = <
      item
        Name = 'Period'
      end>
  end
  object dsPeriods3: TDataSource
    DataSet = qryPeriods3
    Left = 20
    Top = 107
  end
  object qryPeriods4: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select 99999 as Period,'
      #39'Rolling 12 Month'#39' as Description'
      'From Company'
      'where 1=1'
      'UNion'
      'select top 12 Period, Description '
      'from period'
      'where period <= :Period'
      'order by period desc')
    Left = 244
    Top = 99
    ParamData = <
      item
        Name = 'Period'
      end>
  end
  object dsPeriods4: TDataSource
    DataSet = qryPeriods4
    Left = 244
    Top = 107
  end
end
