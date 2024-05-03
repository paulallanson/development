object frmPBMaintWorksOrders: TfrmPBMaintWorksOrders
  Left = 0
  Top = 2
  Caption = 'Maintain Works Instruction'
  ClientHeight = 537
  ClientWidth = 791
  Color = clBtnFace
  Constraints.MinHeight = 573
  Constraints.MinWidth = 803
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
    Width = 791
    Height = 38
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      791
      38)
    object Label1: TLabel
      Left = 6
      Top = 12
      Width = 58
      Height = 13
      Caption = 'WI Number'
    end
    object Label2: TLabel
      Left = 208
      Top = 12
      Width = 61
      Height = 13
      Caption = 'Date Raised'
    end
    object Label3: TLabel
      Left = 581
      Top = 12
      Width = 66
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Mailing Date'
    end
    object Label5: TLabel
      Left = 388
      Top = 12
      Width = 51
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Start Date'
    end
    object edtOrderNumber: TEdit
      Left = 72
      Top = 8
      Width = 81
      Height = 21
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtDate: TEdit
      Left = 272
      Top = 8
      Width = 81
      Height = 21
      Color = clBtnFace
      MaxLength = 30
      ReadOnly = True
      TabOrder = 1
      OnExit = edtDateExit
    end
    object edtDateReq: TEdit
      Left = 653
      Top = 8
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 30
      TabOrder = 2
      OnExit = edtDateReqExit
    end
    object btnDateRequired: TBitBtn
      Left = 741
      Top = 6
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
      TabOrder = 3
      OnClick = btnDateRequiredClick
    end
    object edtDateStart: TEdit
      Left = 445
      Top = 8
      Width = 81
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 30
      TabOrder = 4
      OnExit = edtDateStartExit
    end
    object btnDateStart: TBitBtn
      Left = 533
      Top = 6
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
      TabOrder = 5
      OnClick = btnDateStartClick
    end
  end
  object pgProduction: TPageControl
    Left = 0
    Top = 219
    Width = 791
    Height = 262
    ActivePage = tbProcesses
    Align = alClient
    PopupMenu = pmnuProcess
    TabOrder = 3
    object tbDespatch: TTabSheet
      Caption = 'Despatch Details'
      ImageIndex = 4
      object Panel7: TPanel
        Left = 697
        Top = 0
        Width = 86
        Height = 234
        Align = alRight
        ParentBackground = False
        TabOrder = 0
        object btnAddDelivs: TBitBtn
          Left = 5
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          TabOrder = 0
          OnClick = btnAddDelivsClick
        end
        object btnChangeDelivs: TBitBtn
          Left = 5
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeDelivsClick
        end
        object btnDeleteDelivs: TBitBtn
          Left = 5
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteDelivsClick
        end
      end
      object sgDelivs: TStringGrid
        Left = 0
        Top = 0
        Width = 697
        Height = 234
        Align = alClient
        ColCount = 7
        DefaultColWidth = 40
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 1
        OnDblClick = sgDelivsDblClick
        ColWidths = (
          40
          158
          118
          109
          87
          71
          84)
      end
    end
    object tbReturnAddress: TTabSheet
      Caption = 'Return Address'
      ImageIndex = 3
      object pnlReturnAddressTS: TPanel
        Left = 0
        Top = 0
        Width = 783
        Height = 234
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        ExplicitTop = -1
        object AddrGrpBox: TGroupBox
          Left = 160
          Top = 8
          Width = 393
          Height = 209
          Caption = 'Address Details'
          ParentBackground = False
          TabOrder = 0
          object AddrTypeLabel: TLabel
            Left = 8
            Top = 19
            Width = 51
            Height = 13
            Caption = 'Addr Type'
          end
          object BranchNameLabel: TLabel
            Left = 8
            Top = 42
            Width = 35
            Height = 13
            Caption = 'Branch'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 8
            Top = 65
            Width = 41
            Height = 13
            Caption = 'Address'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 8
            Top = 160
            Width = 47
            Height = 13
            Caption = 'Postcode'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Label19: TLabel
            Left = 8
            Top = 184
            Width = 37
            Height = 13
            Caption = 'County'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object NameEdit: TEdit
            Left = 85
            Top = 15
            Width = 252
            Height = 21
            MaxLength = 40
            ReadOnly = True
            TabOrder = 0
          end
          object BranchNameEdit: TEdit
            Tag = 100
            Left = 85
            Top = 38
            Width = 252
            Height = 21
            MaxLength = 40
            ReadOnly = True
            TabOrder = 1
          end
          object BuildingEdit: TEdit
            Tag = 100
            Left = 85
            Top = 61
            Width = 252
            Height = 21
            MaxLength = 40
            ReadOnly = True
            TabOrder = 2
          end
          object StreetEdit: TEdit
            Tag = 100
            Left = 85
            Top = 85
            Width = 252
            Height = 21
            MaxLength = 40
            ReadOnly = True
            TabOrder = 3
          end
          object LocaleEdit: TEdit
            Tag = 100
            Left = 85
            Top = 109
            Width = 252
            Height = 21
            MaxLength = 40
            ReadOnly = True
            TabOrder = 4
          end
          object TownEdit: TEdit
            Tag = 100
            Left = 85
            Top = 132
            Width = 252
            Height = 21
            MaxLength = 40
            ReadOnly = True
            TabOrder = 5
          end
          object PostCodeEdit: TEdit
            Tag = 100
            Left = 85
            Top = 156
            Width = 84
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            ReadOnly = True
            TabOrder = 6
          end
          object CountyEdit: TEdit
            Tag = 100
            Left = 85
            Top = 180
            Width = 116
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            ReadOnly = True
            TabOrder = 7
          end
          object SearchBtn: TButton
            Left = 352
            Top = 13
            Width = 25
            Height = 25
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
            OnClick = SearchBtnClick
          end
        end
        object rdgrpAddressType: TRadioGroup
          Left = 24
          Top = 8
          Width = 105
          Height = 105
          Caption = 'Address Type'
          Items.Strings = (
            'N/A'
            'Company'
            'Customer'
            'Ad hoc')
          ParentBackground = False
          TabOrder = 1
          OnClick = rdgrpAddressTypeClick
        end
      end
    end
    object tbEvents: TTabSheet
      Caption = 'Events'
      ImageIndex = 7
      object Panel3: TPanel
        Left = 0
        Top = 17
        Width = 305
        Height = 217
        Align = alLeft
        ParentBackground = False
        TabOrder = 0
        object sgEvents: TStringGrid
          Left = 1
          Top = 1
          Width = 303
          Height = 215
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
      object Panel8: TPanel
        Left = 418
        Top = 17
        Width = 365
        Height = 217
        Align = alRight
        ParentBackground = False
        TabOrder = 1
        object memEventNotes: TMemo
          Left = 1
          Top = 1
          Width = 363
          Height = 215
          Align = alClient
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 783
        Height = 17
        Align = alTop
        ParentBackground = False
        TabOrder = 2
      end
      object Panel18: TPanel
        Left = 305
        Top = 17
        Width = 113
        Height = 217
        Align = alClient
        ParentBackground = False
        TabOrder = 3
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
    end
    object tbProcesses: TTabSheet
      Caption = 'Processes'
      ImageIndex = 2
      OnEnter = tbProcessesEnter
      object pnlprocess: TPanel
        Left = 397
        Top = 0
        Width = 386
        Height = 234
        Align = alRight
        BevelInner = bvLowered
        ParentBackground = False
        TabOrder = 0
        object pnlprMachine: TPanel
          Left = 2
          Top = 165
          Width = 382
          Height = 67
          Align = alBottom
          ParentBackground = False
          TabOrder = 0
          object lblRunHours: TLabel
            Left = 238
            Top = 16
            Width = 73
            Height = 13
            Caption = 'Run Time (hrs)'
          end
          object lblMachineGroup: TLabel
            Left = 8
            Top = 16
            Width = 80
            Height = 13
            Caption = 'Machine Group'
          end
          object lblMachine: TLabel
            Left = 8
            Top = 44
            Width = 44
            Height = 13
            Caption = 'Machine'
          end
          object lblStaffCount: TLabel
            Left = 253
            Top = 44
            Width = 59
            Height = 13
            Caption = 'Staff Count'
          end
          object memHours: TMemo
            Left = 313
            Top = 12
            Width = 56
            Height = 21
            TabOrder = 0
            WantReturns = False
            WordWrap = False
            OnEnter = SaveValue
          end
          object dblkpMachineGroup: TDBLookupComboBox
            Left = 88
            Top = 12
            Width = 129
            Height = 21
            KeyField = 'Work_Centre_Group'
            ListField = 'Work_Centre_Group_Name'
            TabOrder = 1
            OnClick = dblkpMachineGroupClick
          end
          object dblkpMachine: TDBLookupComboBox
            Left = 88
            Top = 40
            Width = 129
            Height = 21
            KeyField = 'Work_Centre'
            ListField = 'Work_Centre_Name'
            TabOrder = 2
          end
          object memStaff: TMemo
            Left = 313
            Top = 40
            Width = 56
            Height = 21
            TabOrder = 3
            WantReturns = False
            WordWrap = False
            OnEnter = SaveValue
            OnExit = ValidateQty
            OnKeyPress = CheckKeyIsNumber
          end
        end
        object pnlprNotes: TPanel
          Left = 2
          Top = 169
          Width = 382
          Height = 5
          Align = alClient
          Caption = 'pnlprNotes'
          ParentBackground = False
          TabOrder = 1
          object memProcessNotes: TMemo
            Left = 1
            Top = 1
            Width = 380
            Height = 3
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object pnlprTop: TPanel
          Left = 2
          Top = 2
          Width = 382
          Height = 151
          Align = alTop
          ParentBackground = False
          TabOrder = 2
          DesignSize = (
            382
            151)
          object lblReceiptDate: TLabel
            Left = 8
            Top = 14
            Width = 92
            Height = 13
            Caption = 'Commence $ Date'
          end
          object lblQuantity: TLabel
            Left = 8
            Top = 45
            Width = 44
            Height = 13
            Caption = 'Quantity'
          end
          object lblNumberUp: TLabel
            Left = 198
            Top = 45
            Width = 97
            Height = 13
            Alignment = taRightJustify
            Caption = 'Number Up/Inserts'
          end
          object edtReceiptDate: TEdit
            Left = 220
            Top = 10
            Width = 99
            Height = 21
            TabOrder = 0
          end
          object btnReceiptDate: TBitBtn
            Left = 351
            Top = 8
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
            TabOrder = 1
            OnClick = btnReceiptDateClick
          end
          object memQuantity: TMemo
            Left = 103
            Top = 41
            Width = 80
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 2
            WantReturns = False
            WordWrap = False
            OnEnter = SaveValue
            OnExit = ValidateQty
            OnKeyPress = CheckKeyIsNumber
          end
          object spnNumberUp: TSpinEdit
            Left = 304
            Top = 40
            Width = 49
            Height = 22
            MaxValue = 100
            MinValue = 1
            TabOrder = 3
            Value = 1
          end
          object rdgrpFormat: TRadioGroup
            Left = 240
            Top = 72
            Width = 113
            Height = 73
            Caption = 'Format'
            ItemIndex = 0
            Items.Strings = (
              'N/A'
              'Simplex'
              'Duplex')
            ParentBackground = False
            TabOrder = 4
          end
          object grpbxPaper: TGroupBox
            Left = 8
            Top = 72
            Width = 225
            Height = 74
            Caption = 'Processing'
            ParentBackground = False
            TabOrder = 5
            object lblCustomSize: TLabel
              Left = 16
              Top = 46
              Width = 39
              Height = 13
              Caption = 'Custom'
            end
            object lblSize: TLabel
              Left = 16
              Top = 18
              Width = 20
              Height = 13
              Caption = 'Size'
            end
            object dblkpSize: TDBLookupComboBox
              Left = 70
              Top = 14
              Width = 145
              Height = 21
              TabOrder = 0
              OnClick = dblkpSizeClick
            end
            object edtCustomSize: TEdit
              Left = 70
              Top = 42
              Width = 147
              Height = 21
              Enabled = False
              TabOrder = 1
              OnChange = edtPreviousWINChange
              OnKeyPress = CheckKeyIsNumber
            end
          end
        end
        object pnlprNotesHead: TPanel
          Left = 2
          Top = 153
          Width = 382
          Height = 16
          Align = alTop
          ParentBackground = False
          TabOrder = 3
          object lblProcessNotes: TLabel
            Left = 8
            Top = 3
            Width = 30
            Height = 13
            Caption = 'Notes'
          end
        end
      end
      object scrlQuestions: TScrollBox
        Left = 0
        Top = 0
        Width = 395
        Height = 234
        Align = alLeft
        BevelInner = bvNone
        BevelOuter = bvNone
        TabOrder = 1
      end
    end
  end
  object pnlFoot: TPanel
    Left = 0
    Top = 481
    Width = 791
    Height = 35
    Align = alBottom
    ParentBackground = False
    TabOrder = 4
    DesignSize = (
      791
      35)
    object Label4: TLabel
      Left = 8
      Top = 10
      Width = 60
      Height = 13
      Caption = 'Release No:'
    end
    object pnlOK: TPanel
      Left = 426
      Top = 1
      Width = 364
      Height = 33
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        364
        33)
      object lblDeletePrompt: TLabel
        Left = 12
        Top = 10
        Width = 155
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Delete this Works Instruction?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object btnOK: TBitBtn
        Left = 196
        Top = 4
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'OK'
        Default = True
        Enabled = False
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnOKClick
      end
      object btnCancel: TBitBtn
        Left = 278
        Top = 4
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Cancel = True
        Caption = 'Cancel'
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnCancelClick
      end
      object chkbxComplete: TCheckBox
        Left = 24
        Top = 9
        Width = 169
        Height = 17
        Caption = 'This Job is now complete'
        TabOrder = 2
      end
    end
    object edtVersionNo: TEdit
      Left = 80
      Top = 6
      Width = 41
      Height = 21
      TabStop = False
      MaxLength = 30
      TabOrder = 1
      OnChange = edtVersionNoChange
    end
    object btnJobBag: TBitBtn
      Left = 156
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Job Bag'
      Default = True
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnJobBagClick
    end
    object btnNotes: TBitBtn
      Left = 280
      Top = 4
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
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 3
      OnClick = btnNotesClick
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 516
    Width = 791
    Height = 21
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object pnlCustomer: TPanel
    Left = 0
    Top = 38
    Width = 791
    Height = 115
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      791
      115)
    object Label8: TLabel
      Left = 6
      Top = 10
      Width = 49
      Height = 13
      Caption = 'Customer'
    end
    object Label11: TLabel
      Left = 6
      Top = 37
      Width = 40
      Height = 13
      Caption = 'Contact'
    end
    object Label13: TLabel
      Left = 489
      Top = 66
      Width = 69
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Customer Ref'
      ExplicitLeft = 493
    end
    object Label12: TLabel
      Left = 6
      Top = 69
      Width = 20
      Height = 13
      Caption = 'Rep'
    end
    object Label15: TLabel
      Left = 489
      Top = 10
      Width = 91
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Account Manager'
      ExplicitLeft = 493
    end
    object Label6: TLabel
      Left = 550
      Top = 92
      Width = 81
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Previous WI No.'
      ExplicitLeft = 554
    end
    object lblAccountTeam: TLabel
      Left = 490
      Top = 38
      Width = 71
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Account Team'
      ExplicitLeft = 494
    end
    object edtCustomer: TEdit
      Left = 72
      Top = 6
      Width = 225
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      MaxLength = 30
      ReadOnly = True
      TabOrder = 0
    end
    object btnCustomer: TBitBtn
      Left = 304
      Top = 4
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCustomerClick
    end
    object btnContacts: TButton
      Left = 304
      Top = 31
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnContactsClick
    end
    object edtCustomerOrder: TEdit
      Left = 592
      Top = 62
      Width = 142
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 6
      OnChange = edtCustomerOrderChange
    end
    object edtPreviousWIN: TEdit
      Left = 638
      Top = 88
      Width = 96
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 7
      OnChange = edtPreviousWINChange
      OnKeyPress = CheckKeyIsNumber
    end
    object dblkpContact: TDBLookupComboBox
      Left = 72
      Top = 33
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'Contact_no'
      ListField = 'Name'
      ListSource = dtmdlWOrders.dtsCustContacts
      TabOrder = 2
      OnClick = dblkpContactClick
    end
    object edtAccountTeam: TEdit
      Left = 592
      Top = 34
      Width = 142
      Height = 21
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 10
    end
    object Button1: TButton
      Left = 304
      Top = 63
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = Button1Click
    end
    object btnAccountManager: TBitBtn
      Left = 742
      Top = 4
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = btnAccountManagerClick
    end
    object edtAccountManager: TEdit
      Left = 592
      Top = 6
      Width = 142
      Height = 21
      Anchors = [akTop, akRight]
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object edtRep: TEdit
      Left = 72
      Top = 65
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 4
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 153
    Width = 791
    Height = 66
    Align = alTop
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      791
      66)
    object Label7: TLabel
      Left = 6
      Top = 9
      Width = 43
      Height = 13
      Caption = 'Job Title'
    end
    object lblProductionType: TLabel
      Left = 454
      Top = 32
      Width = 57
      Height = 26
      Anchors = [akTop, akRight]
      Caption = 'Production Type'
      Visible = False
      WordWrap = True
      ExplicitLeft = 458
    end
    object Label20: TLabel
      Left = 455
      Top = 9
      Width = 79
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Actual Quantity'
      ExplicitLeft = 459
    end
    object memDescription: TMemo
      Left = 72
      Top = 5
      Width = 369
      Height = 49
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnChange = memDescriptionChange
    end
    object edtProductionType: TEdit
      Left = 520
      Top = 36
      Width = 225
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = clBtnFace
      MaxLength = 40
      ReadOnly = True
      TabOrder = 1
      Visible = False
    end
    object btnProductionType: TBitBtn
      Left = 752
      Top = 34
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnClick = btnProductionTypeClick
    end
    object memActualQty: TMemo
      Left = 546
      Top = 5
      Width = 80
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 3
      WantReturns = False
      WordWrap = False
      OnChange = memActualQtyChange
      OnEnter = SaveValue
      OnExit = ValidateQty
      OnKeyPress = CheckKeyIsNumber
    end
    object chkbxPerso100: TCheckBox
      Left = 653
      Top = 8
      Width = 98
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Is Perso 100%'
      TabOrder = 4
      OnClick = chkbxPerso100Click
    end
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 232
    Top = 320
  end
  object pmnuProcess: TPopupMenu
    OnPopup = pmnuProcessPopup
    Left = 132
    Top = 274
    object InsertProcess1: TMenuItem
      Caption = 'Insert Process'
      object mnuProcess: TMenuItem
        OnClick = mnuProcessClick
      end
    end
    object DeleteProcess1: TMenuItem
      Caption = 'Delete Process'
      OnClick = DeleteProcess1Click
    end
  end
end
