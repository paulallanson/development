object PBMaintSContaFrm: TPBMaintSContaFrm
  Left = 221
  Top = 77
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Maintain Supplier/Branch Contacts'
  ClientHeight = 400
  ClientWidth = 383
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
    Left = 48
    Top = 373
    Width = 133
    Height = 13
    Caption = 'Delete the above details ?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OKBitBtn: TBitBtn
    Left = 208
    Top = 368
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
    Left = 288
    Top = 368
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
    Width = 361
    Height = 353
    Caption = 'Details'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 43
      Height = 13
      Caption = 'Supplier'
    end
    object Label2: TLabel
      Left = 8
      Top = 46
      Width = 38
      Height = 13
      Caption = 'Branch '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 72
      Width = 40
      Height = 13
      Caption = 'Contact'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 124
      Width = 66
      Height = 13
      Caption = 'Contact Type'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 166
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
    object Label7: TLabel
      Left = 8
      Top = 260
      Width = 75
      Height = 13
      Caption = 'E-Mail address'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 98
      Width = 53
      Height = 13
      Caption = 'Salutation'
    end
    object Label5: TLabel
      Left = 8
      Top = 192
      Width = 17
      Height = 13
      Caption = 'Fax'
    end
    object Label9: TLabel
      Left = 8
      Top = 218
      Width = 57
      Height = 13
      Caption = 'Mobile No.'
    end
    object Label10: TLabel
      Left = 8
      Top = 280
      Width = 63
      Height = 26
      Alignment = taCenter
      Caption = 'Accept Files of type '
      WordWrap = True
    end
    object SuppNameEdit: TEdit
      Left = 96
      Top = 16
      Width = 252
      Height = 21
      Color = clBtnFace
      MaxLength = 40
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      Text = 'SuppNameEdit'
    end
    object NameEdit: TEdit
      Left = 96
      Top = 68
      Width = 252
      Height = 21
      MaxLength = 40
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = 'NameEdit'
      OnChange = NameEditChange
    end
    object TypeDBLCB: TDBLookupComboBox
      Left = 96
      Top = 120
      Width = 161
      Height = 21
      KeyField = 'Contact_Type'
      ListField = 'Description'
      ListSource = ContTypesSRC
      TabOrder = 4
      OnClick = TypeDBLCBClick
    end
    object PhoneEdit: TEdit
      Left = 96
      Top = 162
      Width = 161
      Height = 21
      MaxLength = 20
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnChange = NameEditChange
    end
    object EMailEdit: TEdit
      Left = 96
      Top = 256
      Width = 252
      Height = 21
      MaxLength = 120
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnChange = NameEditChange
    end
    object SalutationEdit: TEdit
      Left = 96
      Top = 94
      Width = 252
      Height = 21
      MaxLength = 40
      TabOrder = 3
      Text = 'SalutationEdit'
    end
    object FaxEdit: TEdit
      Left = 96
      Top = 188
      Width = 161
      Height = 21
      TabOrder = 7
    end
    object MobileEdit: TEdit
      Left = 96
      Top = 214
      Width = 161
      Height = 21
      TabOrder = 8
    end
    object ContTypeMaintBitBtn: TBitBtn
      Left = 264
      Top = 120
      Width = 25
      Height = 23
      Hint = 'Contact Type Maintenance'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = ContTypeMaintBitBtnClick
    end
    object FileTypDBLCB: TDBLookupComboBox
      Left = 96
      Top = 282
      Width = 209
      Height = 21
      KeyField = 'ExportFilter'
      ListField = 'Description'
      ListSource = FileTypSRC
      TabOrder = 10
      OnClick = FileTypDBLCBClick
    end
    object NotesBitBtn: TBitBtn
      Left = 264
      Top = 188
      Width = 89
      Height = 25
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
      TabOrder = 12
      OnClick = NotesBitBtnClick
    end
    object dblkpBranchName: TDBLookupComboBox
      Left = 96
      Top = 40
      Width = 252
      Height = 21
      KeyField = 'Branch_no'
      ListField = 'Name'
      ListSource = dtsBranch
      TabOrder = 1
    end
    object chkbxActive: TCheckBox
      Left = 8
      Top = 320
      Width = 137
      Height = 17
      Caption = 'Contact is active'
      TabOrder = 11
    end
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Contact_No'
      'From Supplier_BranchContacts'
      'Where Name = :GUID')
    Left = 280
    Top = 344
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
      'Insert Into Supplier_BranchContacts'
      '        (Supplier,'
      '        Branch_No,'
      '        Contact_No,'
      '        Name,'
      '        Contact_Type,'
      '        ExportFilter,'
      '        Narrative)'
      
        'Select :Supplier, :Branch_No, Max(Contact_No)+1, :GUID, :Contact' +
        '_Type, :ExportFilter, :Narrative'
      'From Supplier_BranchContacts Where Supplier = :Supplier'
      'and Branch_No = :Branch_No'
      ' '
      ' ')
    Left = 320
    Top = 344
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Contact_Type'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ExportFilter'
        DataType = ftString
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Supplier_BranchContacts'
      'Set'
      '        Name = :Name,'
      '        Contact_Type = :Contact_Type,'
      '        Phone = :Phone,'
      '        EMail = :EMail,'
      '        Salutation = :Salutation,'
      '        Fax_Number = :Fax_Number,'
      '        ExportFilter = :ExportFilter,'
      '        Mobile_No = :Mobile_No,'
      '        Narrative = :Narrative,'
      '        Inactive = :Inactive'
      'Where'
      '(Supplier = :Supplier) and'
      '(Branch_No = :Branch_No) and'
      '(Contact_No = :Contact_No)'
      ''
      ' '
      ' ')
    Left = 64
    Top = 344
    ParamData = <
      item
        Name = 'Name'
      end
      item
        Name = 'Contact_Type'
      end
      item
        Name = 'Phone'
      end
      item
        Name = 'EMail'
      end
      item
        Name = 'Salutation'
      end
      item
        Name = 'Fax_Number'
      end
      item
        Name = 'ExportFilter'
        DataType = ftString
      end
      item
        Name = 'Mobile_No'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Inactive'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Contact_No'
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Supplier_BranchContacts'
      'Where'
      '(Supplier = :Supplier) and'
      '(Branch_No = :Branch_No) and'
      '(Contact_No = :Contact_No)')
    Left = 24
    Top = 344
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Contact_No'
      end>
  end
  object GetBranchNameSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Name from Customer_Branch'
      'Where (Customer = :Customer) and'
      '      (Branch_No = :Branch_No)')
    Left = 312
    Top = 60
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object GetContTypesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Contact_Type, Description'
      'From Contact_Type'
      'Order By Description')
    Left = 304
    Top = 140
  end
  object ContTypesSRC: TDataSource
    DataSet = GetContTypesSQL
    Left = 336
    Top = 140
  end
  object QryZero: TFDQuery
    ConnectionName = 'PB'
    Left = 240
    Top = 344
  end
  object GetFileTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT ExportFilter, Description'
      'FROM ExportFilter'
      'ORDER BY Description'
      ' ')
    Left = 281
    Top = 300
  end
  object FileTypSRC: TDataSource
    DataSet = GetFileTypeSQL
    Left = 329
    Top = 300
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 264
    Top = 72
  end
  object UpdNotesOnlySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Supplier_BranchContacts'
      'Set     Narrative = :Narrative'
      'Where'
      '(Supplier = :Supplier) and'
      '(Branch_No = :Branch_No) and'
      '(Contact_No = :Contact_No)'
      ' '
      ' '
      ' ')
    Left = 184
    Top = 160
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
      end
      item
        Name = 'Contact_No'
      end>
  end
  object qryGetContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Supplier_BranchContacts.*,'
      '        Supplier.Name as Supplier_Name,'
      '        Supplier_Branch.Name as Branch_Name'
      'From Supplier_BranchContacts, Supplier, Supplier_branch'
      'Where (Supplier_BranchContacts.Supplier = :Supplier) and'
      '      (Supplier_BranchContacts.Branch_No = :Branch_No) and'
      '      (Supplier_BranchContacts.Contact_no = :Contact_no) and'
      '      (Supplier_BranchContacts.Supplier = Supplier.Supplier) and'
      
        '      ((Supplier_Branch.Supplier = Supplier_BranchContacts.Suppl' +
        'ier) and'
      
        '      (Supplier_Branch.Branch_no = Supplier_BranchContacts.Branc' +
        'h_no))'
      ' '
      ' ')
    Left = 201
    Top = 84
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object qryBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from supplier_branch'
      'where supplier = :supplier'
      'order by Name')
    Left = 16
    Top = 24
    ParamData = <
      item
        Name = 'supplier'
        DataType = ftInteger
      end>
  end
  object dtsBranch: TDataSource
    DataSet = qryBranch
    Left = 56
    Top = 24
  end
end
