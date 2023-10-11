object STMntPOrdQtyFrm: TSTMntPOrdQtyFrm
  Left = 348
  Top = 182
  BorderStyle = bsDialog
  Caption = 'Quantity'
  ClientHeight = 241
  ClientWidth = 391
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 233
    Height = 6
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 49
    Width = 391
    Height = 143
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Details'
      object Label1: TLabel
        Left = 7
        Top = 11
        Width = 48
        Height = 13
        Caption = 'Pack Size'
      end
      object QtyLabel: TLabel
        Left = 7
        Top = 43
        Width = 39
        Height = 13
        Caption = 'Quantity'
      end
      object CostLabel: TLabel
        Left = 7
        Top = 75
        Width = 49
        Height = 13
        Caption = 'Pack Cost'
      end
      object DiscLbl: TLabel
        Left = 191
        Top = 76
        Width = 53
        Height = 13
        Caption = 'Discount %'
      end
      object PackSizeEdit: TEdit
        Left = 71
        Top = 7
        Width = 89
        Height = 21
        TabOrder = 0
        OnEnter = ValueEditEnter
        OnExit = QtyEditExit
      end
      object QtyEdit: TEdit
        Left = 71
        Top = 39
        Width = 89
        Height = 21
        TabOrder = 1
        OnEnter = ValueEditEnter
        OnExit = QtyEditExit
        OnKeyPress = QtyEditKeyPress
      end
      object CostPriceEdit: TEdit
        Left = 71
        Top = 71
        Width = 89
        Height = 21
        TabOrder = 2
        OnChange = CostPriceEditChange
        OnEnter = ValueEditEnter
        OnExit = CostPriceEditExit
      end
      object EdtDiscount: TEdit
        Left = 255
        Top = 71
        Width = 49
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object chkbxSample: TCheckBox
        Left = 191
        Top = 8
        Width = 153
        Height = 17
        Caption = 'This product is a sample'
        TabOrder = 4
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Notes'
      ImageIndex = 1
      object memNotes: TMemo
        Left = 0
        Top = 0
        Width = 383
        Height = 115
        Align = alClient
        MaxLength = 255
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 391
    Height = 49
    Align = alTop
    ParentBackground = False
    TabOrder = 2
    object lblPartLabel: TLabel
      Left = 7
      Top = 8
      Width = 25
      Height = 13
      Caption = 'Part: '
    end
    object Label2: TLabel
      Left = 7
      Top = 28
      Width = 56
      Height = 13
      Caption = 'Description:'
    end
    object lblPart: TLabel
      Left = 72
      Top = 8
      Width = 29
      Height = 13
      Caption = 'lblPart'
    end
    object lblPartDesc: TLabel
      Left = 72
      Top = 28
      Width = 29
      Height = 13
      Caption = 'lblPart'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 192
    Width = 391
    Height = 49
    Align = alBottom
    ParentBackground = False
    TabOrder = 3
    object OKBitBtn: TBitBtn
      Left = 119
      Top = 16
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
      Left = 207
      Top = 16
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = CancelBitBtnClick
    end
  end
end
