object PBLUProcessWCGroupfrm: TPBLUProcessWCGroupfrm
  Left = 339
  Top = 141
  BorderStyle = bsDialog
  Caption = 'Look-Up A Process Question'
  ClientHeight = 311
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object CountLabel: TLabel
    Left = 262
    Top = 232
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'CountLabel'
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 41
    Height = 13
    Caption = 'Process:'
  end
  object ProcessLbl: TLabel
    Left = 88
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Process'
  end
  object DetsDBGrid: TDBGrid
    Left = 8
    Top = 24
    Width = 313
    Height = 201
    DataSource = DetsSRC
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnColEnter = DetsDBGridColEnter
    OnDblClick = DetsDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Work_Centre_Group_Name'
        Title.Caption = 'Work Centre Group'
        Width = 240
        Visible = True
      end>
  end
  object SearchGrpBox: TGroupBox
    Left = 8
    Top = 248
    Width = 313
    Height = 49
    Caption = 'Type here to narrow the search'
    ParentBackground = False
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
  object CloseBitBtn: TBitBtn
    Left = 344
    Top = 272
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 2
  end
  object FuncGrpBox: TGroupBox
    Left = 336
    Top = 112
    Width = 87
    Height = 105
    Caption = 'Function'
    ParentBackground = False
    TabOrder = 3
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
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 136
    Top = 24
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Work_Centre_Group.*, Process_Work_Centre_Group.*'
      'From Process_Work_Centre_Group, Work_Centre_Group'
      
        'Where (Work_Centre_Group.Work_Centre_Group_Name Like :Code_From)' +
        ' and'
      '      (Process_Work_Centre_Group.Process = :Process) and'
      
        '(Process_Work_Centre_Group.Work_Centre_Group = Work_Centre_Group' +
        '.Work_Centre_Group)'
      'Order By Work_Centre_Group.Work_Centre_Group_Name'
      '')
    Left = 24
    Top = 24
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Process'
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
