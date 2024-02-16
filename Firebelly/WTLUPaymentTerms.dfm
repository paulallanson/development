object frmWTLUPaymentTerms: TfrmWTLUPaymentTerms
  Left = 473
  Top = 172
  BorderStyle = bsDialog
  Caption = 'Payment Terms'
  ClientHeight = 317
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 511
    Height = 248
    Align = alClient
    DataSource = srcPaymentTerms
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Payment_Terms_Description'
        Title.Caption = 'Payment Terms'
        Width = 219
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 248
    Width = 511
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      511
      50)
    object btnAdd: TBitBtn
      Left = 16
      Top = 15
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 106
      Top = 15
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 196
      Top = 15
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 376
      Top = 15
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 3
      OnClick = BitBtn4Click
    end
    object btnExcel: TBitBtn
      Left = 286
      Top = 15
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 4
      OnClick = btnExcelClick
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 298
    Width = 511
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object srcPaymentTerms: TDataSource
    DataSet = qryPaymentTerms
    OnDataChange = srcPaymentTermsDataChange
    Left = 136
    Top = 120
  end
  object qryPaymentTerms: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Payment_Terms'
      'ORDER BY Payment_Terms_Description'
      '')
    Left = 64
    Top = 120
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 200
    Top = 120
  end
end
