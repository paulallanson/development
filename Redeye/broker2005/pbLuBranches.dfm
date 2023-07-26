object frmpbluBranches: TfrmpbluBranches
  Left = 77
  Top = 81
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'Branch details'
  ClientHeight = 291
  ClientWidth = 622
  Color = clBtnFace
  Constraints.MinHeight = 230
  Constraints.MinWidth = 630
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 622
    Height = 223
    Align = alClient
    DataSource = dtsBranch
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'Name'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Town'
        Title.Caption = 'Town/City'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Postcode'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Phone'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fax_Number'
        Title.Caption = 'Fax'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Account_Code'
        Title.Caption = 'ACC Code'
        Width = 72
        Visible = True
      end>
  end
  object Panel1: TPanel
    ParentBackground = False
    Left = 0
    Top = 223
    Width = 622
    Height = 49
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      622
      49)
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object btnAdd: TButton
      Left = 277
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnChange: TButton
      Left = 365
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Change'
      Enabled = False
      TabOrder = 1
      OnClick = btnChangeClick
    end
    object btnDelete: TButton
      Left = 453
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object btnClose: TButton
      Left = 539
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Clos&e'
      TabOrder = 3
      OnClick = btnCloseClick
    end
    object edtName: TEdit
      Left = 56
      Top = 9
      Width = 177
      Height = 21
      TabOrder = 4
      OnChange = edtNameChange
    end
    object chkbxActiveOnly: TCheckBox
      Left = 56
      Top = 34
      Width = 177
      Height = 14
      Caption = 'Only show active branches'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = chkbxActiveOnlyClick
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 272
    Width = 622
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object dtsBranch: TDataSource
    DataSet = qrySBranch
    OnDataChange = SetButtons
    Left = 160
    Top = 32
  end
  object qrySBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Supplier_branch'
      'where Supplier = :Supplier and'
      'name like :Name and'
      
        '((Inactive = '#39'N'#39') or (Inactive is NULL) or (Inactive = :Inactive' +
        '))'
      'order by Supplier_Branch.Name')
    Left = 96
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Inactive'
        ParamType = ptUnknown
      end>
  end
  object qryCBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Customer_branch'
      'where Customer = :Customer and'
      '('
      '      (Customer_Branch.Name Like :Name) or'
      '      (Customer_Branch.Account_Code Like :Name) or'
      '      (Customer_Branch.Short_Code Like :Name)'
      ') and'
      
        '((Inactive = '#39'N'#39') or (Inactive is NULL) or (Inactive = :Inactive' +
        '))'
      'order by Customer_Branch.Name')
    Left = 96
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Inactive'
        ParamType = ptUnknown
      end>
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 200
    Top = 152
  end
end
