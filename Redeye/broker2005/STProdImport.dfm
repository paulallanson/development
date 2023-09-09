object STProdImportFrm: TSTProdImportFrm
  Left = 372
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Product File Import'
  ClientHeight = 385
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object mmErrorRecords: TMemo
    Left = 0
    Top = 253
    Width = 380
    Height = 100
    Align = alTop
    Enabled = False
    ScrollBars = ssBoth
    TabOrder = 0
    ExplicitWidth = 386
  end
  object pnlImportFile: TPanel
    Left = 0
    Top = 65
    Width = 380
    Height = 56
    Align = alTop
    Enabled = False
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 386
    object lblStep2: TLabel
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
  object pnlProgress: TPanel
    Left = 0
    Top = 177
    Width = 380
    Height = 76
    Align = alTop
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 386
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
  object pnlSupplier: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 65
    Align = alTop
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 386
    object lblStep1: TLabel
      Left = 8
      Top = 8
      Width = 128
      Height = 13
      Caption = '1. Select the Supplier.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblSuppName: TLabel
      Left = 32
      Top = 32
      Width = 18
      Height = 13
      Caption = '      '
    end
    object btnSelectSupplier: TButton
      Left = 272
      Top = 24
      Width = 89
      Height = 25
      Caption = 'Select Supplier'
      TabOrder = 0
      OnClick = btnSelectSupplierClick
    end
  end
  object pnlImport: TPanel
    Left = 0
    Top = 121
    Width = 380
    Height = 56
    Align = alTop
    ParentBackground = False
    TabOrder = 4
    ExplicitWidth = 386
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
    object chkbxDeleteStocked: TCheckBox
      Left = 16
      Top = 32
      Width = 233
      Height = 17
      Caption = 'Deleted Stocked Product Discounts'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object pnlCancel: TPanel
    Left = 0
    Top = 353
    Width = 380
    Height = 41
    Align = alTop
    ParentBackground = False
    TabOrder = 5
    ExplicitWidth = 386
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
    Filter = 
      'Text files (*.txt)|*.TXT|Terms files (*.TMF)|*.TMF|Contract file' +
      's (*.css)|*.CSS|CSV (Comma delimited) (*.csv)|*.csv'
    InitialDir = 'C:\My Documents'
    Left = 448
    Top = 128
  end
end
