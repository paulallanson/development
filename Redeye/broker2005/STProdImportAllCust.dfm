object STProdImportAllCustFrm: TSTProdImportAllCustFrm
  Left = 327
  Top = 55
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Customer Product Import'
  ClientHeight = 443
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object mmErrorRecords: TMemo
    Left = 0
    Top = 297
    Width = 379
    Height = 105
    Align = alClient
    Enabled = False
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object pnlImportFile: TPanel
    Left = 0
    Top = 145
    Width = 379
    Height = 56
    Align = alTop
    Enabled = False
    ParentBackground = False
    TabOrder = 2
    object lblStep3: TLabel
      Left = 8
      Top = 8
      Width = 164
      Height = 13
      Caption = '3. Select the file to be imported.'
    end
    object edtImportFileName: TEdit
      Left = 8
      Top = 24
      Width = 289
      Height = 21
      TabOrder = 0
      OnChange = edtImportFileNameChange
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
    Top = 242
    Width = 379
    Height = 55
    Align = alTop
    ParentBackground = False
    TabOrder = 4
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 50
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
      Width = 67
      Height = 13
      Caption = 'records read.'
      Visible = False
    end
    object lblReadingFile: TLabel
      Left = 64
      Top = 8
      Width = 108
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
  object pnlCustomer: TPanel
    Left = 0
    Top = 0
    Width = 379
    Height = 57
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object lblStep1: TLabel
      Left = 8
      Top = 8
      Width = 129
      Height = 13
      Caption = '1. Select the Import type.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
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
    object chkbxImportStock: TCheckBox
      Left = 32
      Top = 32
      Width = 137
      Height = 17
      Caption = 'Import stock balances'
      TabOrder = 0
      OnClick = chkbxImportStockClick
    end
  end
  object pnlImport: TPanel
    Left = 0
    Top = 201
    Width = 379
    Height = 41
    Align = alTop
    ParentBackground = False
    TabOrder = 3
    object lblStep4: TLabel
      Left = 8
      Top = 8
      Width = 90
      Height = 13
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
  object pnlCancel: TPanel
    Left = 0
    Top = 402
    Width = 379
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 6
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
  object pnlPrefix: TPanel
    Left = 0
    Top = 57
    Width = 379
    Height = 88
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    object lblStep2: TLabel
      Left = 8
      Top = 8
      Width = 192
      Height = 13
      Caption = '2. Select the Warehouse and location'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 36
      Width = 59
      Height = 13
      Caption = 'Warehouse'
    end
    object Label4: TLabel
      Left = 32
      Top = 60
      Width = 16
      Height = 13
      Caption = 'Bin'
    end
    object dblkpPartStore: TDBLookupComboBox
      Left = 112
      Top = 32
      Width = 201
      Height = 21
      Enabled = False
      KeyField = 'Part_Store'
      ListField = 'Part_Store_Name'
      ListSource = dtsPartStore
      TabOrder = 0
      OnClick = dblkpPartStoreClick
    end
    object edtBin: TEdit
      Left = 112
      Top = 56
      Width = 97
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      OnChange = edtBinChange
    end
    object btnBin: TBitBtn
      Left = 216
      Top = 56
      Width = 25
      Height = 25
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnBinClick
    end
  end
  object opndlgImportFile: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Text files (*.txt;*.csv)|*.txt; *.csv'
    InitialDir = 'C:\My Documents'
    Left = 72
    Top = 136
  end
  object qryPartStore: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from'
      'Part_store'
      'order by Part_Store_Name')
    Left = 248
    Top = 33
  end
  object dtsPartStore: TDataSource
    DataSet = qryPartStore
    Left = 304
    Top = 33
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Default_Warehouse'
      'from company'
      'where company = 1')
    Left = 272
    Top = 137
  end
  object qryGetCustomer: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Product_Code_Prefix'
      'from Customer'
      'where Customer = :Customer')
    Left = 272
    Top = 252
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
end
