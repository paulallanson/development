object PBMaintJobBagDocFrm: TPBMaintJobBagDocFrm
  Left = 206
  Top = 206
  BorderStyle = bsDialog
  Caption = 'Maintain Job Bag Document'
  ClientHeight = 135
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object Label1: TLabel
    Left = 12
    Top = 16
    Width = 24
    Height = 17
    Caption = 'Title'
  end
  object Label2: TLabel
    Left = 12
    Top = 48
    Width = 49
    Height = 17
    Caption = 'Location'
  end
  object lblDelete: TLabel
    Left = 156
    Top = 89
    Width = 186
    Height = 16
    Caption = 'Delete the document details?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 332
    Top = 16
    Width = 77
    Height = 17
    Caption = 'Date Created'
  end
  object lblDateCreated: TLabel
    Left = 418
    Top = 16
    Width = 87
    Height = 17
    Caption = 'lblDateCreated'
  end
  object edtTitle: TEdit
    Left = 69
    Top = 12
    Width = 241
    Height = 25
    TabOrder = 0
  end
  object edtLocation: TEdit
    Left = 69
    Top = 44
    Width = 337
    Height = 25
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
    Left = 158
    Top = 74
  end
end
