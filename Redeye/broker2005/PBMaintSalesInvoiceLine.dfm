object PBMaintSalesInvoiceLinefrm: TPBMaintSalesInvoiceLinefrm
  Left = 112
  Top = 131
  BorderStyle = bsDialog
  Caption = 'Sales Invoice Line details'
  ClientHeight = 346
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 305
    Width = 572
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      572
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
      Left = 398
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Enabled = False
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 486
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 572
    Height = 137
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object lblOrderType: TLabel
      Left = 8
      Top = 16
      Width = 60
      Height = 13
      Caption = 'lblOrderType'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblOrderNumber: TLabel
      Left = 112
      Top = 17
      Width = 73
      Height = 13
      Caption = 'lblOrderNumber'
    end
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 56
      Height = 13
      Caption = 'Description:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 224
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Product Type'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object memDescription: TMemo
      Left = 112
      Top = 48
      Width = 449
      Height = 77
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtProductType: TEdit
      Left = 305
      Top = 13
      Width = 208
      Height = 21
      ReadOnly = True
      TabOrder = 1
      OnChange = edtNominalChange
    end
    object btnProductType: TBitBtn
      Left = 528
      Top = 11
      Width = 25
      Height = 25
      Hint = 'Select Customer'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnProductTypeClick
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 137
    Width = 572
    Height = 168
    Align = alClient
    ParentBackground = False
    TabOrder = 1
    object Label2: TLabel
      Left = 5
      Top = 13
      Width = 39
      Height = 13
      Caption = 'Quantity'
    end
    object Label4: TLabel
      Left = 5
      Top = 43
      Width = 24
      Height = 13
      Caption = 'Price'
    end
    object Label16: TLabel
      Left = 5
      Top = 128
      Width = 38
      Height = 13
      Caption = 'Nominal'
    end
    object lblPriceUnit: TLabel
      Left = 173
      Top = 43
      Width = 46
      Height = 13
      Caption = 'Price Unit'
    end
    object Label5: TLabel
      Left = 381
      Top = 43
      Width = 21
      Height = 13
      Caption = 'VAT'
    end
    object lblCreditType: TLabel
      Left = 348
      Top = 13
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Credit Type'
    end
    object lblPacks: TLabel
      Left = 173
      Top = 13
      Width = 44
      Height = 13
      Caption = 'packs of:'
    end
    object lblVatValue: TLabel
      Left = 356
      Top = 74
      Width = 46
      Height = 13
      Caption = 'Vat Value'
    end
    object lblCost: TLabel
      Left = 5
      Top = 102
      Width = 21
      Height = 13
      Caption = 'Cost'
    end
    object lblResellerPrice: TLabel
      Left = 5
      Top = 64
      Width = 44
      Height = 33
      AutoSize = False
      Caption = 'Reseller Price'
      WordWrap = True
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
      Top = 38
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
    object dblkpNominal: TDBLookupComboBox
      Left = 57
      Top = 124
      Width = 145
      Height = 21
      KeyField = 'Nominal'
      ListField = 'Nominal; Nominal_Description'
      TabOrder = 9
    end
    object dblkpPriceUnit: TDBLookupComboBox
      Left = 233
      Top = 39
      Width = 128
      Height = 21
      KeyField = 'Price_Unit'
      ListField = 'Description'
      ListSource = dsPriceUnit
      TabOrder = 2
    end
    object dblkpVat: TDBLookupComboBox
      Left = 409
      Top = 39
      Width = 145
      Height = 21
      KeyField = 'Vat_Code'
      ListField = 'Description'
      ListSource = dsVAT
      TabOrder = 7
    end
    object cmbCreditType: TComboBox
      Left = 409
      Top = 9
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 6
      OnChange = cmbCreditTypeChange
      Items.Strings = (
        'Price'
        'Quantity'
        'VAT only')
    end
    object memVatValue: TMemo
      Left = 409
      Top = 69
      Width = 97
      Height = 23
      Alignment = taRightJustify
      TabOrder = 8
      WantReturns = False
      WordWrap = False
      OnChange = memPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney
    end
    object memCost: TMemo
      Left = 57
      Top = 97
      Width = 97
      Height = 23
      Alignment = taRightJustify
      TabOrder = 4
      WantReturns = False
      WordWrap = False
      OnChange = memPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney
    end
    object cmbInvoiceType: TComboBox
      Left = 409
      Top = 124
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 10
      OnChange = cmbInvoiceTypeChange
      Items.Strings = (
        'Standard'
        'VAT only')
    end
    object edtNominal: TMaskEdit
      Left = 57
      Top = 124
      Width = 153
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!90009999/900/000;0;_'
      MaxLength = 16
      TabOrder = 5
      Text = ''
      OnChange = edtNominalChange
    end
    object memResellerPrice: TMemo
      Left = 57
      Top = 69
      Width = 97
      Height = 23
      Alignment = taRightJustify
      TabOrder = 3
      WantReturns = False
      WordWrap = False
      OnChange = memPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney
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
    Left = 216
    Top = 56
  end
  object qryNominal: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Rep_Nominal'
      'where Rep = :Rep')
    Left = 96
    Top = 152
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
  object dsNominal: TDataSource
    DataSet = qryNominal
    Left = 232
    Top = 224
  end
end
