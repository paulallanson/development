object frmFPMainMenu: TfrmFPMainMenu
  Left = 455
  Top = 111
  Width = 380
  Height = 400
  Caption = 'Shop Floor Data Collection'
  Color = clBtnFace
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 380
  Constraints.MinHeight = 400
  Constraints.MinWidth = 380
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  PixelsPerInch = 96
  TextHeight = 13
  object stsbrMainMenu: TStatusBar
    Left = 0
    Top = 347
    Width = 372
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
    Font.Name = 'MS Sans Serif'
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
    Font.Name = 'MS Sans Serif'
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
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button3Click
  end
end
