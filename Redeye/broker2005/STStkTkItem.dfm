object STStkTkItemFrm: TSTStkTkItemFrm
  Left = 176
  Top = 129
  Caption = 'Change Stock Count Details'
  ClientHeight = 246
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 12
    Width = 47
    Height = 13
    Caption = 'Part Code'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 39
    Width = 53
    Height = 13
    Caption = 'Description'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object OKBtn: TBitBtn
    Left = 148
    Top = 232
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
    TabOrder = 1
    OnClick = OKBtnClick
  end
  object CancelBtn: TBitBtn
    Left = 236
    Top = 232
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
    TabOrder = 2
  end
  object PartEdit: TEdit
    Left = 96
    Top = 8
    Width = 201
    Height = 21
    TabStop = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    OnExit = PartEditExit
  end
  object DescriptionEdit: TEdit
    Left = 96
    Top = 35
    Width = 305
    Height = 21
    TabStop = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object AllocGroupBox: TGroupBox
    Left = 16
    Top = 72
    Width = 201
    Height = 145
    Caption = 'Prior'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object ABinLbl: TLabel
      Left = 45
      Top = 89
      Width = 15
      Height = 13
      Caption = 'Bin'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 25
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Quantity'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object ALotLbl: TLabel
      Left = 25
      Top = 120
      Width = 35
      Height = 13
      Caption = 'Lot No.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 56
      Width = 48
      Height = 13
      Caption = 'Pack Size'
    end
    object ABinEdit: TEdit
      Left = 72
      Top = 81
      Width = 105
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      OnExit = ABinEditExit
    end
    object ALotEdit: TEdit
      Left = 72
      Top = 112
      Width = 105
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 1
    end
    object AQtyEdit: TEdit
      Left = 72
      Top = 17
      Width = 105
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 2
      OnKeyPress = PQtyEditKeyPress
      OnKeyUp = PQtyEditKeyUp
    end
    object EditPackSize: TEdit
      Left = 72
      Top = 48
      Width = 105
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
  end
  object CountGroupBox: TGroupBox
    Left = 232
    Top = 72
    Width = 201
    Height = 145
    Caption = 'Counted'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object PBinLbl: TLabel
      Left = 41
      Top = 89
      Width = 15
      Height = 13
      Caption = 'Bin'
    end
    object Label6: TLabel
      Left = 24
      Top = 25
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Quantity'
      WordWrap = True
    end
    object PLotLbl: TLabel
      Left = 17
      Top = 120
      Width = 35
      Height = 13
      Caption = 'Lot No.'
    end
    object LblPackSize: TLabel
      Left = 12
      Top = 56
      Width = 48
      Height = 13
      Caption = 'Pack Size'
    end
    object PBinEdit: TEdit
      Left = 72
      Top = 81
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnExit = ABinEditExit
      OnKeyUp = PBinEditKeyUp
    end
    object PLotEdit: TEdit
      Left = 72
      Top = 112
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 2
      OnExit = PLotEditExit
      OnKeyUp = PLotEditKeyUp
    end
    object PQtyEdit: TEdit
      Left = 72
      Top = 17
      Width = 105
      Height = 21
      TabOrder = 0
      OnChange = PQtyEditChange
      OnClick = PQtyEditClick
      OnKeyPress = PQtyEditKeyPress
      OnKeyUp = PQtyEditKeyUp
    end
    object EditCountPackSize: TEdit
      Left = 72
      Top = 48
      Width = 105
      Height = 21
      TabOrder = 3
      OnKeyPress = EditCountPackSizeKeyPress
      OnKeyUp = EditCountPackSizeKeyUp
    end
  end
  object PartBitBtn: TBitBtn
    Left = 312
    Top = 6
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = PartBitBtnClick
  end
end
