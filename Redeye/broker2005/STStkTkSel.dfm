object STStkTkSelFrm: TSTStkTkSelFrm
  Left = 252
  Top = 128
  BorderStyle = bsDialog
  Caption = 'Stock Count Selection Form'
  ClientHeight = 249
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 131
    Height = 13
    Caption = 'Stock Count List Reference'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object StkTkListBox: TDBLookupListBox
    Left = 16
    Top = 32
    Width = 209
    Height = 199
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'Stock_Take_Ref'
    ListField = 'Stock_Take_Ref'
    ListSource = STStkTkDM.CountListSRC
    ParentFont = False
    TabOrder = 0
    OnDblClick = StkTkListBoxDblClick
  end
  object PartCodeBitBtn: TBitBtn
    Left = 240
    Top = 32
    Width = 81
    Height = 25
    Caption = '&Select'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = PartCodeBitBtnClick
  end
  object BitBtn3: TBitBtn
    Left = 240
    Top = 206
    Width = 75
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtnCncl: TBitBtn
    Left = 240
    Top = 64
    Width = 81
    Height = 25
    Caption = '&Cancel Count'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnClick = BitBtnCnclClick
  end
  object DelCountRecSQl: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Stock_Take'
      'where Stock_Take.Stock_Take_Ref = :Stock_Take_Ref'
      ' ')
    Left = 264
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Stock_Take_Ref'
        ParamType = ptUnknown
      end>
  end
end
