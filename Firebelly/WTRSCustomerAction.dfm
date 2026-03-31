object frmWTRSCustomerAction: TfrmWTRSCustomerAction
  Left = 197
  Top = 120
  BorderStyle = bsDialog
  Caption = 'Sales Action Report'
  ClientHeight = 304
  ClientWidth = 391
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    391
    304)
  TextHeight = 17
  object btnRun: TButton
    Left = 8
    Top = 267
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    TabOrder = 0
    OnClick = btnRunClick
    ExplicitTop = 215
  end
  object Button4: TButton
    Left = 272
    Top = 267
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 1
    OnClick = Button4Click
    ExplicitTop = 215
  end
  object rdgrpSalesAction: TRadioGroup
    Left = 8
    Top = 8
    Width = 122
    Height = 68
    Caption = 'Sales Action'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'One Action')
    ParentBackground = False
    TabOrder = 2
    OnClick = rdgrpSalesActionClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 152
    Width = 225
    Height = 89
    Caption = 'Date selection'
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 27
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
      Top = 23
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
      Top = 23
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
  object grpbxAction: TGroupBox
    Left = 136
    Top = 15
    Width = 219
    Height = 60
    Enabled = False
    ParentBackground = False
    TabOrder = 4
    object Label3: TLabel
      Left = 8
      Top = 5
      Width = 70
      Height = 17
      Caption = 'Sales Action'
    end
    object cmbAction: TComboBox
      Left = 8
      Top = 25
      Width = 201
      Height = 25
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
    Left = 248
    Top = 224
    Width = 153
    Height = 17
    Caption = 'Page Break on Total'
    TabOrder = 5
  end
  object rdgrpOperators: TRadioGroup
    Left = 8
    Top = 78
    Width = 122
    Height = 68
    Caption = 'Operator'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'One Operators')
    ParentBackground = False
    TabOrder = 6
    OnClick = rdgrpOperatorsClick
  end
  object grpbxOperators: TGroupBox
    Left = 136
    Top = 86
    Width = 219
    Height = 58
    Enabled = False
    ParentBackground = False
    TabOrder = 7
    object Label4: TLabel
      Left = 8
      Top = 3
      Width = 60
      Height = 17
      Caption = 'Operators'
    end
    object cmbOperators: TComboBox
      Left = 8
      Top = 23
      Width = 201
      Height = 25
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
    Top = 267
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'P&review'
    TabOrder = 8
    OnClick = Button1Click
    ExplicitTop = 215
  end
  object Button2: TButton
    Left = 184
    Top = 267
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Excel'
    TabOrder = 9
    OnClick = Button2Click
    ExplicitTop = 215
  end
  object OleContainer1: TOleContainer
    Left = 239
    Top = 81
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 10
    Visible = False
  end
  object pnlExportPrgrss: TPanel
    Left = 66
    Top = 90
    Width = 289
    Height = 61
    ParentBackground = False
    TabOrder = 11
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
  object qryAction: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Prospect_Action'
      'order by Prospect_Action_Description')
    Left = 356
    Top = 76
  end
  object dtsAction: TDataSource
    DataSet = qryAction
    Left = 404
    Top = 44
  end
  object qryOperators: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Operator'
      'order by Operator_Name')
    Left = 348
    Top = 176
  end
  object dtsOperators: TDataSource
    DataSet = qryOperators
    Left = 380
    Top = 96
  end
end
