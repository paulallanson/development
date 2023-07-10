object frmWTAccExport3: TfrmWTAccExport3
  Left = 530
  Top = 147
  Width = 355
  Height = 326
  Caption = 'Export & Import Wizard'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AliasLbl: TLabel
    Left = 8
    Top = 72
    Width = 92
    Height = 13
    Caption = 'Alias of Datasource'
  end
  object ExportLbl: TLabel
    Left = 8
    Top = 128
    Width = 109
    Height = 13
    Caption = 'Export/Import Directory'
  end
  object Label2: TLabel
    Left = 8
    Top = 16
    Width = 91
    Height = 13
    Caption = 'Accounting System'
  end
  object fileNameLbl: TLabel
    Left = 8
    Top = 72
    Width = 47
    Height = 13
    Caption = 'File Name'
  end
  object lblStatus: TLabel
    Left = 8
    Top = 192
    Width = 52
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
    ItemHeight = 13
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
