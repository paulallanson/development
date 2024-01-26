object CSLUBranchFrm: TCSLUBranchFrm
  Left = 178
  Top = 104
  Caption = 'Look-Up A Branch'
  ClientHeight = 349
  ClientWidth = 422
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
    Left = 8
    Top = 6
    Width = 50
    Height = 13
    Caption = 'CustLabel'
  end
  object CountLabel: TLabel
    Left = 270
    Top = 224
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'CountLabel'
  end
  object DetsDBGrid: TDBGrid
    Left = 8
    Top = 24
    Width = 320
    Height = 193
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
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnColEnter = DetsDBGridColEnter
    OnDblClick = DetsDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Branch Name'
        Width = 284
        Visible = True
      end>
  end
  object SearchGrpBox: TGroupBox
    Left = 8
    Top = 242
    Width = 313
    Height = 49
    Caption = 'Type here to narrow the search'
    TabOrder = 1
    object NameEdit: TEdit
      Left = 8
      Top = 16
      Width = 297
      Height = 21
      TabOrder = 0
      OnChange = NameEditChange
    end
  end
  object SelectBitBtn: TBitBtn
    Left = 343
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Select'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = SelectBitBtnClick
  end
  object CloseBitBtn: TBitBtn
    Left = 343
    Top = 293
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 3
  end
  object ThisChkBox: TCheckBox
    Left = 16
    Top = 224
    Width = 185
    Height = 17
    Caption = 'Head Office'
    TabOrder = 4
    OnClick = ThisChkBoxClick
  end
  object FuncGrpBox: TGroupBox
    Left = 336
    Top = 128
    Width = 87
    Height = 105
    Caption = 'Function'
    TabOrder = 5
    object DelBitBtn: TBitBtn
      Left = 6
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Delete'
      TabOrder = 0
      OnClick = DelBitBtnClick
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
    object AddBitBtn: TBitBtn
      Left = 6
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Add'
      NumGlyphs = 2
      TabOrder = 2
      OnClick = AddBitBtnClick
    end
  end
  object GoToGrpBox: TGroupBox
    Left = 336
    Top = 8
    Width = 87
    Height = 103
    Caption = 'Go To'
    TabOrder = 6
    object ContactsBitBtn: TBitBtn
      Left = 6
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Contacts'
      TabOrder = 0
      OnClick = ContactsBitBtnClick
    end
    object CRepsBitBtn: TBitBtn
      Left = 6
      Top = 44
      Width = 75
      Height = 25
      Caption = 'Assign Reps'
      TabOrder = 1
      OnClick = CRepsBitBtnClick
    end
    object FormRefBitBtn: TBitBtn
      Left = 6
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Form Refs'
      TabOrder = 2
      OnClick = FormRefBitBtnClick
    end
  end
  object DispPanel: TPanel
    Left = 9
    Top = 297
    Width = 313
    Height = 57
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 7
    object DBBranchText: TDBText
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
    object DBBPhoneText: TDBText
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
    object DBBFaxText: TDBText
      Left = 115
      Top = 35
      Width = 175
      Height = 15
      DataField = 'Fax_Number'
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
      Width = 20
      Height = 13
      Caption = 'Fax:'
    end
  end
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 168
    Top = 24
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From Customer_Branch'
      'Where (Name Like :Code_From) and '
      '      (Customer = :Customer) '
      'Order By Name')
    Left = 32
    Top = 40
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftString
      end>
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 200
    Top = 152
  end
  object dtsDummy: TDataSource
    Left = 232
    Top = 64
  end
end
