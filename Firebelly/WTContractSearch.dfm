object frmWTContractSearch: TfrmWTContractSearch
  Left = 440
  Top = 109
  Caption = 'Contract Quote Search'
  ClientHeight = 310
  ClientWidth = 263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    263
    310)
  TextHeight = 17
  object Label1: TLabel
    Left = 10
    Top = 91
    Width = 66
    Height = 17
    Caption = 'Description'
  end
  object Label2: TLabel
    Left = 10
    Top = 35
    Width = 60
    Height = 17
    Caption = 'Developer'
  end
  object lblMaterial: TLabel
    Left = 10
    Top = 64
    Width = 74
    Height = 17
    Caption = 'Site Location'
  end
  object Label3: TLabel
    Left = 99
    Top = 8
    Width = 143
    Height = 17
    Caption = 'Type search criteria here'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 10
    Top = 118
    Width = 82
    Height = 17
    Caption = 'Office Contact'
  end
  object Label5: TLabel
    Left = 10
    Top = 146
    Width = 54
    Height = 17
    Caption = 'Operator'
  end
  object Label6: TLabel
    Left = 10
    Top = 174
    Width = 36
    Height = 17
    Caption = 'Quote'
  end
  object edtDescription: TEdit
    Left = 99
    Top = 87
    Width = 153
    Height = 25
    TabOrder = 2
  end
  object edtDeveloper: TEdit
    Left = 99
    Top = 30
    Width = 153
    Height = 25
    TabOrder = 0
  end
  object btnSearch: TButton
    Left = 17
    Top = 280
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Search'
    Default = True
    TabOrder = 7
    OnClick = btnSearchClick
    ExplicitLeft = -2
    ExplicitTop = 247
  end
  object edtSiteLocation: TEdit
    Left = 99
    Top = 59
    Width = 153
    Height = 25
    TabOrder = 1
  end
  object ClearButton: TButton
    Left = 173
    Top = 280
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Clear Search'
    TabOrder = 8
    OnClick = ClearButtonClick
    ExplicitLeft = 154
    ExplicitTop = 247
  end
  object chkbxShowLive: TCheckBox
    Left = 17
    Top = 222
    Width = 199
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Show ONLY live Quotes'
    TabOrder = 5
    ExplicitLeft = -2
    ExplicitTop = 189
  end
  object chkbxShowinactive: TCheckBox
    Left = 17
    Top = 246
    Width = 199
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Show inactive Quotes'
    TabOrder = 6
    ExplicitLeft = -2
    ExplicitTop = 213
  end
  object edtOfficeContact: TEdit
    Left = 99
    Top = 114
    Width = 153
    Height = 25
    TabOrder = 3
  end
  object edtOperatorName: TEdit
    Left = 99
    Top = 142
    Width = 153
    Height = 25
    TabOrder = 4
  end
  object edtQuoteReference: TEdit
    Left = 99
    Top = 170
    Width = 153
    Height = 25
    TabOrder = 9
  end
end
