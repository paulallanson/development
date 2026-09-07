object PBAutoPODetsFrm: TPBAutoPODetsFrm
  Left = 84
  Top = 1
  BorderStyle = bsDialog
  Caption = 'Create Purchase Order From Enquiry'
  ClientHeight = 606
  ClientWidth = 682
  Color = clBtnFace
  Constraints.MinHeight = 581
  Constraints.MinWidth = 634
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 17
  object pnlCustomer: TPanel
    Left = 0
    Top = 0
    Width = 682
    Height = 57
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 657
    object EnqLabel: TLabel
      Left = 8
      Top = 7
      Width = 53
      Height = 17
      Caption = 'EnqLabel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object CustomerLabel: TLabel
      Left = 8
      Top = 30
      Width = 87
      Height = 17
      Caption = 'CustomerLabel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 384
      Top = 30
      Width = 124
      Height = 17
      Caption = 'Expected Life (weeks)'
      Visible = False
    end
    object ExpectedLifeSpinEdit: TSpinEdit
      Left = 538
      Top = 24
      Width = 57
      Height = 27
      MaxValue = 52
      MinValue = 0
      TabOrder = 0
      Value = 1
      Visible = False
    end
  end
  object pnlOrderQty: TPanel
    Left = 0
    Top = 57
    Width = 682
    Height = 40
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 40
    ExplicitWidth = 651
    object Label4: TLabel
      Left = 8
      Top = 13
      Width = 87
      Height = 17
      Caption = 'Order Quantity'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object QtyDBLCB: TDBLookupComboBox
      Left = 104
      Top = 9
      Width = 97
      Height = 25
      KeyField = 'Quantity'
      ListField = 'Quantity'
      ListSource = PBAutoPODM.QtysSRC
      TabOrder = 0
      OnClick = QtyDBLCBClick
    end
  end
  object pnlFunctions: TPanel
    Left = 0
    Top = 568
    Width = 682
    Height = 38
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 518
    ExplicitWidth = 651
    object OKBitBtn: TBitBtn
      Left = 479
      Top = 9
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = OKBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 567
      Top = 9
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object pnlRunOnQty: TPanel
    Left = 0
    Top = 97
    Width = 682
    Height = 40
    Align = alTop
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 80
    ExplicitWidth = 651
    object Label3: TLabel
      Left = 8
      Top = 10
      Width = 87
      Height = 17
      Caption = 'Order Quantity'
    end
    object Label12: TLabel
      Left = 452
      Top = 10
      Width = 39
      Height = 17
      Caption = 'RunOn'
    end
    object Label13: TLabel
      Left = 229
      Top = 10
      Width = 96
      Height = 17
      Caption = 'Quoted Quantity'
    end
    object spedtQty: TSpinEdit
      Left = 104
      Top = 5
      Width = 97
      Height = 27
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      OnChange = spedtQtyChange
    end
    object edtQty: TEdit
      Left = 340
      Top = 6
      Width = 97
      Height = 25
      ReadOnly = True
      TabOrder = 1
      Text = 'edtQty'
    end
    object edtRunOnQty: TEdit
      Left = 500
      Top = 6
      Width = 97
      Height = 25
      ReadOnly = True
      TabOrder = 2
      Text = 'Edit1'
    end
  end
  object pnlOrder: TPanel
    Left = 0
    Top = 250
    Width = 682
    Height = 173
    Align = alClient
    ParentBackground = False
    TabOrder = 4
    ExplicitTop = 233
    ExplicitWidth = 651
    ExplicitHeight = 149
    object Label1: TLabel
      Left = 6
      Top = 69
      Width = 86
      Height = 17
      Caption = 'Cust Order No'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DatePointLabel: TLabel
      Left = 8
      Top = 20
      Width = 66
      Height = 17
      Caption = 'Order Date'
    end
    object Label10: TLabel
      Left = 463
      Top = 12
      Width = 85
      Height = 37
      Caption = 'Date required from Supplier'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 7
      Top = 100
      Width = 80
      Height = 17
      Caption = 'Supplier Desc'
    end
    object Label5: TLabel
      Left = 7
      Top = 132
      Width = 88
      Height = 17
      Caption = 'Customer Desc'
    end
    object Label14: TLabel
      Left = 239
      Top = 12
      Width = 83
      Height = 39
      Caption = 'Date required by Customer'
      WordWrap = True
    end
    object CustOrdEdit: TEdit
      Left = 102
      Top = 65
      Width = 193
      Height = 25
      MaxLength = 40
      TabOrder = 5
      OnChange = CustOrdEditChange
    end
    object DateEdit: TEdit
      Left = 104
      Top = 16
      Width = 81
      Height = 25
      MaxLength = 10
      TabOrder = 0
      OnExit = DateEditExit
    end
    object ProofsGrpBox: TGroupBox
      Left = 424
      Top = 78
      Width = 243
      Height = 78
      ParentBackground = False
      TabOrder = 8
      object ProofByLabel: TLabel
        Left = 36
        Top = 25
        Width = 13
        Height = 17
        Caption = 'By'
      end
      object ProofStatLabel: TLabel
        Left = 12
        Top = 52
        Width = 35
        Height = 17
        Caption = 'Status'
      end
      object ProofsDateEdit: TEdit
        Left = 60
        Top = 21
        Width = 81
        Height = 25
        TabStop = False
        MaxLength = 10
        TabOrder = 0
        OnExit = ProofsDateEditExit
      end
      object ProofStatDBLUCB: TDBLookupComboBox
        Left = 61
        Top = 48
        Width = 172
        Height = 25
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
      Left = 554
      Top = 16
      Width = 81
      Height = 25
      TabStop = False
      MaxLength = 10
      TabOrder = 3
      OnExit = ReqByDateEditExit
    end
    object SuppDescEdit: TEdit
      Left = 102
      Top = 96
      Width = 273
      Height = 25
      MaxLength = 20
      TabOrder = 6
      OnChange = SuppDescEditChange
    end
    object CustDescEdit: TEdit
      Left = 102
      Top = 128
      Width = 273
      Height = 25
      MaxLength = 40
      TabOrder = 7
      OnChange = CustDescEditChange
    end
    object CustReqDateEdit: TEdit
      Left = 328
      Top = 16
      Width = 81
      Height = 25
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
      Left = 642
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
      Left = 416
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
      Left = 436
      Top = 68
      Width = 117
      Height = 17
      Caption = 'Proofs required'
      TabOrder = 10
      OnClick = ProofsReqChkBoxClick
    end
  end
  object pnlDelivery: TPanel
    Left = 0
    Top = 423
    Width = 682
    Height = 145
    Align = alBottom
    ParentBackground = False
    TabOrder = 5
    ExplicitTop = 424
    object AddrTypeRadGrp: TRadioGroup
      Left = 7
      Top = 6
      Width = 105
      Height = 131
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
      Height = 131
      Caption = 'Delivery Address'
      ParentBackground = False
      TabOrder = 1
      object mmDeliveryAddress: TMemo
        Left = 8
        Top = 16
        Width = 249
        Height = 112
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
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
    Top = 137
    Width = 682
    Height = 57
    Align = alTop
    ParentBackground = False
    TabOrder = 6
    ExplicitTop = 120
    ExplicitWidth = 651
    object SuppLabel: TLabel
      Left = 8
      Top = 6
      Width = 99
      Height = 17
      Caption = 'Supplier/Branch: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 30
      Width = 44
      Height = 17
      Caption = 'Contact'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object ContactDBLookupComboBox: TDBLookupComboBox
      Left = 104
      Top = 26
      Width = 257
      Height = 25
      KeyField = 'Contact_no'
      ListField = 'Name'
      ListSource = PBAutoPODM.ContactSRC
      TabOrder = 0
      OnClick = ContactDBLookupComboBoxClick
    end
    object SelContactBtn: TButton
      Left = 368
      Top = 26
      Width = 25
      Height = 25
      Caption = '...'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = SelContactBtnClick
    end
  end
  object pnlPrices: TPanel
    Left = 0
    Top = 194
    Width = 682
    Height = 56
    Align = alTop
    ParentBackground = False
    TabOrder = 7
    ExplicitTop = 177
    ExplicitWidth = 651
    object Label6: TLabel
      Left = 8
      Top = 12
      Width = 67
      Height = 17
      Caption = 'Order Price'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object PriceLbl: TLabel
      Left = 104
      Top = 37
      Width = 45
      Height = 17
      Caption = 'PriceLbl'
      Visible = False
    end
    object Label8: TLabel
      Left = 208
      Top = 12
      Width = 70
      Height = 17
      Caption = 'Selling Price'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object SellLbl: TLabel
      Left = 288
      Top = 37
      Width = 37
      Height = 17
      Caption = 'SellLbl'
      Visible = False
    end
    object Label9: TLabel
      Left = 408
      Top = 12
      Width = 51
      Height = 17
      Caption = 'List Price'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object ListLbl: TLabel
      Left = 472
      Top = 37
      Width = 33
      Height = 17
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
