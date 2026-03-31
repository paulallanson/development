object frmWTMaintSalesInvoiceLine: TfrmWTMaintSalesInvoiceLine
  Left = 188
  Top = 161
  BorderStyle = bsDialog
  Caption = 'Sales Invoice Line details'
  ClientHeight = 219
  ClientWidth = 531
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
    Top = 178
    Width = 531
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 169
    ExplicitWidth = 512
    DesignSize = (
      531
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
      Left = 339
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Enabled = False
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
      ExplicitLeft = 320
    end
    object BitBtn2: TBitBtn
      Left = 438
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      ExplicitLeft = 419
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 531
    Height = 57
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 512
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
      Visible = False
    end
    object lblOrderNumber: TLabel
      Left = 96
      Top = 8
      Width = 97
      Height = 17
      Caption = 'lblOrderNumber'
      Visible = False
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
    object edtDescription: TEdit
      Left = 96
      Top = 29
      Width = 410
      Height = 25
      TabOrder = 0
      OnChange = edtDescriptionChange
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 57
    Width = 531
    Height = 121
    Align = alClient
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 512
    ExplicitHeight = 112
    object Label2: TLabel
      Left = 5
      Top = 12
      Width = 48
      Height = 17
      Caption = 'Quantity'
    end
    object Label4: TLabel
      Left = 5
      Top = 39
      Width = 28
      Height = 17
      Caption = 'Price'
    end
    object Label16: TLabel
      Left = 5
      Top = 92
      Width = 49
      Height = 17
      Caption = 'Nominal'
    end
    object Label5: TLabel
      Left = 289
      Top = 39
      Width = 36
      Height = 17
      Caption = 'VAT %'
    end
    object lblCreditType: TLabel
      Left = 289
      Top = 12
      Width = 66
      Height = 17
      Caption = 'Credit Type'
    end
    object lblPacks: TLabel
      Left = 169
      Top = 12
      Width = 52
      Height = 17
      Caption = 'packs of:'
    end
    object lblVatValue: TLabel
      Left = 289
      Top = 65
      Width = 53
      Height = 17
      Caption = 'Vat Value'
    end
    object lblCost: TLabel
      Left = 5
      Top = 65
      Width = 26
      Height = 17
      Caption = 'Cost'
    end
    object memQuantity: TMemo
      Left = 64
      Top = 9
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
      Left = 64
      Top = 36
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
      Width = 145
      Height = 25
      KeyField = 'Vat'
      ListField = 'Description'
      ListSource = dsVAT
      TabOrder = 3
    end
    object edtNominal: TEdit
      Left = 64
      Top = 89
      Width = 97
      Height = 25
      TabOrder = 2
      OnChange = edtNominalChange
    end
    object cmbCreditType: TComboBox
      Left = 361
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
      Left = 64
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
    Connection = dtmdlWorktops.dtbsWorktops
    SQL.Strings = (
      'select * from VAT'
      'where (inactive  = '#39'N'#39' or inactive is NULL) OR Vat = :Vat'
      'Order By Vat_Rate')
    Left = 232
    ParamData = <
      item
        Name = 'Vat'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryVATVat: TIntegerField
      FieldName = 'Vat'
      Origin = 'Vat'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVATVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
      Origin = 'Vat_Rate'
      Required = True
    end
    object qryVATDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Required = True
      Size = 40
    end
    object qryVATVat_Code: TWideStringField
      FieldName = 'Vat_Code'
      Origin = 'Vat_Code'
      Size = 2
    end
  end
  object dsVAT: TDataSource
    DataSet = qryVAT
    Left = 208
  end
end
