object frmwtMaintDiscounts: TfrmwtMaintDiscounts
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Discount'
  ClientHeight = 197
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
    197)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 71
    Height = 13
    Caption = 'Discount Label'
  end
  object Label3: TLabel
    Left = 16
    Top = 60
    Width = 24
    Height = 13
    Caption = 'Type'
  end
  object Label2: TLabel
    Left = 16
    Top = 96
    Width = 36
    Height = 13
    Caption = 'Amount'
  end
  object btnOK: TBitBtn
    Left = 84
    Top = 159
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
    Left = 164
    Top = 159
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
    NumGlyphs = 2
  end
  object chkbxInactive: TCheckBox
    Left = 16
    Top = 128
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 3
  end
  object edtDiscountLabel: TEdit
    Left = 104
    Top = 20
    Width = 185
    Height = 21
    TabOrder = 0
    Text = 'edtDiscountLabel'
    OnChange = EnableOK
  end
  object edtAmount: TCREditFloat
    Left = 104
    Top = 92
    Width = 81
    Height = 21
    TabOrder = 2
    Text = 'edtAmount'
  end
  object dblkpDiscountType: TComboBox
    Left = 104
    Top = 56
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'dblkpDiscountType'
    OnChange = EnableOK
    Items.Strings = (
      'Fixed'
      'Percentage')
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Discount'
      'SET'
      '      Discount_Label = :Discount_Label,'
      '      Discount_Type = :Discount_Type,'
      '      Amount = :Amount,'
      '      inActive = :inactive'
      'WHERE'
      '  Discount = :Discount')
    Left = 80
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Discount_Label'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Discount_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Discount'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Discount'
      '('
      '        Discount_Label,'
      '        Discount_Type,'
      '        Amount,'
      '        inactive'
      ')'
      'Values'
      '('
      '        :Discount_Label,'
      '        :Discount_Type,'
      '        :Amount,'
      '        :inactive'
      ')'
      ' ')
    Left = 136
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Discount_Label'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Discount_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select max(Discount) as Discount'
      'From Discount')
    Left = 200
    Top = 40
  end
end
