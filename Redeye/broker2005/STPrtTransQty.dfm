object STPrtTransQtyFrm: TSTPrtTransQtyFrm
  Left = 245
  Top = 153
  BorderStyle = bsDialog
  Caption = 'Transfer Details'
  ClientHeight = 399
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 17
  object PnlActn: TPanel
    Left = 0
    Top = 358
    Width = 375
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 349
    ExplicitWidth = 337
    object OKBitBtn: TBitBtn
      Left = 91
      Top = 8
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
      TabOrder = 0
      OnClick = OKBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 177
      Top = 8
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object pnlJobNumber: TPanel
    Left = 0
    Top = 320
    Width = 375
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 311
    ExplicitWidth = 337
    object grpbxJobNumber: TGroupBox
      Left = 0
      Top = 0
      Width = 375
      Height = 38
      Align = alClient
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 337
      object Label8: TLabel
        Left = 9
        Top = 13
        Width = 73
        Height = 17
        Caption = 'Job Number'
      end
      object edtJobNumber: TEdit
        Left = 88
        Top = 9
        Width = 89
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 375
    Height = 321
    Align = alTop
    TabOrder = 2
    ExplicitTop = 2
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 345
      Height = 169
      ParentBackground = False
      TabOrder = 0
      object Label5: TLabel
        Left = 9
        Top = 50
        Width = 48
        Height = 17
        Caption = 'Quantity'
      end
      object Label1: TLabel
        Left = 9
        Top = 75
        Width = 53
        Height = 17
        Caption = 'Pack Size'
      end
      object QtyLabel: TLabel
        Left = 9
        Top = 105
        Width = 70
        Height = 17
        Caption = 'No of Packs'
      end
      object BinLabel: TLabel
        Left = 9
        Top = 16
        Width = 43
        Height = 17
        Caption = 'Into Bin'
      end
      object Label2: TLabel
        Left = 9
        Top = 135
        Width = 56
        Height = 17
        Caption = 'Pack Cost'
      end
      object memoQty: TMemo
        Left = 94
        Top = 47
        Width = 89
        Height = 21
        Alignment = taRightJustify
        TabOrder = 2
        WantReturns = False
        OnChange = memoQtyChange
        OnKeyPress = memoQtyKeyPress
      end
      object PackSizeMemo: TMemo
        Left = 94
        Top = 76
        Width = 89
        Height = 21
        Alignment = taRightJustify
        TabOrder = 3
        WantReturns = False
        OnChange = PackSizeMemoChange
        OnEnter = ValueMemoEnter
        OnExit = PackSizeMemoExit
        OnKeyPress = PackSizeMemoKeyPress
      end
      object MemoNoofPacks: TMemo
        Left = 94
        Top = 105
        Width = 89
        Height = 21
        Alignment = taRightJustify
        TabOrder = 4
        WantReturns = False
        OnChange = MemoNoofPacksChange
        OnKeyPress = MemoNoofPacksKeyPress
      end
      object BinEdit: TEdit
        Left = 94
        Top = 14
        Width = 153
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object BinBitBtn: TBitBtn
        Left = 262
        Top = 12
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BinBitBtnClick
      end
      object CostMemo: TMemo
        Left = 94
        Top = 134
        Width = 89
        Height = 21
        Alignment = taRightJustify
        TabOrder = 5
        WantReturns = False
        OnChange = CheckOK
        OnEnter = ValueMemoEnter
        OnExit = CostMemoExit
        OnKeyPress = CostMemoKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 177
      Width = 345
      Height = 136
      ParentBackground = False
      TabOrder = 1
      object Label3: TLabel
        Left = 9
        Top = 13
        Width = 63
        Height = 16
        AutoSize = False
        Caption = 'Order Ref'
        WordWrap = True
      end
      object Label4: TLabel
        Left = 150
        Top = 42
        Width = 109
        Height = 17
        Caption = 'sets per pad/book'
      end
      object Label6: TLabel
        Left = 9
        Top = 67
        Width = 91
        Height = 17
        Caption = 'Purchase Order'
      end
      object Label7: TLabel
        Left = 9
        Top = 103
        Width = 47
        Height = 17
        Caption = 'Pallet ID'
      end
      object EdtStckDsc: TEdit
        Left = 110
        Top = 10
        Width = 215
        Height = 25
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object ChkBxInvUpfrnt: TCheckBox
        Left = 7
        Top = 40
        Width = 122
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Paid Stock'
        TabOrder = 1
      end
      object spnSets: TSpinEdit
        Left = 270
        Top = 37
        Width = 55
        Height = 27
        MaxValue = 1000
        MinValue = 1
        TabOrder = 2
        Value = 1
      end
      object memPO: TMemo
        Left = 110
        Top = 63
        Width = 89
        Height = 21
        Alignment = taRightJustify
        TabOrder = 3
        WantReturns = False
        OnKeyPress = PackSizeMemoKeyPress
      end
      object edtPalletID: TEdit
        Left = 110
        Top = 99
        Width = 89
        Height = 25
        CharCase = ecUpperCase
        Enabled = False
        ReadOnly = True
        TabOrder = 4
      end
      object chkbxOvers: TCheckBox
        Left = 219
        Top = 100
        Width = 106
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Stock is Overs'
        Enabled = False
        TabOrder = 5
      end
    end
  end
  object CheckBinSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Bin, Production_Bin'
      'From Part_Store_Bin'
      'Where (Part_Store = :Part_Store) and'
      '      (Part_Bin = :Part_Bin)'
      ' ')
    Left = 344
    Top = 24
    ParamData = <
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Bin'
      end>
  end
  object qryCheckBinCount: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 2 *'
      'from part_store_bin'
      'where part_store = :part_store and'
      'bin_can_pick = '#39'Y'#39';  '
      ' ')
    Left = 282
    Top = 80
    ParamData = <
      item
        Name = 'part_store'
      end>
  end
  object qryJobBag: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select job_bag'
      'from Job_Bag'
      'where job_bag = :Job_Bag and'
      '((inactive = '#39'N'#39') OR (inactive = null))')
    Left = 264
    Top = 88
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
end
