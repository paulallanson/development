object STPrtMntDetsFrm: TSTPrtMntDetsFrm
  Left = 172
  Top = 38
  BorderStyle = bsDialog
  Caption = 'Maintain Products'
  ClientHeight = 485
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 4
    Width = 25
    Height = 13
    Caption = 'Code'
  end
  object Label2: TLabel
    Left = 8
    Top = 30
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label4: TLabel
    Left = 8
    Top = 256
    Width = 67
    Height = 13
    Caption = 'Sell Price (PK)'
  end
  object Label5: TLabel
    Left = 8
    Top = 185
    Width = 49
    Height = 13
    Caption = 'VAT Code'
  end
  object Label6: TLabel
    Left = 8
    Top = 216
    Width = 71
    Height = 13
    Caption = 'Cost Price (PK)'
  end
  object Label7: TLabel
    Left = 216
    Top = 214
    Width = 52
    Height = 26
    Caption = 'Cost Pack Qty'
    WordWrap = True
  end
  object Label8: TLabel
    Left = 8
    Top = 80
    Width = 29
    Height = 13
    Caption = 'Group'
  end
  object Label9: TLabel
    Left = 216
    Top = 256
    Width = 64
    Height = 13
    Caption = 'Sell Pack Qty'
  end
  object Label10: TLabel
    Left = 8
    Top = 338
    Width = 84
    Height = 13
    Caption = 'Invoice Price Unit'
  end
  object Label11: TLabel
    Left = 8
    Top = 56
    Width = 44
    Height = 13
    Caption = 'Customer'
  end
  object LblSlsNomCode: TLabel
    Left = 8
    Top = 368
    Width = 100
    Height = 33
    AutoSize = False
    Caption = 'Sales Nominal Code'
    WordWrap = True
  end
  object LblPurchNom: TLabel
    Left = 8
    Top = 408
    Width = 100
    Height = 33
    AutoSize = False
    Caption = 'Purchase Nominal Code'
    WordWrap = True
  end
  object Label12: TLabel
    Left = 8
    Top = 120
    Width = 100
    Height = 35
    AutoSize = False
    Caption = 'Product Classification'
    WordWrap = True
  end
  object Label3: TLabel
    Left = 8
    Top = 304
    Width = 75
    Height = 13
    Caption = 'Cost Uplift Type'
  end
  object Label13: TLabel
    Left = 384
    Top = 256
    Width = 47
    Height = 13
    Caption = 'Markup %'
  end
  object Label14: TLabel
    Left = 384
    Top = 304
    Width = 24
    Height = 13
    Caption = 'Uplift'
  end
  object CodeEdit: TEdit
    Left = 112
    Top = 4
    Width = 265
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 15
    TabOrder = 0
    OnChange = CodeEditChange
    OnExit = CodeEditExit
  end
  object DescrEdit: TEdit
    Left = 112
    Top = 30
    Width = 361
    Height = 21
    MaxLength = 50
    TabOrder = 1
    OnChange = DescrEditChange
  end
  object CatMemo: TMemo
    Left = 112
    Top = 246
    Width = 89
    Height = 25
    Alignment = taRightJustify
    Lines.Strings = (
      '')
    TabOrder = 13
    WantReturns = False
    WordWrap = False
    OnChange = CatMemoChange
    OnEnter = SaveMemoField
    OnExit = CatMemoExit
    OnKeyPress = CatMemoKeyPress
  end
  object VATDBLookupComboBox: TDBLookupComboBox
    Left = 112
    Top = 185
    Width = 161
    Height = 21
    KeyField = 'Vat_Code'
    ListField = 'Description'
    ListSource = VATsDataSource
    TabOrder = 10
    OnClick = VATDBLookupComboBoxClick
  end
  object CancelBitBtn: TBitBtn
    Left = 328
    Top = 456
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 26
  end
  object OKBitBtn: TBitBtn
    Left = 248
    Top = 456
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 25
    TabStop = False
    OnClick = OKBitBtnClick
  end
  object PurchPriceMemo: TMemo
    Left = 112
    Top = 216
    Width = 89
    Height = 25
    Alignment = taRightJustify
    Lines.Strings = (
      '')
    TabOrder = 11
    WantReturns = False
    WordWrap = False
    OnChange = PurchPriceMemoChange
    OnEnter = SaveMemoField
    OnExit = ValidateMoney
    OnKeyPress = PurchPriceMemoKeyPress
  end
  object PurchPackQtyMemo: TMemo
    Left = 300
    Top = 214
    Width = 70
    Height = 25
    Alignment = taRightJustify
    Lines.Strings = (
      '')
    TabOrder = 12
    WantReturns = False
    WordWrap = False
    OnChange = PurchPackQtyMemoChange
    OnEnter = SaveMemoField
    OnExit = PurchPackQtyMemoExit
    OnKeyPress = PurchPackQtyMemoKeyPress
  end
  object PartGroupDBLookupComboBox: TDBLookupComboBox
    Left = 112
    Top = 80
    Width = 209
    Height = 21
    KeyField = 'Part_Group'
    ListField = 'Part_Group_Descr'
    ListSource = GroupsDataSource
    TabOrder = 5
  end
  object GroupClearBitBtn: TBitBtn
    Left = 328
    Top = 80
    Width = 25
    Height = 23
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
    TabOrder = 6
    TabStop = False
    OnClick = GroupClearBitBtnClick
  end
  object NotInUseCheckBox: TCheckBox
    Left = 416
    Top = 421
    Width = 97
    Height = 17
    Caption = 'Not In Use'
    TabOrder = 23
  end
  object OKSuppBitBtn: TBitBtn
    Left = 152
    Top = 456
    Width = 89
    Height = 25
    Caption = 'OK+Supp'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 24
    TabStop = False
    OnClick = OKSuppBitBtnClick
  end
  object VatMaintBitBtn: TBitBtn
    Left = 288
    Top = 185
    Width = 25
    Height = 23
    Hint = 'Vat Code Maintenance'
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 27
    TabStop = False
    OnClick = VatMaintBitBtnClick
  end
  object PrtGrpMaintBitBtn: TBitBtn
    Left = 360
    Top = 80
    Width = 25
    Height = 23
    Hint = 'Vat Code Maintenance'
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    TabStop = False
    OnClick = PrtGrpMaintBitBtnClick
  end
  object SellPackQtyMemo: TMemo
    Left = 300
    Top = 246
    Width = 70
    Height = 25
    Alignment = taRightJustify
    Lines.Strings = (
      '')
    TabOrder = 14
    WantReturns = False
    WordWrap = False
    OnChange = SellPackQtyMemoChange
    OnEnter = SaveMemoField
    OnExit = SellPackQtyMemoExit
    OnKeyPress = SellPackQtyMemoKeyPress
  end
  object dblkpPriceUnit: TDBLookupComboBox
    Left = 112
    Top = 338
    Width = 129
    Height = 21
    KeyField = 'Price_Unit'
    ListField = 'Description'
    ListSource = srcPriceUnit
    TabOrder = 18
  end
  object BitBtn1: TBitBtn
    Left = 280
    Top = 338
    Width = 25
    Height = 23
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 248
    Top = 338
    Width = 25
    Height = 23
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
    TabOrder = 19
    TabStop = False
    OnClick = BitBtn2Click
  end
  object CustNameEdit: TEdit
    Left = 112
    Top = 56
    Width = 257
    Height = 21
    TabStop = False
    MaxLength = 30
    ReadOnly = True
    TabOrder = 2
    OnChange = CustNameEditChange
  end
  object CustBitBtn: TBitBtn
    Left = 408
    Top = 56
    Width = 25
    Height = 23
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = CustBitBtnClick
  end
  object BitBtnClrCust: TBitBtn
    Left = 376
    Top = 56
    Width = 25
    Height = 23
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
    TabOrder = 3
    TabStop = False
    OnClick = BitBtnClrCustClick
  end
  object ChkBxNumbrd: TCheckBox
    Left = 256
    Top = 118
    Width = 129
    Height = 17
    Caption = 'Numbered'
    TabOrder = 9
  end
  object EdtSlsNom: TEdit
    Left = 112
    Top = 368
    Width = 121
    Height = 21
    ParentShowHint = False
    ShowHint = False
    TabOrder = 21
  end
  object EdtPurchNom: TEdit
    Left = 112
    Top = 416
    Width = 121
    Height = 21
    TabOrder = 22
  end
  object RadGrpPrdClass: TRadioGroup
    Left = 112
    Top = 104
    Width = 129
    Height = 73
    ItemIndex = 0
    Items.Strings = (
      'Stocked'
      'Non stocked'
      'Service item')
    ParentBackground = False
    TabOrder = 8
    OnClick = RadGrpPrdClassClick
  end
  object DBLUCmbBxCstUplft: TDBLookupComboBox
    Left = 112
    Top = 297
    Width = 161
    Height = 21
    KeyField = 'Markup_type'
    ListField = 'Markup_Description'
    ListSource = DataSRCCstUplft
    TabOrder = 16
  end
  object CatMUMemo: TMemo
    Left = 448
    Top = 246
    Width = 65
    Height = 25
    TabStop = False
    Alignment = taRightJustify
    Lines.Strings = (
      '')
    ReadOnly = True
    TabOrder = 15
    WantReturns = False
    WordWrap = False
    OnEnter = SaveMemoField
    OnExit = CatMUMemoExit
    OnKeyPress = CatMUMemoKeyPress
  end
  object MemoUplift: TMemo
    Left = 448
    Top = 294
    Width = 65
    Height = 25
    Alignment = taRightJustify
    Lines.Strings = (
      '')
    TabOrder = 17
    WantReturns = False
    WordWrap = False
    OnChange = MemoUpliftChange
    OnEnter = SaveMemoField
    OnExit = MemoUpliftExit
    OnKeyPress = MemoUpliftKeyPress
  end
  object VATsDataSource: TDataSource
    DataSet = GetVatsQuery
    Left = 312
    Top = 176
  end
  object CheckPartExistsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part From Part Where Part = :Part'
      ' ')
    Left = 360
    Top = 16
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
      
        '       Auto_Update, Part_Group, Purch_Pack_Quantity, Sell_Pack_Q' +
        'uantity,'
      '       Part_Purchase_Price, Part_Mark_Up_List, Part_Mark_Up_Cat,'
      '       Not_In_Use, Track_Serial_No, Last_Store_Lot,'
      
        '       Numbered, Price_Unit, Customer, Branch_No, Sales_Nominal,' +
        ' Purchase_Nominal,'
      '       Markup_Type, Markup_Value, Product_Class)'
      'Values'
      
        '(:Part, :Part_Description, :Part_Cost_List, :Part_Cost_Cat, :Vat' +
        ', '#39'Y'#39','
      
        '       :Auto_Update, :Part_Group, :Purch_Pack_Quantity, :Sell_Pa' +
        'ck_Quantity,'
      
        '       :Part_Purchase_Price, :Part_Mark_Up_List, :Part_Mark_Up_C' +
        'at,'
      '       :Not_In_Use, :Track_Serial_No, '#39'LOT00000'#39','
      
        '       :Numbered, :Price_Unit, :Customer, :Branch, :Sales_Nom, :' +
        'Purch_Nom,'
      '       :Markup_Type, :Markup_Val, :Prod_Class)'
      ''
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' ')
    Left = 392
    Top = 16
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
        Name = 'Vat'
      end
      item
        Name = 'Auto_Update'
      end
      item
        Name = 'Part_Group'
        DataType = ftString
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Sell_Pack_Quantity'
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
        Name = 'Track_Serial_No'
      end
      item
        Name = 'Numbered'
      end
      item
        Name = 'Price_Unit'
        DataType = ftInteger
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
        Name = 'Sales_Nom'
        DataType = ftString
      end
      item
        Name = 'Purch_Nom'
        DataType = ftString
      end
      item
        Name = 'Markup_Type'
        DataType = ftString
      end
      item
        Name = 'Markup_Val'
        DataType = ftFloat
      end
      item
        Name = 'Prod_Class'
        DataType = ftString
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
      'Vat_Code = :Vat,'
      'Part_Updated = '#39'Y'#39','
      'Auto_Update =:Auto_Update,'
      'Part_Group = :Part_Group,'
      'Purch_Pack_Quantity = :Purch_Pack_Quantity,'
      'Sell_Pack_Quantity = :Sell_Pack_Quantity,'
      'Part_Purchase_Price = :Part_Purchase_Price,'
      'Part_Mark_Up_Cat = :Part_Mark_Up_Cat,'
      'Part_Mark_Up_List = :Part_Mark_Up_List,'
      'Not_In_Use = :Not_In_Use,'
      'Track_Serial_No = :Track_Serial_No,'
      'Customer = :Customer,'
      'Branch_No = :Branch,'
      'Price_Unit = :Price_Unit,'
      'Numbered = :Numbered,'
      'Sales_Nominal = :Sales_Nom,'
      'Purchase_Nominal = :Purch_Nom,'
      'Markup_Type = :Markup_Type,'
      'Markup_Value = :Markup_Val,'
      'Product_Class = :Prod_Class'
      'Where (Part = :Part)'
      ''
      ''
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 288
    Top = 16
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
        Name = 'Vat'
      end
      item
        Name = 'Auto_Update'
      end
      item
        Name = 'Part_Group'
        DataType = ftString
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Sell_Pack_Quantity'
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
        Name = 'Track_Serial_No'
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
        Name = 'Price_Unit'
        DataType = ftInteger
      end
      item
        Name = 'Numbered'
      end
      item
        Name = 'Sales_Nom'
        DataType = ftString
      end
      item
        Name = 'Purch_Nom'
        DataType = ftString
      end
      item
        Name = 'Markup_Type'
        DataType = ftString
      end
      item
        Name = 'Markup_Val'
        DataType = ftFloat
      end
      item
        Name = 'Prod_Class'
        DataType = ftString
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
    Top = 16
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object GetGroupsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Group, Part_Group_Descr_Short, Part_Group_Descr'
      'from'
      'Part_Group'
      'Order by Part_Group_Descr'
      ' ')
    Left = 416
    Top = 72
  end
  object GroupsDataSource: TDataSource
    DataSet = GetGroupsQuery
    Left = 440
    Top = 72
  end
  object GetVatsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From VAT_Code'
      'Order By VAT_Code'
      ' ')
    Left = 328
    Top = 176
  end
  object srcPriceUnit: TDataSource
    DataSet = qryPriceUnit
    Left = 320
    Top = 336
  end
  object qryPriceUnit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Price_Unit'
      'order by Description')
    Left = 304
    Top = 336
  end
  object qryCstUplft: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Markup_type')
    Left = 288
    Top = 288
  end
  object DataSRCCstUplft: TDataSource
    DataSet = qryCstUplft
    Left = 304
    Top = 288
  end
end
