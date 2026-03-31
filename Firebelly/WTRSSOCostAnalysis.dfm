object frmWTRSSOCostAnalysis: TfrmWTRSSOCostAnalysis
  Left = 363
  Top = 223
  BorderStyle = bsDialog
  Caption = 'Sales Order Cost Analysis Report'
  ClientHeight = 393
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    539
    393)
  TextHeight = 17
  object lstbxCustomersCode: TListBox
    Left = 96
    Top = 80
    Width = 25
    Height = 105
    ItemHeight = 17
    TabOrder = 14
    Visible = False
  end
  object rdgrpCategory: TRadioGroup
    Left = 232
    Top = 205
    Width = 105
    Height = 121
    Caption = 'Category'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'Trade'
      'Retail'
      'Commercial')
    ParentBackground = False
    TabOrder = 11
  end
  object btnPrint: TButton
    Left = 8
    Top = 356
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    TabOrder = 0
    OnClick = btnPrintClick
    ExplicitTop = 329
  end
  object Button4: TButton
    Left = 438
    Top = 356
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 1
    OnClick = Button4Click
  end
  object rdgrpCustomer: TRadioGroup
    Left = 8
    Top = 80
    Width = 105
    Height = 68
    Caption = 'Customers'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'Selected')
    ParentBackground = False
    TabOrder = 2
    OnClick = rdgrpCustomerClick
  end
  object grpbxDateSelect: TGroupBox
    Left = 8
    Top = 205
    Width = 209
    Height = 121
    Caption = 'Order Date'
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 39
      Width = 33
      Height = 17
      Caption = 'From:'
    end
    object Label2: TLabel
      Left = 26
      Top = 69
      Width = 17
      Height = 17
      Caption = 'To:'
    end
    object edtDateFrom: TEdit
      Left = 56
      Top = 35
      Width = 100
      Height = 25
      TabOrder = 0
      OnChange = enableOK
      OnExit = edtDateFromExit
    end
    object edtDateTo: TEdit
      Left = 56
      Top = 65
      Width = 100
      Height = 25
      TabOrder = 1
      OnChange = enableOK
      OnExit = edtDateFromExit
    end
    object btnDatefrom: TBitBtn
      Left = 168
      Top = 35
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
      Top = 65
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
  object grpbxCustomer: TGroupBox
    Left = 120
    Top = 87
    Width = 249
    Height = 113
    Enabled = False
    ParentBackground = False
    TabOrder = 4
    object Label4: TLabel
      Left = 8
      Top = 4
      Width = 56
      Height = 17
      Caption = 'Customer'
    end
    object btnCustomer: TButton
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
      OnClick = btnCustomerClick
    end
    object lstbxCustomers: TListBox
      Left = 8
      Top = 24
      Width = 201
      Height = 83
      ItemHeight = 17
      Items.Strings = (
        'All Customers')
      MultiSelect = True
      PopupMenu = pmnCustomers
      TabOrder = 1
    end
  end
  object rdgrpSortBy: TRadioGroup
    Left = 375
    Top = 8
    Width = 138
    Height = 160
    Caption = 'Sort by: '
    ItemIndex = 0
    Items.Strings = (
      'Sales Order'
      'Date'
      'Customer'
      'Status'
      'Rep'
      'Office Contact')
    ParentBackground = False
    TabOrder = 5
  end
  object chkbxPageBreak: TCheckBox
    Left = 384
    Top = 177
    Width = 113
    Height = 17
    Caption = 'Page Break'
    TabOrder = 6
  end
  object btnPreview: TButton
    Left = 96
    Top = 356
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'P&review'
    TabOrder = 7
    OnClick = btnPreviewClick
    ExplicitTop = 329
  end
  object btnExcel: TButton
    Left = 184
    Top = 356
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Excel'
    TabOrder = 8
    OnClick = btnExcelClick
    ExplicitTop = 329
  end
  object OleContainer1: TOleContainer
    Left = 263
    Top = 91
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 9
    Visible = False
  end
  object pnlExportPrgrss: TPanel
    Left = 119
    Top = 107
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
  object rdgrpReps: TRadioGroup
    Left = 8
    Top = 8
    Width = 105
    Height = 68
    Caption = 'Reps'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'One Rep')
    ParentBackground = False
    TabOrder = 12
    OnClick = rdgrpRepsClick
  end
  object grpbxReps: TGroupBox
    Left = 120
    Top = 15
    Width = 249
    Height = 62
    ParentBackground = False
    TabOrder = 13
    object Label3: TLabel
      Left = 8
      Top = 7
      Width = 23
      Height = 17
      Caption = 'Rep'
    end
    object cmbReps: TComboBox
      Left = 8
      Top = 27
      Width = 201
      Height = 25
      Style = csDropDownList
      Color = clBtnFace
      Enabled = False
      ItemIndex = 0
      TabOrder = 0
      Text = 'All Reps'
      OnClick = cmbRepsClick
      Items.Strings = (
        'All Reps')
    end
  end
  object rdgrpSelectBy: TRadioGroup
    Left = 375
    Top = 205
    Width = 138
    Height = 121
    Caption = 'Select by '
    ItemIndex = 0
    Items.Strings = (
      'Order Date'
      'Fitting Date'
      'Template Date'
      'TBC')
    ParentBackground = False
    TabOrder = 15
    OnClick = rdgrpSelectByClick
  end
  object qryReps: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Rep'
      'order by Rep_Name')
    Left = 184
    Top = 16
  end
  object dtsReps: TDataSource
    DataSet = qryReps
    Left = 240
    Top = 16
  end
  object pmnCustomers: TPopupMenu
    OnPopup = pmnCustomersPopup
    Left = 376
    Top = 136
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
end
