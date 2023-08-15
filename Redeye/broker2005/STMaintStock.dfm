object STMaintStockFrm: TSTMaintStockFrm
  Left = 2
  Top = 5
  Caption = 'Maintain Stock Records'
  ClientHeight = 521
  ClientWidth = 778
  Color = clBtnFace
  Constraints.MinHeight = 568
  Constraints.MinWidth = 796
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 461
    Width = 778
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 474
    ExplicitWidth = 788
    DesignSize = (
      778
      41)
    object btnClose: TBitBtn
      Left = 693
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 461
    Align = alLeft
    TabOrder = 1
    ExplicitHeight = 474
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 335
      Height = 88
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 63
        Height = 13
        Caption = 'Product From'
      end
      object lblDescriptionFrom: TLabel
        Left = 16
        Top = 64
        Width = 86
        Height = 13
        Caption = 'lblDescriptionFrom'
      end
      object edtPartFrom: TEdit
        Left = 16
        Top = 32
        Width = 225
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object PartBitBtn: TBitBtn
        Left = 252
        Top = 30
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = PartBitBtnClick
      end
    end
    object dbgDetailsFrom: TDBGrid
      Left = 1
      Top = 89
      Width = 335
      Height = 384
      Align = alClient
      DataSource = dtsStockFrom
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgDetailsFromDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Part_Bin'
          Title.Caption = 'Bin'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Store_Quantity'
          Title.Caption = 'Quantity'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date_Received'
          Title.Caption = 'Date Received'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Store_Stock_Description'
          Title.Caption = 'Description'
          Width = 169
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Part_Store_Lot'
          Title.Caption = 'Lot Code'
          Width = 66
          Visible = True
        end>
    end
  end
  object pnlRight: TPanel
    Left = 429
    Top = 0
    Width = 349
    Height = 461
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 359
    ExplicitHeight = 474
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 357
      Height = 88
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 16
        Top = 16
        Width = 53
        Height = 13
        Caption = 'Product To'
      end
      object lblDescriptionTo: TLabel
        Left = 16
        Top = 64
        Width = 76
        Height = 13
        Caption = 'lblDescriptionTo'
      end
      object edtPartTo: TEdit
        Left = 16
        Top = 32
        Width = 225
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object BitBtn5: TBitBtn
        Left = 252
        Top = 30
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BitBtn5Click
      end
    end
    object dbgDetailsTo: TDBGrid
      Left = 1
      Top = 89
      Width = 357
      Height = 384
      Align = alClient
      DataSource = dtsStockTo
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = dbgDetailsToDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Part_Bin'
          Title.Caption = 'Bin'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Store_Quantity'
          Title.Caption = 'Quantity'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date_Received'
          Title.Caption = 'Date Received'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Store_Stock_Description'
          Title.Caption = 'Description'
          Width = 169
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Part_Store_Lot'
          Title.Caption = 'Lot Code'
          Width = 66
          Visible = True
        end>
    end
  end
  object pnlCentre: TPanel
    Left = 337
    Top = 0
    Width = 92
    Height = 461
    Align = alLeft
    TabOrder = 3
    ExplicitHeight = 474
    object btnFromSingle: TBitBtn
      Left = 8
      Top = 120
      Width = 75
      Height = 25
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333FF3333333333333003333
        3333333333773FF3333333333309003333333333337F773FF333333333099900
        33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
        99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
        33333333337F3F77333333333309003333333333337F77333333333333003333
        3333333333773333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnFromSingleClick
    end
    object btnFromMulti: TBitBtn
      Left = 8
      Top = 240
      Width = 75
      Height = 25
      Caption = 'All'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333FF3333333333333003333
        3333333333773FF3333333333309003333333333337F773FF333333333099900
        33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
        99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
        33333333337F3F77333333333309003333333333337F77333333333333003333
        3333333333773333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      Layout = blGlyphRight
      NumGlyphs = 2
      TabOrder = 1
      Visible = False
    end
    object btnToSingle: TBitBtn
      Left = 8
      Top = 160
      Width = 75
      Height = 25
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333FF3333333333333003333333333333F77F33333333333009033
        333333333F7737F333333333009990333333333F773337FFFFFF330099999000
        00003F773333377777770099999999999990773FF33333FFFFF7330099999000
        000033773FF33777777733330099903333333333773FF7F33333333333009033
        33333333337737F3333333333333003333333333333377333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnToSingleClick
    end
    object btnToMulti: TBitBtn
      Left = 8
      Top = 280
      Width = 75
      Height = 25
      Caption = 'All'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333FF3333333333333003333333333333F77F33333333333009033
        333333333F7737F333333333009990333333333F773337FFFFFF330099999000
        00003F773333377777770099999999999990773FF33333FFFFF7330099999000
        000033773FF33777777733330099903333333333773FF7F33333333333009033
        33333333337737F3333333333333003333333333333377333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 3
      Visible = False
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 502
    Width = 778
    Height = 19
    Panels = <>
    ExplicitTop = 515
    ExplicitWidth = 788
  end
  object qryStockFrom: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Store_Stock'
      'where Part = :Part'
      'order By Date_Received')
    Left = 192
    Top = 120
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object dtsStockFrom: TDataSource
    DataSet = qryStockFrom
    Left = 272
    Top = 120
  end
  object qryStockTo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Store_Stock'
      'where Part = :Part'
      'order By Date_Received')
    Left = 565
    Top = 128
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object dtsStockTo: TDataSource
    DataSet = qryStockTo
    Left = 669
    Top = 128
  end
  object qryUpdStoreStock: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update store_stock'
      'set Part = :Part'
      'where Store_Stock = :Store_Stock')
    Left = 369
    Top = 328
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Store_Stock'
      end>
  end
  object qryUpdMovements: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part_Movement'
      'set Part = :Part_To'
      'where Part = :Part_From AND'
      'Part_Store_Lot = :Part_Store_Lot and'
      'Date_Received >= :Date_Received')
    Left = 369
    Top = 384
    ParamData = <
      item
        Name = 'Part_To'
      end
      item
        Name = 'Part_From'
      end
      item
        Name = 'Part_Store_Lot'
      end
      item
        Name = 'Date_Received'
      end>
  end
  object qryGetMovements: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Part_Movement'
      'where Part = :Part and'
      'Date_Received >= :Date_Received')
    Left = 369
    Top = 440
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Date_Received'
      end>
  end
  object qryUpdMovementBal: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update Part_Movement'
      
        'set Part_Store_Total_Quantity =  ISNULL((select top 1 Part_Store' +
        '_Total_Quantity'
      '                                  from Part_Movement PM'
      
        '                                  where pm.Part = Part_Movement.' +
        'Part and'
      
        #9'                                      pm.Part_Movement_Store = ' +
        'Part_Movement.Part_Movement_Store and'
      
        #9'                                      pm.Part_Movement < Part_M' +
        'ovement.Part_Movement'
      
        #9#9#9#9'  order by Part_Movement desc),0) + Part_Movement.Store_Quan' +
        'tity,'
      
        'Part_Store_Total_Value =  ISNULL((select top 1 Part_Store_Total_' +
        'Value'
      '                                  from Part_Movement PM'
      
        '                                  where pm.Part = Part_Movement.' +
        'Part and'
      
        #9'                                      pm.Part_Movement_Store = ' +
        'Part_Movement.Part_Movement_Store and'
      
        #9'                                      pm.Part_Movement < Part_M' +
        'ovement.Part_Movement'
      
        #9#9#9#9'  order by Part_Movement desc),0.00) + Part_Movement.Store_C' +
        'ost'
      ''
      'where Part_movement = :part_movement')
    Left = 368
    Top = 480
    ParamData = <
      item
        Name = 'part_movement'
      end>
  end
end
