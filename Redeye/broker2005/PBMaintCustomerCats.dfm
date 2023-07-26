object PBMaintCustomerCatsFrm: TPBMaintCustomerCatsFrm
  Left = 531
  Top = 184
  BorderStyle = bsDialog
  Caption = 'Maintain Customer Categories'
  ClientHeight = 192
  ClientWidth = 332
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
    Left = 10
    Top = 20
    Width = 42
    Height = 13
    Caption = 'Category'
  end
  object btnOK: TBitBtn
    Left = 166
    Top = 152
    Width = 75
    Height = 25
    Enabled = False
    TabOrder = 0
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 246
    Top = 152
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object dblkpCategories: TDBLookupComboBox
    Left = 64
    Top = 16
    Width = 217
    Height = 21
    KeyField = 'Category'
    ListField = 'Description'
    ListSource = dtsCategories
    TabOrder = 2
    OnClick = CheckOK
  end
  object btnOperators: TBitBtn
    Left = 296
    Top = 14
    Width = 25
    Height = 25
    Hint = 'Maintain Operators'
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnOperatorsClick
  end
  object radType: TRadioGroup
    ParentBackground = False
    Left = 8
    Top = 56
    Width = 161
    Height = 81
    Caption = ' KPI Type '
    ItemIndex = 0
    Items.Strings = (
      'days after approval date'
      'days before required date')
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    ParentBackground = False
    Left = 176
    Top = 56
    Width = 145
    Height = 81
    TabOrder = 5
    object Label3: TLabel
      Left = 10
      Top = 20
      Width = 70
      Height = 13
      Caption = 'Minimum value'
    end
    object Label4: TLabel
      Left = 10
      Top = 52
      Width = 74
      Height = 13
      Caption = 'Maximum Value'
    end
    object spnMin: TSpinEdit
      Left = 88
      Top = 15
      Width = 49
      Height = 22
      MaxValue = 99
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object spnMax: TSpinEdit
      Left = 88
      Top = 47
      Width = 49
      Height = 22
      MaxValue = 99
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
  end
  object qryCategories: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Category.* '
      'from Category'
      
        'where Category not in (select Category from Customer_Category_KP' +
        'I where Customer = :Customer and Category <> :Category)'
      'order by Category.Description')
    Left = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Category'
        ParamType = ptUnknown
      end>
  end
  object dtsCategories: TDataSource
    DataSet = qryCategories
    Left = 248
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Customer_Category_KPI'
      '        (Customer,'
      '        Category,'
      '        Category_KPI,'
      '        KPI_Min_Value,'
      '        KPI_Max_Value)'
      'Values (:Customer,'
      '            :Category,'
      '            :Category_KPI,'
      '            :KPI_Min_Value,'
      '            :KPI_Max_Value)'
      ' '
      ' ')
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Category'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Category_KPI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KPI_Min_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'KPI_Max_Value'
        ParamType = ptUnknown
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'delete from Customer_Category_KPI'
      'where Customer = :Customer and Category = :Category')
    Left = 32
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Category'
        ParamType = ptUnknown
      end>
  end
end
