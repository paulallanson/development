object STProdImportCustFrm: TSTProdImportCustFrm
  Left = 181
  Top = 27
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Customer Product File Import'
  ClientHeight = 443
  ClientWidth = 375
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
    Top = 316
    Width = 375
    Height = 86
    Align = alClient
    Enabled = False
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object pnlImportFile: TPanel
    Left = 0
    Top = 164
    Width = 375
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
      Enabled = False
      TabOrder = 1
      OnClick = btnFindFileClick
    end
  end
  object pnlProgress: TPanel
    Left = 0
    Top = 261
    Width = 375
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
    Width = 375
    Height = 57
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object lblStep1: TLabel
      Left = 8
      Top = 8
      Width = 117
      Height = 13
      Caption = '1. Select the Customer.'
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
    object btnSelectCustomer: TButton
      Left = 272
      Top = 24
      Width = 89
      Height = 25
      Caption = 'Select Customer'
      TabOrder = 0
      OnClick = btnSelectCustomerClick
    end
  end
  object pnlImport: TPanel
    Left = 0
    Top = 220
    Width = 375
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
    Width = 375
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
    Width = 375
    Height = 107
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    object lblStep2: TLabel
      Left = 8
      Top = 8
      Width = 193
      Height = 13
      Caption = '2. Select the Customer product prefix.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 35
      Width = 75
      Height = 13
      Caption = 'Product prefix:'
    end
    object Label2: TLabel
      Left = 32
      Top = 60
      Width = 59
      Height = 13
      Caption = 'Warehouse'
    end
    object Label4: TLabel
      Left = 32
      Top = 84
      Width = 16
      Height = 13
      Caption = 'Bin'
    end
    object edtPrefix: TEdit
      Left = 112
      Top = 27
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 0
      OnChange = edtPrefixChange
    end
    object chkbxImportStock: TCheckBox
      Left = 192
      Top = 32
      Width = 137
      Height = 17
      Caption = 'Import stock balances'
      TabOrder = 1
      OnClick = chkbxImportStockClick
    end
    object dblkpPartStore: TDBLookupComboBox
      Left = 112
      Top = 56
      Width = 201
      Height = 21
      Enabled = False
      KeyField = 'Part_Store'
      ListField = 'Part_Store_Name'
      ListSource = dtsPartStore
      TabOrder = 2
      OnClick = dblkpPartStoreClick
    end
    object edtBin: TEdit
      Left = 112
      Top = 80
      Width = 97
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
    object btnBin: TBitBtn
      Left = 216
      Top = 80
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
      TabOrder = 4
      OnClick = btnBinClick
    end
  end
  object opndlgImportFile: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Text files (*.txt;*.csv)|*.txt; *.csv'
    InitialDir = 'C:\My Documents'
    Left = 448
    Top = 128
  end
  object qryPartStore: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from'
      'Part_store'
      'order by Part_Store_Name')
    Left = 272
    Top = 81
  end
  object dtsPartStore: TDataSource
    DataSet = qryPartStore
    Left = 320
    Top = 81
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
  object qryUpCustomer: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Customer'
      'set Product_Code_Prefix = :Product_Code_Prefix'
      'where Customer = :Customer')
    Left = 272
    Top = 196
    ParamData = <
      item
        Name = 'Product_Code_Prefix'
      end
      item
        Name = 'Customer'
      end>
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
