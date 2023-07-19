object frmWTLUCutOuts: TfrmWTLUCutOuts
  Left = 275
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Cut Outs'
  ClientHeight = 365
  ClientWidth = 726
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
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 346
    Width = 726
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
    ParentBackground = False
    Left = 0
    Top = 259
    Width = 726
    Height = 87
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      726
      87)
    object Label4: TLabel
      Left = 16
      Top = 16
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object btnAdd: TBitBtn
      Left = 280
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 368
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 456
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 632
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 3
      NumGlyphs = 2
    end
    object chkbxShowInactive: TCheckBox
      Left = 16
      Top = 66
      Width = 169
      Height = 17
      Caption = 'Show inactive cut outs'
      TabOrder = 4
      OnClick = chkbxShowInactiveClick
    end
    object btnExcel: TBitBtn
      Left = 544
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      TabOrder = 5
      OnClick = btnExcelClick
    end
    object chkbxShowOnline: TCheckBox
      Left = 16
      Top = 45
      Width = 169
      Height = 17
      Caption = 'Show only online cut outs'
      TabOrder = 6
      OnClick = chkbxShowInactiveClick
    end
    object edtName: TEdit
      Left = 64
      Top = 12
      Width = 177
      Height = 21
      TabOrder = 7
      OnChange = edtNameChange
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 726
    Height = 259
    Align = alClient
    DataSource = srcCutOuts
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
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
        Width = 422
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Include_in_Sink_List'
        Title.Caption = 'Online/Sink'
        Visible = True
      end>
  end
  object srcCutOuts: TDataSource
    DataSet = qryCutOut
    Left = 136
    Top = 168
  end
  object qryCutOut: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM CutOut'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39')) AND'
      '  (CutOut.Description LIKE :Description)'
      'ORDER BY Description'
      '')
    Left = 64
    Top = 168
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
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 224
    Top = 168
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 440
    Top = 120
  end
end
