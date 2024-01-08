object frmPBMaintWOrderConfDelivs: TfrmPBMaintWOrderConfDelivs
  Left = 259
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Confirm Works Instruction Deliveries'
  ClientHeight = 520
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 615
    Height = 193
    Align = alTop
    Enabled = False
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 45
      Width = 38
      Height = 13
      Caption = 'Courier'
    end
    object Label2: TLabel
      Left = 8
      Top = 74
      Width = 35
      Height = 13
      Caption = 'Service'
    end
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 44
      Height = 13
      Caption = 'Quantity'
    end
    object Label4: TLabel
      Left = 402
      Top = 16
      Width = 75
      Height = 13
      Caption = 'Despatch Date'
    end
    object Label7: TLabel
      Left = 8
      Top = 158
      Width = 46
      Height = 13
      Caption = 'Pack Size'
    end
    object Label8: TLabel
      Left = 400
      Top = 158
      Width = 94
      Height = 13
      Caption = 'Pack Weight (gms)'
    end
    object lblHandoverDate: TLabel
      Left = 402
      Top = 74
      Width = 77
      Height = 13
      Caption = 'Handover Date'
    end
    object Label14: TLabel
      Left = 8
      Top = 101
      Width = 21
      Height = 13
      Caption = 'Sort'
    end
    object Label15: TLabel
      Left = 8
      Top = 132
      Width = 32
      Height = 13
      Caption = 'Speed'
    end
    object edtCourier: TEdit
      Left = 104
      Top = 41
      Width = 249
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 3
    end
    object btnCourier: TBitBtn
      Left = 360
      Top = 39
      Width = 25
      Height = 25
      Hint = 'Select courier from a lookup list'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnCourierClick
    end
    object dblkpService: TDBLookupComboBox
      Left = 104
      Top = 70
      Width = 193
      Height = 21
      KeyField = 'Service_no'
      ListField = 'Service_Description'
      ListSource = dtmdlWOrders.dtsCourierService
      TabOrder = 5
    end
    object edtDateReq: TEdit
      Left = 496
      Top = 12
      Width = 80
      Height = 21
      MaxLength = 30
      TabOrder = 1
      OnExit = edtDateReqExit
    end
    object btnDateRequired: TBitBtn
      Left = 587
      Top = 10
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
      OnClick = btnDateRequiredClick
    end
    object memQuantity: TMemo
      Left = 104
      Top = 12
      Width = 97
      Height = 21
      TabOrder = 0
      WantReturns = False
      WordWrap = False
      OnChange = memQuantityChange
      OnEnter = SaveValue
      OnExit = ValidateQty
    end
    object edtPackageSize: TEdit
      Left = 104
      Top = 154
      Width = 193
      Height = 21
      ReadOnly = True
      TabOrder = 10
    end
    object btnPackageSize: TBitBtn
      Left = 304
      Top = 152
      Width = 25
      Height = 25
      Hint = 'Select package size from a lookup list'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = btnPackageSizeClick
    end
    object memWeight: TMemo
      Left = 496
      Top = 154
      Width = 81
      Height = 21
      TabOrder = 12
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateQty
    end
    object edtHandoverDate: TEdit
      Left = 496
      Top = 70
      Width = 80
      Height = 21
      MaxLength = 30
      TabOrder = 6
    end
    object btnHandoverDate: TBitBtn
      Left = 587
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
      TabOrder = 7
    end
    object dblkpSort: TDBLookupComboBox
      Left = 104
      Top = 97
      Width = 113
      Height = 21
      KeyField = 'Courier_Sort'
      ListField = 'Sort_Description'
      ListSource = dtmdlWOrders.dtsCourierSort
      TabOrder = 8
    end
    object dblkpSpeed: TDBLookupComboBox
      Left = 104
      Top = 128
      Width = 113
      Height = 21
      KeyField = 'Courier_Speed'
      ListField = 'Speed_Description'
      ListSource = dtmdlWOrders.dtsCourierSpeed
      TabOrder = 9
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 480
    Width = 615
    Height = 40
    Align = alBottom
    ParentBackground = False
    TabOrder = 3
    object lblDelete: TLabel
      Left = 112
      Top = 12
      Width = 106
      Height = 13
      Caption = 'Delete these details?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOK: TBitBtn
      Left = 247
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      Enabled = False
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 335
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 193
    Width = 615
    Height = 87
    Align = alTop
    Enabled = False
    ParentBackground = False
    TabOrder = 1
    object rdgrpAccountType: TRadioGroup
      Left = 8
      Top = 10
      Width = 113
      Height = 65
      Caption = 'Payment Details'
      Items.Strings = (
        'Client Account'
        'Our Account')
      ParentBackground = False
      TabOrder = 0
      OnClick = rdgrpAccountTypeClick
    end
    object grpbxAccountDetails: TGroupBox
      Left = 128
      Top = 10
      Width = 369
      Height = 65
      Enabled = False
      ParentBackground = False
      TabOrder = 1
      object Label11: TLabel
        Left = 8
        Top = 16
        Width = 72
        Height = 13
        Caption = 'Account Code'
      end
      object Label12: TLabel
        Left = 8
        Top = 40
        Width = 74
        Height = 13
        Caption = 'Account Name'
      end
      object edtAccountCode: TEdit
        Left = 84
        Top = 12
        Width = 189
        Height = 21
        MaxLength = 40
        TabOrder = 0
        OnChange = CheckOK
      end
      object edtAccountName: TEdit
        Left = 84
        Top = 38
        Width = 261
        Height = 21
        MaxLength = 40
        TabOrder = 1
        OnChange = CheckOK
      end
    end
  end
  object pnlAddress: TPanel
    Left = 0
    Top = 280
    Width = 615
    Height = 165
    Align = alClient
    Enabled = False
    ParentBackground = False
    TabOrder = 2
    object Label6: TLabel
      Left = 8
      Top = 36
      Width = 41
      Height = 13
      Caption = 'Address'
    end
    object Label9: TLabel
      Left = 8
      Top = 140
      Width = 47
      Height = 13
      Caption = 'Postcode'
    end
    object Label10: TLabel
      Left = 8
      Top = 114
      Width = 51
      Height = 13
      Caption = 'City/Town'
    end
    object Label5: TLabel
      Left = 8
      Top = 12
      Width = 72
      Height = 13
      Caption = 'Delivery Name'
    end
    object edtBuilding: TEdit
      Left = 104
      Top = 32
      Width = 253
      Height = 21
      MaxLength = 40
      TabOrder = 1
      OnChange = CheckOK
    end
    object edtStreet: TEdit
      Left = 104
      Top = 58
      Width = 252
      Height = 21
      MaxLength = 40
      TabOrder = 2
    end
    object edtLocale: TEdit
      Left = 104
      Top = 84
      Width = 252
      Height = 21
      MaxLength = 40
      TabOrder = 3
    end
    object edtTown: TEdit
      Left = 104
      Top = 110
      Width = 252
      Height = 21
      MaxLength = 40
      TabOrder = 4
    end
    object edtPostcode: TEdit
      Left = 104
      Top = 136
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 5
      OnChange = CheckOK
    end
    object edtDeliveryName: TEdit
      Left = 104
      Top = 8
      Width = 253
      Height = 21
      MaxLength = 40
      TabOrder = 0
      OnChange = CheckOK
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 445
    Width = 615
    Height = 35
    Align = alBottom
    ParentBackground = False
    TabOrder = 4
    object Label13: TLabel
      Left = 384
      Top = 10
      Width = 110
      Height = 13
      Caption = 'Actual Despatch Date'
    end
    object edtActualDate: TEdit
      Left = 496
      Top = 6
      Width = 80
      Height = 21
      MaxLength = 30
      TabOrder = 0
      OnExit = edtDateReqExit
    end
    object btnDateActual: TBitBtn
      Left = 587
      Top = 4
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
      OnClick = btnDateRequiredClick
    end
    object chkbxDespatched: TCheckBox
      Left = 8
      Top = 8
      Width = 97
      Height = 17
      Caption = 'Despatched'
      TabOrder = 2
      OnClick = chkbxDespatchedClick
    end
  end
end
