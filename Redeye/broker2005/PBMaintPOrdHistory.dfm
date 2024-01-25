object PBMaintPOrdHistoryFrm: TPBMaintPOrdHistoryFrm
  Left = 290
  Top = 114
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Purchase Order Price Change History'
  ClientHeight = 433
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 373
    Width = 734
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      734
      41)
    object btnClose: TButton
      Left = 649
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 734
    Height = 373
    Align = alClient
    DataSource = PBPODM.dtsGetPOPriceHist
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'Date_point'
        Title.Caption = 'Date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Order_Price'
        Title.Caption = 'Order Price'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Order_Unit_Description'
        Title.Caption = 'Order Unit'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Selling_Price'
        Title.Caption = 'Selling Price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sell_Unit_Description'
        Title.Caption = 'Sell Unit'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Goods_Required'
        Title.Caption = 'Supplier Reqd Date'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Goods_Reqd_by_Customer'
        Title.Caption = 'Customer Reqd Date'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'On_Hold'
        Title.Caption = 'On Hold'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Operator_Name'
        Title.Caption = 'Operator'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Invoice_Upfront'
        Title.Caption = 'Invoice Upfront'
        Width = 87
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 414
    Width = 734
    Height = 19
    Panels = <>
  end
end
