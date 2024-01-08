object frmwtMaintVat: TfrmwtMaintVat
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Vat Rates'
  ClientHeight = 323
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    415
    323)
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 20
    Width = 58
    Height = 13
    Caption = 'VAT Rate %'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 52
    Width = 59
    Height = 13
    Caption = 'Description'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 84
    Width = 49
    Height = 13
    Caption = 'VAT Code'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 128
    Top = 285
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 285
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 1
  end
  object chkbxInactive: TCheckBox
    Left = 16
    Top = 240
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 2
  end
  object grpbxReverseCharge: TGroupBox
    Left = 16
    Top = 112
    Width = 377
    Height = 97
    Enabled = False
    ParentBackground = False
    TabOrder = 3
    object Label4: TLabel
      Left = 8
      Top = 28
      Width = 59
      Height = 13
      Caption = 'Invoice Text'
    end
    object Label5: TLabel
      Left = 8
      Top = 60
      Width = 56
      Height = 13
      Caption = 'VAT Rate %'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtInvoiceText: TEdit
      Left = 80
      Top = 24
      Width = 281
      Height = 21
      TabOrder = 0
      Text = 'edtInvoiceText'
    end
    object edtRCVateRate: TCREditFloat
      Left = 80
      Top = 56
      Width = 80
      Height = 21
      TabOrder = 1
      Text = 'edtVatRate'
      OnChange = EnableOK
    end
  end
  object chkbxReverseCharge: TCheckBox
    Left = 24
    Top = 109
    Width = 97
    Height = 17
    Caption = 'Reverse Charge'
    TabOrder = 4
    OnClick = chkbxReverseChargeClick
  end
  object edtVatRate: TCREditFloat
    Left = 96
    Top = 16
    Width = 80
    Height = 21
    TabOrder = 5
    Text = 'edtVatRate'
    OnChange = EnableOK
  end
  object edtDescription: TEdit
    Left = 96
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'edtDescription'
    OnChange = EnableOK
  end
  object edtVatCode: TEdit
    Left = 96
    Top = 80
    Width = 80
    Height = 21
    TabOrder = 7
    Text = 'edtVatCode'
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Vat'
      'SET'
      '      Vat_Rate = :VAT_Rate,'
      '      Description = :Description,'
      '      Vat_Code = :VAT_Code,'
      '      Invoice_Text = :Invoice_Text,'
      '      Reverse_Charge = :Reverse_Charge,'
      '      Reverse_Charge_Vat_Rate = :Reverse_Charge_Vat_Rate,'
      '      inActive = :inactive'
      'WHERE'
      '  Vat = :Vat')
    Left = 128
    Top = 224
    ParamData = <
      item
        Name = 'VAT_Rate'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'VAT_Code'
      end
      item
        Name = 'Invoice_Text'
      end
      item
        Name = 'Reverse_Charge'
      end
      item
        Name = 'Reverse_Charge_Vat_Rate'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Vat'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Vat'
      '        (Vat, Vat_Rate,'
      '        Description)'
      'Select Max(Vat)+1, 0.00, :GUID'
      'From Vat'
      ' ')
    Left = 184
    Top = 224
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Delete From Vat'
      'Where'
      '(Vat = :Vat)')
    Left = 240
    Top = 224
    ParamData = <
      item
        Name = 'Vat'
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Vat'
      'From Vat'
      'Where Description = :GUID')
    Left = 296
    Top = 224
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Category'
      'Set     Description = :Description,'
      '        Commission_rate = :Commission_Rate,'
      '        lnvoice_immediately = :Invoice_Immediately,'
      '        Cleared_Funds_Required = :Cleared_Funds_Required,'
      '        Use_Separate_Invoice_Seq = :Use_Separate_Invoice_Seq,'
      '        Inv_Narrative = :Inv_Narrative'
      'Where'
      '(Category = :Category) '
      '')
    Left = 360
    Top = 224
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Commission_Rate'
      end
      item
        Name = 'Invoice_Immediately'
      end
      item
        Name = 'Cleared_Funds_Required'
      end
      item
        Name = 'Use_Separate_Invoice_Seq'
      end
      item
        Name = 'Inv_Narrative'
      end
      item
        Name = 'Category'
      end>
  end
end
