object STPrtMntDetsMultiFrm: TSTPrtMntDetsMultiFrm
  Left = 232
  Top = 53
  BorderStyle = bsDialog
  ClientHeight = 595
  ClientWidth = 868
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object Label5: TLabel
    Left = 8
    Top = 132
    Width = 48
    Height = 13
    Caption = 'VAT Code'
  end
  object Label7: TLabel
    Left = 8
    Top = 264
    Width = 75
    Height = 13
    Caption = 'Purch Pack Qty'
  end
  object Label8: TLabel
    Left = 8
    Top = 70
    Width = 33
    Height = 13
    Caption = 'Group'
  end
  object Label1: TLabel
    Left = 8
    Top = 352
    Width = 77
    Height = 13
    Caption = 'List Mark-Up %'
    Visible = False
  end
  object Label2: TLabel
    Left = 8
    Top = 379
    Width = 77
    Height = 13
    Caption = 'Cat Mark-Up %'
  end
  object Label6: TLabel
    Left = 8
    Top = 324
    Width = 77
    Height = 13
    Caption = 'Purch Price (PK)'
  end
  object Label3: TLabel
    Left = 8
    Top = 296
    Width = 64
    Height = 13
    Caption = 'Sell Pack Qty'
  end
  object Label4: TLabel
    Left = 8
    Top = 409
    Width = 88
    Height = 13
    Caption = 'Invoice Price Unit'
  end
  object Label9: TLabel
    Left = 8
    Top = 38
    Width = 49
    Height = 13
    Caption = 'Customer'
  end
  object Label10: TLabel
    Left = 8
    Top = 102
    Width = 23
    Height = 13
    Caption = 'Type'
  end
  object Label11: TLabel
    Left = 8
    Top = 438
    Width = 83
    Height = 13
    Caption = 'Unit of Measure'
  end
  object Label12: TLabel
    Left = 8
    Top = 160
    Width = 68
    Height = 26
    Caption = 'Product Classification'
    WordWrap = True
  end
  object CancelBitBtn: TBitBtn
    Left = 440
    Top = 560
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 0
  end
  object OKBitBtn: TBitBtn
    Left = 352
    Top = 560
    Width = 75
    Height = 25
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = OKBitBtnClick
  end
  object FromGroupBox: TGroupBox
    Left = 104
    Top = 8
    Width = 369
    Height = 540
    Caption = 'Change From'
    Enabled = False
    TabOrder = 2
    object VATDBLookupComboBox: TDBLookupComboBox
      Left = 8
      Top = 120
      Width = 161
      Height = 21
      KeyField = 'VAT_Code'
      ListField = 'Description'
      ListSource = VATsDataSource
      TabOrder = 0
    end
    object PurchPriceMemo: TMemo
      Left = 8
      Top = 309
      Width = 129
      Height = 23
      Alignment = taRightJustify
      Lines.Strings = (
        '')
      TabOrder = 1
      WantReturns = False
      OnEnter = SaveMemoField
      OnExit = PurchPriceMemoExit
    end
    object PartGroupDBLookupComboBox: TDBLookupComboBox
      Left = 8
      Top = 56
      Width = 209
      Height = 21
      KeyField = 'Part_Group'
      ListField = 'Part_Group_Descr'
      ListSource = GroupsDataSource
      TabOrder = 2
    end
    object ListMUMemo: TMemo
      Left = 8
      Top = 337
      Width = 65
      Height = 23
      Alignment = taRightJustify
      Lines.Strings = (
        '')
      TabOrder = 3
      Visible = False
      WantReturns = False
      OnEnter = SaveMemoField
    end
    object CatMUMemo: TMemo
      Left = 8
      Top = 365
      Width = 65
      Height = 23
      Alignment = taRightJustify
      Lines.Strings = (
        '')
      TabOrder = 4
      WantReturns = False
      OnEnter = SaveMemoField
    end
    object NotInUseCheckBox: TCheckBox
      Left = 8
      Top = 456
      Width = 201
      Height = 17
      Caption = 'Not In Use'
      TabOrder = 5
    end
    object AutoUpdCheckBox: TCheckBox
      Left = 8
      Top = 475
      Width = 201
      Height = 17
      Caption = 'Allow Auto Update'
      TabOrder = 6
    end
    object SellPackQtySpinEdit: TSpinEdit
      Left = 8
      Top = 280
      Width = 81
      Height = 22
      MaxValue = 9999999
      MinValue = 1
      TabOrder = 7
      Value = 1
    end
    object UseSNsCheckBox: TCheckBox
      Left = 104
      Top = 343
      Width = 129
      Height = 17
      Caption = 'Serial numbers'
      TabOrder = 8
      Visible = False
    end
    object PurchPackQtySpinEdit: TSpinEdit
      Left = 8
      Top = 250
      Width = 81
      Height = 22
      MaxValue = 9999999
      MinValue = 1
      TabOrder = 9
      Value = 1
    end
    object dblkpPriceUnit: TDBLookupComboBox
      Left = 8
      Top = 394
      Width = 145
      Height = 21
      KeyField = 'Price_Unit'
      ListField = 'Description'
      ListSource = srcPriceUnit
      TabOrder = 10
    end
    object CustNameEdit: TEdit
      Left = 8
      Top = 22
      Width = 281
      Height = 21
      TabStop = False
      MaxLength = 30
      ReadOnly = True
      TabOrder = 11
    end
    object ChkBxNumbrd: TCheckBox
      Left = 8
      Top = 495
      Width = 129
      Height = 17
      Caption = 'Numbered'
      TabOrder = 12
    end
    object PartTypeDBLookupComboBox: TDBLookupComboBox
      Left = 8
      Top = 88
      Width = 209
      Height = 21
      KeyField = 'Product_Type'
      ListField = 'Description'
      ListSource = DSGetPrdTyp
      TabOrder = 13
    end
    object dblkpUOM: TDBLookupComboBox
      Left = 8
      Top = 426
      Width = 145
      Height = 21
      KeyField = 'Unit_of_Measure'
      ListField = 'UOM_Description'
      ListSource = DSGetUOM
      TabOrder = 14
    end
    object chkbxOrderOnline: TCheckBox
      Left = 8
      Top = 514
      Width = 129
      Height = 17
      Caption = 'Order product online'
      TabOrder = 15
    end
    object rdgrpClass: TRadioGroup
      Left = 8
      Top = 143
      Width = 129
      Height = 98
      ItemIndex = 0
      Items.Strings = (
        'Stocked'
        'Non stocked'
        'Service item'
        'Print On Demand')
      ParentBackground = False
      TabOrder = 16
    end
  end
  object ToGroupBox: TGroupBox
    Left = 480
    Top = 8
    Width = 369
    Height = 540
    Caption = 'Change To'
    TabOrder = 3
    object VATToDBLookupComboBox: TDBLookupComboBox
      Left = 8
      Top = 119
      Width = 161
      Height = 21
      KeyField = 'VAT_Code'
      ListField = 'Description'
      ListSource = VATsDataSource
      TabOrder = 0
      OnClick = VATToDBLookupComboBoxClick
    end
    object PurchPriceToMemo: TMemo
      Left = 8
      Top = 309
      Width = 129
      Height = 23
      Alignment = taRightJustify
      TabOrder = 1
      WantReturns = False
      OnChange = PurchPriceToMemoChange
      OnEnter = SaveMemoField
      OnExit = PurchPriceMemoExit
    end
    object PartGroupToDBLookupComboBox: TDBLookupComboBox
      Left = 8
      Top = 53
      Width = 209
      Height = 21
      KeyField = 'Part_Group'
      ListField = 'Part_Group_Descr'
      ListSource = GroupsDataSource
      TabOrder = 2
      OnClick = PartGroupToDBLookupComboBoxClick
    end
    object ListMUToMemo: TMemo
      Left = 8
      Top = 337
      Width = 65
      Height = 23
      Alignment = taRightJustify
      TabOrder = 3
      Visible = False
      WantReturns = False
      OnChange = ListMUToMemoChange
      OnEnter = SaveMemoField
      OnExit = MUMemoExit
    end
    object CATMUToMemo: TMemo
      Left = 8
      Top = 365
      Width = 65
      Height = 23
      Alignment = taRightJustify
      TabOrder = 4
      WantReturns = False
      OnChange = CATMUToMemoChange
      OnEnter = SaveMemoField
      OnExit = MUMemoExit
    end
    object NotInUseToCheckBox: TCheckBox
      Left = 8
      Top = 454
      Width = 201
      Height = 17
      Caption = 'Not In Use'
      State = cbGrayed
      TabOrder = 5
      OnClick = NotInUseToCheckBoxClick
    end
    object AutoUpdToCheckBox: TCheckBox
      Left = 8
      Top = 473
      Width = 201
      Height = 17
      Caption = 'Allow Auto Update'
      State = cbGrayed
      TabOrder = 6
      OnClick = AutoUpdToCheckBoxClick
    end
    object PurchPackQtyToSpinEdit: TSpinEdit
      Left = 8
      Top = 249
      Width = 81
      Height = 22
      MaxValue = 9999999
      MinValue = 1
      TabOrder = 7
      Value = 1
      OnChange = PurchPackQtyToSpinEditChange
    end
    object UseSNsToCheckBox: TCheckBox
      Left = 224
      Top = 449
      Width = 129
      Height = 17
      Caption = 'Serial numbers'
      State = cbGrayed
      TabOrder = 8
      Visible = False
    end
    object SellPackQtyToSpinEdit: TSpinEdit
      Left = 8
      Top = 280
      Width = 81
      Height = 22
      MaxValue = 9999999
      MinValue = 1
      TabOrder = 9
      Value = 1
      OnChange = SellPackQtyToSpinEditChange
    end
    object dblkpPriceUnitTo: TDBLookupComboBox
      Left = 8
      Top = 393
      Width = 145
      Height = 21
      KeyField = 'Price_Unit'
      ListField = 'Description'
      ListSource = srcPriceUnit
      TabOrder = 10
      OnClick = dblkpPriceUnitToClick
    end
    object CustNameToEdit: TEdit
      Left = 8
      Top = 22
      Width = 281
      Height = 21
      TabStop = False
      MaxLength = 30
      ReadOnly = True
      TabOrder = 11
      OnChange = CustNameToEditChange
    end
    object CustBitBtn: TBitBtn
      Left = 296
      Top = 20
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      OnClick = CustBitBtnClick
    end
    object ChkBxToNumbrd: TCheckBox
      Left = 8
      Top = 493
      Width = 129
      Height = 17
      Caption = 'Numbered'
      State = cbGrayed
      TabOrder = 13
      OnClick = ChkBxToNumbrdClick
    end
    object PartTypeToDBLookupComboBox: TDBLookupComboBox
      Left = 8
      Top = 86
      Width = 209
      Height = 21
      KeyField = 'Product_Type'
      ListField = 'Description'
      ListSource = DSGetPrdTyp
      TabOrder = 14
      OnClick = PartTypeToDBLookupComboBoxClick
    end
    object dblkpUOMTo: TDBLookupComboBox
      Left = 8
      Top = 425
      Width = 145
      Height = 21
      KeyField = 'Unit_of_Measure'
      ListField = 'UOM_Description'
      ListSource = DSGetUOM
      TabOrder = 15
      OnClick = dblkpUOMToClick
    end
    object chkbxToOrderOnline: TCheckBox
      Left = 8
      Top = 513
      Width = 129
      Height = 17
      Caption = 'Order product online'
      State = cbGrayed
      TabOrder = 16
      OnClick = chkbxToOrderOnlineClick
    end
    object bitBtnClrCust: TBitBtn
      Left = 330
      Top = 20
      Width = 25
      Height = 25
      Hint = 'Clear'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      OnClick = BitBtnClrCustClick
    end
    object GroupClearBitBtn: TBitBtn
      Left = 226
      Top = 52
      Width = 25
      Height = 25
      Hint = 'Clear'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 18
      OnClick = GroupClearBitBtnClick
    end
    object TypeClearBitBtn: TBitBtn
      Left = 226
      Top = 84
      Width = 25
      Height = 25
      Hint = 'Clear'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      OnClick = TypeClearBitBtnClick
    end
    object BitBtn1: TBitBtn
      Left = 170
      Top = 393
      Width = 25
      Height = 25
      Hint = 'Clear'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 20
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 170
      Top = 425
      Width = 25
      Height = 25
      Hint = 'Clear'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 21
      OnClick = BitBtn2Click
    end
    object rdgrpClassTo: TRadioGroup
      Left = 8
      Top = 143
      Width = 129
      Height = 98
      Items.Strings = (
        'Stocked'
        'Non stocked'
        'Service item'
        'Print On Demand')
      ParentBackground = False
      TabOrder = 22
    end
  end
  object VATsDataSource: TDataSource
    DataSet = GetVatsQuery
    Left = 224
    Top = 160
  end
  object GetGroupsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Group, Part_Group_Descr_Short, Part_Group_Descr'
      'from'
      'Part_Group'
      'Order by Part_Group_Descr'
      ' ')
    Left = 432
    Top = 168
  end
  object GroupsDataSource: TDataSource
    DataSet = GetGroupsQuery
    Left = 464
    Top = 200
  end
  object GetVatsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From VAT_Code'
      'Order By VAT_Code')
    Left = 392
    Top = 168
  end
  object CheckPartExistsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part From Part Where Part = :Part'
      ' ')
    Left = 344
    Top = 168
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object AddPartQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Part'
      
        '(Part, Part_Description, Part_Cost_List, Part_Cost_Cat, Vat_Code' +
        ', Part_Updated,'
      
        '       Auto_Update, Part_Group, Part_Primary_Product, Part_Pack_' +
        'Quantity,'
      '       Part_Purchase_Price, Part_Mark_Up_List, Part_Mark_Up_Cat,'
      
        '       Not_In_Use, Numbered, Last_Store_Lot, Customer, Branch_No' +
        ')'
      'Values'
      
        '(:Part, :Part_Description, :Part_Cost_List, :Part_Cost_Cat, :Vat' +
        '_Code, '#39'Y'#39','
      
        '       :Auto_Update, :Part_Group, :Part_Primary_Product, :Part_P' +
        'ack_Quantity,'
      
        '       :Part_Purchase_Price, :Part_Mark_Up_List, :Part_Mark_Up_C' +
        'at,'
      '       :Not_In_Use, :Numbered, '#39'LOT00000'#39', :Customer, :Branch)'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 288
    Top = 168
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Part_Description'
      end
      item
        Name = 'Part_Cost_List'
      end
      item
        Name = 'Part_Cost_Cat'
      end
      item
        Name = 'Vat_Code'
      end
      item
        Name = 'Auto_Update'
      end
      item
        Name = 'Part_Group'
        DataType = ftString
      end
      item
        Name = 'Part_Primary_Product'
        DataType = ftString
      end
      item
        Name = 'Part_Pack_Quantity'
      end
      item
        Name = 'Part_Purchase_Price'
      end
      item
        Name = 'Part_Mark_Up_List'
      end
      item
        Name = 'Part_Mark_Up_Cat'
      end
      item
        Name = 'Not_In_Use'
      end
      item
        Name = 'Numbered'
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch'
        DataType = ftInteger
      end>
  end
  object UpdPartQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part'
      'Set'
      'Part_Description = :Part_Description,'
      'Part_Cost_List = :Part_Cost_List,'
      'Part_Cost_Cat = :Part_Cost_Cat,'
      'Vat_Code = :Vat_Code,'
      'Part_Updated = '#39'Y'#39','
      'Auto_Update = :Auto_Update, '
      'Part_Group = :Part_Group,'
      'Part_Primary_Product = :Part_Primary_Product, '
      'Part_Pack_Quantity = :Part_Pack_Quantity,'
      'Part_Purchase_Price = :Part_Purchase_Price,'
      'Part_Mark_Up_Cat = :Part_Mark_Up_Cat,'
      'Part_Mark_Up_List = :Part_Mark_Up_List,'
      'Not_In_Use = :Not_In_Use,'
      'Numbered = :Numbered,'
      'Customer = :Customer,'
      'Branch_No = :Branch'
      'Where (Part = :Part)'
      ''
      ' '
      ' '
      ' ')
    Left = 264
    Top = 168
    ParamData = <
      item
        Name = 'Part_Description'
      end
      item
        Name = 'Part_Cost_List'
      end
      item
        Name = 'Part_Cost_Cat'
      end
      item
        Name = 'Vat_Code'
      end
      item
        Name = 'Auto_Update'
      end
      item
        Name = 'Part_Group'
        DataType = ftString
      end
      item
        Name = 'Part_Primary_Product'
        DataType = ftString
      end
      item
        Name = 'Part_Pack_Quantity'
      end
      item
        Name = 'Part_Purchase_Price'
      end
      item
        Name = 'Part_Mark_Up_Cat'
      end
      item
        Name = 'Part_Mark_Up_List'
      end
      item
        Name = 'Not_In_Use'
      end
      item
        Name = 'Numbered'
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch'
        DataType = ftInteger
      end
      item
        Name = 'Part'
      end>
  end
  object DelPartQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Part'
      'Where (Part = :Part)'
      '')
    Left = 320
    Top = 168
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object qryPriceUnit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Price_Unit'
      'order by Description')
    Left = 520
    Top = 256
  end
  object srcPriceUnit: TDataSource
    DataSet = qryPriceUnit
    Left = 568
    Top = 256
  end
  object SQLGetPrdTyp: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'from'
      'Product_Type'
      'Order by Description'
      ' '
      ' '
      ' ')
    Left = 768
    Top = 88
  end
  object DSGetPrdTyp: TDataSource
    DataSet = SQLGetPrdTyp
    Left = 800
    Top = 88
  end
  object SQLGetUOM: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Unit_Of_Measure'
      'order by UOM_Description'
      ' ')
    Left = 640
    Top = 176
  end
  object DSGetUOM: TDataSource
    DataSet = SQLGetUOM
    Left = 696
    Top = 176
  end
end
