object frmWTMaintJob: TfrmWTMaintJob
  Left = 156
  Top = 23
  Caption = 'Job details'
  ClientHeight = 616
  ClientWidth = 1040
  Color = clBtnFace
  Constraints.MinHeight = 612
  Constraints.MinWidth = 907
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  TextHeight = 13
  object Label21: TLabel
    Left = 432
    Top = 240
    Width = 51
    Height = 13
    Caption = 'Telephone'
  end
  object Label22: TLabel
    Left = 432
    Top = 268
    Width = 66
    Height = 13
    Caption = 'Email Address'
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1040
    Height = 169
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 1044
    DesignSize = (
      1040
      169)
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 45
      Height = 13
      Caption = 'Job No.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 188
      Top = 12
      Width = 52
      Height = 13
      Caption = 'Job Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 618
      Top = 12
      Width = 83
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Date Required'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 630
    end
    object Label15: TLabel
      Left = 846
      Top = 12
      Width = 45
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Contact'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 858
    end
    object Label19: TLabel
      Left = 8
      Top = 40
      Width = 46
      Height = 13
      Caption = 'Material'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 66
      Width = 65
      Height = 13
      Caption = 'Description'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 610
      Top = 90
      Width = 60
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Reference'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 622
    end
    object Label17: TLabel
      Left = 609
      Top = 114
      Width = 74
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Customer PO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 621
    end
    object Label39: TLabel
      Left = 609
      Top = 140
      Width = 23
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Fitter'
      Visible = False
      ExplicitLeft = 621
    end
    object Label63: TLabel
      Left = 610
      Top = 66
      Width = 33
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Project'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 622
    end
    object Label59: TLabel
      Left = 8
      Top = 114
      Width = 61
      Height = 13
      Caption = 'Specification'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object edtJobNumber: TEdit
      Left = 88
      Top = 8
      Width = 73
      Height = 21
      Color = cl3DLight
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object dtpckDate: TDateTimePicker
      Left = 247
      Top = 8
      Width = 89
      Height = 21
      Date = 37882.000000000000000000
      Time = 37882.000000000000000000
      TabOrder = 1
    end
    object dblkpOperator: TDBLookupComboBox
      Left = 898
      Top = 8
      Width = 129
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Operator'
      ListField = 'Operator_Name'
      TabOrder = 4
      ExplicitLeft = 910
    end
    object dblkpMaterial: TDBLookupComboBox
      Left = 88
      Top = 36
      Width = 250
      Height = 21
      KeyField = 'Material_Type'
      ListField = 'Description'
      TabOrder = 5
      OnClick = dblkpMaterialClick
    end
    object edtReference: TEdit
      Left = 691
      Top = 86
      Width = 345
      Height = 21
      Anchors = [akRight, akBottom]
      TabOrder = 7
      OnChange = edtReferenceChange
      ExplicitLeft = 703
    end
    object edtCustomerPO: TEdit
      Left = 691
      Top = 110
      Width = 177
      Height = 21
      Anchors = [akRight, akBottom]
      TabOrder = 9
      OnChange = edtCustomerPOChange
      ExplicitLeft = 703
    end
    object BitBtn1: TBitBtn
      Left = 344
      Top = 35
      Width = 22
      Height = 22
      Hint = 'Search for Customer'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 6
      OnClick = BitBtn1Click
    end
    object edtDescription: TMemo
      Left = 88
      Top = 64
      Width = 508
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 255
      ScrollBars = ssVertical
      TabOrder = 8
      OnChange = edtDescriptionChange
      ExplicitWidth = 520
    end
    object dblkpFitter: TDBLookupComboBox
      Left = 691
      Top = 136
      Width = 177
      Height = 21
      Anchors = [akRight, akBottom]
      KeyField = 'Fitter'
      ListField = 'Fitter_Name'
      TabOrder = 10
      Visible = False
      ExplicitLeft = 703
    end
    object BitBtn2: TBitBtn
      Left = 882
      Top = 135
      Width = 22
      Height = 22
      Hint = 'Search for Customer'
      Anchors = [akRight, akBottom]
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 11
      Visible = False
      OnClick = BitBtn2Click
      ExplicitLeft = 894
    end
    object edtDateRequired: TEdit
      Left = 706
      Top = 8
      Width = 89
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
      OnExit = edtDateRequiredExit
      ExplicitLeft = 718
    end
    object btnDateRequired: TBitBtn
      Left = 802
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
      ExplicitLeft = 814
    end
    object edtProject: TEdit
      Left = 691
      Top = 62
      Width = 345
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 12
      OnChange = edtProjectChange
      ExplicitLeft = 703
    end
    object Memo4: TMemo
      Left = 88
      Top = 114
      Width = 508
      Height = 47
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        '')
      TabOrder = 13
      Visible = False
      OnChange = edtDescriptionChange
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 597
    Width = 1040
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    ExplicitTop = 598
    ExplicitWidth = 1044
  end
  object Panel2: TPanel
    Left = 0
    Top = 556
    Width = 1040
    Height = 41
    Align = alBottom
    Anchors = [akRight, akBottom]
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 557
    ExplicitWidth = 1044
    DesignSize = (
      1040
      41)
    object lblDeletePrompt: TLabel
      Left = 746
      Top = 16
      Width = 109
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = 'Delete this job?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      ExplicitLeft = 758
    end
    object btnOK: TBitBtn
      Left = 866
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      Enabled = False
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
      ExplicitLeft = 878
    end
    object btnCancel: TBitBtn
      Left = 946
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnCancelClick
      ExplicitLeft = 958
    end
  end
  object pgDetails: TPageControl
    Left = 0
    Top = 169
    Width = 1040
    Height = 286
    ActivePage = TabSheet11
    Align = alClient
    TabOrder = 3
    ExplicitWidth = 1044
    ExplicitHeight = 287
    object tbCustomer: TTabSheet
      Caption = 'Customer'
      ImageIndex = 7
      DesignSize = (
        1032
        258)
      object Label4: TLabel
        Left = 8
        Top = 16
        Width = 53
        Height = 13
        Caption = 'Customer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 8
        Top = 40
        Width = 35
        Height = 13
        Caption = 'Street'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 7
        Top = 127
        Width = 37
        Height = 13
        Caption = 'Contact'
      end
      object Label20: TLabel
        Left = 8
        Top = 100
        Width = 54
        Height = 13
        Caption = 'Postcode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 8
        Top = 81
        Width = 49
        Height = 13
        Caption = 'Town/City'
      end
      object Email: TLabel
        Left = 7
        Top = 176
        Width = 25
        Height = 13
        Caption = 'Email'
      end
      object Telephone: TLabel
        Left = 7
        Top = 152
        Width = 61
        Height = 13
        Caption = 'Telephone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label40: TLabel
        Left = 7
        Top = 202
        Width = 50
        Height = 13
        Caption = 'Showroom'
      end
      object lblDesigner: TLabel
        Left = 7
        Top = 227
        Width = 42
        Height = 13
        Caption = 'Designer'
      end
      object btnCustomerSearch: TBitBtn
        Left = 610
        Top = 12
        Width = 22
        Height = 22
        Hint = 'Search for Customer'
        Anchors = [akTop, akRight]
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
        OnClick = btnCustomerSearchClick
        ExplicitLeft = 622
      end
      object pnlAddress: TPanel
        Left = 70
        Top = 0
        Width = 541
        Height = 249
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        Enabled = False
        ParentBackground = False
        TabOrder = 1
        ExplicitWidth = 553
        DesignSize = (
          541
          249)
        object Label24: TLabel
          Left = 104
          Top = 101
          Width = 33
          Height = 13
          Caption = 'County'
        end
        object edtCustomerName: TEdit
          Left = 8
          Top = 12
          Width = 523
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnChange = edtCustomerNameChange
          ExplicitWidth = 535
        end
        object edtStreet: TEdit
          Left = 8
          Top = 36
          Width = 523
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ExplicitWidth = 535
        end
        object edtlocale: TEdit
          Left = 8
          Top = 56
          Width = 523
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          ExplicitWidth = 535
        end
        object edtTown: TEdit
          Left = 8
          Top = 77
          Width = 523
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          ExplicitWidth = 535
        end
        object edtPostcode: TEdit
          Left = 8
          Top = 97
          Width = 73
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 4
        end
        object edtCounty: TEdit
          Left = 144
          Top = 97
          Width = 387
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          ExplicitWidth = 399
        end
        object edtContact: TEdit
          Left = 8
          Top = 124
          Width = 524
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
          OnChange = edtContactChange
          ExplicitWidth = 536
        end
        object edtEmail: TEdit
          Left = 8
          Top = 171
          Width = 523
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 7
          ExplicitWidth = 535
        end
        object edtTelephone: TEdit
          Left = 8
          Top = 148
          Width = 443
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 8
          ExplicitWidth = 455
        end
      end
      object btnContactSearch: TBitBtn
        Left = 610
        Top = 124
        Width = 22
        Height = 22
        Hint = 'Search for Customer'
        Anchors = [akTop, akRight]
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 2
        OnClick = btnContactSearchClick
        ExplicitLeft = 622
      end
      object pnlPlanning: TPanel
        Left = 667
        Top = 0
        Width = 365
        Height = 258
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 3
        ExplicitLeft = 679
        ExplicitHeight = 267
        object GroupBox1: TGroupBox
          Left = 92
          Top = 0
          Width = 241
          Height = 105
          Caption = 'Scheduled Dates'
          ParentBackground = False
          TabOrder = 0
          object Label16: TLabel
            Left = 8
            Top = 24
            Width = 78
            Height = 13
            Caption = 'Templating Date'
          end
          object Label28: TLabel
            Left = 8
            Top = 54
            Width = 77
            Height = 13
            Caption = 'Production Date'
          end
          object Label29: TLabel
            Left = 8
            Top = 81
            Width = 54
            Height = 13
            Caption = 'Fitting Date'
          end
          object dtpckTemplate: TDateTimePicker
            Left = 95
            Top = 20
            Width = 90
            Height = 21
            Date = 38118.000000000000000000
            Time = 0.884739699082274500
            TabOrder = 0
            OnChange = dtpckTemplateChange
          end
          object dtpckProduction: TDateTimePicker
            Left = 96
            Top = 49
            Width = 89
            Height = 21
            Date = 38118.000000000000000000
            Time = 0.884931018517818300
            TabOrder = 1
            OnChange = dtpckProductionChange
          end
          object dtpckFitting: TDateTimePicker
            Left = 96
            Top = 79
            Width = 89
            Height = 21
            Date = 38118.000000000000000000
            Time = 0.884986921293602800
            TabOrder = 2
            OnChange = dtpckFittingChange
          end
        end
        object GroupBox2: TGroupBox
          Left = 92
          Top = 108
          Width = 241
          Height = 106
          Caption = 'Actual Dates'
          ParentBackground = False
          TabOrder = 1
          object Label30: TLabel
            Left = 8
            Top = 22
            Width = 78
            Height = 13
            Caption = 'Templating Date'
          end
          object Label31: TLabel
            Left = 8
            Top = 51
            Width = 77
            Height = 13
            Caption = 'Production Date'
          end
          object Label32: TLabel
            Left = 8
            Top = 81
            Width = 54
            Height = 13
            Caption = 'Fitting Date'
          end
          object edtTemplate: TEdit
            Left = 96
            Top = 18
            Width = 90
            Height = 21
            Enabled = False
            TabOrder = 0
            OnExit = edtTemplateExit
          end
          object btntemplate: TBitBtn
            Left = 200
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
            TabOrder = 1
            Visible = False
            OnClick = btntemplateClick
          end
          object edtProduction: TEdit
            Left = 96
            Top = 47
            Width = 90
            Height = 21
            TabOrder = 2
            OnExit = edtTemplateExit
          end
          object BitBtn3: TBitBtn
            Left = 200
            Top = 45
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
            OnClick = BitBtn3Click
          end
          object edtFitting: TEdit
            Left = 96
            Top = 77
            Width = 90
            Height = 21
            TabOrder = 4
            OnExit = edtTemplateExit
          end
          object BitBtn4: TBitBtn
            Left = 200
            Top = 75
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
            TabOrder = 5
            OnClick = BitBtn4Click
          end
        end
      end
      object dblkpShowroom: TDBLookupComboBox
        Left = 78
        Top = 196
        Width = 459
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        KeyField = 'Branch_no'
        ListField = 'Branch_Name'
        TabOrder = 4
        ExplicitWidth = 471
      end
      object dblkpDesigner: TDBLookupComboBox
        Left = 78
        Top = 223
        Width = 316
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        KeyField = 'Designer'
        ListField = 'Designer_Name'
        TabOrder = 5
        ExplicitWidth = 328
      end
      object btnDesigner: TBitBtn
        Left = 404
        Top = 222
        Width = 22
        Height = 22
        Hint = 'Search for Customer'
        Anchors = [akTop, akRight]
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 6
        OnClick = btnDesignerClick
        ExplicitLeft = 416
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Worktops'
      object Label10: TLabel
        Left = 16
        Top = 48
        Width = 25
        Height = 13
        Caption = 'Sizes'
      end
      object sgElements: TStringGrid
        Left = 0
        Top = 0
        Width = 959
        Height = 267
        Align = alClient
        ColCount = 9
        DefaultColWidth = 40
        DefaultRowHeight = 18
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        OnDblClick = sgElementsDblClick
        ColWidths = (
          40
          190
          58
          73
          70
          76
          68
          72
          172)
      end
      object pnlElts: TPanel
        Left = 959
        Top = 0
        Width = 85
        Height = 267
        Align = alRight
        ParentBackground = False
        TabOrder = 1
        object btnAddElts: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          Enabled = False
          TabOrder = 0
          OnClick = btnAddEltsClick
        end
        object btnChangeElts: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeEltsClick
        end
        object btnDeleteElts: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteEltsClick
        end
        object btnGlobalElts: TBitBtn
          Left = 8
          Top = 120
          Width = 75
          Height = 25
          Caption = '&Global'
          Enabled = False
          TabOrder = 3
          OnClick = btnGlobalEltsClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Cut Outs'
      ImageIndex = 1
      object sgCutOuts: TStringGrid
        Left = 0
        Top = 0
        Width = 805
        Height = 255
        Align = alClient
        ColCount = 6
        DefaultColWidth = 40
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        OnDblClick = sgCutOutsDblClick
        ColWidths = (
          40
          158
          94
          85
          73
          75)
      end
      object pnlCutOuts: TPanel
        Left = 805
        Top = 0
        Width = 86
        Height = 255
        Align = alRight
        ParentBackground = False
        TabOrder = 1
        object btnAddCutOuts: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          Enabled = False
          TabOrder = 0
          OnClick = btnAddCutOutsClick
        end
        object btnChangeCutOuts: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeCutOutsClick
        end
        object btnDeleteCutOuts: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteCutOutsClick
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Edges'
      ImageIndex = 2
      object sgEdges: TStringGrid
        Left = 0
        Top = 0
        Width = 805
        Height = 255
        Align = alClient
        ColCount = 6
        DefaultColWidth = 40
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        OnDblClick = sgEdgesDblClick
        ColWidths = (
          40
          158
          108
          86
          94
          92)
      end
      object pnlEdges: TPanel
        Left = 805
        Top = 0
        Width = 86
        Height = 255
        Align = alRight
        ParentBackground = False
        TabOrder = 1
        object btnAddEdges: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          Enabled = False
          TabOrder = 0
          OnClick = btnAddEdgesClick
        end
        object btnChangeEdges: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeEdgesClick
        end
        object btnDeleteEdges: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Caption = '&Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteEdgesClick
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Upstands/Splashbacks etc'
      ImageIndex = 3
      object pnlUpstands: TPanel
        Left = 959
        Top = 0
        Width = 85
        Height = 286
        Align = alRight
        ParentBackground = False
        TabOrder = 0
        object btnAddUpstds: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          Enabled = False
          TabOrder = 0
          OnClick = btnAddUpstdsClick
        end
        object btnChangeUpstds: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeUpstdsClick
        end
        object btnDeleteUpstds: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteUpstdsClick
        end
      end
      object sgUpstands: TStringGrid
        Left = 0
        Top = 0
        Width = 959
        Height = 286
        Align = alClient
        ColCount = 11
        DefaultColWidth = 40
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 1
        OnDblClick = sgUpstandsDblClick
        ColWidths = (
          40
          190
          58
          73
          70
          47
          68
          72
          79
          115
          93)
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Charges'
      ImageIndex = 4
      object sgExtras: TStringGrid
        Left = 0
        Top = 0
        Width = 805
        Height = 255
        Align = alClient
        ColCount = 6
        DefaultColWidth = 40
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        OnDblClick = sgExtrasDblClick
        ColWidths = (
          40
          158
          82
          81
          80
          64)
      end
      object pnlExtras: TPanel
        Left = 805
        Top = 0
        Width = 86
        Height = 255
        Align = alRight
        ParentBackground = False
        TabOrder = 1
        object btnAddExtras: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          Enabled = False
          TabOrder = 0
          OnClick = btnAddExtrasClick
        end
        object btnChangeExtras: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeExtrasClick
        end
        object btnDeleteExtras: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteExtrasClick
        end
      end
    end
    object TabSheet11: TTabSheet
      Caption = 'Remedials'
      ImageIndex = 10
      object sgRemedials: TStringGrid
        Left = 0
        Top = 0
        Width = 954
        Height = 260
        Align = alClient
        DefaultColWidth = 40
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        OnDblClick = sgRemedialsDblClick
        ExplicitWidth = 950
        ExplicitHeight = 259
        ColWidths = (
          40
          198
          105
          91
          94)
      end
      object pnlRemedials: TPanel
        Left = 954
        Top = 0
        Width = 86
        Height = 260
        Align = alRight
        ParentBackground = False
        TabOrder = 1
        ExplicitLeft = 950
        ExplicitHeight = 259
        object btnAddRems: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          Enabled = False
          TabOrder = 0
          OnClick = btnAddRemsClick
        end
        object btnChangeRems: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeRemsClick
        end
        object btnDeleteRems: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteRemsClick
        end
      end
    end
    object tbInstallation: TTabSheet
      Caption = 'Installation'
      ImageIndex = 8
      object Panel22: TPanel
        Left = 329
        Top = 0
        Width = 310
        Height = 286
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
      end
      object pnlRiskNotes: TPanel
        Left = 639
        Top = 0
        Width = 405
        Height = 286
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        object memRiskNotes: TMemo
          Left = 0
          Top = 21
          Width = 405
          Height = 265
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          TabOrder = 0
        end
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 405
          Height = 21
          Align = alTop
          Alignment = taLeftJustify
          Caption = 'Risk Assessment/Special Instructions:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
      end
      object pnlInstall: TPanel
        Left = 0
        Top = 0
        Width = 329
        Height = 286
        Align = alLeft
        ParentBackground = False
        TabOrder = 2
        object memInstallAdd: TMemo
          Left = 1
          Top = 22
          Width = 327
          Height = 190
          Align = alClient
          MaxLength = 100
          TabOrder = 0
        end
        object Panel1: TPanel
          Left = 1
          Top = 212
          Width = 327
          Height = 73
          Align = alBottom
          ParentBackground = False
          TabOrder = 1
          object Label26: TLabel
            Left = 8
            Top = 13
            Width = 81
            Height = 13
            Caption = 'Contact Name'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 8
            Top = 37
            Width = 92
            Height = 13
            Caption = 'Contact Number'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edtInstallName: TEdit
            Left = 116
            Top = 12
            Width = 177
            Height = 21
            TabOrder = 0
            OnChange = edtInstallNameChange
          end
          object edtInstallNumber: TEdit
            Left = 116
            Top = 36
            Width = 177
            Height = 21
            TabOrder = 1
            OnChange = edtInstallNumberChange
          end
        end
        object Panel6: TPanel
          Left = 1
          Top = 1
          Width = 327
          Height = 21
          Align = alTop
          Alignment = taLeftJustify
          Caption = 'Installation Address (100 chars):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
        end
      end
    end
    object tbDocuments: TTabSheet
      Caption = 'Documents'
      ImageIndex = 5
      OnShow = tbDocumentsShow
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 1036
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 1044
        object Label44: TLabel
          Left = 2
          Top = 0
          Width = 54
          Height = 13
          Caption = 'Documents'
        end
      end
      object ToolBar1: TToolBar
        Left = 1007
        Top = 17
        Width = 29
        Height = 242
        Align = alRight
        ButtonHeight = 30
        ButtonWidth = 30
        Caption = 'ToolBar1'
        HotImages = imgIcons
        Images = imgIcons
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ExplicitLeft = 1015
        ExplicitHeight = 250
        object btnExcel: TToolButton
          Left = 0
          Top = 2
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
          Top = 32
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
      object stvDocuments: TShellTreeView
        Left = 0
        Top = 17
        Width = 161
        Height = 242
        ObjectTypes = [otFolders]
        Root = 'C:\'
        ShellListView = slvDocuments
        UseShellImages = True
        Align = alLeft
        AutoRefresh = False
        Indent = 19
        ParentColor = False
        RightClickSelect = True
        ShowRoot = False
        TabOrder = 2
        OnDragDrop = stvDocumentsDragDrop
        OnDragOver = stvDocumentsDragOver
      end
      object slvDocuments: TShellListView
        Left = 161
        Top = 17
        Width = 842
        Height = 241
        AutoRefresh = True
        ObjectTypes = [otFolders, otNonFolders]
        Root = 'C:\'
        ShellTreeView = stvDocuments
        Sorted = True
        Align = alClient
        ReadOnly = False
        HideSelection = False
        MultiSelect = True
        OnMouseMove = slvDocumentsMouseMove
        TabOrder = 3
        ViewStyle = vsReport
        ExplicitWidth = 850
        ExplicitHeight = 242
      end
    end
    object tbNotes: TTabSheet
      Caption = 'Notes'
      ImageIndex = 11
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 1044
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          1032
          17)
        object Label13: TLabel
          Left = -18
          Top = 0
          Width = 28
          Height = 13
          Anchors = [akTop, akRight]
          Caption = 'Notes'
          ExplicitLeft = 6
        end
      end
      object memNotes: TMemo
        Left = 0
        Top = 17
        Width = 1032
        Height = 241
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 1044
        ExplicitHeight = 250
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Events'
      ImageIndex = 8
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 891
        Height = 17
        Align = alTop
        ParentBackground = False
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 0
        Top = 17
        Width = 345
        Height = 238
        Align = alLeft
        ParentBackground = False
        TabOrder = 1
        object sgEvents: TStringGrid
          Left = 1
          Top = 1
          Width = 343
          Height = 236
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
        Left = 574
        Top = 17
        Width = 317
        Height = 238
        Align = alRight
        ParentBackground = False
        TabOrder = 2
        object memEventNotes: TMemo
          Left = 1
          Top = 1
          Width = 315
          Height = 236
          Align = alClient
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
      end
      object pnlEvents: TPanel
        Left = 345
        Top = 17
        Width = 229
        Height = 238
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
    object TabSheet10: TTabSheet
      Caption = 'Quoted Prices'
      ImageIndex = 9
      DesignSize = (
        1032
        258)
      object Label8: TLabel
        Left = 732
        Top = 137
        Width = 77
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Installation Price'
        ExplicitLeft = 744
        ExplicitTop = 138
      end
      object Label9: TLabel
        Left = 749
        Top = 161
        Width = 60
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Survey Price'
        ExplicitLeft = 761
        ExplicitTop = 162
      end
      object Label14: TLabel
        Left = 744
        Top = 185
        Width = 65
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Delivery Price'
        ExplicitLeft = 756
        ExplicitTop = 186
      end
      object lblDiscountRate: TLabel
        Left = 591
        Top = 113
        Width = 74
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Discount rate %'
        ExplicitLeft = 603
        ExplicitTop = 114
      end
      object lblDiscountValue: TLabel
        Left = 767
        Top = 113
        Width = 42
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Discount'
        ExplicitLeft = 779
        ExplicitTop = 114
      end
      object Label36: TLabel
        Left = 712
        Top = 65
        Width = 97
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Quoted Supply Price'
        ExplicitLeft = 724
        ExplicitTop = 66
      end
      object lblVatRate: TLabel
        Left = 562
        Top = 218
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'lblVatRate'
        Visible = False
        ExplicitLeft = 574
        ExplicitTop = 219
      end
      object lblVat: TLabel
        Left = 622
        Top = 218
        Width = 21
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'VAT'
        Visible = False
        ExplicitLeft = 634
        ExplicitTop = 219
      end
      object lblTotal: TLabel
        Left = 758
        Top = 218
        Width = 51
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Total Price'
        ExplicitLeft = 770
        ExplicitTop = 219
      end
      object Label12: TLabel
        Left = 754
        Top = 89
        Width = 55
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Waste Cost'
        ExplicitLeft = 766
        ExplicitTop = 90
      end
      object edtDiscountRate: TCREditMoney
        Left = 679
        Top = 109
        Width = 65
        Height = 21
        Anchors = [akRight, akBottom]
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
        OnChange = edtDiscountRateChange
        OnEnter = edtDiscountRateEnter
        OnExit = edtDiscountRateExit
        ExplicitLeft = 691
        ExplicitTop = 110
      end
      object edtQuoted: TMemo
        Left = 822
        Top = 61
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Color = cl3DLight
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 1
        WantReturns = False
        WordWrap = False
      end
      object edtVatValue: TMemo
        Left = 654
        Top = 214
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Color = cl3DLight
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 2
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object edtGrossPrice: TMemo
        Left = 822
        Top = 214
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Color = cl3DLight
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 3
        WantReturns = False
        WordWrap = False
      end
      object edtDeliveryPrice: TMemo
        Left = 822
        Top = 181
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Color = cl3DLight
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 4
        WantReturns = False
        WordWrap = False
        OnChange = edtDeliveryPriceChange
        OnExit = edtInstallPriceExit
      end
      object edtSurveyPrice: TMemo
        Left = 822
        Top = 157
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Color = cl3DLight
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 5
        WantReturns = False
        WordWrap = False
        OnChange = edtSurveyPriceChange
        OnExit = edtInstallPriceExit
      end
      object edtInstallPrice: TMemo
        Left = 822
        Top = 133
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Color = cl3DLight
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 6
        WantReturns = False
        WordWrap = False
        OnChange = edtInstallPriceChange
        OnExit = edtInstallPriceExit
      end
      object edtDiscountValue: TMemo
        Left = 822
        Top = 109
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Color = cl3DLight
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 7
        WantReturns = False
        WordWrap = False
        OnChange = edtDiscountValueChange
        OnEnter = edtDiscountValueEnter
        OnExit = edtDiscountValueExit
      end
      object edtWasteValue: TMemo
        Left = 822
        Top = 85
        Width = 90
        Height = 21
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Color = cl3DLight
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 8
        WantReturns = False
        WordWrap = False
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 455
    Width = 1040
    Height = 101
    Align = alBottom
    ParentBackground = False
    TabOrder = 4
    ExplicitTop = 456
    ExplicitWidth = 1044
    DesignSize = (
      1040
      101)
    object Label11: TLabel
      Left = 660
      Top = 28
      Width = 79
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Job Supply Price'
      ExplicitLeft = 672
    end
    object Label34: TLabel
      Left = 216
      Top = 13
      Width = 68
      Height = 13
      Caption = 'Deposit Terms'
      Visible = False
    end
    object Label35: TLabel
      Left = 216
      Top = 37
      Width = 60
      Height = 13
      Caption = 'Deposit Paid'
      Visible = False
    end
    object Label37: TLabel
      Left = 642
      Top = 52
      Width = 97
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Quoted Supply Price'
      ExplicitLeft = 654
    end
    object Label38: TLabel
      Left = 690
      Top = 76
      Width = 49
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Difference'
      ExplicitLeft = 702
    end
    object Label41: TLabel
      Left = 860
      Top = 28
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = 'Total Nett Price'
      ExplicitLeft = 872
    end
    object lbldifference: TLabel
      Left = 626
      Top = 76
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = 'lblDifference'
      ExplicitLeft = 638
    end
    object Label42: TLabel
      Left = 913
      Top = 52
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = 'VAT'
      ExplicitLeft = 925
    end
    object Label43: TLabel
      Left = 899
      Top = 76
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = 'TOTAL'
      ExplicitLeft = 911
    end
    object lblVATRate1: TLabel
      Left = 842
      Top = 52
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = 'lblVATRate1'
      ExplicitLeft = 854
    end
    object lblReason: TLabel
      Left = 138
      Top = 71
      Width = 37
      Height = 13
      Caption = 'Reason'
      Visible = False
    end
    object edtNettPrice: TMemo
      Left = 748
      Top = 24
      Width = 89
      Height = 21
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Color = cl3DLight
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 0
      WantReturns = False
      WordWrap = False
    end
    object spnDepositTerms: TSpinEdit
      Left = 296
      Top = 8
      Width = 73
      Height = 22
      Increment = 5
      MaxValue = 100
      MinValue = 0
      TabOrder = 1
      Value = 0
      Visible = False
      OnChange = spnDepositTermsChange
    end
    object edtDepositPaid: TCREditMoney
      Left = 296
      Top = 33
      Width = 73
      Height = 21
      TabOrder = 2
      Visible = False
      OnChange = edtDepositPaidChange
    end
    object edtQNettPrice: TMemo
      Left = 748
      Top = 48
      Width = 89
      Height = 21
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Color = cl3DLight
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 3
      WantReturns = False
      WordWrap = False
    end
    object edtDifference: TMemo
      Left = 748
      Top = 72
      Width = 89
      Height = 21
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Color = cl3DLight
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 4
      WantReturns = False
      WordWrap = False
    end
    object memNett: TMemo
      Left = 940
      Top = 24
      Width = 89
      Height = 21
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Color = cl3DLight
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 5
      WantReturns = False
      WordWrap = False
    end
    object memVat: TMemo
      Left = 940
      Top = 48
      Width = 89
      Height = 21
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Color = cl3DLight
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 6
      WantReturns = False
      WordWrap = False
    end
    object memTotal: TMemo
      Left = 940
      Top = 72
      Width = 89
      Height = 21
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Color = cl3DLight
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 7
      WantReturns = False
      WordWrap = False
    end
    object chkbxDeclined: TCheckBox
      Left = 13
      Top = 69
      Width = 97
      Height = 17
      Caption = 'Job inactive'
      TabOrder = 8
      OnClick = chkbxDeclinedClick
    end
    object dblkpReason: TDBLookupComboBox
      Left = 189
      Top = 67
      Width = 225
      Height = 21
      KeyField = 'Inactive_Reason'
      ListField = 'Inactive_Reason_Descr'
      TabOrder = 9
      Visible = False
    end
    object btnReason: TButton
      Left = 426
      Top = 66
      Width = 23
      Height = 23
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      Visible = False
      OnClick = btnReasonClick
    end
  end
  object imgDocuments: TImageList
    Left = 216
    Top = 228
  end
  object svDlgOfficeDoc: TSaveDialog
    Left = 217
    Top = 86
  end
  object imgIcons: TImageList
    Left = 440
    Top = 316
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
    Left = 216
    Top = 296
  end
  object pmnuDocuments: TPopupMenu
    OnPopup = pmnuDocumentsPopup
    Left = 310
    Top = 230
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
    object N2: TMenuItem
      Caption = '-'
    end
    object pmnuSelectAll: TMenuItem
      Caption = 'Select All'
      OnClick = pmnuSelectAllClick
    end
  end
end
