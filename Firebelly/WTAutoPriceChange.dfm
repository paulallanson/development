object frmWTAutoPriceChange: TfrmWTAutoPriceChange
  Left = 199
  Top = 66
  BorderStyle = bsDialog
  Caption = 'Global Price changes'
  ClientHeight = 442
  ClientWidth = 376
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    376
    442)
  TextHeight = 17
  object lblPriceChange: TLabel
    Left = 18
    Top = 330
    Width = 76
    Height = 17
    Caption = 'Price Change'
  end
  object Label2: TLabel
    Left = 18
    Top = 360
    Width = 79
    Height = 17
    Caption = 'Effective Date'
  end
  object Label4: TLabel
    Left = 16
    Top = 11
    Width = 79
    Height = 17
    Caption = 'Material Type'
  end
  object Label5: TLabel
    Left = 226
    Top = 360
    Width = 28
    Height = 17
    Caption = 'Time'
  end
  object rdgrpPriceChange: TRadioGroup
    Left = 16
    Top = 64
    Width = 145
    Height = 154
    Caption = 'Price Selection'
    ItemIndex = 0
    Items.Strings = (
      'Worktop Group'
      'Worktops'
      'Edge Profiles'
      'Cut Outs'
      'Additional Details'
      'Update All')
    ParentBackground = False
    TabOrder = 0
    OnClick = rdgrpPriceChangeClick
  end
  object BasisGroup: TRadioGroup
    Left = 16
    Top = 224
    Width = 145
    Height = 90
    Caption = 'Price Change type'
    ItemIndex = 0
    Items.Strings = (
      'Uplift price by %'
      'Reduce price by %'
      'Set specific price')
    ParentBackground = False
    TabOrder = 1
    OnClick = BasisGroupClick
  end
  object btnOK: TBitBtn
    Left = 106
    Top = 404
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnOKClick
    OnExit = edtChangeChange
  end
  object BitBtn2: TBitBtn
    Left = 194
    Top = 404
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 3
  end
  object dtpckEffective: TDateTimePicker
    Left = 106
    Top = 356
    Width = 105
    Height = 25
    Date = 37563.000000000000000000
    Time = 0.834117939812131200
    TabOrder = 4
  end
  object edtChange: TCREditFloat
    Left = 106
    Top = 324
    Width = 105
    Height = 25
    TabOrder = 5
    OnChange = edtChangeChange
  end
  object rdGrpWTGroups: TRadioGroup
    Left = 167
    Top = 64
    Width = 185
    Height = 67
    Caption = 'Worktop Group selection'
    ItemIndex = 0
    Items.Strings = (
      'All Groups'
      'One Group')
    ParentBackground = False
    TabOrder = 6
    OnClick = rdGrpWTGroupsClick
  end
  object grpbxWTGroups: TGroupBox
    Left = 167
    Top = 153
    Width = 185
    Height = 65
    ParentBackground = False
    TabOrder = 7
    Visible = False
    object Label3: TLabel
      Left = 10
      Top = 7
      Width = 91
      Height = 17
      Caption = 'Worktop Group'
    end
    object dblkpWTGroup: TDBLookupComboBox
      Left = 10
      Top = 29
      Width = 167
      Height = 25
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
    Height = 25
    KeyField = 'Material_Type'
    ListField = 'Description'
    ListSource = dtsMaterial
    TabOrder = 8
    OnClick = dblkpMaterialTypeClick
  end
  object grpbxThickness: TGroupBox
    Left = 168
    Top = 231
    Width = 185
    Height = 73
    ParentBackground = False
    TabOrder = 9
    Visible = False
    object Label1: TLabel
      Left = 10
      Top = 8
      Width = 55
      Height = 17
      Caption = 'Thickness'
    end
    object dblkpthickness: TDBLookupComboBox
      Left = 10
      Top = 29
      Width = 167
      Height = 25
      KeyField = 'Thickness'
      ListField = 'Thickness_mm'
      ListSource = dtsThickness
      TabOrder = 0
    end
  end
  object edtTime: TMaskEdit
    Left = 260
    Top = 357
    Width = 51
    Height = 25
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
    Left = 312
    Top = 98
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
    Left = 112
    Top = 286
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
    Left = 312
    Top = 294
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
    Left = 312
    Top = 342
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
    Left = 312
    Top = 168
  end
  object qryWTGroups: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Worktop_Group'
      'where material_type = :Material_Type'
      'order by worktop_group_description')
    Left = 234
    Top = 80
    ParamData = <
      item
        Name = 'Material_Type'
      end>
  end
  object dtsWTGroup: TDataSource
    DataSet = qryWTGroups
    Left = 276
    Top = 72
  end
  object qryMaterial: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Material_Type'
      'WHERE Inactive = '#39'N'#39
      'ORDER BY Description')
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
    Left = 312
    Top = 28
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
    Left = 135
    Top = 312
  end
  object dtsThickness: TDataSource
    DataSet = qryThickness
    Left = 199
    Top = 284
  end
end
