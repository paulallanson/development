object PBRSSalesProfitfrm: TPBRSSalesProfitfrm
  Left = 179
  Top = 125
  BorderStyle = bsDialog
  Caption = 'Sales Profit Report'
  ClientHeight = 234
  ClientWidth = 560
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object pnlCust: TPanel
    Left = 288
    Top = 0
    Width = 273
    Height = 193
    ParentBackground = False
    TabOrder = 3
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 81
      Height = 13
      Caption = 'Customer Name'
    end
    object edtCust: TEdit
      Left = 16
      Top = 72
      Width = 201
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnLUCust: TButton
      Left = 224
      Top = 72
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnLUCustClick
    end
  end
  object pnlRep: TPanel
    Left = 284
    Top = 0
    Width = 276
    Height = 193
    ParentBackground = False
    TabOrder = 2
    object rdgrpReps: TRadioGroup
      Left = 8
      Top = 8
      Width = 129
      Height = 65
      Caption = 'Selection'
      ItemIndex = 0
      Items.Strings = (
        'All Reps'
        'One Rep')
      ParentBackground = False
      TabOrder = 0
      OnClick = rdgrpRepsClick
    end
    object pnlRepSearch: TPanel
      Left = 8
      Top = 80
      Width = 257
      Height = 57
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object lblCustBran: TLabel
        Left = 8
        Top = 8
        Width = 52
        Height = 13
        Caption = 'Rep Name'
      end
      object edtRep: TEdit
        Left = 8
        Top = 24
        Width = 209
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object btnRep: TButton
        Left = 224
        Top = 24
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnRepClick
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 193
    Width = 560
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    object btnPreview: TBitBtn
      Left = 110
      Top = 8
      Width = 75
      Height = 27
      Caption = 'Preview'
      Enabled = False
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
      OnClick = btnPreviewClick
    end
    object btnPrint: TBitBtn
      Left = 193
      Top = 8
      Width = 75
      Height = 27
      Caption = 'Print'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnPrintClick
    end
    object btnClose: TBitBtn
      Left = 12
      Top = 8
      Width = 75
      Height = 27
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 2
    end
  end
  object pnlReportSelect: TPanel
    Left = 0
    Top = 0
    Width = 288
    Height = 193
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 124
      Width = 20
      Height = 13
      Caption = 'Year'
    end
    object Label2: TLabel
      Left = 16
      Top = 156
      Width = 33
      Height = 13
      Caption = 'Period'
    end
    object rdgrpReportType: TRadioGroup
      Left = 16
      Top = 8
      Width = 225
      Height = 105
      Caption = 'Report type'
      ItemIndex = 0
      Items.Strings = (
        'Sales Profit Summary'
        'Sales Profit Detailed'
        'Reps Annual Profit Analysis'
        'Customer Annual Profit Analysis')
      ParentBackground = False
      TabOrder = 0
      OnClick = rdgrpReportTypeClick
    end
    object cmbYear: TComboBox
      Left = 64
      Top = 120
      Width = 97
      Height = 21
      TabOrder = 1
      Text = 'cmbYear'
      OnChange = EnableOK
      OnClick = cmbYearClick
    end
    object dblkpPeriods: TDBLookupComboBox
      Left = 64
      Top = 152
      Width = 177
      Height = 21
      KeyField = 'Period'
      ListField = 'Description'
      ListSource = dtsPeriods
      TabOrder = 2
      OnClick = EnableOK
    end
  end
  object qrySalesProfit: TFDQuery
    ConnectionName = 'PB'
    Left = 312
    Top = 104
  end
  object qryPeriods: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Period'
      'where Period_Year = :Period_Year'
      'order by period DESC')
    Left = 272
    Top = 104
    ParamData = <
      item
        Name = 'Period_Year'
        DataType = ftInteger
      end>
  end
  object dtsPeriods: TDataSource
    DataSet = qryPeriods
    Left = 360
    Top = 104
  end
end
