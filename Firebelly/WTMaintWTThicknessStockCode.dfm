object frmWTMaintWTThicknessStockCode: TfrmWTMaintWTThicknessStockCode
  Left = 588
  Top = 252
  BorderStyle = bsDialog
  Caption = 'Worktop Thickness Stock Code'
  ClientHeight = 143
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    341
    143)
  TextHeight = 17
  object Label1: TLabel
    Left = 16
    Top = 36
    Width = 66
    Height = 17
    Caption = 'Stock Code'
  end
  object edtStockCode: TEdit
    Left = 88
    Top = 32
    Width = 225
    Height = 25
    CharCase = ecUpperCase
    TabOrder = 0
    Text = 'EDTSTOCKCODE'
    OnChange = EnableOK
  end
  object btnOK: TBitBtn
    Left = 115
    Top = 102
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
  end
  object BitBtn2: TBitBtn
    Left = 196
    Top = 102
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Stock_Item'
      '        (Stock_Item,'
      '         Stock_Code,'
      '         Stock_Description)'
      'SELECT Max(Stock_Item)+1, '#39'Dummy'#39', :GUID'
      'FROM Stock_Item'
      '')
    Left = 16
    Top = 56
    ParamData = <
      item
        Name = 'GUID'
      end>
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Stock_Item'
      'SET Stock_Code = :Stock_Code,'
      '    Stock_Description = :Stock_Description'
      'WHERE Stock_Item = :Stock_Item')
    Left = 80
    Top = 56
    ParamData = <
      item
        Name = 'Stock_Code'
      end
      item
        Name = 'Stock_Description'
      end
      item
        Name = 'Stock_Item'
      end>
  end
  object qryGetStockItem: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Stock_Item'
      'WHERE Stock_Item = :Stock_Item')
    Left = 288
    Top = 56
    ParamData = <
      item
        Name = 'Stock_Item'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    Left = 224
    Top = 56
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Stock_Item'
      'From Stock_Item'
      'Where Stock_Description = :GUID')
    Left = 184
    Top = 22
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryUpdWT: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Worktop_Thickness'
      'SET Stock_Item = :Stock_Item'
      'WHERE Worktop = :Worktop AND Thickness = :Thickness')
    Left = 288
    Top = 104
    ParamData = <
      item
        Name = 'Stock_Item'
      end
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end>
  end
end
