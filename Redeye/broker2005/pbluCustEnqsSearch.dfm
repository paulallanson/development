object frmpbluCustEnqsSearch: TfrmpbluCustEnqsSearch
  Left = 198
  Top = 135
  BorderStyle = bsDialog
  Caption = 'Enquiry search'
  ClientHeight = 220
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 17
  object Label9: TLabel
    Left = 11
    Top = 7
    Width = 64
    Height = 17
    Caption = 'Item Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 120
    Top = 7
    Width = 182
    Height = 17
    Caption = 'Type here to narrow the search'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 11
    Top = 61
    Width = 23
    Height = 17
    Caption = 'Rep'
  end
  object Label1: TLabel
    Left = 11
    Top = 89
    Width = 80
    Height = 17
    Caption = 'Product Code'
  end
  object Label3: TLabel
    Left = 11
    Top = 117
    Width = 92
    Height = 17
    Caption = 'Form Reference'
  end
  object Label2: TLabel
    Left = 11
    Top = 34
    Width = 39
    Height = 17
    Caption = 'Branch'
  end
  object edtRep: TEdit
    Left = 120
    Top = 57
    Width = 153
    Height = 25
    TabOrder = 1
  end
  object edtProductCode: TEdit
    Left = 120
    Top = 84
    Width = 153
    Height = 25
    TabOrder = 2
  end
  object edtFormReference: TEdit
    Left = 120
    Top = 112
    Width = 153
    Height = 25
    TabOrder = 3
  end
  object ShowCancelledChkBox: TCheckBox
    Tag = 12
    Left = 11
    Top = 153
    Width = 185
    Height = 17
    Caption = 'Show cancelled enquiries'
    TabOrder = 4
  end
  object SearchButton: TButton
    Left = 11
    Top = 182
    Width = 75
    Height = 25
    Caption = 'Search'
    Default = True
    TabOrder = 5
    OnClick = SearchButtonClick
  end
  object edtBranch: TEdit
    Left = 120
    Top = 30
    Width = 153
    Height = 25
    TabOrder = 0
  end
end
