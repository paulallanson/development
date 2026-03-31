object frmWTRSPOrdersOutstanding: TfrmWTRSPOrdersOutstanding
  Left = 363
  Top = 223
  BorderStyle = bsDialog
  Caption = 'Outstanding Orders Report'
  ClientHeight = 364
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    566
    364)
  TextHeight = 17
  object lstbxSuppliersCode: TListBox
    Left = 96
    Top = 80
    Width = 25
    Height = 105
    ItemHeight = 17
    TabOrder = 13
    Visible = False
  end
  object btnPrint: TButton
    Left = 8
    Top = 327
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    TabOrder = 0
    OnClick = btnPrintClick
    ExplicitTop = 289
  end
  object Button4: TButton
    Left = 462
    Top = 327
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 1
    OnClick = Button4Click
  end
  object rdgrpSupplier: TRadioGroup
    Left = 8
    Top = 80
    Width = 123
    Height = 68
    Caption = 'Suppliers'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'Selected')
    ParentBackground = False
    TabOrder = 2
    OnClick = rdgrpSupplierClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 211
    Width = 209
    Height = 97
    Caption = 'Order Date'
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 28
      Width = 33
      Height = 17
      Caption = 'From:'
    end
    object Label2: TLabel
      Left = 26
      Top = 60
      Width = 17
      Height = 17
      Caption = 'To:'
    end
    object edtDateFrom: TEdit
      Left = 56
      Top = 24
      Width = 100
      Height = 25
      TabOrder = 0
      OnChange = enableOK
      OnExit = edtDateFromExit
    end
    object edtDateTo: TEdit
      Left = 56
      Top = 56
      Width = 100
      Height = 25
      TabOrder = 1
      OnChange = enableOK
      OnExit = edtDateFromExit
    end
    object btnDatefrom: TBitBtn
      Left = 168
      Top = 24
      Width = 25
      Height = 25
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnDatefromClick
    end
    object btnDateTo: TBitBtn
      Left = 168
      Top = 56
      Width = 25
      Height = 25
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      TabOrder = 3
      OnClick = btnDateToClick
    end
  end
  object grpbxSupplier: TGroupBox
    Left = 137
    Top = 88
    Width = 249
    Height = 113
    Enabled = False
    ParentBackground = False
    TabOrder = 4
    object Label4: TLabel
      Left = 8
      Top = 3
      Width = 54
      Height = 17
      Caption = 'Suppliers'
    end
    object btnSupplier: TButton
      Left = 216
      Top = 24
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnSupplierClick
    end
    object lstbxSuppliers: TListBox
      Left = 8
      Top = 24
      Width = 201
      Height = 83
      ItemHeight = 17
      Items.Strings = (
        'All Suppliers')
      MultiSelect = True
      PopupMenu = pmnSuppliers
      TabOrder = 1
    end
  end
  object rdgrpSortBy: TRadioGroup
    Left = 400
    Top = 8
    Width = 137
    Height = 151
    Caption = 'Sort by: '
    ItemIndex = 0
    Items.Strings = (
      'Purchase Order'
      'Order Date'
      'Supplier'
      'Status'
      'Office Contact')
    ParentBackground = False
    TabOrder = 5
  end
  object chkbxPageBreak: TCheckBox
    Left = 406
    Top = 184
    Width = 113
    Height = 17
    Caption = 'Page Break'
    TabOrder = 6
  end
  object btnPreview: TButton
    Left = 96
    Top = 327
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'P&review'
    TabOrder = 7
    OnClick = btnPreviewClick
    ExplicitTop = 289
  end
  object btnExcel: TButton
    Left = 184
    Top = 327
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Excel'
    TabOrder = 8
    OnClick = btnExcelClick
    ExplicitTop = 289
  end
  object OleContainer1: TOleContainer
    Left = 145
    Top = 86
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 9
    Visible = False
  end
  object pnlExportPrgrss: TPanel
    Left = 58
    Top = 114
    Width = 289
    Height = 61
    ParentBackground = False
    TabOrder = 10
    Visible = False
    object lblExporting: TLabel
      Left = 16
      Top = 12
      Width = 65
      Height = 17
      Caption = 'Exporting...'
    end
    object prgbrExport: TProgressBar
      Left = 16
      Top = 32
      Width = 257
      Height = 16
      Step = 1
      TabOrder = 0
    end
  end
  object rdgrpOperators: TRadioGroup
    Left = 8
    Top = 8
    Width = 123
    Height = 68
    Caption = 'Office Contact'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'One Contact')
    ParentBackground = False
    TabOrder = 11
    OnClick = rdgrpOperatorsClick
  end
  object grpbxOperators: TGroupBox
    Left = 137
    Top = 15
    Width = 249
    Height = 62
    ParentBackground = False
    TabOrder = 12
    object Label3: TLabel
      Left = 8
      Top = 7
      Width = 82
      Height = 17
      Caption = 'Office Contact'
    end
    object cmbOperators: TComboBox
      Left = 8
      Top = 27
      Width = 201
      Height = 25
      Style = csDropDownList
      Color = clBtnFace
      Enabled = False
      ItemIndex = 0
      TabOrder = 0
      Text = 'All Contacts'
      OnClick = cmbOperatorsClick
      Items.Strings = (
        'All Contacts')
    end
  end
  object qryOperators: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Operator'
      'order by Operator_Name')
    Left = 212
    Top = 23
  end
  object dtsOperators: TDataSource
    DataSet = qryOperators
    Left = 156
    Top = 28
  end
  object pmnSuppliers: TPopupMenu
    OnPopup = pmnSuppliersPopup
    Left = 326
    Top = 202
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
end
