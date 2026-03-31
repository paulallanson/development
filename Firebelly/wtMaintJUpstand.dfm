object frmWTMaintJUpstand: TfrmWTMaintJUpstand
  Left = 331
  Top = 166
  BorderStyle = bsDialog
  Caption = 'Maintain upstand'
  ClientHeight = 284
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    640
    284)
  TextHeight = 17
  object lblDelete: TLabel
    Left = 88
    Top = 256
    Width = 106
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Delete these details?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 244
  end
  object btnOK: TBitBtn
    Left = 222
    Top = 248
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOKClick
    ExplicitTop = 227
  end
  object BitBtn2: TBitBtn
    Left = 318
    Top = 248
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 1
    ExplicitTop = 227
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 225
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 48
      Height = 17
      Caption = 'Material'
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 50
      Height = 17
      Caption = 'Worktop'
    end
    object Label3: TLabel
      Left = 16
      Top = 73
      Width = 55
      Height = 17
      Caption = 'Thickness'
    end
    object Label4: TLabel
      Left = 437
      Top = 72
      Width = 56
      Height = 17
      Caption = 'Unit price'
    end
    object Label5: TLabel
      Left = 16
      Top = 100
      Width = 72
      Height = 17
      Caption = 'Height (mm)'
    end
    object Label6: TLabel
      Left = 16
      Top = 132
      Width = 73
      Height = 17
      Caption = 'Length (mm)'
    end
    object Label8: TLabel
      Left = 16
      Top = 164
      Width = 48
      Height = 17
      Caption = 'Quantity'
    end
    object Label7: TLabel
      Left = 437
      Top = 164
      Width = 61
      Height = 17
      Caption = 'Total price'
    end
    object Label9: TLabel
      Left = 437
      Top = 100
      Width = 82
      Height = 17
      Caption = 'Polish Price/m'
    end
    object Label10: TLabel
      Left = 16
      Top = 200
      Width = 74
      Height = 17
      Caption = 'Material Use'
    end
    object SpeedButton1: TSpeedButton
      Left = 306
      Top = 197
      Width = 23
      Height = 22
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object Label12: TLabel
      Left = 216
      Top = 100
      Width = 130
      Height = 17
      Caption = 'No. of Polished Edges'
    end
    object Label13: TLabel
      Left = 216
      Top = 132
      Width = 139
      Height = 17
      Caption = 'No. of Polished Lengths'
    end
    object Label14: TLabel
      Left = 437
      Top = 200
      Width = 106
      Height = 17
      Caption = 'Total No of Pieces'
    end
    object edtMaterial: TEdit
      Left = 104
      Top = 8
      Width = 145
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object dblkpWorktop: TDBLookupComboBox
      Left = 104
      Top = 40
      Width = 390
      Height = 25
      KeyField = 'Worktop'
      ListField = 'Description'
      ListSource = dtsWorktops
      TabOrder = 1
      OnClick = dblkpWorktopClick
    end
    object dblkpWTThickness: TDBLookupComboBox
      Left = 104
      Top = 69
      Width = 89
      Height = 25
      KeyField = 'Thickness'
      ListField = 'Thickness_mm'
      ListSource = dtsWTThickness
      TabOrder = 2
      OnClick = dblkpWTThicknessClick
    end
    object edtUnitPrice: TCREditMoney
      Left = 528
      Top = 68
      Width = 81
      Height = 25
      TabOrder = 3
      OnChange = edtDepthChange
    end
    object edtDepth: TCREditInt
      Left = 104
      Top = 96
      Width = 89
      Height = 25
      TabOrder = 5
      OnChange = edtDepthChange
    end
    object edtLength: TCREditInt
      Left = 104
      Top = 128
      Width = 89
      Height = 25
      TabOrder = 6
      OnChange = edtDepthChange
    end
    object spnQuantity: TSpinEdit
      Left = 104
      Top = 159
      Width = 49
      Height = 27
      MaxValue = 100
      MinValue = 1
      TabOrder = 7
      Value = 1
      OnChange = spnQuantityChange
    end
    object edtTotalPrice: TCREditMoney
      Left = 528
      Top = 160
      Width = 81
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 8
    end
    object edtPolishPrice: TCREditMoney
      Left = 528
      Top = 96
      Width = 81
      Height = 25
      TabOrder = 4
      OnChange = edtDepthChange
    end
    object dblkpMaterialUse: TDBLookupComboBox
      Left = 104
      Top = 196
      Width = 185
      Height = 25
      KeyField = 'Material_Use'
      ListField = 'Use_Description'
      ListSource = dtsMaterialUse
      TabOrder = 9
    end
    object spnNoOfDepths: TSpinEdit
      Left = 360
      Top = 95
      Width = 49
      Height = 27
      MaxValue = 2
      MinValue = 0
      TabOrder = 10
      Value = 0
      OnChange = spnQuantityChange
    end
    object spnNoOfLengths: TSpinEdit
      Left = 360
      Top = 127
      Width = 49
      Height = 27
      MaxValue = 2
      MinValue = 0
      TabOrder = 11
      Value = 1
      OnChange = spnQuantityChange
    end
    object spnNoOfPieces: TSpinEdit
      Left = 560
      Top = 195
      Width = 49
      Height = 27
      MaxValue = 100
      MinValue = 1
      TabOrder = 12
      Value = 1
      OnChange = spnQuantityChange
    end
  end
  object qryWorktops: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Worktop,'
      '      Description,'
      '      Not_used_for_quoting,'
      '      Material_Type,'
      '      Worktop_Group,'
      '      inactive,'
      '      Long_Description,'
      '      Short_Description,'
      '      Show_Online,'
      '      Worktop_Finish,'
      '      Image_Path,'
      '      Discount'
      'from worktop'
      'where material_type = :material_type'
      'Order by Description')
    Left = 205
    Top = 10
    ParamData = <
      item
        Name = 'material_type'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryWTThickness: TFDQuery
    MasterSource = dtsWorktops
    ConnectionName = 'wt'
    SQL.Strings = (
      'select'
      '  worktop_thickness.thickness,'
      '  Thickness.Thickness_mm'
      'from worktop_thickness, thickness'
      'where worktop = :worktop and'
      '  worktop_thickness.thickness = thickness.thickness'
      'order by thickness_mm')
    Left = 235
    Top = 91
    ParamData = <
      item
        Name = 'worktop'
      end>
  end
  object dtsWorktops: TDataSource
    DataSet = qryWorktops
    Left = 170
    Top = 18
  end
  object dtsWTThickness: TDataSource
    DataSet = qryWTThickness
    Left = 283
    Top = 65
  end
  object qryOneWTThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Worktop,'
      '        Thickness,'
      '        (select top 1 Unit_Price'
      '         from Prices'
      
        '         where Price_Pointer = Worktop_thickness.Price_pointer a' +
        'nd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Unit_Price,'
      '        (select top 1 Price_unit'
      '         from Prices'
      
        '         where Price_Pointer = Worktop_thickness.Price_pointer a' +
        'nd'
      '                effective_Date <= now()'
      '         order by effective_Date desc) as Price_Unit'
      'from Worktop_thickness'
      'where worktop = :Worktop and'
      'thickness = :Thickness')
    Left = 263
    Top = 55
    ParamData = <
      item
        Name = 'Worktop'
      end
      item
        Name = 'Thickness'
      end>
  end
  object qryMaterialUse: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Material_Use.*'
      'from Material_Use'
      
        'WHERE ((Use_Type = 0) OR (Use_Type IS NULL) OR (Use_Type = 2)) A' +
        'ND'
      
        '      (inactive = '#39'N'#39' or inactive is null) OR Material_Use = :Ma' +
        'terial_Use'
      'order by Use_Description ASC')
    Left = 210
    Top = 100
    ParamData = <
      item
        Name = 'Material_Use'
      end>
  end
  object dtsMaterialUse: TDataSource
    DataSet = qryMaterialUse
    Left = 130
    Top = 80
  end
end
