object frmWTMaintJEdge: TfrmWTMaintJEdge
  Left = 159
  Top = 142
  Caption = 'Maintain Edges'
  ClientHeight = 179
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object lblDelete: TLabel
    Left = 32
    Top = 152
    Width = 121
    Height = 13
    Caption = 'Delete these details?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 159
    Top = 142
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 247
    Top = 142
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 1
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 489
    Height = 137
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Material'
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 52
      Height = 13
      Caption = 'Edge Type'
    end
    object Label3: TLabel
      Left = 16
      Top = 76
      Width = 25
      Height = 13
      Caption = 'Edge'
    end
    object Label8: TLabel
      Left = 16
      Top = 108
      Width = 33
      Height = 13
      Caption = 'Length'
    end
    object Label7: TLabel
      Left = 331
      Top = 108
      Width = 50
      Height = 13
      Caption = 'Total price'
    end
    object Label4: TLabel
      Left = 331
      Top = 76
      Width = 45
      Height = 13
      Caption = 'Unit price'
    end
    object edtMaterial: TEdit
      Left = 88
      Top = 8
      Width = 145
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object dblkpEdgeType: TDBLookupComboBox
      Left = 88
      Top = 40
      Width = 161
      Height = 21
      KeyField = 'Edge_Type'
      ListField = 'Edge_Type_Description'
      ListSource = dtsEdgeType
      TabOrder = 1
      OnClick = dblkpEdgeTypeClick
    end
    object dblkpEdge: TDBLookupComboBox
      Left = 88
      Top = 72
      Width = 193
      Height = 21
      KeyField = 'edge_profile'
      ListField = 'description'
      ListSource = dtsEdgeThickness
      TabOrder = 2
      OnClick = dblkpEdgeClick
    end
    object edtLength: TCREditInt
      Left = 88
      Top = 104
      Width = 89
      Height = 21
      TabOrder = 3
      Text = 'edtLength'
      OnChange = edtLengthChange
    end
    object edtUnitPrice: TCREditMoney
      Left = 392
      Top = 72
      Width = 81
      Height = 21
      TabOrder = 4
      OnChange = edtUnitPriceChange
    end
    object edtTotalPrice: TCREditMoney
      Left = 392
      Top = 104
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object btnEdge: TBitBtn
      Left = 288
      Top = 70
      Width = 25
      Height = 25
      Hint = 'maintain edge details'
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnEdgeClick
    end
  end
  object qryEdgeType: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Edge_Type')
    Left = 16
    Top = 136
  end
  object dtsEdgeType: TDataSource
    DataSet = qryEdgeType
    Left = 56
    Top = 136
  end
  object qryEdgeThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Edge_profile.Edge_profile,'
      '        Edge_profile.description,'
      '        Edge_thickness.price_pointer'
      'from Edge_thickness, Edge_profile'
      'where Edge_Thickness.Edge_Type = :Edge_Type and'
      'Material_Type = :Material_Type and'
      'Edge_thickness.Edge_profile = Edge_profile.Edge_profile'
      'order by Edge_profile.description')
    Left = 264
    Top = 8
    ParamData = <
      item
        Name = 'Edge_Type'
      end
      item
        Name = 'Material_Type'
        DataType = ftInteger
      end>
  end
  object dtsEdgeThickness: TDataSource
    DataSet = qryEdgeThickness
    Left = 296
    Top = 8
  end
  object qryOneEdgeThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Edge_profile,'
      '        Material_type,'
      '        Edge_Type,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      '         where Price_Pointer = Edge_thickness.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Price_unit'
      '         from Prices'
      '         where Price_Pointer = Edge_thickness.Price_pointer and'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'from Edge_thickness'
      'where Material_Type = :Material_type and'
      'Edge_Type = :Edge_Type and'
      'Edge_profile = :Edge_profile')
    Left = 320
    Top = 136
    ParamData = <
      item
        Name = 'Material_type'
      end
      item
        Name = 'Edge_Type'
      end
      item
        Name = 'Edge_profile'
      end>
  end
end
