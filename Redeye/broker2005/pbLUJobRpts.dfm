object frmPBLUJobRpts: TfrmPBLUJobRpts
  Left = 201
  Top = 107
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Job bag Reports'
  ClientHeight = 257
  ClientWidth = 363
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
    Width = 363
    Height = 216
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 363
      Height = 216
      Align = alClient
      Columns = <
        item
          Caption = 'Description'
          Width = 250
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
        4E0200000800000000000000FFFFFFFFFFFFFFFF01000000000000001D4F7264
        657273206E6F7420696E206A6F622062616773207265706F7274105042525350
        4F4E4F544F4E4A4246524D00000000FFFFFFFFFFFFFFFF010000000000000015
        4A6F6220426167204D617267696E205265706F72740F504252534A424D415247
        494E46524D00000000FFFFFFFFFFFFFFFF0100000000000000204A6F62204261
        6720556E696E766F696365642053746F636B205265717565737416504252534A
        4F4242414757495053544B52455146524D00000000FFFFFFFFFFFFFFFF010000
        000000000028574950205265706F7274202D205075726368617365204F726465
        727320696E204A6F62204261677310504252534A4F4242414757495046524D00
        000000FFFFFFFFFFFFFFFF01000000000000002C574950205265706F7274202D
        2050726F64756374696F6E204368617267657320696E204A6F62202042616773
        16504252534A4F4242414745585452415357495046524D00000000FFFFFFFFFF
        FFFFFF01000000000000001F5072652D50726F64756374696F6E205363686564
        756C65205265706F727473135042525344415441534552565357495046524D00
        000000FFFFFFFFFFFFFFFF01000000000000001A4A6F62204261672053746F63
        6B204F76657273205265706F727412504252534A4F424241474F564552534652
        4D00000000FFFFFFFFFFFFFFFF0100000000000000124A6F6220426167205749
        50205265706F727415504252534A4F42424147434F4D504C45544546524DFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lstvwReportsDblClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 216
    Width = 363
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      363
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
      Left = 278
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
