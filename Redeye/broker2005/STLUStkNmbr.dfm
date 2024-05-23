object STLUStkNmbrFrm: TSTLUStkNmbrFrm
  Left = 126
  Top = 109
  Caption = 'Serial Numbers'
  ClientHeight = 414
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object pnlGrid: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 354
    Align = alClient
    TabOrder = 0
    object pnlPart: TPanel
      Left = 1
      Top = 1
      Width = 630
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblPartDesc: TLabel
        Left = 184
        Top = 8
        Width = 57
        Height = 13
        Caption = 'lblPartDesc'
      end
      object lblPartCode: TLabel
        Left = 64
        Top = 8
        Width = 60
        Height = 13
        Caption = 'lblPartCode'
      end
      object lblPart: TLabel
        Left = 8
        Top = 8
        Width = 43
        Height = 13
        Caption = 'Product:'
      end
    end
    object dbgrdLocations: TDBGrid
      Left = 1
      Top = 33
      Width = 630
      Height = 320
      Align = alClient
      DrawingStyle = gdsGradient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'serial_item_from'
          Title.Caption = 'From'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'serial_item_to'
          Title.Caption = 'To'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Store_Name'
          Title.Caption = 'Store'
          Width = 141
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Bin'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Lot'
          Width = 91
          Visible = True
        end>
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 354
    Width = 632
    Height = 41
    Align = alBottom
    TabOrder = 1
    object pnlButton: TPanel
      Left = 527
      Top = 1
      Width = 104
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btbtnClose: TBitBtn
        Left = 16
        Top = 8
        Width = 75
        Height = 25
        Kind = bkClose
        NumGlyphs = 2
        TabOrder = 0
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 395
    Width = 632
    Height = 19
    Panels = <>
  end
end
