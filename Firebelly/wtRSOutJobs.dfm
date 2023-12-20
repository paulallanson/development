object frmWTRSOutJobs: TfrmWTRSOutJobs
  Left = 197
  Top = 120
  BorderStyle = bsDialog
  Caption = 'Work in Progress Report'
  ClientHeight = 183
  ClientWidth = 486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    486
    183)
  TextHeight = 13
  object btnRun: TButton
    Left = 8
    Top = 150
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    TabOrder = 0
    OnClick = btnRunClick
  end
  object Button4: TButton
    Left = 400
    Top = 150
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
    Top = 8
    Width = 105
    Height = 57
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
    Top = 72
    Width = 225
    Height = 73
    Caption = 'Fitting Date selection'
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 29
      Height = 13
      Caption = 'From:'
    end
    object Label2: TLabel
      Left = 26
      Top = 48
      Width = 15
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
    Top = 8
    Width = 233
    Height = 57
    Enabled = False
    ParentBackground = False
    TabOrder = 4
    object Label4: TLabel
      Left = 8
      Top = 12
      Width = 49
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
  object rdgrpSortBy: TRadioGroup
    Left = 368
    Top = 8
    Width = 113
    Height = 97
    Caption = 'Sort by: '
    ItemIndex = 0
    Items.Strings = (
      'Job'
      'Fitting Date'
      'Customer'
      'Status')
    ParentBackground = False
    TabOrder = 5
  end
  object chkbxPageBreak: TCheckBox
    Left = 368
    Top = 112
    Width = 113
    Height = 17
    Caption = 'Page Break'
    TabOrder = 6
  end
  object rdgrpValueBy: TRadioGroup
    Left = 240
    Top = 72
    Width = 113
    Height = 73
    Caption = 'Value by: '
    ItemIndex = 0
    Items.Strings = (
      'Quoted Price'
      'Actual Job Price')
    ParentBackground = False
    TabOrder = 7
  end
  object Button1: TButton
    Left = 96
    Top = 150
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'P&review'
    TabOrder = 8
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 150
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Excel'
    TabOrder = 9
    OnClick = Button2Click
  end
  object OleContainer1: TOleContainer
    Left = 212
    Top = 27
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 10
    Visible = False
  end
  object pnlExportPrgrss: TPanel
    Left = 100
    Top = 55
    Width = 289
    Height = 61
    ParentBackground = False
    TabOrder = 11
    Visible = False
    object lblExporting: TLabel
      Left = 16
      Top = 12
      Width = 59
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
end
