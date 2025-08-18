object frmWTLUOperators: TfrmWTLUOperators
  Left = 179
  Top = 120
  BorderStyle = bsDialog
  Caption = 'Maintain Operators'
  ClientHeight = 376
  ClientWidth = 442
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
    Width = 442
    Height = 271
    Align = alClient
    DataSource = srcOperators
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
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Operator_Name'
        Title.Caption = 'Operator'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Login_Name'
        Title.Caption = 'Login Name'
        Width = 115
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
    Top = 357
    Width = 442
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
    ExplicitTop = 322
    ExplicitWidth = 412
  end
  object Panel1: TPanel
    Left = 0
    Top = 271
    Width = 442
    Height = 86
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 256
    ExplicitWidth = 418
    DesignSize = (
      442
      86)
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object chkbxShowInactive: TCheckBox
      Left = 281
      Top = 14
      Width = 152
      Height = 17
      Caption = 'Show inactive operators'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object btnAdd: TBitBtn
      Left = 8
      Top = 53
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 1
      OnClick = btnAddClick
      ExplicitTop = 42
    end
    object btnEdit: TBitBtn
      Left = 90
      Top = 53
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 2
      OnClick = btnEditClick
      ExplicitTop = 42
    end
    object btnDelete: TBitBtn
      Left = 172
      Top = 53
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 3
      OnClick = btnDeleteClick
      ExplicitTop = 42
    end
    object BitBtn4: TBitBtn
      Left = 358
      Top = 55
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 4
      OnClick = BitBtn4Click
    end
    object btnExcel: TBitBtn
      Left = 254
      Top = 53
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 5
      OnClick = btnExcelClick
      ExplicitTop = 42
    end
    object edtName: TEdit
      Left = 56
      Top = 12
      Width = 177
      Height = 21
      TabOrder = 6
      OnChange = edtNameChange
    end
  end
  object srcOperators: TDataSource
    DataSet = qryOperators
    OnDataChange = srcOperatorsDataChange
    Left = 152
    Top = 120
  end
  object qryOperators: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Operator'
      
        'WHERE ((Operator_Can_Login = '#39'Y'#39') or (Operator_Can_Login = :Oper' +
        'ator_Can_Login) or (Operator_Can_Login is NULL)) AND'
      #9#9'(Operator_Name LIKE :Description)'
      'ORDER BY Operator_Name')
    Left = 72
    Top = 120
    ParamData = <
      item
        Name = 'Operator_Can_Login'
        ParamType = ptInput
      end
      item
        Name = 'DESCRIPTION'
        ParamType = ptInput
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 232
    Top = 120
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 232
    Top = 24
  end
end
