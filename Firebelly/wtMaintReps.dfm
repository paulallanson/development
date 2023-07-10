object frmWTMaintReps: TfrmWTMaintReps
  Left = 306
  Top = 143
  BorderStyle = bsDialog
  Caption = 'Reps details'
  ClientHeight = 238
  ClientWidth = 378
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
    378
    238)
  PixelsPerInch = 96
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
    Top = 200
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 4
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 200
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
    NumGlyphs = 2
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
    ItemHeight = 13
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
    ParentFont = False
    TabOrder = 3
    OnClick = btnCustomerSearchClick
    NumGlyphs = 2
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
  object qryGetCustomer: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select Customer_Name'
      'from Customer where Customer = :Customer')
    Left = 312
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryUpdate: TQuery
    DatabaseName = 'WT'
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
        DataType = ftUnknown
        Name = 'Rep_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep_Is_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Commission_Rate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Commission_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TQuery
    DatabaseName = 'WT'
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
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryGetLast: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Select Rep'
      'From Rep'
      'Where Rep_Name = :GUID')
    Left = 248
    Top = 40
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
    Left = 312
    Top = 40
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
