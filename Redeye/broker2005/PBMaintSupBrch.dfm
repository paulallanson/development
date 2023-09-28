object PBMaintSupBrchFrm: TPBMaintSupBrchFrm
  Left = 170
  Top = 68
  Caption = 'Maintain Branches'
  ClientHeight = 477
  ClientWidth = 508
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 13
  object DelLabel: TLabel
    Left = 176
    Top = 429
    Width = 151
    Height = 13
    Caption = 'Delete the above details ?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OKBitBtn: TBitBtn
    Left = 336
    Top = 424
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
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 0
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 424
    Top = 424
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
    TabOrder = 1
    OnClick = CancelBitBtnClick
  end
  object pgcntrlSupplier: TPageControl
    Left = 8
    Top = 8
    Width = 489
    Height = 409
    ActivePage = tbshtDetails
    TabOrder = 2
    object tbshtDetails: TTabSheet
      Caption = 'Details'
      object DetsGrpBox: TGroupBox
        Left = 8
        Top = 12
        Width = 425
        Height = 365
        Caption = 'Details'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 28
          Width = 38
          Height = 13
          Caption = 'Supplier'
        end
        object Label2: TLabel
          Left = 16
          Top = 60
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
        object Label3: TLabel
          Left = 16
          Top = 99
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
          Top = 195
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
          Top = 227
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
          Top = 251
          Width = 17
          Height = 13
          Caption = 'Fax'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 16
          Top = 274
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
          Top = 309
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
          Top = 171
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
        object SuppNameEdit: TEdit
          Left = 94
          Top = 24
          Width = 299
          Height = 21
          MaxLength = 40
          ReadOnly = True
          TabOrder = 0
          Text = 'SuppNameEdit'
        end
        object NotesBitBtn: TBitBtn
          Left = 320
          Top = 331
          Width = 75
          Height = 25
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
          TabOrder = 11
          OnClick = NotesBitBtnClick
        end
        object NameEdit: TEdit
          Left = 94
          Top = 56
          Width = 299
          Height = 21
          MaxLength = 40
          TabOrder = 1
          Text = 'NameEdit'
          OnChange = NameEditChange
        end
        object BuildingEdit: TEdit
          Left = 94
          Top = 96
          Width = 299
          Height = 21
          MaxLength = 40
          TabOrder = 2
          Text = 'BuildingEdit'
        end
        object StreetEdit: TEdit
          Left = 94
          Top = 120
          Width = 299
          Height = 21
          MaxLength = 40
          TabOrder = 3
          Text = 'StreetEdit'
        end
        object LocaleEdit: TEdit
          Left = 94
          Top = 144
          Width = 299
          Height = 21
          MaxLength = 40
          TabOrder = 4
          Text = 'LocaleEdit'
        end
        object TownEdit: TEdit
          Left = 94
          Top = 168
          Width = 299
          Height = 21
          MaxLength = 40
          TabOrder = 5
          Text = 'TownEdit'
        end
        object PhoneEdit: TEdit
          Left = 94
          Top = 224
          Width = 139
          Height = 21
          MaxLength = 20
          TabOrder = 7
          Text = 'PhoneEdit'
          OnChange = PhoneEditChange
        end
        object FaxEdit: TEdit
          Left = 94
          Top = 248
          Width = 139
          Height = 21
          MaxLength = 20
          TabOrder = 8
          Text = 'FaxEdit'
        end
        object EMailEdit: TEdit
          Left = 94
          Top = 272
          Width = 299
          Height = 21
          MaxLength = 40
          TabOrder = 9
          Text = 'EMailEdit'
        end
        object PostCodeEdit: TEdit
          Left = 94
          Top = 192
          Width = 105
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 10
          TabOrder = 6
          Text = 'POSTCODEEDIT'
        end
        object AccCodeEdit: TEdit
          Left = 94
          Top = 307
          Width = 90
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 8
          TabOrder = 10
          Text = 'ACCCODEEDIT'
          OnChange = AccCodeEditChange
          OnEnter = AccCodeEditEnter
          OnExit = AccCodeEditExit
        end
        object chkbxActive: TCheckBox
          Left = 16
          Top = 340
          Width = 113
          Height = 17
          Caption = 'Branch is active'
          TabOrder = 12
        end
      end
    end
    object tbshtProductTypes: TTabSheet
      Caption = 'Product types'
      ImageIndex = 1
    end
  end
  object PrintBitBtn: TBitBtn
    Left = 8
    Top = 424
    Width = 75
    Height = 25
    Caption = 'Print'
    TabOrder = 3
    OnClick = PrintBitBtnClick
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Branch_No) as Last_Code'
      'From Supplier_Branch'
      'Where (Supplier = :Supplier)')
    Left = 96
    Top = 136
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Supplier_Branch'
      '        (Supplier,'
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
      '        Narrative,'
      '        Account_Code,'
      '        Account_Code_On_Ledger)'
      'Values'
      '        (:Supplier,'
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
      '        :Narrative,'
      '        :Account_Code,'
      '        '#39'Y'#39')'
      '')
    Left = 224
    Top = 112
    ParamData = <
      item
        Name = 'Supplier'
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
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Account_Code'
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Supplier_Branch'
      'Set'
      '        Name = :Name,'
      '        Building_No_Name  = :Building_No_Name,'
      '        Street = :Street,'
      '        Locale = :Locale,'
      '        Town = :Town,'
      '        Phone = :Phone,'
      '        Fax_Number = :Fax_Number,'
      '        PostCode = :PostCode,'
      '        Narrative = :Narrative,'
      '        Email = :Email,'
      '        Account_Code = :Account_Code,'
      '        Account_Code_on_Ledger = '#39'Y'#39','
      '        Inactive = :Inactive'
      'Where'
      '(Supplier = :Supplier) and'
      '(Branch_No = :Branch_No)')
    Left = 296
    Top = 48
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
        Name = 'Inactive'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Supplier_Branch'
      'Where'
      '(Supplier = :Supplier) and'
      '(Branch_No = :Branch_No)')
    Left = 48
    Top = 104
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 176
    Top = 168
  end
  object GetCompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Company')
    Left = 288
    Top = 340
  end
  object CheckSuppAccExistsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Supplier.Name'
      'From Supplier, Supplier_Branch'
      'Where (Supplier.Supplier <> :Supplier) and'
      '      (Supplier_Branch.Supplier = Supplier.Supplier) and'
      '      (Supplier_Branch.Account_Code = :Acc_Code)')
    Left = 192
    Top = 276
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Acc_Code'
      end>
  end
  object CheckCustAccExistsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Customer.Name'
      'From Customer, Customer_Branch'
      'Where (Customer_Branch.Customer = Customer.Customer) and'
      '      (Customer_Branch.Account_Code = :Acc_Code)')
    Left = 288
    Top = 196
    ParamData = <
      item
        Name = 'Acc_Code'
      end>
  end
  object UpdNotesOnlySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Supplier_Branch'
      'Set     Narrative = :Narrative'
      'Where'
      '(Supplier = :Supplier) and'
      '(Branch_No = :Branch_No)'
      '')
    Left = 176
    Top = 128
    ParamData = <
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object qryGetBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Supplier_Branch.*, Supplier.Name as Supplier_Name'
      'From Supplier_Branch, Supplier'
      'Where'
      '(Supplier_Branch.Supplier = :Supplier) and'
      '(Supplier_Branch.Branch_no = :Branch_no) and'
      '(Supplier.Supplier = Supplier_Branch.Supplier)')
    Left = 72
    Top = 263
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
end
