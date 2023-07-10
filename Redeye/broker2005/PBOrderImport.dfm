object PBOrderImportFrm: TPBOrderImportFrm
  Left = 299
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Import Order and Invoice data'
  ClientHeight = 446
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCustomer: TPanel
    Left = 0
    Top = 0
    Width = 378
    Height = 65
    Align = alTop
    TabOrder = 0
    object lblStep1: TLabel
      Left = 8
      Top = 8
      Width = 145
      Height = 13
      Caption = '1. Select the Import type.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblCustName: TLabel
      Left = 32
      Top = 32
      Width = 18
      Height = 13
      Caption = '      '
    end
    object cmbImportType: TComboBox
      Left = 11
      Top = 32
      Width = 193
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnClick = cmbImportTypeClick
      Items.Strings = (
        'Buy Print Orders'
        'Sales Invoices'
        'Supplier Invoices')
    end
  end
  object pnlImportFile: TPanel
    Left = 0
    Top = 65
    Width = 378
    Height = 56
    Align = alTop
    TabOrder = 1
    object lblStep3: TLabel
      Left = 8
      Top = 8
      Width = 149
      Height = 13
      Caption = '2. Select the file to be imported.'
    end
    object edtImportFileName: TEdit
      Left = 8
      Top = 24
      Width = 289
      Height = 21
      TabOrder = 0
    end
    object btnFindFile: TButton
      Left = 304
      Top = 22
      Width = 59
      Height = 25
      Caption = 'Find File'
      TabOrder = 1
      OnClick = btnFindFileClick
    end
  end
  object pnlImport: TPanel
    Left = 0
    Top = 121
    Width = 378
    Height = 41
    Align = alTop
    TabOrder = 2
    object lblStep4: TLabel
      Left = 8
      Top = 8
      Width = 82
      Height = 13
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
    Top = 162
    Width = 378
    Height = 55
    Align = alTop
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 47
      Height = 13
      Caption = 'Progress: '
    end
    object lblProgress: TLabel
      Left = 257
      Top = 8
      Width = 5
      Height = 13
      Caption = 'x'
      Visible = False
    end
    object lblRecordCount: TLabel
      Left = 299
      Top = 8
      Width = 62
      Height = 13
      Caption = 'records read.'
      Visible = False
    end
    object lblReadingFile: TLabel
      Left = 64
      Top = 8
      Width = 99
      Height = 13
      Caption = 'Reading Product file.'
    end
    object prgrsbrImport: TProgressBar
      Left = 8
      Top = 24
      Width = 353
      Height = 17
      TabOrder = 0
    end
  end
  object mmErrorRecords: TMemo
    Left = 0
    Top = 217
    Width = 378
    Height = 188
    Align = alClient
    Enabled = False
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object pnlCancel: TPanel
    Left = 0
    Top = 405
    Width = 378
    Height = 41
    Align = alBottom
    TabOrder = 5
    object Cancel2BitBtn: TBitBtn
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 0
      Kind = bkCancel
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
