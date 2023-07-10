object frmWTSrchSupplier: TfrmWTSrchSupplier
  Left = 474
  Top = 152
  Width = 426
  Height = 412
  Caption = 'Search for supplier'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 320
    Height = 273
    Align = alClient
    DataSource = dtsDetails
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
        FieldName = 'Supplier_Name'
        Title.Caption = 'Supplier'
        Width = 242
        Visible = True
      end>
  end
  object pnlFunctions: TPanel
    Left = 320
    Top = 0
    Width = 98
    Height = 273
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      98
      273)
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
      Top = 251
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'S&weep'
      Enabled = False
      TabOrder = 3
      OnClick = btnSweepClick
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 273
    Width = 418
    Height = 89
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      418
      89)
    object Label1: TLabel
      Left = 8
      Top = 36
      Width = 75
      Height = 13
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
      Height = 21
      Anchors = [akLeft, akBottom]
      TabOrder = 1
      OnChange = edtSearchChange
    end
    object btnSelect: TBitBtn
      Left = 335
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Select'
      ModalResult = 1
      TabOrder = 2
      OnClick = btnSelectClick
    end
    object BitBtn2: TBitBtn
      Left = 335
      Top = 54
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
    Top = 362
    Width = 418
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object qryDetails: TQuery
    DatabaseName = 'wt'
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
        DataType = ftString
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'InActive'
        ParamType = ptUnknown
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
