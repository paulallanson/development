object frmWTLUCustomerRpts: TfrmWTLUCustomerRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Customer Reports'
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
        130100000400000000000000FFFFFFFFFFFFFFFF01000000000000001353616C
        657320416374696F6E205265706F72741546524D57545253435553544F4D4552
        414354494F4E00000000FFFFFFFFFFFFFFFF010000000000000018437573746F
        6D6572204163746976697479205265706F72741746524D57545253435553544F
        4D4552414354495649545900000000FFFFFFFFFFFFFFFF010000000000000018
        437573746F6D657220436F6E746163742044657461696C731246524D57545253
        43555354434F4E5444455400000000FFFFFFFFFFFFFFFF010000000000000016
        52657461696C20416464726573732044657461696C731446524D575452535245
        5441494C41444452455353FFFFFFFFFFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = enableSelect
      OnDblClick = lstvwReportsDblClick
    end
  end
  object Panel2: TPanel
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
