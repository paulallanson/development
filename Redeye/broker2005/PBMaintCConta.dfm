object PBMaintCContaFrm: TPBMaintCContaFrm
  Left = 226
  Top = 2
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Maintain Customer/Branch Contact'
  ClientHeight = 584
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    436
    584)
  PixelsPerInch = 96
  TextHeight = 13
  object DelLabel: TLabel
    Left = 60
    Top = 559
    Width = 151
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Delete the above details ?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 9
    Top = 12
    Width = 53
    Height = 13
    Caption = 'Customer'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Top = 36
    Width = 45
    Height = 13
    Caption = 'Branch '
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 9
    Top = 60
    Width = 33
    Height = 13
    Caption = 'Name'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OKBitBtn: TBitBtn
    Left = 220
    Top = 553
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 4
    OnClick = OKBitBtnClick
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
  end
  object CancelBitBtn: TBitBtn
    Left = 300
    Top = 553
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
    OnClick = CancelBitBtnClick
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
    NumGlyphs = 2
  end
  object pgDetails: TPageControl
    Left = 8
    Top = 84
    Width = 417
    Height = 461
    ActivePage = tsDetails
    TabOrder = 3
    object tsDetails: TTabSheet
      Caption = 'Details'
      object DetsGrpBox: TGroupBox
        ParentBackground = False
        Left = 5
        Top = -4
        Width = 404
        Height = 437
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label5: TLabel
          Left = 9
          Top = 20
          Width = 58
          Height = 13
          Caption = 'Salutation'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 9
          Top = 116
          Width = 77
          Height = 13
          Caption = 'Contact Type'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 9
          Top = 44
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
        object Label7: TLabel
          Left = 9
          Top = 216
          Width = 85
          Height = 13
          Caption = 'E-Mail Address'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object MobileLabel: TLabel
          Left = 9
          Top = 92
          Width = 51
          Height = 13
          Caption = 'Mobile No.'
        end
        object lblcontactLevel: TLabel
          Left = 9
          Top = 140
          Width = 66
          Height = 13
          Caption = 'Contact Level'
        end
        object lblFaxNo: TLabel
          Left = 9
          Top = 68
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Label9: TLabel
          Left = 6
          Top = 239
          Width = 75
          Height = 26
          Alignment = taCenter
          Caption = 'Accept Files of type '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label10: TLabel
          Left = 9
          Top = 164
          Width = 30
          Height = 13
          Caption = 'Status'
        end
        object Label11: TLabel
          Left = 9
          Top = 189
          Width = 80
          Height = 13
          Caption = 'Default Margin %'
        end
        object SalutationEdit: TEdit
          Left = 110
          Top = 16
          Width = 251
          Height = 21
          TabOrder = 0
          Text = 'SalutationEdit'
        end
        object TypeDBLCB: TDBLookupComboBox
          Left = 110
          Top = 112
          Width = 161
          Height = 21
          KeyField = 'Contact_Type'
          ListField = 'Description'
          ListSource = ContTypesSRC
          TabOrder = 4
          OnClick = TypeDBLCBClick
        end
        object PhoneEdit: TEdit
          Left = 110
          Top = 40
          Width = 161
          Height = 21
          MaxLength = 20
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnChange = NameEditChange
        end
        object EMailEdit: TEdit
          Left = 110
          Top = 212
          Width = 251
          Height = 21
          MaxLength = 120
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          OnChange = NameEditChange
        end
        object MobileEdt: TEdit
          Left = 110
          Top = 88
          Width = 161
          Height = 21
          TabOrder = 3
        end
        object ContTypeMaintBitBtn: TBitBtn
          Left = 280
          Top = 111
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
        object LevelDBLCB: TDBLookupComboBox
          Left = 110
          Top = 136
          Width = 161
          Height = 21
          KeyField = 'Contact_Level'
          ListField = 'Description'
          ListSource = ContLevelsSRC
          TabOrder = 6
        end
        object RecvCorresCB: TCheckBox
          Left = 9
          Top = 272
          Width = 185
          Height = 17
          Caption = 'Receive Correspondence'
          TabOrder = 12
        end
        object FaxEdit: TEdit
          Left = 110
          Top = 64
          Width = 161
          Height = 21
          TabOrder = 2
        end
        object ContLevelMaintBitBtn: TBitBtn
          Left = 280
          Top = 135
          Width = 25
          Height = 23
          Hint = 'Contact Level Maintenance'
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'System'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = ContLevelMaintBitBtnClick
        end
        object FileTypDBLCB: TDBLookupComboBox
          Left = 110
          Top = 242
          Width = 209
          Height = 21
          KeyField = 'ExportFilter'
          ListField = 'Description'
          ListSource = FileTypSRC
          TabOrder = 11
          OnClick = FileTypDBLCBClick
        end
        object NotesBitBtn: TBitBtn
          Left = 244
          Top = 273
          Width = 73
          Height = 25
          Caption = 'Notes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          OnClick = NotesBitBtnClick
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
        end
        object StatusDBLCB: TDBLookupComboBox
          Left = 110
          Top = 160
          Width = 161
          Height = 21
          KeyField = 'Contact_Status'
          ListField = 'Contact_Status_Descr'
          ListSource = srcStatus
          TabOrder = 8
        end
        object memMarkup: TMemo
          Left = 110
          Top = 184
          Width = 83
          Height = 23
          Alignment = taRightJustify
          Lines.Strings = (
            'memMarkup')
          TabOrder = 9
          WantReturns = False
          WordWrap = False
          OnEnter = memMarkupEnter
          OnExit = memMarkupExit
          OnKeyPress = memMarkupKeyPress
        end
        object chkbxActive: TCheckBox
          Left = 9
          Top = 293
          Width = 185
          Height = 17
          Caption = 'Contact is active'
          TabOrder = 14
        end
        object grpbxContactInfo: TGroupBox
          ParentBackground = False
          Left = 9
          Top = 316
          Width = 353
          Height = 117
          Caption = 'Payment Details'
          TabOrder = 15
          object lblContName: TLabel
            Left = 12
            Top = 20
            Width = 84
            Height = 13
            Caption = 'Account Name'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 12
            Top = 44
            Width = 95
            Height = 13
            Caption = 'Account Number'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblAccExp: TLabel
            Left = 12
            Top = 68
            Width = 66
            Height = 13
            Caption = 'Expiry Date'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 164
            Top = 68
            Width = 5
            Height = 13
            Caption = '/'
          end
          object edtContName: TEdit
            Left = 112
            Top = 16
            Width = 197
            Height = 21
            TabOrder = 0
          end
          object edtAccNumber: TEdit
            Left = 112
            Top = 40
            Width = 197
            Height = 21
            TabOrder = 2
            OnChange = edtAccNumberChange
          end
          object cmbbxMonth: TComboBox
            Left = 112
            Top = 64
            Width = 49
            Height = 21
            ItemHeight = 13
            TabOrder = 3
            OnCloseUp = cmbbxMonthCloseUp
            Items.Strings = (
              '01'
              '02'
              '03'
              '04'
              '05'
              '06'
              '07'
              '08'
              '09'
              '10'
              '11'
              '12')
          end
          object cmbbxYear: TComboBox
            Left = 176
            Top = 64
            Width = 69
            Height = 21
            ItemHeight = 13
            TabOrder = 4
            OnCloseUp = cmbbxYearCloseUp
            Items.Strings = (
              '2005'
              '2006'
              '2007'
              '2008'
              '2009'
              '2010'
              '2011'
              '2012'
              '2013'
              '2014'
              '2015')
          end
          object btbtnClearAccInfo: TBitBtn
            Left = 316
            Top = 16
            Width = 25
            Height = 25
            TabOrder = 1
            OnClick = btbtnClearAccInfoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
              305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
              005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
              B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
              B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
              B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
              B0557777FF577777F7F500000E055550805577777F7555575755500000555555
              05555777775555557F5555000555555505555577755555557555}
            NumGlyphs = 2
          end
          object chkbxPaysOnline: TCheckBox
            Left = 12
            Top = 92
            Width = 185
            Height = 17
            Caption = 'Pays using credit card Online'
            TabOrder = 5
          end
        end
      end
    end
    object tsCategories: TTabSheet
      Caption = 'Categories'
      ImageIndex = 2
      object Label15: TLabel
        Left = 0
        Top = 8
        Width = 87
        Height = 13
        Caption = 'Current Categories'
      end
      object Label16: TLabel
        Left = 256
        Top = 8
        Width = 109
        Height = 13
        Caption = 'Unassigned Categories'
      end
      object lstbxUseCategory: TListBox
        Left = 0
        Top = 28
        Width = 145
        Height = 221
        ItemHeight = 13
        MultiSelect = True
        TabOrder = 0
        OnClick = lstbxUseCategoryClick
        OnDblClick = lstbxUseCategoryDblClick
      end
      object lstbxUseCategoryCode: TListBox
        Left = 80
        Top = 28
        Width = 41
        Height = 150
        ItemHeight = 13
        TabOrder = 1
        Visible = False
      end
      object lstbxNonCategory: TListBox
        Left = 256
        Top = 28
        Width = 145
        Height = 221
        ItemHeight = 13
        MultiSelect = True
        TabOrder = 2
        OnClick = lstbxNonCategoryClick
        OnDblClick = lstbxNonCategoryDblClick
      end
      object lstbxNonCategoryCode: TListBox
        Left = 336
        Top = 28
        Width = 41
        Height = 150
        ItemHeight = 13
        TabOrder = 3
        Visible = False
      end
      object btnAddCategory: TBitBtn
        Left = 159
        Top = 32
        Width = 81
        Height = 25
        Caption = '&Add'
        Enabled = False
        TabOrder = 4
        OnClick = btnAddCategoryClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333FF3333333333333003333333333333F77F33333333333009033
          333333333F7737F333333333009990333333333F773337FFFFFF330099999000
          00003F773333377777770099999999999990773FF33333FFFFF7330099999000
          000033773FF33777777733330099903333333333773FF7F33333333333009033
          33333333337737F3333333333333003333333333333377333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object btnRemoveCategory: TBitBtn
        Left = 159
        Top = 72
        Width = 81
        Height = 25
        Caption = '&Remove'
        Enabled = False
        TabOrder = 5
        OnClick = btnRemoveCategoryClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333FF3333333333333003333
          3333333333773FF3333333333309003333333333337F773FF333333333099900
          33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
          99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
          33333333337F3F77333333333309003333333333337F77333333333333003333
          3333333333773333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
    object tsCostCentres: TTabSheet
      Caption = 'Cost Centres'
      ImageIndex = 1
      object Label13: TLabel
        Left = 0
        Top = 8
        Width = 97
        Height = 13
        Caption = 'Current Cost Centres'
      end
      object Label14: TLabel
        Left = 256
        Top = 8
        Width = 119
        Height = 13
        Caption = 'Unassigned Cost Centres'
      end
      object lstbxMembers: TListBox
        Left = 0
        Top = 28
        Width = 145
        Height = 221
        ItemHeight = 13
        MultiSelect = True
        TabOrder = 0
        OnClick = lstbxMembersClick
        OnDblClick = lstbxMembersDblClick
      end
      object lstbxMembersCodes: TListBox
        Left = 80
        Top = 28
        Width = 41
        Height = 150
        ItemHeight = 13
        TabOrder = 1
        Visible = False
      end
      object btnAdd: TBitBtn
        Left = 159
        Top = 32
        Width = 81
        Height = 25
        Caption = '&Add'
        Enabled = False
        TabOrder = 2
        OnClick = btnAddClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333FF3333333333333003333333333333F77F33333333333009033
          333333333F7737F333333333009990333333333F773337FFFFFF330099999000
          00003F773333377777770099999999999990773FF33333FFFFF7330099999000
          000033773FF33777777733330099903333333333773FF7F33333333333009033
          33333333337737F3333333333333003333333333333377333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object btnRemove: TBitBtn
        Left = 159
        Top = 72
        Width = 81
        Height = 25
        Caption = '&Remove'
        Enabled = False
        TabOrder = 3
        OnClick = btnRemoveClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333FF3333333333333003333
          3333333333773FF3333333333309003333333333337F773FF333333333099900
          33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
          99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
          33333333337F3F77333333333309003333333333337F77333333333333003333
          3333333333773333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object lstbxNonMembers: TListBox
        Left = 256
        Top = 28
        Width = 145
        Height = 221
        ItemHeight = 13
        MultiSelect = True
        TabOrder = 4
        OnClick = lstbxNonMembersClick
        OnDblClick = lstbxNonMembersDblClick
      end
      object lstbxNonMembersCodes: TListBox
        Left = 336
        Top = 28
        Width = 41
        Height = 150
        ItemHeight = 13
        TabOrder = 5
        Visible = False
      end
    end
  end
  object CustNameEdit: TEdit
    Left = 110
    Top = 8
    Width = 252
    Height = 21
    Color = clBtnFace
    MaxLength = 40
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    Text = 'CustNameEdit'
  end
  object NameEdit: TEdit
    Left = 110
    Top = 56
    Width = 252
    Height = 21
    MaxLength = 40
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = 'NameEdit'
    OnChange = NameEditChange
  end
  object dblkpBranchName: TDBLookupComboBox
    Left = 110
    Top = 32
    Width = 251
    Height = 21
    KeyField = 'Branch_no'
    ListField = 'Name'
    ListSource = dtsBranch
    TabOrder = 1
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Contact_No'
      'From Customer_Contact'
      'Where Name = :GUID'
      ' ')
    Left = 312
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
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
    Left = 340
    Top = 488
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Contact_Type'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ExportFilter'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
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
      '        Inactive = :Inactive,'
      '        Contact_info = :Contact_info'
      'Where'
      '(Customer = :Customer) and'
      '(Branch_No = :Branch_No) and'
      '(Contact_No = :Contact_No)'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 312
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mobile_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Email'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Salutation'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contact_Level'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fax_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ExportFilter'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Receive_Mail'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contact_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Def_Markup_Perc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contact_info'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
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
    Left = 284
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end>
  end
  object GetBranchNameSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Name from Customer_Branch'
      'Where (Customer = :Customer) and'
      '      (Branch_No = :Branch_No)')
    Left = 248
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end>
  end
  object GetContTypesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Contact_Type, Description'
      'From Contact_Type'
      'Order By Description')
    Left = 196
    Top = 180
  end
  object ContTypesSRC: TDataSource
    DataSet = GetContTypesSQL
    Left = 224
    Top = 180
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
    Left = 280
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'GUID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end>
  end
  object GetContLevelsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Contact_Level, Description'
      'FROM Contact_Level'
      'ORDER BY Description'
      ' ')
    Left = 196
    Top = 204
  end
  object ContLevelsSRC: TDataSource
    DataSet = GetContLevelsSQL
    Left = 224
    Top = 204
  end
  object GetFileTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT ExportFilter, Description'
      'FROM ExportFilter'
      'ORDER BY Description')
    Left = 245
    Top = 300
  end
  object FileTypSRC: TDataSource
    DataSet = GetFileTypeSQL
    Left = 273
    Top = 300
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 312
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
    Left = 324
    Top = 332
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end>
  end
  object qryStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Contact_Status')
    Left = 197
    Top = 228
  end
  object srcStatus: TDataSource
    DataSet = qryStatus
    Left = 225
    Top = 228
  end
  object qryGetContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Customer_Contact.*,'
      '        Customer.Name as Customer_Name,'
      '        Customer_Branch.Name as Branch_Name'
      'From Customer_Contact, Customer, Customer_branch'
      'Where (Customer_Contact.Customer = :Customer) and'
      '      (Customer_Contact.Branch_No = :Branch_No) and'
      '      (Customer_Contact.Contact_no = :Contact_no) and'
      '      (Customer_Contact.Customer = Customer.Customer) and'
      
        '      ((Customer_Branch.Customer = Customer_Contact.Customer) an' +
        'd'
      '      (Customer_Branch.Branch_no = Customer_Contact.Branch_no))'
      ' ')
    Left = 221
    Top = 4
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end>
  end
  object qryBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Customer_Branch'
      'where customer = :customer'
      'order by name')
    Left = 273
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'customer'
        ParamType = ptUnknown
      end>
  end
  object dtsBranch: TDataSource
    DataSet = qryBranch
    Left = 297
    Top = 32
  end
  object qrySelContInfo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from contact_info '
      'where contact_info = :contact_info')
    Left = 220
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contact_info'
        ParamType = ptUnknown
      end>
  end
  object qryUpdContInfo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update contact_info '
      'set contact_name = :contact_name,'
      'account_month = :account_month,'
      'account_year = :account_year,'
      'account_number = :account_number,'
      'Pays_Online = :Pays_Online'
      'where contact_info = :contact_info')
    Left = 256
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contact_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'account_month'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'account_year'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'account_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Pays_Online'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contact_info'
        ParamType = ptUnknown
      end>
  end
  object qryInsContInfo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into contact_info'
      
        '(contact_info, contact_name, account_month, account_year, accoun' +
        't_number, Pays_Online)'
      'values'
      
        '(:contact_info, :contact_name, :account_month, :account_year, :a' +
        'ccount_number, :Pays_Online)'
      '')
    Left = 220
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contact_info'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'contact_name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'account_month'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'account_year'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'account_number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Pays_Online'
        ParamType = ptUnknown
      end>
  end
  object qryDelContInfo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from contact_info'
      'where contact_info = :contact_info')
    Left = 256
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'contact_info'
        ParamType = ptUnknown
      end>
  end
  object qryNextContInfo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select ISNULL(max(contact_info),0) +1 as '#39'contact_info'#39' '
      'from contact_info')
    Left = 184
    Top = 384
  end
  object qrySelOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Security_user'
      'from operator '
      'where operator = :operator;')
    Left = 184
    Top = 416
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'operator'
        ParamType = ptUnknown
      end>
  end
  object qryMembers: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT  Customer_Contact_CostCentre.*,'
      
        '        Customer_Branch_CostCentre.Description as Cost_Centre_De' +
        'scription'
      'FROM  Customer_Contact_CostCentre,'
      '      Customer_Branch_CostCentre'
      'WHERE Customer_Contact_CostCentre.Contact_no = :Contact_no AND'
      '      Customer_Contact_CostCentre.Customer = :Customer AND'
      '      Customer_Contact_CostCentre.Branch_no = :Branch_no AND'
      '('
      
        '(Customer_Contact_CostCentre.Customer = Customer_Branch_CostCent' +
        're.Customer) and'
      
        '(Customer_Contact_CostCentre.Branch_no = Customer_Branch_CostCen' +
        'tre.Branch_no) and'
      
        '(Customer_Contact_CostCentre.Cost_Centre = Customer_Branch_CostC' +
        'entre.Cost_Centre)'
      ')'
      'ORDER BY Customer_Branch_CostCentre.Description')
    Left = 128
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object qryDummy: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Customer_Branch_CostCentre.Cost_Centre, Customer_Branch_C' +
        'ostCentre.Description as Cost_Centre_Description'
      'from Customer_Branch_CostCentre'
      'WHERE (1=1)')
    Left = 128
    Top = 200
  end
  object qryCostCentre: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Customer_Branch_CostCentre.Cost_Centre, Customer_Branch_C' +
        'ostCentre.Description as Cost_Centre_Description'
      'from Customer_Branch_CostCentre')
    Left = 128
    Top = 248
  end
  object qryAdd: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Customer_Contact_CostCentre'
      '('
      'Customer,'
      'Branch_no,'
      'Contact_no,'
      'Cost_Centre'
      ')'
      'values'
      '('
      ':Customer,'
      ':Branch_no,'
      ':Contact_no,'
      ':Cost_Centre'
      ')'
      '')
    Left = 88
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cost_Centre'
        ParamType = ptUnknown
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Customer_Contact_CostCentre'
      'where '
      'Customer = :Customer AND'
      'Branch_no = :Branch_no AND'
      'Contact_no = :Contact_no')
    Left = 88
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end>
  end
  object qryCategory: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Customer_Branch_Category.Cost_Centre, Customer_Branch_Cat' +
        'egory.Description as Cost_Centre_Description'
      'from Customer_Branch_Category')
    Left = 128
    Top = 368
  end
  object qryCategoryDummy: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Category.Category, Category.Description'
      'from Category'
      'WHERE (1=1)')
    Left = 128
    Top = 416
  end
  object qryUseCategoryMembers: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'SELECT  Customer_Contact_Category.*, Category.Category, Category' +
        '.Description'
      'FROM  Customer_Contact_Category, Category'
      'WHERE'
      '(Customer_Contact_Category.Category = Category.Category) AND'
      '('
      '(Customer_Contact_Category.Contact_no = :Contact_no) AND'
      '(Customer_Contact_Category.Customer = :Customer) AND'
      '(Customer_Contact_Category.Branch_no = :Branch_no)'
      ')'
      'ORDER BY Category.Description')
    Left = 128
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object qryDeleteCategories: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Customer_Contact_Category'
      'where '
      'Customer = :Customer AND'
      'Branch_no = :Branch_no AND'
      'Contact_no = :Contact_no')
    Left = 128
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end>
  end
  object qryAddCategory: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Customer_Contact_Category'
      '('
      'Customer,'
      'Branch_no,'
      'Contact_no,'
      'Category'
      ')'
      'values'
      '('
      ':Customer,'
      ':Branch_no,'
      ':Contact_no,'
      ':Category'
      ')'
      '')
    Left = 128
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Category'
        ParamType = ptUnknown
      end>
  end
end
