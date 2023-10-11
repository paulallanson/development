object HostsForm: THostsForm
  Left = 89
  Top = 138
  BorderStyle = bsDialog
  Caption = 'Configure Hosts'
  ClientHeight = 190
  ClientWidth = 225
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object HostsList: TListBox
    Left = 4
    Top = 4
    Width = 133
    Height = 173
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = HostsListDblClick
  end
  object NewBtn: TButton
    Left = 144
    Top = 28
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 1
    OnClick = NewBtnClick
  end
  object EditBtn: TButton
    Left = 144
    Top = 53
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 2
    OnClick = EditBtnClick
  end
  object DeleteBtn: TButton
    Left = 144
    Top = 78
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 3
    OnClick = DeleteBtnClick
  end
  object CloseBtn: TButton
    Left = 144
    Top = 103
    Width = 75
    Height = 25
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 4
  end
  object HelpBtn: TButton
    Left = 144
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Help'
    TabOrder = 5
    OnClick = HelpBtnClick
  end
end
