object STLUCourierServFrm: TSTLUCourierServFrm
  Left = 427
  Top = 157
  BorderStyle = bsDialog
  Caption = 'Maintain Courier Services'
  ClientHeight = 331
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblCourier: TLabel
    Left = 8
    Top = 6
    Width = 43
    Height = 13
    Caption = 'lblCourier'
  end
  object CountLabel: TLabel
    Left = 195
    Top = 230
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = 'CountLabel'
  end
  object DetsDBGrid: TDBGrid
    Left = 8
    Top = 28
    Width = 241
    Height = 193
    DataSource = DetsSRC
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DetsDBGridDrawColumnCell
    OnDblClick = DetsDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Service_Description'
        Title.Caption = 'Service'
        Width = 177
        Visible = True
      end>
  end
  object CloseBitBtn: TBitBtn
    Left = 268
    Top = 288
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkClose
  end
  object FuncGrpBox: TGroupBox
    Left = 264
    Top = 120
    Width = 87
    Height = 105
    Caption = 'Function'
    TabOrder = 2
    object AddBitBtn: TBitBtn
      Left = 6
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 0
      OnClick = AddBitBtnClick
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
    end
    object ChgBitBtn: TBitBtn
      Left = 6
      Top = 44
      Width = 75
      Height = 25
      Caption = 'Change'
      TabOrder = 1
      OnClick = ChgBitBtnClick
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
    end
    object DelBitBtn: TBitBtn
      Left = 6
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Delete'
      TabOrder = 2
      OnClick = DelBitBtnClick
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
  end
  object SearchGrpBox: TGroupBox
    Left = 8
    Top = 247
    Width = 241
    Height = 74
    Caption = 'Type here to narrow the search'
    TabOrder = 3
    object NameEdit: TEdit
      Left = 8
      Top = 16
      Width = 217
      Height = 21
      TabOrder = 0
      OnChange = NameEditChange
    end
    object chkbxActiveOnly: TCheckBox
      Left = 8
      Top = 48
      Width = 217
      Height = 17
      Caption = 'Only show active services'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = chkbxActiveOnlyClick
    end
  end
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 240
    Top = 72
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From courier_service'
      'where courier = :courier and'
      'Service_Description like :Code_From and'
      
        '((inactive = '#39'N'#39') or (inactive is NULL) or (inactive = :inactive' +
        '))'
      'Order By courier_service.Service_Description')
    Left = 32
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'courier'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Code_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end>
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 200
    Top = 152
  end
end
