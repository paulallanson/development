object PBMaintContractFrm: TPBMaintContractFrm
  Left = 149
  Top = 26
  Caption = 'Maintain Contract'
  ClientHeight = 621
  ClientWidth = 954
  Color = clBtnFace
  Constraints.MinHeight = 660
  Constraints.MinWidth = 970
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
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 602
    Width = 954
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 954
    Height = 41
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      954
      41)
    object lblQuoteNo: TLabel
      Left = 9
      Top = 15
      Width = 63
      Height = 13
      Caption = 'Contract No'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 186
      Top = 15
      Width = 24
      Height = 13
      Caption = 'Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblAccountManager: TLabel
      Left = 666
      Top = 15
      Width = 93
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Account Manager'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 676
    end
    object Label5: TLabel
      Left = 440
      Top = 15
      Width = 112
      Height = 13
      Alignment = taRightJustify
      Caption = 'Commencement Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtContract: TEdit
      Left = 85
      Top = 11
      Width = 81
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtDate: TEdit
      Left = 221
      Top = 11
      Width = 81
      Height = 21
      TabOrder = 1
      OnExit = edtDateExit
    end
    object btnDate: TBitBtn
      Left = 309
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
    object edtOfficeContact: TEdit
      Left = 780
      Top = 11
      Width = 95
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object btnAccountManager: TButton
      Left = 893
      Top = 8
      Width = 23
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnAccountManagerClick
    end
    object edtEffectiveDate: TEdit
      Left = 562
      Top = 11
      Width = 81
      Height = 21
      TabOrder = 5
      OnExit = edtEffectiveDateExit
    end
    object BitBtn9: TBitBtn
      Left = 653
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
      TabOrder = 6
      OnClick = BitBtn9Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 563
    Width = 954
    Height = 39
    Align = alBottom
    ParentBackground = False
    TabOrder = 3
    object lblGDPRSignedStatement: TLabel
      Left = 11
      Top = 13
      Width = 181
      Height = 13
      Caption = 'GDPR Policy has not been signed!!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object pnlBottom: TPanel
      Left = 577
      Top = 1
      Width = 376
      Height = 37
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        376
        37)
      object lblDeletePrompt: TLabel
        Left = 83
        Top = 13
        Width = 107
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'Delete this Contract?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object btnOK: TBitBtn
        Left = 202
        Top = 6
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
        Left = 290
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
      end
      object btnSave: TBitBtn
        Left = 109
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Save'
        Default = True
        Enabled = False
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
        TabOrder = 2
        OnClick = btnSaveClick
      end
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 41
    Width = 954
    Height = 224
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      954
      224)
    object Label2: TLabel
      Left = 8
      Top = 10
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
    object Label6: TLabel
      Left = 8
      Top = 37
      Width = 40
      Height = 13
      Caption = 'Contact'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 118
      Width = 59
      Height = 13
      Caption = 'Description'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 694
      Top = 13
      Width = 67
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Total Volume'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 704
    end
    object Label9: TLabel
      Left = 8
      Top = 64
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
    object Label3: TLabel
      Left = 671
      Top = 40
      Width = 97
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Minumum Volume'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 681
    end
    object Label10: TLabel
      Left = 723
      Top = 67
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Duration'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 733
    end
    object Label11: TLabel
      Left = 636
      Top = 149
      Width = 133
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Termination Notice Period'
      ExplicitLeft = 646
    end
    object Label12: TLabel
      Left = 649
      Top = 176
      Width = 120
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Term After Initial Period'
      ExplicitLeft = 659
    end
    object Label13: TLabel
      Left = 8
      Top = 176
      Width = 75
      Height = 13
      Caption = 'Payment Terms'
    end
    object Label14: TLabel
      Left = 697
      Top = 202
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Review Period'
      ExplicitLeft = 707
    end
    object Label7: TLabel
      Left = 715
      Top = 96
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Frequency'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 725
    end
    object edtCustomer: TEdit
      Left = 84
      Top = 6
      Width = 300
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 0
    end
    object btnCustomer: TBitBtn
      Left = 397
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
      Left = 324
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
      TabOrder = 3
      OnClick = BitBtn4Click
    end
    object dblkpContact: TDBLookupComboBox
      Left = 84
      Top = 33
      Width = 225
      Height = 21
      KeyField = 'Contact_no'
      ListField = 'Name'
      TabOrder = 2
      OnClick = dblkpContactClick
    end
    object memQuantity: TMemo
      Left = 780
      Top = 8
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 11
      OnChange = memQuantityChange
      OnEnter = memQuantityEnter
      OnExit = memQuantityExit
      OnKeyPress = memQuantityKeyPress
    end
    object btnRep: TBitBtn
      Left = 324
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
      TabOrder = 5
      OnClick = btnRepClick
    end
    object edtRep: TEdit
      Left = 84
      Top = 60
      Width = 225
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object pnlSubReps: TPanel
      Left = 1
      Top = 83
      Width = 666
      Height = 27
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 6
      object Label52: TLabel
        Left = 6
        Top = 8
        Width = 43
        Height = 13
        Caption = 'Sub Rep'
      end
      object edtSubRep: TEdit
        Left = 83
        Top = 4
        Width = 224
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnSubRep: TBitBtn
        Left = 323
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
    object memMinVolume: TMemo
      Left = 780
      Top = 35
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 12
      OnChange = memMinVolumeChange
      OnEnter = memQuantityEnter
      OnExit = memQuantityExit
      OnKeyPress = memQuantityKeyPress
    end
    object dblkpDurationType: TDBLookupComboBox
      Left = 850
      Top = 63
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'ID'
      ListField = 'Period_Description'
      TabOrder = 14
      OnClick = dblkpDurationTypeClick
    end
    object memNoticePeriod: TMemo
      Left = 780
      Top = 145
      Width = 53
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 17
      OnChange = memNoticePeriodChange
      OnExit = memQuantityExit
      OnKeyPress = memQuantityKeyPress
    end
    object dblkpNoticeType: TDBLookupComboBox
      Left = 850
      Top = 145
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'ID'
      ListField = 'Period_Description'
      TabOrder = 18
      OnClick = dblkpNoticeTypeClick
    end
    object memTermPeriod: TMemo
      Left = 780
      Top = 172
      Width = 53
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 19
      OnChange = memTermPeriodChange
      OnExit = memQuantityExit
      OnKeyPress = memQuantityKeyPress
    end
    object dblkpTermType: TDBLookupComboBox
      Left = 850
      Top = 172
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'ID'
      ListField = 'Period_Description'
      TabOrder = 20
      OnClick = dblkpTermTypeClick
    end
    object dblkpPaymentTerms: TDBLookupComboBox
      Left = 84
      Top = 172
      Width = 225
      Height = 21
      KeyField = 'Payment_Terms'
      ListField = 'Payment_Terms_Description'
      TabOrder = 8
      OnClick = dblkpPaymentTermsClick
    end
    object memReviewPeriod: TMemo
      Left = 780
      Top = 198
      Width = 53
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 21
      OnChange = memReviewPeriodChange
      OnExit = memQuantityExit
      OnKeyPress = memQuantityKeyPress
    end
    object dblkpReviewType: TDBLookupComboBox
      Left = 850
      Top = 198
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'ID'
      ListField = 'Period_Description'
      TabOrder = 22
      OnClick = dblkpReviewTypeClick
    end
    object btnTerms: TBitBtn
      Tag = 100
      Left = 324
      Top = 170
      Width = 25
      Height = 25
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
      OnClick = btnTermsClick
    end
    object BitBtn1: TBitBtn
      Tag = 100
      Left = 355
      Top = 170
      Width = 25
      Height = 25
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
      OnClick = BitBtn1Click
    end
    object edtDescription: TMemo
      Left = 84
      Top = 116
      Width = 572
      Height = 49
      Lines.Strings = (
        'edtDescription')
      TabOrder = 7
      OnChange = edtDescriptionChange
    end
    object dblkpFrequencyType: TDBLookupComboBox
      Left = 850
      Top = 92
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'ID'
      ListField = 'Period_Description'
      TabOrder = 16
      OnClick = dblkpFrequencyTypeClick
    end
    object spnDuration: TSpinEdit
      Left = 780
      Top = 62
      Width = 53
      Height = 22
      Anchors = [akTop, akRight]
      MaxValue = 999999
      MinValue = 1
      TabOrder = 13
      Value = 1
      OnChange = spnDurationChange
    end
    object spnFrequency: TSpinEdit
      Left = 780
      Top = 91
      Width = 53
      Height = 22
      Anchors = [akTop, akRight]
      MaxValue = 999999
      MinValue = 1
      TabOrder = 15
      Value = 1
      OnChange = spnFrequencyChange
    end
  end
  object pgDetails: TPageControl
    Left = 0
    Top = 265
    Width = 954
    Height = 221
    ActivePage = TabSheet3
    Align = alClient
    TabOrder = 2
    object TabSheet3: TTabSheet
      Caption = 'Job Bags'
      ImageIndex = 2
      object dbgJobDetails: TDBGrid
        Left = 0
        Top = 0
        Width = 861
        Height = 174
        Align = alClient
        DrawingStyle = gdsGradient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        OnDblClick = dbgJobDetailsDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Job_Bag'
            Title.Caption = 'Job Bag'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Point'
            Title.Caption = 'Date'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Start'
            Title.Caption = 'Start Date'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Goods_Required'
            Title.Caption = 'Required Date'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Contact_Name'
            Title.Caption = 'Contact'
            Width = 141
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Job_Bag_Descr'
            Title.Caption = 'Description'
            Width = 237
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantity'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Rep_Name'
            Title.Caption = 'Rep'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Job_Bag_Status_Descr'
            Title.Caption = 'Status'
            Width = 140
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 861
        Top = 0
        Width = 85
        Height = 174
        Align = alRight
        ParentBackground = False
        TabOrder = 1
        OnClick = Panel3Click
        object btnJobAdd: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Hint = 'Add a new Works Instruction to this Job Bag'
          Caption = '&Add'
          TabOrder = 0
          OnClick = btnJobAddClick
        end
        object btnJobChange: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Hint = 'Change the selected Works Instruction'
          Caption = '&Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnJobChangeClick
        end
        object btnJobDelete: TBitBtn
          Left = 8
          Top = 136
          Width = 75
          Height = 25
          Hint = 'Delete the selected Works Instruction from this Job Bag'
          Caption = '&Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnJobDeleteClick
        end
        object btnJobExcel: TBitBtn
          Left = 8
          Top = 168
          Width = 75
          Height = 25
          Hint = 'Delete the selected Works Instruction from this Job Bag'
          Caption = '&Excel'
          Enabled = False
          TabOrder = 3
          OnClick = btnJobExcelClick
        end
        object btnJobRepeat: TBitBtn
          Left = 8
          Top = 104
          Width = 75
          Height = 25
          Hint = 'Delete the selected Works Instruction from this Job Bag'
          Caption = '&Repeat'
          Enabled = False
          TabOrder = 4
          OnClick = btnJobRepeatClick
        end
        object btnJobInsert: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Hint = 'Add a new Works Instruction to this Job Bag'
          Caption = '&Insert'
          TabOrder = 5
          OnClick = btnJobInsertClick
        end
      end
      object stsBrJobDetails: TStatusBar
        Left = 0
        Top = 174
        Width = 946
        Height = 19
        Panels = <
          item
            Width = 200
          end
          item
            Width = 50
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Buy Print Orders'
      ImageIndex = 3
      object Panel1: TPanel
        Left = 869
        Top = 0
        Width = 85
        Height = 186
        Align = alRight
        ParentBackground = False
        TabOrder = 0
        OnClick = Panel1Click
        object btnPOAdd: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Hint = 'Add a new Works Instruction to this Job Bag'
          Caption = '&Add'
          TabOrder = 0
          OnClick = btnPOAddClick
        end
        object btnPOChange: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Hint = 'Change the selected Works Instruction'
          Caption = '&Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnPOChangeClick
        end
        object btnPODelete: TBitBtn
          Left = 8
          Top = 104
          Width = 75
          Height = 25
          Hint = 'Delete the selected Works Instruction from this Job Bag'
          Caption = '&Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnPODeleteClick
        end
        object btnPOExcel: TBitBtn
          Left = 8
          Top = 136
          Width = 75
          Height = 25
          Hint = 'Delete the selected Works Instruction from this Job Bag'
          Caption = '&Excel'
          Enabled = False
          TabOrder = 3
          OnClick = btnPOExcelClick
        end
        object btnPORepeat: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Hint = 'Delete the selected Works Instruction from this Job Bag'
          Caption = '&Repeat'
          Enabled = False
          TabOrder = 4
          OnClick = btnPORepeatClick
        end
      end
      object dbgPODetails: TDBGrid
        Left = 0
        Top = 0
        Width = 869
        Height = 186
        Align = alClient
        DrawingStyle = gdsGradient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        OnDblClick = dbgPODetailsDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Purchase_Order'
            Title.Caption = 'Order'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Point'
            Title.Caption = 'Date'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Supplier_Name'
            Title.Caption = 'Supplier'
            Width = 263
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Contact_Name'
            Title.Caption = 'Contact'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Goods_Required'
            Title.Caption = 'Required Date'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Customers_Desc'
            Title.Caption = 'Description'
            Width = 237
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantity'
            Width = 68
            Visible = True
          end>
      end
      object stsBrPODetails: TStatusBar
        Left = 0
        Top = 186
        Width = 954
        Height = 19
        Panels = <
          item
            Width = 200
          end
          item
            Width = 50
          end>
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Invoices'
      ImageIndex = 3
      object dbgSalesInvoices: TDBGrid
        Left = 0
        Top = 0
        Width = 861
        Height = 165
        Align = alClient
        DrawingStyle = gdsGradient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgSalesInvoicesDrawColumnCell
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
        Left = 861
        Top = 0
        Width = 85
        Height = 165
        Align = alRight
        ParentBackground = False
        TabOrder = 1
        ExplicitLeft = 869
        ExplicitHeight = 177
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
      object Panel19: TPanel
        Left = 0
        Top = 165
        Width = 946
        Height = 28
        Align = alBottom
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          946
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
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Documents'
      ImageIndex = 1
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 954
        Height = 205
        Align = alClient
        Caption = 'Panel6'
        ParentBackground = False
        TabOrder = 0
        object Panel7: TPanel
          Left = 1
          Top = 180
          Width = 952
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
        object lstvwDocuments: TListView
          Left = 1
          Top = 1
          Width = 916
          Height = 179
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
          TabOrder = 1
          OnColumnClick = lstvwDocumentsColumnClick
          OnCompare = lstvwDocumentsCompare
          OnDblClick = lstvwDocumentsDblClick
        end
        object ToolBar1: TToolBar
          Left = 917
          Top = 1
          Width = 36
          Height = 179
          Align = alRight
          ButtonHeight = 30
          ButtonWidth = 30
          Caption = 'ToolBar1'
          EdgeBorders = [ebLeft, ebTop, ebRight]
          Images = imgIcons
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          object btnExcel: TToolButton
            Left = 0
            Top = 2
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
            Top = 32
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
      end
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 486
    Width = 954
    Height = 77
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 5
    object btnNotes: TBitBtn
      Left = 8
      Top = 13
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
    object chkbxInactive: TCheckBox
      Left = 8
      Top = 52
      Width = 193
      Height = 17
      Caption = 'Contract is inactive'
      TabOrder = 1
    end
  end
  object imgDocuments: TImageList
    Left = 528
    Top = 244
  end
  object imgIcons: TImageList
    Left = 528
    Top = 196
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
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 256
    Top = 312
  end
  object pmnuDocuments: TPopupMenu
    Left = 382
    Top = 310
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
      OnClick = pmnuSelectAllClick
    end
  end
  object svDlgOfficeDoc: TSaveDialog
    Left = 385
    Top = 382
  end
  object DocOpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofAllowMultiSelect, ofEnableSizing]
    Left = 528
    Top = 360
  end
end
