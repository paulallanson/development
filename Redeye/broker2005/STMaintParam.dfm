object STMaintParamFrm: TSTMaintParamFrm
  Left = 123
  Top = 111
  BorderStyle = bsDialog
  Caption = 'Maintain Stock System Parameters'
  ClientHeight = 360
  ClientWidth = 581
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object LblCour: TLabel
    Left = 288
    Top = 248
    Width = 79
    Height = 13
    Caption = 'Default Courier'
  end
  object SeqNoGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 273
    Height = 121
    Caption = 'Sequence Numbers'
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 29
      Width = 123
      Height = 13
      Caption = 'Last Purchase Order No.'
    end
    object Label2: TLabel
      Left = 8
      Top = 61
      Width = 104
      Height = 13
      Caption = 'Last Store Order No.'
    end
    object SOrdLbl: TLabel
      Left = 8
      Top = 93
      Width = 103
      Height = 13
      Caption = 'Last Sales Order No.'
    end
    object PONoSpinEdit: TSpinEdit
      Left = 160
      Top = 24
      Width = 105
      Height = 22
      MaxValue = 9999999
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object SoNoSpinEdit: TSpinEdit
      Left = 160
      Top = 56
      Width = 105
      Height = 22
      MaxValue = 9999999
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
    object SOPNoSpinEdit: TSpinEdit
      Left = 160
      Top = 88
      Width = 105
      Height = 22
      MaxValue = 9999999
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
  end
  object ReplGroupBox: TGroupBox
    Left = 8
    Top = 136
    Width = 273
    Height = 217
    Caption = 'Replenishment'
    ParentBackground = False
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 29
      Width = 113
      Height = 13
      Caption = 'Purch Ord % Pack Size'
    end
    object Label4: TLabel
      Left = 8
      Top = 61
      Width = 111
      Height = 13
      Caption = 'Store Ord % Pack Size'
    end
    object Label5: TLabel
      Left = 8
      Top = 92
      Width = 69
      Height = 13
      Caption = 'Def W/House'
    end
    object Label6: TLabel
      Left = 8
      Top = 124
      Width = 60
      Height = 13
      Caption = 'Pick List Ref'
    end
    object POPercMemo: TMemo
      Left = 160
      Top = 24
      Width = 105
      Height = 25
      Alignment = taRightJustify
      Lines.Strings = (
        '0.00')
      TabOrder = 0
      WantReturns = False
      OnEnter = EnterValueField
      OnExit = ExitValueField
    end
    object SOPercMemo: TMemo
      Left = 160
      Top = 56
      Width = 105
      Height = 25
      Alignment = taRightJustify
      Lines.Strings = (
        '0.00')
      TabOrder = 1
      WantReturns = False
      OnEnter = EnterValueField
      OnExit = ExitValueField
    end
    object WhouseDBLookupComboBox: TDBLookupComboBox
      Left = 88
      Top = 88
      Width = 177
      Height = 21
      KeyField = 'Part_Store'
      ListField = 'Part_Store_Name'
      ListSource = STStockDataMod.StoresDataSource
      TabOrder = 2
    end
    object PickRefEdit: TEdit
      Left = 144
      Top = 120
      Width = 121
      Height = 21
      MaxLength = 10
      TabOrder = 3
      Text = 'Pick List Ref'
    end
    object ChkBxStkSystm: TCheckBox
      Left = 6
      Top = 187
      Width = 179
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Stock System in use'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object chkbxOverPicking: TCheckBox
      Left = 6
      Top = 148
      Width = 179
      Height = 16
      Alignment = taLeftJustify
      Caption = 'Allow Overpicking'
      TabOrder = 5
    end
    object chkbxAutoAllocate: TCheckBox
      Left = 6
      Top = 167
      Width = 179
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Auto Allocate Call Offs'
      TabOrder = 6
    end
  end
  object GroupBox1: TGroupBox
    Left = 288
    Top = 8
    Width = 289
    Height = 57
    Caption = 'Look-Ups'
    ParentBackground = False
    TabOrder = 2
    object Label7: TLabel
      Left = 8
      Top = 29
      Width = 65
      Height = 13
      Caption = 'Search Timer'
    end
    object SearchTimerSpinEdit: TSpinEdit
      Left = 144
      Top = 24
      Width = 105
      Height = 22
      Increment = 1000
      MaxValue = 9999999
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
  end
  object ProdLUGridGroupBox: TGroupBox
    Left = 288
    Top = 72
    Width = 289
    Height = 105
    Caption = 'Fields On Product Look-Up Grid'
    ParentBackground = False
    TabOrder = 3
    object DescrCheckBox: TCheckBox
      Left = 8
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Description'
      TabOrder = 0
    end
    object GroupCheckBox: TCheckBox
      Left = 8
      Top = 43
      Width = 97
      Height = 17
      Caption = 'Product Group'
      TabOrder = 1
    end
    object CostCatCheckBox: TCheckBox
      Left = 8
      Top = 61
      Width = 129
      Height = 17
      Caption = 'Purchase Price'
      TabOrder = 2
    end
    object CostListCheckBox: TCheckBox
      Left = 8
      Top = 80
      Width = 129
      Height = 17
      Caption = 'Sell Price'
      TabOrder = 3
    end
  end
  object OKBitBtn: TBitBtn
    Left = 408
    Top = 326
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
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
    TabOrder = 4
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 504
    Top = 326
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 5
  end
  object GroupBox2: TGroupBox
    Left = 288
    Top = 184
    Width = 289
    Height = 49
    Caption = 'Invoicing'
    ParentBackground = False
    TabOrder = 6
    object Label8: TLabel
      Left = 8
      Top = 19
      Width = 70
      Height = 13
      Caption = 'Def Price Unit'
    end
    object DBLUcmbPriceUnit: TDBLookupComboBox
      Left = 96
      Top = 15
      Width = 124
      Height = 21
      KeyField = 'Price_Unit'
      ListField = 'Description'
      ListSource = STStockDataMod.dtSrcPriceUnit
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 224
      Top = 14
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object DBLUCmbBXCourier: TDBLookupComboBox
    Left = 376
    Top = 244
    Width = 169
    Height = 21
    KeyField = 'Courier'
    ListField = 'Courier_Name'
    ListSource = STStockDataMod.CouriersDataSource
    TabOrder = 7
  end
  object btbtnClearCourier: TBitBtn
    Left = 552
    Top = 243
    Width = 25
    Height = 25
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
      305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
      005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
      B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
      B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
      B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
      B0557777FF577777F7F500000E055550805577777F7555575755500000555555
      05555777775555557F5555000555555505555577755555557555}
    NumGlyphs = 2
    TabOrder = 8
    OnClick = btbtnClearCourierClick
  end
  object UpdCompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set'
      'Last_PO_Number = :Last_PO_Number,'
      'Last_SO_Number = :Last_SO_Number,'
      'Last_Store_Ord_No = :Last_Store_Ord_No,'
      'Purch_Ord_Perc_Pack = :Purch_Ord_Perc_Pack,'
      'Store_Ord_Perc_Pack = :Store_Ord_Perc_Pack,'
      'Default_Warehouse = :Default_Warehouse,'
      'Courier = :Courier,'
      'Picking_List_Ref = :Picking_List_Ref,'
      'Search_Timer = :Search_Timer,'
      'Parts_LUG_Fields = :Parts_LUG_Fields,'
      'Price_Unit = :Price_Unit,'
      'Use_Stock_System = :Use_Stock_System,'
      'Allow_Overpicking = :Allow_Overpicking,'
      'Auto_Allocate_Stock = :Auto_Allocate_Stock'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 448
    Top = 120
    ParamData = <
      item
        Name = 'Last_PO_Number'
      end
      item
        Name = 'Last_SO_Number'
        DataType = ftInteger
      end
      item
        Name = 'Last_Store_Ord_No'
      end
      item
        Name = 'Purch_Ord_Perc_Pack'
      end
      item
        Name = 'Store_Ord_Perc_Pack'
      end
      item
        Name = 'Default_Warehouse'
        DataType = ftInteger
      end
      item
        Name = 'Courier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Picking_List_Ref'
      end
      item
        Name = 'Search_Timer'
      end
      item
        Name = 'Parts_LUG_Fields'
      end
      item
        Name = 'Price_Unit'
        DataType = ftInteger
      end
      item
        Name = 'Use_Stock_System'
      end
      item
        Name = 'Allow_Overpicking'
      end
      item
        Name = 'Auto_Allocate_Stock'
      end>
  end
end
