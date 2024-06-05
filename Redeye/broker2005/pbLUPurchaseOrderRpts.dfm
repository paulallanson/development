object frmPBLUPurchaseOrderRpts: TfrmPBLUPurchaseOrderRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Purchase Order Reports'
  ClientHeight = 271
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 405
    Height = 230
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 399
    ExplicitHeight = 221
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 405
      Height = 230
      Align = alClient
      Columns = <
        item
          Caption = 'Description'
          Width = 200
        end
        item
          Caption = 'File Name'
          Width = 100
        end
        item
          Caption = 'Item No'
          Width = 0
        end>
      Items.ItemData = {
        05790000000200000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        0014500075006300680061007300650020006F00720064006500720020007200
        650070006F00720074000B530054005200530050004F0052004400460052004D
        000000000000000000FFFFFFFFFFFFFFFF00000000FFFFFFFF0000000000FFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lstvwReportsDblClick
      ExplicitWidth = 413
      ExplicitHeight = 235
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 230
    Width = 405
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 221
    ExplicitWidth = 399
    DesignSize = (
      405
      41)
    object btnRun: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Run'
      TabOrder = 0
      OnClick = btnRunClick
    end
    object Button2: TButton
      Left = 322
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 1
      OnClick = Button2Click
      ExplicitLeft = 316
    end
  end
end
