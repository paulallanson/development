object frmWTRSCustomerRFP: TfrmWTRSCustomerRFP
  Left = 436
  Top = 219
  Anchors = [akLeft, akTop, akBottom]
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Print Customer Request for Payment'
  ClientHeight = 232
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 17
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 462
    Height = 137
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 59
      Height = 17
      Caption = 'Customer:'
    end
    object Label1: TLabel
      Left = 8
      Top = 112
      Width = 90
      Height = 17
      Caption = 'Application No:'
    end
    object Label2: TLabel
      Left = 240
      Top = 112
      Width = 30
      Height = 17
      Caption = 'Date:'
    end
    object lblDateRange: TLabel
      Left = 8
      Top = 77
      Width = 68
      Height = 17
      Caption = 'Date Range'
    end
    object Label4: TLabel
      Left = 288
      Top = 77
      Width = 15
      Height = 17
      Caption = 'to:'
    end
    object Label5: TLabel
      Left = 112
      Top = 77
      Width = 31
      Height = 17
      Caption = 'from:'
    end
    object Label6: TLabel
      Left = 8
      Top = 48
      Width = 24
      Height = 17
      Caption = 'Site:'
    end
    object edtCustomerName: TEdit
      Left = 112
      Top = 12
      Width = 313
      Height = 25
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtApplicationNo: TEdit
      Left = 112
      Top = 108
      Width = 97
      Height = 25
      TabOrder = 1
      OnChange = EnableOK
    end
    object edtDate: TEdit
      Left = 279
      Top = 108
      Width = 97
      Height = 25
      TabOrder = 2
      OnChange = EnableOK
      OnExit = edtDateExit
    end
    object btnDateSel: TBitBtn
      Left = 383
      Top = 106
      Width = 25
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
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
      ParentFont = False
      TabOrder = 3
      OnClick = btnDateSelClick
    end
    object edtDateFrom: TEdit
      Left = 160
      Top = 73
      Width = 97
      Height = 25
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edtDateTo: TEdit
      Left = 304
      Top = 73
      Width = 97
      Height = 25
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object edtSiteName: TEdit
      Left = 112
      Top = 44
      Width = 313
      Height = 25
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
  end
  object pnlExportPrgrss: TPanel
    Left = 82
    Top = 41
    Width = 289
    Height = 61
    ParentBackground = False
    TabOrder = 3
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
    Left = 203
    Top = 135
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 4
    Visible = False
  end
  object pnlLabourValue: TPanel
    Left = 0
    Top = 137
    Width = 462
    Height = 47
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      462
      47)
    object Label7: TLabel
      Left = 8
      Top = 12
      Width = 76
      Height = 17
      Caption = 'Labour Value'
    end
    object memValue: TMemo
      Left = 112
      Top = 10
      Width = 89
      Height = 22
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Lines.Strings = (
        '')
      TabOrder = 0
      OnEnter = memValueEnter
      OnExit = ValidateMoney
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 184
    Width = 462
    Height = 48
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      462
      48)
    object btnPrint: TBitBtn
      Left = 9
      Top = 7
      Width = 80
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Print'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 0
      OnClick = PrintBitBtnClick
    end
    object btnPreview: TBitBtn
      Left = 97
      Top = 7
      Width = 80
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'P&review'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 1
      OnClick = PreviewBitBtnClick
    end
    object btnEmail: TBitBtn
      Left = 185
      Top = 7
      Width = 80
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Email'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 2
      OnClick = EmailBitBtnClick
    end
    object btnClose: TBitBtn
      Left = 369
      Top = 7
      Width = 80
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      NumGlyphs = 2
      TabOrder = 3
      OnClick = CancelBitBtnClick
    end
    object btnExcel: TBitBtn
      Left = 273
      Top = 7
      Width = 80
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'E&xcel'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 4
      Visible = False
      OnClick = ExcelBitBtnClick
    end
  end
  object qryGetStatement: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Last_Application_ref'
      'from Customer'
      'where Customer = :Customer')
    Left = 404
    Top = 18
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qrySetStatement: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'update sales_invoice'
      'set Application_reference = NULL,'
      'Application_date = NULL'
      'where Sales_invoice = :sales_invoice')
    Left = 404
    Top = 72
    ParamData = <
      item
        Name = 'sales_invoice'
      end>
  end
end
