object frmPBLUSupplierRpts: TfrmPBLUSupplierRpts
  Left = 201
  Top = 107
  Width = 421
  Height = 310
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Supplier Reports'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 413
    Height = 242
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 413
      Height = 242
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
        F10000000400000000000000FFFFFFFFFFFFFFFF010000000000000011436170
        6162696C697479207265706F727411504252534341504142494C49545946524D
        00000000FFFFFFFFFFFFFFFF01000000000000001A537570706C696572204361
        706162696C697479207265706F72740D5042525353555043415046524D000000
        00FFFFFFFFFFFFFFFF01000000000000000F537570706C696572205265706F72
        740E504252535355505044455446524D00000000FFFFFFFFFFFFFFFF01000000
        0000000011537570706C69657220436F6E746163747312504252535355505043
        4F4E5444455446524DFFFFFFFFFFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lstvwReportsDblClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 242
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
