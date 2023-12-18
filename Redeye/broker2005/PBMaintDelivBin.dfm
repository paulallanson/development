object PBMaintDelivBinfrm: TPBMaintDelivBinfrm
  Left = 175
  Top = 121
  BorderStyle = bsDialog
  Caption = 'Add Delivery Bin location'
  ClientHeight = 159
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 13
  object grpBxBins: TGroupBox
    Left = 2
    Top = 0
    Width = 361
    Height = 80
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 63
      Height = 13
      Caption = 'Bin Location'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 48
      Height = 13
      Caption = 'Delivered'
    end
    object Label3: TLabel
      Left = 192
      Top = 56
      Width = 48
      Height = 13
      Caption = 'Allocated'
    end
    object edtBinLocation: TEdit
      Left = 96
      Top = 16
      Width = 257
      Height = 21
      TabOrder = 0
      OnChange = CheckOK
    end
    object memQty: TMemo
      Left = 96
      Top = 48
      Width = 81
      Height = 23
      Alignment = taRightJustify
      TabOrder = 1
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateQty
      OnKeyPress = memQtyKeyPress
    end
    object memQtyAlloc: TMemo
      Left = 272
      Top = 48
      Width = 81
      Height = 23
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateQty
      OnKeyPress = memQtyKeyPress
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 130
    Width = 366
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object btnOK: TBitBtn
      Left = 102
      Top = 3
      Width = 75
      Height = 25
      Caption = 'OK'
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
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TBitBtn
      Left = 190
      Top = 3
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object pnlAdjustment: TPanel
    Left = 0
    Top = 80
    Width = 366
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlAdjustment'
    ParentBackground = False
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 2
      Top = 1
      Width = 362
      Height = 44
      ParentBackground = False
      TabOrder = 0
      object Label4: TLabel
        Left = 16
        Top = 18
        Width = 59
        Height = 13
        Caption = 'Adjustment'
      end
      object edtAdjust: TEdit
        Left = 96
        Top = 12
        Width = 81
        Height = 21
        TabOrder = 0
      end
    end
  end
end
