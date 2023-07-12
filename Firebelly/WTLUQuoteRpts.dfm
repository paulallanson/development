object frmWTLUQuoteRpts: TfrmWTLUQuoteRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Quote Reports'
  ClientHeight = 184
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 412
    Height = 143
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 412
      Height = 143
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
        B50100000700000000000000FFFFFFFFFFFFFFFF01000000000000000C51756F
        7465205265706F72741046524D5754525351554F54455045524600000000FFFF
        FFFFFFFFFFFF0100000000000000184F75747374616E64696E672051756F7465
        205265706F72740F46524D575452534F555451554F544500000000FFFFFFFFFF
        FFFFFF01000000000000001151756F74652053616C6573204C65616473154652
        4D5754525351554F544553414C45534C45414400000000FFFFFFFFFFFFFFFF01
        000000000000001751756F746520496D706F7274616E6365205265706F727414
        46524D5754525351554F5445494D504C4556454C00000000FFFFFFFFFFFFFFFF
        01000000000000001551756F7465204465636C696E6520526561736F6E731346
        524D5754525351554F54454445434C494E4500000000FFFFFFFFFFFFFFFF0100
        0000000000001351756F7465204576656E7473205265706F72741146524D5754
        525351554F54454556454E5400000000FFFFFFFFFFFFFFFF0100000000000000
        1351756F746520457870697279205265706F72741246524D5754525351554F54
        45455850495259FFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = enableSelect
      OnDblClick = lstvwReportsDblClick
    end
  end
  object Panel2: TPanel
    ParentBackground = False
    Left = 0
    Top = 143
    Width = 412
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      412
      41)
    object btnselect: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Select'
      Enabled = False
      TabOrder = 0
      OnClick = btnselectClick
    end
    object Button2: TButton
      Left = 327
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
