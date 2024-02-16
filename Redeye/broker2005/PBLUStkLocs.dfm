object PBLUStkLocsFrm: TPBLUStkLocsFrm
  Left = 66
  Top = 96
  Caption = 'Stock Locations'
  ClientHeight = 221
  ClientWidth = 654
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 654
    Height = 180
    Align = alClient
    Caption = 'Panel1'
    ParentBackground = False
    TabOrder = 0
    object DetsDBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 652
      Height = 178
      Align = alClient
      DrawingStyle = gdsGradient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
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
    Top = 180
    Width = 654
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      654
      41)
    object BitBtn1: TBitBtn
      Left = 558
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 0
    end
  end
end
