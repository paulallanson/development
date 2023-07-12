object frmwtMaintVat: TfrmwtMaintVat
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Vat Rates'
  ClientHeight = 324
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    419
    324)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 20
    Width = 69
    Height = 13
    Caption = 'VAT Rate %'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 52
    Width = 65
    Height = 13
    Caption = 'Description'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 84
    Width = 58
    Height = 13
    Caption = 'VAT Code'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 128
    Top = 286
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    TabOrder = 0
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 286
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    NumGlyphs = 2
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
    ParentBackground = False
    Left = 16
    Top = 112
    Width = 377
    Height = 97
    Enabled = False
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
      Width = 58
      Height = 13
      Caption = 'VAT Rate %'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
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
  object qryUpdate: TQuery
    DatabaseName = 'WT'
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
        DataType = ftUnknown
        Name = 'VAT_Rate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'VAT_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Text'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reverse_Charge'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Reverse_Charge_Vat_Rate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TQuery
    DatabaseName = 'WT'
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
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryDelete: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Delete From Vat'
      'Where'
      '(Vat = :Vat)')
    Left = 240
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Vat'
        ParamType = ptUnknown
      end>
  end
  object qryGetLast: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Select Vat'
      'From Vat'
      'Where Description = :GUID')
    Left = 296
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryZero: TQuery
    DatabaseName = 'WT'
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
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Commission_Rate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Immediately'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cleared_Funds_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Use_Separate_Invoice_Seq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inv_Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Category'
        ParamType = ptUnknown
      end>
  end
end
