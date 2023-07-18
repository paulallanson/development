object frmWTMaintJExtra: TfrmWTMaintJExtra
  Left = 192
  Top = 107
  Width = 468
  Height = 220
  Caption = 'Maintain Extras'
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
  object lblDelete: TLabel
    Left = 8
    Top = 160
    Width = 121
    Height = 13
    Caption = 'Delete these details?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 139
    Top = 152
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 0
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 227
    Top = 152
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    NumGlyphs = 2
  end
  object pnlDetails: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 460
    Height = 145
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      Left = 16
      Top = 20
      Width = 60
      Height = 13
      Caption = 'Extra charge'
    end
    object Label8: TLabel
      Left = 16
      Top = 52
      Width = 39
      Height = 13
      Caption = 'Quantity'
    end
    object Label4: TLabel
      Left = 16
      Top = 84
      Width = 45
      Height = 13
      Caption = 'Unit price'
    end
    object Label7: TLabel
      Left = 283
      Top = 84
      Width = 50
      Height = 13
      Caption = 'Total price'
    end
    object btnWorktops: TSpeedButton
      Left = 402
      Top = 15
      Width = 23
      Height = 22
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnWorktopsClick
    end
    object dblkpExtras: TDBLookupComboBox
      Left = 88
      Top = 16
      Width = 297
      Height = 21
      KeyField = 'Extra_Charge'
      ListField = 'Description'
      ListSource = dtsExtra
      TabOrder = 0
      OnClick = dblkpExtrasClick
    end
    object edtTotalPrice: TCREditMoney
      Left = 343
      Top = 80
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edtQuantity: TCREditFloat
      Left = 88
      Top = 48
      Width = 60
      Height = 21
      TabOrder = 2
      Text = 'edtQuantity'
      OnChange = edtQuantityChange
    end
    object edtUnitPrice: TEdit
      Left = 88
      Top = 80
      Width = 81
      Height = 21
      TabOrder = 3
      OnChange = edtUnitPriceChange
      OnEnter = edtUnitPriceEnter
      OnExit = edtUnitPriceExit
      OnKeyPress = edtUnitPriceKeyPress
    end
    object chkbxDoNotDiscount: TCheckBox
      Left = 16
      Top = 120
      Width = 249
      Height = 17
      Caption = 'Do not include in Quote Discount'
      TabOrder = 4
    end
  end
  object qryExtras: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Extra_Charge'
      
        'where (inactive = '#39'N'#39' or inactive is null) OR Extra_Charge = :Ex' +
        'tra_Charge'
      'Order by Description')
    Left = 320
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Extra_Charge'
        ParamType = ptUnknown
      end>
  end
  object dtsExtra: TDataSource
    DataSet = qryExtras
    Left = 376
    Top = 96
  end
  object qryOneExtra: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select Extra_Charge, Do_Not_Discount, Price_pointer,'
      '(select top 1 Unit_Cost'
      ' from Prices'
      ' where Price_Pointer = Extra_Charge.Price_pointer and'
      '           Effective_date <= now()'
      '         order by effective_Date desc) as Unit_Cost,'
      '(select top 1 Unit_Price'
      ' from Prices'
      ' where Price_Pointer = Extra_Charge.Price_pointer and'
      '           Effective_date <= now()'
      '        order by effective_Date desc) as Unit_Price,'
      '(select top 1 Price_unit'
      '         from Prices'
      '         where Price_Pointer = Extra_Charge.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'from Extra_Charge'
      'where Extra_Charge = :Extra_Charge')
    Left = 256
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Extra_Charge'
        ParamType = ptUnknown
      end>
  end
end
