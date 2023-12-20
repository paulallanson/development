object frmWTContractSearch: TfrmWTContractSearch
  Left = 440
  Top = 109
  Caption = 'Contract Quote Search'
  ClientHeight = 286
  ClientWidth = 250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    250
    286)
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 84
    Width = 59
    Height = 13
    Caption = 'Description'
  end
  object Label2: TLabel
    Left = 10
    Top = 35
    Width = 52
    Height = 13
    Caption = 'Developer'
  end
  object lblMaterial: TLabel
    Left = 10
    Top = 60
    Width = 66
    Height = 13
    Caption = 'Site Location'
  end
  object Label3: TLabel
    Left = 88
    Top = 8
    Width = 123
    Height = 13
    Caption = 'Type search criteria here'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 10
    Top = 108
    Width = 74
    Height = 13
    Caption = 'Office Contact'
  end
  object Label5: TLabel
    Left = 10
    Top = 132
    Width = 47
    Height = 13
    Caption = 'Operator'
  end
  object Label6: TLabel
    Left = 10
    Top = 156
    Width = 32
    Height = 13
    Caption = 'Quote'
  end
  object edtDescription: TEdit
    Left = 88
    Top = 80
    Width = 153
    Height = 21
    TabOrder = 2
  end
  object edtDeveloper: TEdit
    Left = 88
    Top = 30
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object btnSearch: TButton
    Left = 10
    Top = 256
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Search'
    Default = True
    TabOrder = 7
    OnClick = btnSearchClick
  end
  object edtSiteLocation: TEdit
    Left = 88
    Top = 55
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object ClearButton: TButton
    Left = 166
    Top = 256
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Clear Search'
    TabOrder = 8
    OnClick = ClearButtonClick
  end
  object chkbxShowLive: TCheckBox
    Left = 10
    Top = 198
    Width = 199
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Show ONLY live Quotes'
    TabOrder = 5
  end
  object chkbxShowinactive: TCheckBox
    Left = 10
    Top = 222
    Width = 199
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Show inactive Quotes'
    TabOrder = 6
  end
  object edtOfficeContact: TEdit
    Left = 88
    Top = 104
    Width = 153
    Height = 21
    TabOrder = 3
  end
  object edtOperatorName: TEdit
    Left = 88
    Top = 128
    Width = 153
    Height = 21
    TabOrder = 4
  end
  object edtQuoteReference: TEdit
    Left = 88
    Top = 152
    Width = 153
    Height = 21
    TabOrder = 9
  end
end
