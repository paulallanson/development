object frmWTMaintMaterialTypeWeight: TfrmWTMaintMaterialTypeWeight
  Left = 378
  Top = 186
  Width = 341
  Height = 195
  Caption = 'Maintain Material Thickness Weights'
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
    Left = 16
    Top = 32
    Width = 74
    Height = 13
    Caption = 'Thickness (mm)'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 79
    Height = 13
    Caption = 'Weight (kg)/sqm'
  end
  object btnOK: TBitBtn
    Left = 88
    Top = 112
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
    Left = 176
    Top = 112
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    NumGlyphs = 2
  end
  object dblkpThickness: TDBLookupComboBox
    Left = 112
    Top = 32
    Width = 100
    Height = 21
    KeyField = 'Thickness'
    ListField = 'Thickness_mm'
    ListSource = dtsThickness
    TabOrder = 2
    OnClick = EnableOK
  end
  object edtWeight: TCREditMoney
    Left = 112
    Top = 60
    Width = 100
    Height = 21
    TabOrder = 3
    Text = '0.00'
    OnChange = EnableOK
  end
  object qryThickness: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select *'
      'from Thickness'
      'where thickness not in '
      '(select thickness '
      ' from Worktop_Type_Thickness'
      ' where Worktop_Type = :Worktop_Type) and'
      
        '(Thickness.inactive = '#39'N'#39' or Thickness.inactive is null) or Thic' +
        'kness.Thickness = :Thickness'
      'order by thickness_mm')
    Left = 224
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Worktop_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end>
  end
  object dtsThickness: TDataSource
    DataSet = qryThickness
    Left = 288
    Top = 24
  end
  object qryAdd: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'INSERT INTO Worktop_Type_Thickness'
      '('
      'Worktop_type,'
      'Thickness,'
      'Weight_kg'
      ')'
      'VALUES'
      '('
      ':Worktop_type,'
      ':Thickness,'
      ':Weight_kg'
      ')')
    Left = 224
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Worktop_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Weight_kg'
        ParamType = ptUnknown
      end>
  end
  object qryUpdate: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'UPDATE Worktop_Type_Thickness'
      'SET Weight_Kg = :Weight_kg'
      'WHERE Worktop_Type_Thickness.ID = :ID')
    Left = 224
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Weight_kg'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
end
