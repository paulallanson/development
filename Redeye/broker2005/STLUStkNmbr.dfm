object STLUStkNmbrFrm: TSTLUStkNmbrFrm
  Left = 126
  Top = 109
  Width = 650
  Height = 461
  Caption = 'Serial Numbers'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGrid: TPanel
    Left = 0
    Top = 0
    Width = 642
    Height = 367
    Align = alClient
    TabOrder = 0
    object pnlPart: TPanel
      Left = 1
      Top = 1
      Width = 640
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblPartDesc: TLabel
        Left = 184
        Top = 8
        Width = 54
        Height = 13
        Caption = 'lblPartDesc'
      end
      object lblPartCode: TLabel
        Left = 64
        Top = 8
        Width = 54
        Height = 13
        Caption = 'lblPartCode'
      end
      object lblPart: TLabel
        Left = 8
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Product:'
      end
    end
    object dbgrdLocations: TDBGrid
      Left = 1
      Top = 33
      Width = 640
      Height = 333
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
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
    Top = 367
    Width = 642
    Height = 41
    Align = alBottom
    TabOrder = 1
    object pnlButton: TPanel
      Left = 537
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
        TabOrder = 0
        Kind = bkClose
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 408
    Width = 642
    Height = 19
    Panels = <>
  end
end
