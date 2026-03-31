object frmWTMaintJEdge: TfrmWTMaintJEdge
  Left = 159
  Top = 142
  Caption = 'Maintain Edges'
  ClientHeight = 234
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object lblDelete: TLabel
    Left = 36
    Top = 193
    Width = 128
    Height = 17
    Caption = 'Delete these details?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 167
    Top = 190
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
    Left = 255
    Top = 190
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
    Height = 184
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 483
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 48
      Height = 17
      Caption = 'Material'
    end
    object Label2: TLabel
      Left = 16
      Top = 44
      Width = 61
      Height = 17
      Caption = 'Edge Type'
    end
    object Label3: TLabel
      Left = 16
      Top = 76
      Width = 30
      Height = 17
      Caption = 'Edge'
    end
    object Label8: TLabel
      Left = 16
      Top = 108
      Width = 39
      Height = 17
      Caption = 'Length'
    end
    object Label7: TLabel
      Left = 323
      Top = 145
      Width = 61
      Height = 17
      Caption = 'Total price'
    end
    object Label4: TLabel
      Left = 16
      Top = 145
      Width = 56
      Height = 17
      Caption = 'Unit price'
    end
    object edtMaterial: TEdit
      Left = 88
      Top = 8
      Width = 145
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object dblkpEdgeType: TDBLookupComboBox
      Left = 88
      Top = 40
      Width = 193
      Height = 25
      KeyField = 'Edge_Type'
      ListField = 'Edge_Type_Description'
      ListSource = dtsEdgeType
      TabOrder = 1
      OnClick = dblkpEdgeTypeClick
    end
    object dblkpEdge: TDBLookupComboBox
      Left = 88
      Top = 72
      Width = 345
      Height = 25
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
      Height = 25
      TabOrder = 3
      Text = 'edtLength'
      OnChange = edtLengthChange
    end
    object edtUnitPrice: TCREditMoney
      Left = 88
      Top = 141
      Width = 81
      Height = 25
      TabOrder = 4
      OnChange = edtUnitPriceChange
    end
    object edtTotalPrice: TCREditMoney
      Left = 392
      Top = 141
      Width = 81
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object btnEdge: TBitBtn
      Left = 448
      Top = 72
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
    Left = 244
    Top = 10
  end
  object dtsEdgeType: TDataSource
    DataSet = qryEdgeType
    Left = 294
    Top = 10
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
    Left = 225
    Top = 59
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
    Left = 130
    Top = 34
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
    Left = 382
    Top = 95
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
