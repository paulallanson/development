object PBMaintEnquiryDocFrm: TPBMaintEnquiryDocFrm
  Left = 206
  Top = 206
  BorderStyle = bsDialog
  Caption = 'Maintain Enquiry Document'
  ClientHeight = 120
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
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
    Left = 145
    Top = 88
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
  object btbtnOK: TBitBtn
    Left = 336
    Top = 84
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
  end
  object btbtnCancel: TBitBtn
    Left = 416
    Top = 84
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
  end
  object DocOpenDialog: TOpenDialog
    Left = 256
    Top = 10
  end
end
