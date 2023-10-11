object PBRSOSSInvJobBagsFrm: TPBRSOSSInvJobBagsFrm
  Left = 293
  Top = 193
  Caption = 'Oustanding Job Bag Invoicing Report'
  ClientHeight = 216
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 156
    Width = 33
    Height = 13
    Caption = 'Sort by'
  end
  object PrintBitBtn: TBitBtn
    Left = 536
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Print'
    TabOrder = 0
    OnClick = PrintBitBtnClick
  end
  object PreviewBitBtn: TBitBtn
    Left = 448
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Preview'
    TabOrder = 1
    OnClick = PreviewBitBtnClick
  end
  object pnlRepSearch: TPanel
    Left = 147
    Top = 16
    Width = 302
    Height = 57
    TabOrder = 2
    Visible = False
    object lblCustBran: TLabel
      Left = 8
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Rep Name'
    end
    object edtRep: TEdit
      Left = 8
      Top = 24
      Width = 257
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnRep: TButton
      Left = 272
      Top = 24
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnRepClick
    end
  end
  object CancelBitBtn: TBitBtn
    Left = 8
    Top = 184
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object rdgrpRep: TRadioGroup
    Left = 8
    Top = 8
    Width = 129
    Height = 65
    Caption = 'Rep'
    ItemIndex = 0
    Items.Strings = (
      'All Reps'
      'One Rep')
    TabOrder = 4
    OnClick = rdgrpRepClick
  end
  object pnlCustSearch: TPanel
    Left = 147
    Top = 81
    Width = 302
    Height = 58
    TabOrder = 5
    Visible = False
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 89
      Height = 13
      Caption = 'Customer / Branch'
    end
    object edtCust: TEdit
      Left = 8
      Top = 24
      Width = 257
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnCustLU: TButton
      Left = 272
      Top = 24
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCustLUClick
    end
  end
  object rdgrpCust: TRadioGroup
    Left = 8
    Top = 74
    Width = 129
    Height = 65
    Caption = 'Customer'
    ItemIndex = 0
    Items.Strings = (
      'All Customers'
      'One Customer')
    TabOrder = 6
    OnClick = rdgrpCustClick
  end
  object cmboSort: TComboBox
    Left = 56
    Top = 152
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 7
    OnChange = cmboSortChange
    Items.Strings = (
      'Job Bag'
      'Rep'
      'Customer')
  end
  object chkbxPagebreak: TCheckBox
    Left = 224
    Top = 154
    Width = 169
    Height = 17
    Caption = 'page break on sort type'
    Enabled = False
    TabOrder = 8
  end
  object chkbxIncludePOs: TCheckBox
    Left = 464
    Top = 16
    Width = 145
    Height = 17
    Caption = 'Include Purchase Orders'
    Checked = True
    State = cbChecked
    TabOrder = 9
  end
  object chkbxIncludeNotReady: TCheckBox
    Left = 464
    Top = 48
    Width = 153
    Height = 17
    Caption = 'Show Job bags not ready'
    TabOrder = 10
  end
end
