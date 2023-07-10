object frmwtMaintAddChgs: TfrmwtMaintAddChgs
  Left = 267
  Top = 198
  Width = 385
  Height = 234
  Caption = 'Other charges'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
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
  object Label4: TLabel
    Left = 8
    Top = 52
    Width = 59
    Height = 13
    Caption = 'Cost Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 84
    Width = 72
    Height = 13
    Caption = 'Selling Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
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
    TabOrder = 5
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 168
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
    NumGlyphs = 2
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
  object lkpPriceBasis: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select * from Price_basis')
    Left = 296
    Top = 16
  end
  object dtsPriceBasis: TDataSource
    DataSet = lkpPriceBasis
    Left = 336
    Top = 16
  end
  object qryUpdate: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'UPDATE Extra_Charge'
      'SET'
      '  Description = :Description,'
      '  Do_Not_Discount = :Do_Not_Discount,'
      '  inActive = :inactive,'
      '  Allow_Bespoke_Detail = :Allow_Bespoke_Detail'
      'WHERE'
      '  Extra_Charge = :Extra_Charge')
    Left = 144
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Do_Not_Discount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Allow_Bespoke_Detail'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Extra_Charge'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Insert Into Extra_Charge'
      '        (Extra_Charge,'
      '        Description,'
      '        Price_Pointer,'
      '        inactive)'
      'Select Max(Extra_Charge)+1, :GUID, :Price_Pointer, '#39'N'#39
      'From Extra_Charge'
      ' ')
    Left = 200
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Price_Pointer'
        ParamType = ptUnknown
      end>
  end
  object qryGetLast: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Select Extra_Charge'
      'From Extra_Charge'
      'Where Description = :GUID')
    Left = 256
    Top = 104
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
      ''
      '')
    Left = 328
    Top = 104
  end
end
