object frmWTLUCustWTGroups: TfrmWTLUCustWTGroups
  Left = 381
  Top = 170
  Caption = 'Maintain Customer Worktop Groups'
  ClientHeight = 365
  ClientWidth = 739
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 17
  object dbgDetails: TDBGrid
    Left = 0
    Top = 33
    Width = 651
    Height = 239
    Align = alClient
    DataSource = srcCustWTGroup
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
        FieldName = 'Group_Description'
        Title.Caption = 'Group Name'
        Width = 295
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Inactive'
        Visible = False
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 346
    Width = 739
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
    Top = 272
    Width = 739
    Height = 74
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      739
      74)
    object Label4: TLabel
      Left = 8
      Top = 18
      Width = 39
      Height = 17
      Caption = 'Search'
    end
    object btnAdd: TBitBtn
      Left = 277
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 2
      OnClick = btnAddClick
    end
    object btnEdit: TBitBtn
      Left = 370
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      Enabled = False
      TabOrder = 3
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 461
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 4
      OnClick = btnDeleteClick
    end
    object BitBtn4: TBitBtn
      Left = 656
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 6
      OnClick = BitBtn4Click
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 46
      Width = 169
      Height = 17
      Caption = 'Show inactive groups'
      TabOrder = 1
      OnClick = chkbxShowInactiveClick
    end
    object btnExcel: TBitBtn
      Left = 549
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      Enabled = False
      TabOrder = 5
      OnClick = btnExcelClick
    end
    object edtName: TEdit
      Left = 56
      Top = 14
      Width = 177
      Height = 25
      TabOrder = 0
      OnChange = edtNameChange
    end
    object btnPatch: TBitBtn
      Left = 277
      Top = 43
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Patch'
      TabOrder = 7
      OnClick = btnPatchClick
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 739
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 59
      Height = 17
      Caption = 'Customer:'
    end
    object lblCustomerName: TLabel
      Left = 77
      Top = 8
      Width = 105
      Height = 17
      Caption = 'lblCustomerName'
    end
  end
  object Panel2: TPanel
    Left = 651
    Top = 33
    Width = 88
    Height = 239
    Align = alRight
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 4
    object btnColours: TBitBtn
      Left = 9
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Colours'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnColoursClick
    end
    object btnPrices: TBitBtn
      Left = 9
      Top = 43
      Width = 75
      Height = 25
      Caption = 'Prices'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnPricesClick
    end
  end
  object srcCustWTGroup: TDataSource
    DataSet = qryCustWTGroup
    OnDataChange = srcCustWTGroupDataChange
    Left = 136
    Top = 120
  end
  object qryCustWTGroup: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Customer_Worktop_Group'
      'WHERE Customer = :Customer AND'
      
        '  ((inactive = :inactive) or (inactive is NULL) or (inactive = '#39 +
        'N'#39')) AND'
      
        '  (Customer_Worktop_Group.Group_Description LIKE :Group_Descript' +
        'ion)'
      'ORDER BY Group_Description')
    Left = 48
    Top = 120
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Group_Description'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 208
    Top = 120
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 440
    Top = 120
  end
end
