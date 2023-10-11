object frmWTAutoPriceChange: TfrmWTAutoPriceChange
  Left = 199
  Top = 66
  BorderStyle = bsDialog
  Caption = 'Global Price changes'
  ClientHeight = 387
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object lblPriceChange: TLabel
    Left = 16
    Top = 286
    Width = 64
    Height = 13
    Caption = 'Price Change'
  end
  object Label2: TLabel
    Left = 16
    Top = 316
    Width = 68
    Height = 13
    Caption = 'Effective Date'
  end
  object Label4: TLabel
    Left = 16
    Top = 16
    Width = 64
    Height = 13
    Caption = 'Material Type'
  end
  object Label5: TLabel
    Left = 224
    Top = 316
    Width = 23
    Height = 13
    Caption = 'Time'
  end
  object rdgrpPriceChange: TRadioGroup
    Left = 16
    Top = 64
    Width = 145
    Height = 129
    Caption = 'Price Selection'
    ItemIndex = 0
    Items.Strings = (
      'Worktop Group'
      'Worktops'
      'Edge Profiles'
      'Cut Outs'
      'Additional Details'
      'Update All')
    TabOrder = 0
    OnClick = rdgrpPriceChangeClick
  end
  object BasisGroup: TRadioGroup
    Left = 16
    Top = 200
    Width = 145
    Height = 73
    Caption = 'Price Change type'
    ItemIndex = 0
    Items.Strings = (
      'Uplift price by %'
      'Reduce price by %'
      'Set specific price')
    TabOrder = 1
    OnClick = BasisGroupClick
  end
  object btnOK: TBitBtn
    Left = 104
    Top = 352
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnOKClick
    OnExit = edtChangeChange
  end
  object BitBtn2: TBitBtn
    Left = 192
    Top = 352
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 3
  end
  object dtpckEffective: TDateTimePicker
    Left = 104
    Top = 312
    Width = 105
    Height = 21
    Date = 37563.000000000000000000
    Time = 0.834117939812131200
    TabOrder = 4
  end
  object edtChange: TCREditFloat
    Left = 104
    Top = 280
    Width = 105
    Height = 21
    TabOrder = 5
    OnChange = edtChangeChange
  end
  object rdGrpWTGroups: TRadioGroup
    Left = 168
    Top = 64
    Width = 185
    Height = 57
    Caption = 'Worktop Group selection'
    ItemIndex = 0
    Items.Strings = (
      'All Groups'
      'One Group')
    TabOrder = 6
    OnClick = rdGrpWTGroupsClick
  end
  object grpbxWTGroups: TGroupBox
    Left = 168
    Top = 128
    Width = 185
    Height = 65
    TabOrder = 7
    Visible = False
    object Label3: TLabel
      Left = 10
      Top = 13
      Width = 73
      Height = 13
      Caption = 'Worktop Group'
    end
    object dblkpWTGroup: TDBLookupComboBox
      Left = 10
      Top = 29
      Width = 167
      Height = 21
      KeyField = 'Worktop_Group'
      ListField = 'Worktop_Group_Description'
      ListSource = dtsWTGroup
      TabOrder = 0
    end
  end
  object dblkpMaterialType: TDBLookupComboBox
    Left = 16
    Top = 32
    Width = 145
    Height = 21
    KeyField = 'Material_Type'
    ListField = 'Description'
    ListSource = dtsMaterial
    TabOrder = 8
    OnClick = dblkpMaterialTypeClick
  end
  object grpbxThickness: TGroupBox
    Left = 168
    Top = 200
    Width = 185
    Height = 73
    TabOrder = 9
    Visible = False
    object Label1: TLabel
      Left = 10
      Top = 13
      Width = 49
      Height = 13
      Caption = 'Thickness'
    end
    object dblkpthickness: TDBLookupComboBox
      Left = 10
      Top = 29
      Width = 167
      Height = 21
      KeyField = 'Thickness'
      ListField = 'Thickness_mm'
      ListSource = dtsThickness
      TabOrder = 0
    end
  end
  object edtTime: TMaskEdit
    Left = 252
    Top = 312
    Width = 51
    Height = 21
    EditMask = '!90:00;1;_'
    MaxLength = 5
    TabOrder = 10
    Text = '00:01'
    OnExit = edtTimeExit
  end
  object qryWorktop: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Worktop.Worktop,'
      '        Worktop.Description,'
      '        Worktop_thickness.Thickness,'
      '        Worktop_thickness.Price_pointer,'
      '        Worktop.Worktop_Group'
      'FROM Worktop'
      '      INNER JOIN Worktop_thickness ON'
      '      Worktop.Worktop = Worktop_thickness.Worktop'
      'WHERE'
      ' ((Worktop_Group = :Worktop_Group) or (:Worktop_Group = 0)) and'
      ' ((Thickness = :Thickness) or (:Thickness = 0)) and'
      '      (Material_Type = :Material_Type)'
      'order by price_pointer')
    Left = 320
    Top = 72
    ParamData = <
      item
        Name = 'Worktop_Group'
      end
      item
        Name = 'Worktop_Group'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Material_Type'
      end>
  end
  object qryPrice: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select top 1 *'
      'from prices'
      'where (Price_pointer = :Price_pointer) and'
      #9#9'(effective_date <= now())'
      'order by effective_date desc')
    Left = 320
    Top = 312
    ParamData = <
      item
        Name = 'Price_pointer'
        DataType = ftInteger
      end>
  end
  object qryEdge: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * '
      'from edge_Thickness'
      'WHERE (Material_Type = :Material_Type)'
      'order by Price_pointer')
    Left = 320
    Top = 248
    ParamData = <
      item
        Name = 'Material_Type'
      end>
  end
  object qryCutOut: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Cutout_Thickness'
      'WHERE (Material_Type = :Material_Type)'
      'order by Price_pointer')
    Left = 320
    Top = 184
    ParamData = <
      item
        Name = 'Material_Type'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Extra_Charge'
      'order by Price_pointer')
    Left = 320
    Top = 128
  end
  object qryWTGroups: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Worktop_Group'
      'where material_type = :Material_Type'
      'order by worktop_group_description')
    Left = 168
    Top = 96
    ParamData = <
      item
        Name = 'Material_Type'
      end>
  end
  object dtsWTGroup: TDataSource
    DataSet = qryWTGroups
    Left = 208
    Top = 96
  end
  object qryMaterial: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Material_Type')
    Left = 168
    Top = 8
  end
  object dtsMaterial: TDataSource
    DataSet = qryMaterial
    Left = 208
    Top = 8
  end
  object qryWTGPrices: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Worktop_Group_Prices.*'
      'FROM Worktop_Group_Prices'
      'WHERE '
      '((Worktop_Group = :Worktop_Group) or (:Worktop_Group = 0)) and'
      '((Thickness = :Thickness) or (:Thickness = 0)) and'
      '(Material_Type = :Material_Type)'
      'order by price_pointer')
    Left = 320
    Top = 16
    ParamData = <
      item
        Name = 'Worktop_Group'
      end
      item
        Name = 'Worktop_Group'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Material_Type'
      end>
  end
  object qryThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from thickness'
      'order by thickness_mm')
    Left = 168
    Top = 256
  end
  object dtsThickness: TDataSource
    DataSet = qryThickness
    Left = 208
    Top = 256
  end
end
