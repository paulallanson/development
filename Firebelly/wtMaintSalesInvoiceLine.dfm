object frmWTMaintSalesInvoiceLine: TfrmWTMaintSalesInvoiceLine
  Left = 188
  Top = 161
  BorderStyle = bsDialog
  Caption = 'Sales Invoice Line details'
  ClientHeight = 219
  ClientWidth = 518
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
    ParentBackground = False
    Left = 0
    Top = 178
    Width = 518
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      518
      41)
    object lblDelete: TLabel
      Left = 192
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
      Left = 344
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
      Left = 432
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 518
    Height = 57
    Align = alTop
    TabOrder = 1
    object lblOrderType: TLabel
      Left = 8
      Top = 8
      Width = 72
      Height = 15
      Caption = 'lblOrderType'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblOrderNumber: TLabel
      Left = 96
      Top = 8
      Width = 73
      Height = 13
      Caption = 'lblOrderNumber'
      Visible = False
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
    object edtDescription: TEdit
      Left = 96
      Top = 29
      Width = 393
      Height = 21
      TabOrder = 0
      OnChange = edtDescriptionChange
    end
  end
  object pnlDetails: TPanel
    ParentBackground = False
    Left = 0
    Top = 57
    Width = 518
    Height = 121
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
      Top = 43
      Width = 24
      Height = 13
      Caption = 'Price'
    end
    object Label16: TLabel
      Left = 5
      Top = 97
      Width = 38
      Height = 13
      Caption = 'Nominal'
    end
    object Label5: TLabel
      Left = 301
      Top = 43
      Width = 32
      Height = 13
      Caption = 'VAT %'
    end
    object lblCreditType: TLabel
      Left = 296
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Credit Type'
    end
    object lblPacks: TLabel
      Left = 176
      Top = 16
      Width = 44
      Height = 13
      Caption = 'packs of:'
    end
    object lblVatValue: TLabel
      Left = 303
      Top = 70
      Width = 46
      Height = 13
      Caption = 'Vat Value'
    end
    object lblCost: TLabel
      Left = 5
      Top = 70
      Width = 21
      Height = 13
      Caption = 'Cost'
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
    end
    object memPrice: TMemo
      Left = 57
      Top = 35
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
    object dblkpVat: TDBLookupComboBox
      Left = 361
      Top = 35
      Width = 144
      Height = 21
      KeyField = 'Vat'
      ListField = 'Description'
      ListSource = dsVAT
      TabOrder = 3
    end
    object edtNominal: TEdit
      Left = 57
      Top = 89
      Width = 96
      Height = 21
      TabOrder = 2
      OnChange = edtNominalChange
    end
    object cmbCreditType: TComboBox
      Left = 361
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
      Left = 361
      Top = 62
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
    object memCost: TMemo
      Left = 57
      Top = 62
      Width = 97
      Height = 23
      Alignment = taRightJustify
      TabOrder = 6
      WantReturns = False
      WordWrap = False
      OnChange = memPriceChange
      OnEnter = SaveValue
      OnExit = ValidateMoney
    end
  end
  object qryVAT: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * from VAT'
      'where (inactive  = '#39'N'#39' or inactive is NULL) OR Vat = :Vat'
      'Order By Vat_Rate')
    Left = 424
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Vat'
        ParamType = ptUnknown
      end>
    object qryVATVat: TIntegerField
      FieldName = 'Vat'

    end
    object qryVATVat_Rate: TFloatField
      FieldName = 'Vat_Rate'

      DisplayFormat = '0.00'
    end
    object qryVATDescription: TStringField
      FieldName = 'Description'

      Size = 40
    end
    object qryVATVat_Code: TStringField
      FieldName = 'Vat_Code'

      Size = 1
    end
  end
  object dsVAT: TDataSource
    DataSet = qryVAT
    Left = 496
    Top = 40
  end
end
