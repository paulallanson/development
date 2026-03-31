object frmWTSrchSupplier: TfrmWTSrchSupplier
  Left = 474
  Top = 152
  Caption = 'Search for supplier'
  ClientHeight = 379
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 309
    Height = 266
    Align = alClient
    DataSource = dtsDetails
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Supplier_Name'
        Title.Caption = 'Supplier'
        Width = 242
        Visible = True
      end>
  end
  object pnlFunctions: TPanel
    Left = 309
    Top = 0
    Width = 98
    Height = 266
    Align = alRight
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 303
    ExplicitHeight = 257
    DesignSize = (
      98
      266)
    object btnAdd: TBitBtn
      Left = 15
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnChange: TBitBtn
      Left = 15
      Top = 40
      Width = 75
      Height = 25
      Caption = '&Change'
      Enabled = False
      TabOrder = 1
      OnClick = btnChangeClick
    end
    object btnDelete: TBitBtn
      Left = 15
      Top = 72
      Width = 75
      Height = 25
      Caption = '&Delete'
      Enabled = False
      TabOrder = 2
    end
    object btnSweep: TBitBtn
      Left = 15
      Top = 234
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'S&weep'
      Enabled = False
      TabOrder = 3
      OnClick = btnSweepClick
      ExplicitTop = 225
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 266
    Width = 407
    Height = 89
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 257
    ExplicitWidth = 401
    DesignSize = (
      407
      89)
    object Label1: TLabel
      Left = 8
      Top = 36
      Width = 91
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Supplier Search'
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 8
      Width = 193
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Show inactive suppliers'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object edtSearch: TEdit
      Left = 8
      Top = 56
      Width = 257
      Height = 25
      Anchors = [akLeft, akBottom]
      TabOrder = 1
      OnChange = edtSearchChange
    end
    object btnSelect: TBitBtn
      Left = 324
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Select'
      ModalResult = 1
      TabOrder = 2
      OnClick = btnSelectClick
    end
    object BitBtn2: TBitBtn
      Left = 324
      Top = 50
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Canc&el'
      TabOrder = 3
      OnClick = BitBtn2Click
    end
  end
  object stbrDetails: TStatusBar
    Left = 0
    Top = 355
    Width = 407
    Height = 24
    Panels = <
      item
        Width = 100
      end
      item
        Width = 50
      end>
    ExplicitTop = 346
    ExplicitWidth = 401
  end
  object qryDetails: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select    Supplier,'
      '          Supplier_Name,'
      '           InActive'
      'from Supplier'
      'where Supplier_name like :Name and'
      '(InActive = '#39'N'#39' or InActive is NULL or InActive = :InActive)'
      'order by Supplier_Name')
    Left = 64
    Top = 64
    ParamData = <
      item
        Name = 'Name'
        DataType = ftString
      end
      item
        Name = 'InActive'
      end>
  end
  object dtsDetails: TDataSource
    DataSet = qryDetails
    Left = 120
    Top = 64
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 96
    Top = 128
  end
end
