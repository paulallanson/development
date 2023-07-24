object frmPBLUCustomerRpts: TfrmPBLUCustomerRpts
  Left = 201
  Top = 107
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Customer Reports'
  ClientHeight = 283
  ClientWidth = 413
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
    ParentBackground = False
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
        D10000000300000000000000FFFFFFFFFFFFFFFF010000000000000016437573
        746F6D65722F4272616E6368205265706F72740E504252534355535444455446
        524D00000000FFFFFFFFFFFFFFFF010000000000000018437573746F6D657220
        436F6E7461637473205265706F7274125042525343555354434F4E5444455446
        524D00000000FFFFFFFFFFFFFFFF01000000000000001B4163636F756E74204D
        616E6167657220506572666F726D616E636518504252534143434D414E504552
        464F524D414E434546524DFFFFFFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lstvwReportsDblClick
    end
  end
  object Panel2: TPanel
    ParentBackground = False
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
