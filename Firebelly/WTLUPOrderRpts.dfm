object frmWTLUPOrderRpts: TfrmWTLUPOrderRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Purchase Order Reports'
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
        DA0000000300000000000000FFFFFFFFFFFFFFFF010000000000000015507572
        6368617365204F72646572205265706F72741446524D57545253505552434841
        53454F5244455200000000FFFFFFFFFFFFFFFF01000000000000001E4F726465
        72732044756520666F722044656C6976657279205265706F72741246524D5754
        5253504F4F524445525344554500000000FFFFFFFFFFFFFFFF01000000000000
        00184F75747374616E64696E67204F72646572205265706F72741946524D5754
        5253504F52444552534F55545354414E44494E47FFFFFFFFFFFF}
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
