object frmWTMaintQExtra: TfrmWTMaintQExtra
  Left = 192
  Top = 107
  Width = 569
  Height = 246
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
  DesignSize = (
    561
    215)
  PixelsPerInch = 96
  TextHeight = 13
  object lblDelete: TLabel
    Left = 72
    Top = 184
    Width = 121
    Height = 13
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'Delete these details?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 203
    Top = 176
    Width = 75
    Height = 25
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 291
    Top = 176
    Width = 75
    Height = 25
    Anchors = [akLeft, akTop, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    NumGlyphs = 2
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 561
    Height = 169
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 20
      Width = 60
      Height = 13
      Caption = 'Extra charge'
    end
    object Label8: TLabel
      Left = 16
      Top = 48
      Width = 39
      Height = 13
      Caption = 'Quantity'
    end
    object Label4: TLabel
      Left = 16
      Top = 77
      Width = 45
      Height = 13
      Caption = 'Unit price'
    end
    object Label7: TLabel
      Left = 379
      Top = 77
      Width = 51
      Height = 13
      Caption = 'Total Price'
    end
    object Label1: TLabel
      Left = 16
      Top = 106
      Width = 43
      Height = 13
      Caption = 'Unit Cost'
    end
    object Label2: TLabel
      Left = 379
      Top = 106
      Width = 48
      Height = 13
      Caption = 'Total Cost'
    end
    object btnWorktops: TSpeedButton
      Left = 378
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
      Width = 281
      Height = 21
      KeyField = 'Extra_Charge'
      ListField = 'Description'
      ListSource = dtsExtra
      TabOrder = 0
      OnClick = dblkpExtrasClick
    end
    object edtTotalPrice: TCREditMoney
      Left = 439
      Top = 73
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edtQuantity: TCREditFloat
      Left = 88
      Top = 44
      Width = 60
      Height = 21
      TabOrder = 1
      Text = 'edtQuantity'
      OnChange = edtQuantityChange
    end
    object edtUnitCost: TCREditMoney
      Left = 87
      Top = 102
      Width = 81
      Height = 21
      TabOrder = 3
      OnChange = edtUnitCostChange
    end
    object edtTotalCost: TCREditMoney
      Left = 439
      Top = 102
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object edtUnitPrice: TEdit
      Left = 88
      Top = 73
      Width = 81
      Height = 21
      TabOrder = 2
      OnChange = edtUnitPriceChange
      OnEnter = edtUnitPriceEnter
      OnExit = edtUnitPriceExit
      OnKeyPress = edtUnitPriceKeyPress
    end
    object chkbxDoNotDiscount: TCheckBox
      Left = 16
      Top = 136
      Width = 249
      Height = 17
      Caption = 'Do not include in Quote Discount'
      TabOrder = 6
    end
  end
  object qryExtras: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *'
      'from Extra_Charge'
      
        'where (inactive = '#39'N'#39' or inactive is null) OR Extra_Charge = :Ex' +
        'tra_Charge'
      'Order by Description')
    Left = 248
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Extra_Charge'
        ParamType = ptUnknown
      end>
  end
  object dtsExtra: TDataSource
    DataSet = qryExtras
    Left = 288
    Top = 16
  end
  object qryOneExtra: TQuery
    DatabaseName = 'wt'
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
    Left = 328
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Extra_Charge'
        ParamType = ptUnknown
      end>
  end
end
