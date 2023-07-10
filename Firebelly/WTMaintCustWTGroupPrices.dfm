object frmWTMaintCustWTGroupPrices: TfrmWTMaintCustWTGroupPrices
  Left = 468
  Top = 176
  Anchors = [akLeft, akBottom]
  BorderStyle = bsDialog
  Caption = 'Customer Contract Group Prices'
  ClientHeight = 213
  ClientWidth = 322
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
    322
    213)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 24
    Top = 27
    Width = 49
    Height = 13
    Caption = 'Thickness'
  end
  object Label5: TLabel
    Left = 24
    Top = 128
    Width = 88
    Height = 13
    Caption = 'Selling Price/ sq m'
  end
  object Label4: TLabel
    Left = 24
    Top = 60
    Width = 78
    Height = 13
    Caption = 'Cost Price/ sq m'
  end
  object Label15: TLabel
    Left = 24
    Top = 93
    Width = 47
    Height = 13
    Caption = 'Markup %'
  end
  object dblkpThickness: TDBLookupComboBox
    Left = 120
    Top = 23
    Width = 105
    Height = 21
    KeyField = 'Thickness'
    ListField = 'Thickness_mm'
    ListSource = srclkpThickness
    TabOrder = 0
    OnClick = EnableOK
  end
  object edtmnySell: TCREditMoney
    Left = 120
    Top = 124
    Width = 88
    Height = 21
    TabOrder = 3
    Text = '0.00'
    OnChange = edtmnySellChange
    OnEnter = edtmnySellEnter
    OnExit = edtmnySellExit
  end
  object btnOK: TBitBtn
    Left = 71
    Top = 170
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
    Left = 165
    Top = 170
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
    NumGlyphs = 2
  end
  object edtmnyCost: TCREditMoney
    Left = 120
    Top = 56
    Width = 89
    Height = 21
    TabOrder = 1
    Text = '0.00'
    OnChange = edtmnyCostChange
  end
  object edtMarkupPercentage: TCREditMoney
    Left = 120
    Top = 88
    Width = 89
    Height = 21
    TabOrder = 2
    Text = '0.00'
    OnChange = edtMarkupPercentageChange
    OnEnter = edtMarkupPercentageEnter
    OnExit = edtMarkupPercentageExit
  end
  object lkpThickness: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select *'
      'from Thickness'
      'where (thickness not in (select thickness'
      '                        from Customer_worktop_group_Thick'
      '                        where Customer = :Customer and'
      '                              Group_Number = :Group_Number)) and'
      
        '      ((inactive = '#39'N'#39') or (inactive = '#39#39') or (inactive is NULL)' +
        ') or'
      '      Thickness = :thickness'
      'order by thickness_mm')
    Left = 264
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'thickness'
        ParamType = ptUnknown
      end>
  end
  object srclkpThickness: TDataSource
    DataSet = lkpThickness
    Left = 264
    Top = 64
  end
  object qryAdd: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'INSERT INTO Customer_Worktop_Group_Thick'
      '('
      '  Customer,'
      '  Group_Number,'
      '  Thickness,'
      '  Price_Pointer,'
      '  Markup_Percentage'
      ')'
      'VALUES'
      '('
      '  :Customer,'
      '  :Group_Number,'
      '  :Thickness,'
      '  :Price_Pointer,'
      '  :Markup_Percentage'
      ')'
      '')
    Left = 184
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'price_pointer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Markup_Percentage'
        ParamType = ptUnknown
      end>
  end
  object qryUpdate: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'UPDATE Customer_Worktop_Group_Thick'
      'SET Markup_Percentage = :Markup_Percentage'
      'WHERE   Customer = :Customer AND'
      '        Group_NUmber = :Group_Number AND'
      '        Thickness = :Thickness'
      '')
    Left = 264
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Markup_Percentage'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end>
  end
end
