object frmWTLUManagementRpts: TfrmWTLUManagementRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Management Reports'
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
        1D0100000400000000000000FFFFFFFFFFFFFFFF01000000000000001F53616C
        6573204F72646572732064756520666F722074656D706C6174696E671546524D
        57545253534F5244455254454D504C41544500000000FFFFFFFFFFFFFFFF0100
        0000000000001C416E74696369706174656420496E766F6963696E6720526570
        6F72741346524D57545253534F414E54494E564F49434500000000FFFFFFFFFF
        FFFFFF01000000000000001453616C6573204F72646572205363686564756C65
        1546524D57545253534F524445525343484544554C4500000000FFFFFFFFFFFF
        FFFF01000000000000001B4A6F6220576F726B20696E2050726F677265737320
        5265706F72740E46524D575452534F55544A4F4253FFFFFFFFFFFFFFFF}
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
