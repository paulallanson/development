object PBMaintCContaFrm: TPBMaintCContaFrm
  Left = 226
  Top = 2
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Maintain Customer/Branch Contact'
  ClientHeight = 619
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    458
    619)
  TextHeight = 17
  object DelLabel: TLabel
    Left = 60
    Top = 594
    Width = 160
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Delete the above details ?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 585
  end
  object Label1: TLabel
    Left = 9
    Top = 12
    Width = 59
    Height = 17
    Caption = 'Customer'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Top = 36
    Width = 46
    Height = 17
    Caption = 'Branch '
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 9
    Top = 60
    Width = 36
    Height = 17
    Caption = 'Name'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OKBitBtn: TBitBtn
    Left = 229
    Top = 588
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
    NumGlyphs = 2
    TabOrder = 4
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 309
    Top = 588
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
    TabOrder = 5
    OnClick = CancelBitBtnClick
  end
  object pgDetails: TPageControl
    Left = 8
    Top = 84
    Width = 433
    Height = 489
    ActivePage = tsDetails
    TabOrder = 3
    object tsDetails: TTabSheet
      Caption = 'Details'
      object DetsGrpBox: TGroupBox
        Left = 5
        Top = -4
        Width = 404
        Height = 453
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object Label5: TLabel
          Left = 9
          Top = 20
          Width = 63
          Height = 17
          Caption = 'Salutation'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 9
          Top = 116
          Width = 80
          Height = 17
          Caption = 'Contact Type'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 9
          Top = 44
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
        object Label7: TLabel
          Left = 9
          Top = 216
          Width = 92
          Height = 17
          Caption = 'E-Mail Address'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object MobileLabel: TLabel
          Left = 9
          Top = 92
          Width = 66
          Height = 17
          Caption = 'Mobile No.'
        end
        object lblcontactLevel: TLabel
          Left = 9
          Top = 140
          Width = 77
          Height = 17
          Caption = 'Contact Level'
        end
        object lblFaxNo: TLabel
          Left = 9
          Top = 68
          Width = 19
          Height = 17
          Caption = 'Fax'
        end
        object Label9: TLabel
          Left = 6
          Top = 239
          Width = 73
          Height = 34
          Alignment = taCenter
          Caption = 'Accept Files of type '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label10: TLabel
          Left = 9
          Top = 164
          Width = 35
          Height = 17
          Caption = 'Status'
        end
        object Label11: TLabel
          Left = 9
          Top = 189
          Width = 102
          Height = 17
          Caption = 'Default Margin %'
        end
        object SalutationEdit: TEdit
          Left = 117
          Top = 16
          Width = 268
          Height = 25
          TabOrder = 0
          Text = 'SalutationEdit'
        end
        object TypeDBLCB: TDBLookupComboBox
          Left = 117
          Top = 112
          Width = 161
          Height = 25
          KeyField = 'Contact_Type'
          ListField = 'Description'
          ListSource = ContTypesSRC
          TabOrder = 4
          OnClick = TypeDBLCBClick
        end
        object PhoneEdit: TEdit
          Left = 117
          Top = 40
          Width = 161
          Height = 25
          MaxLength = 20
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnChange = NameEditChange
        end
        object EMailEdit: TEdit
          Left = 117
          Top = 212
          Width = 268
          Height = 25
          MaxLength = 120
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          OnChange = NameEditChange
        end
        object MobileEdt: TEdit
          Left = 117
          Top = 88
          Width = 161
          Height = 25
          TabOrder = 3
        end
        object ContTypeMaintBitBtn: TBitBtn
          Left = 280
          Top = 113
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
          Left = 117
          Top = 136
          Width = 161
          Height = 25
          KeyField = 'Contact_Level'
          ListField = 'Description'
          ListSource = ContLevelsSRC
          TabOrder = 6
        end
        object RecvCorresCB: TCheckBox
          Left = 9
          Top = 279
          Width = 185
          Height = 17
          Caption = 'Receive Correspondence'
          TabOrder = 12
        end
        object FaxEdit: TEdit
          Left = 117
          Top = 64
          Width = 161
          Height = 25
          TabOrder = 2
        end
        object ContLevelMaintBitBtn: TBitBtn
          Left = 280
          Top = 137
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
          Left = 117
          Top = 242
          Width = 209
          Height = 25
          KeyField = 'ExportFilter'
          ListField = 'Description'
          ListSource = FileTypSRC
          TabOrder = 11
          OnClick = FileTypDBLCBClick
        end
        object NotesBitBtn: TBitBtn
          Left = 244
          Top = 280
          Width = 73
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
          TabOrder = 13
          OnClick = NotesBitBtnClick
        end
        object StatusDBLCB: TDBLookupComboBox
          Left = 117
          Top = 160
          Width = 161
          Height = 25
          KeyField = 'Contact_Status'
          ListField = 'Contact_Status_Descr'
          ListSource = srcStatus
          TabOrder = 8
        end
        object memMarkup: TMemo
          Left = 117
          Top = 184
          Width = 83
          Height = 23
          Alignment = taRightJustify
          Lines.Strings = (
            'memMarku'
            'p')
          TabOrder = 9
          WantReturns = False
          WordWrap = False
          OnEnter = memMarkupEnter
          OnExit = memMarkupExit
          OnKeyPress = memMarkupKeyPress
        end
        object chkbxActive: TCheckBox
          Left = 9
          Top = 300
          Width = 185
          Height = 17
          Caption = 'Contact is active'
          TabOrder = 14
        end
        object grpbxContactInfo: TGroupBox
          Left = 9
          Top = 323
          Width = 376
          Height = 117
          Caption = 'Payment Details'
          ParentBackground = False
          TabOrder = 15
          object lblContName: TLabel
            Left = 12
            Top = 20
            Width = 90
            Height = 17
            Caption = 'Account Name'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 12
            Top = 44
            Width = 104
            Height = 17
            Caption = 'Account Number'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblAccExp: TLabel
            Left = 12
            Top = 68
            Width = 72
            Height = 17
            Caption = 'Expiry Date'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 175
            Top = 68
            Width = 5
            Height = 17
            Caption = '/'
          end
          object edtContName: TEdit
            Left = 123
            Top = 16
            Width = 197
            Height = 25
            TabOrder = 0
          end
          object edtAccNumber: TEdit
            Left = 123
            Top = 40
            Width = 197
            Height = 25
            TabOrder = 2
            OnChange = edtAccNumberChange
          end
          object cmbbxMonth: TComboBox
            Left = 123
            Top = 64
            Width = 49
            Height = 25
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
            Left = 187
            Top = 64
            Width = 69
            Height = 25
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
            Left = 327
            Top = 16
            Width = 25
            Height = 25
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
            TabOrder = 1
            OnClick = btbtnClearAccInfoClick
          end
          object chkbxPaysOnline: TCheckBox
            Left = 12
            Top = 97
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
        Width = 110
        Height = 17
        Caption = 'Current Categories'
      end
      object Label16: TLabel
        Left = 256
        Top = 8
        Width = 135
        Height = 17
        Caption = 'Unassigned Categories'
      end
      object lstbxUseCategory: TListBox
        Left = 0
        Top = 28
        Width = 145
        Height = 221
        ItemHeight = 17
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
        ItemHeight = 17
        TabOrder = 1
        Visible = False
      end
      object lstbxNonCategory: TListBox
        Left = 256
        Top = 28
        Width = 145
        Height = 221
        ItemHeight = 17
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
        ItemHeight = 17
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
        TabOrder = 4
        OnClick = btnAddCategoryClick
      end
      object btnRemoveCategory: TBitBtn
        Left = 159
        Top = 72
        Width = 81
        Height = 25
        Caption = '&Remove'
        Enabled = False
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
        TabOrder = 5
        OnClick = btnRemoveCategoryClick
      end
    end
    object tsCostCentres: TTabSheet
      Caption = 'Cost Centres'
      ImageIndex = 1
      object Label13: TLabel
        Left = 0
        Top = 8
        Width = 121
        Height = 17
        Caption = 'Current Cost Centres'
      end
      object Label14: TLabel
        Left = 256
        Top = 8
        Width = 146
        Height = 17
        Caption = 'Unassigned Cost Centres'
      end
      object lstbxMembers: TListBox
        Left = 0
        Top = 28
        Width = 145
        Height = 221
        ItemHeight = 17
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
        ItemHeight = 17
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
        TabOrder = 2
        OnClick = btnAddClick
      end
      object btnRemove: TBitBtn
        Left = 159
        Top = 72
        Width = 81
        Height = 25
        Caption = '&Remove'
        Enabled = False
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
        TabOrder = 3
        OnClick = btnRemoveClick
      end
      object lstbxNonMembers: TListBox
        Left = 256
        Top = 28
        Width = 145
        Height = 221
        ItemHeight = 17
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
        ItemHeight = 17
        TabOrder = 5
        Visible = False
      end
    end
  end
  object CustNameEdit: TEdit
    Left = 110
    Top = 8
    Width = 252
    Height = 25
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
    Height = 25
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
    Height = 25
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
    Left = 278
    Top = 60
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
    Left = 161
    Top = 250
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
    Left = 126
    Top = 250
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
        Name = 'Inactive'
      end
      item
        Name = 'Contact_info'
        DataType = ftInteger
        ParamType = ptInput
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
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Customer_Contact'
      'Where'
      '(Customer = :Customer) and'
      '(Branch_No = :Branch_No) and'
      '(Contact_No = :Contact_No)')
    Left = 91
    Top = 250
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
    Left = 248
    Top = 32
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
    Left = 269
    Top = 97
  end
  object ContTypesSRC: TDataSource
    DataSet = GetContTypesSQL
    Left = 304
    Top = 97
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
    Left = 238
    Top = 60
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
      'ORDER BY Description'
      ' ')
    Left = 269
    Top = 127
  end
  object ContLevelsSRC: TDataSource
    DataSet = GetContLevelsSQL
    Left = 304
    Top = 127
  end
  object GetFileTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT ExportFilter, Description'
      'FROM ExportFilter'
      'ORDER BY Description')
    Left = 330
    Top = 247
  end
  object FileTypSRC: TDataSource
    DataSet = GetFileTypeSQL
    Left = 365
    Top = 247
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
    Left = 341
    Top = 311
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
  object qryStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Contact_Status')
    Left = 270
    Top = 157
  end
  object srcStatus: TDataSource
    DataSet = qryStatus
    Left = 305
    Top = 157
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
        Name = 'Customer'
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
      'select * from Customer_Branch'
      'where customer = :customer'
      'order by name')
    Left = 273
    Top = 32
    ParamData = <
      item
        Name = 'customer'
        DataType = ftInteger
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
    Left = 299
    Top = 352
    ParamData = <
      item
        Name = 'contact_info'
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
    Left = 344
    Top = 352
    ParamData = <
      item
        Name = 'contact_name'
      end
      item
        Name = 'account_month'
      end
      item
        Name = 'account_year'
      end
      item
        Name = 'account_number'
      end
      item
        Name = 'Pays_Online'
      end
      item
        Name = 'contact_info'
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
    Left = 299
    Top = 392
    ParamData = <
      item
        Name = 'contact_info'
      end
      item
        Name = 'contact_name'
      end
      item
        Name = 'account_month'
      end
      item
        Name = 'account_year'
      end
      item
        Name = 'account_number'
      end
      item
        Name = 'Pays_Online'
      end>
  end
  object qryDelContInfo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from contact_info'
      'where contact_info = :contact_info')
    Left = 344
    Top = 392
    ParamData = <
      item
        Name = 'contact_info'
      end>
  end
  object qryNextContInfo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select ISNULL(max(contact_info),0) +1 as '#39'contact_info'#39' '
      'from contact_info')
    Left = 254
    Top = 352
  end
  object qrySelOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Security_user'
      'from operator '
      'where operator = :operator;')
    Left = 254
    Top = 392
    ParamData = <
      item
        Name = 'operator'
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
    Left = 184
    Top = 62
    ParamData = <
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryDummy: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Customer_Branch_CostCentre.Cost_Centre, Customer_Branch_C' +
        'ostCentre.Description as Cost_Centre_Description'
      'from Customer_Branch_CostCentre'
      'WHERE (1=1)')
    Left = 184
    Top = 122
  end
  object qryCostCentre: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Customer_Branch_CostCentre.Cost_Centre, Customer_Branch_C' +
        'ostCentre.Description as Cost_Centre_Description'
      'from Customer_Branch_CostCentre')
    Left = 184
    Top = 182
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
    Left = 134
    Top = 62
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Cost_Centre'
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
    Left = 134
    Top = 122
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object qryCategory: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Customer_Branch_Category.Cost_Centre, Customer_Branch_Cat' +
        'egory.Description as Cost_Centre_Description'
      'from Customer_Branch_Category')
    Left = 184
    Top = 332
  end
  object qryCategoryDummy: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Category.Category, Category.Description'
      'from Category'
      'WHERE (1=1)')
    Left = 184
    Top = 392
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
    Left = 184
    Top = 272
    ParamData = <
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
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
    Left = 136
    Top = 340
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
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
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Category'
      end>
  end
end
