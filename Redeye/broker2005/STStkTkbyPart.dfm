object STStkTkbyPartFrm: TSTStkTkbyPartFrm
  Left = 4
  Top = 76
  Caption = 'Enter Stock Count Details '
  ClientHeight = 427
  ClientWidth = 774
  Color = clBtnFace
  Constraints.MinHeight = 466
  Constraints.MinWidth = 790
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 115
      Height = 13
      Caption = 'Stock Count Reference '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 288
      Top = 8
      Width = 28
      Height = 13
      Caption = 'Store:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object StoreNameLbl: TLabel
      Left = 336
      Top = 8
      Width = 67
      Height = 13
      Caption = 'StoreNameLbl'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 688
    Top = 41
    Width = 86
    Height = 367
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      86
      367)
    object AddBitBtn: TBitBtn
      Left = 6
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Add'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = AddBitBtnClick
    end
    object Changebtn: TBitBtn
      Left = 6
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Change'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = ChangebtnClick
    end
    object DeleteBitBtn: TBitBtn
      Left = 6
      Top = 72
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Delete'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnClick = DeleteBitBtnClick
    end
    object ConfirmBtn: TBitBtn
      Left = 6
      Top = 309
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'C&onfirm'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 3
      OnClick = ConfirmBtnClick
    end
    object BitBtn2: TBitBtn
      Left = 6
      Top = 341
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Ca&ncel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 4
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 408
    Width = 774
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 688
    Height = 367
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 3
    object Panel4: TPanel
      Left = 0
      Top = 326
      Width = 688
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object Label3: TLabel
        Left = 5
        Top = 15
        Width = 48
        Height = 13
        Caption = 'Import File'
      end
      object edtFile: TEdit
        Left = 61
        Top = 11
        Width = 345
        Height = 21
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
        OnChange = edtFileChange
      end
      object btnBrowse: TBitBtn
        Left = 416
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 1
        OnClick = btnBrowseClick
      end
      object btnImport: TBitBtn
        Left = 504
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Import'
        TabOrder = 2
        OnClick = btnImportClick
      end
    end
    object CountGrid: TStringGrid
      Left = 0
      Top = 0
      Width = 688
      Height = 326
      Align = alClient
      ColCount = 7
      DefaultColWidth = 60
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect, goThumbTracking]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      OnClick = CountGridClick
      OnDblClick = CountGridDblClick
      OnDrawCell = CountGridDrawCell
      OnSelectCell = CountGridSelectCell
      ColWidths = (
        89
        138
        180
        72
        69
        67
        65)
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Left = 640
    Top = 217
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select * from [Sheet1$]')
    Left = 640
    Top = 273
  end
  object DocOpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofAllowMultiSelect, ofEnableSizing]
    Left = 528
    Top = 216
  end
  object qryUpdStocktake: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Stock_Take'
      'set Stock_Take_Qty = :Stock_Take_Qty, Stock_Take_Status = '#39'H'#39
      'Where Stock_Take = :Stock_Take')
    Left = 200
    Top = 217
    ParamData = <
      item
        Name = 'Stock_Take_Qty'
      end
      item
        Name = 'Stock_Take'
      end>
  end
  object qryUpdStockTakeStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Stock_Take'
      'set Stock_Take_Status = '#39'H'#39
      'Where Stock_Take = :Stock_Take')
    Left = 328
    Top = 217
    ParamData = <
      item
        Name = 'Stock_Take'
      end>
  end
end
