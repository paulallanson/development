object frmWTMaintQExtra: TfrmWTMaintQExtra
  Left = 192
  Top = 107
  Caption = 'Maintain Extras'
  ClientHeight = 231
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    553
    231)
  TextHeight = 17
  object lblDelete: TLabel
    Left = 72
    Top = 184
    Width = 128
    Height = 17
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'Delete these details?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 203
    Top = 181
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOKClick
    ExplicitTop = 172
  end
  object BitBtn2: TBitBtn
    Left = 291
    Top = 181
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
    ExplicitTop = 172
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 553
    Height = 169
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 547
    object Label3: TLabel
      Left = 16
      Top = 20
      Width = 73
      Height = 17
      Caption = 'Extra charge'
    end
    object Label8: TLabel
      Left = 16
      Top = 48
      Width = 48
      Height = 17
      Caption = 'Quantity'
    end
    object Label4: TLabel
      Left = 16
      Top = 77
      Width = 56
      Height = 17
      Caption = 'Unit price'
    end
    object Label7: TLabel
      Left = 369
      Top = 77
      Width = 60
      Height = 17
      Caption = 'Total Price'
    end
    object Label1: TLabel
      Left = 16
      Top = 106
      Width = 53
      Height = 17
      Caption = 'Unit Cost'
    end
    object Label2: TLabel
      Left = 369
      Top = 106
      Width = 58
      Height = 17
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
      Left = 99
      Top = 16
      Width = 350
      Height = 25
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
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object edtQuantity: TCREditFloat
      Left = 99
      Top = 44
      Width = 60
      Height = 25
      TabOrder = 1
      Text = 'edtQuantity'
      OnChange = edtQuantityChange
    end
    object edtUnitCost: TCREditMoney
      Left = 98
      Top = 102
      Width = 81
      Height = 25
      TabOrder = 3
      OnChange = edtUnitCostChange
    end
    object edtTotalCost: TCREditMoney
      Left = 439
      Top = 102
      Width = 81
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object edtUnitPrice: TEdit
      Left = 99
      Top = 73
      Width = 81
      Height = 25
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
  object qryExtras: TFDQuery
    ConnectionName = 'wt'
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
        Name = 'Extra_Charge'
      end>
  end
  object dtsExtra: TDataSource
    DataSet = qryExtras
    Left = 288
    Top = 16
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
    Left = 328
    Top = 72
    ParamData = <
      item
        Name = 'Extra_Charge'
      end>
  end
end
