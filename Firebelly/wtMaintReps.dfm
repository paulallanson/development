object frmWTMaintReps: TfrmWTMaintReps
  Left = 306
  Top = 143
  BorderStyle = bsDialog
  Caption = 'Reps details'
  ClientHeight = 237
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    374
    237)
  TextHeight = 13
  object lblName: TLabel
    Left = 8
    Top = 20
    Width = 51
    Height = 13
    Caption = 'Rep Name'
  end
  object Label1: TLabel
    Left = 8
    Top = 140
    Width = 44
    Height = 13
    Caption = 'Customer'
  end
  object lblCommissionRate: TLabel
    Left = 8
    Top = 79
    Width = 76
    Height = 13
    Caption = 'Commission rate'
  end
  object Label3: TLabel
    Left = 8
    Top = 52
    Width = 73
    Height = 13
    Caption = 'Commision type'
  end
  object lblCommissionPerc: TLabel
    Left = 184
    Top = 80
    Width = 8
    Height = 13
    Caption = '%'
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 199
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 199
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 5
  end
  object chkbxIsCustomer: TCheckBox
    Left = 8
    Top = 114
    Width = 121
    Height = 17
    Caption = 'Rep is a customer'
    TabOrder = 1
    OnClick = chkbxIsCustomerClick
  end
  object cmbCommissionType: TComboBox
    Left = 104
    Top = 48
    Width = 201
    Height = 21
    TabOrder = 0
    OnChange = EnableOK
    OnClick = cmbCommissionTypeClick
    Items.Strings = (
      'Paid on profit'
      'Paid on sales value'
      'Fixed Amount per invoice')
  end
  object edtCustomerName: TEdit
    Left = 104
    Top = 136
    Width = 225
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object btnCustomerSearch: TBitBtn
    Left = 338
    Top = 135
    Width = 22
    Height = 22
    Hint = 'Search for Customer'
    Caption = '...'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 3
    OnClick = btnCustomerSearchClick
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 178
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 6
  end
  object edtRepName: TEdit
    Left = 104
    Top = 16
    Width = 225
    Height = 21
    TabOrder = 7
    Text = 'edtRepName'
    OnChange = EnableOK
  end
  object edtCommissionRate: TCREditFloat
    Left = 104
    Top = 75
    Width = 73
    Height = 21
    TabOrder = 8
    Text = 'edtCommissionRate'
  end
  object qryGetCustomer: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Customer_Name'
      'from Customer where Customer = :Customer')
    Left = 312
    Top = 112
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Rep'
      'SET'
      '  Rep_Name = :Rep_Name,'
      '  Rep_Is_Customer = :Rep_Is_Customer,'
      '  Customer = :Customer,'
      '  Commission_Rate = :Commission_Rate,'
      '  Commission_Type = :Commission_Type,'
      '  inActive = :inactive'
      'WHERE'
      '  Rep = :Rep')
    Left = 80
    Top = 40
    ParamData = <
      item
        Name = 'Rep_Name'
      end
      item
        Name = 'Rep_Is_Customer'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Commission_Rate'
      end
      item
        Name = 'Commission_Type'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Rep'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Rep'
      '        (Rep,'
      '        Rep_Name,'
      '        inactive)'
      'Select Max(Rep)+1, :GUID, '#39'N'#39
      'From Rep'
      ' ')
    Left = 136
    Top = 40
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Rep'
      'From Rep'
      'Where Rep_Name = :GUID')
    Left = 248
    Top = 40
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
    Left = 312
    Top = 40
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
