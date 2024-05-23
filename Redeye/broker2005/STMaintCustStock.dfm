object STMaintCustStockFrm: TSTMaintCustStockFrm
  Left = 35
  Top = 11
  Caption = 'Maintain Customer Stock Records'
  ClientHeight = 530
  ClientWidth = 784
  Color = clBtnFace
  Constraints.MinHeight = 568
  Constraints.MinWidth = 796
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 470
    Width = 784
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      784
      41)
    object btnClose: TBitBtn
      Left = 691
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
    Height = 470
    Align = alLeft
    ParentBackground = False
    TabOrder = 1
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 335
      Height = 72
      Align = alTop
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 78
        Height = 13
        Caption = 'Customer From'
      end
      object edtCustomerFrom: TEdit
        Left = 16
        Top = 32
        Width = 225
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnLUCustomerFrom: TBitBtn
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
        OnClick = btnLUCustomerFromClick
      end
    end
    object dbgDetailsFrom: TDBGrid
      Left = 1
      Top = 73
      Width = 335
      Height = 347
      Align = alClient
      DataSource = dtsProductsFrom
      DrawingStyle = gdsGradient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Part'
          Title.Caption = 'Product'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Part_Description'
          Title.Caption = 'Description'
          Width = 205
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 1
      Top = 420
      Width = 335
      Height = 49
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        335
        49)
      object Label3: TLabel
        Left = 5
        Top = 9
        Width = 34
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Search'
      end
      object lblRecordsFrom: TLabel
        Left = 5
        Top = 32
        Width = 80
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'lblRecordsFrom'
      end
      object edtSearchFrom: TEdit
        Left = 54
        Top = 5
        Width = 211
        Height = 21
        Anchors = [akLeft, akBottom]
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = edtSearchFromChange
      end
    end
  end
  object pnlRight: TPanel
    Left = 429
    Top = 0
    Width = 355
    Height = 470
    Align = alClient
    ParentBackground = False
    TabOrder = 2
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 353
      Height = 72
      Align = alTop
      ParentBackground = False
      TabOrder = 0
      object Label2: TLabel
        Left = 16
        Top = 16
        Width = 64
        Height = 13
        Caption = 'Customer To'
      end
      object edtCustomerTo: TEdit
        Left = 16
        Top = 32
        Width = 225
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnLUCustomerTo: TBitBtn
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
        OnClick = btnLUCustomerToClick
      end
    end
    object dbgDetailsTo: TDBGrid
      Left = 1
      Top = 73
      Width = 353
      Height = 347
      Align = alClient
      DataSource = dtsProductsTo
      DrawingStyle = gdsGradient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Part'
          Title.Caption = 'Product'
          Width = 129
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Part_Description'
          Title.Caption = 'Description'
          Width = 210
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 420
      Width = 353
      Height = 49
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        353
        49)
      object Label5: TLabel
        Left = 5
        Top = 9
        Width = 34
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Search'
      end
      object lblRecordsTo: TLabel
        Left = 5
        Top = 32
        Width = 66
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'lblRecordsTo'
      end
      object edtSearchTo: TEdit
        Left = 54
        Top = 5
        Width = 227
        Height = 21
        Anchors = [akLeft, akBottom]
        CharCase = ecUpperCase
        TabOrder = 0
        OnChange = edtSearchToChange
      end
    end
  end
  object pnlCentre: TPanel
    Left = 337
    Top = 0
    Width = 92
    Height = 470
    Align = alLeft
    ParentBackground = False
    TabOrder = 3
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
      OnClick = btnFromMultiClick
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
      OnClick = btnToMultiClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 511
    Width = 784
    Height = 19
    Panels = <>
  end
  object qryProductsFrom: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Part'
      'where (Customer = :Customer) and'
      '      ('
      '      (Part.Part Like :Description) or'
      '      (Part.Part_description Like :Description)'
      '      )'
      'order By Part')
    Left = 152
    Top = 120
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Description'
      end>
  end
  object dtsProductsFrom: TDataSource
    DataSet = qryProductsFrom
    Left = 272
    Top = 120
  end
  object qryProductsTo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Part'
      'Where (Customer = :Customer) and'
      '      ('
      '      (Part.Part Like :Description) or'
      '      (Part.Part_description Like :Description)'
      '      )'
      'order By Part')
    Left = 565
    Top = 128
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Description'
      end>
  end
  object dtsProductsTo: TDataSource
    DataSet = qryProductsTo
    Left = 669
    Top = 128
  end
  object qryUpdPart: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update Part'
      'set Customer = :Customer, Branch_no = :Branch_no'
      'where Part = :Part')
    Left = 369
    Top = 328
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Part'
      end>
  end
  object qryUpdFormRef: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update Form_Reference'
      'set Customer = :Customer, Branch_no = :Branch_no'
      'where Stock_Reference = :Stock_Reference')
    Left = 369
    Top = 392
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Stock_Reference'
      end>
  end
  object tmrSearch: TTimer
    Interval = 500
    OnTimer = tmrSearchTimer
    Left = 565
    Top = 208
  end
end
