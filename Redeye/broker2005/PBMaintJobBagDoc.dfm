object PBMaintJobBagDocFrm: TPBMaintJobBagDocFrm
  Left = 206
  Top = 206
  BorderStyle = bsDialog
  Caption = 'Maintain Job Bag Document'
  ClientHeight = 120
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 16
    Width = 22
    Height = 13
    Caption = 'Title'
  end
  object Label2: TLabel
    Left = 12
    Top = 48
    Width = 44
    Height = 13
    Caption = 'Location'
  end
  object lblDelete: TLabel
    Left = 156
    Top = 89
    Width = 165
    Height = 15
    Caption = 'Delete the document details?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 332
    Top = 16
    Width = 67
    Height = 13
    Caption = 'Date Created'
  end
  object lblDateCreated: TLabel
    Left = 418
    Top = 16
    Width = 77
    Height = 13
    Caption = 'lblDateCreated'
  end
  object edtTitle: TEdit
    Left = 64
    Top = 12
    Width = 241
    Height = 21
    TabOrder = 0
  end
  object edtLocation: TEdit
    Left = 64
    Top = 44
    Width = 337
    Height = 21
    TabOrder = 1
  end
  object btnBrowse: TButton
    Left = 416
    Top = 42
    Width = 75
    Height = 25
    Caption = 'Browse'
    TabOrder = 2
    OnClick = btnBrowseClick
  end
  object btnOK: TBitBtn
    Left = 336
    Top = 84
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnOKClick
  end
  object btnCancel: TBitBtn
    Left = 416
    Top = 84
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
  end
  object DocOpenDialog: TOpenDialog
    Left = 280
    Top = 8
  end
end
