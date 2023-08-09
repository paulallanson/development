object frmWTMaintWTThickness: TfrmWTMaintWTThickness
  Left = 207
  Top = 151
  BorderStyle = bsDialog
  Caption = 'Worktop thickness prices'
  ClientHeight = 230
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 55
    Width = 49
    Height = 13
    Caption = 'Thickness'
  end
  object Label2: TLabel
    Left = 24
    Top = 16
    Width = 53
    Height = 13
    Caption = 'Worktop:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 120
    Width = 58
    Height = 13
    Caption = 'Selling Price'
  end
  object Label4: TLabel
    Left = 24
    Top = 88
    Width = 48
    Height = 13
    Caption = 'Cost Price'
  end
  object Label5: TLabel
    Left = 224
    Top = 88
    Width = 61
    Height = 13
    Caption = 'per sq. metre'
  end
  object Label6: TLabel
    Left = 224
    Top = 120
    Width = 58
    Height = 13
    Caption = 'per sq.metre'
  end
  object lblWorktop: TLabel
    Left = 104
    Top = 16
    Width = 62
    Height = 13
    Caption = 'lblWorktop'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dblkpThickness: TDBLookupComboBox
    Left = 104
    Top = 47
    Width = 105
    Height = 21
    KeyField = 'Thickness'
    ListField = 'Thickness_mm'
    ListSource = srclkpThickness
    TabOrder = 0
    OnClick = EnableOK
  end
  object btnOK: TBitBtn
    Left = 200
    Top = 192
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 288
    Top = 192
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 4
  end
  object edtmnyCost: TCREditMoney
    Left = 104
    Top = 80
    Width = 105
    Height = 21
    TabOrder = 1
    Text = '0.00'
  end
  object edtmnySell: TCREditMoney
    Left = 104
    Top = 112
    Width = 105
    Height = 21
    TabOrder = 2
    Text = '0.00'
  end
  object chkbxInactive: TCheckBox
    Left = 24
    Top = 160
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 5
  end
  object lkpThickness: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Thickness'
      'where thickness not in '
      '(select thickness '
      ' from worktop_thickness '
      ' where worktop = :worktop) and'
      
        '(Thickness.inactive = '#39'N'#39' or Thickness.inactive is null) or Thic' +
        'kness.Thickness = :Thickness'
      'order by thickness_mm')
    Left = 232
    Top = 16
    ParamData = <
      item
        Name = 'worktop'
      end
      item
        Name = 'Thickness'
      end>
  end
  object srclkpThickness: TDataSource
    DataSet = lkpThickness
    Left = 312
    Top = 16
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'UPDATE Worktop_Thickness'
      'SET inactive = :inactive'
      'WHERE Price_Pointer = :Price_Pointer')
    Left = 312
    Top = 72
    ParamData = <
      item
        Name = 'inactive'
      end
      item
        Name = 'price_pointer'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'INSERT INTO Worktop_Thickness'
      '('
      '  Worktop,'
      '  Thickness,'
      '  Price_Pointer,'
      '  inactive'
      ')'
      'VALUES'
      '('
      '  :Worktop,'
      '  :Thickness,'
      '  :Price_Pointer,'
      '  :inactive'
      ')'
      '')
    Left = 232
    Top = 72
    ParamData = <
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'price_pointer'
      end
      item
        Name = 'inactive'
      end>
  end
end
