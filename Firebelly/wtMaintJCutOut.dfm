object frmWtMaintJCutOut: TfrmWtMaintJCutOut
  Left = 200
  Top = 117
  BorderStyle = bsDialog
  Caption = 'Maintain Cutouts'
  ClientHeight = 235
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object lblDelete: TLabel
    Left = 40
    Top = 200
    Width = 106
    Height = 13
    Caption = 'Delete these details?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 171
    Top = 192
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
    Left = 259
    Top = 192
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
    Width = 491
    Height = 186
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 42
      Height = 13
      Caption = 'Material'
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 50
      Height = 13
      Caption = 'Thickness'
    end
    object Label3: TLabel
      Left = 16
      Top = 76
      Width = 36
      Height = 13
      Caption = 'Cutout'
    end
    object Label8: TLabel
      Left = 16
      Top = 108
      Width = 44
      Height = 13
      Caption = 'Quantity'
    end
    object Label4: TLabel
      Left = 16
      Top = 139
      Width = 50
      Height = 13
      Caption = 'Unit price'
    end
    object Label7: TLabel
      Left = 331
      Top = 139
      Width = 53
      Height = 13
      Caption = 'Total price'
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
      Width = 145
      Height = 21
      KeyField = 'Edge_Type'
      ListField = 'Edge_Type_Description'
      ListSource = dtsEdgeType
      TabOrder = 1
      OnClick = dblkpEdgeTypeClick
    end
    object dblkpCutOut: TDBLookupComboBox
      Left = 88
      Top = 72
      Width = 350
      Height = 21
      KeyField = 'cutout'
      ListField = 'description'
      ListSource = dtsCOThickness
      TabOrder = 2
      OnClick = dblkpCutOutClick
    end
    object spnQuantity: TSpinEdit
      Left = 88
      Top = 103
      Width = 65
      Height = 22
      MaxValue = 1000
      MinValue = 1
      TabOrder = 3
      Value = 1
      OnChange = spnQuantityChange
    end
    object edtUnitPrice: TCREditMoney
      Left = 88
      Top = 135
      Width = 81
      Height = 21
      TabOrder = 4
      OnChange = edtUnitPriceChange
    end
    object edtTotalPrice: TCREditMoney
      Left = 392
      Top = 135
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 5
    end
    object btnCutOuts: TBitBtn
      Left = 448
      Top = 71
      Width = 25
      Height = 25
      Hint = 'maintain cut out details'
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
      OnClick = btnCutOutsClick
    end
  end
  object qryEdgeType: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Edge_Type')
    Left = 9
    Top = 19
  end
  object dtsEdgeType: TDataSource
    DataSet = qryEdgeType
    Left = 72
    Top = 19
  end
  object qryCOThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  cutout.cutout,'
      '        cutout.description,'
      '        cutout_thickness.price_pointer'
      'from Cutout_thickness, cutout'
      'where CutOut_Thickness.Edge_Type = :Edge_Type and'
      'Material_Type = :Material_Type and'
      'CutOut_thickness.cutout = cutout.cutout'
      'order by cutout.description')
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
  object qryOneCOThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  CutOut,'
      '        Material_type,'
      '        Edge_Type,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      
        '         where Price_Pointer = CutOut_thickness.Price_pointer an' +
        'd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Price_unit'
      '         from Prices'
      
        '         where Price_Pointer = CutOut_thickness.Price_pointer an' +
        'd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'from Cutout_thickness'
      'where Material_Type = :Material_type and'
      'Edge_Type = :Edge_Type and'
      'cutout = :cutout')
    Left = 436
    Top = 11
    ParamData = <
      item
        Name = 'Material_type'
      end
      item
        Name = 'Edge_Type'
      end
      item
        Name = 'cutout'
      end>
  end
  object dtsCOThickness: TDataSource
    DataSet = qryCOThickness
    Left = 296
    Top = 8
  end
end
