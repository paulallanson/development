object PBLUStkLocsFrm: TPBLUStkLocsFrm
  Left = 66
  Top = 96
  Width = 670
  Height = 260
  Caption = 'Stock Locations'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 662
    Height = 192
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object DetsDBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 660
      Height = 190
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Stock_Location_Desc'
          Title.Caption = 'Warehouse'
          Width = 176
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Description'
          Title.Caption = 'Bin Location'
          Width = 149
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Forms_per_Box'
          Title.Alignment = taRightJustify
          Title.Caption = 'Box Quantity'
          Width = 95
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Qty_in_Stock'
          Title.Alignment = taRightJustify
          Title.Caption = 'In Stock'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BoxQty'
          Title.Caption = 'No of Boxes'
          Width = 73
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 192
    Width = 662
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      662
      41)
    object BitBtn1: TBitBtn
      Left = 566
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 0
      Kind = bkClose
    end
  end
end
