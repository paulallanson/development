object PBMaintSuppInvoiceLinefrm: TPBMaintSuppInvoiceLinefrm
  Left = 171
  Top = 137
  BorderStyle = bsDialog
  Caption = 'PBMaintSuppInvoiceLinefrm'
  ClientHeight = 236
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 195
    Width = 604
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 159
    ExplicitWidth = 563
    DesignSize = (
      604
      41)
    object lblDelete: TLabel
      Left = 277
      Top = 12
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
      Left = 424
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Enabled = False
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
      ExplicitLeft = 383
    end
    object BitBtn2: TBitBtn
      Left = 512
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      ExplicitLeft = 471
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 604
    Height = 57
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 563
    object lblOrderType: TLabel
      Left = 8
      Top = 8
      Width = 82
      Height = 16
      Caption = 'lblOrderType'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblOrderNumber: TLabel
      Left = 112
      Top = 8
      Width = 97
      Height = 17
      Caption = 'lblOrderNumber'
    end
    object lblDescription: TLabel
      Left = 112
      Top = 32
      Width = 80
      Height = 17
      Caption = 'lblDescription'
    end
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 75
      Height = 16
      Caption = 'Description:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 57
    Width = 604
    Height = 138
    Align = alClient
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 563
    ExplicitHeight = 102
    object Label2: TLabel
      Left = 5
      Top = 16
      Width = 48
      Height = 17
      Caption = 'Quantity'
    end
    object Label4: TLabel
      Left = 5
      Top = 48
      Width = 28
      Height = 17
      Caption = 'Price'
    end
    object Label16: TLabel
      Left = 5
      Top = 80
      Width = 49
      Height = 17
      Caption = 'Nominal'
    end
    object lblPriceUnit: TLabel
      Left = 173
      Top = 48
      Width = 55
      Height = 17
      Caption = 'Price Unit'
    end
    object Label5: TLabel
      Left = 388
      Top = 48
      Width = 21
      Height = 17
      Caption = 'VAT'
    end
    object lblPacks: TLabel
      Left = 176
      Top = 16
      Width = 52
      Height = 17
      Caption = 'packs of:'
    end
    object lblCreditType: TLabel
      Left = 343
      Top = 16
      Width = 66
      Height = 17
      Caption = 'Credit Type'
    end
    object lblVatValue: TLabel
      Left = 356
      Top = 80
      Width = 53
      Height = 17
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
      Height = 25
      KeyField = 'Price_Unit'
      ListField = 'Description'
      ListSource = dsPriceUnit
      TabOrder = 2
    end
    object dblkpVat: TDBLookupComboBox
      Left = 423
      Top = 40
      Width = 145
      Height = 25
      KeyField = 'Vat_Code'
      ListField = 'Description'
      ListSource = dsVAT
      TabOrder = 3
    end
    object cmbCreditType: TComboBox
      Left = 423
      Top = 8
      Width = 145
      Height = 25
      Style = csDropDownList
      TabOrder = 4
      OnChange = cmbCreditTypeChange
      Items.Strings = (
        'Price'
        'Quantity'
        'VAT only')
    end
    object memVatValue: TMemo
      Left = 423
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
      Height = 25
      CharCase = ecUpperCase
      EditMask = '!90009999/900/000;0;_'
      MaxLength = 16
      TabOrder = 6
      Text = ''
      OnChange = edtNominalChange
    end
  end
  object qryVAT: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from VAT_Code')
    Left = 424
    Top = 40
  end
  object qryPriceUnit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Price_Unit')
    Left = 296
    Top = 6
  end
  object dsVAT: TDataSource
    DataSet = qryVAT
    Left = 496
    Top = 40
  end
  object dsPriceUnit: TDataSource
    DataSet = qryPriceUnit
    Left = 362
    Top = 65534
  end
end
