object PBMaintQEnqFrm: TPBMaintQEnqFrm
  Left = 31
  Top = 75
  ActiveControl = edtCustomer
  Caption = 'Quick Quotation screen'
  ClientHeight = 480
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  TextHeight = 13
  object Label12: TLabel
    Left = 8
    Top = 33
    Width = 49
    Height = 13
    Caption = 'Customer'
  end
  object Label14: TLabel
    Left = 21
    Top = 63
    Width = 40
    Height = 13
    Caption = 'Contact'
  end
  object Label15: TLabel
    Left = 416
    Top = 4
    Width = 66
    Height = 13
    Caption = 'Enquiry Date'
  end
  object EnqDateBtn: TSpeedButton
    Left = 662
    Top = 0
    Width = 23
    Height = 23
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
      F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
      F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
      F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
      F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
      F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
      F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
      333337FFFFFFFF77333330000000000333333777777777733333}
    NumGlyphs = 2
    OnClick = EnqDateBtnClick
  end
  object DateBtn: TSpeedButton
    Left = 662
    Top = 29
    Width = 23
    Height = 23
    Hint = 'Select the date the enquiry is reqiored'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
      F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
      F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
      F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
      F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
      F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
      F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
      333337FFFFFFFF77333330000000000333333777777777733333}
    NumGlyphs = 2
    OnClick = DateBtnClick
  end
  object Label16: TLabel
    Left = 406
    Top = 33
    Width = 74
    Height = 13
    Caption = 'Date Required'
  end
  object Label1: TLabel
    Left = 0
    Top = 92
    Width = 59
    Height = 13
    Caption = 'Description'
  end
  object Label2: TLabel
    Left = 410
    Top = 92
    Width = 74
    Height = 13
    Caption = 'Office Contact'
  end
  object Label4: TLabel
    Left = 405
    Top = 63
    Width = 72
    Height = 13
    Caption = 'Customer Rep'
  end
  object Label6: TLabel
    Left = 22
    Top = 4
    Width = 39
    Height = 13
    Caption = 'Enquiry'
  end
  object lblEnqNo: TLabel
    Left = 72
    Top = 4
    Width = 48
    Height = 13
    Caption = 'lblEnqNo'
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 112
    Width = 697
    Height = 321
    ParentBackground = False
    TabOrder = 6
    object Label8: TLabel
      Left = 8
      Top = 10
      Width = 66
      Height = 13
      Caption = 'Product Type'
    end
    object Label9: TLabel
      Left = 8
      Top = 52
      Width = 66
      Height = 13
      Caption = 'Specification'
    end
    object Label10: TLabel
      Left = 368
      Top = 52
      Width = 29
      Height = 13
      Caption = 'Prices'
    end
    object Label11: TLabel
      Left = 360
      Top = 245
      Width = 49
      Height = 13
      Caption = 'Price Unit'
    end
    object Label3: TLabel
      Left = 368
      Top = 10
      Width = 82
      Height = 13
      Caption = 'Supplier/Branch'
    end
    object lblRunOn: TLabel
      Left = 360
      Top = 296
      Width = 41
      Height = 13
      Caption = 'Run-On'
    end
    object lblRunOnPrice: TLabel
      Left = 504
      Top = 274
      Width = 45
      Height = 13
      Caption = 'Sell Price'
    end
    object lblRunOnCost: TLabel
      Left = 592
      Top = 274
      Width = 45
      Height = 13
      Caption = 'Buy Price'
    end
    object lblRunOnQty: TLabel
      Left = 408
      Top = 274
      Width = 44
      Height = 13
      Caption = 'Quantity'
    end
    object mmLineNarrative: TMemo
      Left = 8
      Top = 66
      Width = 345
      Height = 247
      ScrollBars = ssVertical
      TabOrder = 2
      OnExit = mmLineNarrativeExit
    end
    object PriceGrid: TStringGrid
      Left = 368
      Top = 66
      Width = 321
      Height = 165
      ColCount = 4
      DefaultColWidth = 35
      DefaultRowHeight = 22
      Enabled = False
      RowCount = 51
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goTabs]
      PopupMenu = ppmnPrices
      ScrollBars = ssVertical
      TabOrder = 5
      OnDrawCell = PriceGridDrawCell
      OnKeyPress = PriceGridKeyPress
      OnSelectCell = PriceGridSelectCell
      OnSetEditText = PriceGridSetEditText
      ColWidths = (
        35
        82
        86
        87)
    end
    object edtProdType: TEdit
      Left = 8
      Top = 26
      Width = 289
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnChange = edtProdTypeChange
    end
    object PriceUnitComboBox: TDBLookupComboBox
      Left = 432
      Top = 241
      Width = 145
      Height = 21
      KeyField = 'Price_Unit'
      ListField = 'Description'
      ListSource = PBEnqDM.PriceUnitSRC
      TabOrder = 6
      OnClick = PriceUnitComboBoxClick
      OnCloseUp = PriceUnitComboBoxCloseUp
    end
    object spdbtnLUProdType: TButton
      Left = 304
      Top = 26
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = spdbtnLUProdTypeClick
    end
    object PriceUnitSpeedBtn: TButton
      Left = 592
      Top = 240
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = PriceUnitSpeedBtnClick
    end
    object edtSupplier: TEdit
      Left = 368
      Top = 26
      Width = 289
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
    object SupplierSpeedBtn: TButton
      Left = 664
      Top = 26
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = SupplierSpeedBtnClick
    end
    object edtRunOnQty: TEdit
      Left = 408
      Top = 292
      Width = 81
      Height = 21
      Enabled = False
      TabOrder = 8
      OnChange = edtRunOnQtyChange
      OnKeyPress = edtRunOnQtyKeyPress
    end
    object edtRunOnPrice: TEdit
      Left = 504
      Top = 292
      Width = 73
      Height = 21
      Enabled = False
      TabOrder = 9
      OnChange = edtRunOnPriceChange
      OnKeyPress = edtRunOnPriceKeyPress
    end
    object edtRunOnCost: TEdit
      Left = 592
      Top = 292
      Width = 81
      Height = 21
      TabOrder = 10
      OnChange = edtRunOnCostChange
      OnKeyPress = edtRunOnCostKeyPress
    end
  end
  object edtCustomer: TEdit
    Left = 70
    Top = 29
    Width = 267
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 0
    OnChange = edtCustomerChange
  end
  object edtDescription: TEdit
    Left = 70
    Top = 88
    Width = 307
    Height = 21
    MaxLength = 80
    TabOrder = 2
    OnChange = edtDescriptionChange
  end
  object spdbtnLUCust: TButton
    Left = 352
    Top = 28
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = spdbtnLUCustClick
  end
  object edtdatePoint: TEdit
    Left = 494
    Top = 0
    Width = 160
    Height = 21
    TabOrder = 3
    OnExit = edtdatePointExit
  end
  object edtDateRequired: TEdit
    Left = 494
    Top = 29
    Width = 160
    Height = 21
    TabOrder = 4
    OnExit = edtDateRequiredExit
  end
  object btbtnOK: TBitBtn
    Left = 520
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Save'
    Default = True
    Enabled = False
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 7
    OnClick = btbtnOKClick
  end
  object CancelBitBtn: TBitBtn
    Left = 608
    Top = 440
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 8
  end
  object spdbtnLURep: TButton
    Left = 660
    Top = 58
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = spdbtnLURepClick
  end
  object cmbbxContactList: TComboBox
    Left = 70
    Top = 59
    Width = 267
    Height = 21
    Style = csDropDownList
    TabOrder = 9
    OnChange = cmbbxContactListChange
  end
  object cmbbxRepList: TComboBox
    Left = 494
    Top = 59
    Width = 156
    Height = 21
    Style = csDropDownList
    TabOrder = 10
    OnChange = cmbbxRepListChange
  end
  object cmbbxOperators: TComboBox
    Left = 494
    Top = 88
    Width = 156
    Height = 21
    Style = csDropDownList
    TabOrder = 11
    OnChange = cmbbxOperatorsChange
  end
  object ContactSpeedButton: TButton
    Left = 352
    Top = 56
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
    TabOrder = 12
    OnClick = ContactSpeedButtonClick
  end
  object btnConvert: TButton
    Left = 0
    Top = 440
    Width = 129
    Height = 25
    Caption = 'Convert to Enquiry'
    TabOrder = 13
    OnClick = btnConvertClick
  end
  object ppmnPrices: TPopupMenu
    Left = 552
    Top = 240
    object DeleteQuantity1: TMenuItem
      Caption = 'Delete Quantity'
      OnClick = DeleteQuantity1Click
    end
    object DeleteAllQuantities1: TMenuItem
      Caption = 'Delete All Quantities'
      OnClick = DeleteAllQuantities1Click
    end
  end
end
