object frmWTAccExport1: TfrmWTAccExport1
  Left = 529
  Top = 120
  BorderStyle = bsSingle
  Caption = 'Import and Export Wizard'
  ClientHeight = 522
  ClientWidth = 437
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
  TextHeight = 17
  object pnlFooter: TPanel
    Left = 0
    Top = 481
    Width = 437
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 462
    ExplicitWidth = 428
    object NextBitBtn: TBitBtn
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Next'
      TabOrder = 0
      OnClick = NextBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 342
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = CancelBitBtnClick
    end
    object UpdateBitBtn: TBitBtn
      Left = 15
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Update'
      TabOrder = 2
      OnClick = UpdateBitBtnClick
    end
    object ResetBitBtn: TBitBtn
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Reset'
      TabOrder = 3
      OnClick = ResetBitBtnClick
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 81
    Width = 437
    Height = 400
    Align = alClient
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 428
    ExplicitHeight = 381
    object Label1: TLabel
      Left = 16
      Top = 3
      Width = 172
      Height = 17
      Caption = 'Choose an action to perform:'
    end
    object ActionListBox: TListBox
      Left = 16
      Top = 24
      Width = 401
      Height = 267
      ItemHeight = 17
      Items.Strings = (
        'Export Customer details'
        'Export Supplier details'
        'Export Sales Invoices'
        'Export Purchase Invoices'
        'Export New Order Customer Accounts'
        'Import Currency Rates'
        'Import Stock References'
        'Import Credit Limits'
        'Import Sage Line 50 Customer details'
        'Import Sage Line 50 Supplier details'
        'Import Sage Payments'
        'Import Quickbooks Customer/Supplier details'
        'Import CSV Customer/Supplier/Worktops/Edges/CutOuts details'
        'Import Maximiser Contacts'
        'Export Factoring Invoices')
      TabOrder = 0
      OnClick = ActionListBoxClick
    end
    object GroupBox1: TGroupBox
      Left = 15
      Top = 297
      Width = 401
      Height = 89
      Caption = 'Description'
      ParentBackground = False
      TabOrder = 1
      object DescriptionLbl: TLabel
        Left = 16
        Top = 22
        Width = 289
        Height = 64
        AutoSize = False
        Caption = 
          'Once upon a time there were three little bears who all lived hap' +
          'pily in the woods.'
        WordWrap = True
      end
    end
  end
  object pnlRevenueCentre: TPanel
    Left = 0
    Top = 0
    Width = 437
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 428
    object rdgrpRevenueCentre: TRadioGroup
      Left = 3
      Top = 3
      Width = 121
      Height = 70
      Caption = 'Revenue Centre '
      ItemIndex = 0
      Items.Strings = (
        'Default'
        'Selected')
      ParentBackground = False
      TabOrder = 0
      OnClick = rdgrpRevenueCentreClick
    end
    object grpbxRevCentre: TGroupBox
      Left = 130
      Top = 13
      Width = 305
      Height = 62
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object Label3: TLabel
        Left = 8
        Top = 12
        Width = 91
        Height = 17
        Caption = 'Revenue Centre'
      end
      object dblkpRevCentre: TDBLookupComboBox
        Left = 8
        Top = 32
        Width = 233
        Height = 25
        KeyField = 'Revenue_Centre'
        ListField = 'Revenue_Centre_Descr'
        TabOrder = 0
        OnClick = dblkpRevCentreClick
      end
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
    Left = 216
    Top = 96
  end
  object dtsRevenueCentre: TDataSource
    DataSet = qryRevenueCentre
    Left = 288
    Top = 88
  end
end
