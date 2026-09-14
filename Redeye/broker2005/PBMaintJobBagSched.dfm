object PBMaintJobBagSchedFrm: TPBMaintJobBagSchedFrm
  Left = 229
  Top = 113
  Caption = 'Job Bag Schedule History'
  ClientHeight = 412
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object pnlControls: TPanel
    Left = 0
    Top = 371
    Width = 768
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 362
    ExplicitWidth = 762
    DesignSize = (
      768
      41)
    object BitBtn1: TBitBtn
      Left = 678
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BitBtn1Click
      ExplicitLeft = 672
    end
  end
  object pnlBody: TPanel
    Left = 0
    Top = 0
    Width = 768
    Height = 371
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 762
    ExplicitHeight = 362
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 768
      Height = 49
      Align = alTop
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 762
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 103
        Height = 17
        Caption = 'Revision Number:'
      end
      object cmbRevision: TComboBox
        Left = 116
        Top = 12
        Width = 145
        Height = 25
        Style = csDropDownList
        TabOrder = 0
        OnClick = cmbRevisionClick
      end
    end
    object pnlArtwork: TPanel
      Left = 0
      Top = 49
      Width = 265
      Height = 322
      Align = alLeft
      ParentBackground = False
      TabOrder = 1
      ExplicitHeight = 313
      object Panel15: TPanel
        Left = 1
        Top = 1
        Width = 263
        Height = 20
        Align = alTop
        Enabled = False
        ParentBackground = False
        TabOrder = 0
        object chkbxArtRequired: TCheckBox
          Left = 8
          Top = 1
          Width = 137
          Height = 17
          Caption = 'Artwork Required'
          TabOrder = 0
        end
      end
      object scrlArtwork: TScrollBox
        Left = 1
        Top = 21
        Width = 263
        Height = 92
        Align = alTop
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Enabled = False
        TabOrder = 1
        object Label13: TLabel
          Left = 9
          Top = 12
          Width = 37
          Height = 17
          Caption = 'Due In'
        end
        object Label14: TLabel
          Left = 9
          Top = 39
          Width = 89
          Height = 17
          Caption = 'Proof Required'
        end
        object Label15: TLabel
          Left = 9
          Top = 67
          Width = 110
          Height = 17
          Caption = 'Approval Required'
        end
        object edtArtDueInDate: TEdit
          Tag = 10
          Left = 128
          Top = 8
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 0
        end
        object edtArtProofReqDate: TEdit
          Tag = 10
          Left = 128
          Top = 35
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 1
        end
        object edtArtApprovalDate: TEdit
          Tag = 10
          Left = 128
          Top = 63
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 2
        end
      end
      object Panel12: TPanel
        Left = 1
        Top = 113
        Width = 263
        Height = 20
        Align = alTop
        Caption = 'Other Information'
        ParentBackground = False
        TabOrder = 2
      end
      object memScheduleNotes: TMemo
        Left = 1
        Top = 133
        Width = 263
        Height = 188
        Align = alClient
        Enabled = False
        TabOrder = 3
        ExplicitHeight = 179
      end
    end
    object pnlDataServices: TPanel
      Left = 265
      Top = 49
      Width = 240
      Height = 322
      Align = alClient
      ParentBackground = False
      TabOrder = 2
      ExplicitWidth = 234
      ExplicitHeight = 313
      object Panel16: TPanel
        Left = 1
        Top = 1
        Width = 238
        Height = 20
        Align = alTop
        Enabled = False
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 232
        object chkbxDSRequired: TCheckBox
          Left = 5
          Top = 1
          Width = 188
          Height = 17
          Caption = 'Data Services Required'
          TabOrder = 0
        end
      end
      object scrlDataServices: TScrollBox
        Left = 1
        Top = 21
        Width = 238
        Height = 300
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Enabled = False
        TabOrder = 1
        ExplicitWidth = 232
        ExplicitHeight = 291
        object Label16: TLabel
          Left = 9
          Top = 12
          Width = 68
          Height = 17
          Caption = 'Data Due In'
        end
        object Label17: TLabel
          Left = 9
          Top = 39
          Width = 76
          Height = 17
          Caption = 'Client Brief In'
        end
        object Label18: TLabel
          Left = 9
          Top = 67
          Width = 64
          Height = 17
          Caption = 'Text Due In'
        end
        object Label19: TLabel
          Left = 9
          Top = 108
          Width = 62
          Height = 17
          Caption = 'Brief to DS'
        end
        object Label20: TLabel
          Left = 9
          Top = 160
          Width = 59
          Height = 17
          Caption = 'Text to DS'
        end
        object Label21: TLabel
          Left = 9
          Top = 201
          Width = 115
          Height = 17
          Caption = 'Text Proof Req'#39'd by'
        end
        object Label22: TLabel
          Left = 9
          Top = 332
          Width = 120
          Height = 17
          Caption = 'Live Proofs Req'#39'd by'
        end
        object Label23: TLabel
          Left = 9
          Top = 359
          Width = 115
          Height = 17
          Caption = 'Live Proof Approval'
        end
        object Label24: TLabel
          Left = 9
          Top = 134
          Width = 63
          Height = 17
          Caption = 'Data to DS'
        end
        object Label29: TLabel
          Left = 9
          Top = 266
          Width = 114
          Height = 17
          Caption = 'PDF Proof Req'#39'd by'
        end
        object Label30: TLabel
          Left = 9
          Top = 292
          Width = 115
          Height = 17
          Caption = 'PDF Proof Approval'
        end
        object Label31: TLabel
          Left = 9
          Top = 240
          Width = 128
          Height = 17
          Caption = 'Artwork for PDF Proof'
        end
        object edtDataDueInDate: TEdit
          Tag = 20
          Left = 134
          Top = 8
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 0
        end
        object edtClientBriefInDate: TEdit
          Tag = 20
          Left = 134
          Top = 35
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 1
        end
        object edtTextDueInDate: TEdit
          Tag = 20
          Left = 134
          Top = 63
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 2
        end
        object edtBriefToDSDate: TEdit
          Tag = 20
          Left = 134
          Top = 104
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 3
        end
        object edtTextToDSDate: TEdit
          Tag = 20
          Left = 134
          Top = 156
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 5
        end
        object edtTextProofReqDate: TEdit
          Tag = 20
          Left = 134
          Top = 197
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 6
        end
        object edtLiveProofReqDate: TEdit
          Tag = 20
          Left = 134
          Top = 328
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 10
        end
        object edtLiveProofAppDate: TEdit
          Tag = 20
          Left = 134
          Top = 355
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 11
        end
        object edtDataToDSDate: TEdit
          Tag = 20
          Left = 134
          Top = 130
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 4
        end
        object edtPDFProofReqDate: TEdit
          Tag = 20
          Left = 134
          Top = 262
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 8
        end
        object edtPDFProofAppDate: TEdit
          Tag = 20
          Left = 134
          Top = 288
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 9
        end
        object edtPDFProofArtDate: TEdit
          Tag = 20
          Left = 134
          Top = 236
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 7
        end
      end
    end
    object pnlSamples: TPanel
      Left = 505
      Top = 49
      Width = 263
      Height = 322
      Align = alRight
      ParentBackground = False
      TabOrder = 3
      ExplicitLeft = 499
      ExplicitHeight = 313
      object Panel17: TPanel
        Left = 1
        Top = 1
        Width = 261
        Height = 20
        Align = alTop
        Enabled = False
        ParentBackground = False
        TabOrder = 0
        object chkbxSamples: TCheckBox
          Left = 8
          Top = 1
          Width = 137
          Height = 17
          Caption = 'SEPs Required'
          TabOrder = 0
        end
      end
      object scrlSamples: TScrollBox
        Left = 1
        Top = 21
        Width = 261
        Height = 185
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Enabled = False
        TabOrder = 1
        ExplicitHeight = 176
        object Label27: TLabel
          Left = 9
          Top = 12
          Width = 107
          Height = 17
          Caption = 'SEPs to client date'
        end
        object Label28: TLabel
          Left = 9
          Top = 39
          Width = 114
          Height = 17
          Caption = 'SEPs Approval date'
        end
        object edtSEPClientDate: TEdit
          Tag = 30
          Left = 131
          Top = 8
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 0
        end
        object edtSEPApprovalDate: TEdit
          Tag = 30
          Left = 131
          Top = 35
          Width = 80
          Height = 25
          Color = clBtnFace
          TabOrder = 1
        end
      end
      object Panel14: TPanel
        Left = 1
        Top = 206
        Width = 261
        Height = 115
        Align = alBottom
        BevelInner = bvLowered
        Enabled = False
        ParentBackground = False
        TabOrder = 2
        ExplicitTop = 197
        object lblRevision: TLabel
          Left = 8
          Top = 13
          Width = 73
          Height = 17
          Caption = 'Revision No:'
        end
        object lblScheduleDate: TLabel
          Left = 8
          Top = 34
          Width = 30
          Height = 17
          Caption = 'Date:'
        end
        object lblScheduleOp: TLabel
          Left = 8
          Top = 56
          Width = 57
          Height = 17
          Caption = 'Operator:'
        end
        object Label26: TLabel
          Left = 8
          Top = 91
          Width = 84
          Height = 17
          Caption = 'Approval Type'
        end
        object cmbApprovalType: TComboBox
          Left = 104
          Top = 87
          Width = 145
          Height = 25
          Style = csDropDownList
          Color = clBtnFace
          TabOrder = 0
          Items.Strings = (
            'Client'
            'Estimated')
        end
      end
    end
  end
  object qrySchedules: TFDQuery
    ConnectionName = 'PB'
    Left = 572
    Top = 140
  end
end
