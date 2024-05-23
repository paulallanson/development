object CSLUCContaFrm: TCSLUCContaFrm
  Left = 210
  Top = 87
  Caption = 'Look-Up Customer/Branch Contacts'
  ClientHeight = 362
  ClientWidth = 432
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
  object CustLabel: TLabel
    Left = 85
    Top = 6
    Width = 50
    Height = 13
    Caption = 'CustLabel'
  end
  object CountLabel: TLabel
    Left = 275
    Top = 224
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'CountLabel'
  end
  object BranchLabel: TLabel
    Left = 85
    Top = 22
    Width = 50
    Height = 13
    Caption = 'CustLabel'
  end
  object Label1: TLabel
    Left = 13
    Top = 22
    Width = 38
    Height = 13
    Caption = 'Branch:'
  end
  object Label2: TLabel
    Left = 13
    Top = 6
    Width = 52
    Height = 13
    Caption = 'Customer:'
  end
  object DetsDBGrid: TDBGrid
    Left = 13
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
    Left = 13
    Top = 240
    Width = 321
    Height = 65
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
      Width = 217
      Height = 17
      Caption = 'Only show active customer contacts'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = ShowGrid
    end
  end
  object SelectBitBtn: TBitBtn
    Left = 345
    Top = 297
    Width = 75
    Height = 26
    Caption = 'Select'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = SelectBitBtnClick
  end
  object CloseBitBtn: TBitBtn
    Left = 345
    Top = 325
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 3
  end
  object FuncGrpBox: TGroupBox
    Left = 341
    Top = 128
    Width = 87
    Height = 105
    Caption = 'Function'
    TabOrder = 4
    object AddBitBtn: TBitBtn
      Left = 6
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 0
      OnClick = AddBitBtnClick
    end
    object ChgBitBtn: TBitBtn
      Left = 6
      Top = 44
      Width = 75
      Height = 25
      Caption = 'Change'
      TabOrder = 1
      OnClick = ChgBitBtnClick
    end
    object DelBitBtn: TBitBtn
      Left = 6
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Delete'
      TabOrder = 2
      OnClick = DelBitBtnClick
    end
  end
  object DispPanel: TPanel
    Left = 13
    Top = 310
    Width = 321
    Height = 57
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 5
    object DBContactText: TDBText
      Left = 115
      Top = 3
      Width = 175
      Height = 17
      DataField = 'Name'
      DataSource = DetsSRC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBackground
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object DBCPhoneText: TDBText
      Left = 115
      Top = 19
      Width = 175
      Height = 13
      DataField = 'Phone'
      DataSource = DetsSRC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBackground
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object DBCMobileText: TDBText
      Left = 115
      Top = 35
      Width = 175
      Height = 15
      DataField = 'Mobile_No'
      DataSource = DetsSRC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBackground
      Font.Height = -12
      Font.Name = 'Arial'
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
    Left = 141
    Top = 24
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From Customer_Contact'
      'Where (Name Like :Code_From) and '
      '      (Customer = :Customer) and'
      '      (Branch_No = :Branch_No) and'
      
        '      ((Inactive = '#39'N'#39') or (Inactive is NULL) or (Inactive = :In' +
        'active))'
      'Order By Name')
    Left = 30
    Top = 24
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftString
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Inactive'
      end>
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 205
    Top = 152
  end
  object qryCheckPOs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select purchase_order'
      'from purchase_orderLine'
      'where'
      '  Customer = :Customer and'
      '  Branch_No = :Branch and'
      '  Contact_No = :Contact'
      ' ')
    Left = 256
    Top = 48
    ParamData = <
      item
        Name = 'Customer'
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
      'from Enquiry'
      'where'
      '  Customer = :Customer and'
      '  Branch_No = :Branch and'
      '  Contact_No = :Contact'
      ' ')
    Left = 320
    Top = 24
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch'
      end
      item
        Name = 'Contact'
      end>
  end
  object qryCheckEvents: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer_Cont_Event_no'
      'from Customer_Contact_Event'
      'where'
      '  Customer = :Customer and'
      '  Branch_No = :Branch and'
      '  Contact_No = :Contact'
      ' ')
    Left = 360
    Top = 80
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch'
      end
      item
        Name = 'Contact'
      end>
  end
end
