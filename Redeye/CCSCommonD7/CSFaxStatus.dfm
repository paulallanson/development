object frmCSFaxStatus: TfrmCSFaxStatus
  Left = 74
  Top = 110
  Width = 651
  Height = 383
  Caption = 'Maintain Faxes'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 200
    Top = 64
    Width = 251
    Height = 24
    Caption = 'Belling After Sales Division'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 312
    Width = 643
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 248
      Height = 44
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object CancelFaxBitBtn: TBitBtn
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cancel'
        TabOrder = 0
        OnClick = CancelFaxBitBtnClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
      end
      object ReQueFaxBitBtn: TBitBtn
        Left = 88
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Re-Que'
        TabOrder = 1
        OnClick = ReQueFaxBitBtnClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
      object ReFreshBitBtn: TBitBtn
        Left = 168
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Refresh'
        TabOrder = 2
        OnClick = ReFreshBitBtnClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
          C8807FF7777777777FF700000000000000007777777777777777333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
    object Panel3: TPanel
      Left = 553
      Top = 0
      Width = 90
      Height = 44
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 6
        Top = 8
        Width = 75
        Height = 25
        TabOrder = 0
        OnClick = BitBtn1Click
        Kind = bkCancel
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 643
    Height = 312
    Align = alClient
    Caption = 'Panel4'
    TabOrder = 1
    object ShowFaxesDBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 641
      Height = 310
      Align = alClient
      DataSource = GetFaxesDataSource
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnColEnter = ShowFaxesDBGridColEnter
      OnDblClick = ShowFaxesDBGridColEnter
    end
  end
  object GetFaxesQuery: TFDQuery
    ConnectionName = 'faxesSQL'
    SQL.Strings = (
      'SELECT  CreatedOn , Description , Status_Descr ,'
      
        ' NoOfRetries , UserName , PhoneNo,  LastTried, filename, faxstat' +
        '.status'
      'FROM Faxstat , Status'
      'Where '
      '(CreatedOn >= :Start_Date) and'
      '(faxstat.status = status.status)'
      'Order By CreatedOn Desc')
    Left = 336
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Start_Date'
        ParamType = ptUnknown
      end>
  end
  object GetFaxesDataSource: TDataSource
    AutoEdit = False
    DataSet = GetFaxesQuery
    Left = 520
    Top = 16
  end
  object GetFaxQuery: TFDQuery
    ConnectionName = 'faxesSQL'
    SQL.Strings = (
      'Select * From FaxStat'
      'Where FileName = :FileName')
    Left = 432
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FileName'
        ParamType = ptUnknown
      end>
  end
  object UpdFaxQuery: TFDQuery
    ConnectionName = 'faxesSQL'
    SQL.Strings = (
      'Update FaxStat'
      'set'
      'Status = :Status,'
      'NoOfRetries = :NoOfRetries'
      'Where FileName = :FileName')
    Left = 240
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NoOfRetries'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FileName'
        ParamType = ptUnknown
      end>
  end
  object FaxDatabase: TFDConnection
    ConnectionDefName = 'faxes'
    ConnectionName = 'faxesSQL'

    OnLogin = FaxDatabaseLogin
    Left = 144
    Top = 24
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 320
    Top = 88
  end
end
