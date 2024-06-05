object PBAutoPODetsFrm: TPBAutoPODetsFrm
  Left = 84
  Top = 1
  BorderStyle = bsDialog
  Caption = 'Create Purchase Order From Enquiry'
  ClientHeight = 565
  ClientWidth = 657
  Color = clBtnFace
  Constraints.MinHeight = 581
  Constraints.MinWidth = 634
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object pnlCustomer: TPanel
    Left = 0
    Top = 0
    Width = 657
    Height = 40
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 1
    ExplicitWidth = 738
    object EnqLabel: TLabel
      Left = 8
      Top = 4
      Width = 47
      Height = 13
      Caption = 'EnqLabel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object CustomerLabel: TLabel
      Left = 8
      Top = 22
      Width = 76
      Height = 13
      Caption = 'CustomerLabel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 384
      Top = 17
      Width = 108
      Height = 13
      Caption = 'Expected Life (weeks)'
      Visible = False
    end
    object ExpectedLifeSpinEdit: TSpinEdit
      Left = 544
      Top = 8
      Width = 57
      Height = 22
      MaxValue = 52
      MinValue = 0
      TabOrder = 0
      Value = 1
      Visible = False
    end
  end
  object pnlOrderQty: TPanel
    Left = 0
    Top = 40
    Width = 657
    Height = 40
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 63
    ExplicitWidth = 738
    object Label4: TLabel
      Left = 8
      Top = 13
      Width = 77
      Height = 13
      Caption = 'Order Quantity'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object QtyDBLCB: TDBLookupComboBox
      Left = 104
      Top = 9
      Width = 97
      Height = 21
      KeyField = 'Quantity'
      ListField = 'Quantity'
      ListSource = PBAutoPODM.QtysSRC
      TabOrder = 0
      OnClick = QtyDBLCBClick
    end
  end
  object pnlFunctions: TPanel
    Left = 0
    Top = 527
    Width = 657
    Height = 38
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 504
    ExplicitWidth = 738
    object OKBitBtn: TBitBtn
      Left = 472
      Top = 6
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = OKBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 560
      Top = 6
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object pnlRunOnQty: TPanel
    Left = 0
    Top = 80
    Width = 657
    Height = 40
    Align = alTop
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 622
    object Label3: TLabel
      Left = 8
      Top = 12
      Width = 77
      Height = 13
      Caption = 'Order Quantity'
    end
    object Label12: TLabel
      Left = 424
      Top = 12
      Width = 37
      Height = 13
      Caption = 'RunOn'
    end
    object Label13: TLabel
      Left = 216
      Top = 12
      Width = 86
      Height = 13
      Caption = 'Quoted Quantity'
    end
    object spedtQty: TSpinEdit
      Left = 104
      Top = 7
      Width = 97
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      OnChange = spedtQtyChange
    end
    object edtQty: TEdit
      Left = 312
      Top = 8
      Width = 97
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = 'edtQty'
    end
    object edtRunOnQty: TEdit
      Left = 472
      Top = 8
      Width = 97
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = 'Edit1'
    end
  end
  object pnlOrder: TPanel
    Left = 0
    Top = 233
    Width = 657
    Height = 158
    Align = alClient
    ParentBackground = False
    TabOrder = 4
    ExplicitWidth = 738
    ExplicitHeight = 160
    object Label1: TLabel
      Left = 8
      Top = 61
      Width = 74
      Height = 13
      Caption = 'Cust Order No'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DatePointLabel: TLabel
      Left = 8
      Top = 20
      Width = 57
      Height = 13
      Caption = 'Order Date'
    end
    object Label10: TLabel
      Left = 433
      Top = 12
      Width = 85
      Height = 52
      Caption = 'Date required from Supplier'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 9
      Top = 92
      Width = 70
      Height = 13
      Caption = 'Supplier Desc'
    end
    object Label5: TLabel
      Left = 9
      Top = 124
      Width = 76
      Height = 13
      Caption = 'Customer Desc'
    end
    object Label14: TLabel
      Left = 225
      Top = 12
      Width = 74
      Height = 26
      Caption = 'Date required by Customer'
      WordWrap = True
    end
    object CustOrdEdit: TEdit
      Left = 104
      Top = 57
      Width = 193
      Height = 21
      MaxLength = 40
      TabOrder = 5
      OnChange = CustOrdEditChange
    end
    object DateEdit: TEdit
      Left = 104
      Top = 16
      Width = 81
      Height = 21
      MaxLength = 10
      TabOrder = 0
      OnExit = DateEditExit
    end
    object ProofsGrpBox: TGroupBox
      Left = 392
      Top = 62
      Width = 243
      Height = 78
      ParentBackground = False
      TabOrder = 8
      object ProofByLabel: TLabel
        Left = 36
        Top = 25
        Width = 11
        Height = 13
        Caption = 'By'
      end
      object ProofStatLabel: TLabel
        Left = 12
        Top = 52
        Width = 32
        Height = 13
        Caption = 'Status'
      end
      object ProofsDateEdit: TEdit
        Left = 60
        Top = 21
        Width = 81
        Height = 21
        TabStop = False
        MaxLength = 10
        TabOrder = 0
        OnExit = ProofsDateEditExit
      end
      object ProofStatDBLUCB: TDBLookupComboBox
        Left = 61
        Top = 48
        Width = 172
        Height = 21
        KeyField = 'Proof_Status'
        ListField = 'Description'
        ListSource = PBAutoPODM.ProofStatSRC
        TabOrder = 2
        OnClick = ProofStatDBLUCBClick
      end
      object ProofDateBtn: TBitBtn
        Left = 146
        Top = 21
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
        TabOrder = 1
        OnClick = SelDateBtnClick
      end
    end
    object ReqByDateEdit: TEdit
      Left = 524
      Top = 16
      Width = 81
      Height = 21
      TabStop = False
      MaxLength = 10
      TabOrder = 3
      OnExit = ReqByDateEditExit
    end
    object SuppDescEdit: TEdit
      Left = 104
      Top = 88
      Width = 273
      Height = 21
      MaxLength = 20
      TabOrder = 6
      OnChange = SuppDescEditChange
    end
    object CustDescEdit: TEdit
      Left = 104
      Top = 120
      Width = 273
      Height = 21
      MaxLength = 40
      TabOrder = 7
      OnChange = CustDescEditChange
    end
    object CustReqDateEdit: TEdit
      Left = 304
      Top = 16
      Width = 81
      Height = 21
      TabStop = False
      MaxLength = 10
      TabOrder = 1
      OnChange = CustReqDateEditChange
      OnEnter = CustReqDateEditEnter
      OnExit = CustReqDateEditExit
    end
    object SelDateBtn: TBitBtn
      Left = 192
      Top = 16
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
      TabOrder = 9
      OnClick = SelDateBtnClick
    end
    object ReqByDateLUBtn: TBitBtn
      Left = 612
      Top = 16
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
      TabOrder = 4
      OnClick = ReqByDateLUBtnClick
    end
    object CustReqDateBtn: TBitBtn
      Left = 392
      Top = 16
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
      OnClick = CustReqDateBtnClick
    end
    object ProofsReqChkBox: TCheckBox
      Left = 400
      Top = 55
      Width = 102
      Height = 17
      Caption = 'Proofs required'
      TabOrder = 10
      OnClick = ProofsReqChkBoxClick
    end
  end
  object pnlDelivery: TPanel
    Left = 0
    Top = 391
    Width = 657
    Height = 136
    Align = alBottom
    ParentBackground = False
    TabOrder = 5
    ExplicitTop = 369
    ExplicitWidth = 622
    object AddrTypeRadGrp: TRadioGroup
      Left = 7
      Top = 6
      Width = 105
      Height = 123
      Caption = 'Deliver To'
      Items.Strings = (
        'Ad Hoc'
        'Supplier'
        'Rep'
        'Customer'
        'Company')
      ParentBackground = False
      TabOrder = 0
      OnClick = AddrTypeRadGrpClick
    end
    object AddrGrpBox: TGroupBox
      Left = 118
      Top = 6
      Width = 259
      Height = 123
      Caption = 'Delivery Address'
      ParentBackground = False
      TabOrder = 1
      object mmDeliveryAddress: TMemo
        Left = 8
        Top = 16
        Width = 249
        Height = 105
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Centrereed Ltd.'
          'Head Office'
          'Thames House'
          'Thames Street'
          'Rotherham'
          'South Yorkshire S61 1SQ')
        ParentFont = False
        TabOrder = 0
      end
      object spdbtnLUCust: TButton
        Left = 222
        Top = 15
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = spdbtnLUCustClick
      end
    end
    object DeliveryToStockChk: TCheckBox
      Left = 384
      Top = 16
      Width = 129
      Height = 17
      Caption = 'Delivery in to stock'
      TabOrder = 2
      OnClick = DeliveryToStockChkClick
    end
    object chkbxInvoiceUpfront: TCheckBox
      Left = 384
      Top = 40
      Width = 129
      Height = 17
      Caption = 'Invoice Upfront'
      TabOrder = 3
    end
  end
  object pnlSupplier: TPanel
    Left = 0
    Top = 120
    Width = 657
    Height = 57
    Align = alTop
    ParentBackground = False
    TabOrder = 6
    ExplicitWidth = 622
    object SuppLabel: TLabel
      Left = 8
      Top = 6
      Width = 88
      Height = 13
      Caption = 'Supplier/Branch: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 30
      Width = 40
      Height = 13
      Caption = 'Contact'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object ContactDBLookupComboBox: TDBLookupComboBox
      Left = 104
      Top = 26
      Width = 257
      Height = 21
      KeyField = 'Contact_no'
      ListField = 'Name'
      ListSource = PBAutoPODM.ContactSRC
      TabOrder = 0
      OnClick = ContactDBLookupComboBoxClick
    end
    object SelContactBtn: TButton
      Left = 368
      Top = 25
      Width = 25
      Height = 25
      Caption = '...'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = SelContactBtnClick
    end
  end
  object pnlPrices: TPanel
    Left = 0
    Top = 177
    Width = 657
    Height = 56
    Align = alTop
    ParentBackground = False
    TabOrder = 7
    ExplicitWidth = 622
    object Label6: TLabel
      Left = 8
      Top = 13
      Width = 57
      Height = 13
      Caption = 'Order Price'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object PriceLbl: TLabel
      Left = 104
      Top = 37
      Width = 39
      Height = 13
      Caption = 'PriceLbl'
      Visible = False
    end
    object Label8: TLabel
      Left = 208
      Top = 13
      Width = 62
      Height = 13
      Caption = 'Selling Price'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object SellLbl: TLabel
      Left = 288
      Top = 37
      Width = 33
      Height = 13
      Caption = 'SellLbl'
      Visible = False
    end
    object Label9: TLabel
      Left = 408
      Top = 13
      Width = 44
      Height = 13
      Caption = 'List Price'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object ListLbl: TLabel
      Left = 472
      Top = 37
      Width = 30
      Height = 13
      Caption = 'Listlbl'
      Visible = False
    end
    object OrdPriceMemo: TMemo
      Left = 104
      Top = 8
      Width = 73
      Height = 25
      Alignment = taRightJustify
      TabOrder = 0
      WantReturns = False
      OnEnter = SaveValue
      OnExit = ValidateMoney
    end
    object SellPriceMemo: TMemo
      Left = 288
      Top = 8
      Width = 73
      Height = 25
      Alignment = taRightJustify
      TabOrder = 1
      WantReturns = False
      OnEnter = SaveValue
      OnExit = ValidateMoney
    end
    object ListPriceMemo: TMemo
      Left = 472
      Top = 8
      Width = 73
      Height = 25
      Alignment = taRightJustify
      TabOrder = 2
      Visible = False
      WantReturns = False
      OnEnter = SaveValue
      OnExit = ValidateMoney
    end
  end
end
