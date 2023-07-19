object frmWTMaintCustTypes: TfrmWTMaintCustTypes
  Left = 576
  Top = 133
  Width = 372
  Height = 192
  Caption = 'Customer Types'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
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
    Font.Name = 'MS Sans Serif'
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
    TabOrder = 3
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 264
    Top = 112
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
    NumGlyphs = 2
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
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Nominal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer_Type'
        ParamType = ptUnknown
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
        DataType = ftString
        Name = 'GUID'
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
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    Left = 312
    Top = 40
  end
end
