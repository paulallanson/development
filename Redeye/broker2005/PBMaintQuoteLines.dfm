object PBMaintQuoteLinesFrm: TPBMaintQuoteLinesFrm
  Left = 283
  Top = 85
  BorderStyle = bsDialog
  Caption = 'Maintain Quote details'
  ClientHeight = 522
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
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
    TabOrder = 4
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 413
    Top = 488
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 5
  end
  object grpbxDetails: TGroupBox
    Left = 8
    Top = 8
    Width = 504
    Height = 339
    ParentBackground = False
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 161
      Width = 48
      Height = 17
      Caption = 'Quantity'
    end
    object lblCostPrice: TLabel
      Left = 8
      Top = 187
      Width = 64
      Height = 17
      Caption = 'Direct Cost'
    end
    object Label4: TLabel
      Left = 8
      Top = 289
      Width = 55
      Height = 17
      Caption = 'Price Unit'
    end
    object Label5: TLabel
      Left = 8
      Top = 239
      Width = 91
      Height = 17
      Caption = 'Actual Sell Price'
    end
    object Label6: TLabel
      Left = 8
      Top = 213
      Width = 118
      Height = 17
      Caption = 'Suggested Sell Price'
    end
    object Label9: TLabel
      Left = 250
      Top = 187
      Width = 138
      Height = 17
      Caption = 'Direct Cost + Overhead'
    end
    object Label10: TLabel
      Left = 297
      Top = 213
      Width = 91
      Height = 17
      Caption = 'Old System SSP'
    end
    object Label14: TLabel
      Left = 8
      Top = 315
      Width = 48
      Height = 17
      Caption = 'Vat Rate'
    end
    object lblResellerPrice: TLabel
      Left = 8
      Top = 263
      Width = 78
      Height = 17
      Caption = 'Reseller Price'
    end
    object Label16: TLabel
      Left = 287
      Top = 161
      Width = 101
      Height = 17
      Caption = 'Cascade Quantity'
    end
    object Label17: TLabel
      Left = 437
      Top = 160
      Width = 26
      Height = 17
      Caption = 'lines'
    end
    object memQuantity: TMemo
      Left = 130
      Top = 157
      Width = 105
      Height = 21
      TabOrder = 0
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateQty
      OnKeyPress = CheckKeyIsNumber
    end
    object memCostPrice: TMemo
      Left = 130
      Top = 183
      Width = 105
      Height = 21
      TabOrder = 1
      WantReturns = False
      WordWrap = False
      OnChange = memCostPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney4DP
      OnKeyPress = CheckKeyIsFloat
    end
    object dblkpPriceUnit: TDBLookupComboBox
      Left = 130
      Top = 285
      Width = 145
      Height = 25
      KeyField = 'Price_Unit'
      ListField = 'Description'
      ListSource = dtsPriceUnit
      TabOrder = 5
      OnClick = CheckOK
    end
    object memASPrice: TMemo
      Left = 130
      Top = 235
      Width = 105
      Height = 21
      TabOrder = 3
      WantReturns = False
      WordWrap = False
      OnChange = memCostPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney4DP
      OnKeyPress = CheckKeyIsFloat
    end
    object memSSPrice: TMemo
      Left = 130
      Top = 209
      Width = 105
      Height = 21
      TabOrder = 2
      WantReturns = False
      WordWrap = False
      OnChange = memCostPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney4DP
      OnKeyPress = CheckKeyIsFloat
    end
    object memDCOHD: TMemo
      Left = 391
      Top = 183
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
    object memSSPOrig: TMemo
      Left = 391
      Top = 209
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
    object dblkpVat: TDBLookupComboBox
      Left = 130
      Top = 311
      Width = 145
      Height = 25
      KeyField = 'Vat_Code'
      ListField = 'Description'
      ListSource = dtsVat
      TabOrder = 6
      OnClick = CheckOK
    end
    object memResellerPrice: TMemo
      Left = 130
      Top = 259
      Width = 105
      Height = 21
      TabOrder = 4
      WantReturns = False
      WordWrap = False
      OnChange = memCostPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney4DP
      OnKeyPress = CheckKeyIsFloat
    end
    object spnQuantity: TSpinEdit
      Left = 391
      Top = 156
      Width = 40
      Height = 27
      MaxValue = 0
      MinValue = 0
      TabOrder = 7
      Value = 0
    end
  end
  object grpbxWorkCentre: TGroupBox
    Left = 8
    Top = 400
    Width = 504
    Height = 73
    ParentBackground = False
    TabOrder = 3
    object Label3: TLabel
      Left = 353
      Top = 47
      Width = 35
      Height = 17
      Caption = 'Hours'
    end
    object Label11: TLabel
      Left = 8
      Top = 18
      Width = 113
      Height = 17
      Caption = 'Work Centre Group'
    end
    object Label12: TLabel
      Left = 8
      Top = 47
      Width = 72
      Height = 17
      Caption = 'Work Centre'
    end
    object Label13: TLabel
      Left = 324
      Top = 18
      Width = 64
      Height = 17
      Caption = 'Staff Count'
    end
    object memHours: TMemo
      Left = 391
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
      Left = 130
      Top = 14
      Width = 145
      Height = 25
      KeyField = 'Work_Centre_Group'
      ListField = 'Work_Centre_Group_Name'
      ListSource = dtsWCGroup
      TabOrder = 1
      OnClick = dblkpWorkCentreGroupClick
    end
    object dblkpWorkCentre: TDBLookupComboBox
      Left = 130
      Top = 43
      Width = 145
      Height = 25
      KeyField = 'Work_Centre'
      ListField = 'Work_Centre_Name'
      ListSource = dtsWC
      TabOrder = 2
      OnClick = CheckOK
    end
    object memStaff: TMemo
      Left = 391
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
    Width = 504
    Height = 41
    ParentBackground = False
    TabOrder = 2
    object Label15: TLabel
      Left = 8
      Top = 16
      Width = 60
      Height = 17
      Caption = 'Markup %'
    end
    object memMarkupPerc: TMemo
      Left = 130
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
  object grpbxHeader: TGroupBox
    Left = 8
    Top = 8
    Width = 504
    Height = 145
    ParentBackground = False
    TabOrder = 0
    object Label7: TLabel
      Left = 10
      Top = 14
      Width = 69
      Height = 17
      Caption = 'Department'
    end
    object Label8: TLabel
      Left = 11
      Top = 41
      Width = 45
      Height = 17
      Caption = 'Process'
    end
    object Label1: TLabel
      Left = 12
      Top = 72
      Width = 66
      Height = 17
      Caption = 'Description'
    end
    object btnProdType: TButton
      Left = 304
      Top = 35
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnProdTypeClick
    end
    object dblkpProcessGroup: TDBLookupComboBox
      Left = 112
      Top = 10
      Width = 185
      Height = 25
      KeyField = 'Process_Group'
      ListField = 'Process_Group_Description'
      ListSource = dtsProcessGroup
      TabOrder = 1
      OnClick = dblkpProcessGroupClick
    end
    object dblkpProcess: TDBLookupComboBox
      Left = 112
      Top = 37
      Width = 185
      Height = 25
      KeyField = 'Process'
      ListField = 'Process_Description'
      ListSource = dtsProcess
      TabOrder = 2
      OnClick = dblkpProcessClick
    end
    object edtDescription: TMemo
      Left = 112
      Top = 64
      Width = 337
      Height = 73
      Lines.Strings = (
        'edtDescription')
      TabOrder = 3
    end
    object btnProducts: TButton
      Left = 456
      Top = 64
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
  end
  object qryPriceUnit: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'order by Description')
    Left = 232
    Top = 256
  end
  object qryProcessGroup: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Process_Group'
      'order by Process_Group_Description')
    Left = 364
    Top = 14
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
  object qryGetPUnit: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'where Price_Unit = :Price_Unit')
    Left = 184
    Top = 112
    ParamData = <
      item
        Name = 'Price_Unit'
      end>
  end
  object qryGetProductType: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from Product_Type'
      'where Product_Type = :Product_Type')
    Left = 208
    Top = 40
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object qryWCGroup: TFDQuery
    ConnectionName = 'PB'
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
  object qryWC: TFDQuery
    MasterSource = dtsWCGroup
    ConnectionName = 'PB'
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
        Name = 'work_Centre_Group'
      end>
  end
  object dtsWC: TDataSource
    DataSet = qryWC
    Left = 392
    Top = 392
  end
  object qryProcess: TFDQuery
    MasterSource = dtsProcessGroup
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Process'
      'where process_group = :process_group'
      'order by Process_Description')
    Left = 388
    Top = 38
    ParamData = <
      item
        Name = 'process_group'
      end>
  end
  object dtsProcess: TDataSource
    DataSet = qryProcess
    Left = 424
    Top = 88
  end
  object qryVat: TFDQuery
    ConnectionName = 'pb'
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
