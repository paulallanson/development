object PBDelivStockFrm: TPBDelivStockFrm
  Left = 243
  Top = 106
  BorderStyle = bsDialog
  Caption = 'Stock Location Selection'
  ClientHeight = 345
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnActivate = FormActivate
  TextHeight = 17
  object Label2: TLabel
    Left = 28
    Top = 112
    Width = 53
    Height = 17
    Caption = 'Pack Size'
  end
  object CountGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 330
    Height = 185
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object PBinLbl: TLabel
      Left = 64
      Top = 149
      Width = 17
      Height = 17
      Caption = 'Bin'
    end
    object Label6: TLabel
      Left = 33
      Top = 21
      Width = 48
      Height = 17
      Alignment = taRightJustify
      Caption = 'Quantity'
      WordWrap = True
    end
    object LblPackSize: TLabel
      Left = 29
      Top = 53
      Width = 52
      Height = 17
      Caption = 'Pack size'
    end
    object LblBox: TLabel
      Left = 5
      Top = 85
      Width = 76
      Height = 17
      Caption = 'No. of boxes'
    end
    object Label5: TLabel
      Left = 27
      Top = 117
      Width = 54
      Height = 17
      Caption = 'Pack cost'
    end
    object lblSetsQty: TLabel
      Left = 193
      Top = 21
      Width = 78
      Height = 17
      Caption = 'Sets per pad:'
    end
    object BinEdit: TEdit
      Left = 89
      Top = 145
      Width = 121
      Height = 25
      CharCase = ecUpperCase
      TabOrder = 4
      OnChange = CheckOk
    end
    object MemoQty: TMemo
      Left = 89
      Top = 16
      Width = 89
      Height = 25
      Alignment = taRightJustify
      TabOrder = 0
      WantReturns = False
      WordWrap = False
      OnChange = MemoQtyChange
      OnKeyPress = MemoQtyKeyPress
    end
    object MemoPackSize: TMemo
      Left = 89
      Top = 48
      Width = 89
      Height = 25
      Alignment = taRightJustify
      TabOrder = 1
      WantReturns = False
      WordWrap = False
      OnChange = MemoPackSizeChange
      OnKeyPress = MemoQtyKeyPress
    end
    object MemoNoOfBoxes: TMemo
      Left = 89
      Top = 80
      Width = 89
      Height = 25
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
      WantReturns = False
      WordWrap = False
    end
    object SearchBtn: TButton
      Left = 217
      Top = 144
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
      OnClick = SearchBtnClick
    end
    object MemoCost: TMemo
      Left = 89
      Top = 112
      Width = 89
      Height = 25
      Alignment = taRightJustify
      TabOrder = 3
      WantReturns = False
      WordWrap = False
      OnChange = CheckOk
      OnEnter = SaveValue
      OnExit = ValidateMoney
      OnKeyPress = CheckKeyIsNumber
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 310
    Width = 346
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 284
    ExplicitWidth = 315
    object OKBtn: TBitBtn
      Left = 71
      Top = 3
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 0
      OnClick = OKBtnClick
    end
    object CancelBtn: TBitBtn
      Left = 159
      Top = 3
      Width = 75
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = CancelBtnClick
    end
  end
  object grpbxNumbered: TGroupBox
    Left = 8
    Top = 194
    Width = 330
    Height = 103
    Caption = 'Numbered'
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 51
      Top = 24
      Width = 30
      Height = 17
      Caption = 'From'
    end
    object Label3: TLabel
      Left = 67
      Top = 52
      Width = 14
      Height = 17
      Caption = 'To'
    end
    object Label4: TLabel
      Left = 16
      Top = 80
      Width = 34
      Height = 17
      Caption = 'Count'
    end
    object lblCount: TLabel
      Left = 88
      Top = 80
      Width = 48
      Height = 17
      Caption = 'lblCount'
    end
    object edtNumberFrom: TEdit
      Left = 89
      Top = 20
      Width = 137
      Height = 25
      TabOrder = 0
      OnChange = edtNumberFromChange
      OnKeyPress = MemoQtyKeyPress
    end
    object edtNumberTo: TEdit
      Left = 89
      Top = 48
      Width = 137
      Height = 25
      TabOrder = 1
      OnChange = edtNumberToChange
      OnKeyPress = MemoQtyKeyPress
    end
  end
end
