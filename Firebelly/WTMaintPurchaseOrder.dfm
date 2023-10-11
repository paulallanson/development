object frmWTMaintPurchaseOrder: TfrmWTMaintPurchaseOrder
  Left = 181
  Top = 12
  Caption = 'Purchase Order'
  ClientHeight = 601
  ClientWidth = 886
  Color = clBtnFace
  Constraints.MinHeight = 640
  Constraints.MinWidth = 900
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 886
    Height = 36
    Align = alTop
    TabOrder = 0
    DesignSize = (
      886
      36)
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 89
      Height = 13
      Caption = 'Purchase Order'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 216
      Top = 12
      Width = 71
      Height = 13
      Caption = 'Date Raised'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 641
      Top = 12
      Width = 83
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Office Contact'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 396
      Top = 12
      Width = 83
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Date Required'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNumber: TEdit
      Left = 104
      Top = 8
      Width = 97
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object dblkpOperator: TDBLookupComboBox
      Left = 737
      Top = 8
      Width = 145
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Operator'
      ListField = 'Operator_Name'
      ListSource = dtmdlPurchaseOrder.dtsOperator
      TabOrder = 1
    end
    object edtDateRequired: TEdit
      Left = 484
      Top = 8
      Width = 89
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      OnChange = CheckOK
      OnExit = edtDateRequiredExit
    end
    object btnDateRequired: TBitBtn
      Left = 580
      Top = 6
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
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
      TabOrder = 3
      OnClick = btnDateRequiredClick
    end
    object dtpckDate: TDateTimePicker
      Left = 296
      Top = 8
      Width = 89
      Height = 21
      Date = 37882.000000000000000000
      Time = 37882.000000000000000000
      TabOrder = 4
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 582
    Width = 886
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 541
    Width = 886
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      886
      41)
    object lblDeleteprompt: TLabel
      Left = 530
      Top = 12
      Width = 175
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = 'Delete this purchase order?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOK: TBitBtn
      Left = 714
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
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
      TabOrder = 2
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 802
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 3
    end
    object chkbxonHold: TCheckBox
      Left = 8
      Top = 12
      Width = 105
      Height = 17
      Caption = 'Order ON HOLD'
      TabOrder = 0
    end
    object chkbxInactive: TCheckBox
      Left = 128
      Top = 12
      Width = 105
      Height = 17
      Caption = 'Order is Inactive'
      TabOrder = 1
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 36
    Width = 886
    Height = 197
    Align = alTop
    Anchors = [akRight, akBottom]
    TabOrder = 3
    DesignSize = (
      886
      197)
    object Label7: TLabel
      Left = 17
      Top = 126
      Width = 45
      Height = 13
      Caption = 'Contact'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 515
      Top = 12
      Width = 60
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Reference'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 17
      Top = 12
      Width = 47
      Height = 13
      Caption = 'Supplier'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 17
      Top = 149
      Width = 65
      Height = 13
      Caption = 'Description'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 17
      Top = 31
      Width = 35
      Height = 13
      Caption = 'Street'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 17
      Top = 72
      Width = 59
      Height = 13
      Caption = 'Town/City'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 17
      Top = 95
      Width = 54
      Height = 13
      Caption = 'Postcode'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 184
      Top = 95
      Width = 33
      Height = 13
      Caption = 'County'
    end
    object btnSupplier: TBitBtn
      Left = 470
      Top = 6
      Width = 25
      Height = 25
      Hint = 'Select Supplier'
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnSupplierClick
    end
    object edtReference: TEdit
      Left = 587
      Top = 8
      Width = 294
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 4
      OnChange = edtReferenceChange
    end
    object btnContact: TBitBtn
      Left = 470
      Top = 120
      Width = 25
      Height = 25
      Hint = 'Select Contact'
      Anchors = [akTop, akRight]
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
      OnClick = btnContactClick
    end
    object edtContact: TEdit
      Left = 89
      Top = 122
      Width = 373
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 1
    end
    object edtDescription: TMemo
      Left = 89
      Top = 149
      Width = 571
      Height = 45
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 255
      ScrollBars = ssVertical
      TabOrder = 3
      OnChange = edtDescriptionChange
    end
    object edtSupplierName: TEdit
      Left = 89
      Top = 8
      Width = 372
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 5
      OnChange = CheckOK
    end
    object edtStreet: TEdit
      Left = 89
      Top = 27
      Width = 372
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 6
    end
    object edtLocale: TEdit
      Left = 89
      Top = 47
      Width = 372
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 7
    end
    object edtTown: TEdit
      Left = 89
      Top = 68
      Width = 372
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 8
    end
    object edtPostcode: TEdit
      Left = 89
      Top = 91
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      ReadOnly = True
      TabOrder = 9
    end
    object edtCounty: TEdit
      Left = 228
      Top = 91
      Width = 234
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 10
    end
  end
  object pcDetails: TPageControl
    Left = 0
    Top = 233
    Width = 886
    Height = 180
    ActivePage = tbDetails
    Align = alClient
    TabOrder = 4
    object tbDetails: TTabSheet
      Caption = 'Details'
      object dbgLines: TStringGrid
        Left = 0
        Top = 0
        Width = 793
        Height = 152
        Align = alClient
        ColCount = 10
        DefaultColWidth = 40
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        PopupMenu = pmnLines
        TabOrder = 0
        OnDblClick = dbgLinesDblClick
        ColWidths = (
          40
          243
          163
          105
          58
          88
          89
          92
          87
          83)
      end
      object pnlFunctions: TPanel
        Left = 793
        Top = 0
        Width = 85
        Height = 152
        Align = alRight
        TabOrder = 1
        object btnAdd: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Add Sl&abs'
          TabOrder = 0
          OnClick = btnAddClick
        end
        object btnChange: TBitBtn
          Left = 8
          Top = 104
          Width = 75
          Height = 25
          Caption = 'Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeClick
        end
        object btnDelete: TBitBtn
          Left = 8
          Top = 136
          Width = 75
          Height = 25
          Caption = 'Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteClick
        end
        object btnProducts: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Products'
          TabOrder = 3
          OnClick = btnProductsClick
        end
        object btnInsert: TBitBtn
          Left = 10
          Top = 72
          Width = 75
          Height = 25
          Caption = '&Insert Multi'
          TabOrder = 4
          OnClick = btnInsertClick
        end
      end
    end
    object tbEvents: TTabSheet
      Caption = 'Events'
      ImageIndex = 4
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 305
        Height = 152
        Align = alLeft
        TabOrder = 0
        object sgEvents: TStringGrid
          Left = 1
          Top = 1
          Width = 303
          Height = 150
          Align = alClient
          ColCount = 3
          DefaultColWidth = 40
          DefaultRowHeight = 20
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          TabOrder = 0
          OnClick = sgEventsClick
          OnDblClick = sgEventsDblClick
          ColWidths = (
            40
            107
            126)
        end
      end
      object Panel18: TPanel
        Left = 305
        Top = 0
        Width = 132
        Height = 152
        Align = alClient
        TabOrder = 1
        object btnAddEvents: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          TabOrder = 0
          OnClick = btnAddEventsClick
        end
        object btnChangeEvents: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeEventsClick
        end
        object btnDeleteEvents: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteEventsClick
        end
      end
      object Panel8: TPanel
        Left = 437
        Top = 0
        Width = 441
        Height = 152
        Align = alRight
        TabOrder = 2
        object memEventNotes: TMemo
          Left = 1
          Top = 1
          Width = 439
          Height = 150
          Align = alClient
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Notes'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 505
        Height = 152
        Align = alLeft
        TabOrder = 0
        object memNotes: TMemo
          Left = 1
          Top = 1
          Width = 503
          Height = 150
          Align = alClient
          Lines.Strings = (
            'memNotes')
          TabOrder = 0
        end
      end
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 413
    Width = 886
    Height = 128
    Align = alBottom
    TabOrder = 5
    object Panel5: TPanel
      Left = 719
      Top = 1
      Width = 166
      Height = 126
      Align = alRight
      Anchors = [akRight, akBottom]
      BevelOuter = bvLowered
      TabOrder = 0
      DesignSize = (
        166
        126)
      object Label4: TLabel
        Left = 11
        Top = 16
        Width = 31
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Goods'
      end
      object Label5: TLabel
        Left = 11
        Top = 43
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'VAT'
        Visible = False
      end
      object Label8: TLabel
        Left = 11
        Top = 72
        Width = 24
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Total'
        Visible = False
      end
      object memGoods: TMemo
        Left = 61
        Top = 11
        Width = 89
        Height = 23
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 0
      end
      object memVAT: TMemo
        Left = 61
        Top = 38
        Width = 89
        Height = 23
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 1
        Visible = False
      end
      object memTotal: TMemo
        Left = 61
        Top = 67
        Width = 89
        Height = 23
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 2
        Visible = False
      end
    end
    object pnlFooterLeft: TPanel
      Left = 1
      Top = 1
      Width = 128
      Height = 126
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object rdgrpDelivery: TRadioGroup
        Left = 13
        Top = 8
        Width = 105
        Height = 65
        Caption = 'Delivery To: '
        ItemIndex = 0
        Items.Strings = (
          'Here'
          'Other Address')
        TabOrder = 0
        OnClick = rdgrpDeliveryClick
      end
    end
    object pnlFooterAddress: TPanel
      Left = 129
      Top = 1
      Width = 432
      Height = 126
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      DesignSize = (
        432
        126)
      object Label6: TLabel
        Left = 17
        Top = 12
        Width = 28
        Height = 13
        Caption = 'Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 17
        Top = 34
        Width = 28
        Height = 13
        Caption = 'Street'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 17
        Top = 80
        Width = 49
        Height = 13
        Caption = 'Town/City'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 17
        Top = 103
        Width = 45
        Height = 13
        Caption = 'Postcode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 184
        Top = 103
        Width = 33
        Height = 13
        Caption = 'County'
      end
      object edtdelPostcode: TEdit
        Left = 81
        Top = 99
        Width = 81
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 5
      end
      object edtDelCounty: TEdit
        Left = 234
        Top = 99
        Width = 147
        Height = 21
        TabOrder = 6
      end
      object edtDelName: TEdit
        Left = 81
        Top = 8
        Width = 300
        Height = 21
        TabOrder = 0
        OnChange = CheckOK
      end
      object edtDelStreet: TEdit
        Left = 81
        Top = 30
        Width = 300
        Height = 21
        TabOrder = 2
      end
      object edtDelLocale: TEdit
        Left = 81
        Top = 53
        Width = 300
        Height = 21
        TabOrder = 3
      end
      object edtDelTown: TEdit
        Left = 81
        Top = 76
        Width = 300
        Height = 21
        TabOrder = 4
      end
      object BitBtn1: TBitBtn
        Left = 391
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Select Address'
        Anchors = [akTop, akRight]
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
  end
  object pmnLines: TPopupMenu
    OnPopup = pmnLinesPopup
    Left = 344
    Top = 233
    object mnAddLine: TMenuItem
      Caption = 'Sl&abs'
      ShortCut = 16449
      OnClick = mnAddLineClick
    end
    object Products1: TMenuItem
      Caption = '&Products'
      ShortCut = 16464
      OnClick = btnProductsClick
    end
    object mnChangeLine: TMenuItem
      Caption = '&Change'
      ShortCut = 16451
      OnClick = btnChangeClick
    end
    object mnDeleteLine: TMenuItem
      Caption = '&Delete'
      ShortCut = 16452
      OnClick = mnDeleteLineClick
    end
  end
  object pmnDummy: TPopupMenu
    Left = 616
    Top = 104
  end
end
