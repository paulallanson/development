object PBMaintDocumentFrm: TPBMaintDocumentFrm
  Left = 206
  Top = 206
  BorderStyle = bsDialog
  Caption = 'Maintain Job Bag Document'
  ClientHeight = 117
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 493
    Height = 76
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 20
      Height = 13
      Caption = 'Title'
    end
    object Label2: TLabel
      Left = 12
      Top = 48
      Width = 41
      Height = 13
      Caption = 'Location'
    end
    object Label3: TLabel
      Left = 332
      Top = 16
      Width = 63
      Height = 13
      Caption = 'Date Created'
    end
    object lblDateCreated: TLabel
      Left = 418
      Top = 16
      Width = 70
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
      Left = 414
      Top = 42
      Width = 75
      Height = 25
      Caption = 'Browse'
      TabOrder = 2
      OnClick = btnBrowseClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 76
    Width = 493
    Height = 41
    Align = alBottom
    TabOrder = 1
    object lblDelete: TLabel
      Left = 148
      Top = 13
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
    object btnOK: TBitBtn
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = btnOKClick
      Kind = bkOK
    end
    object btnCancel: TBitBtn
      Left = 406
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object DocOpenDialog: TOpenDialog
    Left = 280
    Top = 8
  end
end
