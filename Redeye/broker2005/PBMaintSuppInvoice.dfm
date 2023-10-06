object PBMaintSuppInvoicefrm: TPBMaintSuppInvoicefrm
  Left = 3
  Top = 1
  Anchors = [akRight, akBottom]
  Caption = 'Supplier Invoice details'
  ClientHeight = 534
  ClientWidth = 781
  Color = clBtnFace
  Constraints.MinHeight = 570
  Constraints.MinWidth = 795
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 781
    Height = 161
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object Label6: TLabel
      Left = 8
      Top = 8
      Width = 64
      Height = 13
      Caption = 'Invoice From:'
    end
    object Label7: TLabel
      Left = 8
      Top = 140
      Width = 68
      Height = 13
      Caption = 'Account Code'
    end
    object Label2: TLabel
      Left = 456
      Top = 78
      Width = 61
      Height = 13
      Caption = 'Invoice Date'
    end
    object Label3: TLabel
      Left = 456
      Top = 47
      Width = 75
      Height = 13
      Caption = 'Invoice Number'
    end
    object Label1: TLabel
      Left = 456
      Top = 109
      Width = 71
      Height = 13
      Caption = 'PIN Reference'
    end
    object Label9: TLabel
      Left = 456
      Top = 16
      Width = 41
      Height = 13
      Caption = 'Operator'
    end
    object memSupplier: TMemo
      Left = 112
      Top = 8
      Width = 270
      Height = 121
      ReadOnly = True
      TabOrder = 0
    end
    object edtAccountCode: TEdit
      Left = 112
      Top = 132
      Width = 89
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object btnSupplier: TBitBtn
      Left = 392
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Select Customer'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnSupplierClick
    end
    object edtInvoiceDate: TEdit
      Left = 571
      Top = 70
      Width = 97
      Height = 21
      TabOrder = 3
      OnChange = CheckOK
      OnExit = edtInvoiceDateExit
    end
    object edtInvNumber: TEdit
      Left = 571
      Top = 39
      Width = 201
      Height = 21
      TabOrder = 4
      OnChange = edtInvNumberChange
    end
    object edtPINRef: TEdit
      Left = 571
      Top = 101
      Width = 129
      Height = 21
      TabOrder = 5
      OnChange = edtPINRefChange
    end
    object btnInvDate: TBitBtn
      Left = 675
      Top = 68
      Width = 25
      Height = 25
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
      TabOrder = 6
      OnClick = btnInvDateClick
    end
    object dblkpOperator: TDBLookupComboBox
      Left = 571
      Top = 8
      Width = 145
      Height = 21
      KeyField = 'Operator'
      ListField = 'Name'
      ListSource = dmSupplierInvoice.dsOperator
      TabOrder = 7
    end
    object edtOrigInvoice: TEdit
      Left = 571
      Top = 130
      Width = 129
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
      OnChange = edtPINRefChange
    end
    object lblOrigInvoice: TStaticText
      Left = 456
      Top = 136
      Width = 77
      Height = 17
      Caption = 'Original Invoice'
      TabOrder = 9
    end
  end
  object stbrDetails: TStatusBar
    Left = 0
    Top = 515
    Width = 781
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 463
    Width = 781
    Height = 52
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      781
      52)
    object lblDeleteprompt: TLabel
      Left = 444
      Top = 20
      Width = 117
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = 'Delete this invoice'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 456
    end
    object btnOK: TBitBtn
      Left = 596
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
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
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 684
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
    object pnlValues: TPanel
      Left = 1
      Top = 1
      Width = 432
      Height = 50
      Align = alLeft
      ParentBackground = False
      TabOrder = 2
      object lblInvoiceValue: TLabel
        Left = 16
        Top = 17
        Width = 176
        Height = 15
        Caption = 'Total value of previous invoices'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblOrderValue: TLabel
        Left = 16
        Top = 1
        Width = 132
        Height = 15
        Caption = 'Total value of this order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblTotInvVal: TLabel
        Left = 16
        Top = 33
        Width = 322
        Height = 15
        Caption = 'Total value of invoices for this order including this invoice'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 340
    Width = 781
    Height = 123
    Align = alBottom
    ParentBackground = False
    TabOrder = 3
    object Label10: TLabel
      Left = 4
      Top = 8
      Width = 75
      Height = 13
      Caption = 'Sundry Charges'
    end
    object sgCharges: TStringGrid
      Left = 1
      Top = 23
      Width = 488
      Height = 86
      DefaultColWidth = 40
      DefaultRowHeight = 20
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
      PopupMenu = pmnCharges
      TabOrder = 0
      OnDblClick = sgChargesDblClick
      OnDrawCell = sgChargesDrawCell
      ColWidths = (
        40
        179
        70
        71
        101)
    end
    object pnlTotals: TPanel
      Left = 595
      Top = 1
      Width = 185
      Height = 121
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        185
        121)
      object Label4: TLabel
        Left = 14
        Top = 34
        Width = 31
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Goods'
      end
      object Label5: TLabel
        Left = 14
        Top = 61
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'VAT'
      end
      object Label8: TLabel
        Left = 14
        Top = 90
        Width = 24
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Total'
      end
      object memGoods: TMemo
        Left = 88
        Top = 26
        Width = 89
        Height = 23
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Lines.Strings = (
          '')
        TabOrder = 0
        OnChange = memGoodsChange
        OnEnter = SaveValue
        OnExit = ValidateMoney
        OnKeyPress = CheckKeyIsNumber
      end
      object memVAT: TMemo
        Left = 88
        Top = 53
        Width = 89
        Height = 23
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Lines.Strings = (
          '')
        TabOrder = 1
        OnChange = memVATChange
        OnEnter = SaveValue
        OnExit = ValidateMoney
        OnKeyPress = CheckKeyIsNumber
      end
      object memTotal: TMemo
        Left = 88
        Top = 82
        Width = 89
        Height = 23
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  object sgLines: TStringGrid
    Left = 0
    Top = 161
    Width = 781
    Height = 179
    Align = alClient
    ColCount = 10
    DefaultColWidth = 40
    DefaultRowHeight = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    PopupMenu = pmnLines
    TabOrder = 4
    OnDblClick = sgLinesDblClick
    OnDrawCell = sgLinesDrawCell
    OnSelectCell = sgLinesSelectCell
    ColWidths = (
      40
      83
      171
      85
      80
      74
      78
      77
      84
      94)
  end
  object pmnCharges: TPopupMenu
    OnPopup = pmnChargesPopup
    Left = 329
    Top = 385
    object mnAddChg: TMenuItem
      Caption = '&Add'
      OnClick = mnAddChgClick
    end
    object mnChangeChg: TMenuItem
      Caption = '&Change'
      OnClick = mnChangeChgClick
    end
    object mnDeleteChg: TMenuItem
      Caption = '&Delete'
      OnClick = mnDeleteChgClick
    end
  end
  object pmnLines: TPopupMenu
    OnPopup = pmnLinesPopup
    Left = 480
    Top = 177
    object mnChangeLine: TMenuItem
      Caption = '&Change'
      OnClick = mnChangeLineClick
    end
    object mnDeleteLine: TMenuItem
      Caption = '&Delete'
      OnClick = mnDeleteLineClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnAddfromOrder: TMenuItem
      Caption = 'Add line from Buy Print Order'
      OnClick = mnAddfromOrderClick
    end
    object mnAddfromJobBag: TMenuItem
      Caption = 'Add line from Job Bag'
      OnClick = mnAddfromJobBagClick
    end
    object mnAddfromPO: TMenuItem
      Caption = 'Add lines from Purchase Order'
      OnClick = mnAddfromPOClick
    end
  end
  object pmnDummy: TPopupMenu
    Left = 480
    Top = 233
  end
end
