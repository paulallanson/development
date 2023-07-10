object frmWTMaintCompanyDocStructure: TfrmWTMaintCompanyDocStructure
  Left = 558
  Top = 96
  BorderStyle = bsDialog
  Caption = 'Document Structure'
  ClientHeight = 299
  ClientWidth = 226
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object lblDocuments: TLabel
    Left = 11
    Top = 8
    Width = 88
    Height = 13
    Caption = 'Job Documents'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OkBitBtn: TBitBtn
    Left = 29
    Top = 257
    Width = 75
    Height = 25
    TabOrder = 0
    OnClick = OkBitBtnClick
    Kind = bkOK
  end
  object CancelBitBtn: TBitBtn
    Left = 125
    Top = 257
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkCancel
  end
  object lstNames: TListBox
    Left = 11
    Top = 32
    Width = 201
    Height = 201
    ItemHeight = 13
    Items.Strings = (
      'Assets'
      'Data'
      'Emails'
      'Original'
      'Scripts')
    PopupMenu = mnuFunctions
    Sorted = True
    TabOrder = 2
  end
  object lstCodes: TListBox
    Left = 176
    Top = 32
    Width = 25
    Height = 201
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object mnuFunctions: TPopupMenu
    OnPopup = mnuFunctionsPopup
    Left = 96
    Top = 88
    object mnuAdd: TMenuItem
      Caption = 'Add'
      OnClick = mnuAddClick
    end
    object mnuRename: TMenuItem
      Caption = 'Rename'
      OnClick = mnuRenameClick
    end
    object mnuDelete: TMenuItem
      Caption = 'Delete'
      OnClick = mnuDeleteClick
    end
  end
  object qryDelete: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'DELETE FROM Document_Structure'
      'WHERE Module_ID = :Module_ID')
    Left = 112
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Module_ID'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      
        'INSERT INTO Document_Structure (Module_Id, Folder_Name, Creation' +
        '_Date)'
      'VALUES (:Module_Id, :Folder_Name, now())')
    Left = 40
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Module_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Folder_Name'
        ParamType = ptUnknown
      end>
  end
  object qryGetNames: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT * '
      'FROM Document_Structure'
      'WHERE Module_ID = :Module_ID')
    Left = 96
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Module_ID'
        ParamType = ptUnknown
      end>
  end
end
