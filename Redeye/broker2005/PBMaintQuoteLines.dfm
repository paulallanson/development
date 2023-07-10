object PBMaintQuoteLinesFrm: TPBMaintQuoteLinesFrm
  Left = 283
  Top = 85
  BorderStyle = bsDialog
  Caption = 'Maintain Quote details'
  ClientHeight = 523
  ClientWidth = 503
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DelLabel: TLabel
    Left = 125
    Top = 493
    Width = 184
    Height = 15
    Caption = 'Really Delete This Job Bag Item?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OKBitBtn: TBitBtn
    Left = 333
    Top = 488
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    TabOrder = 3
    OnClick = OKBitBtnClick
    Glyph.Data = {
      CE070000424DCE07000000000000360000002800000024000000120000000100
      1800000000009807000000000000000000000000000000000000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F7F00007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F7F0000007F00007F007F0000007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F0000007F00007F00007F0000
      7F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F000000
      7F00007F00007F00007F00007F00007F007F0000007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F
      7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F7F0000007F00007F00007F0000FF00007F00007F00007F00007F00
      7F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFF
      FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F00007F00007F0000FF00007F7F
      00FF00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F7F7F7FFFFFFF007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00
      007F0000FF00007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F00
      7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F00FF
      00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F
      7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF0000
      7F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F
      7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00
      007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFF
      FFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F00FF00007F00007F007F0000007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F
      7F7FFFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00007F
      00007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F}
    NumGlyphs = 2
  end
  object CancelBitBtn: TBitBtn
    Left = 413
    Top = 488
    Width = 75
    Height = 25
    TabOrder = 4
    Kind = bkCancel
  end
  object grpbxDetails: TGroupBox
    Left = 8
    Top = 8
    Width = 489
    Height = 345
    TabOrder = 0
    object Label7: TLabel
      Left = 8
      Top = 22
      Width = 55
      Height = 13
      Caption = 'Department'
    end
    object Label8: TLabel
      Left = 8
      Top = 52
      Width = 38
      Height = 13
      Caption = 'Process'
    end
    object Label1: TLabel
      Left = 8
      Top = 80
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object Label2: TLabel
      Left = 8
      Top = 161
      Width = 39
      Height = 13
      Caption = 'Quantity'
    end
    object lblCostPrice: TLabel
      Left = 8
      Top = 187
      Width = 52
      Height = 13
      Caption = 'Direct Cost'
    end
    object Label4: TLabel
      Left = 8
      Top = 289
      Width = 46
      Height = 13
      Caption = 'Price Unit'
    end
    object Label5: TLabel
      Left = 8
      Top = 239
      Width = 77
      Height = 13
      Caption = 'Actual Sell Price'
    end
    object Label6: TLabel
      Left = 8
      Top = 213
      Width = 98
      Height = 13
      Caption = 'Suggested Sell Price'
    end
    object Label9: TLabel
      Left = 251
      Top = 187
      Width = 111
      Height = 13
      Caption = 'Direct Cost + Overhead'
    end
    object Label10: TLabel
      Left = 285
      Top = 213
      Width = 77
      Height = 13
      Caption = 'Old System SSP'
    end
    object Label14: TLabel
      Left = 8
      Top = 315
      Width = 42
      Height = 13
      Caption = 'Vat Rate'
    end
    object lblResellerPrice: TLabel
      Left = 8
      Top = 263
      Width = 65
      Height = 13
      Caption = 'Reseller Price'
    end
    object btnProdType: TButton
      Left = 308
      Top = 46
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnProdTypeClick
    end
    object memQuantity: TMemo
      Left = 112
      Top = 157
      Width = 105
      Height = 21
      TabOrder = 5
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateQty
      OnKeyPress = CheckKeyIsNumber
    end
    object memCostPrice: TMemo
      Left = 112
      Top = 183
      Width = 105
      Height = 21
      TabOrder = 6
      WantReturns = False
      WordWrap = False
      OnChange = memCostPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney4DP
      OnKeyPress = CheckKeyIsFloat
    end
    object dblkpPriceUnit: TDBLookupComboBox
      Left = 112
      Top = 285
      Width = 145
      Height = 21
      KeyField = 'Price_Unit'
      ListField = 'Description'
      ListSource = dtsPriceUnit
      TabOrder = 10
      OnClick = CheckOK
    end
    object dblkpProcessGroup: TDBLookupComboBox
      Left = 112
      Top = 18
      Width = 185
      Height = 21
      KeyField = 'Process_Group'
      ListField = 'Process_Group_Description'
      ListSource = dtsProcessGroup
      TabOrder = 0
      OnClick = dblkpProcessGroupClick
    end
    object memASPrice: TMemo
      Left = 112
      Top = 235
      Width = 105
      Height = 21
      TabOrder = 8
      WantReturns = False
      WordWrap = False
      OnChange = memCostPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney4DP
      OnKeyPress = CheckKeyIsFloat
    end
    object memSSPrice: TMemo
      Left = 112
      Top = 209
      Width = 105
      Height = 21
      TabOrder = 7
      WantReturns = False
      WordWrap = False
      OnChange = memCostPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney4DP
      OnKeyPress = CheckKeyIsFloat
    end
    object memDCOHD: TMemo
      Left = 368
      Top = 183
      Width = 105
      Height = 21
      TabOrder = 12
      WantReturns = False
      WordWrap = False
      OnChange = memCostPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney4DP
      OnKeyPress = CheckKeyIsFloat
    end
    object memSSPOrig: TMemo
      Left = 368
      Top = 209
      Width = 105
      Height = 21
      TabOrder = 13
      WantReturns = False
      WordWrap = False
      OnChange = memCostPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney4DP
      OnKeyPress = CheckKeyIsFloat
    end
    object dblkpProcess: TDBLookupComboBox
      Left = 112
      Top = 48
      Width = 185
      Height = 21
      KeyField = 'Process'
      ListField = 'Process_Description'
      ListSource = dtsProcess
      TabOrder = 1
      OnClick = dblkpProcessClick
    end
    object btnProducts: TButton
      Left = 455
      Top = 80
      Width = 25
      Height = 25
      Caption = '...'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnProductsClick
    end
    object edtDescription: TMemo
      Left = 112
      Top = 80
      Width = 337
      Height = 73
      Lines.Strings = (
        'edtDescription')
      TabOrder = 3
    end
    object dblkpVat: TDBLookupComboBox
      Left = 112
      Top = 311
      Width = 145
      Height = 21
      KeyField = 'Vat_Code'
      ListField = 'Description'
      ListSource = dtsVat
      TabOrder = 11
      OnClick = CheckOK
    end
    object memResellerPrice: TMemo
      Left = 112
      Top = 259
      Width = 105
      Height = 21
      TabOrder = 9
      WantReturns = False
      WordWrap = False
      OnChange = memCostPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney4DP
      OnKeyPress = CheckKeyIsFloat
    end
  end
  object grpbxWorkCentre: TGroupBox
    Left = 8
    Top = 400
    Width = 489
    Height = 73
    TabOrder = 2
    object Label3: TLabel
      Left = 352
      Top = 47
      Width = 28
      Height = 13
      Caption = 'Hours'
    end
    object Label11: TLabel
      Left = 8
      Top = 18
      Width = 92
      Height = 13
      Caption = 'Work Centre Group'
    end
    object Label12: TLabel
      Left = 8
      Top = 47
      Width = 60
      Height = 13
      Caption = 'Work Centre'
    end
    object Label13: TLabel
      Left = 328
      Top = 18
      Width = 53
      Height = 13
      Caption = 'Staff Count'
    end
    object memHours: TMemo
      Left = 392
      Top = 43
      Width = 81
      Height = 21
      TabOrder = 0
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateMoney
      OnKeyPress = CheckKeyIsFloat
    end
    object dblkpWorkCentreGroup: TDBLookupComboBox
      Left = 112
      Top = 14
      Width = 145
      Height = 21
      KeyField = 'Work_Centre_Group'
      ListField = 'Work_Centre_Group_Name'
      ListSource = dtsWCGroup
      TabOrder = 1
      OnClick = dblkpWorkCentreGroupClick
    end
    object dblkpWorkCentre: TDBLookupComboBox
      Left = 112
      Top = 43
      Width = 145
      Height = 21
      KeyField = 'Work_Centre'
      ListField = 'Work_Centre_Name'
      ListSource = dtsWC
      TabOrder = 2
      OnClick = CheckOK
    end
    object memStaff: TMemo
      Left = 392
      Top = 14
      Width = 81
      Height = 21
      TabOrder = 3
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateQty
      OnKeyPress = CheckKeyIsNumber
    end
  end
  object grpbxInternalCost: TGroupBox
    Left = 8
    Top = 353
    Width = 489
    Height = 41
    TabOrder = 1
    object Label15: TLabel
      Left = 8
      Top = 16
      Width = 47
      Height = 13
      Caption = 'Markup %'
    end
    object memMarkupPerc: TMemo
      Left = 112
      Top = 12
      Width = 105
      Height = 21
      TabOrder = 0
      WantReturns = False
      WordWrap = False
      OnEnter = SaveValue
      OnExit = ValidateMoney3DP
      OnKeyPress = CheckKeyIsFloat
    end
  end
  object qryPriceUnit: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'order by Description')
    Left = 328
    Top = 216
  end
  object qryProcessGroup: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select *'
      'from Process_Group'
      'order by Process_Group_Description')
    Left = 336
    Top = 24
  end
  object dtsProcessGroup: TDataSource
    DataSet = qryProcessGroup
    Left = 440
    Top = 24
  end
  object dtsPriceUnit: TDataSource
    DataSet = qryPriceUnit
    Left = 392
    Top = 216
  end
  object qryGetPUnit: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'where Price_Unit = :Price_Unit')
    Left = 184
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end>
  end
  object qryGetProductType: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select * from Product_Type'
      'where Product_Type = :Product_Type')
    Left = 320
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end>
  end
  object qryWCGroup: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Work_Centre_Group'
      'order by Work_Centre_Group_Name')
    Left = 416
    Top = 272
  end
  object dtsWCGroup: TDataSource
    DataSet = qryWCGroup
    Left = 456
    Top = 272
  end
  object qryWC: TQuery
    DatabaseName = 'PB'
    DataSource = dtsWCGroup
    SQL.Strings = (
      'select work_centre.work_Centre_Name'
      'from work_centre_WC_Group, work_Centre'
      
        'where work_centre_WC_Group.work_centre = work_centre.work_Centre' +
        ' and'
      'work_centre_group = :work_Centre_Group'
      'order by Work_Centre_Name')
    Left = 328
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'work_Centre_Group'
        ParamType = ptUnknown
      end>
  end
  object dtsWC: TDataSource
    DataSet = qryWC
    Left = 392
    Top = 392
  end
  object qryProcess: TQuery
    DatabaseName = 'pb'
    DataSource = dtsProcessGroup
    SQL.Strings = (
      'select *'
      'from Process'
      'where process_group = :process_group'
      'order by Process_Description')
    Left = 336
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'process_group'
        ParamType = ptUnknown
      end>
  end
  object dtsProcess: TDataSource
    DataSet = qryProcess
    Left = 424
    Top = 88
  end
  object qryVat: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select * '
      'from Vat_Code'
      'order by Vat_Rate')
    Left = 328
    Top = 272
  end
  object dtsVat: TDataSource
    DataSet = qryVat
    Left = 368
    Top = 272
  end
end
