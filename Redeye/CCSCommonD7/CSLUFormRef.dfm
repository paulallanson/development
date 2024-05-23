object CSLUFormRefFrm: TCSLUFormRefFrm
  Left = 179
  Top = 133
  Caption = 'Look-Up Form Reference'
  ClientHeight = 342
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    395
    342)
  TextHeight = 13
  object CustLabel: TLabel
    Left = 80
    Top = 6
    Width = 50
    Height = 13
    Caption = 'CustLabel'
  end
  object CountLabel: TLabel
    Left = 242
    Top = 225
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
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
    Width = 52
    Height = 13
    Caption = 'Customer:'
  end
  object RefDBGrid: TDBGrid
    Left = 8
    Top = 40
    Width = 292
    Height = 179
    Anchors = [akLeft, akTop, akRight, akBottom]
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
    OnColEnter = RefDBGridColEnter
    OnDblClick = RefDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Form_Reference_ID'
        Title.Caption = 'Form Reference'
        Width = 279
        Visible = True
      end>
  end
  object SearchGrpBox: TGroupBox
    Left = 8
    Top = 249
    Width = 293
    Height = 49
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Type here to narrow the search'
    TabOrder = 1
    DesignSize = (
      293
      49)
    object NameEdit: TEdit
      Left = 8
      Top = 16
      Width = 277
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnChange = NameEditChange
    end
  end
  object SelectBitBtn: TBitBtn
    Left = 315
    Top = 293
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Select'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = SelectBitBtnClick
  end
  object CloseBitBtn: TBitBtn
    Left = 315
    Top = 321
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 3
  end
  object FuncGrpBox: TGroupBox
    Left = 307
    Top = 34
    Width = 87
    Height = 105
    Anchors = [akTop, akRight]
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
    Left = 8
    Top = 303
    Width = 293
    Height = 43
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 5
    DesignSize = (
      289
      39)
    object DBContactText: TDBText
      Left = 75
      Top = 3
      Width = 209
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Form_Reference_Descr'
      DataSource = DetsSRC
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBackground
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object LabelName: TLabel
      Left = 4
      Top = 2
      Width = 62
      Height = 13
      Caption = 'Description:'
    end
  end
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 60
    Top = 92
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From Form_Reference'
      'Where (Form_Reference_ID Like :Code_From)'
      '      and (Customer = :Customer)'
      '      and (Branch_No = :Branch_No)'
      '      and ((stock_reference = '#39#39') or (stock_reference is null)'
      
        '            or (stock_reference = :stockRef) or (:stockRef = '#39#39')' +
        ')'
      ''
      ' '
      ' ')
    Left = 28
    Top = 92
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'stockRef'
      end
      item
        Name = 'stockRef'
      end>
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 28
    Top = 124
  end
end
