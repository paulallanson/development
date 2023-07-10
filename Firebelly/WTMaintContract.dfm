object frmWTMaintContract: TfrmWTMaintContract
  Left = 237
  Top = 19
  Width = 1000
  Height = 755
  Caption = 'Maintain Contract Quotes'
  Color = clBtnFace
  Constraints.MinHeight = 550
  Constraints.MinWidth = 1000
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 992
    Height = 36
    Align = alTop
    TabOrder = 0
    DesignSize = (
      992
      36)
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 82
      Height = 13
      Caption = 'Quote Number'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 224
      Top = 12
      Width = 71
      Height = 13
      Caption = 'Date Raised'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 731
      Top = 12
      Width = 83
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Office Contact'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblExpiryDate: TLabel
      Left = 440
      Top = 12
      Width = 42
      Height = 13
      Caption = 'Expires'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton4: TSpeedButton
      Left = 626
      Top = 6
      Width = 25
      Height = 25
      Hint = 'Clear Expiry Date'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
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
      ParentFont = False
      OnClick = SpeedButton4Click
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
      Left = 827
      Top = 8
      Width = 145
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Operator'
      ListField = 'Operator_Name'
      ListSource = dtmdlSalesOrder.dtsOperator
      TabOrder = 2
    end
    object dtpckDate: TDateTimePicker
      Left = 304
      Top = 8
      Width = 89
      Height = 21
      Date = 37882.000000000000000000
      Time = 37882.000000000000000000
      TabOrder = 1
    end
    object edtExpiryDate: TEdit
      Left = 491
      Top = 8
      Width = 89
      Height = 21
      TabOrder = 3
      OnExit = edtExpiryDateExit
    end
    object btnExpiryDate: TBitBtn
      Left = 587
      Top = 6
      Width = 25
      Height = 25
      TabOrder = 4
      OnClick = btnExpiryDateClick
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
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 705
    Width = 992
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
    Top = 664
    Width = 992
    Height = 41
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      992
      41)
    object lblDeleteprompt: TLabel
      Left = 668
      Top = 12
      Width = 132
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = 'Delete this Contract?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 488
      Top = 14
      Width = 89
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Total Quote Value:'
    end
    object Label10: TLabel
      Left = 208
      Top = 14
      Width = 98
      Height = 13
      Caption = 'Lowest Price Option:'
    end
    object btnOK: TBitBtn
      Left = 812
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Enabled = False
      TabOrder = 0
      OnClick = btnOKClick
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
    end
    object BitBtn2: TBitBtn
      Left = 900
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Kind = bkCancel
    end
    object chkbxInactive: TCheckBox
      Left = 8
      Top = 12
      Width = 161
      Height = 17
      Caption = 'Contract Quote is Inactive'
      TabOrder = 2
    end
    object btnSave: TBitBtn
      Left = 724
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Save'
      Default = True
      Enabled = False
      TabOrder = 3
      OnClick = btnSaveClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
    end
    object edtQuoteValue: TMemo
      Left = 584
      Top = 10
      Width = 79
      Height = 21
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Color = cl3DLight
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 4
      WantReturns = False
      WordWrap = False
    end
    object cmbOptions: TComboBox
      Left = 320
      Top = 10
      Width = 161
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = cmbOptionsClick
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 36
    Width = 992
    Height = 199
    Align = alTop
    Anchors = [akRight, akBottom]
    TabOrder = 3
    DesignSize = (
      992
      199)
    object Label16: TLabel
      Left = 16
      Top = 11
      Width = 53
      Height = 13
      Caption = 'Customer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 90
      Width = 59
      Height = 13
      Caption = 'Developer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 117
      Width = 50
      Height = 13
      Caption = 'Location'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 176
      Width = 65
      Height = 13
      Caption = 'Description'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 36
      Width = 45
      Height = 13
      Caption = 'Contact'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnContactClear: TSpeedButton
      Left = 616
      Top = 31
      Width = 23
      Height = 22
      Anchors = [akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
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
      ParentFont = False
      OnClick = btnContactClearClick
    end
    object Label13: TLabel
      Left = 16
      Top = 149
      Width = 58
      Height = 13
      Caption = 'Site Contact'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label14: TLabel
      Left = 400
      Top = 149
      Width = 58
      Height = 13
      Caption = 'Site Number'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btnCustomer: TBitBtn
      Left = 704
      Top = 6
      Width = 22
      Height = 22
      Hint = 'Select Customer'
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
      OnClick = btnCustomerClick
    end
    object edtCustomerName: TEdit
      Left = 104
      Top = 7
      Width = 593
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 0
      OnClick = edtCustomerNameClick
    end
    object edtDeveloper: TEdit
      Left = 104
      Top = 86
      Width = 865
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      OnChange = edtDeveloperChange
    end
    object edtLocation: TEdit
      Left = 104
      Top = 115
      Width = 865
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      OnChange = edtLocationChange
    end
    object edtDescription: TEdit
      Left = 104
      Top = 172
      Width = 865
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      OnChange = edtDescriptionChange
    end
    object btnContactSearch: TBitBtn
      Left = 581
      Top = 31
      Width = 22
      Height = 22
      Hint = 'Search for Customer'
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnContactSearchClick
      NumGlyphs = 2
    end
    object edtContact: TEdit
      Left = 104
      Top = 32
      Width = 465
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnChange = edtContactChange
    end
    object edtSiteContact: TEdit
      Left = 104
      Top = 145
      Width = 265
      Height = 21
      TabOrder = 7
      OnChange = edtSiteContactChange
    end
    object edtSitePhone: TEdit
      Left = 472
      Top = 145
      Width = 265
      Height = 21
      TabOrder = 8
      OnChange = edtSitePhoneChange
    end
    object pnlRevenueCentre: TPanel
      Left = 1
      Top = 56
      Width = 990
      Height = 26
      BevelOuter = bvNone
      TabOrder = 4
      object Label59: TLabel
        Left = 15
        Top = 8
        Width = 78
        Height = 13
        Caption = 'Revenue Centre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 315
        Top = 3
        Width = 23
        Height = 22
        Hint = 'Clear Revenue Centre'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
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
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object dblkpRevenueCentre: TDBLookupComboBox
        Left = 103
        Top = 4
        Width = 201
        Height = 21
        KeyField = 'Revenue_Centre'
        ListField = 'Revenue_Centre_Descr'
        TabOrder = 0
        OnClick = dblkpRevenueCentreClick
      end
    end
  end
  object pcDetails: TPageControl
    Left = 0
    Top = 235
    Width = 992
    Height = 429
    ActivePage = tsQuotes
    Align = alClient
    TabOrder = 4
    object tsQuotes: TTabSheet
      Caption = 'Quotes'
      object sgDetails: TStringGrid
        Left = 0
        Top = 0
        Width = 984
        Height = 233
        Align = alClient
        ColCount = 2
        DefaultColWidth = 40
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
        PopupMenu = pmnLines
        TabOrder = 0
        OnDblClick = mnuChangeQuoteClick
        OnDrawCell = sgDetailsDrawCell
        OnKeyUp = sgDetailsKeyUp
        OnSelectCell = sgDetailsSelectCell
        ColWidths = (
          40
          118)
      end
      object pnlDrawings: TPanel
        Left = 0
        Top = 287
        Width = 984
        Height = 114
        Align = alBottom
        TabOrder = 1
        object lstvwLineDocuments: TListView
          Left = 1
          Top = 1
          Width = 886
          Height = 79
          Align = alClient
          Columns = <
            item
              Caption = 'Name'
              Width = 200
            end
            item
              Caption = 'Type'
              Width = 200
            end
            item
              Caption = 'Date modified'
              Width = 200
            end>
          LargeImages = imgDocuments
          ReadOnly = True
          RowSelect = True
          PopupMenu = pmnuLineDocuments
          SmallImages = imgDocuments
          TabOrder = 0
          OnDblClick = lstvwLineDocumentsDblClick
        end
        object Panel3: TPanel
          Left = 1
          Top = 80
          Width = 982
          Height = 33
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Label8: TLabel
            Left = 11
            Top = 10
            Width = 91
            Height = 13
            Caption = 'Supplier Reference'
          end
          object Label11: TLabel
            Left = 467
            Top = 10
            Width = 76
            Height = 13
            Caption = 'Number of Units'
          end
          object edtSupplierReference: TEdit
            Left = 115
            Top = 6
            Width = 305
            Height = 21
            TabOrder = 0
            Text = 'edtSupplierReference'
            OnChange = edtSupplierReferenceChange
          end
          object memUnits: TMemo
            Left = 560
            Top = 6
            Width = 81
            Height = 21
            Lines.Strings = (
              'memUnits')
            TabOrder = 1
            OnChange = memUnitsChange
            OnEnter = memUnitsEnter
            OnExit = memUnitsExit
          end
        end
        object Panel5: TPanel
          Left = 887
          Top = 1
          Width = 96
          Height = 79
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 2
          object btnLineAttach: TBitBtn
            Left = 13
            Top = 9
            Width = 75
            Height = 25
            Caption = 'Attach'
            TabOrder = 0
            OnClick = btnLineAttachClick
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FBFB
              FB00F5F5F500F2F2F200EEEEEE00EEEEEE00E7E7E700E7E7E700E7E7E700E8E8
              E800EEEEEE00EEEEEE00F5F5F500F9F9F900FDFDFD00FF00FF00ECECEC00DBDB
              DB00D1D1D100C9CBCE00B8B3A800BCBCBD00BEBEC000BDBDBD00BDBDBD00BDBD
              BD00BDBDBD00C7C7C700CBCBCB00D4D4D400E3E3E300FCFCFC00FF00FF00FF00
              FF00F1ECE0009E792400E2D7BD00AA8B4200B2945000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FEFD
              FC00AF904B00FF00FF00FF00FF00FF00FF00B5995900BCA36900FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A580
              3000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B2924C00CBB58500FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B28D
              3E00FF00FF00FF00FF00FF00FF00C7AE7900AC863500D0BA8C00B18E4200D8C7
              A100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F2EA
              D900AF873700FF00FF00F5EFE300DECFAE00FF00FF00B8944A00D8C49D00B28B
              3C00E4D7BB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00E8D9B800B8934700F9F6F000B58E3E00FF00FF00FF00FF00B8924400E3D5
              B700B68F3E00EDE4D100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00E4D1A700C19E5700EBDDBD00BD984C00FF00FF00FF00FF00BB94
              4300EDE2CE00BB944300F5EFE200FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00E2CC9C00CBAB6A00E8D6AF00C5A25C00FF00FF00FF00
              FF00C0984800F4EEE100C0984800FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00E3CA9400D6B87F00E7D3A500D0AE6D00FF00
              FF00FF00FF00C69D4D00F8F3EA00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00E2C68900DFC69600E7D09B00D8B8
              7D00FF00FF00FF00FF00CCA15100FCF9F400FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E3C38200E8D3AC00FCF8
              ED00FF00FF00FF00FF00FF00FF00D1A65600FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E1BF7900EFDE
              C100FF00FF00FF00FF00FF00FF00EDD7B000FDFAF500FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E4BE
              7500F5E9D400FF00FF00FF00FF00DAAD5C00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00E4BF7800DBAD5F00E4BD7400FF00FF00FF00FF00FF00FF00}
          end
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 268
        Width = 984
        Height = 19
        Align = alBottom
        Alignment = taLeftJustify
        Caption = ' Drawing Details'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object pnlPriceChange: TPanel
        Left = 0
        Top = 233
        Width = 984
        Height = 35
        Align = alBottom
        TabOrder = 3
        object Label12: TLabel
          Left = 5
          Top = 12
          Width = 135
          Height = 13
          Caption = 'Selected Cell Markup %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtMarkup: TCREditFloat
          Left = 152
          Top = 8
          Width = 65
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = 'edtMarkup'
        end
      end
    end
    object tsDocuments: TTabSheet
      Caption = 'Documents/Notes'
      ImageIndex = 1
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 984
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          984
          17)
        object Label44: TLabel
          Left = 2
          Top = 4
          Width = 54
          Height = 13
          Caption = 'Documents'
        end
        object lblNotes: TLabel
          Left = 599
          Top = 0
          Width = 28
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Notes'
        end
      end
      object lstvwDocuments: TListView
        Left = 0
        Top = 17
        Width = 552
        Height = 384
        Align = alClient
        Columns = <
          item
            Caption = 'Name'
            Width = 200
          end
          item
            Caption = 'Type'
            Width = 200
          end
          item
            Caption = 'Date modified'
            Width = 200
          end>
        LargeImages = imgDocuments
        RowSelect = True
        PopupMenu = pmnuDocuments
        SmallImages = imgDocuments
        TabOrder = 1
        OnColumnClick = lstvwDocumentsColumnClick
        OnCompare = lstvwDocumentsCompare
        OnDblClick = lstvwDocumentsDblClick
      end
      object Panel1: TPanel
        Left = 583
        Top = 17
        Width = 16
        Height = 384
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
      end
      object ToolBar1: TToolBar
        Left = 552
        Top = 17
        Width = 31
        Height = 384
        Align = alRight
        ButtonHeight = 30
        ButtonWidth = 30
        Caption = 'ToolBar1'
        HotImages = imgIcons
        Images = imgIcons
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        object btnExcel: TToolButton
          Left = 0
          Top = 2
          Hint = 'Excel'
          Caption = 'btnExcel'
          ImageIndex = 0
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = btnWordClick
        end
        object btnWord: TToolButton
          Left = 0
          Top = 32
          Hint = 'Word'
          Caption = 'btnWord'
          ImageIndex = 1
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = btnWordClick
        end
        object btnEmail: TToolButton
          Left = 0
          Top = 62
          Hint = 'Email'
          Caption = 'btnEmail'
          ImageIndex = 2
          ParentShowHint = False
          Wrap = True
          ShowHint = True
          OnClick = btnEmailClick
        end
        object btnAttach: TToolButton
          Left = 0
          Top = 92
          Hint = 'Attach Documents'
          Caption = 'btnAttach'
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAttachClick
        end
      end
      object pnlNotes: TPanel
        Left = 599
        Top = 17
        Width = 385
        Height = 384
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 4
        object memNotes: TMemo
          Left = 0
          Top = 0
          Width = 350
          Height = 279
          Align = alClient
          TabOrder = 0
        end
        object Panel2: TPanel
          Left = 350
          Top = 0
          Width = 35
          Height = 279
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object bynSpecialInstructions: TBitBtn
            Left = 8
            Top = 2
            Width = 22
            Height = 22
            Caption = '...'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = bynSpecialInstructionsClick
          end
        end
      end
    end
    object tsEvents: TTabSheet
      Caption = 'Events'
      ImageIndex = 2
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 785
        Height = 17
        Align = alTop
        TabOrder = 0
      end
      object pnlEventFunc: TPanel
        Left = 323
        Top = 17
        Width = 93
        Height = 265
        Align = alRight
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
      object pnlEvents: TPanel
        Left = 416
        Top = 17
        Width = 369
        Height = 265
        Align = alRight
        Caption = 'pnlEvents'
        TabOrder = 2
        object memEventNotes: TMemo
          Left = 1
          Top = 1
          Width = 367
          Height = 263
          Align = alClient
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
      end
      object sgEvents: TStringGrid
        Left = 0
        Top = 17
        Width = 323
        Height = 265
        Align = alClient
        ColCount = 3
        DefaultColWidth = 40
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 3
        OnClick = sgEventsClick
        OnDblClick = sgEventsDblClick
        ColWidths = (
          40
          107
          126)
      end
    end
  end
  object imgIcons: TImageList
    Left = 512
    Top = 284
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00F5F5F500F2F2
      F200EEEEEE00EEEEEE00E7E7E700E7E7E700E7E7E700E8E8E800EEEEEE00EEEE
      EE00F5F5F500F9F9F900FDFDFD000000000000000000FDFDFD001C1C1C000312
      0700031206000311060003110500041104000410030004100200040F0200050F
      01000308010090909000000000000000000000000000FDFDFD001C1C1C00120E
      0000110D0100110D0100110D0100110D0200110C0200110C0200110C0300110B
      0300090602009090900000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ECECEC00DBDBDB00D1D1D100C9CB
      CE00B8B3A800BCBCBD00BEBEC000BDBDBD00BDBDBD00BDBDBD00BDBDBD00C7C7
      C700CBCBCB00D4D4D400E3E3E300FCFCFC0000000000031E0F001DD0630020CC
      5A0023C8510025C3480028BE3F002BBB36002DB72D0030B3240033AF1B0035AA
      130038A70B0037990200A7A7A70000000000000000001D170200C59E0100C39B
      0400C2980800C0950C00BF921000BD8E1300BC8B1700BB881C00B9852000B881
      2400B77E2800AA742900A7A7A700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F1ECE0009E79
      2400E2D7BD00AA8B4200B2945000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000014AF5E001BD36A00FAFC
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0086CB6E0038A70B001E1E1E000000000000000000A5891800C8A20F00FDFB
      F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D3B17D00B77E28001E1E1E00000000000C0C0C000071B6000077BF000077
      BF000077BF000077BF000077BF000077BF000077BF000077BF000077BF000077
      BF000077BF000077BF0000355500D4D4D40000000000FEFDFC00AF904B000000
      00000000000000000000B5995900BCA369000000000000000000000000000000
      0000000000000000000000000000000000000000000012B567001BD36A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8FCF300E8FCF300FAFE
      FC00E3F4E10035AA13001C1C1C000000000000000000AA8F2600C9A41F00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F5EEE100B88124001C1C1C000000000000659A0000A7FF0000A7FF0000A7
      FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7
      FF0000A7FF0000A7FF0000A7FF002323230000000000A5803000000000000000
      0000000000000000000000000000B2924C00CBB5850000000000000000000000
      000000000000000000000000000000000000000000000FB96E0018D77400FFFF
      FF004EE8A50025E3910038E59A00FFFFFF0041E69E0013E1870025E39100FFFF
      FF00E2F6E40033AF1B001C1C1C000000000000000000AD933400CCA92C00FFFF
      FF00FFFFFF00DCC46500E7D89800F4EDD100DCC46500FEFEFD00FFFFFF00FFFF
      FF00F6EFDF00B98520001C1C1C0000000000006A9F0000ACFB0000AFFF0000AF
      FF0000AFFF0000AFFF0000AFFF000077CE000096EA0000AFFF0000AFFF0000AF
      FF0000AFFF0000AFFF0000A6FA002020200000000000B28D3E00000000000000
      000000000000C7AE7900AC863500D0BA8C00B18E4200D8C7A100000000000000
      000000000000000000000000000000000000000000000EBC760015DC7E00FFFF
      FF00FFFFFF0018E18A0013DF850042E4990015DD800014DF8400FEFFFE00FFFF
      FF00E1F7E70030B324001C1C1C000000000000000000AF974200CFAE3A00FFFF
      FF00FFFFFF00D9BF5F00D9BF5F00F3EBCF00D9BF5F00E0CA7C00FFFFFF00FFFF
      FF00F6F0DE00BB881C001C1C1C0000000000006E9F0000B0FF0000B4F90000B8
      FF0000B8FF0000B8FF00009BCD0000EBFF0000EDFD00008FE00000B8FF0000B8
      FF0000B8FF0000A6F40000B0FF002020200000000000F2EAD900AF8737000000
      0000F5EFE300DECFAE0000000000B8944A00D8C49D00B28B3C00E4D7BB000000
      000000000000000000000000000000000000000000000CBF7D0013E18900FFFF
      FF00FFFFFF00FEFEFE0016DC7D0017D9770018D87400E5FBF000FFFFFF00FFFF
      FF00E1F8E9002DB72D001C1C1C000000000000000000B29B5000D2B44700FFFF
      FF00FFFFFF00D3B45700D3B45700D3B45800D3B45700D3B45700FEFEFD00FFFF
      FF00F7F1DD00BC8B17001C1C1C000000000000729F0000B7FF0000B7FF0000BC
      F80000C0FF00008CC40000E2FF0000E2FF0000E2FF0000E3FE0000ACF20000C0
      FF0000A5EA0000B7FF0000B7FF00202020000000000000000000E8D9B800B893
      4700F9F6F000B58E3E000000000000000000B8924400E3D5B700B68F3E00EDE4
      D10000000000000000000000000000000000000000000AC2840010E69300FFFF
      FF00FFFFFF00FFFFFF0021CA55001CD267001FCE5E00E7F9EC00FFFFFF00FFFF
      FF00E0F9EC002BBB36001C1C1C000000000000000000B49F5E00D6B95800FFFF
      FF00FFFFFF00CBA34B00E0C99600CBA34B00CBA34B00D4B36C00D4B36C00FFFF
      FF00F7F3DF00BD8E13001C1C1C000000000000779F0000BEFF0000BEFF0000BE
      FE000086BE0000D9FF0000D9FF0000D9FF0000D9FF0000D9FF0000D8FC00009A
      DA0000BEFF0000BEFF0000BEFF0020202000000000000000000000000000E4D1
      A700C19E5700EBDDBD00BD984C000000000000000000BB944300EDE2CE00BB94
      4300F5EFE2000000000000000000000000000000000007C68C000CEA9E00FFFF
      FF00FFFFFF0051C4540028BE3D0035C9590025C2470029BC3A00FDFEFD00FFFF
      FF00DFFAEF0028BE3F001C1C1C000000000000000000B7A46B00D9BF6B00FFFF
      FF00E7D4B700BE8C3C00F2E7D800BE8C3C00BE8C3C00EBDCC400BE8C3C00E4D0
      AF00F8F4E400BF9210001C1C1C0000000000007E9F0000CAFF0000CAFF000091
      CA0000D0FF0000D0FF0000D0FF0000D0FF0000D0FF0000D0FF0000D0FF0000CC
      FA0000CAFE0000CAFF0000CAFF00202020000000000000000000000000000000
      0000E2CC9C00CBAB6A00E8D6AF00C5A25C000000000000000000C0984800F4EE
      E100C09848000000000000000000000000000000000005C993000AEFA800FFFF
      FF00BCE0AA003EAF1F003AB52D00FFFFFF008FD88F003BB3280041AC1A00FFFF
      FF00DEFCF10025C348001C1C1C000000000000000000B9A97900DDC67E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F9F6E900C0950C001C1C1C000000000000849F0000D4FF0000ADDD0000C6
      FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6
      FF0000C0F80000D4FF0000D4FF00202020000000000000000000000000000000
      000000000000E3CA9400D6B87F00E7D3A500D0AE6D000000000000000000C69D
      4D00F8F3EA000000000000000000000000000000000003CC9A0006F4B300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDFDF40023C851001C1C1C000000000000000000BCAD8700E0CC9200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FAF7EE00C29808001C1C1C0000000000008B9F0000CAEE0000BDFF0000BD
      FF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BD
      FF0000BDFF0000BAF80000DFFF00202020000000000000000000000000000000
      00000000000000000000E2C68900DFC69600E7D09B00D8B87D00000000000000
      0000CCA15100FCF9F40000000000000000000000000002CE9E0004F8BC00C0FD
      ED00D3FDF200D4FCF100D4FCEF00D4FBEE00D4FBED00D5FAEC00D5FAEB00D5F9
      EA0048DE8C0020CC5A001C1C1C000000000000000000BDAE9000E4D1A400F7F3
      E600F9F6EC00F9F5EA00F9F4E800F8F4E600F8F3E400F7F3E200F7F2E000F7F1
      DE00D4B74600C39B04001C1C1C0000000000008C9A0000B7FF0000B7FF0000B7
      FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7
      FF0000B7FF0000B7FF0000BFFA00202020000000000000000000000000000000
      0000000000000000000000000000E3C38200E8D3AC00FCF8ED00000000000000
      000000000000D1A656000000000000000000000000001E6E160001FCC50004F8
      BC0006F4B30009F0AA000CECA1000EE8980011E48F0013E0860015DC7D0018D8
      74001BD46C001AD56F0044444400000000000000000076572D00E7D6B500E4D1
      A400E1CC9300DEC78300DAC17200D7BC6100D4B75100D1B24000CEAD2F00CBA8
      1F00C8A30F00C8A2230044444400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000202020000000000000000000000000000000
      000000000000000000000000000000000000E1BF7900EFDEC100000000000000
      000000000000EDD7B000FDFAF50000000000000000005C5C5C00278012002CB1
      2F0025B844001EBF590018C66E0012CD830014CA79001BC2640022BC4F0028B5
      3A002FAC2300091E0300FEFEFE0000000000000000005C5C5C0090693500C396
      5400CA9F6100CFA96E00D4B37B00D9BD8800D7B98200D1AE7400CBA36500C498
      5700BD8B470022180A00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4BE7500F5E9D4000000
      000000000000DAAD5C0000000000000000000000000000000000FDFDFD00D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700E0E0E0000000000000000000000000000000000000000000FDFDFD00D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700E0E0E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E4BF7800DBAD
      5F00E4BD7400000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF800180038003FFFF0000
      80018001FFFFC1FF8001800100009CFF800180010000BE7F800180010000B83F
      800180010000921F800180010000C30F800180010000E187800180010000F0C7
      800180010000F867800180010000FC33800180010000FE3B800180010000FF39
      80018001FFFFFF9BC007C007FFFFFFC700000000000000000000000000000000
      000000000000}
  end
  object imgDocuments: TImageList
    Left = 712
    Top = 308
  end
  object pmnLines: TPopupMenu
    OnPopup = pmnLinesPopup
    Left = 224
    Top = 321
    object mnuAddDrawing: TMenuItem
      Caption = '&Add Drawing'
      object mnuAddSingleDrawing: TMenuItem
        Caption = 'Single'
        OnClick = mnuAddSingleDrawingClick
      end
      object mnuAddMultipleDrawings: TMenuItem
        Caption = 'Multiple'
        OnClick = mnuAddMultipleDrawingsClick
      end
    end
    object mnuCopyDrawing: TMenuItem
      Caption = 'Copy Drawing'
      OnClick = mnuCopyDrawingClick
    end
    object mnuDeleteDrawing: TMenuItem
      Caption = '&Delete Drawing'
      OnClick = mnuDeleteDrawingClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuAddOption: TMenuItem
      Caption = 'Add Option'
      OnClick = mnuAddOptionClick
    end
    object mnuEditOption: TMenuItem
      Caption = 'Edit Option'
      OnClick = mnuEditOptionClick
    end
    object mnuDeleteOption: TMenuItem
      Caption = 'Delete Option'
      OnClick = mnuDeleteOptionClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnuInsertQuote: TMenuItem
      Caption = 'Create Quote'
      OnClick = mnuInsertQuoteClick
    end
    object mnuChangeQuote: TMenuItem
      Caption = 'Change Quote'
      OnClick = mnuChangeQuoteClick
    end
    object mnuReQuote: TMenuItem
      Caption = 'Requote this drawing'
      object NextOption1: TMenuItem
        Caption = 'For next Option'
        OnClick = NextOption1Click
      end
      object RemainingOptions1: TMenuItem
        Caption = 'For remaining Options'
        OnClick = RemainingOptions1Click
      end
    end
    object mnuDeleteQuote: TMenuItem
      Caption = 'Delete Quote'
      OnClick = mnuDeleteQuoteClick
    end
    object mnuLinkQuote: TMenuItem
      Caption = 'Link Quote'
      OnClick = mnuLinkQuoteClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object mnuPriceChange: TMenuItem
      Caption = 'Price Change'
      object mnuPriceChangeOption: TMenuItem
        Caption = 'This Column'
        OnClick = mnuPriceChangeOptionClick
      end
      object mnuPriceOptionDrawing: TMenuItem
        Caption = 'This Row'
        OnClick = mnuPriceOptionDrawingClick
      end
      object mnuPriceOptionAll: TMenuItem
        Caption = 'This Contract'
        OnClick = mnuPriceOptionAllClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuPriceOptionUndo: TMenuItem
        Caption = 'Undo All'
        OnClick = mnuPriceOptionUndoClick
      end
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnuCreateOrder: TMenuItem
      Caption = 'Create Order'
      OnClick = mnuCreateOrderClick
    end
    object mnuAddToOrder: TMenuItem
      Caption = 'Add to Order'
      OnClick = mnuAddToOrderClick
    end
  end
  object pmnDummy: TPopupMenu
    Left = 760
    Top = 168
  end
  object svDlgOfficeDoc: TSaveDialog
    Left = 217
    Top = 86
  end
  object DocOpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofAllowMultiSelect, ofEnableSizing]
    Left = 504
    Top = 104
  end
  object pmnuLineDocuments: TPopupMenu
    Left = 556
    Top = 393
    object pmnuOpenLineDocument: TMenuItem
      Caption = 'Open'
      OnClick = pmnuOpenLineDocumentClick
    end
    object Paste1: TMenuItem
      Caption = 'Paste'
      OnClick = Paste1Click
    end
    object MenuItem2: TMenuItem
      Caption = 'Delete'
      OnClick = MenuItem2Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object SelectAll1: TMenuItem
      Caption = 'Select All'
      OnClick = SelectAll1Click
    end
  end
  object taoWinControl1: TtaoWinControl
    Control = pcDetails
    Options = [coCopy, coDelete, coPaste, coSource, coSourceOleCopy, coSourceOleLink, coSourceVclCopy, coSourceVclMove, coTarget, coTargetOleCopy, coTargetVclCopy, coTargetVclMove, coTargetScroll, coTargetFeedback]
    OnSetDataPaste = taoWinControl1SetDataPaste
    OnSetDataTarget = taoWinControl1SetDataTarget
    OnUpdateAction = taoWinControl1UpdateAction
    Left = 287
    Top = 256
    object taoWinControl1In1: TtaoInFileContents
    end
    object taoWinControl1In2: TtaoInCells
      FormatName = 'TaoCells'
      PasteSpecialName = 'Cells'
      PasteSpecialResult = 'tabular cells'
      PasteSpecialFlags = [psfPasteOnly]
    end
    object taoWinControl1In3: TtaoInBiff8
    end
    object taoWinControl1In4: TtaoInBiff5
    end
    object taoWinControl1In5: TtaoInUnicodeText
    end
    object taoWinControl1In6: TtaoInText
    end
    object taoWinControl1In7: TtaoInHDrop
    end
    object taoWinControl1In8: TtaoInShellIDList
    end
    object taoWinControl1In9: TtaoInFileContentsW
    end
    object taoWinControl1In10: TtaoInOEMessage
    end
    object taoWinControl1In11: TtaoInURL
    end
    object taoWinControl1In12: TtaoInURLNetscape4
    end
    object taoWinControl1Out1: TtaoOutBiff8
      DisplayStyle = 'Biff8'
    end
    object taoWinControl1Out2: TtaoOutRtf
      DisplayStyle = 'Text'
    end
    object taoWinControl1Out3: TtaoOutUnicodeText
      DisplayStyle = 'Text'
    end
    object taoWinControl1Out4: TtaoOutText
      DisplayStyle = 'Text'
    end
    object taoWinControl1Out5: TtaoOutCells
      FormatName = 'TaoCells'
    end
    object taoWinControl1Out6: TtaoOutHDrop
    end
    object taoWinControl1Out7: TtaoOutFileNameMap
    end
    object taoWinControl1Out8: TtaoOutShellIDList
    end
    object taoWinControl1Out9: TtaoOutFileDescriptor
    end
    object taoWinControl1Out10: TtaoOutFileDescriptorW
    end
    object taoWinControl1Out11: TtaoOutFileContents
    end
    object taoWinControl1Out12: TtaoOutPreferredEffect
    end
    object taoWinControl1Out13: TtaoOutURL
      DisplayStyle = 'Text'
    end
    object taoWinControl1Out14: TtaoOutURLShortcut
      DisplayStyle = 'Text'
    end
    object taoWinControl1Out15: TtaoOutURLShortcutTitle
      DisplayStyle = 'Text'
    end
  end
  object pmnuDocuments: TPopupMenu
    OnPopup = pmnuDocumentsPopup
    Left = 366
    Top = 254
    object pmnuOpen: TMenuItem
      Caption = 'Open'
      OnClick = lstvwDocumentsDblClick
    end
    object pmnuPaste: TMenuItem
      Caption = 'Paste'
      OnClick = pmnuPasteClick
    end
    object pmnuDelete: TMenuItem
      Caption = 'Delete'
      OnClick = pmnuDeleteClick
    end
    object MenuItem1: TMenuItem
      Caption = '-'
    end
    object pmnuSelectAll: TMenuItem
      Caption = 'Select All'
      OnClick = pmnuSelectAllClick
    end
  end
  object taoWinControl2: TtaoWinControl
    Control = lstvwLineDocuments
    Formats.Default = (
      True
      True)
    Left = 324
    Top = 423
  end
end
