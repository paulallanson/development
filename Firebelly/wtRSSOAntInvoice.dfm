object frmWTRSSOAntInvoice: TfrmWTRSSOAntInvoice
  Left = 450
  Top = 166
  BorderStyle = bsDialog
  Caption = 'Anticipated Invoicing Report'
  ClientHeight = 327
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    467
    327)
  TextHeight = 13
  object btnPrint: TButton
    Left = 8
    Top = 288
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    TabOrder = 0
    OnClick = btnPrintClick
  end
  object Button4: TButton
    Left = 376
    Top = 290
    Width = 75
    Height = 25
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 1
    OnClick = Button4Click
  end
  object rdgrpReps: TRadioGroup
    Left = 8
    Top = 8
    Width = 105
    Height = 57
    Caption = 'Reps'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'One Rep')
    ParentBackground = False
    TabOrder = 2
    OnClick = rdgrpRepsClick
  end
  object rdgrpCustomer: TRadioGroup
    Left = 8
    Top = 72
    Width = 105
    Height = 57
    Caption = 'Customers'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'One Customer')
    ParentBackground = False
    TabOrder = 3
    OnClick = rdgrpCustomerClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 136
    Width = 209
    Height = 73
    Caption = 'Date required'
    ParentBackground = False
    TabOrder = 4
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 26
      Height = 13
      Caption = 'From:'
    end
    object Label2: TLabel
      Left = 26
      Top = 48
      Width = 16
      Height = 13
      Caption = 'To:'
    end
    object edtDateFrom: TEdit
      Left = 56
      Top = 16
      Width = 100
      Height = 21
      TabOrder = 0
      OnChange = enableOK
      OnExit = edtDateFromExit
    end
    object edtDateTo: TEdit
      Left = 56
      Top = 44
      Width = 100
      Height = 21
      TabOrder = 1
      OnChange = enableOK
      OnExit = edtDateFromExit
    end
    object btnDatefrom: TBitBtn
      Left = 168
      Top = 14
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
      Top = 42
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
    Top = 72
    Width = 219
    Height = 57
    Enabled = False
    ParentBackground = False
    TabOrder = 5
    object Label4: TLabel
      Left = 8
      Top = 12
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object edtCustomer: TEdit
      Left = 8
      Top = 27
      Width = 169
      Height = 21
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
  object OleContainer1: TOleContainer
    Left = 140
    Top = 83
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 6
    Visible = False
  end
  object pnlExportPrgrss: TPanel
    Left = 52
    Top = 79
    Width = 289
    Height = 61
    ParentBackground = False
    TabOrder = 7
    Visible = False
    object lblExporting: TLabel
      Left = 16
      Top = 12
      Width = 53
      Height = 13
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
  object btnExcel: TBitBtn
    Left = 190
    Top = 288
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Excel'
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A6000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00A407070700FF
      FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFFA407070700FF
      FFFFFFFFFFFF07FFFFFF00000000000707070707070707070707A407070700FF
      FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA407000700FF
      FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA400000700FF
      FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFF000000000000
      00000000000000000000A4070707000707070707070700070707A40707070007
      07000700070700070707A4070707000707000000070700070707A40707070007
      07000700070700070707A4A4A4A400A4A4A400A4A4A400A4A4A4}
    TabOrder = 8
    OnClick = btnExcelClick
  end
  object btnPreview: TButton
    Left = 96
    Top = 288
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'P&review'
    TabOrder = 9
    OnClick = btnPreviewClick
  end
  object rdgrpCategory: TRadioGroup
    Left = 232
    Top = 136
    Width = 105
    Height = 90
    Caption = 'Category'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'Trade'
      'Retail'
      'Commercial')
    ParentBackground = False
    TabOrder = 10
  end
  object grpbxReps: TGroupBox
    Left = 120
    Top = 8
    Width = 219
    Height = 57
    ParentBackground = False
    TabOrder = 11
    object Label3: TLabel
      Left = 8
      Top = 12
      Width = 20
      Height = 13
      Caption = 'Rep'
    end
    object cmbReps: TComboBox
      Left = 8
      Top = 27
      Width = 201
      Height = 21
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
  object rdgrpSortBy: TRadioGroup
    Left = 344
    Top = 8
    Width = 113
    Height = 121
    Caption = 'Sort by: '
    ItemIndex = 0
    Items.Strings = (
      'Sales Order'
      'Order Date'
      'Customer'
      'Status'
      'Rep')
    ParentBackground = False
    TabOrder = 12
  end
  object chkbxPageBreak: TCheckBox
    Left = 352
    Top = 144
    Width = 113
    Height = 17
    Caption = 'Page Break'
    TabOrder = 13
  end
  object chkbxShowOnlyScheduled: TCheckBox
    Left = 8
    Top = 224
    Width = 217
    Height = 17
    Caption = 'Only Show Scheduled Orders'
    TabOrder = 14
  end
  object chkbxIncludeInvoiced: TCheckBox
    Left = 8
    Top = 256
    Width = 217
    Height = 17
    Caption = 'Include Orders up to Fully Invoiced'
    TabOrder = 15
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
end
