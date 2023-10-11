object PBMaintPOrdLineFrm: TPBMaintPOrdLineFrm
  Left = 12
  Top = 27
  Caption = 'Maintain Purchase Order Lines'
  ClientHeight = 514
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object DelLabel: TLabel
    Left = 424
    Top = 476
    Width = 142
    Height = 14
    Caption = 'Delete the above details ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OKBitBtn: TBitBtn
    Left = 584
    Top = 471
    Width = 75
    Height = 25
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
    TabOrder = 1
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 672
    Top = 471
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    Glyph.Data = {
      CE070000424DCE07000000000000360000002800000024000000120000000100
      1800000000009807000000000000000000000000000000000000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
      7F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F0000FF7F7F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF007F7F
      007F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F00
      00FF00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
      FFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7FFFFFFF7F7F7F7F7F7FFFFF
      FF007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00
      007F7F7F7F007F7F0000FF00007F00007F00007F00007F7F7F7F007F7F007F7F
      007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7FFFFF
      FF7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F00
      7F7F0000FF00007F00007F00007F00007F7F7F7F00007F00007F00007F00007F
      00007F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F
      7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF00
      7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00007F
      00007F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F00
      7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      0000FF00007F00007F00007F00007F00007F00007F7F7F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F00
      7F7F007F7F007F7F007F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F00007F00007F00007F00007F00007F7F7F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
      7F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
      7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F0000FF00007F00007F00007F00007F00007F7F7F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
      007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F7F7F7F00007F00
      007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00
      007F7F7F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F7F7F7FFFFF
      FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F0000FF00007F00007F7F7F7F007F7F007F7F007F7F0000FF00007F00007F
      00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
      7F007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F007F7F007F7F007F7F
      007F7F007F7F0000FF00007F00007F00007F007F7F007F7F007F7F007F7F007F
      7F007F7F7F7F7FFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F7F7F7FFFFFFF00
      7F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F0000FF007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F00
      7F7F007F7F007F7F7F7F7FFFFFFFFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F7F7F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F}
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
    OnClick = CancelBitBtnClick
  end
  object DetsGrpBox: TGroupBox
    Left = 4
    Top = 0
    Width = 757
    Height = 465
    Caption = 'Details'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object labEnquiryNo: TLabel
      Left = 17
      Top = 16
      Width = 144
      Height = 15
      Caption = 'Original Enquiry Number:  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object ProofsGrpBox: TGroupBox
      Left = 505
      Top = 387
      Width = 232
      Height = 71
      Caption = 'Proofs'
      TabOrder = 5
      object ProofByLabel: TLabel
        Left = 88
        Top = 21
        Width = 12
        Height = 13
        Caption = 'By'
      end
      object ProofStatLabel: TLabel
        Left = 12
        Top = 46
        Width = 30
        Height = 13
        Caption = 'Status'
      end
      object ProofsReqChkBox: TCheckBox
        Left = 8
        Top = 20
        Width = 73
        Height = 17
        Caption = 'Required'
        TabOrder = 0
        OnClick = ProofsReqChkBoxClick
      end
      object ProofsDateEdit: TEdit
        Left = 104
        Top = 17
        Width = 81
        Height = 21
        TabStop = False
        MaxLength = 10
        TabOrder = 1
        OnChange = CheckOK
        OnExit = ProofsDateEditExit
      end
      object ProofDateBtn: TButton
        Left = 192
        Top = 16
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = ProofDateBtnClick
      end
      object ProofStatDBLUCB: TDBLookupComboBox
        Left = 56
        Top = 42
        Width = 161
        Height = 21
        KeyField = 'Proof_Status'
        ListField = 'Description'
        ListSource = PBPODM.ProofStatSRC
        TabOrder = 3
        OnClick = CheckOK
      end
    end
    object SuppGrpBox: TGroupBox
      Left = 392
      Top = 201
      Width = 358
      Height = 183
      Caption = 'Supplier'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 53
        Height = 13
        Caption = 'Description'
      end
      object Label2: TLabel
        Left = 8
        Top = 70
        Width = 50
        Height = 13
        Caption = 'Reference'
      end
      object Label4: TLabel
        Left = 8
        Top = 98
        Width = 37
        Height = 13
        Caption = 'Job Ref'
      end
      object Label24: TLabel
        Left = 12
        Top = 129
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Artwork'
      end
      object SuppRefEdit: TEdit
        Left = 76
        Top = 66
        Width = 165
        Height = 21
        MaxLength = 20
        TabOrder = 1
        OnChange = CheckOK
      end
      object SuppJobRefEdit: TEdit
        Left = 76
        Top = 94
        Width = 165
        Height = 21
        MaxLength = 20
        TabOrder = 2
        OnChange = CheckOK
      end
      object SuppDescEdit: TMemo
        Left = 76
        Top = 16
        Width = 269
        Height = 46
        Lines.Strings = (
          '')
        MaxLength = 80
        TabOrder = 0
        WantReturns = False
      end
      object ArtEdit: TMemo
        Left = 76
        Top = 125
        Width = 269
        Height = 49
        MaxLength = 80
        TabOrder = 3
      end
    end
    object GroupBox1: TGroupBox
      Left = 9
      Top = 31
      Width = 741
      Height = 169
      Caption = 'Customer'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label5: TLabel
        Left = 8
        Top = 120
        Width = 53
        Height = 13
        Caption = 'Description'
      end
      object Label6: TLabel
        Left = 393
        Top = 76
        Width = 46
        Height = 13
        Caption = 'Order No.'
      end
      object Label8: TLabel
        Left = 8
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Name'
      end
      object Label9: TLabel
        Left = 8
        Top = 41
        Width = 34
        Height = 13
        Caption = 'Branch'
      end
      object Label20: TLabel
        Left = 395
        Top = 120
        Width = 43
        Height = 13
        Caption = 'Form Ref'
      end
      object Label10: TLabel
        Left = 368
        Top = 44
        Width = 69
        Height = 13
        Caption = 'Date Required'
      end
      object Label11: TLabel
        Left = 576
        Top = 45
        Width = 105
        Height = 13
        Caption = 'Expected Life (weeks)'
      end
      object Label19: TLabel
        Left = 8
        Top = 95
        Width = 20
        Height = 13
        Caption = 'Rep'
      end
      object Label25: TLabel
        Left = 8
        Top = 68
        Width = 37
        Height = 13
        Caption = 'Contact'
      end
      object Label17: TLabel
        Left = 385
        Top = 148
        Width = 51
        Height = 13
        Caption = 'Form Desc'
      end
      object CustRefEdit: TEdit
        Left = 453
        Top = 72
        Width = 160
        Height = 21
        MaxLength = 40
        TabOrder = 11
        OnChange = CheckOK
      end
      object CustNameEdit: TEdit
        Left = 80
        Top = 12
        Width = 230
        Height = 21
        TabStop = False
        MaxLength = 40
        ReadOnly = True
        TabOrder = 1
        OnChange = CheckOK
      end
      object CustBranchEdit: TEdit
        Left = 80
        Top = 37
        Width = 230
        Height = 21
        TabStop = False
        MaxLength = 40
        ReadOnly = True
        TabOrder = 2
        OnChange = CheckOK
      end
      object CustLUBtn: TButton
        Left = 315
        Top = 11
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = CustLUBtnClick
      end
      object FormRefEdit: TEdit
        Left = 453
        Top = 115
        Width = 221
        Height = 21
        MaxLength = 40
        ReadOnly = True
        TabOrder = 12
        OnChange = CheckOK
      end
      object FormRefButton: TButton
        Left = 683
        Top = 114
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        OnClick = FormRefButtonClick
      end
      object FormRefClrBitBtn: TBitBtn
        Left = 712
        Top = 114
        Width = 25
        Height = 25
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
        TabOrder = 14
        OnClick = FormRefClrBitBtnClick
      end
      object ReqByDateEdit: TEdit
        Left = 453
        Top = 36
        Width = 81
        Height = 21
        TabStop = False
        MaxLength = 10
        TabOrder = 8
        OnChange = CheckOK
        OnExit = ReqByDateEditExit
      end
      object ReqByDateLUBtn: TButton
        Left = 539
        Top = 35
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnClick = ReqByDateLUBtnClick
      end
      object ExpectedLifeSpinEdit: TSpinEdit
        Left = 701
        Top = 36
        Width = 36
        Height = 22
        MaxValue = 52
        MinValue = 0
        TabOrder = 10
        Value = 1
        OnChange = CheckOK
      end
      object RepEdit: TEdit
        Left = 80
        Top = 91
        Width = 230
        Height = 21
        TabStop = False
        MaxLength = 40
        ReadOnly = True
        TabOrder = 5
        OnChange = CheckOK
      end
      object RepLUButton: TButton
        Left = 315
        Top = 90
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = RepLUButtonClick
      end
      object ContactLUBtn: TButton
        Left = 315
        Top = 63
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = ContactLUBtnClick
      end
      object ContactCombo: TComboBox
        Left = 80
        Top = 64
        Width = 230
        Height = 21
        Style = csDropDownList
        TabOrder = 3
        OnChange = CheckOK
        OnDropDown = ContactComboDropDown
      end
      object FormDescEdit: TEdit
        Left = 453
        Top = 140
        Width = 284
        Height = 21
        ReadOnly = True
        TabOrder = 15
      end
      object CustDescEdit: TMemo
        Left = 80
        Top = 117
        Width = 297
        Height = 46
        Lines.Strings = (
          '')
        MaxLength = 80
        TabOrder = 7
        WantReturns = False
        OnChange = CustDescEditChange
        OnEnter = CustDescEditEnter
        OnExit = CustDescEditExit
      end
    end
    object QtysGrpBox: TGroupBox
      Left = 8
      Top = 387
      Width = 489
      Height = 72
      Caption = 'Quantities and Values'
      TabOrder = 3
      object Label15: TLabel
        Left = 8
        Top = 21
        Width = 39
        Height = 13
        Caption = 'Quantity'
      end
      object Label16: TLabel
        Left = 138
        Top = 21
        Width = 53
        Height = 13
        Caption = 'Order Price'
      end
      object Label18: TLabel
        Left = 130
        Top = 49
        Width = 58
        Height = 13
        Caption = 'Selling Price'
      end
      object Label13: TLabel
        Left = 284
        Top = 21
        Width = 48
        Height = 13
        Caption = 'Order Unit'
      end
      object Label7: TLabel
        Left = 296
        Top = 49
        Width = 39
        Height = 13
        Caption = 'Sell Unit'
      end
      object QtyMemo: TMemo
        Left = 56
        Top = 17
        Width = 73
        Height = 23
        Alignment = taRightJustify
        TabOrder = 0
        WantReturns = False
        OnChange = CheckOK
        OnEnter = SaveValue
        OnExit = ValidateQty
        OnKeyPress = CheckKeyIsNumber
      end
      object OrdPriceMemo: TMemo
        Left = 204
        Top = 17
        Width = 73
        Height = 23
        Alignment = taRightJustify
        TabOrder = 1
        WantReturns = False
        OnChange = CheckOK
        OnEnter = SaveValue
        OnExit = ValidateMoney
        OnKeyPress = CheckKeyIsNumber
      end
      object SellPriceMemo: TMemo
        Left = 204
        Top = 45
        Width = 73
        Height = 23
        Alignment = taRightJustify
        TabOrder = 3
        WantReturns = False
        OnChange = CheckOK
        OnEnter = SaveValue
        OnExit = ValidateMoney
        OnKeyPress = CheckKeyIsNumber
      end
      object ListPriceMemo: TMemo
        Left = 560
        Top = 17
        Width = 73
        Height = 23
        TabStop = False
        Alignment = taRightJustify
        TabOrder = 5
        Visible = False
        WantReturns = False
        OnEnter = SaveValue
        OnExit = ValidateMoney
        OnKeyPress = CheckKeyIsNumber
      end
      object SellUnitDBLCB: TDBLookupComboBox
        Left = 348
        Top = 45
        Width = 129
        Height = 21
        KeyField = 'Price_Unit'
        ListField = 'Description'
        ListSource = PBPODM.PriceUnitSRC
        TabOrder = 4
        OnClick = CheckOK
      end
      object OrderUnitDBLCB: TDBLookupComboBox
        Left = 348
        Top = 17
        Width = 129
        Height = 21
        KeyField = 'Price_Unit'
        ListField = 'Description'
        ListSource = PBPODM.PriceUnitSRC
        TabOrder = 2
        OnClick = CheckOK
      end
    end
    object GroupBox2: TGroupBox
      Left = 9
      Top = 200
      Width = 376
      Height = 183
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label12: TLabel
        Left = 8
        Top = 16
        Width = 64
        Height = 13
        Caption = 'Product Type'
      end
      object Label3: TLabel
        Left = 8
        Top = 44
        Width = 29
        Height = 13
        Caption = 'Depth'
      end
      object Label22: TLabel
        Left = 208
        Top = 52
        Width = 111
        Height = 13
        Caption = 'Default to standard size'
      end
      object Label14: TLabel
        Left = 8
        Top = 72
        Width = 28
        Height = 13
        Caption = 'Width'
      end
      object Label21: TLabel
        Left = 8
        Top = 105
        Width = 55
        Height = 13
        Caption = 'Qty per Box'
      end
      object PlateChangeLbl: TLabel
        Left = 232
        Top = 137
        Width = 81
        Height = 13
        Alignment = taRightJustify
        Caption = 'Number of Plates'
      end
      object Label26: TLabel
        Left = 8
        Top = 162
        Width = 51
        Height = 13
        Caption = 'Numbering'
      end
      object Label23: TLabel
        Left = 8
        Top = 136
        Width = 53
        Height = 13
        Caption = 'No. of Sets'
      end
      object ProdTypeEdit: TEdit
        Left = 80
        Top = 12
        Width = 193
        Height = 21
        TabStop = False
        MaxLength = 40
        ReadOnly = True
        TabOrder = 0
        OnChange = CheckOK
      end
      object DepthEdit: TEdit
        Tag = 3
        Left = 80
        Top = 40
        Width = 65
        Height = 21
        TabOrder = 2
        OnChange = CheckOK
        OnKeyPress = CheckKeyIsNumber
      end
      object Unit1: TEdit
        Tag = 5
        Left = 152
        Top = 40
        Width = 49
        Height = 21
        ReadOnly = True
        TabOrder = 3
        Text = 'mm'
        OnChange = CheckOK
      end
      object UpDown1: TUpDown
        Left = 184
        Top = 40
        Width = 16
        Height = 23
        TabOrder = 11
        OnChanging = UpDown1Changing
      end
      object SizeCombo: TComboBox
        Left = 208
        Top = 68
        Width = 153
        Height = 21
        Style = csDropDownList
        TabOrder = 6
        OnChange = CheckOK
        OnClick = SizeComboClick
        OnDropDown = SizeComboDropDown
      end
      object Unit2: TEdit
        Tag = 6
        Left = 152
        Top = 68
        Width = 49
        Height = 21
        ReadOnly = True
        TabOrder = 5
        Text = 'mm'
        OnChange = CheckOK
      end
      object UpDown2: TUpDown
        Left = 184
        Top = 68
        Width = 16
        Height = 23
        TabOrder = 12
        OnChanging = UpDown2Changing
      end
      object WidthEdit: TEdit
        Tag = 4
        Left = 80
        Top = 68
        Width = 65
        Height = 21
        TabOrder = 4
        OnChange = CheckOK
        OnKeyPress = CheckKeyIsNumber
      end
      object ProdTypeBtn: TButton
        Left = 280
        Top = 11
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
        OnClick = ProdTypeBtnClick
      end
      object FormsPerBoxEdit: TEdit
        Left = 80
        Top = 101
        Width = 281
        Height = 21
        MaxLength = 40
        TabOrder = 7
        OnChange = CheckOK
        OnExit = FormsPerBoxEditExit
      end
      object PlateChangeSpin: TSpinEdit
        Tag = 108
        Left = 320
        Top = 128
        Width = 41
        Height = 22
        MaxValue = 10
        MinValue = 0
        TabOrder = 9
        Value = 0
      end
      object NumberingEdit: TEdit
        Left = 80
        Top = 157
        Width = 281
        Height = 21
        MaxLength = 80
        TabOrder = 10
      end
      object SetsEdit: TEdit
        Left = 80
        Top = 128
        Width = 121
        Height = 21
        TabOrder = 8
      end
    end
    object OnHoldChkBox: TCheckBox
      Left = 632
      Top = 16
      Width = 121
      Height = 17
      Caption = 'Order ON HOLD'
      TabOrder = 4
    end
  end
end
