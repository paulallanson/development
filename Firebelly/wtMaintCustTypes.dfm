object frmWTMaintCustTypes: TfrmWTMaintCustTypes
  Left = 576
  Top = 133
  Caption = 'Customer Types'
  ClientHeight = 153
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 65
    Height = 13
    Caption = 'Description'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 8
    Top = 60
    Width = 67
    Height = 13
    Caption = 'Sales Nominal'
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 88
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 2
  end
  object btnOK: TBitBtn
    Left = 176
    Top = 112
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 264
    Top = 112
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 4
  end
  object edtDescription: TEdit
    Left = 80
    Top = 20
    Width = 257
    Height = 21
    TabOrder = 0
    Text = 'edtDescription'
    OnChange = EnableOK
  end
  object edtSalesNominal: TEdit
    Left = 104
    Top = 56
    Width = 80
    Height = 21
    TabOrder = 1
    Text = 'edtSalesNominal'
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Customer_Type'
      'SET'
      '      Description = :Description,'
      '      Sales_Nominal = :Sales_Nominal,'
      '      inActive = :inactive'
      'WHERE'
      '  Customer_Type = :Customer_Type')
    Left = 80
    Top = 40
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Sales_Nominal'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Customer_Type'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Customer_Type'
      '        (Customer_Type,'
      '        Description,'
      '        inactive)'
      'Select Max(Customer_Type)+1, :GUID, '#39'N'#39
      'From Customer_Type'
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
      'Select Customer_Type'
      'From Customer_Type'
      'Where Description = :GUID')
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
    Left = 312
    Top = 40
  end
end
