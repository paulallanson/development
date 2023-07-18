object frmwtLUVat: TfrmwtLUVat
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'VAT rates'
  ClientHeight = 276
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 420
    Height = 183
    Align = alClient
    DataSource = srcVat
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Description'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vat_Rate'
        Title.Caption = 'Rate'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inactive'
        Visible = False
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 257
    Width = 420
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 258
    ExplicitWidth = 424
  end
  object Panel1: TPanel
    Left = 0
    Top = 183
    Width = 420
    Height = 74
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 184
    ExplicitWidth = 424
    DesignSize = (
      420
      74)
    object BitBtn1: TBitBtn
      Left = 8
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 89
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 170
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 340
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 3
      OnClick = BitBtn4Click
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 17
      Width = 169
      Height = 17
      Caption = 'Show inactive vat rates'
      TabOrder = 4
      OnClick = chkbxShowInactiveClick
    end
    object btnExcel: TBitBtn
      Left = 254
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      TabOrder = 5
      OnClick = btnExcelClick
    end
  end
  object srcVat: TDataSource
    DataSet = qryVat
    Left = 192
    Top = 64
  end
  object qryVat: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Vat'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39'))'
      'ORDER BY Description')
    Left = 136
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end>
    object qryVatDescription: TStringField
      FieldName = 'Description'
    end
    object qryVatVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
      DisplayFormat = '0.000'
    end
    object qryVatinactive: TStringField
      FieldName = 'inactive'
      Size = 1
    end
    object qryVatVat: TIntegerField
      FieldName = 'Vat'
    end
    object qryVatVat_Code: TStringField
      FieldName = 'Vat_Code'
      Size = 10
    end
    object qryVatInvoice_Text: TStringField
      FieldName = 'Invoice_Text'
      Size = 100
    end
    object qryVatReverse_Charge: TStringField
      FieldName = 'Reverse_Charge'
      Size = 1
    end
    object qryVatReverse_Charge_Vat_Rate: TFloatField
      FieldName = 'Reverse_Charge_Vat_Rate'
    end
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 304
    Top = 72
  end
end
