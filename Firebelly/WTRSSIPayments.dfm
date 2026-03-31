object frmWTRSSIPayments: TfrmWTRSSIPayments
  Left = 363
  Top = 223
  BorderStyle = bsDialog
  Caption = 'Payment Report'
  ClientHeight = 311
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    549
    311)
  TextHeight = 17
  object lstbxCustomersCode: TListBox
    Left = 96
    Top = 8
    Width = 25
    Height = 105
    ItemHeight = 17
    TabOrder = 10
    Visible = False
  end
  object rdgrpCategory: TRadioGroup
    Left = 232
    Top = 144
    Width = 129
    Height = 113
    Caption = 'Category'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'Trade'
      'Retail'
      'Commercial')
    ParentBackground = False
    TabOrder = 9
  end
  object btnPrint: TButton
    Left = 8
    Top = 274
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    TabOrder = 0
    OnClick = btnPrintClick
    ExplicitTop = 258
  end
  object Button4: TButton
    Left = 454
    Top = 274
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 1
    OnClick = Button4Click
  end
  object rdgrpCustomer: TRadioGroup
    Left = 9
    Top = 8
    Width = 105
    Height = 62
    Caption = 'Customers'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'Selected')
    ParentBackground = False
    TabOrder = 2
    OnClick = rdgrpCustomerClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 144
    Width = 209
    Height = 113
    Caption = 'Payment Date'
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 23
      Top = 36
      Width = 33
      Height = 17
      Caption = 'From:'
    end
    object Label2: TLabel
      Left = 33
      Top = 68
      Width = 17
      Height = 17
      Caption = 'To:'
    end
    object edtDateFrom: TEdit
      Left = 63
      Top = 32
      Width = 100
      Height = 25
      TabOrder = 0
      OnChange = enableOK
      OnExit = edtDateFromExit
    end
    object edtDateTo: TEdit
      Left = 63
      Top = 64
      Width = 100
      Height = 25
      TabOrder = 1
      OnChange = enableOK
      OnExit = edtDateFromExit
    end
    object btnDatefrom: TBitBtn
      Left = 175
      Top = 30
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
      Left = 175
      Top = 64
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
    Left = 128
    Top = 14
    Width = 249
    Height = 113
    Enabled = False
    ParentBackground = False
    TabOrder = 4
    object Label4: TLabel
      Left = 8
      Top = 5
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
  object btnPreview: TButton
    Left = 96
    Top = 274
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'P&review'
    TabOrder = 5
    OnClick = btnPreviewClick
    ExplicitTop = 258
  end
  object btnExcel: TButton
    Left = 184
    Top = 274
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Excel'
    TabOrder = 6
    OnClick = btnExcelClick
    ExplicitTop = 258
  end
  object OleContainer1: TOleContainer
    Left = 132
    Top = 43
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 7
    Visible = False
  end
  object pnlExportPrgrss: TPanel
    Left = 84
    Top = 106
    Width = 289
    Height = 61
    ParentBackground = False
    TabOrder = 8
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
  object rdgrpSortBy: TRadioGroup
    Left = 399
    Top = 8
    Width = 130
    Height = 97
    Caption = 'Sort by: '
    ItemIndex = 0
    Items.Strings = (
      'Payment Date'
      'Customer'
      'Rep')
    ParentBackground = False
    TabOrder = 11
  end
  object chkbxPageBreak: TCheckBox
    Left = 399
    Top = 124
    Width = 113
    Height = 17
    Caption = 'Page Break'
    TabOrder = 12
  end
  object qryReps: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Rep'
      'order by Rep_Name')
    Left = 238
    Top = 15
  end
  object dtsReps: TDataSource
    DataSet = qryReps
    Left = 308
    Top = 15
  end
  object pmnCustomers: TPopupMenu
    OnPopup = pmnCustomersPopup
    Left = 238
    Top = 85
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
end
