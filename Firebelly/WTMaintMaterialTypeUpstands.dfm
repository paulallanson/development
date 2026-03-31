object frmWTMaintMaterialTypeUpstands: TfrmWTMaintMaterialTypeUpstands
  Left = 430
  Top = 135
  BorderStyle = bsDialog
  Caption = 'Material Composition Upstand Polish Prices'
  ClientHeight = 157
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object Label4: TLabel
    Left = 8
    Top = 52
    Width = 58
    Height = 17
    Caption = 'Cost Price'
  end
  object Label3: TLabel
    Left = 8
    Top = 84
    Width = 70
    Height = 17
    Caption = 'Selling Price'
  end
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 66
    Height = 17
    Caption = 'Description'
  end
  object edtmnyCost: TCREditMoney
    Left = 86
    Top = 48
    Width = 105
    Height = 25
    TabOrder = 0
    Text = '0.00'
  end
  object edtmnySell: TCREditMoney
    Left = 86
    Top = 80
    Width = 105
    Height = 25
    TabOrder = 1
    Text = '0.00'
  end
  object btnOK: TBitBtn
    Left = 160
    Top = 120
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 248
    Top = 120
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 3
  end
  object edtDescription: TEdit
    Left = 86
    Top = 13
    Width = 313
    Height = 25
    TabOrder = 4
    Text = 'edtDescription'
    OnChange = EnableOK
  end
  object qryUpdUpstand: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Worktop_Type_Upstand'
      'Set Description = :Description'
      'Where Price_Pointer = :Price_Pointer')
    Left = 296
    Top = 28
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Price_Pointer'
      end>
  end
  object qryAddUpstand: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'INSERT INTO Worktop_Type_Upstand (Description, Worktop_Type, ina' +
        'ctive, Price_Pointer)'
      'VALUES (:Description, :Worktop_Type, :Inactive, :Price_Pointer)')
    Left = 320
    Top = 48
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Worktop_Type'
      end
      item
        Name = 'Inactive'
      end
      item
        Name = 'Price_Pointer'
      end>
  end
end
