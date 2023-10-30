object frmFPMainMenu: TfrmFPMainMenu
  Left = 455
  Top = 111
  Caption = 'Shop Floor Data Collection'
  ClientHeight = 362
  ClientWidth = 368
  Color = clBtnFace
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 380
  Constraints.MinHeight = 400
  Constraints.MinWidth = 380
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  TextHeight = 13
  object stsbrMainMenu: TStatusBar
    Left = 0
    Top = 343
    Width = 368
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 350
      end
      item
        Width = 100
      end>
    ExplicitTop = 334
    ExplicitWidth = 362
  end
  object Button1: TButton
    Left = 24
    Top = 16
    Width = 321
    Height = 97
    Caption = 'Data Entry'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 132
    Width = 321
    Height = 97
    Caption = 'Job Time Log'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 248
    Width = 321
    Height = 97
    Caption = 'Exit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button3Click
  end
end
