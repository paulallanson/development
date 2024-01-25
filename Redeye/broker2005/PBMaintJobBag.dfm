object PBMaintJobBagFrm: TPBMaintJobBagFrm
  Left = 142
  Top = 3
  Caption = 'Job Bag Details'
  ClientHeight = 706
  ClientWidth = 1058
  Color = clBtnFace
  Constraints.MinHeight = 580
  Constraints.MinWidth = 964
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 66
    Width = 1058
    Height = 143
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      1058
      143)
    object Label2: TLabel
      Left = 8
      Top = 10
      Width = 49
      Height = 13
      Caption = 'Customer'
    end
    object Label6: TLabel
      Left = 8
      Top = 37
      Width = 40
      Height = 13
      Caption = 'Contact'
    end
    object Label1: TLabel
      Left = 8
      Top = 118
      Width = 59
      Height = 13
      Caption = 'Description'
    end
    object Label7: TLabel
      Left = 745
      Top = 10
      Width = 102
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Customer Order Ref'
      ExplicitLeft = 763
    end
    object Label8: TLabel
      Left = 799
      Top = 37
      Width = 44
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Quantity'
      ExplicitLeft = 817
    end
    object Label9: TLabel
      Left = 8
      Top = 64
      Width = 20
      Height = 13
      Caption = 'Rep'
    end
    object Label11: TLabel
      Left = 684
      Top = 118
      Width = 110
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Descriptive Reference'
      ExplicitLeft = 702
    end
    object Label10: TLabel
      Left = 758
      Top = 64
      Width = 84
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'ON HOLD status'
      ExplicitLeft = 776
    end
    object edtCustomer: TEdit
      Left = 80
      Top = 6
      Width = 317
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 0
    end
    object btnCustomer: TBitBtn
      Left = 407
      Top = 4
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCustomerClick
    end
    object BitBtn4: TBitBtn
      Left = 280
      Top = 31
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn4Click
    end
    object edtDescription: TEdit
      Left = 80
      Top = 114
      Width = 541
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnChange = CheckOK
    end
    object dblkpCustomerContact: TDBLookupComboBox
      Left = 80
      Top = 33
      Width = 193
      Height = 21
      KeyField = 'Contact_no'
      ListField = 'Name'
      ListSource = dmJobBag.srcCustContact
      TabOrder = 4
      OnClick = dblkpCustomerContactClick
    end
    object edtCustOrderNo: TEdit
      Left = 848
      Top = 6
      Width = 152
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 9
      OnChange = edtCustOrderNoChange
    end
    object memQuantity: TMemo
      Left = 848
      Top = 32
      Width = 81
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 10
      OnChange = memQuantityChange
      OnEnter = memQuantityEnter
      OnExit = ValidateQty
      OnKeyPress = memQuantityKeyPress
    end
    object btnRep: TBitBtn
      Left = 280
      Top = 58
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnRepClick
    end
    object edtDescriptiveRef: TEdit
      Left = 812
      Top = 114
      Width = 193
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 8
      OnChange = CheckOK
    end
    object edtRep: TEdit
      Left = 80
      Top = 60
      Width = 193
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object cmbOnHold: TComboBox
      Left = 848
      Top = 60
      Width = 128
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      TabOrder = 11
      Items.Strings = (
        'Job ON HOLD'
        'Postage Pay Reqd')
    end
    object BitBtn3: TBitBtn
      Left = 980
      Top = 58
      Width = 23
      Height = 24
      Hint = 'Take off hold'
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = BitBtn3Click
    end
    object pnlCostCentre: TPanel
      Left = 436
      Top = 2
      Width = 290
      Height = 29
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 6
      Visible = False
      object Label35: TLabel
        Left = 8
        Top = 8
        Width = 60
        Height = 13
        Caption = 'Cost Centre'
      end
      object edtCostCentre: TEdit
        Left = 72
        Top = 4
        Width = 177
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnCostCentre: TBitBtn
        Left = 256
        Top = 2
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCostCentreClick
      end
    end
    object chkbxCashSale: TCheckBox
      Left = 336
      Top = 35
      Width = 77
      Height = 17
      Caption = 'Cash Sale'
      TabOrder = 13
    end
    object pnlSubReps: TPanel
      Left = -17
      Top = 83
      Width = 330
      Height = 27
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 14
      object Label52: TLabel
        Left = 24
        Top = 8
        Width = 43
        Height = 13
        Caption = 'Sub Rep'
      end
      object edtSubRep: TEdit
        Left = 97
        Top = 4
        Width = 193
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnSubRep: TBitBtn
        Left = 297
        Top = 2
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnSubRepClick
      end
    end
  end
  object pgDetails: TPageControl
    Left = 0
    Top = 232
    Width = 1058
    Height = 202
    ActivePage = tsOrders
    Align = alClient
    TabOrder = 2
    object tsOrders: TTabSheet
      Caption = 'Charges'
      object pnlCharges: TPanel
        Left = 965
        Top = 0
        Width = 85
        Height = 174
        Align = alRight
        ParentBackground = False
        TabOrder = 0
        object btnAddPO: TBitBtn
          Left = 4
          Top = 7
          Width = 75
          Height = 25
          Hint = 'Insert an existing purchase order'
          Caption = '&Insert'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
            555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
            05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
            FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
            FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
            FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
            05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
            555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
            9055575757575757775505050505055505557575757575557555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnAddPOClick
        end
        object btnNew: TBitBtn
          Left = 4
          Top = 35
          Width = 75
          Height = 25
          Hint = 'Create a new purchase order'
          Caption = '&New'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
            0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
            33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnNewClick
        end
        object btnChange: TBitBtn
          Left = 4
          Top = 64
          Width = 75
          Height = 25
          Hint = 'Change the selected job bag item'
          Caption = '&Change'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnChangeClick
        end
        object btnProduction: TBitBtn
          Left = 4
          Top = 121
          Width = 75
          Height = 25
          Hint = 'Maintain Production Costs'
          Caption = '&Costs'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00370777033333
            3330337F3F7F33333F3787070003333707303F737773333373F7007703333330
            700077337F3333373777887007333337007733F773F333337733700070333333
            077037773733333F7F37703707333300080737F373333377737F003333333307
            78087733FFF3337FFF7F33300033330008073F3777F33F777F73073070370733
            078073F7F7FF73F37FF7700070007037007837773777F73377FF007777700730
            70007733FFF77F37377707700077033707307F37773F7FFF7337080777070003
            3330737F3F7F777F333778080707770333333F7F737F3F7F3333080787070003
            33337F73FF737773333307800077033333337337773373333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnProductionClick
        end
        object btnExtras: TBitBtn
          Left = 4
          Top = 92
          Width = 75
          Height = 25
          Hint = 'Add DMS charges'
          Caption = 'DMS'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
            55555575555555775F55509999999901055557F55555557F75F5001111111101
            105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
            01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
            0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
            0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
            0005555555575FF7777555555555000555555555555577755555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = btnExtrasClick
        end
        object btnAdd: TBitBtn
          Left = 4
          Top = 150
          Width = 75
          Height = 25
          Hint = 'Add a new sundry item'
          Caption = 'Sundries'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00550000000005
            555555777777777FF5555500000000805555557777777777FF555550BBBBB008
            05555557F5FFF7777FF55550B000B030805555F7F777F7F777F550000000B033
            005557777777F7F5775550BBBBB00033055557F5FFF777F57F5550B000B08033
            055557F77757F7F57F5550BBBBB08033055557F55557F7F57F5550BBBBB00033
            055557FFFFF777F57F5550000000703305555777777757F57F555550FFF77033
            05555557FFFFF7FF7F55550000000003055555777777777F7F55550777777700
            05555575FF5555777F55555003B3B3B00555555775FF55577FF55555500B3B3B
            005555555775FFFF77F555555570000000555555555777777755}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = btnAddClick
        end
        object btnDelete: TBitBtn
          Left = 4
          Top = 178
          Width = 75
          Height = 25
          Hint = 'Delete the selected job bag item'
          Caption = '&Delete'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
            3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
            333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
            03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
            33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
            0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
            3333333337FFF7F3333333333000003333333333377777333333}
          NumGlyphs = 2
          TabOrder = 6
        end
      end
      object sgLines: TStringGrid
        Left = 0
        Top = 0
        Width = 965
        Height = 174
        Align = alClient
        ColCount = 10
        DefaultColWidth = 40
        DefaultRowHeight = 18
        RowCount = 4
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowMoving, goRowSelect]
        TabOrder = 1
        OnContextPopup = sgLinesContextPopup
        OnDblClick = sgLinesDblClick
        OnDrawCell = sgLinesDrawCell
        OnMouseDown = sgLinesMouseDown
        OnMouseUp = sgLinesMouseUp
        OnRowMoved = sgLinesRowMoved
        OnTopLeftChanged = sgLinesTopLeftChanged
        ColWidths = (
          40
          96
          212
          62
          65
          65
          73
          180
          82
          283)
      end
      object chkbxLineReadyToInvoice: TCheckBox
        Left = 528
        Top = 144
        Width = 17
        Height = 17
        Caption = 'chkbxLineReadyToInvoice'
        Color = clCaptionText
        ParentColor = False
        TabOrder = 2
        Visible = False
        OnClick = chkbxLineReadyToInvoiceClick
      end
    end
    object tsRequests: TTabSheet
      Caption = 'Stock Requests'
      ImageIndex = 6
      object sgRequests: TStringGrid
        Left = 0
        Top = 0
        Width = 965
        Height = 174
        Align = alClient
        ColCount = 9
        DefaultColWidth = 40
        DefaultRowHeight = 18
        RowCount = 4
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        PopupMenu = pmnRequests
        TabOrder = 0
        OnDblClick = sgRequestsDblClick
        OnDrawCell = sgRequestsDrawCell
        ExplicitWidth = 961
        ExplicitHeight = 173
        ColWidths = (
          40
          63
          65
          128
          199
          80
          82
          76
          178)
      end
      object pnlRequests: TPanel
        Left = 965
        Top = 0
        Width = 85
        Height = 174
        Align = alRight
        ParentBackground = False
        TabOrder = 1
        ExplicitLeft = 961
        ExplicitHeight = 173
        object btnAddRequest: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Hint = 'Add a new Works Instruction to this Job Bag'
          Caption = '&Add'
          TabOrder = 0
          OnClick = btnAddRequestClick
        end
        object btnChangeRequest: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Hint = 'Change the selected Works Instruction'
          Caption = '&Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeRequestClick
        end
        object btnDeleteRequest: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Hint = 'Delete the selected Works Instruction from this Job Bag'
          Caption = '&Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteRequestClick
        end
        object btnChargeRequest: TBitBtn
          Left = 8
          Top = 160
          Width = 75
          Height = 25
          Hint = 'Change the selected Works Instruction'
          Caption = '&Invoice'
          Enabled = False
          TabOrder = 3
          OnClick = btnChargeRequestClick
        end
      end
    end
    object tsSchedule: TTabSheet
      Caption = 'Pre Production Schedule'
      ImageIndex = 4
      object pnlArtwork: TPanel
        Left = 0
        Top = 0
        Width = 265
        Height = 174
        Align = alLeft
        ParentBackground = False
        TabOrder = 0
        ExplicitHeight = 192
        object Panel15: TPanel
          Left = 1
          Top = 1
          Width = 263
          Height = 20
          Align = alTop
          ParentBackground = False
          TabOrder = 0
          object chkbxArtRequired: TCheckBox
            Left = 8
            Top = 1
            Width = 105
            Height = 17
            Caption = 'Artwork Required'
            TabOrder = 0
            OnClick = chkbxArtRequiredClick
          end
        end
        object scrlArtwork: TScrollBox
          Left = 1
          Top = 21
          Width = 263
          Height = 92
          Align = alTop
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Enabled = False
          TabOrder = 1
          object Label13: TLabel
            Left = 9
            Top = 12
            Width = 34
            Height = 13
            Caption = 'Due In'
          end
          object Label14: TLabel
            Left = 9
            Top = 39
            Width = 78
            Height = 13
            Caption = 'Proof Required'
          end
          object Label15: TLabel
            Left = 9
            Top = 67
            Width = 96
            Height = 13
            Caption = 'Approval Required'
          end
          object edtArtDueInDate: TEdit
            Tag = 10
            Left = 104
            Top = 8
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 0
            OnExit = edtArtDueInDateExit
          end
          object btnArtDueInDate: TBitBtn
            Tag = 10
            Left = 192
            Top = 6
            Width = 25
            Height = 25
            Enabled = False
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
            TabOrder = 1
            OnClick = btnArtDueInDateClick
          end
          object btnArtProofReqDate: TBitBtn
            Tag = 10
            Left = 192
            Top = 33
            Width = 25
            Height = 25
            Enabled = False
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
            OnClick = btnArtDueInDateClick
          end
          object edtArtProofReqDate: TEdit
            Tag = 10
            Left = 104
            Top = 35
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 2
            OnExit = edtArtDueInDateExit
          end
          object edtArtApprovalDate: TEdit
            Tag = 10
            Left = 104
            Top = 63
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 4
            OnExit = edtArtDueInDateExit
          end
          object btnArtApprovalDate: TBitBtn
            Tag = 10
            Left = 192
            Top = 61
            Width = 25
            Height = 25
            Enabled = False
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
            TabOrder = 5
            OnClick = btnArtDueInDateClick
          end
          object chkbxArtDueInDate: TCheckBox
            Left = 231
            Top = 10
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            OnClick = chkbxArtDueInDateClick
          end
          object chkbxArtProofReqDate: TCheckBox
            Left = 231
            Top = 37
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnClick = chkbxArtDueInDateClick
          end
          object chkbxArtApprovalDate: TCheckBox
            Left = 231
            Top = 65
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            OnClick = chkbxArtDueInDateClick
          end
        end
        object Panel12: TPanel
          Left = 1
          Top = 113
          Width = 263
          Height = 20
          Align = alTop
          Caption = 'Other Information'
          ParentBackground = False
          TabOrder = 2
        end
        object memScheduleNotes: TMemo
          Left = 1
          Top = 133
          Width = 263
          Height = 58
          Align = alClient
          TabOrder = 3
        end
      end
      object pnlSamples: TPanel
        Left = 787
        Top = 0
        Width = 263
        Height = 174
        Align = alRight
        ParentBackground = False
        TabOrder = 1
        object Panel17: TPanel
          Left = 1
          Top = 1
          Width = 261
          Height = 20
          Align = alTop
          ParentBackground = False
          TabOrder = 0
          object chkbxSamples: TCheckBox
            Left = 8
            Top = 1
            Width = 137
            Height = 17
            Caption = 'SEPs Required'
            TabOrder = 0
            OnClick = chkbxSamplesClick
          end
        end
        object scrlSamples: TScrollBox
          Left = 1
          Top = 21
          Width = 261
          Height = 45
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Enabled = False
          TabOrder = 1
          ExplicitHeight = 63
          object Label27: TLabel
            Left = 9
            Top = 12
            Width = 94
            Height = 13
            Caption = 'SEPs to client date'
          end
          object Label28: TLabel
            Left = 9
            Top = 39
            Width = 98
            Height = 13
            Caption = 'SEPs Approval date'
          end
          object edtSEPClientDate: TEdit
            Tag = 30
            Left = 112
            Top = 8
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 0
            OnExit = edtArtDueInDateExit
          end
          object btnSEPClientDate: TBitBtn
            Tag = 30
            Left = 203
            Top = 6
            Width = 25
            Height = 25
            Enabled = False
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
            TabOrder = 1
            OnClick = btnArtDueInDateClick
          end
          object btnSEPApprovalDate: TBitBtn
            Tag = 30
            Left = 203
            Top = 33
            Width = 25
            Height = 25
            Enabled = False
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
            OnClick = btnArtDueInDateClick
          end
          object edtSEPApprovalDate: TEdit
            Tag = 30
            Left = 112
            Top = 35
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 2
            OnExit = edtArtDueInDateExit
          end
          object chkbxSEPClientDate: TCheckBox
            Left = 239
            Top = 10
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = chkbxArtDueInDateClick
          end
          object chkbxSEPApprovalDate: TCheckBox
            Left = 239
            Top = 37
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = chkbxArtDueInDateClick
          end
        end
        object Panel14: TPanel
          Left = 1
          Top = 66
          Width = 261
          Height = 107
          Align = alBottom
          BevelInner = bvLowered
          ParentBackground = False
          TabOrder = 2
          DesignSize = (
            261
            107)
          object lblRevision: TLabel
            Left = 8
            Top = 13
            Width = 64
            Height = 13
            Caption = 'Revision No:'
          end
          object lblScheduleDate: TLabel
            Left = 8
            Top = 34
            Width = 27
            Height = 13
            Caption = 'Date:'
          end
          object lblScheduleOp: TLabel
            Left = 8
            Top = 55
            Width = 50
            Height = 13
            Caption = 'Operator:'
          end
          object Label26: TLabel
            Left = 8
            Top = 84
            Width = 68
            Height = 13
            Caption = 'Shedule Type'
          end
          object btnNewSchedule: TBitBtn
            Left = 176
            Top = 9
            Width = 75
            Height = 25
            Hint = 'add a new schedule revision'
            Anchors = [akRight, akBottom]
            Caption = '&New'
            Enabled = False
            TabOrder = 0
            OnClick = btnNewScheduleClick
          end
          object btnHistorySchedule: TBitBtn
            Left = 176
            Top = 41
            Width = 75
            Height = 25
            Hint = 'History'
            Anchors = [akRight, akBottom]
            Caption = '&History'
            Enabled = False
            TabOrder = 1
            OnClick = btnHistoryScheduleClick
          end
          object cmbApprovalType: TComboBox
            Left = 104
            Top = 80
            Width = 145
            Height = 21
            Style = csDropDownList
            Anchors = [akRight, akBottom]
            ItemIndex = 0
            TabOrder = 2
            Text = 'Estimated'
            Items.Strings = (
              'Estimated'
              'Provisional'
              'Actual')
          end
        end
      end
      object pnlDataServices: TPanel
        Left = 265
        Top = 0
        Width = 522
        Height = 174
        Align = alClient
        ParentBackground = False
        TabOrder = 2
        ExplicitWidth = 534
        ExplicitHeight = 192
        object Panel16: TPanel
          Left = 1
          Top = 1
          Width = 532
          Height = 20
          Align = alTop
          ParentBackground = False
          TabOrder = 0
          object chkbxDSRequired: TCheckBox
            Left = 8
            Top = 1
            Width = 137
            Height = 17
            Caption = 'Data Services Required'
            TabOrder = 0
            OnClick = chkbxDSRequiredClick
          end
        end
        object scrlDataServices: TScrollBox
          Left = 1
          Top = 21
          Width = 532
          Height = 170
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Enabled = False
          TabOrder = 1
          object Label16: TLabel
            Left = 9
            Top = 12
            Width = 61
            Height = 13
            Caption = 'Data Due In'
          end
          object Label17: TLabel
            Left = 9
            Top = 39
            Width = 69
            Height = 13
            Caption = 'Client Brief In'
          end
          object Label18: TLabel
            Left = 9
            Top = 67
            Width = 57
            Height = 13
            Caption = 'Text Due In'
          end
          object Label19: TLabel
            Left = 9
            Top = 108
            Width = 54
            Height = 13
            Caption = 'Brief to DS'
          end
          object Label20: TLabel
            Left = 9
            Top = 160
            Width = 51
            Height = 13
            Caption = 'Text to DS'
          end
          object Label21: TLabel
            Left = 9
            Top = 201
            Width = 99
            Height = 13
            Caption = 'Text Proof Req'#39'd by'
          end
          object Label22: TLabel
            Left = 9
            Top = 332
            Width = 103
            Height = 13
            Caption = 'Live Proofs Req'#39'd by'
          end
          object Label23: TLabel
            Left = 9
            Top = 359
            Width = 99
            Height = 13
            Caption = 'Live Proof Approval'
          end
          object Label24: TLabel
            Left = 9
            Top = 134
            Width = 55
            Height = 13
            Caption = 'Data to DS'
          end
          object Label29: TLabel
            Left = 9
            Top = 266
            Width = 99
            Height = 13
            Caption = 'PDF Proof Req'#39'd by'
          end
          object Label30: TLabel
            Left = 9
            Top = 292
            Width = 100
            Height = 13
            Caption = 'PDF Proof Approval'
          end
          object Label31: TLabel
            Left = 9
            Top = 240
            Width = 113
            Height = 13
            Caption = 'Artwork for PDF Proof'
          end
          object edtDataDueInDate: TEdit
            Tag = 20
            Left = 112
            Top = 8
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 0
            OnExit = edtArtDueInDateExit
          end
          object btnDataDueInDate: TBitBtn
            Tag = 20
            Left = 203
            Top = 6
            Width = 25
            Height = 25
            Enabled = False
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
            TabOrder = 1
            OnClick = btnArtDueInDateClick
          end
          object btnClientBriefInDate: TBitBtn
            Tag = 20
            Left = 203
            Top = 33
            Width = 25
            Height = 25
            Enabled = False
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
            OnClick = btnArtDueInDateClick
          end
          object edtClientBriefInDate: TEdit
            Tag = 20
            Left = 112
            Top = 35
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 2
            OnExit = edtArtDueInDateExit
          end
          object edtTextDueInDate: TEdit
            Tag = 20
            Left = 112
            Top = 63
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 4
            OnExit = edtArtDueInDateExit
          end
          object btnTextDueInDate: TBitBtn
            Tag = 20
            Left = 203
            Top = 61
            Width = 25
            Height = 25
            Enabled = False
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
            TabOrder = 5
            OnClick = btnArtDueInDateClick
          end
          object btnBriefToDSDate: TBitBtn
            Tag = 20
            Left = 203
            Top = 102
            Width = 25
            Height = 25
            Enabled = False
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
            TabOrder = 7
            OnClick = btnArtDueInDateClick
          end
          object edtBriefToDSDate: TEdit
            Tag = 20
            Left = 112
            Top = 104
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 6
            OnExit = edtArtDueInDateExit
          end
          object edtTextToDSDate: TEdit
            Tag = 20
            Left = 112
            Top = 156
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 10
            OnExit = edtArtDueInDateExit
          end
          object btnTextToDSDate: TBitBtn
            Tag = 20
            Left = 203
            Top = 154
            Width = 25
            Height = 25
            Enabled = False
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
            TabOrder = 11
            OnClick = btnArtDueInDateClick
          end
          object btnTextProofReqDate: TBitBtn
            Tag = 20
            Left = 203
            Top = 195
            Width = 25
            Height = 25
            Enabled = False
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
            TabOrder = 13
            OnClick = btnArtDueInDateClick
          end
          object edtTextProofReqDate: TEdit
            Tag = 20
            Left = 112
            Top = 197
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 12
            OnExit = edtArtDueInDateExit
          end
          object edtLiveProofReqDate: TEdit
            Tag = 20
            Left = 112
            Top = 328
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 20
            OnExit = edtArtDueInDateExit
          end
          object btnLiveProofReqDate: TBitBtn
            Tag = 20
            Left = 203
            Top = 326
            Width = 25
            Height = 25
            Enabled = False
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
            TabOrder = 21
            OnClick = btnArtDueInDateClick
          end
          object btnLiveProofAppDate: TBitBtn
            Tag = 20
            Left = 203
            Top = 353
            Width = 25
            Height = 25
            Enabled = False
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
            TabOrder = 23
            OnClick = btnArtDueInDateClick
          end
          object edtLiveProofAppDate: TEdit
            Tag = 20
            Left = 112
            Top = 355
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 22
            OnExit = edtArtDueInDateExit
          end
          object chkbxDataDueInDate: TCheckBox
            Left = 239
            Top = 10
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 24
            OnClick = chkbxArtDueInDateClick
          end
          object chkbxClientBriefInDate: TCheckBox
            Left = 239
            Top = 37
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 25
            OnClick = chkbxArtDueInDateClick
          end
          object chkbxTextDueInDate: TCheckBox
            Left = 239
            Top = 65
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 26
            OnClick = chkbxArtDueInDateClick
          end
          object chkbxBriefToDSDate: TCheckBox
            Left = 239
            Top = 106
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 27
            OnClick = chkbxArtDueInDateClick
          end
          object chkbxTextToDSDate: TCheckBox
            Left = 239
            Top = 158
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 29
            OnClick = chkbxArtDueInDateClick
          end
          object chkbxTextProofReqDate: TCheckBox
            Left = 239
            Top = 199
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 30
            OnClick = chkbxArtDueInDateClick
          end
          object chkbxLiveProofReqDate: TCheckBox
            Left = 239
            Top = 330
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 34
            OnClick = chkbxArtDueInDateClick
          end
          object chkbxLiveProofAppDate: TCheckBox
            Left = 239
            Top = 357
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 35
            OnClick = chkbxArtDueInDateClick
          end
          object edtDataToDSDate: TEdit
            Tag = 20
            Left = 112
            Top = 130
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 8
            OnExit = edtArtDueInDateExit
          end
          object btnDatatoDSDate: TBitBtn
            Tag = 20
            Left = 203
            Top = 128
            Width = 25
            Height = 25
            Enabled = False
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
            TabOrder = 9
            OnClick = btnArtDueInDateClick
          end
          object chkbxDataToDSDate: TCheckBox
            Left = 239
            Top = 132
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 28
            OnClick = chkbxArtDueInDateClick
          end
          object edtPDFProofReqDate: TEdit
            Tag = 20
            Left = 112
            Top = 262
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 16
            OnExit = edtArtDueInDateExit
          end
          object btnPDFProofReqDate: TBitBtn
            Tag = 20
            Left = 203
            Top = 260
            Width = 25
            Height = 25
            Enabled = False
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
            TabOrder = 17
            OnClick = btnArtDueInDateClick
          end
          object chkbxPDFProofReqDate: TCheckBox
            Left = 238
            Top = 264
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 32
            OnClick = chkbxArtDueInDateClick
          end
          object chkbxPDFProofAppDate: TCheckBox
            Left = 238
            Top = 290
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 33
            OnClick = chkbxArtDueInDateClick
          end
          object btnPDFProofAppDate: TBitBtn
            Tag = 20
            Left = 203
            Top = 286
            Width = 25
            Height = 25
            Enabled = False
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
            TabOrder = 19
            OnClick = btnArtDueInDateClick
          end
          object edtPDFProofAppDate: TEdit
            Tag = 20
            Left = 112
            Top = 288
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 18
            OnExit = edtArtDueInDateExit
          end
          object edtPDFProofArtDate: TEdit
            Tag = 20
            Left = 112
            Top = 236
            Width = 80
            Height = 21
            Color = clBtnFace
            TabOrder = 14
            OnExit = edtArtDueInDateExit
          end
          object btnPDFProofArtDate: TBitBtn
            Tag = 20
            Left = 203
            Top = 234
            Width = 25
            Height = 25
            Enabled = False
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
            TabOrder = 15
            OnClick = btnArtDueInDateClick
          end
          object chkbxPDFProofArtDate: TCheckBox
            Left = 238
            Top = 238
            Width = 16
            Height = 17
            ParentShowHint = False
            ShowHint = True
            TabOrder = 31
            OnClick = chkbxArtDueInDateClick
          end
        end
      end
    end
    object tsProduction: TTabSheet
      Caption = 'Production/Works Instructions'
      ImageIndex = 5
      object scrlProduction: TScrollBox
        Left = 0
        Top = 0
        Width = 257
        Height = 192
        Align = alLeft
        TabOrder = 0
        object Label32: TLabel
          Left = 8
          Top = 8
          Width = 80
          Height = 13
          Caption = 'Personalisation'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 8
          Top = 120
          Width = 50
          Height = 13
          Caption = 'Enclosing'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 8
          Top = 176
          Width = 48
          Height = 13
          Caption = 'Finishing'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object CheckBox1: TCheckBox
          Left = 32
          Top = 24
          Width = 225
          Height = 17
          Caption = 'Continuous Personalisation'
          TabOrder = 0
          OnClick = CheckBoxClick
        end
        object CheckBox2: TCheckBox
          Left = 32
          Top = 43
          Width = 225
          Height = 17
          Caption = 'Continuous Fanfold Personalisation'
          TabOrder = 1
        end
        object CheckBox3: TCheckBox
          Left = 32
          Top = 62
          Width = 225
          Height = 14
          Caption = 'Sheet Personalisation'
          TabOrder = 2
        end
        object CheckBox4: TCheckBox
          Left = 32
          Top = 79
          Width = 225
          Height = 17
          Caption = 'Inkjet'
          TabOrder = 3
        end
        object CheckBox5: TCheckBox
          Left = 32
          Top = 98
          Width = 225
          Height = 17
          Caption = 'Thermal Card Personalisation'
          TabOrder = 4
        end
        object CheckBox7: TCheckBox
          Left = 32
          Top = 136
          Width = 225
          Height = 17
          Caption = 'Machine Enclosing'
          TabOrder = 5
        end
        object CheckBox8: TCheckBox
          Left = 32
          Top = 155
          Width = 225
          Height = 17
          Caption = 'Hand Enclosing'
          TabOrder = 6
        end
        object CheckBox9: TCheckBox
          Left = 32
          Top = 192
          Width = 225
          Height = 17
          Caption = 'Guilotine'
          TabOrder = 7
        end
        object CheckBox10: TCheckBox
          Left = 32
          Top = 211
          Width = 225
          Height = 17
          Caption = 'Folding'
          TabOrder = 8
        end
        object CheckBox6: TCheckBox
          Left = 32
          Top = 229
          Width = 225
          Height = 17
          Caption = 'Stitching'
          TabOrder = 9
        end
      end
      object Panel10: TPanel
        Left = 257
        Top = 0
        Width = 805
        Height = 192
        Align = alClient
        Caption = 'Panel10'
        ParentBackground = False
        TabOrder = 1
        object Panel13: TPanel
          Left = 1
          Top = 1
          Width = 803
          Height = 18
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = 'Works Instructions'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
        end
        object sgWorks: TStringGrid
          Left = 1
          Top = 19
          Width = 718
          Height = 172
          Align = alClient
          ColCount = 8
          DefaultColWidth = 40
          DefaultRowHeight = 18
          RowCount = 4
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
          PopupMenu = pmnWorks
          TabOrder = 1
          OnDblClick = sgWorksDblClick
          OnDrawCell = sgWorksDrawCell
          ColWidths = (
            40
            79
            83
            82
            79
            82
            179
            189)
        end
        object pnlWorks: TPanel
          Left = 719
          Top = 19
          Width = 85
          Height = 172
          Align = alRight
          ParentBackground = False
          TabOrder = 2
          object btnAddWorks: TBitBtn
            Left = 8
            Top = 8
            Width = 75
            Height = 25
            Hint = 'Add a new Works Instruction to this Job Bag'
            Caption = '&Add'
            TabOrder = 0
            OnClick = btnAddWorksClick
          end
          object btnChangeWorks: TBitBtn
            Left = 8
            Top = 40
            Width = 75
            Height = 25
            Hint = 'Change the selected Works Instruction'
            Caption = '&Change'
            Enabled = False
            TabOrder = 1
            OnClick = btnChangeWorksClick
          end
          object btnDeleteWorks: TBitBtn
            Left = 8
            Top = 72
            Width = 75
            Height = 25
            Hint = 'Delete the selected Works Instruction from this Job Bag'
            Caption = '&Delete'
            Enabled = False
            TabOrder = 2
            OnClick = btnDeleteWorksClick
          end
          object btnInsertWorks: TBitBtn
            Left = 8
            Top = 168
            Width = 75
            Height = 25
            Hint = 'Insert a existing Works Instruction'
            Caption = '&Insert'
            TabOrder = 3
            OnClick = btnInsertWorksClick
          end
          object btnPrintWorks: TBitBtn
            Left = 8
            Top = 200
            Width = 75
            Height = 25
            Hint = 'Print the selected Works Instruction'
            Caption = '&Print'
            Enabled = False
            TabOrder = 4
            OnClick = btnPrintWorksClick
          end
          object btnCopyWorks: TBitBtn
            Left = 8
            Top = 104
            Width = 75
            Height = 25
            Hint = 'Copy the selected Works Instruction'
            Caption = '&Copy'
            Enabled = False
            TabOrder = 5
            OnClick = btnCopyWorksClick
          end
          object btnRepeatWorks: TBitBtn
            Left = 8
            Top = 136
            Width = 75
            Height = 25
            Hint = 'Repeat a Works Instruction not listed in this Job Bag'
            Caption = '&Repeat'
            TabOrder = 6
            OnClick = btnRepeatWorksClick
          end
          object btnPrintWorksISO: TBitBtn
            Left = 8
            Top = 232
            Width = 75
            Height = 25
            Hint = 'Print the selected Works Instruction'
            Caption = 'ISO Print'
            Enabled = False
            TabOrder = 7
            OnClick = btnPrintWorksISOClick
          end
        end
      end
    end
    object tsIntNotes: TTabSheet
      Caption = 'Documents'
      ImageIndex = 2
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 1062
        Height = 192
        Align = alClient
        Caption = 'Panel6'
        ParentBackground = False
        TabOrder = 0
        object Panel7: TPanel
          Left = 1
          Top = 167
          Width = 1060
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object lblDocumentDir: TLabel
            Left = 8
            Top = 6
            Width = 150
            Height = 13
            Caption = 'Primary Document Directory:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object tlbrDocuments: TToolBar
          Left = 1027
          Top = 1
          Width = 34
          Height = 166
          Align = alRight
          ButtonHeight = 30
          ButtonWidth = 30
          Caption = 'tlbrDocuments'
          EdgeBorders = [ebLeft, ebTop, ebRight]
          HotImages = imgIcons
          Images = imgIcons
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Wrapable = False
          object btnExcel: TToolButton
            Left = 0
            Top = 0
            Hint = 'Excel'
            Caption = 'btnExcel'
            ImageIndex = 0
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = btnExcelClick
          end
          object btnWord: TToolButton
            Left = 0
            Top = 30
            Hint = 'Word'
            Caption = 'btnWord'
            ImageIndex = 1
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = btnExcelClick
          end
          object btnEmail: TToolButton
            Left = 0
            Top = 60
            Hint = 'Email Customer'
            Caption = 'btnEmail'
            ImageIndex = 2
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = btnEmailClick
          end
          object btnEmailSupplier: TToolButton
            Left = 0
            Top = 90
            Hint = 'Email Supplier'
            Caption = 'btnEmailSupplier'
            ImageIndex = 4
            Wrap = True
            OnClick = btnEmailSupplierClick
          end
          object btnAttach: TToolButton
            Left = 0
            Top = 120
            Hint = 'Attach Documents'
            Caption = 'btnAttach'
            ImageIndex = 3
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = btnAttachClick
          end
        end
        object lstvwDocuments: TListView
          Left = 225
          Top = 1
          Width = 802
          Height = 166
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
          MultiSelect = True
          RowSelect = True
          PopupMenu = pmnuDocuments
          SmallImages = imgDocuments
          TabOrder = 2
          OnColumnClick = lstvwDocumentsColumnClick
          OnCompare = lstvwDocumentsCompare
          OnDblClick = lstvwDocumentsDblClick
        end
        object dirlstJobDocuments: TDirectoryListBox
          Left = 1
          Top = 1
          Width = 176
          Height = 166
          Align = alLeft
          TabOrder = 3
          OnChange = dirlstJobDocumentsChange
        end
        object pnlDocumentsLeft: TPanel
          Left = 177
          Top = 1
          Width = 48
          Height = 166
          Align = alLeft
          ParentBackground = False
          TabOrder = 4
        end
      end
    end
    object tsInvoicing: TTabSheet
      Caption = 'Invoicing'
      ImageIndex = 3
      object pnlSInvoices: TPanel
        Left = 0
        Top = 0
        Width = 1050
        Height = 66
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          1050
          66)
        object Label38: TLabel
          Left = 799
          Top = -47
          Width = 102
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Total Invoiced Costs'
        end
        object Label41: TLabel
          Left = 928
          Top = -47
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object dbgSalesInvoices: TDBGrid
          Left = 0
          Top = 25
          Width = 965
          Height = 13
          Align = alClient
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDrawColumnCell = dbgSalesInvoicesDrawColumnCell
          OnDblClick = dbgSalesInvoicesDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Sales_Invoice_no'
              Title.Caption = 'Invoice No'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Invoice_Date'
              Title.Caption = 'Invoice Date'
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Invoice_description'
              Title.Caption = 'Description'
              Width = 269
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Total_Goods'
              Title.Caption = 'Goods'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Total_Vat'
              Title.Caption = 'Vat'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Total_Invoice'
              Title.Caption = 'Total'
              Width = 66
              Visible = True
            end>
        end
        object Panel8: TPanel
          Left = 965
          Top = 25
          Width = 85
          Height = 13
          Align = alRight
          ParentBackground = False
          TabOrder = 1
          ExplicitLeft = 977
          ExplicitHeight = 31
          object btnViewSI: TBitBtn
            Left = 8
            Top = 8
            Width = 75
            Height = 25
            Caption = '&View'
            TabOrder = 0
            OnClick = btnViewSIClick
          end
          object btnRePrintSI: TBitBtn
            Left = 8
            Top = 40
            Width = 75
            Height = 25
            Caption = '&Re-Print'
            Enabled = False
            TabOrder = 1
            OnClick = btnRePrintSIClick
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 0
          Width = 1050
          Height = 25
          Align = alTop
          ParentBackground = False
          TabOrder = 2
          ExplicitWidth = 1062
          object Label36: TLabel
            Left = 13
            Top = 6
            Width = 70
            Height = 13
            Caption = 'Sales Invoices'
          end
        end
        object Panel19: TPanel
          Left = 0
          Top = 38
          Width = 1050
          Height = 28
          Align = alBottom
          ParentBackground = False
          TabOrder = 3
          DesignSize = (
            1050
            28)
          object Label42: TLabel
            Left = 342
            Top = 8
            Width = 100
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Total Invoiced Sales'
          end
          object memTotalSI: TMemo
            Left = 475
            Top = 4
            Width = 70
            Height = 21
            Alignment = taRightJustify
            ReadOnly = True
            TabOrder = 0
            WantReturns = False
            WordWrap = False
            OnChange = memTotalSIChange
          end
        end
      end
      object pnlPInvoices: TPanel
        Left = 0
        Top = 66
        Width = 1050
        Height = 108
        Align = alBottom
        Caption = 'pnlPInvoices'
        ParentBackground = False
        TabOrder = 1
        object dbgPurchaseInvoices: TDBGrid
          Left = 1
          Top = 26
          Width = 963
          Height = 53
          Align = alClient
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDrawColumnCell = dbgPurchaseInvoicesDrawColumnCell
          OnDblClick = dbgPurchaseInvoicesDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Supplier_Name'
              Title.Caption = 'Supplier'
              Width = 148
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Supplier_Invoice_no'
              Title.Caption = 'Invoice No'
              Width = 114
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Invoice_Date'
              Title.Caption = 'Invoice Date'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Supp_Inv_Alt_Ref'
              Title.Caption = 'PIN Number'
              Width = 104
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Total_Goods'
              Title.Caption = 'Goods'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Total_Vat'
              Title.Caption = 'Vat'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Total_Invoice'
              Title.Caption = 'Total'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Purchase_order'
              Title.Caption = 'PO Number'
              Visible = True
            end>
        end
        object Panel20: TPanel
          Left = 964
          Top = 26
          Width = 85
          Height = 53
          Align = alRight
          ParentBackground = False
          TabOrder = 1
          ExplicitLeft = 976
          object btnViewPI: TBitBtn
            Left = 8
            Top = 8
            Width = 75
            Height = 25
            Caption = '&View'
            TabOrder = 0
            OnClick = btnViewPIClick
          end
        end
        object Panel18: TPanel
          Left = 1
          Top = 1
          Width = 1048
          Height = 25
          Align = alTop
          ParentBackground = False
          TabOrder = 2
          ExplicitWidth = 1060
          object Label37: TLabel
            Left = 13
            Top = 6
            Width = 90
            Height = 13
            Caption = 'Purchase Invoices'
          end
        end
        object Panel1: TPanel
          Left = 1
          Top = 79
          Width = 1048
          Height = 28
          Align = alBottom
          ParentBackground = False
          TabOrder = 3
          DesignSize = (
            1048
            28)
          object Label12: TLabel
            Left = 342
            Top = 8
            Width = 102
            Height = 13
            Anchors = [akLeft, akBottom]
            Caption = 'Total Invoiced Costs'
          end
          object memTotalPI: TMemo
            Left = 475
            Top = 4
            Width = 70
            Height = 21
            Alignment = taRightJustify
            ReadOnly = True
            TabOrder = 0
            WantReturns = False
            WordWrap = False
            OnChange = memTotalPIChange
          end
        end
      end
    end
    object tsSupply: TTabSheet
      Caption = 'Pending Enquiries'
      ImageIndex = 7
      object Panel11: TPanel
        Left = 977
        Top = 0
        Width = 85
        Height = 192
        Align = alRight
        ParentBackground = False
        TabOrder = 0
        object btnConvertSupply: TBitBtn
          Left = 6
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Convert'
          TabOrder = 0
          OnClick = btnConvertSupplyClick
        end
      end
      object sgSupply: TStringGrid
        Left = 0
        Top = 0
        Width = 977
        Height = 192
        Align = alClient
        ColCount = 7
        DefaultColWidth = 40
        DefaultRowHeight = 18
        RowCount = 4
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 1
        OnDrawCell = sgSupplyDrawCell
        ColWidths = (
          40
          63
          57
          239
          68
          89
          70)
      end
    end
    object tsDataCollect: TTabSheet
      Caption = 'Data Collection'
      ImageIndex = 7
      object Panel21: TPanel
        Left = 0
        Top = 0
        Width = 1050
        Height = 33
        Align = alTop
        ParentBackground = False
        TabOrder = 0
        object Label39: TLabel
          Left = 13
          Top = 9
          Width = 61
          Height = 13
          Caption = 'Department'
        end
        object cmbDepartment: TComboBox
          Left = 80
          Top = 6
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 0
          Text = 'All'
          OnChange = cmbDepartmentChange
          Items.Strings = (
            'All')
        end
      end
      object dbgDataCollect: TDBGrid
        Left = 0
        Top = 33
        Width = 1050
        Height = 109
        Align = alClient
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Date_Point'
            Title.Caption = 'Date'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WC_Operator_Name'
            Title.Caption = 'Operator'
            Width = 126
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Process_Group_Description'
            Title.Caption = 'Department'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Process_Description'
            Title.Caption = 'Process'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Operation_Description'
            Title.Caption = 'Operation'
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Labour_Hours'
            Title.Caption = 'Labour Hrs'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Labour_Overtime_Hours'
            Title.Caption = 'Overtime Hrs'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Work_Centre_Name'
            Title.Caption = 'Work Centre'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Machine_Hours'
            Title.Caption = 'Machine Hrs'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Number_Up'
            Title.Caption = 'Number Up'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantity'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Paper_Size_Description'
            Title.Caption = 'Paper Size'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Labour_Time_From'
            Title.Caption = 'Start Time'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Labour_Time_To'
            Title.Caption = 'Finish Time'
            Width = 74
            Visible = True
          end>
      end
      object Panel22: TPanel
        Left = 0
        Top = 142
        Width = 1050
        Height = 32
        Align = alBottom
        Alignment = taRightJustify
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          1050
          32)
        object lblMachineHours: TLabel
          Left = 852
          Top = 10
          Width = 138
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = 'Total Machine Hours: 000.00'
          ExplicitLeft = 912
        end
        object TLabel
          Left = 994
          Top = 9
          Width = 3
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          ExplicitLeft = 1054
        end
        object lblOvertimeHours: TLabel
          Left = 683
          Top = 10
          Width = 139
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = 'Total Overtime Hours: 000.00'
          ExplicitLeft = 743
        end
        object lblLabourHours: TLabel
          Left = 516
          Top = 10
          Width = 130
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          AutoSize = False
          Caption = 'Total Labour Hours: 000.00'
          ExplicitLeft = 576
        end
      end
    end
    object tsNCA: TTabSheet
      Caption = 'NCA'
      ImageIndex = 8
      object pnlFunctions: TPanel
        Left = 965
        Top = 0
        Width = 85
        Height = 174
        Align = alRight
        ParentBackground = False
        TabOrder = 0
        ExplicitLeft = 977
        ExplicitHeight = 192
        object btnAddNCA: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Hint = 'Add a new Works Instruction to this Job Bag'
          Caption = '&Add'
          TabOrder = 0
          OnClick = btnAddNCAClick
        end
        object btnChangeNCA: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Hint = 'Change the selected Works Instruction'
          Caption = '&Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeNCAClick
        end
        object btnDeleteNCA: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Hint = 'Delete the selected Works Instruction from this Job Bag'
          Caption = '&Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteNCAClick
        end
        object btnPrintNCA: TBitBtn
          Left = 8
          Top = 104
          Width = 75
          Height = 25
          Hint = 'Delete the selected Works Instruction from this Job Bag'
          Caption = '&Print'
          Enabled = False
          TabOrder = 3
          OnClick = btnPrintNCAClick
        end
      end
      object Panel25: TPanel
        Left = 0
        Top = 0
        Width = 965
        Height = 174
        Align = alClient
        Caption = 'Panel25'
        ParentBackground = False
        TabOrder = 1
        object sgNCADetails: TStringGrid
          Left = 1
          Top = 1
          Width = 963
          Height = 112
          Align = alTop
          ColCount = 10
          DefaultColWidth = 40
          DefaultRowHeight = 18
          RowCount = 3
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          TabOrder = 0
          OnClick = sgNCADetailsClick
          OnDblClick = sgNCADetailsDblClick
          OnDrawCell = sgNCADetailsDrawCell
          ExplicitWidth = 975
          ColWidths = (
            40
            87
            88
            142
            119
            136
            136
            116
            99
            86)
        end
        object Panel26: TPanel
          Left = 1
          Top = 113
          Width = 963
          Height = 24
          Align = alTop
          ParentBackground = False
          TabOrder = 1
          ExplicitWidth = 975
          object Label40: TLabel
            Left = 9
            Top = 6
            Width = 135
            Height = 13
            Caption = 'Non Conformance Details:'
          end
        end
        object memNCADetails: TMemo
          Left = 1
          Top = 137
          Width = 963
          Height = 36
          Align = alClient
          Color = clBtnFace
          Lines.Strings = (
            '')
          ReadOnly = True
          TabOrder = 2
        end
      end
    end
    object tsDeliveries: TTabSheet
      Caption = 'Deliveries'
      ImageIndex = 10
      object pnlDeliveries: TPanel
        Left = 977
        Top = 0
        Width = 85
        Height = 192
        Align = alRight
        ParentBackground = False
        TabOrder = 0
        object btnAddDelivery: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          TabOrder = 0
          OnClick = btnAddDeliveryClick
        end
        object btnChangeDelivery: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeDeliveryClick
        end
        object btnDeleteDelivery: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Caption = '&Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteDeliveryClick
        end
        object btnPrintDeliveryNote: TBitBtn
          Left = 8
          Top = 104
          Width = 75
          Height = 25
          Caption = '&Notes'
          Enabled = False
          TabOrder = 3
          OnClick = btnPrintDeliveryNoteClick
        end
        object btnPrintDeliveryLabel: TBitBtn
          Left = 8
          Top = 138
          Width = 75
          Height = 25
          Caption = '&Labels'
          Enabled = False
          TabOrder = 4
          OnClick = btnPrintDeliveryLabelClick
        end
      end
      object sgDeliveries: TStringGrid
        Left = 0
        Top = 0
        Width = 977
        Height = 192
        Align = alClient
        ColCount = 4
        DefaultColWidth = 40
        DefaultRowHeight = 18
        RowCount = 4
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 1
        OnDblClick = sgDeliveriesDblClick
        OnDrawCell = sgDeliveriesDrawCell
        ColWidths = (
          40
          69
          289
          70)
      end
    end
    object tsAnalysis: TTabSheet
      Caption = 'Analysis'
      ImageIndex = 9
      OnShow = tsAnalysisShow
      object lblTotalPInvoices: TLabel
        Left = 312
        Top = 48
        Width = 64
        Height = 13
        Caption = 'lblTotalSales'
      end
      object Panel23: TPanel
        Left = 0
        Top = 0
        Width = 1062
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object Label43: TLabel
          Left = 13
          Top = 5
          Width = 129
          Height = 13
          Caption = 'Job Profitability Analysis'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label49: TLabel
          Left = 550
          Top = 5
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'Actuals'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 638
          Top = 5
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'Budget'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel24: TPanel
        Left = 0
        Top = 108
        Width = 1062
        Height = 84
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        object Label45: TLabel
          Left = 32
          Top = 6
          Width = 118
          Height = 13
          Caption = 'Total Purchase Invoices'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 32
          Top = 30
          Width = 104
          Height = 13
          Caption = 'Total Sales Invoicing'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 32
          Top = 54
          Width = 96
          Height = 13
          Caption = 'Total Margin Value'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label48: TLabel
          Left = 32
          Top = 78
          Width = 49
          Height = 13
          Caption = 'Margin %'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblPICount: TLabel
          Left = 373
          Top = 6
          Width = 118
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Purchase Invoices'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object memTotalPIAnalysis: TMemo
          Left = 507
          Top = 2
          Width = 83
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 0
          WantReturns = False
          WordWrap = False
        end
        object memTotalSIAnalysis: TMemo
          Left = 507
          Top = 26
          Width = 83
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 1
          WantReturns = False
          WordWrap = False
        end
        object memTotalMarginAnalysis: TMemo
          Left = 507
          Top = 50
          Width = 83
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 2
          WantReturns = False
          WordWrap = False
        end
        object memMarginPercAnalysis: TMemo
          Left = 507
          Top = 74
          Width = 83
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 3
          WantReturns = False
          WordWrap = False
        end
        object memBudgetPOAnalysis: TMemo
          Left = 595
          Top = 2
          Width = 83
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 4
          WantReturns = False
          WordWrap = False
        end
        object memBudgetSalesAnalysis: TMemo
          Left = 595
          Top = 26
          Width = 83
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 5
          WantReturns = False
          WordWrap = False
        end
        object memBudgetMargin: TMemo
          Left = 595
          Top = 50
          Width = 83
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 6
          WantReturns = False
          WordWrap = False
        end
        object memBudgetMarginPerc: TMemo
          Left = 595
          Top = 74
          Width = 83
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 7
          WantReturns = False
          WordWrap = False
        end
      end
      object pnlDataAnalysis: TPanel
        Left = 0
        Top = 22
        Width = 1062
        Height = 86
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 2
        object Panel28: TPanel
          Left = 0
          Top = 60
          Width = 1062
          Height = 26
          Align = alBottom
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object Label44: TLabel
            Left = 32
            Top = 8
            Width = 117
            Height = 13
            Caption = 'Total Production Costs'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object memTotalOvertime: TMemo
            Left = 255
            Top = 2
            Width = 83
            Height = 21
            Alignment = taRightJustify
            ReadOnly = True
            TabOrder = 0
            WantReturns = False
            WordWrap = False
          end
          object memTotalLabour: TMemo
            Left = 171
            Top = 2
            Width = 83
            Height = 21
            Alignment = taRightJustify
            ReadOnly = True
            TabOrder = 1
            WantReturns = False
            WordWrap = False
          end
          object memTotalMachine: TMemo
            Left = 340
            Top = 2
            Width = 83
            Height = 21
            Alignment = taRightJustify
            ReadOnly = True
            TabOrder = 2
            WantReturns = False
            WordWrap = False
          end
          object memTotalClick: TMemo
            Left = 425
            Top = 2
            Width = 83
            Height = 21
            Alignment = taRightJustify
            ReadOnly = True
            TabOrder = 3
            WantReturns = False
            WordWrap = False
          end
          object memTotalProductionCost: TMemo
            Left = 507
            Top = 2
            Width = 83
            Height = 21
            Alignment = taRightJustify
            ReadOnly = True
            TabOrder = 4
            WantReturns = False
            WordWrap = False
          end
          object memBudgetEstimated: TMemo
            Left = 595
            Top = 2
            Width = 83
            Height = 21
            Alignment = taRightJustify
            ReadOnly = True
            TabOrder = 5
            WantReturns = False
            WordWrap = False
          end
        end
        object sgAnalysis: TStringGrid
          Left = 0
          Top = 0
          Width = 1062
          Height = 60
          Align = alClient
          ColCount = 8
          DefaultColWidth = 30
          DefaultRowHeight = 18
          TabOrder = 1
          OnDrawCell = sgAnalysisDrawCell
          ColWidths = (
            30
            133
            86
            82
            85
            84
            81
            85)
        end
      end
    end
    object tsSpecification: TTabSheet
      Caption = 'Specification'
      ImageIndex = 11
      object Panel2: TPanel
        Left = 977
        Top = 0
        Width = 85
        Height = 192
        Align = alRight
        ParentBackground = False
        TabOrder = 0
        object BitBtn1: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Hint = 'Add a new Works Instruction to this Job Bag'
          Caption = '&Print'
          TabOrder = 0
          Visible = False
        end
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 579
    Width = 1058
    Height = 108
    Align = alBottom
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 4
    object imgChkbxGreyed: TImage
      Left = 640
      Top = 48
      Width = 20
      Height = 20
      Picture.Data = {
        07544269746D6170DE030000424DDE0300000000000036000000280000001100
        0000120000000100180000000000A80300000000000000000000000000000000
        0000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC00D8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC00D8E9ECD8E9ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8E9ECD8E9EC00D8E9
        ECD8E9EC99A8ACE2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2
        EFF1E2EFF1E2EFF1FFFFFFD8E9ECD8E9EC00D8E9ECD8E9EC99A8AC646F71FFFF
        FFD8E9ECFFFFFFD8E9ECFFFFFFD8E9ECFFFFFFD8E9ECFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9EC00D8E9ECD8E9EC99A8AC646F71D8E9ECFFFFFFD8E9EC99A8ACD8E9
        ECFFFFFFD8E9ECFFFFFFD8E9ECE2EFF1FFFFFFD8E9ECD8E9EC00D8E9ECD8E9EC
        99A8AC646F71FFFFFFD8E9EC99A8AC99A8AC99A8ACD8E9ECFFFFFFD8E9ECFFFF
        FFE2EFF1FFFFFFD8E9ECD8E9EC00D8E9ECD8E9EC99A8AC646F71D8E9EC99A8AC
        99A8AC99A8AC99A8AC99A8ACD8E9ECFFFFFFD8E9ECE2EFF1FFFFFFD8E9ECD8E9
        EC00D8E9ECD8E9EC99A8AC646F71FFFFFF99A8AC99A8ACD8E9EC99A8AC99A8AC
        99A8ACD8E9ECFFFFFFE2EFF1FFFFFFD8E9ECD8E9EC00D8E9ECD8E9EC99A8AC64
        6F71D8E9EC99A8ACD8E9ECFFFFFFD8E9EC99A8AC99A8AC99A8ACD8E9ECE2EFF1
        FFFFFFD8E9ECD8E9EC00D8E9ECD8E9EC99A8AC646F71FFFFFFD8E9ECFFFFFFD8
        E9ECFFFFFFD8E9EC99A8AC99A8ACFFFFFFE2EFF1FFFFFFD8E9ECD8E9EC00D8E9
        ECD8E9EC99A8AC646F71D8E9ECFFFFFFD8E9ECFFFFFFD8E9ECFFFFFFD8E9EC99
        A8ACD8E9ECE2EFF1FFFFFFD8E9ECD8E9EC00D8E9ECD8E9EC99A8AC646F71FFFF
        FFD8E9ECFFFFFFD8E9ECFFFFFFD8E9ECFFFFFFD8E9ECFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9EC00D8E9ECD8E9EC99A8AC646F71646F71646F71646F71646F71646F
        71646F71646F71646F71646F71E2EFF1FFFFFFD8E9ECD8E9EC00D8E9ECD8E9EC
        99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8
        AC99A8ACFFFFFFD8E9ECD8E9EC00D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        EC00D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC00D8E9ECD8E9ECD8E9ECD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9EC00}
      Visible = False
    end
    object imgChkBxInvoiceAll: TImage
      Left = 616
      Top = 48
      Width = 20
      Height = 20
      Picture.Data = {
        07544269746D617006030000424D060300000000000036000000280000001000
        00000F0000000100180000000000D00200000000000000000000000000000000
        0000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8
        E9ECD8E9ECD8E9EC99A8ACE2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2EFF1
        E2EFF1E2EFF1E2EFF1E2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9ECD8E9EC99A8AC646F71646F71646F71646F71646F71646F71646F71
        646F71646F71646F71E2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC99A8AC99A8
        AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8ACFFFFFFD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC}
      Visible = False
    end
    object imgChkbxChecked: TImage
      Left = 664
      Top = 48
      Width = 20
      Height = 20
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        0000100000000100180000000000000300000000000000000000000000000000
        0000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8
        E9ECD8E9ECD8E9EC99A8ACE2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2EFF1
        E2EFF1E2EFF1E2EFF1E2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
        FFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9ECD8E9EC99A8AC646F71FFFFFF000000000000000000000000000000
        FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
        FF000000000000FFFFFF000000000000000000FFFFFFFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9ECD8E9EC99A8AC646F71FFFFFF000000FFFFFFFFFFFFFFFFFF000000
        000000000000FFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFE2EFF1FFFFFFD8
        E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9ECD8E9EC99A8AC646F71646F71646F71646F71646F71646F71646F71
        646F71646F71646F71E2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC99A8AC99A8
        AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8ACFFFFFFD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8
        E9EC}
      Visible = False
    end
    object imgChkbxUnChecked: TImage
      Left = 688
      Top = 48
      Width = 20
      Height = 20
      Picture.Data = {
        07544269746D617006030000424D060300000000000036000000280000001000
        00000F0000000100180000000000D00200000000000000000000000000000000
        0000D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8
        E9ECD8E9ECD8E9EC99A8ACE2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2EFF1E2EFF1
        E2EFF1E2EFF1E2EFF1E2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9ECD8E9EC99A8AC646F71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC646F71FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2EFF1FFFFFFD8
        E9ECD8E9ECD8E9EC99A8AC646F71646F71646F71646F71646F71646F71646F71
        646F71646F71646F71E2EFF1FFFFFFD8E9ECD8E9ECD8E9EC99A8AC99A8AC99A8
        AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8ACFFFFFFD8
        E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9EC}
      Visible = False
    end
    object lblJobRevenue: TLabel
      Left = 224
      Top = 57
      Width = 97
      Height = 13
      Caption = 'Job revenue centre'
    end
    object lblCopiesReceivedBy: TLabel
      Left = 328
      Top = 83
      Width = 104
      Height = 13
      Caption = 'lblCopiesReceivedBy'
    end
    object lblNonConformance: TLabel
      Left = 552
      Top = 60
      Width = 271
      Height = 17
      Caption = 'Non Conformance Issues exist for this job!!!'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblGDPRSignedStatement: TLabel
      Left = 552
      Top = 85
      Width = 213
      Height = 17
      Caption = 'GDPR Policy has not been signed!!'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Panel4: TPanel
      Left = 853
      Top = 48
      Width = 204
      Height = 59
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        204
        59)
      object btnOK: TBitBtn
        Left = 25
        Top = 28
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
        TabOrder = 0
        OnClick = btnOKClick
      end
      object btnCancel: TBitBtn
        Left = 113
        Top = 28
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnCancelClick
      end
    end
    object pnlProduction: TPanel
      Left = 1
      Top = 1
      Width = 1056
      Height = 47
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object lblCompleteBy: TLabel
        Left = 482
        Top = 26
        Width = 76
        Height = 13
        Caption = 'lblCompleteBy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblInvoiceThisWeekBy: TLabel
        Left = 250
        Top = 5
        Width = 110
        Height = 13
        Caption = 'lblInvoiceThisWeekBy'
      end
      object lblInvoiceThisWeekDate: TLabel
        Left = 138
        Top = 5
        Width = 123
        Height = 13
        Caption = 'lblInvoiceThisWeekDate'
      end
      object chkbxProductionComplete: TCheckBox
        Left = 10
        Top = 24
        Width = 311
        Height = 21
        Caption = 'Production is complete and was completed on date:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = chkbxProductionCompleteClick
      end
      object edtdateComplete: TEdit
        Left = 327
        Top = 24
        Width = 98
        Height = 21
        TabOrder = 1
        OnChange = CheckOK
        OnExit = edtdateCompleteExit
      end
      object btnDateComplete: TBitBtn
        Left = 444
        Top = 22
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
        TabOrder = 2
        OnClick = btnDateCompleteClick
      end
      object chkbxInvoiceThisWeek: TCheckBox
        Left = 10
        Top = 0
        Width = 119
        Height = 22
        Caption = 'Invoice This Week'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = chkbxInvoiceThisWeekClick
      end
    end
    object chkbxReadytoInvoice: TCheckBox
      Left = 11
      Top = 55
      Width = 198
      Height = 17
      Caption = 'This job is now ready for invoicing'
      TabOrder = 2
      OnClick = chkbxReadytoInvoiceClick
    end
    object dblkpJobRevenue: TDBLookupComboBox
      Left = 328
      Top = 53
      Width = 145
      Height = 21
      KeyField = 'Invoice_Location'
      ListField = 'Invoice_Location_Descr'
      ListSource = dmJobBag.srcInvoiceLoc
      TabOrder = 3
      OnClick = dblkpJobRevenueClick
    end
    object chkbxFileCopies: TCheckBox
      Left = 11
      Top = 81
      Width = 167
      Height = 17
      Caption = 'File Copies Received on date:'
      TabOrder = 4
      OnClick = chkbxFileCopiesClick
    end
    object edtDateCopiesReceived: TEdit
      Left = 183
      Top = 79
      Width = 98
      Height = 21
      TabOrder = 5
      OnChange = CheckOK
      OnExit = edtdateCompleteExit
    end
    object btnDateCopiesReceived: TBitBtn
      Left = 292
      Top = 77
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
      OnClick = btnDateCopiesReceivedClick
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 687
    Width = 1058
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 200
      end
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 434
    Width = 1058
    Height = 145
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    object btnNotes: TBitBtn
      Left = 11
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Notes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F777773FF333333008877700
        33333337733FFF773F33330887000777033333733F777FFF73F3308800000007
        703337F37777777FF7F33080000000007033373777777777F73F087000222000
        77037F3777333777FF7F08000222220007037F777F3333777F7F0F0002222200
        07037F777F3333777F7F0F000822220008037F777FF33377737F0F7000882000
        780373F777FFF777F373308000000000803337F77777777737F330F800000008
        8033373F777777733733330F8700078803333373FF77733F733333300FFF8800
        3333333773FFFF77333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnNotesClick
    end
    object Button1: TButton
      Left = 96
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Print'
      TabOrder = 1
      OnClick = Button1Click
    end
    object chkbxAuthorise: TCheckBox
      Left = 200
      Top = 116
      Width = 105
      Height = 17
      Caption = 'Authorise Job Bag'
      TabOrder = 2
    end
    object pnlOurTotals: TPanel
      Left = 819
      Top = 0
      Width = 239
      Height = 145
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 3
      DesignSize = (
        239
        145)
      object labCosts: TLabel
        Left = 66
        Top = 36
        Width = 56
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Total Costs'
      end
      object labSales: TLabel
        Left = 66
        Top = 54
        Width = 54
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Total Sales'
      end
      object labMargin: TLabel
        Left = 57
        Top = 72
        Width = 68
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Margin Value'
      end
      object LabMarginPerc: TLabel
        Left = 76
        Top = 88
        Width = 49
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Margin %'
      end
      object labTotalCost: TLabel
        Left = 154
        Top = 36
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'TotalsGoHere'
      end
      object labTotalSell: TLabel
        Left = 154
        Top = 54
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'TotalsGoHere'
      end
      object LabTotalMargin: TLabel
        Left = 154
        Top = 72
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'TotalsGoHere'
      end
      object labTotalMarginPerc: TLabel
        Left = 154
        Top = 88
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'TotalsGoHere'
      end
      object lblCompany: TLabel
        Left = 73
        Top = 8
        Width = 126
        Height = 17
        Alignment = taCenter
        Anchors = [akTop, akRight]
        Caption = 'Our Company Totals'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnlPackPrice: TPanel
        Left = 0
        Top = 115
        Width = 239
        Height = 30
        Align = alBottom
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          239
          30)
        object Label51: TLabel
          Left = 1
          Top = 6
          Width = 27
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Price:'
        end
        object labUnitSell: TLabel
          Left = 34
          Top = 6
          Width = 69
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object dblkpPriceUnit: TDBLookupComboBox
          Left = 107
          Top = 2
          Width = 90
          Height = 21
          Anchors = [akRight, akBottom]
          KeyField = 'Price_Unit'
          ListField = 'Description'
          TabOrder = 0
          OnClick = dblkpPriceUnitClick
        end
        object bitbtnPriceUnitClear: TBitBtn
          Left = 202
          Top = 1
          Width = 23
          Height = 23
          Hint = 'Clear'
          Anchors = [akRight, akBottom]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
    end
    object Panel5: TPanel
      Left = 361
      Top = 0
      Width = 21
      Height = 145
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 4
    end
    object pnlReseller: TPanel
      Left = 611
      Top = 0
      Width = 208
      Height = 145
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 5
      Visible = False
      DesignSize = (
        208
        145)
      object Label54: TLabel
        Left = 21
        Top = 37
        Width = 56
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Total Costs'
      end
      object Label55: TLabel
        Left = 21
        Top = 55
        Width = 54
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Total Sales'
      end
      object Label56: TLabel
        Left = 12
        Top = 73
        Width = 68
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Margin Value'
      end
      object Label57: TLabel
        Left = 31
        Top = 89
        Width = 49
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Margin %'
      end
      object reselTotalCost: TLabel
        Left = 125
        Top = 37
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'TotalsGoHere'
      end
      object reselTotalSell: TLabel
        Left = 125
        Top = 55
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'TotalsGoHere'
      end
      object reselTotalMargin: TLabel
        Left = 125
        Top = 73
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'TotalsGoHere'
      end
      object reselTotalMarginPerc: TLabel
        Left = 125
        Top = 89
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'TotalsGoHere'
      end
      object Label58: TLabel
        Left = 46
        Top = 8
        Width = 89
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Reseller Totals'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnlPackFormat: TPanel
      Left = 0
      Top = -2
      Width = 377
      Height = 109
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 6
      object Label59: TLabel
        Left = 16
        Top = 8
        Width = 62
        Height = 13
        Caption = 'Pack Format'
      end
      object dblkpPackFormat: TDBLookupComboBox
        Left = 16
        Top = 25
        Width = 170
        Height = 21
        KeyField = 'ID'
        ListField = 'Pack_Format_Description'
        ListSource = dmJobBag.dtsPackFormat
        TabOrder = 0
        OnClick = dblkpPackFormatClick
      end
      object btnPackFormat: TBitBtn
        Left = 192
        Top = 23
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnPackFormatClick
      end
      object rdgrpEnclosingType: TRadioGroup
        Left = 232
        Top = 8
        Width = 129
        Height = 97
        Caption = ' Enclosing '
        ItemIndex = 0
        Items.Strings = (
          'None'
          'Hand'
          'Machine'
          'Poly')
        ParentBackground = False
        TabOrder = 2
        OnClick = rdgrpEnclosingTypeClick
      end
    end
    object pnlRep: TPanel
      Left = 382
      Top = 0
      Width = 229
      Height = 145
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 7
      Visible = False
      DesignSize = (
        229
        145)
      object Label60: TLabel
        Left = 2
        Top = 37
        Width = 100
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Total Costs (Incl Int)'
      end
      object Label61: TLabel
        Left = 42
        Top = 55
        Width = 54
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Total Sales'
      end
      object Label62: TLabel
        Left = 33
        Top = 73
        Width = 68
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Margin Value'
      end
      object Label63: TLabel
        Left = 52
        Top = 89
        Width = 49
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Margin %'
      end
      object repTotalCost: TLabel
        Left = 146
        Top = 37
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'TotalsGoHere'
      end
      object RepTotalSell: TLabel
        Left = 146
        Top = 55
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'TotalsGoHere'
      end
      object RepTotalMargin: TLabel
        Left = 146
        Top = 73
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'TotalsGoHere'
      end
      object repTotalMarginPerc: TLabel
        Left = 146
        Top = 89
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'TotalsGoHere'
      end
      object Label68: TLabel
        Left = 67
        Top = 8
        Width = 78
        Height = 16
        Anchors = [akTop, akRight]
        Caption = 'Rep Totals'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1058
    Height = 66
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      1058
      66)
    object labJobBagInfo: TLabel
      Left = 9
      Top = 15
      Width = 61
      Height = 13
      Caption = 'Job Bag No.'
    end
    object Label4: TLabel
      Left = 172
      Top = 15
      Width = 24
      Height = 13
      Caption = 'Date'
    end
    object Label3: TLabel
      Left = 558
      Top = 15
      Width = 74
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Date Required'
      ExplicitLeft = 576
    end
    object Label25: TLabel
      Left = 383
      Top = 15
      Width = 51
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Start Date'
      ExplicitLeft = 401
    end
    object Label5: TLabel
      Left = 753
      Top = 15
      Width = 91
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Account Manager'
      ExplicitLeft = 771
    end
    object lblAccountteam: TLabel
      Left = 768
      Top = 44
      Width = 71
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Account Team'
      ExplicitLeft = 786
    end
    object edtJobBag: TEdit
      Left = 80
      Top = 11
      Width = 81
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtDate: TEdit
      Left = 204
      Top = 11
      Width = 81
      Height = 21
      TabOrder = 1
      OnExit = edtDateExit
    end
    object btnDate: TBitBtn
      Left = 291
      Top = 9
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
      TabOrder = 2
      OnClick = btnDateClick
    end
    object edtDateReq: TEdit
      Left = 634
      Top = 11
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 5
      OnChange = CheckOK
      OnExit = edtDateReqExit
    end
    object BitBtn2: TBitBtn
      Left = 720
      Top = 9
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
      TabOrder = 6
      OnClick = BitBtn2Click
    end
    object edtStartDate: TEdit
      Left = 436
      Top = 11
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      OnExit = edtDateExit
    end
    object BitBtn6: TBitBtn
      Left = 522
      Top = 9
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
      TabOrder = 4
      OnClick = BitBtn6Click
    end
    object edtAccountManager: TEdit
      Left = 848
      Top = 11
      Width = 115
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object btnAccountManager: TBitBtn
      Left = 971
      Top = 9
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = btnAccountManagerClick
    end
    object edtAccountTeam: TEdit
      Left = 848
      Top = 40
      Width = 115
      Height = 21
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 9
    end
  end
  object pnlEndUser: TPanel
    Left = 0
    Top = 209
    Width = 1058
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 6
    Visible = False
    DesignSize = (
      1058
      23)
    object Label53: TLabel
      Left = 8
      Top = 4
      Width = 46
      Height = 13
      Caption = 'End User'
    end
    object edtEndUser: TEdit
      Left = 80
      Top = 0
      Width = 445
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 0
    end
    object btnEndUser: TBitBtn
      Left = 537
      Top = -2
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnEndUserClick
    end
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 420
    Top = 108
  end
  object pmnDummy: TPopupMenu
    Left = 204
    Top = 265
  end
  object pmnFunctions: TPopupMenu
    OnPopup = pmnFunctionsPopup
    Left = 148
    Top = 225
    object mnuInsertexistingPO: TMenuItem
      Caption = 'Insert an existing PO'
      OnClick = btnAddPOClick
    end
    object mnuAddnewPO: TMenuItem
      Caption = 'Add a new PO'
      OnClick = btnNewClick
    end
    object mnuRepeatanexistingPO2: TMenuItem
      Caption = 'Repeat an existing PO'
      OnClick = RepeatanexistingPO1Click
    end
    object mnuConvert: TMenuItem
      Caption = 'Convert Enquiry to PO'
      OnClick = mnuConvertClick
    end
    object ConvertQuoteintoJob1: TMenuItem
      Caption = 'Convert Quote into Job'
      OnClick = ConvertQuoteintoJob1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnuAddProduction: TMenuItem
      Caption = 'Add Stock items'
      OnClick = btnProductionClick
    end
    object mnuAddWorksOrderCharge: TMenuItem
      Caption = 'Add DMS Charge'
      OnClick = btnExtrasClick
    end
    object mnuAddSundrycharge: TMenuItem
      Caption = 'Add Sundry charge'
      OnClick = btnAddClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object mnuChangeLine: TMenuItem
      Caption = 'Change'
      OnClick = btnChangeClick
    end
    object mnuCopy: TMenuItem
      Caption = 'Copy'
      OnClick = mnuCopyClick
    end
    object mnuDelete: TMenuItem
      Caption = 'Delete'
      OnClick = btnDeleteClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object miSendTo: TMenuItem
      Caption = 'Send to'
      object miExcel: TMenuItem
        Caption = 'Excel'
        OnClick = miExcelClick
      end
    end
  end
  object pmnPOrders: TPopupMenu
    Left = 204
    Top = 329
    object InsertanexistingPO1: TMenuItem
      Caption = '&Insert an existing PO'
      OnClick = btnAddPOClick
    end
    object add1: TMenuItem
      Caption = '&Add a new PO'
      OnClick = btnNewClick
    end
    object RepeatanexistingPO1: TMenuItem
      Caption = '&Repeat an existing PO'
      OnClick = RepeatanexistingPO1Click
    end
    object ConvertEnquirytoaPO1: TMenuItem
      Caption = 'Convert Enquiry to a PO'
      OnClick = mnuConvertClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object Change1: TMenuItem
      Caption = '&Change'
      OnClick = btnChangeClick
    end
    object Delete1: TMenuItem
      Caption = '&Delete'
      OnClick = btnDeleteClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object Print1: TMenuItem
      Caption = '&Print'
      OnClick = Print1Click
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object Delivery1: TMenuItem
      Caption = '&Delivery'
      OnClick = Delivery1Click
    end
    object miSendto1: TMenuItem
      Caption = 'Send to'
      object Excel1: TMenuItem
        Caption = 'Excel'
        OnClick = miExcelClick
      end
    end
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 544
    Top = 208
  end
  object pmnSOrders: TPopupMenu
    OnPopup = pmnSOrdersPopup
    Left = 300
    Top = 305
    object mnuChange: TMenuItem
      Caption = 'Change'
      OnClick = mnuChangeClick
    end
    object mnuPrintStockOrder: TMenuItem
      Caption = 'Print Stock Order'
      OnClick = mnuPrintStockOrderClick
    end
    object mnuEditDescription: TMenuItem
      Caption = 'Edit Description'
      OnClick = mnuEditDescriptionClick
    end
    object mnuEditSOPrices: TMenuItem
      Caption = 'Edit Prices and Quantities'
      OnClick = mnuEditSOPricesClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnuAllocate: TMenuItem
      Caption = 'Allocate Stock'
      OnClick = mnuAllocateClick
    end
    object mnuDeAllocate: TMenuItem
      Caption = 'De Allocate Stock'
      OnClick = mnuDeAllocateClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuPickingNote: TMenuItem
      Caption = 'Print Picking Note'
      OnClick = mnuPickingNoteClick
    end
    object mnuConfirm: TMenuItem
      Caption = 'Confirm Picking'
      OnClick = mnuConfirmClick
    end
    object mnuProduction: TMenuItem
      Caption = 'Complete Production'
      OnClick = mnuProductionClick
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object mnuReturnsReport: TMenuItem
      Caption = 'Returns Report'
      OnClick = mnuReturnsReportClick
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object miSendTo2: TMenuItem
      Caption = 'Send to ..'
      object Excel2: TMenuItem
        Caption = 'Excel'
        OnClick = miExcelClick
      end
    end
  end
  object DocOpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofAllowMultiSelect, ofEnableSizing]
    Left = 552
    Top = 120
  end
  object svDlgOfficeDoc: TSaveDialog
    Left = 217
    Top = 86
  end
  object pmnRequests: TPopupMenu
    OnPopup = pmnRequestsPopup
    Left = 388
    Top = 305
    object mnuRequestChange: TMenuItem
      Caption = 'Change'
      OnClick = mnuRequestChangeClick
    end
    object mnuRequestPrint: TMenuItem
      Caption = 'Print Stock Order'
      OnClick = mnuRequestPrintClick
    end
    object mnuRequestEditSOPrices: TMenuItem
      Caption = 'Edit Prices and Quantities'
      OnClick = mnuRequestEditSOPricesClick
    end
    object MenuItem5: TMenuItem
      Caption = '-'
    end
    object mnuRequestAllocate: TMenuItem
      Caption = 'Allocate Stock'
      OnClick = mnuRequestAllocateClick
    end
    object mnuRequestDeAllocate: TMenuItem
      Caption = 'De Allocate Stock'
      OnClick = mnuRequestDeAllocateClick
    end
    object MenuItem8: TMenuItem
      Caption = '-'
    end
    object mnuRequestPickNote: TMenuItem
      Caption = 'Print Picking Note'
      OnClick = mnuRequestPickNoteClick
    end
    object mnuRequestConfirm: TMenuItem
      Caption = 'Confirm Picking'
      OnClick = mnuRequestConfirmClick
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object miSendTo3: TMenuItem
      Caption = 'Send to ...'
      object Excel3: TMenuItem
        Caption = 'Excel'
        OnClick = Excel3Click
      end
    end
  end
  object pmnWorks: TPopupMenu
    OnPopup = pmnWorksPopup
    Left = 620
    Top = 329
    object pmniView: TMenuItem
      Caption = 'View'
      OnClick = btnChangeWorksClick
    end
    object pmniPrint: TMenuItem
      Caption = 'Print'
      OnClick = btnPrintWorksClick
    end
  end
  object imgIcons: TImageList
    Left = 32
    Top = 276
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF007F7F7F007F7F
      7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF007F7F7F000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF007F7F7F000000
      00007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      0000FFFF0000FFFF000000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F00FFFF
      0000FFFF0000FFFF000000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
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
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000000000000
      C000000000000000F000000000000000FC00000000000000FC01000000000000
      FC03000000000000FC07000000000000FFFFFFFFFFFF800180038003FFFF0000
      80018001FFFFC1FF8001800100009CFF800180010000BE7F800180010000B83F
      800180010000921F800180010000C30F800180010000E187800180010000F0C7
      800180010000F867800180010000FC33800180010000FE3B800180010000FF39
      80018001FFFFFF9BC007C007FFFFFFC700000000000000000000000000000000
      000000000000}
  end
  object pmnuDocuments: TPopupMenu
    Left = 30
    Top = 342
    object CreateExcelDocument1: TMenuItem
      Caption = 'Create Excel Document'
      OnClick = btnExcelClick
    end
    object CreateWordDocument1: TMenuItem
      Caption = 'Create Word Document'
      OnClick = btnExcelClick
    end
    object Email1: TMenuItem
      Caption = 'Create Email'
      OnClick = btnEmailClick
    end
    object Adddocument1: TMenuItem
      Caption = 'Attach Document'
      OnClick = btnAttachClick
    end
    object MenuItem1: TMenuItem
      Caption = '-'
    end
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
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object pmnuSelectAll: TMenuItem
      Caption = 'Select All'
    end
  end
  object imgDocuments: TImageList
    Left = 96
    Top = 284
  end
  object pmnuSI: TPopupMenu
    Left = 692
    Top = 288
    object pmnuViewSI: TMenuItem
      Caption = 'View'
      OnClick = btnViewSIClick
    end
    object pmnuRePrintSI: TMenuItem
      Caption = 'Re-Print'
      OnClick = btnRePrintSIClick
    end
  end
  object pmnuPI: TPopupMenu
    Left = 780
    Top = 400
    object pmnuViewPI: TMenuItem
      Caption = 'View'
      OnClick = btnViewPIClick
    end
  end
end
