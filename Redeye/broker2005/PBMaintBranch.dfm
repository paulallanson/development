object PBMaintBranchFrm: TPBMaintBranchFrm
  Left = 172
  Top = 18
  BorderStyle = bsDialog
  Caption = 'Maintain Branches'
  ClientHeight = 614
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    452
    614)
  TextHeight = 13
  object DelLabel: TLabel
    Left = 136
    Top = 587
    Width = 145
    Height = 15
    Anchors = [akLeft, akBottom]
    Caption = 'Delete the above details ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 588
  end
  object Label1: TLabel
    Left = 8
    Top = 18
    Width = 44
    Height = 13
    Caption = 'Customer'
  end
  object Label2: TLabel
    Left = 8
    Top = 47
    Width = 68
    Height = 13
    Caption = 'Branch Name '
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object OKBitBtn: TBitBtn
    Left = 292
    Top = 581
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
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
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 3
    OnClick = OKBitBtnClick
    ExplicitTop = 582
  end
  object CancelBitBtn: TBitBtn
    Left = 372
    Top = 581
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
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
    TabOrder = 4
    OnClick = CancelBitBtnClick
    ExplicitTop = 582
  end
  object PrintBitBtn: TBitBtn
    Left = 8
    Top = 581
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Print'
    TabOrder = 5
    OnClick = PrintBitBtnClick
    ExplicitTop = 582
  end
  object pgBranches: TPageControl
    Left = 8
    Top = 72
    Width = 433
    Height = 505
    ActivePage = tbGeneral
    TabOrder = 2
    object tbGeneral: TTabSheet
      Caption = 'General Details'
      object pnlDets: TPanel
        Left = 0
        Top = 0
        Width = 425
        Height = 477
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          425
          477)
        object Label3: TLabel
          Left = 16
          Top = 12
          Width = 38
          Height = 13
          Caption = 'Address'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 16
          Top = 108
          Width = 45
          Height = 13
          Caption = 'Postcode'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 16
          Top = 132
          Width = 31
          Height = 13
          Caption = 'Phone'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 16
          Top = 154
          Width = 19
          Height = 15
          Caption = 'Fax'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 16
          Top = 181
          Width = 25
          Height = 13
          Caption = 'Email'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 16
          Top = 212
          Width = 68
          Height = 13
          Caption = 'Account Code'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 16
          Top = 238
          Width = 30
          Height = 13
          Caption = 'Status'
        end
        object lblShortCode: TLabel
          Left = 16
          Top = 268
          Width = 53
          Height = 13
          Caption = 'Short Code'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 16
          Top = 84
          Width = 49
          Height = 13
          Caption = 'Town/City'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 223
          Top = 108
          Width = 33
          Height = 13
          Caption = 'County'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object NotesBitBtn: TBitBtn
          Left = 236
          Top = 300
          Width = 89
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Notes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
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
          TabOrder = 16
          OnClick = NotesBitBtnClick
        end
        object BuildingEdit: TEdit
          Left = 95
          Top = 8
          Width = 306
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 40
          TabOrder = 0
          Text = 'BuildingEdit'
        end
        object StreetEdit: TEdit
          Left = 95
          Top = 32
          Width = 306
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 40
          TabOrder = 1
          Text = 'StreetEdit'
        end
        object LocaleEdit: TEdit
          Left = 95
          Top = 56
          Width = 306
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 40
          TabOrder = 2
          Text = 'LocaleEdit'
        end
        object TownEdit: TEdit
          Left = 95
          Top = 80
          Width = 306
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 40
          TabOrder = 3
          Text = 'TownEdit'
        end
        object PhoneEdit: TEdit
          Left = 95
          Top = 128
          Width = 139
          Height = 21
          MaxLength = 20
          TabOrder = 6
          Text = 'PhoneEdit'
          OnChange = PhoneEditChange
        end
        object FaxEdit: TEdit
          Left = 95
          Top = 152
          Width = 139
          Height = 21
          MaxLength = 20
          TabOrder = 7
          Text = 'FaxEdit'
        end
        object EMailEdit: TEdit
          Left = 95
          Top = 176
          Width = 306
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 40
          TabOrder = 8
          Text = 'EMailEdit'
        end
        object PostCodeEdit: TEdit
          Left = 95
          Top = 104
          Width = 105
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 4
          Text = 'POSTCODEEDIT'
        end
        object AccCodeEdit: TEdit
          Left = 95
          Top = 208
          Width = 90
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 8
          TabOrder = 9
          Text = 'ACCCODEEDIT'
          OnEnter = AccCodeEditEnter
          OnExit = AccCodeEditExit
        end
        object InvToGrpBox: TGroupBox
          Left = 8
          Top = 363
          Width = 409
          Height = 110
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Invoice To'
          TabOrder = 18
          DesignSize = (
            409
            110)
          object InvToCustLabel: TLabel
            Left = 72
            Top = 25
            Width = 75
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Customer Name'
          end
          object InvToBranchLabel: TLabel
            Left = 72
            Top = 53
            Width = 65
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Branch Name'
          end
          object Label35: TLabel
            Left = 16
            Top = 25
            Width = 44
            Height = 13
            Caption = 'Customer'
          end
          object Label36: TLabel
            Left = 16
            Top = 53
            Width = 34
            Height = 13
            Caption = 'Branch'
          end
          object Label37: TLabel
            Left = 16
            Top = 85
            Width = 25
            Height = 13
            Caption = 'Email'
          end
          object InvCustBtn: TButton
            Left = 336
            Top = 19
            Width = 65
            Height = 25
            Caption = 'Customer'
            TabOrder = 0
            OnClick = InvCustBtnClick
          end
          object InvToBranch: TButton
            Left = 336
            Top = 47
            Width = 65
            Height = 25
            Caption = 'Branch'
            TabOrder = 1
            OnClick = InvToBranchClick
          end
          object edtInvToContact: TEdit
            Left = 72
            Top = 80
            Width = 241
            Height = 21
            Color = clMenuBar
            ReadOnly = True
            TabOrder = 2
            Text = 'edtInvToContact'
          end
          object BitBtn5: TBitBtn
            Left = 336
            Top = 79
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
            OnClick = BitBtn5Click
          end
        end
        object ProspectComboBox: TComboBox
          Left = 95
          Top = 235
          Width = 155
          Height = 21
          Style = csDropDownList
          TabOrder = 10
          Items.Strings = (
            'Prospect'
            'Put on Ledger')
        end
        object DelivNotesBitBtn: TBitBtn
          Left = 236
          Top = 329
          Width = 89
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Deliv Narr'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
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
          TabOrder = 17
          OnClick = DelivNotesBitBtnClick
        end
        object ChkBxBrnchNm: TCheckBox
          Left = 16
          Top = 316
          Width = 127
          Height = 17
          Hint = 'Use Branch Name on delivery documents'
          Caption = 'Use Branch Name '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
        end
        object edtShortCode: TEdit
          Left = 95
          Top = 264
          Width = 90
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 11
          OnEnter = AccCodeEditEnter
          OnExit = AccCodeEditExit
        end
        object chkbxHODept: TCheckBox
          Left = 16
          Top = 296
          Width = 213
          Height = 17
          Caption = 'Head Office Department'
          TabOrder = 13
        end
        object chkbxUseHODeliveryNotes: TCheckBox
          Left = 16
          Top = 336
          Width = 217
          Height = 17
          Hint = 'Use Head Office Delivery Notes'
          Caption = 'Use Head Office Delivery Note details'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
        end
        object chkbxActive: TCheckBox
          Left = 277
          Top = 272
          Width = 113
          Height = 17
          Caption = 'Branch is active'
          TabOrder = 12
        end
        object CountyEdit: TEdit
          Left = 264
          Top = 104
          Width = 137
          Height = 21
          MaxLength = 40
          TabOrder = 5
          Text = 'CountyEdit'
        end
      end
    end
    object tbContacts: TTabSheet
      Caption = 'Contacts'
      ImageIndex = 1
      object btnAddContact: TBitBtn
        Left = 341
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Add'
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnAddContactClick
      end
      object btnChgContact: TBitBtn
        Left = 341
        Top = 56
        Width = 75
        Height = 25
        Caption = 'Change'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnChgContactClick
      end
      object btnDelContact: TBitBtn
        Left = 341
        Top = 96
        Width = 75
        Height = 25
        Caption = 'Delete'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 2
        OnClick = btnDelContactClick
      end
      object dbgContacts: TDBGrid
        Left = 8
        Top = 16
        Width = 321
        Height = 385
        DataSource = dtsContacts
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 3
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgContactsDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Name'
            Width = 163
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'phone'
            Title.Caption = 'Phone'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'email'
            Title.Caption = 'Email'
            Width = 350
            Visible = True
          end>
      end
      object chkbxShowInactive: TCheckBox
        Left = 8
        Top = 417
        Width = 129
        Height = 17
        Caption = 'show inactive contacts'
        TabOrder = 4
        OnClick = chkbxShowInactiveClick
      end
    end
    object tbCostCentres: TTabSheet
      Caption = 'Cost Centres'
      ImageIndex = 1
      object btnAddCostCentre: TBitBtn
        Left = 341
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Add'
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnAddCostCentreClick
      end
      object btnChgCostCentre: TBitBtn
        Left = 341
        Top = 56
        Width = 75
        Height = 25
        Caption = 'Change'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnChgCostCentreClick
      end
      object btnDelCostCentre: TBitBtn
        Left = 341
        Top = 96
        Width = 75
        Height = 25
        Caption = 'Delete'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 2
        OnClick = btnDelCostCentreClick
      end
      object dbgCostCentres: TDBGrid
        Left = 8
        Top = 16
        Width = 321
        Height = 385
        DataSource = dtsCostCentres
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 3
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clBlack
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgCostCentresDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Cost_Centre'
            Title.Caption = 'Cost Centre'
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Description'
            Width = 190
            Visible = True
          end>
      end
    end
    object tbEcommerce: TTabSheet
      Caption = 'Ecommerce'
      ImageIndex = 3
      DesignSize = (
        425
        477)
      object Label6: TLabel
        Left = 8
        Top = 21
        Width = 73
        Height = 13
        Caption = 'Recipient Email'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edtRecipientEmail: TEdit
        Left = 95
        Top = 17
        Width = 306
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 40
        TabOrder = 0
        Text = 'EMailEdit'
      end
    end
  end
  object CustNameEdit: TEdit
    Left = 87
    Top = 14
    Width = 291
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 40
    ReadOnly = True
    TabOrder = 0
    Text = 'CustNameEdit'
    ExplicitWidth = 299
  end
  object NameEdit: TEdit
    Left = 87
    Top = 43
    Width = 291
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 40
    TabOrder = 1
    Text = 'NameEdit'
    OnChange = NameEditChange
    ExplicitWidth = 299
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Branch_No) as Last_Code'
      'From Customer_Branch'
      'Where (Customer = :Customer)')
    Left = 204
    Top = 436
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Customer_Branch'
      '        (Customer,'
      '        Branch_No,'
      '        Name,'
      '        Building_No_Name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Phone,'
      '        Fax_Number,'
      '        EMail,'
      '        PostCode,'
      '        County,'
      '        Narrative,'
      '        Account_Code,'
      '        Inv_To_Customer,'
      '        Inv_To_Branch,'
      '        Account_Code_On_Ledger,'
      '        Delivery_Narrative,'
      '        Use_Branch_Name,'
      '        short_code,'
      '        HO_Department,'
      '        Use_HO_Delivery_Notes,'
      '        Inactive,'
      '        Online_Ordering_Email,'
      '        Inv_to_Contact)'
      'Values'
      '        (:Customer,'
      '        :Branch_No,'
      '        :Name,'
      '        :Building_No_Name,'
      '        :Street,'
      '        :Locale,'
      '        :Town,'
      '        :Phone,'
      '        :Fax_Number,'
      '        :EMail,'
      '        :PostCode,'
      '        :County,'
      '        :Narrative,'
      '        :Account_Code,'
      '        :Inv_To_Customer,'
      '        :Inv_To_Branch,'
      '        :Account_Code_On_Ledger,'
      '        :Delivery_Narrative,'
      '        :Use_Branch_Name,'
      '        :short_code,'
      '        :HODept,'
      '        :Use_HO_Delivery_Notes,'
      '        :Inactive,'
      '        :Online_Ordering_Email,'
      '        :Inv_To_Contact)'
      ' '
      ' '
      ' ')
    Left = 240
    Top = 436
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Name'
      end
      item
        Name = 'Building_No_Name'
      end
      item
        Name = 'Street'
      end
      item
        Name = 'Locale'
      end
      item
        Name = 'Town'
      end
      item
        Name = 'Phone'
      end
      item
        Name = 'Fax_Number'
      end
      item
        Name = 'EMail'
      end
      item
        Name = 'PostCode'
      end
      item
        Name = 'County'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Inv_To_Customer'
        DataType = ftInteger
      end
      item
        Name = 'Inv_To_Branch'
        DataType = ftInteger
      end
      item
        Name = 'Account_Code_On_Ledger'
      end
      item
        Name = 'Delivery_Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Use_Branch_Name'
      end
      item
        Name = 'short_code'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'HODept'
      end
      item
        Name = 'Use_HO_Delivery_Notes'
        DataType = ftString
      end
      item
        Name = 'Inactive'
      end
      item
        Name = 'Online_Ordering_Email'
      end
      item
        Name = 'Inv_To_Contact'
        DataType = ftInteger
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Branch'
      'Set'
      '        Name = :Name,'
      '        Building_No_Name  = :Building_No_Name,'
      '        Street = :Street,'
      '        Locale = :Locale,'
      '        Town = :Town,'
      '        Phone = :Phone,'
      '        Fax_Number = :Fax_Number,'
      '        PostCode = :PostCode,'
      '        County = :County,'
      '        Narrative = :Narrative,'
      '        Email = :Email,'
      '        Account_Code = :Account_Code,'
      '        Inv_To_Customer = :Inv_To_Customer,'
      '        Inv_To_Branch = :Inv_To_Branch,'
      '        Account_Code_on_ledger = :Account_Code_on_Ledger,'
      '        Delivery_Narrative = :Delivery_Narrative,'
      '        Use_Branch_Name = :Use_Branch_Name,'
      '        short_code = :short_code,'
      '        HO_department = :HODept,'
      '        Use_HO_Delivery_Notes = :Use_HO_Delivery_Notes,'
      '        Inactive = :Inactive,'
      '        Online_Ordering_Email = :Online_Ordering_Email,'
      '        Inv_To_Contact = :Inv_to_Contact'
      'Where'
      '(Customer = :Customer) and'
      '(Branch_No = :Branch_No)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 272
    Top = 436
    ParamData = <
      item
        Name = 'Name'
      end
      item
        Name = 'Building_No_Name'
      end
      item
        Name = 'Street'
      end
      item
        Name = 'Locale'
      end
      item
        Name = 'Town'
      end
      item
        Name = 'Phone'
      end
      item
        Name = 'Fax_Number'
      end
      item
        Name = 'PostCode'
      end
      item
        Name = 'County'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Email'
      end
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Inv_To_Customer'
        DataType = ftInteger
      end
      item
        Name = 'Inv_To_Branch'
        DataType = ftInteger
      end
      item
        Name = 'Account_Code_on_Ledger'
      end
      item
        Name = 'Delivery_Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Use_Branch_Name'
      end
      item
        Name = 'short_code'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'HODept'
      end
      item
        Name = 'Use_HO_Delivery_Notes'
        DataType = ftString
      end
      item
        Name = 'Inactive'
      end
      item
        Name = 'Online_Ordering_Email'
      end
      item
        Name = 'Inv_to_Contact'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Customer_Branch'
      'Where'
      '(Customer = :Customer) and'
      '(Branch_No = :Branch_No)')
    Left = 308
    Top = 436
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object GetCustNameSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Name from Customer'
      'Where Customer = :Customer')
    Left = 216
    Top = 32
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object GetBranchNameSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Name from Customer_Branch'
      'Where (Customer = :Customer) and'
      '      (Branch_No = :Branch_No)')
    Left = 244
    Top = 56
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 304
    Top = 120
  end
  object CheckCustAccExistsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Customer.Name'
      'From Customer, Customer_Branch'
      'Where (Customer.Customer <> :Customer) and'
      '      (Customer_Branch.Customer = Customer.Customer) and'
      '      (Customer_Branch.Account_Code = :Acc_Code)')
    Left = 228
    Top = 276
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Acc_Code'
      end>
  end
  object GetCompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Company')
    Left = 416
    Top = 16
  end
  object CheckSuppAccExistsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Supplier.Name'
      'From Supplier, Supplier_Branch'
      'Where (Supplier_Branch.Supplier = Supplier.Supplier) and'
      '      (Supplier_Branch.Account_Code = :Acc_Code)')
    Left = 228
    Top = 212
    ParamData = <
      item
        Name = 'Acc_Code'
        DataType = ftString
      end>
  end
  object FlashDelivTimer: TTimer
    Enabled = False
    OnTimer = FlashDelivTimerTimer
    Left = 264
    Top = 144
  end
  object UpdDelivNotesOnlySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Branch'
      'Set     Delivery_Narrative = :Delivery_Narrative'
      'Where'
      '(Customer = :Customer) and'
      '(Branch_No = :Branch_No)'
      ' '
      ' '
      ' ')
    Left = 268
    Top = 216
    ParamData = <
      item
        Name = 'Delivery_Narrative'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object UpdNotesOnlySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Branch'
      'Set     Narrative = :Narrative'
      'Where'
      '(Customer = :Customer) and'
      '(Branch_No = :Branch_No)'
      ' ')
    Left = 308
    Top = 220
    ParamData = <
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object qryGetBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Customer_Branch.*, Customer.Name as Customer_name'
      'From Customer_Branch, Customer'
      'Where'
      '(Customer_Branch.Customer = :Customer) and'
      '(Customer_Branch.Branch_no = :Branch_no) and'
      '(Customer.Customer = Customer_Branch.Customer)')
    Left = 360
    Top = 111
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryCostCentres: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Customer_Branch_CostCentre'
      'where Customer = :Customer and Branch_no = :Branch_no'
      'order by Description')
    Left = 20
    Top = 88
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object dtsCostCentres: TDataSource
    DataSet = qryCostCentres
    Left = 52
    Top = 128
  end
  object qryContacts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Customer_Contact'
      'where Customer = :Customer and Branch_no = :Branch_no and'
      
        '      ((Customer_Contact.Inactive = '#39'N'#39') or (Customer_Contact.In' +
        'active is NULL)'
      '      or (Customer_Contact.Inactive = :Inactive))       '
      'order by Name')
    Left = 20
    Top = 120
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Inactive'
      end>
  end
  object dtsContacts: TDataSource
    DataSet = qryContacts
    Left = 92
    Top = 120
  end
  object GetContactNameSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Name from Customer_Contact'
      'Where (Customer = :Customer) and'
      '      (Branch_No = :Branch_No) and'
      '(Contact_no = :Contact_no)')
    Left = 296
    Top = 304
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Contact_no'
      end>
  end
end
