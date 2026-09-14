object PBMaintBranchFrm: TPBMaintBranchFrm
  Left = 172
  Top = 18
  BorderStyle = bsDialog
  Caption = 'Maintain Branches'
  ClientHeight = 628
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    474
    628)
  TextHeight = 17
  object DelLabel: TLabel
    Left = 127
    Top = 599
    Width = 154
    Height = 16
    Anchors = [akLeft, akBottom]
    Caption = 'Delete the above details'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 15
    Width = 56
    Height = 17
    Caption = 'Customer'
  end
  object Label2: TLabel
    Left = 8
    Top = 44
    Width = 82
    Height = 17
    Caption = 'Branch Name '
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object OKBitBtn: TBitBtn
    Left = 292
    Top = 595
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
    ExplicitTop = 572
  end
  object CancelBitBtn: TBitBtn
    Left = 372
    Top = 595
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
    ExplicitTop = 572
  end
  object PrintBitBtn: TBitBtn
    Left = 8
    Top = 595
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Print'
    TabOrder = 5
    OnClick = PrintBitBtnClick
    ExplicitTop = 572
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
        Height = 473
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        ExplicitHeight = 477
        DesignSize = (
          425
          473)
        object Label3: TLabel
          Left = 16
          Top = 12
          Width = 48
          Height = 17
          Caption = 'Address'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 16
          Top = 108
          Width = 54
          Height = 17
          Caption = 'Postcode'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 16
          Top = 132
          Width = 36
          Height = 17
          Caption = 'Phone'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 16
          Top = 154
          Width = 22
          Height = 16
          Caption = 'Fax'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 16
          Top = 181
          Width = 31
          Height = 17
          Caption = 'Email'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 16
          Top = 212
          Width = 81
          Height = 17
          Caption = 'Account Code'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 16
          Top = 238
          Width = 35
          Height = 17
          Caption = 'Status'
        end
        object lblShortCode: TLabel
          Left = 16
          Top = 268
          Width = 66
          Height = 17
          Caption = 'Short Code'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 16
          Top = 84
          Width = 56
          Height = 17
          Caption = 'Town/City'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 230
          Top = 108
          Width = 40
          Height = 17
          Caption = 'County'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object NotesBitBtn: TBitBtn
          Left = 277
          Top = 300
          Width = 89
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Notes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
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
          TabOrder = 16
          OnClick = NotesBitBtnClick
        end
        object BuildingEdit: TEdit
          Left = 104
          Top = 8
          Width = 306
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 40
          TabOrder = 0
          Text = 'BuildingEdit'
        end
        object StreetEdit: TEdit
          Left = 104
          Top = 32
          Width = 306
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 40
          TabOrder = 1
          Text = 'StreetEdit'
        end
        object LocaleEdit: TEdit
          Left = 104
          Top = 56
          Width = 306
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 40
          TabOrder = 2
          Text = 'LocaleEdit'
        end
        object TownEdit: TEdit
          Left = 104
          Top = 80
          Width = 306
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 40
          TabOrder = 3
          Text = 'TownEdit'
        end
        object PhoneEdit: TEdit
          Left = 104
          Top = 128
          Width = 139
          Height = 25
          MaxLength = 20
          TabOrder = 6
          Text = 'PhoneEdit'
          OnChange = PhoneEditChange
        end
        object FaxEdit: TEdit
          Left = 104
          Top = 152
          Width = 139
          Height = 25
          MaxLength = 20
          TabOrder = 7
          Text = 'FaxEdit'
        end
        object EMailEdit: TEdit
          Left = 104
          Top = 176
          Width = 306
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          MaxLength = 40
          TabOrder = 8
          Text = 'EMailEdit'
        end
        object PostCodeEdit: TEdit
          Left = 104
          Top = 104
          Width = 105
          Height = 25
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 4
          Text = 'POSTCODEEDIT'
        end
        object AccCodeEdit: TEdit
          Left = 104
          Top = 208
          Width = 90
          Height = 25
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
          ParentBackground = False
          TabOrder = 18
          DesignSize = (
            409
            110)
          object InvToCustLabel: TLabel
            Left = 76
            Top = 25
            Width = 95
            Height = 17
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Customer Name'
          end
          object InvToBranchLabel: TLabel
            Left = 76
            Top = 53
            Width = 78
            Height = 17
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Branch Name'
          end
          object Label35: TLabel
            Left = 16
            Top = 25
            Width = 56
            Height = 17
            Caption = 'Customer'
          end
          object Label36: TLabel
            Left = 16
            Top = 53
            Width = 39
            Height = 17
            Caption = 'Branch'
          end
          object Label37: TLabel
            Left = 16
            Top = 84
            Width = 31
            Height = 17
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
            Left = 76
            Top = 80
            Width = 241
            Height = 25
            Color = clMenuBar
            ReadOnly = True
            TabOrder = 2
            Text = 'edtInvToContact'
          end
          object BitBtn5: TBitBtn
            Left = 336
            Top = 81
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
          Left = 104
          Top = 235
          Width = 155
          Height = 25
          Style = csDropDownList
          TabOrder = 10
          Items.Strings = (
            'Prospect'
            'Put on Ledger')
        end
        object DelivNotesBitBtn: TBitBtn
          Left = 277
          Top = 329
          Width = 89
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Deliv Narr'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
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
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 14
        end
        object edtShortCode: TEdit
          Left = 104
          Top = 264
          Width = 90
          Height = 25
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
          Width = 255
          Height = 17
          Hint = 'Use Head Office Delivery Notes'
          Caption = 'Use Head Office Delivery Note details'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
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
          Left = 273
          Top = 104
          Width = 137
          Height = 25
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
        DrawingStyle = gdsGradient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
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
        DrawingStyle = gdsGradient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
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
        473)
      object Label6: TLabel
        Left = 8
        Top = 21
        Width = 88
        Height = 17
        Caption = 'Recipient Email'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtRecipientEmail: TEdit
        Left = 102
        Top = 17
        Width = 306
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        MaxLength = 40
        TabOrder = 0
        Text = 'EMailEdit'
      end
    end
  end
  object CustNameEdit: TEdit
    Left = 92
    Top = 11
    Width = 307
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 40
    ReadOnly = True
    TabOrder = 0
    Text = 'CustNameEdit'
  end
  object NameEdit: TEdit
    Left = 92
    Top = 40
    Width = 307
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 40
    TabOrder = 1
    Text = 'NameEdit'
    OnChange = NameEditChange
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Branch_No) as Last_Code'
      'From Customer_Branch'
      'Where (Customer = :Customer)')
    Left = 255
    Top = 441
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
    Left = 300
    Top = 441
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
    Left = 340
    Top = 441
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
    Left = 385
    Top = 441
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
    Left = 256
    Top = 136
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
    Left = 268
    Top = 176
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
    Left = 312
    Top = 192
  end
  object CheckCustAccExistsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Customer.Name'
      'From Customer, Customer_Branch'
      'Where (Customer.Customer <> :Customer) and'
      '      (Customer_Branch.Customer = Customer.Customer) and'
      '      (Customer_Branch.Account_Code = :Acc_Code)')
    Left = 381
    Top = 233
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
    Left = 324
    Top = 276
    ParamData = <
      item
        Name = 'Acc_Code'
        DataType = ftString
      end>
  end
  object FlashDelivTimer: TTimer
    Enabled = False
    OnTimer = FlashDelivTimerTimer
    Left = 304
    Top = 224
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
    Left = 196
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
    Left = 228
    Top = 236
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
    Left = 274
    Top = 203
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
    Left = 169
    Top = 110
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
    Left = 337
    Top = 104
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
    Left = 161
    Top = 174
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
    Left = 379
    Top = 70
  end
  object GetContactNameSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Name from Customer_Contact'
      'Where (Customer = :Customer) and'
      '      (Branch_No = :Branch_No) and'
      '(Contact_no = :Contact_no)')
    Left = 402
    Top = 372
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
