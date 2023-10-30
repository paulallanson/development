object frmPBLUReps: TfrmPBLUReps
  Left = 165
  Top = 133
  Caption = 'Reps'
  ClientHeight = 345
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 534
    Height = 287
    Align = alClient
    DataSource = dtsReps
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'Rep_Name'
        Title.Caption = 'Name'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Branch_Name'
        Title.Caption = 'Branch'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Phone'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Mobile_No'
        Title.Caption = 'Mobile No'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Email'
        Width = 91
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 326
    Width = 534
    Height = 19
    Panels = <
      item
        Width = 100
      end>
    ExplicitTop = 317
    ExplicitWidth = 528
  end
  object Panel1: TPanel
    Left = 0
    Top = 287
    Width = 534
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 278
    ExplicitWidth = 528
    DesignSize = (
      534
      39)
    object btnAdd: TButton
      Left = 187
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
      ExplicitLeft = 181
    end
    object btnDelete: TButton
      Left = 354
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Delete'
      TabOrder = 1
      OnClick = btnDeleteClick
      ExplicitLeft = 348
    end
    object btnClose: TButton
      Left = 445
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Clos&e'
      TabOrder = 2
      OnClick = btnCloseClick
      ExplicitLeft = 439
    end
    object btnChange: TButton
      Left = 271
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Change'
      TabOrder = 3
      OnClick = btnChangeClick
      ExplicitLeft = 265
    end
  end
  object qryReps: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Reps_Branches.Customer,'
      '        Reps_Branches.Branch_no,'
      '        Reps_Branches.Rep,'
      '        Reps_Branches.Percentage,'
      '        Reps_Branches.Is_Main_Rep,'
      '        Rep.Name as Rep_Name, '
      '        Rep.Phone,'
      '        Rep.Email,'
      '        Rep.Fax_Number,'
      '        Rep.Mobile_no,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer.Name as Customer_Name'
      'FROM Customer'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Rep'
      '      INNER JOIN Reps_Branches'
      '        ON Rep.Rep = Reps_Branches.Rep)'
      '        ON (Customer_Branch.Branch_no = Reps_Branches.Branch_no)'
      '        AND (Customer_Branch.Customer = Reps_Branches.Customer))'
      '        ON Customer.Customer = Customer_Branch.Customer'
      'WHERE Reps_Branches.Customer = :Customer'
      'ORDER BY Customer_Branch.Name, Is_Main_rep DESC')
    Left = 72
    Top = 40
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object dtsReps: TDataSource
    DataSet = qryReps
    OnDataChange = SetButtons
    Left = 144
    Top = 40
  end
end
