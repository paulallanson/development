object CSLUCRepFrm: TCSLUCRepFrm
  Left = 58
  Top = 113
  Caption = 'Look-Up Reps For A Customer/Branch'
  ClientHeight = 305
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segue UI'
  Font.Style = []
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 14
  object CustLabel: TLabel
    Left = 80
    Top = 6
    Width = 48
    Height = 14
    Caption = 'CustLabel'
  end
  object CountLabel: TLabel
    Left = 275
    Top = 224
    Width = 54
    Height = 14
    Alignment = taRightJustify
    Caption = 'CountLabel'
  end
  object BranchLabel: TLabel
    Left = 80
    Top = 22
    Width = 48
    Height = 14
    Caption = 'CustLabel'
  end
  object Label1: TLabel
    Left = 8
    Top = 22
    Width = 38
    Height = 14
    Caption = 'Branch:'
  end
  object Label2: TLabel
    Left = 8
    Top = 6
    Width = 49
    Height = 14
    Caption = 'Customer:'
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
    Font.Name = 'Segue UI'
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
        Title.Caption = 'Rep Name'
        Width = 232
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Percentage'
        Visible = True
      end>
  end
  object SearchGrpBox: TGroupBox
    Left = 8
    Top = 248
    Width = 321
    Height = 49
    Caption = 'Type here to narrow the search'
    TabOrder = 1
    object NameEdit: TEdit
      Left = 8
      Top = 16
      Width = 305
      Height = 22
      TabOrder = 0
      OnChange = NameEditChange
    end
  end
  object SelectBitBtn: TBitBtn
    Left = 340
    Top = 244
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
    Top = 272
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
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 136
    Top = 24
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Reps_Branches.Rep, Reps_Branches.Percentage, Rep.Name'
      'From Reps_Branches, Rep'
      'Where (Rep.Name Like :Code_From) and'
      '      (Reps_Branches.Customer = :Customer) and'
      '      (Reps_Branches.Branch_No = :Branch_No) and'
      '      (Rep.Rep = Reps_Branches.Rep)'
      'Order By Rep.Name')
    Left = 24
    Top = 24
    ParamData = <
      item
        Name = 'Code_From'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
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
