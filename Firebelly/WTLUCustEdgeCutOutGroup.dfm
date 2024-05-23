object frmWTLUCustEdgeCutOutGroup: TfrmWTLUCustEdgeCutOutGroup
  Left = 362
  Top = 121
  BorderStyle = bsDialog
  Caption = 'Maintain Customer Edge and Cutout Groups'
  ClientHeight = 350
  ClientWidth = 467
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
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 331
    Width = 467
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
    Top = 268
    Width = 467
    Height = 63
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      467
      63)
    object btnAdd: TBitBtn
      Left = 16
      Top = 30
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 106
      Top = 30
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 197
      Top = 30
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
      Top = 30
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 3
    end
    object chkbxShowInactive: TCheckBox
      Left = 16
      Top = 6
      Width = 169
      Height = 17
      Caption = 'Show inactive groups'
      TabOrder = 4
      OnClick = chkbxShowInactiveClick
    end
    object btnExcel: TBitBtn
      Left = 285
      Top = 30
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 5
      OnClick = btnExcelClick
    end
  end
  object Panel2: TPanel
    Left = 379
    Top = 33
    Width = 88
    Height = 235
    Align = alRight
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      88
      235)
    object btnEdges: TBitBtn
      Left = 9
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Edges'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnEdgesClick
    end
    object btnCutOuts: TBitBtn
      Left = 9
      Top = 51
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Cut Outs'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnCutOutsClick
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 467
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Customer:'
    end
    object lblCustomerName: TLabel
      Left = 64
      Top = 8
      Width = 91
      Height = 13
      Caption = 'lblCustomerName'
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 33
    Width = 379
    Height = 235
    Align = alClient
    DataSource = dtsGetGroups
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
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
        FieldName = 'Group_Description'
        Title.Caption = 'Group Name'
        Width = 226
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Material_Description'
        Title.Caption = 'Material'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Inactive'
        Visible = False
      end>
  end
  object qryGetGroups: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Material_Type.Description as Material_Description,'
      '        Customer_Cutout_Edge_Group.*'
      'FROM Material_Type'
      '      INNER JOIN Customer_Cutout_Edge_Group'
      
        '        ON Material_Type.Material_Type = Customer_Cutout_Edge_Gr' +
        'oup.Material_Type'
      'WHERE (Customer_Cutout_Edge_Group.Customer = :Customer) AND'
      
        '      ((Customer_Cutout_Edge_Group.Inactive = '#39'N'#39') OR (Customer_' +
        'Cutout_Edge_Group.Inactive IS NULL) OR (Customer_Cutout_Edge_Gro' +
        'up.inactive = :inactive))'
      'ORDER BY Customer_Cutout_Edge_Group.Group_Description'
      '')
    Left = 48
    Top = 120
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'inactive'
      end>
  end
  object dtsGetGroups: TDataSource
    DataSet = qryGetGroups
    Left = 128
    Top = 120
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'DELETE FROM Customer_Cutout_Edge_Group'
      'WHERE Group_Id = :Group_Id')
    Left = 200
    Top = 120
    ParamData = <
      item
        Name = 'Group_Id'
      end>
  end
end
