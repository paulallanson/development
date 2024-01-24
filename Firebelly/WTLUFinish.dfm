object frmWTLUFinish: TfrmWTLUFinish
  Left = 351
  Top = 165
  BorderStyle = bsDialog
  Caption = 'Worktop Finish'
  ClientHeight = 242
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 396
    Height = 158
    Align = alClient
    DataSource = srcWorktopFinish
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Description'
        Title.Caption = 'Finish Description'
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
    Top = 223
    Width = 396
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
    Top = 158
    Width = 396
    Height = 65
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      396
      65)
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 8
      Width = 169
      Height = 17
      Caption = 'Show inactive colours'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 32
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 88
      Top = 32
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 168
      Top = 32
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      TabOrder = 3
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 328
      Top = 32
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 4
    end
    object btnExcel: TBitBtn
      Left = 248
      Top = 32
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      TabOrder = 5
      OnClick = btnExcelClick
    end
  end
  object srcWorktopFinish: TDataSource
    DataSet = qryWorktopFinish
    Left = 160
    Top = 120
  end
  object qryWorktopFinish: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Worktop_Finish'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39'))'
      'ORDER BY Description'
      '')
    Left = 72
    Top = 120
    ParamData = <
      item
        Name = 'inactive'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 232
    Top = 120
  end
end
