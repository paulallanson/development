object frmWTRSSalesbyInvoice: TfrmWTRSSalesbyInvoice
  Left = 403
  Top = 147
  BorderStyle = bsDialog
  Caption = 'Sales by Invoice Report'
  ClientHeight = 390
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    607
    390)
  TextHeight = 17
  object btnPrint: TButton
    Left = 8
    Top = 355
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    TabOrder = 0
    OnClick = btnPrintClick
    ExplicitTop = 251
  end
  object Button4: TButton
    Left = 502
    Top = 355
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
    Top = 111
    Width = 129
    Height = 68
    Caption = 'Customers'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'One Customer')
    ParentBackground = False
    TabOrder = 2
    OnClick = rdgrpCustomerClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 185
    Width = 209
    Height = 112
    Caption = 'Invoice Date'
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 36
      Width = 33
      Height = 17
      Caption = 'From:'
    end
    object Label2: TLabel
      Left = 26
      Top = 67
      Width = 17
      Height = 17
      Caption = 'To:'
    end
    object edtDateFrom: TEdit
      Left = 56
      Top = 32
      Width = 100
      Height = 25
      TabOrder = 0
      OnChange = enableOK
      OnExit = edtDateFromExit
    end
    object edtDateTo: TEdit
      Left = 56
      Top = 63
      Width = 100
      Height = 25
      TabOrder = 1
      OnChange = enableOK
      OnExit = edtDateFromExit
    end
    object btnDatefrom: TBitBtn
      Left = 168
      Top = 32
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
      Top = 63
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
    Left = 152
    Top = 117
    Width = 219
    Height = 62
    Enabled = False
    ParentBackground = False
    TabOrder = 4
    object Label4: TLabel
      Left = 8
      Top = 12
      Width = 56
      Height = 17
      Caption = 'Customer'
    end
    object edtCustomer: TEdit
      Left = 8
      Top = 27
      Width = 169
      Height = 25
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      Text = 'All Customers'
    end
    object btnCustomer: TButton
      Left = 184
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
      TabOrder = 1
      OnClick = btnCustomerClick
    end
  end
  object rdgrpSortBy: TRadioGroup
    Left = 392
    Top = 8
    Width = 185
    Height = 171
    Caption = 'Sort by: '
    ItemIndex = 0
    Items.Strings = (
      'Invoice Number'
      'Invoice Date'
      'Customer'
      'Rep'
      'Customer Type'
      'Account Manager')
    ParentBackground = False
    TabOrder = 5
  end
  object chkbxPageBreak: TCheckBox
    Left = 400
    Top = 304
    Width = 113
    Height = 17
    Caption = 'Page Break'
    TabOrder = 6
  end
  object btnPreview: TButton
    Left = 96
    Top = 355
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'P&review'
    TabOrder = 7
    OnClick = btnPreviewClick
    ExplicitTop = 251
  end
  object btnExcel: TButton
    Left = 184
    Top = 355
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Excel'
    TabOrder = 8
    OnClick = btnExcelClick
    ExplicitTop = 251
  end
  object OleContainer1: TOleContainer
    Left = 188
    Top = 115
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 9
    Visible = False
  end
  object rdgrpCategory: TRadioGroup
    Left = 224
    Top = 185
    Width = 105
    Height = 112
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
  object pnlExportPrgrss: TPanel
    Left = 132
    Top = 131
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
    Width = 129
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
    Left = 152
    Top = 14
    Width = 219
    Height = 62
    ParentBackground = False
    TabOrder = 13
    object Label3: TLabel
      Left = 8
      Top = 12
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
  object rdgrpChargeType: TRadioGroup
    Left = 392
    Top = 185
    Width = 185
    Height = 106
    Caption = 'Charge Type: '
    ItemIndex = 0
    Items.Strings = (
      'All'
      'Invoice'
      'Application for Payment'
      'Retail')
    ParentBackground = False
    TabOrder = 14
  end
  object qryReps: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Rep'
      'order by Rep_Name')
    Left = 246
    Top = 68
  end
  object dtsReps: TDataSource
    DataSet = qryReps
    Left = 316
    Top = 68
  end
end
