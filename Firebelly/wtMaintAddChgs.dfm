object frmwtMaintAddChgs: TfrmwtMaintAddChgs
  Left = 267
  Top = 198
  Caption = 'Other charges'
  ClientHeight = 212
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 20
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
  object Label4: TLabel
    Left = 8
    Top = 52
    Width = 51
    Height = 13
    Caption = 'Cost Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 84
    Width = 63
    Height = 13
    Caption = 'Selling Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtmnyCost: TCREditMoney
    Left = 88
    Top = 48
    Width = 105
    Height = 21
    TabOrder = 1
    Text = '0.00'
    OnChange = EnableOK
  end
  object edtmnySell: TCREditMoney
    Left = 88
    Top = 80
    Width = 105
    Height = 21
    TabOrder = 2
    Text = '0.00'
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 168
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 168
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 6
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 144
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 4
  end
  object chkbxDoNotDiscount: TCheckBox
    Left = 8
    Top = 118
    Width = 233
    Height = 17
    Caption = 'Do not include in discounting'
    TabOrder = 3
  end
  object edtDescription: TEdit
    Left = 88
    Top = 16
    Width = 225
    Height = 21
    TabOrder = 0
    Text = 'edtDescription'
    OnChange = EnableOK
  end
  object lkpPriceBasis: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from Price_basis')
    Left = 34
    Top = 28
  end
  object dtsPriceBasis: TDataSource
    DataSet = lkpPriceBasis
    Left = 84
    Top = 28
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Extra_Charge'
      'SET'
      '  Description = :Description,'
      '  Do_Not_Discount = :Do_Not_Discount,'
      '  inActive = :inactive,'
      '  Allow_Bespoke_Detail = :Allow_Bespoke_Detail'
      'WHERE'
      '  Extra_Charge = :Extra_Charge')
    Left = 148
    Top = 50
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Do_Not_Discount'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Allow_Bespoke_Detail'
      end
      item
        Name = 'Extra_Charge'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Extra_Charge'
      '        (Extra_Charge,'
      '        Description,'
      '        Price_Pointer,'
      '        inactive)'
      'Select Max(Extra_Charge)+1, :GUID, :Price_Pointer, '#39'N'#39
      'From Extra_Charge'
      ' ')
    Left = 218
    Top = 50
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Price_Pointer'
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Extra_Charge'
      'From Extra_Charge'
      'Where Description = :GUID')
    Left = 288
    Top = 50
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
      ''
      '')
    Left = 74
    Top = 138
  end
end
