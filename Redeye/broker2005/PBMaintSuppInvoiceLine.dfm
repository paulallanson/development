object PBMaintSuppInvoiceLinefrm: TPBMaintSuppInvoiceLinefrm
  Left = 171
  Top = 137
  BorderStyle = bsDialog
  Caption = 'PBMaintSuppInvoiceLinefrm'
  ClientHeight = 209
  ClientWidth = 569
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
  object Panel1: TPanel
    Left = 0
    Top = 168
    Width = 569
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      569
      41)
    object lblDelete: TLabel
      Left = 248
      Top = 16
      Width = 126
      Height = 16
      Caption = 'Delete selected line'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOK: TBitBtn
      Left = 395
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Enabled = False
      TabOrder = 0
      OnClick = btnOKClick
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 483
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 569
    Height = 57
    Align = alTop
    TabOrder = 1
    object lblOrderType: TLabel
      Left = 8
      Top = 8
      Width = 73
      Height = 15
      Caption = 'lblOrderType'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblOrderNumber: TLabel
      Left = 112
      Top = 8
      Width = 73
      Height = 13
      Caption = 'lblOrderNumber'
    end
    object lblDescription: TLabel
      Left = 112
      Top = 32
      Width = 63
      Height = 13
      Caption = 'lblDescription'
    end
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 68
      Height = 15
      Caption = 'Description:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 57
    Width = 569
    Height = 111
    Align = alClient
    TabOrder = 2
    object Label2: TLabel
      Left = 5
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Quantity'
    end
    object Label4: TLabel
      Left = 5
      Top = 48
      Width = 24
      Height = 13
      Caption = 'Price'
    end
    object Label16: TLabel
      Left = 5
      Top = 80
      Width = 38
      Height = 13
      Caption = 'Nominal'
    end
    object lblPriceUnit: TLabel
      Left = 173
      Top = 48
      Width = 46
      Height = 13
      Caption = 'Price Unit'
    end
    object Label5: TLabel
      Left = 381
      Top = 48
      Width = 21
      Height = 13
      Caption = 'VAT'
    end
    object lblPacks: TLabel
      Left = 176
      Top = 16
      Width = 44
      Height = 13
      Caption = 'packs of:'
    end
    object lblCreditType: TLabel
      Left = 348
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Credit Type'
    end
    object lblVatValue: TLabel
      Left = 356
      Top = 80
      Width = 46
      Height = 13
      Caption = 'Vat Value'
    end
    object memQuantity: TMemo
      Left = 57
      Top = 8
      Width = 97
      Height = 23
      TabOrder = 0
      WantReturns = False
      WordWrap = False
      OnChange = memQuantityChange
      OnEnter = SaveValue
      OnExit = ValidateQty
      OnKeyPress = memQuantityKeyPress
    end
    object memPrice: TMemo
      Left = 57
      Top = 40
      Width = 97
      Height = 23
      Alignment = taRightJustify
      TabOrder = 1
      WantReturns = False
      WordWrap = False
      OnChange = memPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney
    end
    object dblkpPriceUnit: TDBLookupComboBox
      Left = 233
      Top = 40
      Width = 128
      Height = 21
      KeyField = 'Price_Unit'
      ListField = 'Description'
      ListSource = dsPriceUnit
      TabOrder = 2
    end
    object dblkpVat: TDBLookupComboBox
      Left = 409
      Top = 40
      Width = 145
      Height = 21
      KeyField = 'Vat_Code'
      ListField = 'Description'
      ListSource = dsVAT
      TabOrder = 3
    end
    object cmbCreditType: TComboBox
      Left = 409
      Top = 8
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnChange = cmbCreditTypeChange
      Items.Strings = (
        'Price'
        'Quantity'
        'VAT only')
    end
    object memVatValue: TMemo
      Left = 409
      Top = 72
      Width = 97
      Height = 23
      Alignment = taRightJustify
      TabOrder = 5
      WantReturns = False
      WordWrap = False
      OnChange = memPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney
    end
    object edtNominal: TMaskEdit
      Left = 56
      Top = 73
      Width = 153
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!90009999/900/000;0;_'
      MaxLength = 16
      TabOrder = 6
      OnChange = edtNominalChange
    end
  end
  object qryVAT: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from VAT_Code')
    Left = 424
    Top = 40
  end
  object qryPriceUnit: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from Price_Unit')
    Left = 256
    Top = 56
  end
  object dsVAT: TDataSource
    DataSet = qryVAT
    Left = 496
    Top = 40
  end
  object dsPriceUnit: TDataSource
    DataSet = qryPriceUnit
    Left = 296
    Top = 56
  end
end
