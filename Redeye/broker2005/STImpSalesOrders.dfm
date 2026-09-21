object STImpSalesOrdersFrm: TSTImpSalesOrdersFrm
  Left = 211
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Import Sales Order details'
  ClientHeight = 367
  ClientWidth = 372
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 95
    Height = 17
    Caption = 'Import directory'
  end
  object Label2: TLabel
    Left = 8
    Top = 108
    Width = 57
    Height = 17
    Caption = 'Filenames'
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 120
    Height = 17
    Caption = 'Replenish orders for'
  end
  object lstbxFileNames: TListBox
    Left = 8
    Top = 128
    Width = 209
    Height = 217
    ItemHeight = 17
    MultiSelect = True
    TabOrder = 0
  end
  object btnImport: TBitBtn
    Left = 272
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Import'
    Enabled = False
    TabOrder = 1
    OnClick = btnImportClick
  end
  object edtImportDir: TEdit
    Left = 8
    Top = 24
    Width = 337
    Height = 25
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object btnClose: TBitBtn
    Left = 272
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = btnCloseClick
  end
  object dblkpWarehouse: TDBLookupComboBox
    Left = 8
    Top = 76
    Width = 209
    Height = 25
    KeyField = 'Part_Store'
    ListField = 'Part_Store_Name'
    ListSource = dtsWarehouse
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 272
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Audit'
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object btbtnDelete: TBitBtn
    Left = 272
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Delete'
    Enabled = False
    TabOrder = 6
    OnClick = btbtnDeleteClick
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Data_Transfer_Directory, Default_warehouse'
      'from company'
      'where company = 1')
    Left = 200
    Top = 112
  end
  object qryWarehouse: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from part_store'
      'order by Part_Store_name')
    Left = 218
    Top = 70
  end
  object dtsWarehouse: TDataSource
    DataSet = qryWarehouse
    Left = 216
    Top = 206
  end
end
