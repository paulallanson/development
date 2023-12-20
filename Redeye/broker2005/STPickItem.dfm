object STPickItemFrm: TSTPickItemFrm
  Left = 176
  Top = 129
  Caption = 'Change Picking Details'
  ClientHeight = 271
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 50
    Height = 13
    Caption = 'Part Code'
  end
  object Label3: TLabel
    Left = 16
    Top = 43
    Width = 59
    Height = 13
    Caption = 'Description'
  end
  object SerialNoLbl: TLabel
    Left = 22
    Top = 224
    Width = 57
    Height = 13
    Alignment = taRightJustify
    Caption = 'Serial No.'#39's'
    Visible = False
  end
  object Label2: TLabel
    Left = 24
    Top = 72
    Width = 46
    Height = 13
    Caption = 'Pack Size'
  end
  object SerialGrid: TStringGrid
    Left = 88
    Top = 217
    Width = 249
    Height = 112
    ColCount = 2
    DefaultColWidth = 210
    DefaultRowHeight = 22
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 3
    Visible = False
    OnDrawCell = SerialGridDrawCell
    OnKeyUp = SerialGridKeyUp
  end
  object OKBtn: TBitBtn
    Left = 148
    Top = 224
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
    TabOrder = 1
    OnClick = OKBtnClick
  end
  object CancelBtn: TBitBtn
    Left = 236
    Top = 224
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object PartEdit: TEdit
    Left = 96
    Top = 8
    Width = 201
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 4
    OnExit = PartEditExit
  end
  object DescriptionEdit: TEdit
    Left = 96
    Top = 35
    Width = 305
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 5
  end
  object AllocGroupBox: TGroupBox
    Left = 16
    Top = 96
    Width = 201
    Height = 113
    Caption = 'Allocated'
    ParentBackground = False
    TabOrder = 6
    object ABinLbl: TLabel
      Left = 48
      Top = 57
      Width = 16
      Height = 13
      Caption = 'Bin'
    end
    object Label5: TLabel
      Left = 19
      Top = 25
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Quantity'
      WordWrap = True
    end
    object ALotLbl: TLabel
      Left = 28
      Top = 88
      Width = 37
      Height = 13
      Caption = 'Lot No.'
    end
    object ABinEdit: TEdit
      Left = 72
      Top = 49
      Width = 105
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
      OnExit = ABinEditExit
    end
    object ALotEdit: TEdit
      Left = 72
      Top = 80
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
  end
  object PickGroupBox: TGroupBox
    Left = 232
    Top = 96
    Width = 217
    Height = 113
    Caption = 'Picked'
    ParentBackground = False
    TabOrder = 0
    object PBinLbl: TLabel
      Left = 48
      Top = 53
      Width = 16
      Height = 13
      Caption = 'Bin'
    end
    object Label6: TLabel
      Left = 19
      Top = 21
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Quantity'
      WordWrap = True
    end
    object PLotLbl: TLabel
      Left = 28
      Top = 84
      Width = 37
      Height = 13
      Caption = 'Lot No.'
    end
    object PBinEdit: TEdit
      Left = 72
      Top = 49
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnExit = ABinEditExit
      OnKeyUp = PBinEditKeyUp
    end
    object PLotEdit: TEdit
      Left = 72
      Top = 80
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnKeyUp = PLotEditKeyUp
    end
    object PQtyEdit: TEdit
      Left = 72
      Top = 17
      Width = 105
      Height = 21
      TabOrder = 0
      OnKeyPress = PQtyEditKeyPress
      OnKeyUp = PQtyEditKeyUp
    end
    object btnLUPartBinLot: TButton
      Left = 184
      Top = 78
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnLUPartBinLotClick
    end
  end
  object EdtPackSize: TEdit
    Left = 96
    Top = 64
    Width = 73
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
end
