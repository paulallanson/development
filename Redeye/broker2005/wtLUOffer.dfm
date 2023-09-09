object frmwtLUOffer: TfrmwtLUOffer
  Left = 409
  Top = 158
  BorderStyle = bsDialog
  Caption = 'Offers'
  ClientHeight = 326
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 424
    Height = 233
    Align = alClient
    DataSource = srcSaleOffer
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
        Width = 256
        Visible = True
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 307
    Width = 424
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 233
    Width = 424
    Height = 74
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      424
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
      Width = 233
      Height = 17
      Caption = 'Show inactive offers'
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
  object srcSaleOffer: TDataSource
    DataSet = tblSalesOffer
    Left = 216
    Top = 64
  end
  object tblSalesOffer: TFDTable
    Filtered = True
    ConnectionName = 'WT'
    TableName = 'Sales_Offer'
    Left = 96
    Top = 64
  end
  object qryDelete: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'delete from Sale_Offer'
      'where Sale_Offer = :Sale_Offer')
    Left = 344
    Top = 64
    ParamData = <
      item
        Name = 'Sale_Offer'
      end>
  end
end
