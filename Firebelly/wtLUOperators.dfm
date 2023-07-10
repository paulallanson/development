object frmWTLUOperators: TfrmWTLUOperators
  Left = 179
  Top = 120
  BorderStyle = bsDialog
  Caption = 'Maintain Operators'
  ClientHeight = 350
  ClientWidth = 418
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
    Width = 418
    Height = 256
    Align = alClient
    DataSource = srcOperators
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
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
    Top = 331
    Width = 418
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 256
    Width = 418
    Height = 75
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      418
      75)
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 14
      Width = 169
      Height = 17
      Caption = 'Show inactive operators'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object btnAdd: TBitBtn
      Left = 8
      Top = 42
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 90
      Top = 42
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 2
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 172
      Top = 42
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 3
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 336
      Top = 42
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 4
      OnClick = BitBtn4Click
      NumGlyphs = 2
    end
    object btnExcel: TBitBtn
      Left = 254
      Top = 42
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 5
      OnClick = btnExcelClick
    end
  end
  object srcOperators: TDataSource
    DataSet = qryOperators
    OnDataChange = srcOperatorsDataChange
    Left = 152
    Top = 120
  end
  object qryOperators: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Operator'
      
        'WHERE ((Operator_Can_Login = '#39'Y'#39') or (Operator_Can_Login = :Oper' +
        'ator_Can_Login) or (Operator_Can_Login is NULL))'
      'ORDER BY Operator_Name'
      '')
    Left = 72
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Operator_Can_Login'
        ParamType = ptUnknown
      end>
  end
  object qryDelete: TQuery
    DatabaseName = 'WT'
    Left = 232
    Top = 120
  end
end
