object PBMaintCustMultiFrm: TPBMaintCustMultiFrm
  Left = 268
  Top = 28
  BorderStyle = bsDialog
  Caption = 'Maintain Customer Details'
  ClientHeight = 592
  ClientWidth = 755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    755
    592)
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 40
    Width = 51
    Height = 13
    Caption = 'Town/City'
  end
  object Label2: TLabel
    Left = 16
    Top = 70
    Width = 37
    Height = 13
    Caption = 'County'
  end
  object Label3: TLabel
    Left = 16
    Top = 194
    Width = 44
    Height = 13
    Caption = 'VAT Rate'
  end
  object Label4: TLabel
    Left = 16
    Top = 224
    Width = 75
    Height = 13
    Caption = 'Customer Type'
  end
  object Label5: TLabel
    Left = 16
    Top = 287
    Width = 81
    Height = 13
    Caption = 'Revenue Centre'
  end
  object Label6: TLabel
    Left = 16
    Top = 467
    Width = 75
    Height = 13
    Caption = 'Payment Terms'
  end
  object Label7: TLabel
    Left = 16
    Top = 437
    Width = 32
    Height = 13
    Caption = 'Status'
  end
  object Label8: TLabel
    Left = 16
    Top = 497
    Width = 87
    Height = 13
    Caption = 'Invoiced Upfront'
  end
  object Label9: TLabel
    Left = 16
    Top = 528
    Width = 82
    Height = 13
    Caption = 'Customer Active'
  end
  object Label10: TLabel
    Left = 16
    Top = 132
    Width = 60
    Height = 13
    Caption = 'Primary Rep'
  end
  object Label11: TLabel
    Left = 16
    Top = 256
    Width = 58
    Height = 13
    Caption = 'Importance'
  end
  object lblAnalysis1: TLabel
    Left = 16
    Top = 316
    Width = 80
    Height = 13
    Caption = 'Analysis Code 1'
  end
  object lblAnalysis2: TLabel
    Left = 16
    Top = 348
    Width = 80
    Height = 13
    Caption = 'Analysis Code 2'
  end
  object Label12: TLabel
    Left = 16
    Top = 100
    Width = 91
    Height = 13
    Caption = 'Account Manager'
  end
  object Label13: TLabel
    Left = 16
    Top = 164
    Width = 76
    Height = 13
    Caption = 'Secondary Rep'
  end
  object lblAnalysis3: TLabel
    Left = 16
    Top = 380
    Width = 80
    Height = 13
    Caption = 'Analysis Code 3'
  end
  object lblAnalysis4: TLabel
    Left = 16
    Top = 412
    Width = 80
    Height = 13
    Caption = 'Analysis Code 4'
  end
  object OKBitBtn: TBitBtn
    Left = 278
    Top = 557
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
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
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 366
    Top = 557
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 112
    Top = 8
    Width = 265
    Height = 537
    Caption = 'Change from  '
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      265
      537)
    object edtTown: TEdit
      Left = 32
      Top = 28
      Width = 201
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = 'edtTown'
    end
    object edtCounty: TEdit
      Left = 32
      Top = 58
      Width = 201
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = 'edtCounty'
    end
    object chkbxInvUpfront: TCheckBox
      Left = 32
      Top = 487
      Width = 97
      Height = 17
      TabOrder = 13
    end
    object edtVatRate: TEdit
      Left = 32
      Top = 183
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 5
      Text = 'edtVatRate'
    end
    object edtType: TEdit
      Left = 32
      Top = 213
      Width = 201
      Height = 21
      ReadOnly = True
      TabOrder = 6
      Text = 'edtType'
    end
    object edtRevenuecentre: TEdit
      Left = 32
      Top = 276
      Width = 201
      Height = 21
      ReadOnly = True
      TabOrder = 8
      Text = 'edtRevenuecentre'
    end
    object edtStatus: TEdit
      Left = 32
      Top = 426
      Width = 201
      Height = 21
      ReadOnly = True
      TabOrder = 11
      Text = 'edtStatus'
    end
    object edtPaymentTerms: TEdit
      Left = 32
      Top = 457
      Width = 201
      Height = 21
      ReadOnly = True
      TabOrder = 12
      Text = 'edtPaymentTerms'
    end
    object chkbxActive: TCheckBox
      Left = 32
      Top = 518
      Width = 97
      Height = 17
      TabOrder = 14
    end
    object edtRep: TEdit
      Left = 32
      Top = 120
      Width = 201
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = 'edtRep'
    end
    object edtImportance: TEdit
      Left = 32
      Top = 245
      Width = 201
      Height = 21
      ReadOnly = True
      TabOrder = 7
      Text = 'edtImportance'
    end
    object edtAnalysis1: TEdit
      Left = 32
      Top = 304
      Width = 201
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 9
      Text = 'edtAnalysis1'
    end
    object edtAnalysis2: TEdit
      Left = 32
      Top = 336
      Width = 201
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 10
      Text = 'edtAnalysis2'
    end
    object edtAccManager: TEdit
      Left = 32
      Top = 88
      Width = 201
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = 'edtAccManager'
    end
    object edtSecondaryRep: TEdit
      Left = 32
      Top = 152
      Width = 201
      Height = 21
      ReadOnly = True
      TabOrder = 4
      Text = 'edtSecondaryRep'
    end
    object edtAnalysis3: TEdit
      Left = 32
      Top = 368
      Width = 201
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 15
      Text = 'edtAnalysis3'
    end
    object edtAnalysis4: TEdit
      Left = 32
      Top = 400
      Width = 201
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 16
      Text = 'edtAnalysis4'
    end
  end
  object GroupBox2: TGroupBox
    Left = 408
    Top = 8
    Width = 337
    Height = 537
    Caption = 'Change to  '
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      337
      537)
    object edtTownTo: TEdit
      Tag = 1
      Left = 32
      Top = 28
      Width = 201
      Height = 21
      TabOrder = 0
      Text = 'edtTownTo'
      OnChange = CheckOK
    end
    object edtCountyTo: TEdit
      Tag = 1
      Left = 32
      Top = 58
      Width = 201
      Height = 21
      TabOrder = 1
      Text = 'edtCountyTo'
      OnChange = CheckOK
    end
    object chkbxInvUpfrontTo: TCheckBox
      Left = 32
      Top = 485
      Width = 97
      Height = 17
      State = cbGrayed
      TabOrder = 24
      OnClick = CheckOK
    end
    object chkbxActiveTo: TCheckBox
      Left = 32
      Top = 516
      Width = 97
      Height = 17
      State = cbGrayed
      TabOrder = 25
      OnClick = CheckOK
    end
    object btnVat: TBitBtn
      Left = 249
      Top = 183
      Width = 25
      Height = 23
      Hint = 'Customer Type maintenance'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnVatClick
    end
    object btnType: TBitBtn
      Left = 249
      Top = 212
      Width = 25
      Height = 23
      Hint = 'Customer Type maintenance'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = btnTypeClick
    end
    object btnRevCentre: TBitBtn
      Left = 249
      Top = 274
      Width = 25
      Height = 23
      Hint = 'Customer Type maintenance'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      OnClick = btnRevCentreClick
    end
    object btnPaymentTerms: TBitBtn
      Left = 249
      Top = 454
      Width = 25
      Height = 23
      Hint = 'Customer Type maintenance'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 22
      OnClick = btnPaymentTermsClick
    end
    object dblkpVatRate: TDBLookupComboBox
      Tag = 1
      Left = 32
      Top = 184
      Width = 145
      Height = 21
      KeyField = 'Vat_Code'
      ListField = 'Description'
      TabOrder = 5
      OnClick = CheckOK
    end
    object dblkpType: TDBLookupComboBox
      Tag = 1
      Left = 32
      Top = 214
      Width = 201
      Height = 21
      KeyField = 'Customer_Type'
      ListField = 'Description'
      TabOrder = 8
      OnClick = CheckOK
    end
    object dblkpRevenueCentre: TDBLookupComboBox
      Tag = 1
      Left = 32
      Top = 276
      Width = 201
      Height = 21
      KeyField = 'Invoice_location'
      ListField = 'Invoice_Location_Descr'
      TabOrder = 14
      OnClick = CheckOK
    end
    object dblkpStatus: TDBLookupComboBox
      Tag = 1
      Left = 32
      Top = 424
      Width = 201
      Height = 21
      KeyField = 'Customer_Status'
      ListField = 'Customer_Status_Descr'
      TabOrder = 19
      OnClick = CheckOK
    end
    object dblkpPaymentTerms: TDBLookupComboBox
      Tag = 1
      Left = 32
      Top = 455
      Width = 201
      Height = 21
      KeyField = 'Payment_Terms'
      ListField = 'Payment_Terms_Description'
      TabOrder = 21
      OnClick = CheckOK
    end
    object dblkpRep: TDBLookupComboBox
      Tag = 1
      Left = 32
      Top = 120
      Width = 201
      Height = 21
      KeyField = 'Rep'
      ListField = 'Rep_Name'
      TabOrder = 2
      OnClick = CheckOK
    end
    object btnReps: TBitBtn
      Left = 249
      Top = 119
      Width = 25
      Height = 23
      Hint = 'Customer Type maintenance'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnRepsClick
    end
    object btbtnClearAccInfo: TBitBtn
      Left = 288
      Top = 118
      Width = 25
      Height = 23
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
      TabOrder = 4
      OnClick = btbtnClearAccInfoClick
    end
    object BitBtn1: TBitBtn
      Left = 288
      Top = 183
      Width = 25
      Height = 23
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
      TabOrder = 7
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 288
      Top = 212
      Width = 25
      Height = 23
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
      TabOrder = 10
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 288
      Top = 274
      Width = 25
      Height = 23
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
      TabOrder = 16
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 288
      Top = 454
      Width = 25
      Height = 23
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
      TabOrder = 23
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 288
      Top = 424
      Width = 25
      Height = 23
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
      TabOrder = 20
      OnClick = BitBtn5Click
    end
    object dblkpImportance: TDBLookupComboBox
      Tag = 1
      Left = 32
      Top = 246
      Width = 201
      Height = 21
      KeyField = 'Level_of_Importance'
      ListField = 'Importance_Description'
      TabOrder = 11
      OnClick = CheckOK
    end
    object BitBtn6: TBitBtn
      Left = 249
      Top = 244
      Width = 25
      Height = 23
      Hint = 'Customer Type maintenance'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = BitBtn6Click
    end
    object BitBtn7: TBitBtn
      Left = 288
      Top = 244
      Width = 25
      Height = 23
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
      TabOrder = 13
      OnClick = BitBtn7Click
    end
    object edtAnalysisTo1: TEdit
      Tag = 1
      Left = 32
      Top = 304
      Width = 201
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 17
      Text = 'edtAnalysisTo1'
    end
    object edtAnalysisTo2: TEdit
      Tag = 1
      Left = 32
      Top = 336
      Width = 201
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 18
      Text = 'edtAnalysisTo2'
    end
    object dblkpAccManager: TDBLookupComboBox
      Tag = 1
      Left = 32
      Top = 88
      Width = 201
      Height = 21
      KeyField = 'Operator'
      ListField = 'Operator_Name'
      TabOrder = 26
      OnClick = CheckOK
    end
    object BitBtn8: TBitBtn
      Left = 249
      Top = 87
      Width = 25
      Height = 23
      Hint = 'Customer Type maintenance'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 27
      OnClick = BitBtn8Click
    end
    object BitBtn9: TBitBtn
      Left = 288
      Top = 86
      Width = 25
      Height = 23
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
      TabOrder = 28
      OnClick = BitBtn9Click
    end
    object dblkpSecondaryRep: TDBLookupComboBox
      Tag = 1
      Left = 32
      Top = 152
      Width = 201
      Height = 21
      KeyField = 'Rep'
      ListField = 'Rep_Name'
      TabOrder = 29
      OnClick = CheckOK
    end
    object BitBtn10: TBitBtn
      Left = 249
      Top = 151
      Width = 25
      Height = 23
      Hint = 'Customer Type maintenance'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 30
      OnClick = btnRepsClick
    end
    object BitBtn11: TBitBtn
      Left = 288
      Top = 150
      Width = 25
      Height = 23
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
      TabOrder = 31
      OnClick = BitBtn11Click
    end
    object edtAnalysisTo3: TEdit
      Tag = 1
      Left = 32
      Top = 368
      Width = 201
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 32
      Text = 'edtAnalysisTo3'
    end
    object edtAnalysisTo4: TEdit
      Tag = 1
      Left = 32
      Top = 400
      Width = 201
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 33
      Text = 'edtAnalysisTo4'
    end
  end
end
