object frmWTLUJobRpts: TfrmWTLUJobRpts
  Left = 581
  Top = 265
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Job Production Reports'
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
        F60000000400000000000000FFFFFFFFFFFFFFFF010000000000000017576F72
        6B20696E2050726F6772657373205265706F72740E46524D575452534F55544A
        4F425300000000FFFFFFFFFFFFFFFF0100000000000000104A6F622056616C75
        65205265706F72740F46524D575452534A4F4256414C554500000000FFFFFFFF
        FFFFFFFF01000000000000001052656D656469616C73205265706F7274134652
        4D575452534A4F4252454D454449414C5300000000FFFFFFFFFFFFFFFF010000
        00000000001452656D656469616C2054797065205265706F72741346524D5754
        525352454D454449414C54595045FFFFFFFFFFFFFFFF}
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
