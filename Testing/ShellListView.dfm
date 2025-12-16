object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 630
  ClientWidth = 1217
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1217
    Height = 73
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1211
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 33
      Height = 15
      Caption = 'Folder'
    end
    object Edit1: TEdit
      Left = 104
      Top = 20
      Width = 393
      Height = 23
      TabOrder = 0
      Text = 'C:\firebelly\documents\sales orders\46729'
    end
    object Button1: TButton
      Left = 528
      Top = 19
      Width = 75
      Height = 25
      Caption = 'Open'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 1217
    Height = 557
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    ExplicitWidth = 1211
    ExplicitHeight = 548
    object stvDocuments: TShellTreeView
      Left = 1
      Top = 1
      Width = 344
      Height = 555
      ObjectTypes = [otFolders]
      Root = 'C:\'
      ShellListView = slvDocuments
      UseShellImages = True
      Align = alLeft
      AutoRefresh = False
      Indent = 23
      ParentColor = False
      RightClickSelect = True
      ShowRoot = False
      TabOrder = 0
      ExplicitHeight = 546
    end
    object slvDocuments: TShellListView
      Left = 345
      Top = 1
      Width = 871
      Height = 555
      ObjectTypes = [otFolders, otNonFolders]
      Root = 'C:\'
      ShellTreeView = stvDocuments
      Sorted = True
      Align = alClient
      ReadOnly = False
      HideSelection = False
      MultiSelect = True
      TabOrder = 1
      ViewStyle = vsReport
      ExplicitWidth = 865
      ExplicitHeight = 546
    end
  end
end
