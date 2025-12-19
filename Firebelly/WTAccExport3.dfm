object frmWTAccExport3: TfrmWTAccExport3
  Left = 530
  Top = 147
  Caption = 'Export & Import Wizard'
  ClientHeight = 289
  ClientWidth = 355
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 17
  object pnlBottom: TPanel
    Left = 0
    Top = 248
    Width = 355
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 239
    ExplicitWidth = 349
    object BitBtn1: TBitBtn
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Back'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object FinishBtn: TBitBtn
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Finish'
      TabOrder = 1
      OnClick = FinishBtnClick
    end
    object BitBtn3: TBitBtn
      Left = 256
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 355
    Height = 248
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 349
    ExplicitHeight = 239
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 109
      Height = 17
      Caption = 'Accounting System'
    end
    object AliasLbl: TLabel
      Left = 8
      Top = 58
      Width = 113
      Height = 17
      Caption = 'Alias of Datasource'
    end
    object fileNameLbl: TLabel
      Left = 8
      Top = 56
      Width = 58
      Height = 17
      Caption = 'File Name'
    end
    object ExportLbl: TLabel
      Left = 8
      Top = 111
      Width = 139
      Height = 17
      Caption = 'Export/Import Directory'
    end
    object lblStatus: TLabel
      Left = 8
      Top = 165
      Width = 63
      Height = 22
      Caption = 'Processing'
      Visible = False
    end
    object AccSystemEdit: TEdit
      Left = 8
      Top = 27
      Width = 329
      Height = 26
      ReadOnly = True
      TabOrder = 0
      Text = 'AccSystemEdit'
    end
    object cbsource: TComboBox
      Left = 8
      Top = 79
      Width = 177
      Height = 25
      Style = csDropDownList
      TabOrder = 1
      OnChange = cbsourceChange
    end
    object FileNameEdit: TEdit
      Left = 8
      Top = 79
      Width = 137
      Height = 25
      ReadOnly = True
      TabOrder = 2
      Text = 'FileNameEdit'
      OnKeyUp = FileNameEditKeyUp
    end
    object ExportPathEdit: TEdit
      Left = 8
      Top = 130
      Width = 249
      Height = 25
      ReadOnly = True
      TabOrder = 3
      Text = 'ExportPathEdit'
      OnKeyUp = ExportPathEditKeyUp
    end
    object BrowseBtn: TBitBtn
      Left = 264
      Top = 130
      Width = 75
      Height = 25
      Caption = 'Browse'
      TabOrder = 4
      OnClick = BrowseBtnClick
    end
    object Progress: TProgressBar
      Left = 7
      Top = 183
      Width = 330
      Height = 24
      TabOrder = 5
      Visible = False
    end
  end
  object qryRevenueCentre: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Revenue_Centre.Revenue_Centre,'
      '        Revenue_Centre.Revenue_Centre_Descr,'
      '        Revenue_Centre.Inactive,'
      '        Revenue_Centre.Prefix_Value,'
      '        Revenue_Centre.Accounts_Package,'
      '        Accounts_Package.Accounts_Package_Description'
      'FROM Accounts_Package'
      '        RIGHT JOIN Revenue_Centre'
      
        '          ON Accounts_Package.Accounts_Package = Revenue_Centre.' +
        'Accounts_Package'
      'ORDER BY Revenue_Centre_Descr')
    Left = 208
    Top = 8
  end
  object dtsRevenueCentre: TDataSource
    DataSet = qryRevenueCentre
    Left = 266
    Top = 58
  end
end
