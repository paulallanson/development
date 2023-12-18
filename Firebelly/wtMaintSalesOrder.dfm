object frmWTMaintSalesOrder: TfrmWTMaintSalesOrder
  Left = 176
  Top = 4
  Caption = ';'#39
  ClientHeight = 735
  ClientWidth = 1158
  Color = clBtnFace
  Constraints.MinHeight = 550
  Constraints.MinWidth = 1170
  Font.Charset = DEFAULT_CHARSET
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
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1158
    Height = 36
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      1158
      36)
    object Label1: TLabel
      Left = 16
      Top = 12
      Width = 58
      Height = 13
      Caption = 'Sales Order'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 200
      Top = 12
      Width = 61
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
      Left = 851
      Top = 12
      Width = 73
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Office Contact'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 867
    end
    object edtNumber: TEdit
      Left = 88
      Top = 8
      Width = 97
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object dblkpOperator: TDBLookupComboBox
      Left = 947
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
      Left = 280
      Top = 8
      Width = 89
      Height = 21
      Date = 37882.000000000000000000
      Time = 37882.000000000000000000
      TabOrder = 1
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 36
    Width = 1158
    Height = 269
    Align = alTop
    Anchors = [akRight, akBottom]
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      1158
      269)
    object Label11: TLabel
      Left = 17
      Top = 168
      Width = 20
      Height = 13
      Caption = 'Rep'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 17
      Top = 134
      Width = 40
      Height = 13
      Caption = 'Contact'
    end
    object Label12: TLabel
      Left = 717
      Top = 12
      Width = 51
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Reference'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 733
    end
    object Label13: TLabel
      Left = 716
      Top = 38
      Width = 68
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Customer PO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 732
    end
    object Label16: TLabel
      Left = 17
      Top = 12
      Width = 50
      Height = 13
      Caption = 'Customer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 17
      Top = 201
      Width = 59
      Height = 13
      Caption = 'Description'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label18: TLabel
      Left = 17
      Top = 31
      Width = 30
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
      Width = 53
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
      Width = 48
      Height = 13
      Caption = 'Postcode'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlAddress: TPanel
      Left = 75
      Top = 1
      Width = 572
      Height = 121
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      Caption = 'pnlAddress'
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        572
        121)
      object Label24: TLabel
        Left = 108
        Top = 95
        Width = 37
        Height = 13
        Caption = 'County'
      end
      object edtCustomerName: TEdit
        Left = 14
        Top = 8
        Width = 550
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = CheckOK
      end
      object edtStreet: TEdit
        Left = 14
        Top = 27
        Width = 550
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object edtLocale: TEdit
        Left = 14
        Top = 47
        Width = 550
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object edtTown: TEdit
        Left = 14
        Top = 69
        Width = 550
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object edtPostcode: TEdit
        Left = 14
        Top = 91
        Width = 81
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 4
      end
      object edtCounty: TEdit
        Left = 152
        Top = 91
        Width = 410
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
      end
    end
    object grpMaterials: TGroupBox
      Left = 896
      Top = 181
      Width = 193
      Height = 77
      Anchors = [akTop, akRight]
      Enabled = False
      ParentBackground = False
      TabOrder = 12
      DesignSize = (
        193
        77)
      object Label17: TLabel
        Left = 10
        Top = 23
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'Required'
      end
      object Label19: TLabel
        Left = 10
        Top = 52
        Width = 45
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Received'
      end
      object edtMatsReqDate: TEdit
        Left = 64
        Top = 19
        Width = 81
        Height = 21
        TabOrder = 0
        OnChange = CheckOK
        OnExit = edtTempDateExit
      end
      object btnMatsReqDate: TBitBtn
        Left = 152
        Top = 18
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
        OnClick = btnMatsReqDateClick
      end
      object btnMatsRecDate: TBitBtn
        Left = 152
        Top = 47
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
        OnClick = btnMatsRecDateClick
      end
      object edtMatsRecDate: TEdit
        Left = 64
        Top = 47
        Width = 81
        Height = 21
        TabOrder = 3
        OnChange = CheckOK
        OnExit = edtTempDateExit
      end
    end
    object btnCustomer: TBitBtn
      Left = 648
      Top = 6
      Width = 25
      Height = 25
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
    object dblkpRep: TDBLookupComboBox
      Left = 89
      Top = 164
      Width = 248
      Height = 21
      KeyField = 'Rep'
      ListField = 'Rep_Name'
      ListSource = dtmdlSalesOrder.dtsRep
      TabOrder = 4
      OnClick = CheckOK
    end
    object edtReference: TEdit
      Left = 813
      Top = 8
      Width = 274
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 7
      OnChange = edtReferenceChange
    end
    object edtCustOrderNo: TEdit
      Left = 813
      Top = 34
      Width = 274
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 8
      OnChange = edtCustOrderNoChange
    end
    object BitBtn3: TBitBtn
      Left = 651
      Top = 128
      Width = 25
      Height = 25
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
      TabOrder = 3
      OnClick = BitBtn3Click
    end
    object btnLUReps: TBitBtn
      Left = 346
      Top = 162
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
      TabOrder = 5
      OnClick = btnLURepsClick
    end
    object edtContact: TEdit
      Left = 89
      Top = 130
      Width = 550
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnChange = edtContactChange
    end
    object edtDescription: TMemo
      Left = 89
      Top = 197
      Width = 590
      Height = 60
      Anchors = [akLeft, akTop, akRight, akBottom]
      MaxLength = 255
      ScrollBars = ssVertical
      TabOrder = 6
      OnChange = edtDescriptionChange
    end
    object chkbxMaterialRequired: TCheckBox
      Left = 896
      Top = 168
      Width = 105
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Material Required'
      TabOrder = 11
      OnClick = chkbxMaterialRequiredClick
    end
    object rdgrpDateType: TRadioGroup
      Left = 702
      Top = 61
      Width = 185
      Height = 77
      Anchors = [akTop, akRight]
      Caption = 'Date Type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Items.Strings = (
        'Provisional'
        'Confirmed'
        'TBC')
      ParentBackground = False
      ParentFont = False
      TabOrder = 9
      OnClick = rdgrpDateTypeClick
    end
    object grpDates: TGroupBox
      Left = 896
      Top = 61
      Width = 194
      Height = 77
      Anchors = [akTop, akRight]
      Caption = 'Dates'
      ParentBackground = False
      TabOrder = 10
      DesignSize = (
        194
        77)
      object Label8: TLabel
        Left = 12
        Top = 24
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'Template'
      end
      object Label10: TLabel
        Left = 12
        Top = 53
        Width = 34
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Fitting'
      end
      object edtTempDate: TEdit
        Left = 64
        Top = 21
        Width = 81
        Height = 21
        TabOrder = 0
        OnChange = CheckOK
        OnExit = edtTempDateExit
      end
      object btnTempDate: TBitBtn
        Left = 152
        Top = 19
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
        OnClick = btnTempDateClick
      end
      object edtReqDate: TEdit
        Left = 64
        Top = 50
        Width = 81
        Height = 21
        TabOrder = 2
        OnChange = CheckOK
        OnExit = edtTempDateExit
      end
      object btnReqdDate: TBitBtn
        Left = 152
        Top = 48
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
        TabOrder = 3
        OnClick = btnReqdDateClick
      end
    end
    object rdgrpJobType: TRadioGroup
      Left = 702
      Top = 142
      Width = 185
      Height = 116
      Anchors = [akTop, akRight]
      Caption = 'Job Type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Template && Fit'
        'Supply Only'
        'Collection Only'
        'Remedial - Production'
        'Remedial - No Production')
      ParentBackground = False
      ParentFont = False
      TabOrder = 13
      OnClick = rdgrpJobTypeClick
    end
    object pnlRevenueCentre: TPanel
      Left = 376
      Top = 155
      Width = 302
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 14
      DesignSize = (
        302
        41)
      object Label59: TLabel
        Left = 27
        Top = 12
        Width = 81
        Height = 13
        Caption = 'Revenue Centre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton2: TSpeedButton
        Left = 277
        Top = 7
        Width = 23
        Height = 22
        Hint = 'Clear Revenue Centre'
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
        OnClick = SpeedButton2Click
        ExplicitLeft = 327
      end
      object dblkpRevenueCentre: TDBLookupComboBox
        Left = 116
        Top = 8
        Width = 150
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        KeyField = 'Revenue_Centre'
        ListField = 'Revenue_Centre_Descr'
        TabOrder = 0
      end
    end
    object edtProject: TEdit
      Left = 682
      Top = 8
      Width = 21
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 15
      Visible = False
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 675
    Width = 1158
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 4
    DesignSize = (
      1158
      41)
    object lblDeleteprompt: TLabel
      Left = 772
      Top = 12
      Width = 149
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = 'Delete this sales order?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 822
    end
    object btnOK: TBitBtn
      Left = 932
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
      Left = 1020
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
      OnClick = chkbxonHoldClick
    end
    object chkbxInactive: TCheckBox
      Left = 128
      Top = 12
      Width = 105
      Height = 17
      Caption = 'Order is Inactive'
      TabOrder = 1
    end
    object chkbxDoNotInvoice: TCheckBox
      Left = 256
      Top = 12
      Width = 97
      Height = 17
      Caption = 'Do NOT Invoice'
      TabOrder = 4
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 716
    Width = 1158
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 481
    Width = 1158
    Height = 194
    Align = alBottom
    ParentBackground = False
    TabOrder = 3
    object Panel5: TPanel
      Left = 804
      Top = 1
      Width = 353
      Height = 192
      Align = alRight
      Anchors = [akRight, akBottom]
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 3
      DesignSize = (
        353
        192)
      object Label3: TLabel
        Left = 198
        Top = 106
        Width = 34
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Goods'
      end
      object Label4: TLabel
        Left = 201
        Top = 133
        Width = 18
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'VAT'
      end
      object Label5: TLabel
        Left = 198
        Top = 162
        Width = 25
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Total'
      end
      object Label15: TLabel
        Left = 9
        Top = 109
        Width = 84
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Deposit Terms %'
      end
      object Label14: TLabel
        Left = 28
        Top = 164
        Width = 65
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Deposit Paid'
      end
      object Label27: TLabel
        Left = 6
        Top = 136
        Width = 90
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Deposit Required'
      end
      object memGoods: TMemo
        Left = 248
        Top = 101
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
        Left = 248
        Top = 128
        Width = 89
        Height = 23
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 1
      end
      object memTotal: TMemo
        Left = 248
        Top = 157
        Width = 89
        Height = 23
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 2
      end
      object edtDepositPaid: TCREditMoney
        Left = 96
        Top = 160
        Width = 73
        Height = 21
        Anchors = [akRight, akBottom]
        Enabled = False
        ReadOnly = True
        TabOrder = 3
        OnChange = edtDepositPaidChange
      end
      object edtDepositReqd: TCREditMoney
        Left = 96
        Top = 132
        Width = 73
        Height = 21
        Anchors = [akRight, akBottom]
        TabOrder = 4
        OnChange = edtDepositReqdChange
        OnEnter = edtDepositReqdEnter
        OnExit = edtDepositReqdExit
      end
      object edtDepositTerms: TCREditMoney
        Left = 96
        Top = 104
        Width = 73
        Height = 21
        Anchors = [akRight, akBottom]
        TabOrder = 5
        OnChange = edtDepositTermsChange
        OnEnter = edtDepositTermsEnter
        OnExit = edtDepositTermsExit
      end
      object pnlSubContract: TPanel
        Left = 0
        Top = 0
        Width = 353
        Height = 81
        Align = alTop
        ParentBackground = False
        TabOrder = 6
        object Label31: TLabel
          Left = 8
          Top = 14
          Width = 49
          Height = 39
          Caption = 'Charge On Customer'
          WordWrap = True
        end
        object SpeedButton6: TSpeedButton
          Left = 314
          Top = 19
          Width = 25
          Height = 25
          Hint = 'Clear Default Upstand Size'
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
          OnClick = SpeedButton6Click
        end
        object edtSubContractCustomer: TEdit
          Left = 70
          Top = 21
          Width = 195
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = 'edtSubContractCustomer'
        end
        object Button1: TButton
          Left = 280
          Top = 19
          Width = 25
          Height = 25
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = Button1Click
        end
      end
    end
    object pnlFitters: TPanel
      Left = 578
      Top = 1
      Width = 226
      Height = 192
      Align = alClient
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        226
        192)
      object Label29: TLabel
        Left = 9
        Top = 3
        Width = 50
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Templater'
      end
      object Label30: TLabel
        Left = 12
        Top = 47
        Width = 27
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Fitter'
      end
      object btnContactClear: TSpeedButton
        Left = 196
        Top = 61
        Width = 23
        Height = 22
        Anchors = [akLeft, akBottom]
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
      object SpeedButton1: TSpeedButton
        Left = 196
        Top = 20
        Width = 23
        Height = 22
        Anchors = [akLeft, akBottom]
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
        OnClick = SpeedButton1Click
      end
      object dblkpTemplater: TDBLookupComboBox
        Left = 10
        Top = 21
        Width = 145
        Height = 21
        Anchors = [akLeft, akBottom]
        KeyField = 'Fitter'
        ListField = 'Fitter_Name'
        ListSource = dtmdlSalesOrder.dtsTemplater
        TabOrder = 0
      end
      object dblkpFitter: TDBLookupComboBox
        Left = 10
        Top = 62
        Width = 145
        Height = 21
        Anchors = [akLeft, akBottom]
        KeyField = 'Fitter'
        ListField = 'Fitter_Name'
        ListSource = dtmdlSalesOrder.dtsFitter
        TabOrder = 2
      end
      object btnFitter: TBitBtn
        Left = 165
        Top = 20
        Width = 22
        Height = 22
        Hint = 'Select Customer'
        Anchors = [akLeft, akBottom]
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
        OnClick = btnFitterClick
      end
      object chkbxTemplateDocsReturned: TCheckBox
        Left = 10
        Top = 134
        Width = 173
        Height = 17
        Caption = 'Template Documents Returned'
        TabOrder = 3
      end
      object chkbxFittingDocsReturned: TCheckBox
        Left = 10
        Top = 156
        Width = 166
        Height = 17
        Caption = 'Fitting Documents Returned'
        TabOrder = 4
      end
    end
    object pnlInstallAddress: TPanel
      Left = 1
      Top = 1
      Width = 344
      Height = 192
      Align = alLeft
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        344
        192)
      object Label6: TLabel
        Left = 3
        Top = 2
        Width = 103
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Installation Address'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label34: TLabel
        Left = 4
        Top = 80
        Width = 30
        Height = 13
        Caption = 'Street'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label35: TLabel
        Left = 4
        Top = 137
        Width = 51
        Height = 13
        Caption = 'Town/City'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label37: TLabel
        Left = 4
        Top = 168
        Width = 48
        Height = 13
        Caption = 'Postcode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label38: TLabel
        Left = 4
        Top = 53
        Width = 29
        Height = 13
        Caption = 'Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label39: TLabel
        Left = 169
        Top = 168
        Width = 37
        Height = 13
        Caption = 'County'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label40: TLabel
        Left = 4
        Top = 24
        Width = 19
        Height = 13
        Caption = 'Site'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object btnClearCustomerBranch: TSpeedButton
        Left = 303
        Top = 18
        Width = 25
        Height = 25
        Hint = 'Clear Revenue Centre'
        Anchors = [akLeft, akBottom]
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
        OnClick = btnClearCustomerBranchClick
      end
      object edtInstallationName: TEdit
        Left = 62
        Top = 49
        Width = 267
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = edtInstallationNameChange
      end
      object edtInstallationStreet: TEdit
        Left = 62
        Top = 76
        Width = 267
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnChange = edtInstallationNameChange
      end
      object edtInstallationLocale: TEdit
        Left = 62
        Top = 104
        Width = 267
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        OnChange = edtInstallationNameChange
      end
      object edtInstallationTown: TEdit
        Left = 62
        Top = 133
        Width = 267
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        OnChange = edtInstallationNameChange
      end
      object edtInstallationPostcode: TEdit
        Left = 62
        Top = 164
        Width = 91
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 4
        OnChange = edtInstallationNameChange
      end
      object edtInstallationCounty: TEdit
        Left = 206
        Top = 164
        Width = 123
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        OnChange = edtInstallationNameChange
      end
      object btnCustomerBranch: TButton
        Left = 272
        Top = 18
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = btnCustomerBranchClick
      end
      object edtSiteName: TEdit
        Left = 62
        Top = 20
        Width = 203
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 7
        OnChange = edtInstallationNameChange
      end
    end
    object pnlInstallContact: TPanel
      Left = 345
      Top = 1
      Width = 233
      Height = 192
      Align = alLeft
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        233
        192)
      object Label21: TLabel
        Left = 9
        Top = 3
        Width = 101
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Installation Contact'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 9
        Top = 90
        Width = 104
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Installation Number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label33: TLabel
        Left = 9
        Top = 47
        Width = 88
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Installation Email'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtInstallName: TEdit
        Left = 9
        Top = 21
        Width = 200
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 0
        OnChange = CheckOK
      end
      object edtInstallPhone: TEdit
        Left = 9
        Top = 105
        Width = 161
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 2
        OnChange = CheckOK
      end
      object edtInstallEmail: TEdit
        Left = 9
        Top = 61
        Width = 200
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 1
      end
      object memInstallAddress: TMemo
        Left = 10
        Top = 131
        Width = 215
        Height = 54
        TabStop = False
        Anchors = [akLeft, akBottom]
        MaxLength = 200
        TabOrder = 3
        Visible = False
        OnChange = CheckOK
      end
    end
  end
  object pcDetails: TPageControl
    Left = 0
    Top = 305
    Width = 1158
    Height = 176
    ActivePage = tbDetails
    Align = alClient
    TabOrder = 2
    object tbDetails: TTabSheet
      Caption = 'Details'
      object dbgLines: TStringGrid
        Left = 0
        Top = 0
        Width = 1150
        Height = 148
        Align = alClient
        ColCount = 11
        DefaultColWidth = 40
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        PopupMenu = pmnLines
        TabOrder = 0
        OnDblClick = dbgLinesDblClick
        ColWidths = (
          40
          89
          336
          80
          83
          71
          72
          103
          87
          86
          82)
      end
    end
    object tbDocuments: TTabSheet
      Caption = 'Documents'
      ImageIndex = 1
      OnShow = tbDocumentsShow
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 1150
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object Label44: TLabel
          Left = 2
          Top = 0
          Width = 58
          Height = 13
          Caption = 'Documents'
        end
      end
      object tbrDocuments: TToolBar
        Left = 1117
        Top = 17
        Width = 33
        Height = 131
        Align = alRight
        ButtonHeight = 30
        ButtonWidth = 30
        Caption = 'tbrDocuments'
        HotImages = imgIcons
        Images = imgIcons
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object btnExcel: TToolButton
          Left = 0
          Top = 0
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
          Top = 30
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
          Top = 60
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
          Top = 90
          Hint = 'Attach Documents'
          Caption = 'btnAttach'
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAttachClick
        end
      end
      object pnlDocuments: TPanel
        Left = 0
        Top = 17
        Width = 1117
        Height = 131
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 2
        object pnlPlanDocument: TPanel
          Left = 0
          Top = 90
          Width = 1117
          Height = 41
          Align = alBottom
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            1117
            41)
          object Label32: TLabel
            Left = 8
            Top = 16
            Width = 122
            Height = 13
            Caption = 'Kitchen Plan Document:'
          end
          object edtPlansDocument: TEdit
            Left = 132
            Top = 13
            Width = 543
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            ReadOnly = True
            TabOrder = 0
            OnChange = edtPlansDocumentChange
            OnDblClick = edtPlansDocumentDblClick
            ExplicitWidth = 547
          end
          object Button5: TButton
            Left = 682
            Top = 10
            Width = 75
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Browse'
            TabOrder = 1
            OnClick = Button5Click
            ExplicitLeft = 686
          end
          object btnGenerateDocs: TButton
            Left = 986
            Top = 8
            Width = 83
            Height = 25
            Anchors = [akTop, akRight]
            Caption = 'Generate Docs'
            TabOrder = 2
            OnClick = btnGenerateDocsClick
            ExplicitLeft = 990
          end
        end
        object stvDocuments: TShellTreeView
          Left = 0
          Top = 0
          Width = 185
          Height = 90
          ObjectTypes = [otFolders]
          Root = 'C:\'
          ShellListView = slvDocuments
          UseShellImages = True
          Align = alLeft
          AutoRefresh = False
          Indent = 23
          ParentColor = False
          RightClickSelect = True
          ShowRoot = False
          TabOrder = 1
          OnDragDrop = stvDocumentsDragDrop
          OnDragOver = stvDocumentsDragOver
        end
        object dfDocuments: TPJDropFiles
          Left = 185
          Top = 0
          Width = 932
          Height = 90
          Align = alClient
          TabOrder = 2
          Filter = PJExtFileFilter1
          ForegroundOnDrop = False
          Options = [dfoIncFolders, dfoIncFiles, dfoRecurseFolders]
          PassThrough = False
          OnDropFiles = dfDocumentsDropFiles
          object slvDocuments: TShellListView
            Left = 0
            Top = 0
            Width = 932
            Height = 90
            AutoRefresh = True
            ObjectTypes = [otFolders, otNonFolders]
            Root = 'C:\'
            ShellTreeView = stvDocuments
            Sorted = True
            Align = alClient
            ReadOnly = False
            HideSelection = False
            MultiSelect = True
            OnMouseMove = stvDocumentsMouseMove
            TabOrder = 0
            ViewStyle = vsReport
          end
        end
      end
    end
    object tbNotes: TTabSheet
      Caption = 'Notes'
      ImageIndex = 8
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 1150
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          1150
          17)
        object lblApplianceDetails: TLabel
          Left = 0
          Top = 0
          Width = 146
          Height = 17
          Align = alLeft
          Caption = 'Appliance Details (255 chars)'
          ExplicitHeight = 13
        end
        object lblNotes: TLabel
          Left = 492
          Top = 0
          Width = 30
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Notes'
        end
      end
      object edtApplianceDetails: TMemo
        Left = 0
        Top = 17
        Width = 449
        Height = 131
        Align = alLeft
        MaxLength = 255
        TabOrder = 1
        OnChange = edtApplianceDetailsChange
      end
      object Panel1: TPanel
        Left = 449
        Top = 17
        Width = 16
        Height = 131
        Align = alLeft
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 2
      end
      object memNotes: TMemo
        Left = 465
        Top = 17
        Width = 685
        Height = 131
        Align = alClient
        TabOrder = 3
      end
    end
    object tbContactDetails: TTabSheet
      Caption = 'Contact Info'
      ImageIndex = 2
      object scrlAddress: TScrollBox
        Left = 0
        Top = 0
        Width = 1150
        Height = 148
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object pnlContactInfo: TPanel
          Left = 0
          Top = 0
          Width = 473
          Height = 148
          Align = alLeft
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object Label26: TLabel
            Left = 6
            Top = 15
            Width = 57
            Height = 13
            Caption = 'Telephone:'
          end
          object Label25: TLabel
            Left = 6
            Top = 40
            Width = 30
            Height = 13
            Caption = 'Email:'
          end
          object edtTelephone: TEdit
            Left = 88
            Top = 11
            Width = 266
            Height = 21
            TabOrder = 0
            OnChange = edtContactChange
          end
          object edtEmailAddress: TEdit
            Left = 88
            Top = 36
            Width = 266
            Height = 21
            TabOrder = 1
            OnChange = edtContactChange
          end
        end
      end
    end
    object tbEvents: TTabSheet
      Caption = 'Events'
      ImageIndex = 4
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 1150
        Height = 17
        Align = alTop
        ParentBackground = False
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 0
        Top = 17
        Width = 305
        Height = 131
        Align = alLeft
        ParentBackground = False
        TabOrder = 1
        object sgEvents: TStringGrid
          Left = 1
          Top = 1
          Width = 303
          Height = 129
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
        Top = 17
        Width = 404
        Height = 131
        Align = alClient
        ParentBackground = False
        TabOrder = 2
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
        Left = 709
        Top = 17
        Width = 441
        Height = 131
        Align = alRight
        ParentBackground = False
        TabOrder = 3
        object memEventNotes: TMemo
          Left = 1
          Top = 1
          Width = 439
          Height = 129
          Align = alClient
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object tbJobs: TTabSheet
      Caption = 'Jobs'
      ImageIndex = 9
      object Panel11: TPanel
        Left = 1057
        Top = 0
        Width = 93
        Height = 148
        Align = alRight
        ParentBackground = False
        TabOrder = 0
        object btnJobChange: TBitBtn
          Left = 10
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Change'
          Enabled = False
          TabOrder = 0
          OnClick = btnJobChangeClick
        end
        object btnJobDelete: TBitBtn
          Left = 10
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Delete'
          Enabled = False
          TabOrder = 1
          OnClick = btnJobDeleteClick
        end
        object btnJobPrint: TBitBtn
          Left = 10
          Top = 72
          Width = 75
          Height = 25
          Caption = '&Print'
          Enabled = False
          TabOrder = 2
          OnClick = btnJobPrintClick
        end
        object btnJobSheet: TBitBtn
          Left = 10
          Top = 104
          Width = 75
          Height = 25
          Caption = 'Job &Sheet'
          Enabled = False
          TabOrder = 3
          OnClick = btnJobSheetClick
        end
        object btnJobFitting: TBitBtn
          Left = 10
          Top = 136
          Width = 75
          Height = 25
          Caption = '&Fitting'
          Enabled = False
          TabOrder = 4
          OnClick = btnJobFittingClick
        end
        object btnJobComplete: TBitBtn
          Left = 10
          Top = 168
          Width = 75
          Height = 25
          Caption = '&Complete'
          Enabled = False
          TabOrder = 5
          OnClick = btnJobCompleteClick
        end
      end
      object dbgJobs: TDBGrid
        Left = 0
        Top = 0
        Width = 1057
        Height = 148
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbgJobsDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Job'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Raised'
            Title.Caption = 'Date'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Required'
            Title.Caption = 'Date Required'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Job_Status_Description'
            Title.Caption = 'Status'
            Width = 327
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quote'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Operator_Name'
            Title.Caption = 'Operator'
            Width = 149
            Visible = True
          end>
      end
    end
    object tbRemedials: TTabSheet
      Caption = 'Remedials'
      ImageIndex = 10
      object Panel13: TPanel
        Left = 1057
        Top = 0
        Width = 93
        Height = 148
        Align = alRight
        ParentBackground = False
        TabOrder = 0
        object btnRemedialChange: TBitBtn
          Left = 10
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnRemedialChangeClick
        end
        object btnRemedialDelete: TBitBtn
          Left = 10
          Top = 72
          Width = 75
          Height = 25
          Caption = '&Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnRemedialDeleteClick
        end
        object btnRemedialAdd: TBitBtn
          Left = 10
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          TabOrder = 0
          OnClick = btnRemedialAddClick
        end
        object btnRemedialPrint: TBitBtn
          Left = 10
          Top = 104
          Width = 75
          Height = 25
          Caption = '&Print'
          Enabled = False
          TabOrder = 3
          OnClick = btnRemedialPrintClick
        end
        object btnRemedialOrder: TBitBtn
          Left = 10
          Top = 138
          Width = 75
          Height = 25
          Caption = '&Order'
          Enabled = False
          TabOrder = 4
          OnClick = btnRemedialOrderClick
        end
      end
      object dbgRemedials: TDBGrid
        Left = 0
        Top = 0
        Width = 1057
        Height = 148
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmnuRemedials
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbgRemedialsDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Job'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Remedial_Number'
            Title.Caption = 'Remedial'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Raised'
            Title.Caption = 'Date'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Remedial_Work'
            Title.Caption = 'Remedial Work'
            Width = 227
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Operator_Name'
            Title.Caption = 'Raised By'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Fitter_Name'
            Title.Caption = 'Fitter'
            Width = 133
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Installation_Date'
            Title.Caption = 'Installation Date'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Installation_Price'
            Title.Caption = 'Cost'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Remedial_Sales_Order'
            Title.Caption = 'Sales Order'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Completed'
            Visible = True
          end>
      end
    end
    object tbPurchases: TTabSheet
      Caption = 'Purchases'
      ImageIndex = 5
      object Panel2: TPanel
        Left = 1057
        Top = 0
        Width = 93
        Height = 125
        Align = alRight
        ParentBackground = False
        TabOrder = 0
        object btnPOChange: TBitBtn
          Left = 10
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnPOChangeClick
        end
        object btnPODelete: TBitBtn
          Left = 10
          Top = 104
          Width = 75
          Height = 25
          Caption = '&Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnPODeleteClick
        end
        object btnPORaise: TBitBtn
          Left = 10
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          TabOrder = 0
          OnClick = btnPORaiseClick
        end
        object btnPOPrint: TBitBtn
          Left = 10
          Top = 136
          Width = 75
          Height = 25
          Caption = '&Print'
          Enabled = False
          TabOrder = 3
          OnClick = btnPOPrintClick
        end
        object btnPORemove: TBitBtn
          Left = 10
          Top = 72
          Width = 75
          Height = 25
          Caption = '&Remove'
          Enabled = False
          TabOrder = 4
          OnClick = btnPORemoveClick
        end
      end
      object dbgPurchases: TDBGrid
        Left = 0
        Top = 0
        Width = 1057
        Height = 125
        Align = alClient
        DataSource = dtmdlSalesOrder.dtsSOPurchases
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmnPurchases
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbgPurchasesDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Purchase_Order'
            Title.Caption = 'PO Number'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Raised'
            Title.Caption = 'Raised'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Required'
            Title.Caption = 'Required'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Supplier_name'
            Title.Caption = 'Supplier'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PO_Line_Description'
            Title.Caption = 'Description'
            Width = 157
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Slab_Size_Description'
            Title.Caption = 'Slab Size'
            Width = 127
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Unit_cost'
            Title.Caption = 'Unit Cost'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantity'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_Cost'
            Title.Caption = 'Total'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Status_Description'
            Title.Caption = 'Status'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GRN Number'
            Width = 80
            Visible = True
          end>
      end
      object pnlPurchasesFoot: TPanel
        Left = 0
        Top = 125
        Width = 1150
        Height = 23
        Align = alBottom
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 2
        object chkbxShowInactive: TCheckBox
          Left = 8
          Top = 4
          Width = 185
          Height = 17
          Caption = 'Show deleted/inactive orders'
          TabOrder = 0
          OnClick = chkbxShowInactiveClick
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Sales Invoices'
      ImageIndex = 7
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 1150
        Height = 25
        Align = alTop
        ParentBackground = False
        TabOrder = 0
        object Label36: TLabel
          Left = 13
          Top = 6
          Width = 70
          Height = 13
          Caption = 'Sales Invoices'
        end
      end
      object dbgSalesInvoices: TDBGrid
        Left = 0
        Top = 25
        Width = 1065
        Height = 95
        Align = alClient
        DataSource = dtmdlSalesOrder.dtsSalesInvoices
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = dbgSalesInvoicesDrawColumnCell
        OnDblClick = dbgSalesInvoicesDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Invoice_no'
            Title.Caption = 'Invoice No'
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Invoice_Date'
            Title.Caption = 'Invoice Date'
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Description'
            Width = 313
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Goods_Value'
            Title.Caption = 'Goods'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vat_Value'
            Title.Caption = 'Vat'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_Invoice'
            Title.Caption = 'Total'
            Width = 102
            Visible = True
          end>
      end
      object Panel19: TPanel
        Left = 0
        Top = 120
        Width = 1150
        Height = 28
        Align = alBottom
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          1150
          28)
        object Label42: TLabel
          Left = 430
          Top = 8
          Width = 100
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Total Invoiced Sales'
          Visible = False
        end
        object memTotalSI: TMemo
          Left = 563
          Top = 4
          Width = 110
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 0
          Visible = False
          WantReturns = False
          WordWrap = False
        end
      end
      object Panel7: TPanel
        Left = 1065
        Top = 25
        Width = 85
        Height = 95
        Align = alRight
        ParentBackground = False
        TabOrder = 3
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
    end
    object tbLinkedQuotes: TTabSheet
      Caption = 'Linked Quotes'
      ImageIndex = 3
      OnShow = tbLinkedQuotesShow
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 1150
        Height = 148
        Align = alClient
        DataSource = dtmdlSalesOrder.dtsGetLinkedQuotes
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Sales_order_Line_no'
            Title.Caption = 'Order Line'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quote'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Raised'
            Title.Caption = 'Date'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quote_Number'
            Title.Caption = 'Quote Reference'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Description'
            Width = 257
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Material_Type_Description'
            Title.Caption = 'Material'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Original_Quote'
            Title.Caption = 'Original Quote'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Complete_Price'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Installation_price'
            Title.Caption = 'Install'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Survey_price'
            Title.Caption = 'Survey'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Delivery_Price'
            Title.Caption = 'Delivery'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_Price'
            Title.Caption = 'Total'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quote_status_description'
            Title.Caption = 'Status'
            Width = 64
            Visible = True
          end>
      end
    end
    object tbSchedulingProperties: TTabSheet
      Caption = 'Properties'
      ImageIndex = 6
      object chkbxTemplateInSchedule: TCheckBox
        Left = 17
        Top = 17
        Width = 288
        Height = 17
        Caption = 'Templating Appointment In Schedule'
        TabOrder = 0
        WordWrap = True
        OnClick = chkbxTemplateInScheduleClick
      end
      object chkbxFittingInSchedule: TCheckBox
        Left = 17
        Top = 40
        Width = 288
        Height = 17
        Caption = 'Fitting Appointment in Schedule'
        TabOrder = 1
        OnClick = chkbxFittingInScheduleClick
      end
    end
  end
  object pmnDummy: TPopupMenu
    Left = 464
    Top = 232
  end
  object pmnLines: TPopupMenu
    OnPopup = pmnLinesPopup
    Left = 344
    Top = 257
    object mnAddLine: TMenuItem
      Caption = '&Add'
      ShortCut = 16449
      OnClick = mnAddLineClick
    end
    object mnChangeLine: TMenuItem
      Caption = '&Change'
      ShortCut = 16451
      OnClick = mnChangeLineClick
    end
    object mnDeleteLine: TMenuItem
      Caption = '&Delete'
      ShortCut = 16452
      OnClick = mnDeleteLineClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnInsertQuote: TMenuItem
      Caption = 'Insert &Quote'
      ShortCut = 16465
      OnClick = mnInsertQuoteClick
    end
    object mnAddQuote: TMenuItem
      Caption = 'Add Quote'
      OnClick = mnAddQuoteClick
    end
    object mnCopyQuote: TMenuItem
      Caption = 'Copy Quote'
      OnClick = mnCopyQuoteClick
    end
    object mnRequote: TMenuItem
      Caption = 'Requote'
      OnClick = mnRequoteClick
    end
    object mnPrintQuote: TMenuItem
      Caption = '&Print'
      ShortCut = 16464
      OnClick = mnPrintQuoteClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ConverttoJob1: TMenuItem
      Caption = 'Convert to Job'
      OnClick = ConverttoJob1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object mnProperties: TMenuItem
      Caption = 'Modify Properties'
      OnClick = mnPropertiesClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnRaisePO: TMenuItem
      Caption = 'Raise Purchase Order'
      OnClick = mnRaisePOClick
    end
  end
  object imgDocuments: TImageList
    Left = 512
    Top = 372
  end
  object imgIcons: TImageList
    Left = 536
    Top = 228
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF0000000000000000000000000000000000
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
  object DocOpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofAllowMultiSelect, ofEnableSizing]
    Left = 664
    Top = 256
  end
  object svDlgOfficeDoc: TSaveDialog
    Left = 353
    Top = 102
  end
  object pmnPurchases: TPopupMenu
    OnPopup = pmnPurchasesPopup
    Left = 660
    Top = 337
    object Add1: TMenuItem
      Caption = 'Add'
      OnClick = btnPORaiseClick
    end
    object mnuPOChange: TMenuItem
      Caption = 'Change'
      OnClick = btnPOChangeClick
    end
    object mnuPORemove: TMenuItem
      Caption = 'Remove'
      OnClick = btnPORemoveClick
    end
    object mnuPODelete: TMenuItem
      Caption = 'Delete'
      OnClick = btnPODeleteClick
    end
    object mnuPOPrint: TMenuItem
      Caption = 'Print'
      OnClick = btnPOPrintClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object mnuPOReceive: TMenuItem
      Caption = 'Receive'
      OnClick = mnuPOReceiveClick
    end
  end
  object pmnuDocuments: TPopupMenu
    OnPopup = pmnuDocumentsPopup
    Left = 286
    Top = 422
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
  object opndlgPlans: TOpenDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 828
    Top = 448
  end
  object pmnuRemedials: TPopupMenu
    OnPopup = pmnuRemedialsPopup
    Left = 660
    Top = 409
    object Add2: TMenuItem
      Caption = 'Add'
      OnClick = btnRemedialAddClick
    end
    object pmnuRemedialChange: TMenuItem
      Caption = 'Change'
      OnClick = btnRemedialChangeClick
    end
    object pmnuRemedialDelete: TMenuItem
      Caption = 'Delete'
      OnClick = btnRemedialDeleteClick
    end
    object pmnuRemedialPrint: TMenuItem
      Caption = 'Print'
      OnClick = btnRemedialPrintClick
    end
    object pmnuRemedialOrder: TMenuItem
      Caption = 'Order'
      OnClick = btnRemedialOrderClick
    end
  end
  object PJExtFileFilter1: TPJExtFileFilter
    Style = fsAll
    Left = 965
    Top = 370
  end
end
