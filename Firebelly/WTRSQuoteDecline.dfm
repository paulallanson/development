object frmWTRSQuoteDecline: TfrmWTRSQuoteDecline
  Left = 197
  Top = 120
  BorderStyle = bsDialog
  Caption = 'Quote Decline Reason Report'
  ClientHeight = 385
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    430
    385)
  TextHeight = 17
  object btnPrint: TButton
    Left = 8
    Top = 348
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    TabOrder = 0
    OnClick = btnPrintClick
    ExplicitTop = 278
  end
  object Button4: TButton
    Left = 326
    Top = 348
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 1
    OnClick = Button4Click
  end
  object rdgrpReason: TRadioGroup
    Left = 8
    Top = 8
    Width = 122
    Height = 68
    Caption = 'Reasons'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'One Reason')
    ParentBackground = False
    TabOrder = 2
    OnClick = rdgrpReasonClick
  end
  object rdgrpCustomer: TRadioGroup
    Left = 8
    Top = 89
    Width = 122
    Height = 68
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
    Top = 176
    Width = 209
    Height = 105
    Caption = 'Date selection'
    ParentBackground = False
    TabOrder = 4
    object Label1: TLabel
      Left = 23
      Top = 36
      Width = 33
      Height = 17
      Caption = 'From:'
    end
    object Label2: TLabel
      Left = 33
      Top = 67
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
      Top = 63
      Width = 100
      Height = 25
      TabOrder = 1
      OnChange = enableOK
      OnExit = edtDateFromExit
    end
    object btnDatefrom: TBitBtn
      Left = 175
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
      Left = 175
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
  object grpbxReason: TGroupBox
    Left = 150
    Top = 16
    Width = 219
    Height = 62
    Enabled = False
    ParentBackground = False
    TabOrder = 5
    object Label3: TLabel
      Left = 8
      Top = 9
      Width = 95
      Height = 17
      Caption = 'Decline Reasons'
    end
    object cmbReason: TComboBox
      Left = 8
      Top = 32
      Width = 201
      Height = 25
      Style = csDropDownList
      Color = clBtnFace
      ItemIndex = 0
      TabOrder = 0
      Text = 'All Sources'
      OnClick = cmbReasonClick
      Items.Strings = (
        'All Sources')
    end
  end
  object grpbxCustomer: TGroupBox
    Left = 150
    Top = 97
    Width = 219
    Height = 62
    Enabled = False
    ParentBackground = False
    TabOrder = 6
    object Label4: TLabel
      Left = 8
      Top = 8
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
  object chkbxPageBreak: TCheckBox
    Left = 262
    Top = 303
    Width = 139
    Height = 17
    Caption = 'Page Break on Total'
    TabOrder = 7
  end
  object btnPreview: TButton
    Left = 96
    Top = 348
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Preview'
    TabOrder = 8
    OnClick = btnPreviewClick
    ExplicitTop = 278
  end
  object btnExcel: TButton
    Left = 184
    Top = 348
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Excel'
    TabOrder = 9
    OnClick = btnExcelClick
    ExplicitTop = 278
  end
  object pnlExportPrgrss: TPanel
    Left = 60
    Top = 100
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
  object OleContainer1: TOleContainer
    Left = 172
    Top = 72
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 11
    Visible = False
  end
  object rdgrpCategory: TRadioGroup
    Left = 254
    Top = 176
    Width = 131
    Height = 121
    Caption = 'Category'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'Trade'
      'Retail'
      'Commercial')
    ParentBackground = False
    TabOrder = 12
  end
  object qryReason: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Inactive_Reason'
      'where Inactive_Type = '#39'Q'#39
      'order by Inactive_Reason_Descr')
    Left = 208
    Top = 29
  end
  object dtsReason: TDataSource
    DataSet = qryReason
    Left = 264
    Top = 29
  end
end
