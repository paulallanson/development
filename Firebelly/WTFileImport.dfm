object frmWTFileImport: TfrmWTFileImport
  Left = 299
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Import Quickbooks data'
  ClientHeight = 435
  ClientWidth = 402
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
    Width = 402
    Height = 65
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 372
    object lblStep1: TLabel
      Left = 8
      Top = 8
      Width = 156
      Height = 17
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
      Top = 32
      Width = 193
      Height = 25
      Style = csDropDownList
      TabOrder = 0
      OnClick = cmbImportTypeClick
      Items.Strings = (
        'Customer'
        'Customer Reps'
        'Supplier'
        'Worktops'
        'Cutouts'
        'Edges')
    end
  end
  object pnlImportFile: TPanel
    Left = 0
    Top = 65
    Width = 402
    Height = 80
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 372
    object lblStep3: TLabel
      Left = 8
      Top = 3
      Width = 187
      Height = 17
      Caption = '2. Select the file to be imported.'
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 85
      Height = 17
      Caption = '3. Data Source'
    end
    object edtImportFileName: TEdit
      Left = 8
      Top = 24
      Width = 289
      Height = 25
      TabOrder = 0
    end
    object btnFindFile: TButton
      Left = 304
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Find File'
      TabOrder = 1
      OnClick = btnFindFileClick
    end
    object dblkpDataSource: TDBLookupComboBox
      Left = 104
      Top = 52
      Width = 193
      Height = 25
      KeyField = 'Data_Source'
      ListField = 'Data_Source_Title'
      ListSource = dtsDataSource
      TabOrder = 2
    end
  end
  object pnlImport: TPanel
    Left = 0
    Top = 145
    Width = 402
    Height = 41
    Align = alTop
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 372
    object lblStep4: TLabel
      Left = 8
      Top = 8
      Width = 101
      Height = 17
      Caption = '4. Run the Import'
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
    Top = 186
    Width = 402
    Height = 55
    Align = alTop
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 372
    object Label1: TLabel
      Left = 8
      Top = 3
      Width = 59
      Height = 17
      Caption = 'Progress: '
    end
    object lblProgress: TLabel
      Left = 257
      Top = 3
      Width = 6
      Height = 17
      Caption = 'x'
      Visible = False
    end
    object lblRecordCount: TLabel
      Left = 299
      Top = 3
      Width = 79
      Height = 17
      Caption = 'records read.'
      Visible = False
    end
    object lblReadingFile: TLabel
      Left = 64
      Top = 8
      Width = 102
      Height = 17
      Caption = 'Reading data file.'
    end
    object prgrsbrImport: TProgressBar
      Left = 8
      Top = 29
      Width = 353
      Height = 17
      TabOrder = 0
    end
  end
  object mmErrorRecords: TMemo
    Left = 0
    Top = 241
    Width = 402
    Height = 153
    Align = alClient
    Enabled = False
    ScrollBars = ssBoth
    TabOrder = 4
    ExplicitWidth = 372
    ExplicitHeight = 122
  end
  object pnlCancel: TPanel
    Left = 0
    Top = 394
    Width = 402
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 5
    ExplicitTop = 363
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
  object qryDataSource: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Data_Source'
      'order by Data_Source_Title')
    Left = 338
    Top = 9
  end
  object dtsDataSource: TDataSource
    DataSet = qryDataSource
    Left = 376
    Top = 9
  end
end
