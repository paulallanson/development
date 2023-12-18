object PBMaintRepFrm: TPBMaintRepFrm
  Left = 420
  Top = 64
  BorderStyle = bsDialog
  Caption = 'Maintain Reps'
  ClientHeight = 514
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 13
  object DelLabel: TLabel
    Left = 110
    Top = 494
    Width = 145
    Height = 15
    Caption = 'Delete the above details ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OKBitBtn: TBitBtn
    Left = 262
    Top = 486
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
    TabOrder = 1
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 342
    Top = 486
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
    Left = 8
    Top = 8
    Width = 409
    Height = 465
    Caption = 'Details'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 12
      Top = 20
      Width = 52
      Height = 13
      Caption = 'Rep Name'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 11
      Top = 67
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
    object Label7: TLabel
      Left = 11
      Top = 163
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
    object Label8: TLabel
      Left = 11
      Top = 189
      Width = 33
      Height = 13
      Caption = 'Phone'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 228
      Top = 189
      Width = 17
      Height = 13
      Caption = 'Fax'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 11
      Top = 213
      Width = 27
      Height = 13
      Caption = 'Email'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 11
      Top = 237
      Width = 36
      Height = 13
      Caption = 'Mobile'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 283
      Top = 21
      Width = 61
      Height = 13
      Caption = 'Prefix/Suffix'
    end
    object Label5: TLabel
      Left = 11
      Top = 43
      Width = 42
      Height = 13
      Caption = 'Position'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object ProdNomlbl: TLabel
      Left = 11
      Top = 345
      Width = 86
      Height = 13
      Caption = 'Product Nominal'
    end
    object AdditDestslbl: TLabel
      Left = 11
      Top = 368
      Width = 92
      Height = 13
      Caption = 'Additional Details'
    end
    object Label6: TLabel
      Left = 11
      Top = 381
      Width = 43
      Height = 13
      Caption = 'Nominal'
    end
    object Label11: TLabel
      Left = 11
      Top = 317
      Width = 74
      Height = 13
      Caption = 'Commission %'
    end
    object Label12: TLabel
      Left = 11
      Top = 290
      Width = 55
      Height = 13
      Caption = 'Sales Team'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object NotesBitBtn: TBitBtn
      Left = 309
      Top = 340
      Width = 75
      Height = 26
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
      TabOrder = 17
      OnClick = NotesBitBtnClick
    end
    object NameEdit: TEdit
      Left = 101
      Top = 16
      Width = 171
      Height = 21
      MaxLength = 40
      TabOrder = 0
      Text = 'NameEdit'
      OnChange = NameEditChange
    end
    object BuildingEdit: TEdit
      Left = 101
      Top = 65
      Width = 295
      Height = 21
      MaxLength = 40
      TabOrder = 3
      Text = 'BuildingEdit'
    end
    object StreetEdit: TEdit
      Left = 101
      Top = 89
      Width = 295
      Height = 21
      MaxLength = 40
      TabOrder = 4
      Text = 'StreetEdit'
    end
    object LocaleEdit: TEdit
      Left = 101
      Top = 114
      Width = 295
      Height = 21
      MaxLength = 40
      TabOrder = 5
      Text = 'LocaleEdit'
    end
    object TownEdit: TEdit
      Left = 101
      Top = 138
      Width = 171
      Height = 21
      MaxLength = 40
      TabOrder = 6
      Text = 'TownEdit'
    end
    object PhoneEdit: TEdit
      Left = 101
      Top = 186
      Width = 123
      Height = 21
      MaxLength = 20
      TabOrder = 8
      Text = 'PhoneEdit'
      OnChange = PhoneEditChange
    end
    object FaxEdit: TEdit
      Left = 261
      Top = 186
      Width = 135
      Height = 21
      MaxLength = 20
      TabOrder = 9
      Text = 'FaxEdit'
    end
    object EMailEdit: TEdit
      Left = 101
      Top = 210
      Width = 295
      Height = 21
      MaxLength = 40
      TabOrder = 10
      Text = 'EMailEdit'
    end
    object PostCodeEdit: TEdit
      Left = 101
      Top = 162
      Width = 105
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 7
      Text = 'POSTCODEEDIT'
    end
    object MobileEdit: TEdit
      Left = 101
      Top = 234
      Width = 124
      Height = 21
      MaxLength = 40
      TabOrder = 11
      Text = 'MobileEdit'
    end
    object PrefixEdit: TEdit
      Left = 349
      Top = 16
      Width = 45
      Height = 21
      MaxLength = 3
      TabOrder = 1
      Text = 'PrefixEdit'
    end
    object PosEdit: TEdit
      Left = 101
      Top = 41
      Width = 295
      Height = 21
      MaxLength = 40
      TabOrder = 2
      Text = 'NameEdit'
    end
    object ProdNomDBLookupComboBox: TDBLookupComboBox
      Left = 101
      Top = 341
      Width = 124
      Height = 21
      KeyField = 'Nominal'
      ListField = 'Nominal'
      ListSource = RepNomSRC
      TabOrder = 15
    end
    object AddNomDBLookupComboBox: TDBLookupComboBox
      Left = 101
      Top = 373
      Width = 124
      Height = 21
      KeyField = 'Nominal'
      ListField = 'Nominal'
      ListSource = RepNomSRC
      TabOrder = 16
    end
    object NominalBitBtn: TBitBtn
      Left = 309
      Top = 369
      Width = 75
      Height = 26
      Caption = 'Nominal'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
        00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
        00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
        F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
        FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
        0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
        0033333337FFFFFF773333333000000003333333377777777333}
      NumGlyphs = 2
      TabOrder = 18
      OnClick = NominalBitBtnClick
    end
    object spnCommission: TSpinEdit
      Left = 101
      Top = 313
      Width = 68
      Height = 22
      MaxValue = 100
      MinValue = 0
      TabOrder = 14
      Value = 0
    end
    object dblkpRepTeam: TDBLookupComboBox
      Left = 101
      Top = 288
      Width = 220
      Height = 21
      KeyField = 'Rep_Team'
      ListField = 'Rep_Team_Name'
      ListSource = dtsRepTeam
      TabOrder = 13
    end
    object btnRepTeam: TBitBtn
      Left = 336
      Top = 287
      Width = 25
      Height = 24
      Hint = 'Lookup sales teams'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      OnClick = btnRepTeamClick
    end
    object GroupClearBitBtn: TBitBtn
      Left = 368
      Top = 287
      Width = 25
      Height = 24
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
      TabOrder = 20
      TabStop = False
      OnClick = GroupClearBitBtnClick
    end
    object chkbxActive: TCheckBox
      Left = 11
      Top = 437
      Width = 185
      Height = 18
      Caption = 'Rep is active'
      TabOrder = 21
    end
    object pnlSubReps: TPanel
      Left = 2
      Top = 256
      Width = 404
      Height = 26
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 12
      object Label13: TLabel
        Left = 9
        Top = 8
        Width = 48
        Height = 13
        Caption = 'Company'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 263
        Top = 8
        Width = 23
        Height = 13
        Caption = 'Area'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object CompanyEdit: TEdit
        Left = 99
        Top = 4
        Width = 152
        Height = 21
        MaxLength = 40
        TabOrder = 0
        Text = 'CompanyEdit'
      end
      object AreaEdit: TEdit
        Left = 289
        Top = 4
        Width = 104
        Height = 21
        MaxLength = 40
        TabOrder = 1
        Text = 'AreaEdit'
      end
    end
    object chkbxSubRep: TCheckBox
      Left = 11
      Top = 408
      Width = 185
      Height = 18
      Caption = 'Rep is a Sub Rep'
      TabOrder = 22
    end
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Rep'
      'From Rep Where Name = :GUID'
      '')
    Left = 320
    Top = 128
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Rep'
      '        (Rep,'
      '        Name,'
      '        Building_No_Name,'
      '        Street,'
      '        Town,'
      '        PostCode,'
      '        Phone)'
      'Select Max(Rep)+1, :GUID, '#39#39', '#39#39', '#39#39', '#39#39', '#39#39' From Rep'
      ''
      ''
      ' ')
    Left = 224
    Top = 120
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Rep'
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
      '        Mobile_No = :Mobile_No,'
      '        Company_Name = :Company_Name,'
      '        Sales_Area = :Sales_Area,'
      '        Rep_Suffix_or_Prefix = :Rep_Suffix_or_Prefix,'
      '        Position = :Position,'
      '        Product_Nominal_Def = :Product_Nominal_Def,'
      
        '        Additional_Dtls_Nominal_Def = :Additional_Dtls_Nominal_D' +
        'ef,'
      '        Commission_Rate = :Commission_Rate,'
      '        Rep_Team = :Rep_Team,'
      '        Inactive = :inactive,'
      '        Rep_Is_Sub_Rep = :Rep_Is_Sub_Rep'
      'Where'
      '(Rep = :Rep)')
    Left = 344
    Top = 56
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
        Name = 'Mobile_No'
      end
      item
        Name = 'Company_Name'
      end
      item
        Name = 'Sales_Area'
      end
      item
        Name = 'Rep_Suffix_or_Prefix'
      end
      item
        Name = 'Position'
      end
      item
        Name = 'Product_Nominal_Def'
        DataType = ftString
      end
      item
        Name = 'Additional_Dtls_Nominal_Def'
        DataType = ftString
      end
      item
        Name = 'Commission_Rate'
      end
      item
        Name = 'Rep_Team'
        DataType = ftInteger
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Rep_Is_Sub_Rep'
      end
      item
        Name = 'Rep'
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Rep'
      'Where'
      '(Rep = :Rep)')
    Left = 184
    Top = 80
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 280
    Top = 120
  end
  object RepNomSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Rep_Nominal'
      'where Rep = :Rep')
    Left = 376
    Top = 156
    ParamData = <
      item
        Name = 'Rep'
        DataType = ftInteger
      end>
  end
  object RepNomSRC: TDataSource
    DataSet = RepNomSQL
    Left = 80
    Top = 116
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Rep(Rep, Name)'
      'SELECT Max(Rep)+1, :GUID FROM Rep'
      ''
      ''
      ' ')
    Left = 192
    Top = 8
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdNotesOnlySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Rep'
      'Set     Narrative = :Narrative'
      'Where'
      '(Rep = :Rep) '
      ' ')
    Left = 176
    Top = 128
    ParamData = <
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
      end>
  end
  object qryRepTeam: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from Rep_Team'
      'order by Rep_Team_Name')
    Left = 272
    Top = 196
  end
  object dtsRepTeam: TDataSource
    DataSet = qryRepTeam
    Left = 352
    Top = 244
  end
  object qryGetRepTeam: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Rep_Team'
      'FROM Rep_Team_Member'
      'WHERE Rep = :Rep')
    Left = 144
    Top = 416
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
  object qryAddRepTeamMember: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Rep_Team_Member'
      '('
      'Rep_Team,'
      'Rep'
      ')'
      'VALUES'
      '('
      ':Rep_Team,'
      ':Rep'
      ')')
    Left = 248
    Top = 416
    ParamData = <
      item
        Name = 'Rep_Team'
      end
      item
        Name = 'Rep'
      end>
  end
end
