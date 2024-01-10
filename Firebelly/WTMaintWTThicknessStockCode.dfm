object frmWTMaintWTThicknessStockCode: TfrmWTMaintWTThicknessStockCode
  Left = 588
  Top = 252
  BorderStyle = bsDialog
  Caption = 'Worktop Thickness Stock Code'
  ClientHeight = 145
  ClientWidth = 349
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
    349
    145)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 36
    Width = 56
    Height = 13
    Caption = 'Stock Code'
  end
  object edtStockCode: TEdit
    Left = 88
    Top = 32
    Width = 225
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    Text = 'EDTSTOCKCODE'
    OnChange = EnableOK
  end
  object btnOK: TBitBtn
    Left = 108
    Top = 104
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 196
    Top = 104
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    NumGlyphs = 2
  end
  object qryAdd: TQuery
    DatabaseName = 'WT'
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
        DataType = ftUnknown
        Name = 'GUID'
        ParamType = ptUnknown
      end>
  end
  object qryUpdate: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'UPDATE Stock_Item'
      'SET Stock_Code = :Stock_Code,'
      '    Stock_Description = :Stock_Description'
      'WHERE Stock_Item = :Stock_Item')
    Left = 80
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Item'
        ParamType = ptUnknown
      end>
  end
  object qryGetStockItem: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Stock_Item'
      'WHERE Stock_Item = :Stock_Item')
    Left = 288
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_Item'
        ParamType = ptUnknown
      end>
  end
  object qryZero: TQuery
    DatabaseName = 'WT'
    Left = 224
    Top = 56
  end
  object qryGetLast: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Select Stock_Item'
      'From Stock_Item'
      'Where Stock_Description = :GUID')
    Left = 160
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryUpdWT: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'UPDATE Worktop_Thickness'
      'SET Stock_Item = :Stock_Item'
      'WHERE Worktop = :Worktop AND Thickness = :Thickness')
    Left = 288
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_Item'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Worktop'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end>
  end
end
