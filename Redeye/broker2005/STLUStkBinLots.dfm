object STLUStkBinLotsFrm: TSTLUStkBinLotsFrm
  Left = 162
  Top = 151
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Stock Numbered Lots'
  ClientHeight = 245
  ClientWidth = 544
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
    Width = 544
    Height = 185
    Align = alClient
    TabOrder = 1
    object dbgrdBinLots: TDBGrid
      Left = 1
      Top = 41
      Width = 542
      Height = 143
      Align = alClient
      DefaultDrawing = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrdBinLotsDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'Part'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Description'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Store_Name'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Bin'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Lot'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Qty_in_Stock'
          Title.Caption = 'Qty in Stock'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Qty_Allocated'
          Title.Caption = 'Qty Allocated'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Free_Stock'
          Title.Caption = 'Free Stock'
          Visible = False
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'serial_item_from'
          Title.Caption = 'Numbered From'
          Width = 125
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'serial_item_to'
          Title.Caption = 'Numbered To'
          Width = 137
          Visible = True
        end>
    end
    object pnlPart: TPanel
      Left = 1
      Top = 1
      Width = 542
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        542
        40)
      object lblPartCode: TLabel
        Left = 72
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
      object lblStore: TLabel
        Left = 8
        Top = 24
        Width = 28
        Height = 13
        Caption = 'Store:'
      end
      object lblStoreName: TLabel
        Left = 72
        Top = 24
        Width = 63
        Height = 13
        Caption = 'lblStoreName'
      end
      object lblQuantities: TLabel
        Left = 476
        Top = 8
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'lblQuantities'
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 226
    Width = 544
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 185
    Width = 544
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Panel3: TPanel
      Left = 440
      Top = 1
      Width = 103
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 16
        Top = 8
        Width = 75
        Height = 25
        TabOrder = 0
        Kind = bkClose
      end
    end
  end
end
