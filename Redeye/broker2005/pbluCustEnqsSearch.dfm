object frmpbluCustEnqsSearch: TfrmpbluCustEnqsSearch
  Left = 198
  Top = 135
  BorderStyle = bsDialog
  Caption = 'Enquiry search'
  ClientHeight = 220
  ClientWidth = 282
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 11
    Top = 2
    Width = 51
    Height = 13
    Caption = 'Item Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 120
    Top = 2
    Width = 148
    Height = 13
    Caption = 'Type here to narrow the search'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 11
    Top = 50
    Width = 20
    Height = 13
    Caption = 'Rep'
  end
  object Label1: TLabel
    Left = 11
    Top = 75
    Width = 65
    Height = 13
    Caption = 'Product Code'
  end
  object Label3: TLabel
    Left = 11
    Top = 99
    Width = 76
    Height = 13
    Caption = 'Form Reference'
  end
  object Label2: TLabel
    Left = 11
    Top = 26
    Width = 34
    Height = 13
    Caption = 'Branch'
  end
  object edtRep: TEdit
    Left = 120
    Top = 46
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object edtProductCode: TEdit
    Left = 120
    Top = 70
    Width = 153
    Height = 21
    TabOrder = 2
  end
  object edtFormReference: TEdit
    Left = 120
    Top = 94
    Width = 153
    Height = 21
    TabOrder = 3
  end
  object ShowCancelledChkBox: TCheckBox
    Tag = 12
    Left = 12
    Top = 128
    Width = 185
    Height = 17
    Caption = 'Show cancelled enquiries'
    TabOrder = 4
  end
  object SearchButton: TButton
    Left = 12
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Start Search'
    Default = True
    TabOrder = 5
    OnClick = SearchButtonClick
  end
  object edtBranch: TEdit
    Left = 120
    Top = 22
    Width = 153
    Height = 21
    TabOrder = 0
  end
end
