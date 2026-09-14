object PBMaintDocumentFrm: TPBMaintDocumentFrm
  Left = 206
  Top = 206
  BorderStyle = bsDialog
  Caption = 'Maintain Job Bag Document'
  ClientHeight = 117
  ClientWidth = 525
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 525
    Height = 76
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 487
    ExplicitHeight = 67
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
    Width = 525
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 67
    ExplicitWidth = 487
    object lblDelete: TLabel
      Left = 139
      Top = 13
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
    object btnOK: TBitBtn
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TBitBtn
      Left = 412
      Top = 8
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object DocOpenDialog: TOpenDialog
    Left = 190
    Top = 10
  end
end
