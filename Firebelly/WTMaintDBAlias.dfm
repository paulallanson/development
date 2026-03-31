object WTMaintDBAliasFrm: TWTMaintDBAliasFrm
  Left = 152
  Top = 121
  BorderStyle = bsDialog
  Caption = 'Maintain Database Aliases'
  ClientHeight = 199
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object DelLabel: TLabel
    Left = 117
    Top = 167
    Width = 128
    Height = 17
    Caption = 'Delete these details?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DetsGrpBox: TGroupBox
    Left = 16
    Top = 8
    Width = 393
    Height = 137
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 66
      Height = 17
      Caption = 'Alias Name'
    end
    object Label2: TLabel
      Left = 16
      Top = 60
      Width = 55
      Height = 17
      Caption = 'Database'
    end
    object Label3: TLabel
      Left = 16
      Top = 92
      Width = 76
      Height = 17
      Caption = 'Server Name'
    end
    object edtAliasName: TEdit
      Left = 110
      Top = 16
      Width = 252
      Height = 25
      MaxLength = 40
      TabOrder = 0
      Text = 'edtAliasName'
      OnChange = CheckOK
    end
    object edtDatabaseName: TEdit
      Left = 110
      Top = 56
      Width = 139
      Height = 25
      MaxLength = 40
      TabOrder = 1
      Text = 'edtDatabaseName'
      OnChange = CheckOK
    end
    object edtServerName: TEdit
      Left = 110
      Top = 88
      Width = 139
      Height = 25
      MaxLength = 40
      TabOrder = 2
      Text = 'edtServerName'
      OnChange = CheckOK
    end
  end
  object OKbitBtn: TButton
    Left = 248
    Top = 163
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
    OnClick = OKBitBtnClick
  end
  object Cancelbitbtn: TButton
    Left = 333
    Top = 163
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = CancelBitBtnClick
  end
end
