object PBFileImportFrm: TPBFileImportFrm
  Left = 299
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Import Quickbooks data'
  ClientHeight = 446
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object pnlCustomer: TPanel
    Left = 0
    Top = 0
    Width = 378
    Height = 65
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 372
    object lblStep1: TLabel
      Left = 8
      Top = 9
      Width = 156
      Height = 18
      Caption = '1. Select the Import type.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblCustName: TLabel
      Left = 32
      Top = 32
      Width = 24
      Height = 17
      Caption = '      '
    end
    object cmbImportType: TComboBox
      Left = 11
      Top = 29
      Width = 193
      Height = 25
      Style = csDropDownList
      TabOrder = 0
      OnClick = cmbImportTypeClick
      Items.Strings = (
        'Customer'
        'Customer Reps'
        'Supplier'
        'Orders'
        'Sales Invoices')
    end
  end
  object pnlImportFile: TPanel
    Left = 0
    Top = 65
    Width = 378
    Height = 64
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    object lblStep3: TLabel
      Left = 8
      Top = 8
      Width = 187
      Height = 17
      Caption = '2. Select the file to be imported.'
    end
    object edtImportFileName: TEdit
      Left = 8
      Top = 29
      Width = 289
      Height = 25
      TabOrder = 0
    end
    object btnFindFile: TButton
      Left = 304
      Top = 29
      Width = 59
      Height = 25
      Caption = 'Find File'
      TabOrder = 1
      OnClick = btnFindFileClick
    end
  end
  object pnlImport: TPanel
    Left = 0
    Top = 129
    Width = 378
    Height = 41
    Align = alTop
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 121
    ExplicitWidth = 372
    object lblStep4: TLabel
      Left = 8
      Top = 8
      Width = 101
      Height = 17
      Caption = '3. Run the Import'
    end
    object ImportBtn: TButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Import'
      Enabled = False
      TabOrder = 0
      OnClick = ImportBtnClick
    end
  end
  object pnlProgress: TPanel
    Left = 0
    Top = 170
    Width = 378
    Height = 62
    Align = alTop
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 59
      Height = 17
      Caption = 'Progress: '
    end
    object lblProgress: TLabel
      Left = 257
      Top = 8
      Width = 6
      Height = 17
      Caption = 'x'
      Visible = False
    end
    object lblRecordCount: TLabel
      Left = 299
      Top = 8
      Width = 79
      Height = 17
      Caption = 'records read.'
      Visible = False
    end
    object lblReadingFile: TLabel
      Left = 64
      Top = 8
      Width = 121
      Height = 17
      Caption = 'Reading Product file.'
    end
    object prgrsbrImport: TProgressBar
      Left = 8
      Top = 30
      Width = 353
      Height = 23
      TabOrder = 0
    end
  end
  object mmErrorRecords: TMemo
    Left = 0
    Top = 232
    Width = 378
    Height = 173
    Align = alClient
    Enabled = False
    ScrollBars = ssBoth
    TabOrder = 4
    ExplicitTop = 217
    ExplicitWidth = 372
    ExplicitHeight = 179
  end
  object pnlCancel: TPanel
    Left = 0
    Top = 405
    Width = 378
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 5
    ExplicitTop = 396
    ExplicitWidth = 372
    object Cancel2BitBtn: TBitBtn
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Close'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object opndlgImportFile: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Text files (*.txt;*.csv)|*.txt; *.csv'
    InitialDir = 'C:\My Documents'
    Left = 72
    Top = 136
  end
end
