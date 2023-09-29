object frmWTRSCustomerAction: TfrmWTRSCustomerAction
  Left = 197
  Top = 120
  BorderStyle = bsDialog
  Caption = 'Sales Action Report'
  ClientHeight = 261
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    366
    261)
  TextHeight = 13
  object btnRun: TButton
    Left = 8
    Top = 224
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    TabOrder = 0
    OnClick = btnRunClick
  end
  object Button4: TButton
    Left = 272
    Top = 224
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 1
    OnClick = Button4Click
  end
  object rdgrpSalesAction: TRadioGroup
    Left = 8
    Top = 8
    Width = 105
    Height = 57
    Caption = 'Sales Action'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'One Action')
    TabOrder = 2
    OnClick = rdgrpSalesActionClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 136
    Width = 225
    Height = 73
    Caption = 'Date selection'
    TabOrder = 3
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
  object grpbxAction: TGroupBox
    Left = 120
    Top = 8
    Width = 219
    Height = 57
    Enabled = False
    TabOrder = 4
    object Label3: TLabel
      Left = 8
      Top = 12
      Width = 59
      Height = 13
      Caption = 'Sales Action'
    end
    object cmbAction: TComboBox
      Left = 8
      Top = 32
      Width = 201
      Height = 21
      Style = csDropDownList
      Color = clBtnFace
      ItemIndex = 0
      TabOrder = 0
      Text = 'All Sources'
      OnClick = cmbActionClick
      Items.Strings = (
        'All Sources')
    end
  end
  object chkbxPageBreak: TCheckBox
    Left = 240
    Top = 192
    Width = 129
    Height = 17
    Caption = 'Page Break on Total'
    TabOrder = 5
  end
  object rdgrpOperators: TRadioGroup
    Left = 8
    Top = 72
    Width = 105
    Height = 57
    Caption = 'Operator'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'One Operators')
    TabOrder = 6
    OnClick = rdgrpOperatorsClick
  end
  object grpbxOperators: TGroupBox
    Left = 120
    Top = 72
    Width = 219
    Height = 57
    Enabled = False
    TabOrder = 7
    object Label4: TLabel
      Left = 8
      Top = 12
      Width = 46
      Height = 13
      Caption = 'Operators'
    end
    object cmbOperators: TComboBox
      Left = 8
      Top = 32
      Width = 201
      Height = 21
      Style = csDropDownList
      Color = clBtnFace
      ItemIndex = 0
      TabOrder = 0
      Text = 'All Operators'
      OnClick = cmbOperatorsClick
      Items.Strings = (
        'All Operators')
    end
  end
  object Button1: TButton
    Left = 96
    Top = 224
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'P&review'
    TabOrder = 8
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 224
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Excel'
    TabOrder = 9
    OnClick = Button2Click
  end
  object OleContainer1: TOleContainer
    Left = 156
    Top = 59
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 10
    Visible = False
  end
  object pnlExportPrgrss: TPanel
    Left = 44
    Top = 87
    Width = 289
    Height = 61
    TabOrder = 11
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
  object qryAction: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Prospect_Action'
      'order by Prospect_Action_Description')
    Left = 176
    Top = 16
  end
  object dtsAction: TDataSource
    DataSet = qryAction
    Left = 240
    Top = 16
  end
  object qryOperators: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Operator'
      'order by Operator_Name')
    Left = 176
    Top = 96
  end
  object dtsOperators: TDataSource
    DataSet = qryOperators
    Left = 240
    Top = 96
  end
end
