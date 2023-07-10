object STMaintStStkNumbersfrm: TSTMaintStStkNumbersfrm
  Left = 192
  Top = 130
  BorderStyle = bsDialog
  Caption = 'Enter number range'
  ClientHeight = 165
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblDelete: TLabel
    Left = 32
    Top = 136
    Width = 120
    Height = 16
    Caption = 'Delete this record?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 128
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    TabOrder = 1
    OnClick = btnOKClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnCancel: TBitBtn
    Left = 272
    Top = 128
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object pnlDetails: TPanel
    Left = 5
    Top = 0
    Width = 361
    Height = 121
    BevelOuter = bvNone
    Caption = 'pnlDetails'
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 59
      Height = 13
      Caption = 'First Number'
    end
    object Label2: TLabel
      Left = 32
      Top = 56
      Width = 60
      Height = 13
      Caption = 'Last Number'
    end
    object Label3: TLabel
      Left = 32
      Top = 88
      Width = 95
      Height = 13
      Caption = 'Total count in range'
    end
    object lblCount: TLabel
      Left = 152
      Top = 88
      Width = 38
      Height = 13
      Caption = 'lblCount'
    end
    object edtFirst: TEdit
      Left = 128
      Top = 16
      Width = 217
      Height = 21
      TabOrder = 0
      OnChange = edtFirstChange
      OnExit = edtFirstExit
    end
    object edtLast: TEdit
      Left = 128
      Top = 48
      Width = 217
      Height = 21
      TabOrder = 1
      OnChange = edtLastChange
    end
  end
end
