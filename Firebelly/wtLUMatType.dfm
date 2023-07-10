object frmWTLUMatType: TfrmWTLUMatType
  Left = 430
  Top = 100
  BorderStyle = bsDialog
  Caption = 'Material Types'
  ClientHeight = 414
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 686
    Height = 308
    Align = alClient
    DataSource = srcMatType
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
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
        Width = 272
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
    Top = 395
    Width = 686
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
    Top = 308
    Width = 686
    Height = 87
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      686
      87)
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 56
      Width = 169
      Height = 17
      Caption = 'Show inactive material types'
      TabOrder = 1
      OnClick = chkbxShowInactiveClick
    end
    object BitBtn1: TBitBtn
      Left = 272
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 352
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 3
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 432
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      TabOrder = 4
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 592
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 5
      NumGlyphs = 2
    end
    object btnExcel: TBitBtn
      Left = 512
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      TabOrder = 6
      OnClick = btnExcelClick
    end
    object edtName: TEdit
      Left = 56
      Top = 20
      Width = 177
      Height = 21
      TabOrder = 0
      OnChange = edtNameChange
    end
  end
  object srcMatType: TDataSource
    DataSet = qryMatType
    Left = 168
    Top = 56
  end
  object qryMatType: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Material_Type'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39')) AND'
      '  (Material_Type.Description LIKE :Description)'
      'ORDER BY Description')
    Left = 104
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
  object qryDelete: TQuery
    DatabaseName = 'WT'
    Left = 240
    Top = 56
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 440
    Top = 120
  end
end
