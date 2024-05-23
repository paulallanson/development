object PBLUPartBOMFrm: TPBLUPartBOMFrm
  Left = 327
  Top = 111
  Caption = 'Bill of materials'
  ClientHeight = 380
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 339
    Width = 577
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      577
      41)
    object CloseBitBtn: TBitBtn
      Left = 486
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      NumGlyphs = 2
      TabOrder = 0
      OnClick = CloseBitBtnClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 40
      Height = 13
      Caption = 'Product'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 59
      Height = 13
      Caption = 'Description'
    end
    object lblDescription: TLabel
      Left = 72
      Top = 40
      Width = 72
      Height = 13
      Caption = 'lblDescription'
    end
    object lblProduct: TLabel
      Left = 72
      Top = 16
      Width = 53
      Height = 13
      Caption = 'lblProduct'
    end
  end
  object dbgdetails: TDBGrid
    Left = 0
    Top = 65
    Width = 472
    Height = 274
    Align = alClient
    DataSource = dtsdetails
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgdetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Composite_Part'
        Title.Caption = 'Composite Part'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Part_Description'
        Title.Caption = 'Description'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Width = 87
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 472
    Top = 65
    Width = 105
    Height = 274
    Align = alRight
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    object AddBitBtn: TBitBtn
      Left = 14
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Add'
      NumGlyphs = 2
      TabOrder = 0
      OnClick = AddBitBtnClick
    end
    object ChgBitBtn: TBitBtn
      Left = 14
      Top = 204
      Width = 75
      Height = 25
      Caption = 'Change'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 1
      OnClick = ChgBitBtnClick
    end
    object DelBitBtn: TBitBtn
      Left = 14
      Top = 240
      Width = 75
      Height = 25
      Caption = 'Delete'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 2
      OnClick = DelBitBtnClick
    end
  end
  object dtsdetails: TDataSource
    DataSet = qryGetDtls
    Left = 40
    Top = 120
  end
  object qryGetDtls: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *, Part.Part_Description'
      'from Part_Element, Part'
      'where Part_Element.Part = :Part and'
      'Composite_Part = Part.Part'
      'ORDER BY Composite_Part')
    Left = 120
    Top = 120
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into Part_Element'
      '(Part,'
      'Element_No,'
      'Composite_Part,'
      'Quantity)'
      'values'
      '(:Part,'
      ':Element_No,'
      ':Composite_Part,'
      ':Quantity)')
    Left = 184
    Top = 120
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Element_No'
      end
      item
        Name = 'Composite_Part'
      end
      item
        Name = 'Quantity'
      end>
  end
  object qryGetNext: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select max(Element_no) as Last_Element'
      'from Part_Element'
      'where Part = :Part')
    Left = 256
    Top = 120
    ParamData = <
      item
        Name = 'Part'
      end>
  end
end
