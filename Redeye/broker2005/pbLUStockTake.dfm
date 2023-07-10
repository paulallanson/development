object frmPBLUStocktake: TfrmPBLUStocktake
  Left = 394
  Top = 155
  Width = 421
  Height = 310
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Stocktake'
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
        6E0100000700000000000000FFFFFFFFFFFFFFFF01000000000000000F507269
        6E7420576F726B73686565740C535453544B544B534C46524D00000000FFFFFF
        FFFFFFFFFF010000000000000012467265657A652053746F636B20436F756E74
        0E535453544B544B53454C46524D3100000000FFFFFFFFFFFFFFFF0100000000
        00000015456E7465722053746F636B74616B6520436F756E740E535453544B54
        4B53454C46524D3200000000FFFFFFFFFFFFFFFF01000000000000001353746F
        636B74616B652056616C756174696F6E0E535453544B544B53454C46524D3300
        000000FFFFFFFFFFFFFFFF01000000000000001453746F636B20436F756E7420
        56617269616E63650E535453544B544B53454C46524D3400000000FFFFFFFFFF
        FFFFFF0100000000000000125570646174652053746F636B20436F756E740E53
        5453544B544B53454C46524D3500000000FFFFFFFFFFFFFFFF00000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFF}
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
