object PBAccExport3Frm: TPBAccExport3Frm
  Left = 145
  Top = 140
  Caption = 'Export & Import Wizard'
  ClientHeight = 289
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object AliasLbl: TLabel
    Left = 8
    Top = 72
    Width = 99
    Height = 13
    Caption = 'Alias of Datasource'
  end
  object ExportLbl: TLabel
    Left = 8
    Top = 128
    Width = 120
    Height = 13
    Caption = 'Export/Import Directory'
  end
  object Label2: TLabel
    Left = 8
    Top = 16
    Width = 97
    Height = 13
    Caption = 'Accounting System'
  end
  object fileNameLbl: TLabel
    Left = 8
    Top = 72
    Width = 50
    Height = 13
    Caption = 'File Name'
  end
  object lblStatus: TLabel
    Left = 8
    Top = 192
    Width = 55
    Height = 13
    Caption = 'Processing'
    Visible = False
  end
  object cbsource: TComboBox
    Left = 8
    Top = 88
    Width = 177
    Height = 21
    Style = csDropDownList
    TabOrder = 7
    OnChange = cbsourceChange
  end
  object ExportPathEdit: TEdit
    Left = 8
    Top = 144
    Width = 249
    Height = 21
    ReadOnly = True
    TabOrder = 0
    Text = 'ExportPathEdit'
    OnKeyUp = ExportPathEditKeyUp
  end
  object BitBtn1: TBitBtn
    Left = 96
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Back'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object FinishBtn: TBitBtn
    Left = 176
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Finish'
    TabOrder = 2
    OnClick = FinishBtnClick
  end
  object BitBtn3: TBitBtn
    Left = 256
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object AccSystemEdit: TEdit
    Left = 8
    Top = 32
    Width = 329
    Height = 21
    ReadOnly = True
    TabOrder = 4
    Text = 'AccSystemEdit'
  end
  object FileNameEdit: TEdit
    Left = 8
    Top = 88
    Width = 137
    Height = 21
    ReadOnly = True
    TabOrder = 5
    Text = 'FileNameEdit'
    OnKeyUp = FileNameEditKeyUp
  end
  object BrowseBtn: TBitBtn
    Left = 264
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Browse'
    TabOrder = 6
    OnClick = BrowseBtnClick
  end
  object Progress: TProgressBar
    Left = 7
    Top = 209
    Width = 330
    Height = 18
    TabOrder = 8
    Visible = False
  end
end
