object frmPBLUSalesOrdersRpts: TfrmPBLUSalesOrdersRpts
  Left = 210
  Top = 109
  Width = 421
  Height = 310
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Sales Order Reports'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 413
    Height = 235
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 413
      Height = 235
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
      Items.Data = {
        B90100000700000000000000FFFFFFFFFFFFFFFF010000000000000015437573
        746F6D65722053616C6573207265706F7274125354525353414C455342594355
        535446524D00000000FFFFFFFFFFFFFFFF01000000000000000F44656C697665
        7279207265706F72741253545253534F5244455244454C495646524D00000000
        FFFFFFFFFFFFFFFF01000000000000000D50726F666974207265706F72741053
        54525350524F46495452455046524D00000000FFFFFFFFFFFFFFFF0100000000
        0000001950726F64756374696F6E2052657475726E73205265706F7274105354
        5253534F52455455524E5346524D00000000FFFFFFFFFFFFFFFF010000000000
        00001453616C657320486973746F7279207265706F72741053545253534F4849
        53544F525946524D00000000FFFFFFFFFFFFFFFF010000000000000017576F72
        6B20696E2050726F6772657373207265706F72740D53545253574F524B495046
        524D00000000FFFFFFFFFFFFFFFF01000000000000002053616C657320486973
        746F7279205265706F7274202D20496E636C7573697665135354525353414C45
        53484953544F525946524DFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lstvwReportsDblClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 235
    Width = 413
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      413
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
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
