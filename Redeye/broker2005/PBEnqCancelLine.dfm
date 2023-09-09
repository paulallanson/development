object PBEnqCancelLineFrm: TPBEnqCancelLineFrm
  Left = 332
  Top = 112
  BorderStyle = bsDialog
  Caption = 'Decline Enquiry Line'
  ClientHeight = 394
  ClientWidth = 654
  Color = clBtnFace
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
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 654
    Height = 97
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 660
    object lblEnquiryNo: TLabel
      Left = 24
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Enquiry No:'
    end
    object lblCustomer: TLabel
      Left = 24
      Top = 44
      Width = 47
      Height = 13
      Caption = 'Customer:'
    end
    object lblDescription: TLabel
      Left = 24
      Top = 71
      Width = 56
      Height = 13
      Caption = 'Description:'
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 336
    Width = 654
    Height = 58
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 345
    ExplicitWidth = 660
    object btnOK: TBitBtn
      Left = 248
      Top = 17
      Width = 75
      Height = 25
      Enabled = False
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TBitBtn
      Left = 336
      Top = 17
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 97
    Width = 654
    Height = 239
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 660
    ExplicitHeight = 248
    object Label1: TLabel
      Left = 24
      Top = 21
      Width = 40
      Height = 13
      Caption = 'Reason:'
    end
    object Label5: TLabel
      Left = 24
      Top = 58
      Width = 66
      Height = 13
      Caption = 'Winning Price'
    end
    object Label6: TLabel
      Left = 24
      Top = 95
      Width = 53
      Height = 13
      Caption = 'Competitor:'
    end
    object Label45: TLabel
      Left = 215
      Top = 58
      Width = 46
      Height = 13
      Caption = 'Price Unit'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 127
      Width = 31
      Height = 13
      Caption = 'Notes:'
    end
    object dblkpReasons: TDBLookupComboBox
      Left = 104
      Top = 17
      Width = 257
      Height = 21
      KeyField = 'Enq_InActive_Reason'
      ListField = 'Description'
      ListSource = dtmdlEnqs.dtsReasons
      TabOrder = 0
      OnClick = EnableOK
    end
    object ReasMntBitBtn: TBitBtn
      Left = 384
      Top = 16
      Width = 25
      Height = 23
      Hint = 'Maintain Reasons'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ReasMntBitBtnClick
    end
    object memUnitPrice: TMemo
      Left = 104
      Top = 53
      Width = 89
      Height = 21
      Alignment = taRightJustify
      TabOrder = 2
      WantReturns = False
      WordWrap = False
      OnChange = EnableOK
      OnEnter = memUnitPriceEnter
      OnExit = ValidateMoney
      OnKeyPress = memUnitPriceKeyPress
    end
    object dblkpPriceUnit: TDBLookupComboBox
      Left = 272
      Top = 54
      Width = 137
      Height = 21
      KeyField = 'Price_Unit'
      ListField = 'Description'
      TabOrder = 3
      OnClick = EnableOK
    end
    object edtCompetitor: TEdit
      Left = 104
      Top = 91
      Width = 457
      Height = 21
      TabOrder = 4
      Text = 'edtCompetitor'
      OnChange = EnableOK
    end
    object chkbxInactive: TCheckBox
      Left = 24
      Top = 224
      Width = 161
      Height = 17
      Caption = 'Decline this enquiry line'
      TabOrder = 6
    end
    object memNotes: TMemo
      Left = 104
      Top = 128
      Width = 457
      Height = 89
      Lines.Strings = (
        'memNotes')
      TabOrder = 5
    end
  end
end
