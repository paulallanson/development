object PBMaintOpsDetFrm: TPBMaintOpsDetFrm
  Left = 320
  Top = 60
  BorderStyle = bsDialog
  Caption = 'Operator Details'
  ClientHeight = 560
  ClientWidth = 525
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  DesignSize = (
    525
    560)
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 57
    Height = 13
    Caption = 'Login Name'
  end
  object Label2: TLabel
    Left = 8
    Top = 37
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object DelLabel: TLabel
    Left = 185
    Top = 529
    Width = 146
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Really Delete This User ?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 197
    ExplicitTop = 538
  end
  object Label4: TLabel
    Left = 8
    Top = 186
    Width = 75
    Height = 13
    Caption = 'Associated Rep'
  end
  object RepNASpeedButton: TSpeedButton
    Left = 272
    Top = 181
    Width = 23
    Height = 23
    Hint = 'Clear the current entry'
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
    OnClick = RepNASpeedButtonClick
  end
  object Label6: TLabel
    Left = 8
    Top = 134
    Width = 66
    Height = 13
    Caption = 'Email Address'
  end
  object Label7: TLabel
    Left = 368
    Top = 37
    Width = 29
    Height = 13
    Caption = 'Initials'
  end
  object Label8: TLabel
    Left = 8
    Top = 86
    Width = 31
    Height = 13
    Caption = 'Phone'
  end
  object Label9: TLabel
    Left = 8
    Top = 109
    Width = 51
    Height = 13
    Caption = 'Mobile No.'
  end
  object Label10: TLabel
    Left = 8
    Top = 158
    Width = 51
    Height = 13
    Caption = 'Web Email'
  end
  object Label13: TLabel
    Left = 8
    Top = 62
    Width = 40
    Height = 13
    Caption = 'Job Title'
  end
  object NameEdit: TEdit
    Left = 94
    Top = 33
    Width = 233
    Height = 21
    MaxLength = 40
    TabOrder = 2
    OnChange = NameEditChange
  end
  object LoginEdit: TEdit
    Left = 94
    Top = 8
    Width = 161
    Height = 21
    MaxLength = 16
    TabOrder = 0
    OnChange = LoginEditChange
  end
  object OKBitBtn: TBitBtn
    Left = 345
    Top = 523
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    Glyph.Data = {
      CE070000424DCE07000000000000360000002800000024000000120000000100
      1800000000009807000000000000000000000000000000000000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F7F00007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F7F0000007F00007F007F0000007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F0000007F00007F00007F0000
      7F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F000000
      7F00007F00007F00007F00007F00007F007F0000007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F
      7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F7F0000007F00007F00007F0000FF00007F00007F00007F00007F00
      7F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFF
      FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F00007F00007F0000FF00007F7F
      00FF00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F7F7F7FFFFFFF007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00
      007F0000FF00007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F00
      7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F00FF
      00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F
      7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF0000
      7F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F
      7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00
      007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFF
      FFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F00FF00007F00007F007F0000007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F
      7F7FFFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00007F
      00007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F}
    NumGlyphs = 2
    TabOrder = 12
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 433
    Top = 523
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 13
  end
  object RepComboBox: TDBLookupComboBox
    Left = 94
    Top = 182
    Width = 161
    Height = 21
    KeyField = 'Rep'
    ListField = 'Name'
    ListSource = RepsDS
    TabOrder = 9
    OnClick = RepComboBoxClick
  end
  object EmailEdit: TEdit
    Left = 94
    Top = 130
    Width = 259
    Height = 21
    MaxLength = 40
    TabOrder = 7
    OnChange = NameEditChange
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 215
    Width = 513
    Height = 306
    ActivePage = tbshtQuoting
    TabOrder = 10
    object tbshtAccess: TTabSheet
      Caption = 'Access Control'
      object Label3: TLabel
        Left = 8
        Top = 156
        Width = 70
        Height = 13
        Caption = 'Access Profile:'
      end
      object SelectScrollBox: TScrollBox
        Left = 0
        Top = 0
        Width = 505
        Height = 278
        VertScrollBar.Tracking = True
        Align = alClient
        TabOrder = 0
        Visible = False
        object AllLabel: TLabel
          Left = 128
          Top = 10
          Width = 11
          Height = 13
          Caption = 'All'
        end
        object AllComboBox: TComboBox
          Left = 8
          Top = 8
          Width = 113
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = AllComboBoxChange
          Items.Strings = (
            'Full'
            'Block'
            'Notes'
            'Enquiry'
            'Rep'
            'Account Manager'
            'Operator'
            'Various')
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Customers'
      ImageIndex = 5
      object chkbxCannotChangeRep: TCheckBox
        Left = 24
        Top = 17
        Width = 209
        Height = 17
        Caption = 'Cannot Change Rep'
        TabOrder = 0
      end
      object chkbxCanMaintainCreditDetails: TCheckBox
        Left = 24
        Top = 41
        Width = 209
        Height = 17
        Caption = 'Can Maintain Credit Details'
        TabOrder = 1
      end
    end
    object tbshtQuoting: TTabSheet
      Caption = 'Quoting'
      ImageIndex = 7
      object chkbxCanDeleteQuoteCosts: TCheckBox
        Left = 24
        Top = 6
        Width = 249
        Height = 17
        Caption = 'Can maintain internal quote && job costs'
        TabOrder = 0
      end
    end
    object tbshtEnqs: TTabSheet
      Caption = 'Enquiries'
      ImageIndex = 2
      object chkbxCannotViewPrices: TCheckBox
        Left = 24
        Top = 17
        Width = 209
        Height = 17
        Caption = 'Cannot view Job Pricing sales prices'
        TabOrder = 0
      end
      object chkbxCanConvert: TCheckBox
        Left = 24
        Top = 41
        Width = 249
        Height = 17
        Caption = 'Can convert Enquiries to Purchase Orders'
        TabOrder = 1
      end
    end
    object tbshtPO: TTabSheet
      Caption = 'POs and Job Bags'
      ImageIndex = 1
      object Label5: TLabel
        Left = 8
        Top = 8
        Width = 89
        Height = 26
        Caption = 'Max Unauthorised PO Cost Value'
        WordWrap = True
      end
      object Label11: TLabel
        Left = 224
        Top = 202
        Width = 201
        Height = 13
        Caption = 'Restrict Access to these Revenue Centres'
      end
      object Label12: TLabel
        Left = 8
        Top = 48
        Width = 77
        Height = 26
        Caption = 'Authorised Cost Value Limit'
        WordWrap = True
      end
      object memCreditLimit: TMemo
        Left = 102
        Top = 11
        Width = 90
        Height = 21
        Alignment = taRightJustify
        TabOrder = 0
        WantReturns = False
        WordWrap = False
        OnExit = memCreditLimitExit
      end
      object rdgrpMinPO: TRadioGroup
        Left = 8
        Top = 141
        Width = 185
        Height = 57
        Caption = 'Minimum PO Sales Value'
        ItemIndex = 0
        Items.Strings = (
          'Fixed Value'
          '% Uplift on Cost')
        ParentBackground = False
        TabOrder = 2
        OnClick = rdgrpMinPOClick
      end
      object GroupBox1: TGroupBox
        Left = 224
        Top = 142
        Width = 185
        Height = 55
        ParentBackground = False
        TabOrder = 3
        object lblValue: TLabel
          Left = 22
          Top = 24
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Value'
        end
        object memMinValue: TMemo
          Left = 55
          Top = 20
          Width = 90
          Height = 21
          Alignment = taRightJustify
          TabOrder = 0
          WantReturns = False
          WordWrap = False
          OnExit = memCreditLimitExit
        end
      end
      object chkbxCanDeleteFromJB: TCheckBox
        Left = 224
        Top = 49
        Width = 249
        Height = 17
        Caption = 'Can delete Purchase Orders from Job Bags'
        TabOrder = 4
      end
      object chkbxCanMaintainPO: TCheckBox
        Left = 224
        Top = 30
        Width = 249
        Height = 17
        Caption = 'Can maintain Purchase Orders in Job Bags'
        TabOrder = 5
      end
      object chkbxCanOverride: TCheckBox
        Left = 224
        Top = 68
        Width = 249
        Height = 17
        Caption = 'Can override Paid Stock in Purchase Orders'
        TabOrder = 6
      end
      object rdgrpAuthorise: TRadioGroup
        Left = 8
        Top = 202
        Width = 185
        Height = 73
        Caption = 'Authorise POs'
        ItemIndex = 0
        Items.Strings = (
          'No'
          'Only POs > zero sales value'
          'Fully')
        ParentBackground = False
        TabOrder = 7
      end
      object chkbxCanDeleteJobBags: TCheckBox
        Left = 224
        Top = 87
        Width = 249
        Height = 17
        Caption = 'Can delete/cancel job bags'
        TabOrder = 8
      end
      object chkbxCanConfirmProduction: TCheckBox
        Left = 224
        Top = 106
        Width = 249
        Height = 17
        Caption = 'Can confirm Production complete'
        TabOrder = 9
      end
      object lstbxRevenue: TListBox
        Left = 224
        Top = 218
        Width = 185
        Height = 57
        ItemHeight = 13
        TabOrder = 10
      end
      object btnRevenueCentre: TBitBtn
        Left = 424
        Top = 218
        Width = 25
        Height = 23
        Caption = '+'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = btnRevenueCentreClick
      end
      object BitBtn1: TBitBtn
        Left = 424
        Top = 242
        Width = 25
        Height = 23
        Caption = '-'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnClick = BitBtn1Click
      end
      object lstbxRevenueCode: TListBox
        Left = 456
        Top = 218
        Width = 25
        Height = 57
        ItemHeight = 13
        TabOrder = 13
        Visible = False
      end
      object memAuthLimit: TMemo
        Left = 102
        Top = 50
        Width = 90
        Height = 21
        Alignment = taRightJustify
        TabOrder = 1
        WantReturns = False
        WordWrap = False
        OnExit = memCreditLimitExit
      end
      object chkbxCanChangeInvOrders: TCheckBox
        Left = 224
        Top = 124
        Width = 249
        Height = 17
        Caption = 'Can change invoiced orders/job bags'
        TabOrder = 14
      end
      object chkbxCanDeletePOs: TCheckBox
        Left = 224
        Top = 11
        Width = 249
        Height = 17
        Caption = 'Can delete/cancel Purchase Orders'
        TabOrder = 15
      end
    end
    object tbshtStock: TTabSheet
      Caption = 'Stock'
      ImageIndex = 3
      object chkbxCanDeactivateProds: TCheckBox
        Left = 16
        Top = 14
        Width = 257
        Height = 17
        Caption = 'Can Activate/Deactivate products'
        TabOrder = 0
      end
    end
    object tbshtInvoicing: TTabSheet
      Caption = 'Invoicing'
      ImageIndex = 4
      object chkbxSecurityUser: TCheckBox
        Left = 16
        Top = 14
        Width = 97
        Height = 17
        Caption = 'Security User'
        TabOrder = 0
      end
      object chkbxCanPass: TCheckBox
        Left = 16
        Top = 41
        Width = 161
        Height = 17
        Caption = 'Can Pass Purchase Invoices'
        TabOrder = 1
      end
    end
    object tbshtCRM: TTabSheet
      Caption = 'CRM'
      ImageIndex = 6
      object chkbxActivityAdministrator: TCheckBox
        Left = 16
        Top = 14
        Width = 201
        Height = 17
        Caption = 'Activity Administrator'
        TabOrder = 0
      end
      object GroupBox2: TGroupBox
        Left = 16
        Top = 40
        Width = 185
        Height = 185
        Caption = 'Set Activity Reminders'
        ParentBackground = False
        TabOrder = 1
        object chkbxEnquiryReminder: TCheckBox
          Left = 16
          Top = 30
          Width = 150
          Height = 17
          Caption = 'Enquiries'
          TabOrder = 0
        end
        object chkbxQuoteReminder: TCheckBox
          Left = 16
          Top = 55
          Width = 150
          Height = 17
          Caption = 'Quotes'
          TabOrder = 1
        end
        object chkbxProofReminder: TCheckBox
          Left = 16
          Top = 81
          Width = 150
          Height = 17
          Caption = 'Proofs'
          TabOrder = 2
        end
        object chkbxReorderReminder: TCheckBox
          Left = 16
          Top = 106
          Width = 150
          Height = 17
          Caption = 'Reordering'
          TabOrder = 3
        end
        object chkbxOrderAckReminder: TCheckBox
          Left = 16
          Top = 132
          Width = 150
          Height = 17
          Caption = 'Order Acknowledgement '
          TabOrder = 4
        end
        object chkbxDeliveryReminder: TCheckBox
          Left = 16
          Top = 158
          Width = 150
          Height = 17
          Caption = 'Job Delivery'
          TabOrder = 5
        end
      end
    end
  end
  object ShortNameEdit: TEdit
    Left = 409
    Top = 33
    Width = 85
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 40
    TabOrder = 3
    OnChange = NameEditChange
  end
  object ChgPassBitBtn: TBitBtn
    Left = -4
    Top = 522
    Width = 137
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Change Password'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5000555555555555577755555555555550B0555555555555F7F7555555555550
      00B05555555555577757555555555550B3B05555555555F7F557555555555000
      3B0555555555577755755555555500B3B0555555555577555755555555550B3B
      055555FFFF5F7F5575555700050003B05555577775777557555570BBB00B3B05
      555577555775557555550BBBBBB3B05555557F555555575555550BBBBBBB0555
      55557F55FF557F5555550BB003BB075555557F577F5575F5555577B003BBB055
      555575F7755557F5555550BB33BBB0555555575F555557F555555507BBBB0755
      55555575FFFF7755555555570000755555555557777775555555}
    NumGlyphs = 2
    TabOrder = 11
    OnClick = ChgPassBitBtnClick
  end
  object PhoneEdit: TEdit
    Left = 94
    Top = 82
    Width = 161
    Height = 21
    MaxLength = 40
    TabOrder = 5
    OnChange = NameEditChange
  end
  object MobileEdit: TEdit
    Left = 94
    Top = 105
    Width = 161
    Height = 21
    MaxLength = 40
    TabOrder = 6
    OnChange = NameEditChange
  end
  object chkbxCanLogin: TCheckBox
    Left = 368
    Top = 8
    Width = 153
    Height = 17
    Caption = 'Operator can login'
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object WebEmailEdit: TEdit
    Left = 94
    Top = 154
    Width = 259
    Height = 21
    MaxLength = 40
    TabOrder = 8
    OnChange = NameEditChange
  end
  object JobTitleEdit: TEdit
    Left = 94
    Top = 58
    Width = 161
    Height = 21
    MaxLength = 40
    TabOrder = 4
    OnChange = NameEditChange
  end
  object GetChecksSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Button_Name, Button_Status'
      'From Operator_Button'
      'Where (Operator = :Operator)')
    Left = 410
    Top = 150
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object CheckExistsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Operator'
      'From Operator'
      'Where (Login_Name = :Login_Name) and'
      '      (Operator <> :Operator)')
    Left = 474
    Top = 262
    ParamData = <
      item
        Name = 'Login_Name'
      end
      item
        Name = 'Operator'
      end>
  end
  object GetLastOpSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Operator FROM Operator WHERE Name = :GUID')
    Left = 170
    Top = 302
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddOpSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Operator (Operator, Name, Operator_Can_Login)'
      'SELECT Max(Operator)+1, :GUID, '#39'N'#39' FROM Operator')
    Left = 474
    Top = 214
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdOpSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Operator'
      'Set'
      'Name = :Name,'
      'Login_Name = :Login_Name,'
      'Short_Name = :Short_Name,'
      'Operator_Can_Login = :Operator_Can_Login,'
      'Rep = :Rep,'
      'security_user = :security_user,'
      'Email = :Email,'
      'Max_Unauthorised_PO_Value = :Max_Unauthorised_PO_Value,'
      'Authorised_PO_Cost_Limit = :Authorised_PO_Cost_Limit,'
      'Min_PO_Sales_Value_Type = :Min_PO_Sales_Value_Type,'
      'Min_PO_Sales_Value = :Min_PO_Sales_Value,'
      'Delete_PO_From_Job_Bag = :Delete_PO_From_Job_Bag,'
      'Maintain_PO_in_Job_Bag = :Maintain_PO_in_Job_Bag,'
      'Can_Pass_Purchase_invoices = :Can_Pass_Purchase_Invoices,'
      'Override_Paid_Stock = :Override_Paid_Stock,'
      'Can_Authorise_PO = :Can_Authorise_PO,'
      'Cannot_View_Enq_Prices = :Cannot_View_Enq_Prices,'
      'Can_Convert_Enquiry = :Can_Convert_Enquiry,'
      'Phone = :Phone,'
      'Mobile_No = :Mobile_no,'
      'Can_Delete_Purchase_Orders = :Can_Delete_Purchase_Orders,'
      'Can_Delete_Job_Bags = :Can_Delete_Job_Bags,'
      'Can_Deactivate_Products = :Can_Deactivate_Products,'
      'Web_Ordering_Email = :Web_Ordering_Email,'
      'Can_Confirm_Production = :Can_Confirm_Production,'
      'Cannot_Change_Rep = :Cannot_Change_Rep,'
      'Can_Change_Invoiced_Orders = :Can_Change_Invoiced_Orders,'
      'Can_Update_Credit_Details = :Can_Update_Credit_Details,'
      'Activity_Administrator = :Activity_Administrator,'
      'Job_Title = :Job_Title,'
      'Set_Enquiry_Reminder = :Set_Enquiry_Reminder,'
      'Set_Quote_Reminder = :Set_Quote_Reminder,'
      'Set_Proof_Reminder = :Set_Proof_Reminder,'
      'Set_Reorder_Reminder = :Set_Reorder_Reminder,'
      'Set_Order_Ack_Reminder = :Set_Order_Ack_Reminder,'
      'Set_Delivery_Reminder = :Set_Delivery_Reminder,'
      'Can_Delete_Quote_Costs = :Can_Delete_Quote_Costs'
      'WHERE Operator = :Operator'
      '')
    Left = 194
    Top = 262
    ParamData = <
      item
        Name = 'Name'
      end
      item
        Name = 'Login_Name'
      end
      item
        Name = 'Short_Name'
      end
      item
        Name = 'Operator_Can_Login'
      end
      item
        Name = 'Rep'
        DataType = ftString
      end
      item
        Name = 'security_user'
      end
      item
        Name = 'Email'
      end
      item
        Name = 'Max_Unauthorised_PO_Value'
      end
      item
        Name = 'Authorised_PO_Cost_Limit'
      end
      item
        Name = 'Min_PO_Sales_Value_Type'
      end
      item
        Name = 'Min_PO_Sales_Value'
      end
      item
        Name = 'Delete_PO_From_Job_Bag'
      end
      item
        Name = 'Maintain_PO_in_Job_Bag'
      end
      item
        Name = 'Can_Pass_Purchase_Invoices'
      end
      item
        Name = 'Override_Paid_Stock'
      end
      item
        Name = 'Can_Authorise_PO'
      end
      item
        Name = 'Cannot_View_Enq_Prices'
      end
      item
        Name = 'Can_Convert_Enquiry'
      end
      item
        Name = 'Phone'
      end
      item
        Name = 'Mobile_no'
      end
      item
        Name = 'Can_Delete_Purchase_Orders'
      end
      item
        Name = 'Can_Delete_Job_Bags'
      end
      item
        Name = 'Can_Deactivate_Products'
      end
      item
        Name = 'Web_Ordering_Email'
      end
      item
        Name = 'Can_Confirm_Production'
      end
      item
        Name = 'Cannot_Change_Rep'
      end
      item
        Name = 'Can_Change_Invoiced_Orders'
      end
      item
        Name = 'Can_Update_Credit_Details'
      end
      item
        Name = 'Activity_Administrator'
      end
      item
        Name = 'Job_Title'
      end
      item
        Name = 'Set_Enquiry_Reminder'
      end
      item
        Name = 'Set_Quote_Reminder'
      end
      item
        Name = 'Set_Proof_Reminder'
      end
      item
        Name = 'Set_Reorder_Reminder'
      end
      item
        Name = 'Set_Order_Ack_Reminder'
      end
      item
        Name = 'Set_Delivery_Reminder'
      end
      item
        Name = 'Can_Delete_Quote_Costs'
      end
      item
        Name = 'Operator'
      end>
  end
  object DelOpChecksSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Operator_Button'
      'Where (Operator = :Operator) AND'
      'Button_Name LIKE '#39'mnu%'#39)
    Left = 410
    Top = 182
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object DelOpSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Operator'
      'Where (Operator = :Operator)')
    Left = 478
    Top = 310
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object AddCheckSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Operator_Button'
      '(Operator, Button_Name, Button_Status)'
      'Values'
      '(:Operator, :Button_Name, :Button_Status)'
      ''
      ' ')
    Left = 446
    Top = 182
    ParamData = <
      item
        Name = 'Operator'
      end
      item
        Name = 'Button_Name'
      end
      item
        Name = 'Button_Status'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Operator (Operator, Name, Operator_Can_Login)'
      'SELECT Max(Operator)+1, :GUID, '#39'N'#39' FROM Operator')
    Left = 442
    Top = 150
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object GetLoginDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'sp_helplogins :User_Code')
    Left = 182
    Top = 34
    ParamData = <
      item
        Name = 'User_Code'
      end>
  end
  object ChangePassSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'sp_password :Old_Pass, :New_Pass, :User_Code'
      ''
      ' '
      ' ')
    Left = 310
    Top = 6
    ParamData = <
      item
        Name = 'Old_Pass'
      end
      item
        Name = 'New_Pass'
      end
      item
        Name = 'User_Code'
      end>
  end
  object GetRepsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Rep, Name'
      'From Rep'
      'Order By Name'
      ' ')
    Left = 182
    Top = 126
  end
  object RepsDS: TDataSource
    DataSet = GetRepsSQL
    Left = 214
    Top = 126
  end
  object CheckShortNameExistsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Operator'
      'From Operator'
      'Where (Short_Name = :Short_Name) and'
      '      (Operator <> :Operator)')
    Left = 306
    Top = 278
    ParamData = <
      item
        Name = 'Short_Name'
      end
      item
        Name = 'Operator'
      end>
  end
  object qryRevCodes: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Operator_Invoice_Location.Operator,'
      '        Operator_Invoice_Location.Invoice_location,'
      '        Invoice_Location.Invoice_Location_Descr'
      'from Operator_Invoice_Location, Invoice_location'
      'where'
      'Operator_Invoice_Location.Operator = :Operator and'
      
        'Operator_Invoice_Location.Invoice_Location = Invoice_Location.In' +
        'voice_Location'
      'Order by Invoice_Location.Invoice_Location_Descr'
      '')
    Left = 304
    Top = 88
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object qryDelRevCodes: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Operator_Invoice_Location'
      'where Operator_Invoice_Location.Operator = :Operator')
    Left = 368
    Top = 96
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object qryAddRevCodes: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Operator_Invoice_Location'
      'values (:Operator, :Invoice_location, '#39'N'#39')'
      '')
    Left = 432
    Top = 88
    ParamData = <
      item
        Name = 'Operator'
      end
      item
        Name = 'Invoice_location'
      end>
  end
end
