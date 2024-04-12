object frmWTMaintWorktopThicknessSlab: TfrmWTMaintWorktopThicknessSlab
  Left = 307
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Maintain Slab Sizes'
  ClientHeight = 319
  ClientWidth = 480
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
    480
    319)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 33
    Height = 13
    Caption = 'Length'
  end
  object Label3: TLabel
    Left = 8
    Top = 92
    Width = 29
    Height = 13
    Caption = 'Depth'
  end
  object Label2: TLabel
    Left = 187
    Top = 56
    Width = 16
    Height = 13
    Caption = 'mm'
  end
  object Label4: TLabel
    Left = 187
    Top = 96
    Width = 16
    Height = 13
    Caption = 'mm'
  end
  object Label5: TLabel
    Left = 8
    Top = 132
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label6: TLabel
    Left = 8
    Top = 172
    Width = 56
    Height = 13
    Caption = 'Stock Code'
  end
  object Label7: TLabel
    Left = 8
    Top = 204
    Width = 84
    Height = 13
    Caption = 'Stock Description'
  end
  object Label8: TLabel
    Left = 8
    Top = 16
    Width = 41
    Height = 13
    Caption = 'Worktop'
  end
  object lblWorktopDescription: TLabel
    Left = 104
    Top = 16
    Width = 104
    Height = 13
    Caption = 'lblWorktopDescription'
  end
  object btnOK: TBitBtn
    Left = 162
    Top = 266
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 0
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 242
    Top = 266
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    NumGlyphs = 2
  end
  object edtLength: TCREditInt
    Left = 104
    Top = 48
    Width = 80
    Height = 21
    TabOrder = 2
    Text = 'edtLength'
    OnChange = EnableOK
  end
  object edtDepth: TCREditInt
    Left = 104
    Top = 88
    Width = 80
    Height = 21
    TabOrder = 3
    Text = 'edtDepth'
    OnChange = EnableOK
  end
  object edtSlabSizeDescription: TEdit
    Left = 104
    Top = 128
    Width = 185
    Height = 21
    TabOrder = 4
    Text = 'edtSlabSizeDescription'
    OnChange = EnableOK
  end
  object edtStockCode: TEdit
    Left = 104
    Top = 168
    Width = 185
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 5
    Text = 'EDTSTOCKCODE'
    OnChange = edtStockCodeChange
  end
  object edtStockDescription: TEdit
    Left = 104
    Top = 200
    Width = 353
    Height = 21
    TabOrder = 6
    Text = 'edtStockCode'
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Worktop_Thickness_Slab_Size'
      'SET'
      '  Slab_Size_Description = :Slab_Size_Description,'
      '  Length = :Length,'
      '  Depth = :Depth,'
      '  Stock_Item = :Stock_Item'
      'WHERE'
      '  Slab_Size_ID = :Slab_Size_ID')
    Left = 256
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Slab_Size_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Length'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Depth'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Stock_Item'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Slab_Size_ID'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Worktop_Thickness_Slab_Size'
      '( Slab_Size_Description,'
      '  Length,'
      '  Depth,'
      '  Worktop,'
      '  Thickness,'
      '  Stock_Item'
      ')'
      'Values'
      '( :Slab_Size_Description,'
      '  :Length,'
      '  :Depth,'
      '  :Worktop,'
      '  :Thickness,'
      '  :Stock_Item'
      ')')
    Left = 256
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Slab_Size_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Length'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Depth'
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
      end
      item
        DataType = ftInteger
        Name = 'Stock_Item'
        ParamType = ptUnknown
      end>
  end
  object qryAddStock: TFDQuery
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
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'GUID'
        ParamType = ptUnknown
      end>
  end
  object qryUpdStock: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Stock_Item'
      'SET Stock_Code = :Stock_Code,'
      '    Stock_Description = :Stock_Description'
      'WHERE Stock_Item = :Stock_Item')
    Left = 80
    Top = 184
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
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Stock_Item'
      'From Stock_Item'
      'Where Stock_Description = :GUID')
    Left = 248
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    Left = 288
    Top = 184
  end
  object qryCheckStockItem: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1 Stock_Item.Stock_Item'
      'FROM Stock_Item'
      'WHERE Stock_Item.Stock_Code = :Stock_Code')
    Left = 344
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_Code'
        ParamType = ptUnknown
      end>
  end
end
