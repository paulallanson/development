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
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object lblDocuments: TLabel
    Left = 11
    Top = 8
    Width = 96
    Height = 17
    Caption = 'Job Documents'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OkBitBtn: TBitBtn
    Left = 29
    Top = 257
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
    OnClick = OkBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 125
    Top = 257
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object lstNames: TListBox
    Left = 11
    Top = 32
    Width = 201
    Height = 201
    ItemHeight = 17
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
    ItemHeight = 17
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
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'DELETE FROM Document_Structure'
      'WHERE Module_ID = :Module_ID')
    Left = 112
    Top = 152
    ParamData = <
      item
        Name = 'Module_ID'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'INSERT INTO Document_Structure (Module_Id, Folder_Name, Creation' +
        '_Date)'
      'VALUES (:Module_Id, :Folder_Name, now())')
    Left = 40
    Top = 152
    ParamData = <
      item
        Name = 'Module_Id'
      end
      item
        Name = 'Folder_Name'
      end>
  end
  object qryGetNames: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT * '
      'FROM Document_Structure'
      'WHERE Module_ID = :Module_ID')
    Left = 96
    Top = 40
    ParamData = <
      item
        Name = 'Module_ID'
      end>
  end
end
