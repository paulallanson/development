object PBMaintSuppInvoiceChgsfrm: TPBMaintSuppInvoiceChgsfrm
  Left = 136
  Top = 143
  ActiveControl = edtdetails
  BorderStyle = bsDialog
  Caption = 'Additional charge details'
  ClientHeight = 177
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object lblDelete: TLabel
    Left = 144
    Top = 152
    Width = 133
    Height = 16
    Caption = 'Delete these charges'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 299
    Top = 144
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    TabOrder = 0
    OnClick = btnOKClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 387
    Top = 144
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object pnlDetails: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 475
    Height = 137
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Details'
    end
    object Label2: TLabel
      Left = 8
      Top = 45
      Width = 24
      Height = 13
      Caption = 'Price'
    end
    object Label3: TLabel
      Left = 8
      Top = 76
      Width = 21
      Height = 13
      Caption = 'VAT'
    end
    object Nominal: TLabel
      Left = 272
      Top = 76
      Width = 38
      Height = 13
      Caption = 'Nominal'
    end
    object Label4: TLabel
      Left = 8
      Top = 108
      Width = 74
      Height = 13
      Caption = 'Purchase Order'
    end
    object edtdetails: TEdit
      Left = 96
      Top = 8
      Width = 369
      Height = 21
      TabOrder = 0
      OnChange = CheckOK
    end
    object memPrice: TMemo
      Left = 96
      Top = 40
      Width = 89
      Height = 23
      Alignment = taRightJustify
      TabOrder = 1
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = memPriceEnter
      OnExit = memPriceExit
    end
    object dblkpVat: TDBLookupComboBox
      Left = 96
      Top = 72
      Width = 153
      Height = 21
      KeyField = 'Vat_Code'
      ListField = 'Description'
      ListSource = dsVAT
      TabOrder = 2
      OnClick = CheckOK
    end
    object edtNominal: TMaskEdit
      Left = 320
      Top = 72
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!90009999/900/000;0;_'
      MaxLength = 16
      TabOrder = 3
      OnChange = CheckOK
    end
    object cmbPurchaseOrders: TComboBox
      Left = 96
      Top = 104
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 4
      OnChange = CheckOK
    end
  end
  object qryVAT: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from VAT_Code')
    Left = 256
    Top = 32
  end
  object dsVAT: TDataSource
    DataSet = qryVAT
    Left = 296
    Top = 32
  end
end
