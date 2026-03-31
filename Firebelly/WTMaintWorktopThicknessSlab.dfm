object frmWTMaintWorktopThicknessSlab: TfrmWTMaintWorktopThicknessSlab
  Left = 307
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Maintain Slab Sizes'
  ClientHeight = 302
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    494
    302)
  TextHeight = 17
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 39
    Height = 17
    Caption = 'Length'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 92
    Width = 35
    Height = 17
    Caption = 'Depth'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 202
    Top = 56
    Width = 22
    Height = 17
    Caption = 'mm'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 202
    Top = 96
    Width = 22
    Height = 17
    Caption = 'mm'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 132
    Width = 66
    Height = 17
    Caption = 'Description'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 172
    Width = 66
    Height = 17
    Caption = 'Stock Code'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 204
    Width = 101
    Height = 17
    Caption = 'Stock Description'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 8
    Top = 16
    Width = 50
    Height = 17
    Caption = 'Worktop'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblWorktopDescription: TLabel
    Left = 119
    Top = 16
    Width = 130
    Height = 17
    Caption = 'lblWorktopDescription'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 162
    Top = 249
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ModalResult = 1
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 0
    OnClick = btnOKClick
    ExplicitTop = 266
  end
  object BitBtn2: TBitBtn
    Left = 242
    Top = 249
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ModalResult = 2
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 266
  end
  object edtLength: TCREditInt
    Left = 119
    Top = 48
    Width = 80
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'edtLength'
    OnChange = EnableOK
  end
  object edtDepth: TCREditInt
    Left = 119
    Top = 88
    Width = 80
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = 'edtDepth'
    OnChange = EnableOK
  end
  object edtSlabSizeDescription: TEdit
    Left = 119
    Top = 128
    Width = 185
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 'edtSlabSizeDescription'
    OnChange = EnableOK
  end
  object edtStockCode: TEdit
    Left = 119
    Top = 168
    Width = 185
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = 'EDTSTOCKCODE'
    OnChange = edtStockCodeChange
  end
  object edtStockDescription: TEdit
    Left = 119
    Top = 200
    Width = 353
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
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
        Name = 'Slab_Size_Description'
      end
      item
        Name = 'Length'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'Stock_Item'
        DataType = ftInteger
      end
      item
        Name = 'Slab_Size_ID'
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
        Name = 'Slab_Size_Description'
      end
      item
        Name = 'Length'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Stock_Item'
        DataType = ftInteger
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
        Name = 'GUID'
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
        Name = 'Stock_Code'
      end
      item
        Name = 'Stock_Description'
      end
      item
        Name = 'Stock_Item'
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
        Name = 'GUID'
        DataType = ftString
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
        Name = 'Stock_Code'
      end>
  end
end
