object CSMaintCContaFrm: TCSMaintCContaFrm
  Left = 251
  Top = 46
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Maintain Customer/Branch Contact'
  ClientHeight = 484
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 15
  object DelLabel: TLabel
    Left = 40
    Top = 459
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
    Left = 200
    Top = 454
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
    Left = 280
    Top = 454
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
    Top = 12
    Width = 377
    Height = 437
    Caption = 'Details'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 55
      Height = 15
      Caption = 'Customer'
    end
    object Label2: TLabel
      Left = 8
      Top = 46
      Width = 42
      Height = 15
      Caption = 'Branch '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 73
      Width = 34
      Height = 15
      Caption = 'Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 213
      Width = 70
      Height = 15
      Caption = 'Contact Type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 130
      Width = 36
      Height = 15
      Caption = 'Phone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 313
      Width = 82
      Height = 15
      Caption = 'E-Mail Address'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 99
      Width = 55
      Height = 15
      Caption = 'Salutation'
    end
    object MobileLabel: TLabel
      Left = 8
      Top = 183
      Width = 58
      Height = 15
      Caption = 'Mobile No.'
    end
    object lblcontactLevel: TLabel
      Left = 8
      Top = 240
      Width = 74
      Height = 15
      Caption = 'Contact Level'
    end
    object lblFaxNo: TLabel
      Left = 8
      Top = 156
      Width = 19
      Height = 15
      Caption = 'Fax'
    end
    object Label8: TLabel
      Left = 8
      Top = 384
      Width = 150
      Height = 15
      Caption = 'Receive Correspondence ?'
    end
    object Label9: TLabel
      Left = 8
      Top = 336
      Width = 79
      Height = 30
      Alignment = taCenter
      Caption = 'Accept Files of type '
      WordWrap = True
    end
    object Label10: TLabel
      Left = 8
      Top = 264
      Width = 35
      Height = 15
      Caption = 'Status'
    end
    object Label11: TLabel
      Left = 8
      Top = 292
      Width = 93
      Height = 15
      Caption = 'Default Margin %'
    end
    object CustNameEdit: TEdit
      Left = 110
      Top = 16
      Width = 252
      Height = 23
      MaxLength = 40
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      Text = 'CustNameEdit'
    end
    object NameEdit: TEdit
      Left = 110
      Top = 69
      Width = 252
      Height = 23
      MaxLength = 40
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = 'NameEdit'
      OnChange = NameEditChange
    end
    object BranchNameEdit: TEdit
      Left = 110
      Top = 42
      Width = 252
      Height = 23
      MaxLength = 40
      ReadOnly = True
      TabOrder = 1
      Text = 'BranchNameEdit'
    end
    object TypeDBLCB: TDBLookupComboBox
      Left = 110
      Top = 200
      Width = 161
      Height = 23
      KeyField = 'Contact_Type'
      ListField = 'Description'
      ListSource = ContTypesSRC
      TabOrder = 4
      OnClick = TypeDBLCBClick
    end
    object PhoneEdit: TEdit
      Left = 110
      Top = 121
      Width = 161
      Height = 23
      MaxLength = 20
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnChange = NameEditChange
    end
    object EMailEdit: TEdit
      Left = 110
      Top = 309
      Width = 251
      Height = 23
      MaxLength = 40
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnChange = NameEditChange
    end
    object SalutationEdit: TEdit
      Left = 110
      Top = 95
      Width = 251
      Height = 23
      TabOrder = 3
      Text = 'SalutationEdit'
    end
    object MobileEdt: TEdit
      Left = 110
      Top = 173
      Width = 161
      Height = 23
      TabOrder = 8
    end
    object ContTypeMaintBitBtn: TBitBtn
      Left = 280
      Top = 201
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
      TabOrder = 11
      OnClick = ContTypeMaintBitBtnClick
    end
    object LevelDBLCB: TDBLookupComboBox
      Left = 110
      Top = 227
      Width = 161
      Height = 23
      KeyField = 'Contact_Level'
      ListField = 'Description'
      ListSource = ContLevelsSRC
      TabOrder = 5
    end
    object RecvCorresCB: TCheckBox
      Left = 176
      Top = 383
      Width = 17
      Height = 17
      TabOrder = 10
    end
    object FaxEdit: TEdit
      Left = 110
      Top = 147
      Width = 161
      Height = 23
      TabOrder = 7
    end
    object ContLevelMaintBitBtn: TBitBtn
      Left = 280
      Top = 228
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
      TabOrder = 12
      OnClick = ContLevelMaintBitBtnClick
    end
    object FileTypDBLCB: TDBLookupComboBox
      Left = 110
      Top = 344
      Width = 209
      Height = 23
      KeyField = 'ExportFilter'
      ListField = 'Description'
      ListSource = FileTypSRC
      TabOrder = 13
      OnClick = FileTypDBLCBClick
    end
    object StatusDBLCB: TDBLookupComboBox
      Left = 110
      Top = 256
      Width = 161
      Height = 23
      KeyField = 'Contact_Status'
      ListField = 'Contact_Status_Descr'
      TabOrder = 14
    end
    object memMarkup: TMemo
      Left = 110
      Top = 284
      Width = 83
      Height = 23
      Alignment = taRightJustify
      Lines.Strings = (
        'memMarkup')
      TabOrder = 15
      WantReturns = False
      WordWrap = False
      OnEnter = memMarkupEnter
      OnExit = memMarkupExit
      OnKeyPress = memMarkupKeyPress
    end
    object ChkBxActive: TCheckBox
      Left = 8
      Top = 412
      Width = 127
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Contact is Active ?'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 16
    end
    object NotesBitBtn: TBitBtn
      Left = 232
      Top = 377
      Width = 73
      Height = 25
      Caption = 'Notes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
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
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Contact_No'
      'From Customer_Contact'
      'Where Name = :GUID')
    Left = 96
    Top = 384
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Customer_Contact'
      'Where'
      '(Customer = :Customer) and'
      '(Branch_No = :Branch_No) and'
      '(Contact_No = :Contact_No)')
    Left = 40
    Top = 416
    ParamData = <
      item
        Name = 'Customer'
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
    Left = 72
    Top = 76
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
    Left = 312
    Top = 172
  end
  object ContTypesSRC: TDataSource
    DataSet = GetContTypesSQL
    Left = 344
    Top = 172
  end
  object QryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Customer_Contact'
      '        (Customer,'
      '        Branch_No,'
      '        Contact_No,'
      '        Name,'
      '        Contact_Type)'
      
        'Select :Customer, :Branch_No, Max(Contact_No)+1, :GUID, :Contact' +
        '_Type'
      
        'From Customer_Contact Where Customer = :Customer and Branch_No =' +
        ' :Branch_No'
      ''
      ''
      ' ')
    Left = 40
    Top = 384
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'GUID'
      end
      item
        Name = 'Contact_Type'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object GetContLevelsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Contact_Level, Description'
      'FROM Contact_Level'
      'ORDER BY Description')
    Left = 312
    Top = 204
  end
  object ContLevelsSRC: TDataSource
    DataSet = GetContLevelsSQL
    Left = 344
    Top = 204
  end
  object GetFileTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT ExportFilter, Description'
      'FROM ExportFilter'
      'ORDER BY Description'
      ' ')
    Left = 281
    Top = 340
  end
  object FileTypSRC: TDataSource
    DataSet = GetFileTypeSQL
    Left = 329
    Top = 340
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 312
    Top = 72
  end
  object UpdNotesOnlySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Contact'
      'Set     Narrative = :Narrative'
      'Where'
      '(Customer = :Customer) and'
      '(Branch_No = :Branch_No) and'
      '(Contact_No = :Contact_No)'
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
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Contact_No'
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Customer_Contact'
      '        (Customer,'
      '        Branch_No,'
      '        Contact_No,'
      '        Name,'
      '        Contact_Type,'
      '        ExportFilter,'
      '        Narrative)'
      
        'Select :Customer, :Branch_No, Max(Contact_No)+1, :GUID, :Contact' +
        '_Type, :ExportFilter, :Narrative'
      
        'From Customer_Contact Where Customer = :Customer and Branch_No =' +
        ' :Branch_No'
      ' '
      ' ')
    Left = 88
    Top = 416
    ParamData = <
      item
        Name = 'Customer'
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
        Name = 'Customer'
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
      'Update Customer_Contact'
      'Set'
      '        Name = :Name,'
      '        Phone = :Phone,'
      '        Mobile_No =:Mobile_No,'
      '        EMail = :Email,'
      '        Contact_Type = :Contact_Type,'
      '        Salutation = :Salutation,'
      '        Contact_Level = :Contact_Level,'
      '        Fax_Number = :Fax_Number,'
      '        ExportFilter = :ExportFilter,'
      '        Receive_Mail = :Receive_Mail,'
      '        Narrative = :Narrative,'
      '        Contact_Status = :Contact_Status,'
      '        Def_Markup_Perc = :Def_Markup_Perc,'
      '        InActive = :InActive'
      'Where'
      '(Customer = :Customer) and'
      '(Branch_No = :Branch_No) and'
      '(Contact_No = :Contact_No)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 160
    Top = 416
    ParamData = <
      item
        Name = 'Name'
      end
      item
        Name = 'Phone'
      end
      item
        Name = 'Mobile_No'
      end
      item
        Name = 'Email'
      end
      item
        Name = 'Contact_Type'
      end
      item
        Name = 'Salutation'
      end
      item
        Name = 'Contact_Level'
        DataType = ftInteger
      end
      item
        Name = 'Fax_Number'
      end
      item
        Name = 'ExportFilter'
        DataType = ftString
      end
      item
        Name = 'Receive_Mail'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Contact_Status'
        DataType = ftInteger
      end
      item
        Name = 'Def_Markup_Perc'
      end
      item
        Name = 'InActive'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Contact_No'
      end>
  end
  object qryStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Contact_Status')
    Left = 313
    Top = 244
  end
  object srcStatus: TDataSource
    DataSet = qryStatus
    Left = 313
    Top = 292
  end
end
