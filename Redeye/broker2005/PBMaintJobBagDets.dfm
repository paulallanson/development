object PBMaintJobBagDetsFrm: TPBMaintJobBagDetsFrm
  Left = 94
  Top = 70
  AutoScroll = False
  Caption = 'Job Bag Details'
  ClientHeight = 553
  ClientWidth = 789
  Color = clBtnFace
  Constraints.MinHeight = 580
  Constraints.MinWidth = 797
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 789
    Height = 169
    Align = alTop
    TabOrder = 0
    DesignSize = (
      789
      169)
    object Label2: TLabel
      Left = 8
      Top = 38
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object Label3: TLabel
      Left = 333
      Top = 12
      Width = 69
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Date Required'
    end
    object Label4: TLabel
      Left = 176
      Top = 12
      Width = 23
      Height = 13
      Caption = 'Date'
    end
    object labJobBagInfo: TLabel
      Left = 9
      Top = 12
      Width = 59
      Height = 13
      Caption = 'Job Bag No.'
    end
    object Label5: TLabel
      Left = 534
      Top = 12
      Width = 85
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Account Manager'
    end
    object Label6: TLabel
      Left = 8
      Top = 64
      Width = 37
      Height = 13
      Caption = 'Contact'
    end
    object Label1: TLabel
      Left = 8
      Top = 116
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object Label7: TLabel
      Left = 526
      Top = 66
      Width = 93
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Customer Order Ref'
    end
    object Label8: TLabel
      Left = 580
      Top = 92
      Width = 39
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Quantity'
    end
    object Label9: TLabel
      Left = 8
      Top = 90
      Width = 20
      Height = 13
      Caption = 'Rep'
    end
    object Label10: TLabel
      Left = 549
      Top = 38
      Width = 70
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Account Team'
    end
    object Label11: TLabel
      Left = 8
      Top = 140
      Width = 50
      Height = 13
      Caption = 'Reference'
    end
    object Label12: TLabel
      Left = 539
      Top = 140
      Width = 83
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Works Instruction'
    end
    object edtDate: TEdit
      Left = 208
      Top = 8
      Width = 81
      Height = 21
      TabOrder = 1
      OnExit = edtDateExit
    end
    object edtDateReq: TEdit
      Left = 413
      Top = 8
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      OnExit = edtDateReqExit
    end
    object edtCustomer: TEdit
      Left = 80
      Top = 34
      Width = 273
      Height = 21
      ReadOnly = True
      TabOrder = 8
    end
    object BitBtn1: TBitBtn
      Left = 360
      Top = 32
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 501
      Top = 6
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 4
      OnClick = BitBtn2Click
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
    object BitBtn3: TBitBtn
      Left = 296
      Top = 6
      Width = 25
      Height = 25
      TabOrder = 2
      OnClick = BitBtn3Click
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
    object BitBtn4: TBitBtn
      Left = 296
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
      TabOrder = 11
      OnClick = BitBtn4Click
    end
    object edtDescription: TEdit
      Left = 80
      Top = 112
      Width = 425
      Height = 21
      TabOrder = 14
      OnChange = CheckOK
    end
    object edtJobBag: TEdit
      Left = 80
      Top = 8
      Width = 81
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object dblkpCustomerContact: TDBLookupComboBox
      Left = 80
      Top = 60
      Width = 209
      Height = 21
      KeyField = 'Contact_no'
      ListField = 'Name'
      ListSource = dmJobBag.srcCustContact
      TabOrder = 10
      OnClick = dblkpCustomerContactClick
    end
    object edtCustOrderNo: TEdit
      Left = 629
      Top = 62
      Width = 132
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 16
      OnChange = CheckOK
    end
    object memQuantity: TMemo
      Left = 629
      Top = 87
      Width = 81
      Height = 23
      Anchors = [akTop, akRight]
      TabOrder = 17
      OnChange = CheckOK
      OnEnter = memQuantityEnter
      OnExit = ValidateQty
      OnKeyPress = memQuantityKeyPress
    end
    object dblkpRep: TDBLookupComboBox
      Left = 80
      Top = 86
      Width = 160
      Height = 21
      KeyField = 'Rep'
      ListField = 'Name'
      ListSource = dmJobBag.srcCustReps
      TabOrder = 12
      OnClick = dblkpRepClick
    end
    object BitBtn5: TBitBtn
      Left = 245
      Top = 84
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
      OnClick = BitBtn5Click
    end
    object edtAccountTeam: TEdit
      Left = 629
      Top = 34
      Width = 115
      Height = 21
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object btnAccountManager: TBitBtn
      Left = 752
      Top = 6
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
      TabOrder = 6
      OnClick = btnAccountManagerClick
    end
    object edtAccountManager: TEdit
      Left = 629
      Top = 8
      Width = 115
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object edtDescriptiveRef: TEdit
      Left = 80
      Top = 136
      Width = 193
      Height = 21
      TabOrder = 15
      OnChange = CheckOK
    end
    object btnWorksOrders: TBitBtn
      Left = 752
      Top = 134
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
      TabOrder = 18
    end
    object btnShowWO: TBitBtn
      Left = 720
      Top = 134
      Width = 25
      Height = 25
      Hint = 'Show Works Instruction'
      Anchors = [akTop, akRight]
      Enabled = False
      TabOrder = 19
      OnClick = btnShowWOClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333FF3333333333333003333
        3333333333773FF3333333333309003333333333337F773FF333333333099900
        33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
        99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
        33333333337F3F77333333333309003333333333337F77333333333333003333
        3333333333773333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object cmbJobBagWo: TComboBox
      Left = 632
      Top = 136
      Width = 81
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 20
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 169
    Width = 789
    Height = 326
    ActivePage = tsOrders
    Align = alClient
    TabOrder = 1
    object tsOrders: TTabSheet
      Caption = 'Orders'
      object Panel1: TPanel
        ParentBackground = False
        Left = 681
        Top = 0
        Width = 100
        Height = 227
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object FuncGrpBox: TGroupBox
          ParentBackground = False
          Left = 6
          Top = -5
          Width = 83
          Height = 224
          TabOrder = 0
          object btnAdd: TBitBtn
            Left = 4
            Top = 150
            Width = 75
            Height = 25
            Hint = 'Add a new sundry item'
            Caption = 'Sundries'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = btnAddClick
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
          end
          object btnDelete: TBitBtn
            Left = 4
            Top = 179
            Width = 75
            Height = 25
            Hint = 'Delete the selected job bag item'
            Caption = '&Delete'
            TabOrder = 6
            OnClick = btnDeleteClick
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
          end
          object btnChange: TBitBtn
            Left = 4
            Top = 64
            Width = 75
            Height = 25
            Hint = 'Change the selected job bag item'
            Caption = '&Change'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btnChangeClick
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
          end
          object btnAddPO: TBitBtn
            Left = 4
            Top = 7
            Width = 75
            Height = 25
            Hint = 'Insert an existing purchase order'
            Caption = '&Insert'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = btnAddPOClick
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
          end
          object btnNew: TBitBtn
            Left = 4
            Top = 35
            Width = 75
            Height = 25
            Hint = 'Create a new purchase order'
            Caption = '&New'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnNewClick
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
          end
          object btnStock: TBitBtn
            Left = 4
            Top = 93
            Width = 75
            Height = 25
            Hint = 'Add a new stock call off item'
            Caption = '&Stock'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = btnStockClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333300333
              33333333333773FF333333333330F0033333333333373773FF333333330FFFF0
              03333333337F333773FF3333330FFFFFF003333333733FF33773333330FF00FF
              FF80333337F3773F3337333330FFFF0FFFF03FFFF7FFF3733F3700000000FFFF
              0FF0777777773FF373370000000000FFFFF07FFFFFF377FFF3370CCCCC000000
              FF037777773337773F7300CCC000003300307F77733337F37737000C00000033
              33307F373333F7F333370000007B703333307FFFF337F7F33337099900BBB033
              33307777F37777FF33370999007B700333037777F3373773FF73099900000030
              00337777FFFFF7F7773300000000003333337777777777333333}
            NumGlyphs = 2
          end
          object btnExtras: TBitBtn
            Left = 4
            Top = 121
            Width = 75
            Height = 25
            Hint = 'Add DMS charges'
            Caption = 'DMS'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = btnExtrasClick
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
          end
        end
      end
      object Panel5: TPanel
        ParentBackground = False
        Left = 0
        Top = 0
        Width = 681
        Height = 227
        Align = alClient
        Caption = 'Panel5'
        TabOrder = 1
        object dbgLines: TDBGrid
          Left = 1
          Top = 1
          Width = 679
          Height = 225
          Align = alClient
          DataSource = dmJobBag.dsJBAllLines
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = pmnFunctions
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dbgLinesDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Job_Bag_Line'
              Title.Caption = 'Line'
              Width = 29
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'OrderNumber'
              Title.Caption = 'Order No'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Job_Bag_Line_Descr'
              Title.Caption = 'Description'
              Width = 209
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Job_Bag_Quantity'
              Title.Caption = 'Quantity'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Job_Bag_Line_Cost'
              Title.Caption = 'Cost'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Job_Bag_Line_Sell'
              Title.Caption = 'Sell'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Margin'
              Title.Caption = 'Margin %'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Inactive'
              Title.Caption = 'Status'
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SupplierName'
              ReadOnly = True
              Title.Caption = 'Supplier'
              Width = 200
              Visible = True
            end>
        end
      end
      object Panel3: TPanel
        ParentBackground = False
        Left = 0
        Top = 227
        Width = 781
        Height = 71
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          781
          71)
        object labCosts: TLabel
          Left = 616
          Top = 3
          Width = 53
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Total Costs'
        end
        object labSales: TLabel
          Left = 617
          Top = 21
          Width = 53
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Total Sales'
        end
        object labMargin: TLabel
          Left = 608
          Top = 39
          Width = 62
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Margin Value'
        end
        object LabMarginPerc: TLabel
          Left = 628
          Top = 55
          Width = 43
          Height = 13
          Anchors = [akRight, akBottom]
          Caption = 'Margin %'
        end
        object labTotalCost: TLabel
          Left = 701
          Top = 3
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object labTotalSell: TLabel
          Left = 701
          Top = 21
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object LabTotalMargin: TLabel
          Left = 701
          Top = 39
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object labTotalMarginPerc: TLabel
          Left = 701
          Top = 55
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = 'TotalsGoHere'
        end
        object btnPrint: TBitBtn
          Left = 96
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Print'
          TabOrder = 0
          OnClick = btnPrintClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
            8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
            8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
            8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
        end
        object chkbxReadytoInvoice: TCheckBox
          Left = 11
          Top = 48
          Width = 230
          Height = 17
          Caption = 'This job is now ready for invoicing'
          TabOrder = 1
        end
        object btnNotes: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Notes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnNotesClick
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
        end
      end
    end
  end
  object Panel2: TPanel
    ParentBackground = False
    Left = 0
    Top = 495
    Width = 789
    Height = 39
    Align = alBottom
    TabOrder = 2
    object Panel4: TPanel
      ParentBackground = False
      Left = 397
      Top = 1
      Width = 391
      Height = 37
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        391
        37)
      object btnOK: TBitBtn
        Left = 212
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'OK'
        Default = True
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
      object btnCancel: TBitBtn
        Left = 300
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        TabOrder = 1
        OnClick = btnCancelClick
        Kind = bkCancel
      end
    end
    object chkbxInactive: TCheckBox
      Left = 16
      Top = 14
      Width = 177
      Height = 17
      Caption = 'Job bag is cancelled'
      TabOrder = 1
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 534
    Width = 789
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 124
    Top = 332
  end
  object pmnSOrders: TPopupMenu
    OnPopup = pmnSOrdersPopup
    Left = 388
    Top = 233
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
      OnClick = mnueditDescriptionClick
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
  end
  object pmnDummy: TPopupMenu
    Left = 476
    Top = 233
  end
  object pmnFunctions: TPopupMenu
    OnPopup = pmnFunctionsPopup
    Left = 580
    Top = 233
    object mnuInsertexistingPO: TMenuItem
      Caption = 'Insert an existing PO'
      OnClick = btnAddPOClick
    end
    object mnuAddnewPO: TMenuItem
      Caption = 'Add a new PO'
      OnClick = btnNewClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnuAddStockitems: TMenuItem
      Caption = 'Add Stock items'
      OnClick = btnStockClick
    end
    object mnuAddWorksOrderCharge: TMenuItem
      Caption = 'Add Works Order Charge'
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
    object mnuPrint: TMenuItem
      Caption = 'Print'
      OnClick = btnPrintClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object mnuDelete: TMenuItem
      Caption = 'Delete'
      OnClick = btnDeleteClick
    end
  end
  object pmnPOrders: TPopupMenu
    Left = 388
    Top = 297
    object InsertanexistingPO1: TMenuItem
      Caption = '&Insert an existing PO'
      OnClick = btnAddPOClick
    end
    object add1: TMenuItem
      Caption = '&Add a new PO'
      OnClick = btnNewClick
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
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 232
    Top = 320
  end
end
