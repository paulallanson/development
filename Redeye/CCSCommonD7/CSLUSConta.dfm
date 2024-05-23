object CSLUSContaFrm: TCSLUSContaFrm
  Left = 58
  Top = 113
  Caption = 'Look-Up Supplier/Branch Contacts'
  ClientHeight = 376
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object SuppLabel: TLabel
    Left = 80
    Top = 6
    Width = 54
    Height = 13
    Caption = 'SuppLabel'
  end
  object CountLabel: TLabel
    Left = 270
    Top = 224
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'CountLabel'
  end
  object BranchLabel: TLabel
    Left = 80
    Top = 22
    Width = 50
    Height = 13
    Caption = 'CustLabel'
  end
  object Label1: TLabel
    Left = 8
    Top = 22
    Width = 38
    Height = 13
    Caption = 'Branch:'
  end
  object Label2: TLabel
    Left = 8
    Top = 6
    Width = 46
    Height = 13
    Caption = 'Supplier:'
  end
  object DetsDBGrid: TDBGrid
    Left = 8
    Top = 40
    Width = 320
    Height = 177
    DataSource = DetsSRC
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnColEnter = DetsDBGridColEnter
    OnDblClick = DetsDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Contact Name'
        Width = 284
        Visible = True
      end>
  end
  object SearchGrpBox: TGroupBox
    Left = 8
    Top = 248
    Width = 321
    Height = 73
    Caption = 'Type here to narrow the search'
    TabOrder = 1
    object NameEdit: TEdit
      Left = 8
      Top = 16
      Width = 305
      Height = 21
      TabOrder = 0
      OnChange = NameEditChange
    end
    object ActiveOnlyCheckBox: TCheckBox
      Left = 8
      Top = 42
      Width = 209
      Height = 17
      Caption = 'Only show active supplier contacts'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = ShowGrid
    end
  end
  object SelectBitBtn: TBitBtn
    Left = 340
    Top = 292
    Width = 75
    Height = 25
    Caption = 'Select'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = SelectBitBtnClick
  end
  object CloseBitBtn: TBitBtn
    Left = 340
    Top = 328
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 3
  end
  object FuncGrpBox: TGroupBox
    Left = 336
    Top = 128
    Width = 87
    Height = 105
    Caption = 'Function'
    TabOrder = 4
    object AddBitBtn: TBitBtn
      Left = 4
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 0
      OnClick = AddBitBtnClick
    end
    object ChgBitBtn: TBitBtn
      Left = 4
      Top = 44
      Width = 75
      Height = 25
      Caption = 'Change'
      TabOrder = 1
      OnClick = ChgBitBtnClick
    end
    object DelBitBtn: TBitBtn
      Left = 4
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Delete'
      TabOrder = 2
      OnClick = DelBitBtnClick
    end
  end
  object DispPanel: TPanel
    Left = 7
    Top = 324
    Width = 324
    Height = 57
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 5
    object DBContactText: TDBText
      Left = 83
      Top = 3
      Width = 175
      Height = 17
      DataField = 'Name'
      DataSource = DetsSRC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBackground
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DBCPhoneText: TDBText
      Left = 83
      Top = 19
      Width = 175
      Height = 13
      DataField = 'Phone'
      DataSource = DetsSRC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBackground
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DBCMobileText: TDBText
      Left = 83
      Top = 35
      Width = 175
      Height = 15
      DataField = 'Mobile_No'
      DataSource = DetsSRC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBackground
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object LabelName: TLabel
      Left = 28
      Top = 2
      Width = 32
      Height = 13
      Caption = 'Name:'
    end
    object LabelPhone: TLabel
      Left = 28
      Top = 18
      Width = 36
      Height = 13
      Caption = 'Phone:'
    end
    object LabelFax: TLabel
      Left = 28
      Top = 34
      Width = 39
      Height = 13
      Caption = 'Mobile:'
    end
  end
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 136
    Top = 24
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From Supplier_BranchContacts'
      'Where (Name Like :Code_From)  and'
      '      (Supplier = :Supplier) and'
      '      (Branch_No = :Branch_No) and'
      
        '      ((Inactive = '#39'N'#39') or (Inactive is NULL) or (Inactive = :In' +
        'active))'
      'Order By Name'
      ' ')
    Left = 24
    Top = 24
    ParamData = <
      item
        Name = 'Code_From'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Inactive'
      end>
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 200
    Top = 152
  end
  object qryCheckPOs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select purchase_order'
      'from purchase_order'
      'where'
      '  supplier = :supplier and'
      '  Branch_No = :Branch and'
      '  Contact_No = :Contact'
      ' ')
    Left = 248
    Top = 16
    ParamData = <
      item
        Name = 'supplier'
      end
      item
        Name = 'Branch'
      end
      item
        Name = 'Contact'
      end>
  end
  object qryCheckEnqs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Enquiry'
      'from Supplier_Enquiry'
      'where'
      '  supplier = :supplier and'
      '  Branch_No = :Branch and'
      '  Contact_No = :Contact'
      ' ')
    Left = 320
    Top = 24
    ParamData = <
      item
        Name = 'supplier'
      end
      item
        Name = 'Branch'
      end
      item
        Name = 'Contact'
      end>
  end
end
