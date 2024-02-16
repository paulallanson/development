object PJExtFileFilterExtPEDlg: TPJExtFileFilterExtPEDlg
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Edit Extensions'
  ClientHeight = 153
  ClientWidth = 227
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Position = poScreenCenter
  
  TextHeight = 14
  object edExtension: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = edExtensionChange
  end
  object btnAdd: TButton
    Left = 144
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Add'
    Enabled = False
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 144
    Top = 40
    Width = 75
    Height = 25
    Caption = '&Delete'
    Enabled = False
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object lbExtensions: TListBox
    Left = 8
    Top = 40
    Width = 121
    Height = 105
    ItemHeight = 13
    TabOrder = 1
    OnClick = lbExtensionsClick
  end
  object btnOK: TButton
    Left = 144
    Top = 88
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object btnCancel: TButton
    Left = 144
    Top = 120
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
end
