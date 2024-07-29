object frmWTRSJobSheetPreRem: TfrmWTRSJobSheetPreRem
  Left = 215
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Print Job Sheet'
  ClientHeight = 278
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 220
    Width = 375
    Height = 58
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      375
      58)
    object btnPrint: TButton
      Left = 8
      Top = 25
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Print'
      Enabled = False
      TabOrder = 0
      OnClick = btnPrintClick
    end
    object btnPreview: TButton
      Left = 101
      Top = 25
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'P&review'
      Enabled = False
      TabOrder = 1
      OnClick = btnPreviewClick
    end
    object btnEmail: TButton
      Left = 194
      Top = 25
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Email'
      Enabled = False
      TabOrder = 2
      OnClick = btnEmailClick
    end
    object Button4: TButton
      Left = 288
      Top = 25
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Close'
      TabOrder = 3
      OnClick = Button4Click
    end
    object chkbxAccounts: TCheckBox
      Left = 8
      Top = 1
      Width = 97
      Height = 17
      Caption = 'Client copy'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 375
    Height = 49
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Job No.'
    end
    object memSelection: TMemo
      Left = 8
      Top = 24
      Width = 130
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnChange = EnableRun
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 375
    Height = 171
    Align = alClient
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 151
      Height = 13
      Caption = 'Print additional order documents'
    end
    object lstbxDocuments: TListBox
      Left = 8
      Top = 22
      Width = 233
      Height = 129
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
      OnDblClick = lstbxDocumentsDblClick
    end
    object chkbxIncludeVoucher: TCheckBox
      Left = 256
      Top = 22
      Width = 97
      Height = 17
      Caption = 'Include Voucher'
      TabOrder = 1
      Visible = False
    end
  end
end
