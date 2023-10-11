object STImpDirectOrdersFrm: TSTImpDirectOrdersFrm
  Left = 211
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Import Direct Supplied Order'
  ClientHeight = 358
  ClientWidth = 360
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
  TextHeight = 13
  object pnlSupplier: TPanel
    Left = 0
    Top = 65
    Width = 360
    Height = 64
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 364
    object lblStep1: TLabel
      Left = 8
      Top = 8
      Width = 110
      Height = 13
      Caption = '2. Select the Supplier.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
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
  object Panel1: TPanel
    Left = 0
    Top = 129
    Width = 360
    Height = 181
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitWidth = 364
    ExplicitHeight = 182
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 100
      Height = 13
      Caption = '3.  Select Filenames'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lstbxFileNames: TListBox
      Left = 24
      Top = 25
      Width = 209
      Height = 155
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
    end
    object btnImport: TBitBtn
      Left = 272
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Import'
      Enabled = False
      TabOrder = 1
      OnClick = btnImportClick
    end
    object BitBtn1: TBitBtn
      Left = 272
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Audit'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object btbtnDelete: TBitBtn
      Left = 272
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Delete'
      Enabled = False
      TabOrder = 3
      OnClick = btbtnDeleteClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 360
    Height = 65
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 364
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 97
      Height = 13
      Caption = '1. Import Directory'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtImportDir: TEdit
      Left = 24
      Top = 20
      Width = 337
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 310
    Width = 360
    Height = 48
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 311
    ExplicitWidth = 364
    object btnClose: TBitBtn
      Left = 272
      Top = 15
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Data_Transfer_Directory, Default_warehouse'
      'from company'
      'where company = 1')
    Left = 272
    Top = 120
  end
end
