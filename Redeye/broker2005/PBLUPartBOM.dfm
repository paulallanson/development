object PBLUPartBOMFrm: TPBLUPartBOMFrm
  Left = 327
  Top = 111
  Width = 593
  Height = 419
  Caption = 'Bill of materials'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 344
    Width = 585
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      585
      41)
    object CloseBitBtn: TBitBtn
      Left = 494
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 0
      OnClick = CloseBitBtnClick
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 585
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Product'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object lblDescription: TLabel
      Left = 72
      Top = 40
      Width = 473
      Height = 13
      Caption = 'lblDescription'
    end
    object lblProduct: TLabel
      Left = 72
      Top = 16
      Width = 353
      Height = 13
      Caption = 'lblProduct'
    end
  end
  object dbgdetails: TDBGrid
    Left = 0
    Top = 65
    Width = 480
    Height = 279
    Align = alClient
    DataSource = dtsdetails
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
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
    Left = 480
    Top = 65
    Width = 105
    Height = 279
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
    object AddBitBtn: TBitBtn
      Left = 14
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 0
      OnClick = AddBitBtnClick
      NumGlyphs = 2
    end
    object ChgBitBtn: TBitBtn
      Left = 14
      Top = 204
      Width = 75
      Height = 25
      Caption = 'Change'
      Enabled = False
      TabOrder = 1
      OnClick = ChgBitBtnClick
      NumGlyphs = 2
    end
    object DelBitBtn: TBitBtn
      Left = 14
      Top = 240
      Width = 75
      Height = 25
      Caption = 'Delete'
      Enabled = False
      TabOrder = 2
      OnClick = DelBitBtnClick
      NumGlyphs = 2
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
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Element_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Composite_Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
end
