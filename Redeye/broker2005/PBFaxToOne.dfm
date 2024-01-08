object PBFaxToOneFrm: TPBFaxToOneFrm
  Left = 174
  Top = 185
  Caption = 'Fax Send Confirmation'
  ClientHeight = 113
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 13
  object FaxDescrLabel: TLabel
    Left = 64
    Top = 10
    Width = 35
    Height = 13
    Caption = 'Fax To:'
  end
  object Label1: TLabel
    Left = 8
    Top = 10
    Width = 37
    Height = 13
    Caption = 'Faxing:'
  end
  object Label2: TLabel
    Left = 8
    Top = 36
    Width = 44
    Height = 13
    Caption = 'Number:'
  end
  object FaxNoEdit: TEdit
    Left = 64
    Top = 32
    Width = 337
    Height = 21
    TabOrder = 0
    OnChange = FaxNoEditChange
  end
  object CancelBitBtn: TBitBtn
    Left = 328
    Top = 64
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object OKBitBtn: TBitBtn
    Left = 248
    Top = 64
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = OKBitBtnClick
  end
end
