object frmWTRSJobSheetPreRem: TfrmWTRSJobSheetPreRem
  Left = 215
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Print Job Sheet'
  ClientHeight = 313
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 240
    Width = 438
    Height = 73
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 224
    DesignSize = (
      438
      73)
    object btnPrint: TButton
      Left = 8
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Print'
      Enabled = False
      TabOrder = 0
      OnClick = btnPrintClick
      ExplicitTop = 25
    end
    object btnPreview: TButton
      Left = 101
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'P&review'
      Enabled = False
      TabOrder = 1
      OnClick = btnPreviewClick
      ExplicitTop = 25
    end
    object btnEmail: TButton
      Left = 194
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Email'
      Enabled = False
      TabOrder = 2
      OnClick = btnEmailClick
      ExplicitTop = 25
    end
    object Button4: TButton
      Left = 312
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Close'
      TabOrder = 3
      OnClick = Button4Click
      ExplicitTop = 25
    end
    object chkbxAccounts: TCheckBox
      Left = 8
      Top = 11
      Width = 97
      Height = 17
      Caption = 'Client copy'
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 438
    Height = 65
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 47
      Height = 16
      Caption = 'Job No.'
    end
    object memSelection: TMemo
      Left = 8
      Top = 29
      Width = 130
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnChange = EnableRun
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 65
    Width = 438
    Height = 175
    Align = alClient
    TabOrder = 2
    ExplicitTop = 49
    ExplicitWidth = 375
    ExplicitHeight = 171
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 192
      Height = 16
      Caption = 'Print additional order documents'
    end
    object lstbxDocuments: TListBox
      Left = 8
      Top = 31
      Width = 233
      Height = 129
      MultiSelect = True
      TabOrder = 0
      OnDblClick = lstbxDocumentsDblClick
    end
    object chkbxIncludeVoucher: TCheckBox
      Left = 256
      Top = 31
      Width = 169
      Height = 17
      Caption = 'Include Voucher'
      TabOrder = 1
      Visible = False
    end
  end
end
