object frmWtLUThickness: TfrmWtLUThickness
  Left = 245
  Top = 155
  BorderStyle = bsDialog
  Caption = 'Thicknesses'
  ClientHeight = 368
  ClientWidth = 692
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
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 692
    Height = 280
    Align = alClient
    DataSource = srcThickness
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
        FieldName = 'Thickness_mm'
        Title.Caption = 'Thickness (mm)'
        Width = 159
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
    Top = 349
    Width = 692
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
    Top = 280
    Width = 692
    Height = 69
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      692
      69)
    object Label4: TLabel
      Left = 8
      Top = 18
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 44
      Width = 169
      Height = 17
      Caption = 'Show inactive thicknesses'
      TabOrder = 1
      OnClick = chkbxShowInactiveClick
    end
    object BitBtn1: TBitBtn
      Left = 264
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 346
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 3
      OnClick = btnEditClick
    end
    object BitBtn3: TBitBtn
      Left = 428
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      TabOrder = 4
      OnClick = BitBtn3Click
    end
    object btnExcel: TBitBtn
      Left = 510
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      TabOrder = 5
      Visible = False
      OnClick = btnExcelClick
    end
    object BitBtn4: TBitBtn
      Left = 592
      Top = 12
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 6
    end
    object edtName: TEdit
      Left = 56
      Top = 14
      Width = 177
      Height = 21
      TabOrder = 0
      OnChange = edtNameChange
    end
  end
  object srcThickness: TDataSource
    DataSet = qryThickness
    Left = 152
    Top = 104
  end
  object qryThickness: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Thickness'
      
        'WHERE ((inactive = :inactive) or (inactive is NULL) or (inactive' +
        ' = '#39'N'#39')) AND'
      '  (Thickness.Thickness_mm LIKE :Description)'
      'ORDER BY Thickness_mm'
      '')
    Left = 80
    Top = 104
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
    Left = 232
    Top = 104
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 440
    Top = 120
  end
end
