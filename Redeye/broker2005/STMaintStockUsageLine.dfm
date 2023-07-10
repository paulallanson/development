object STMaintStockUsageLineFrm: TSTMaintStockUsageLineFrm
  Left = 356
  Top = 132
  BorderStyle = bsDialog
  Caption = 'Maintain Stock Usage Details'
  ClientHeight = 266
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    616
    266)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 65
    Height = 13
    Caption = 'Product Code'
  end
  object lblDescription: TLabel
    Left = 368
    Top = 24
    Width = 63
    Height = 13
    Caption = 'lblDescription'
  end
  object Label3: TLabel
    Left = 16
    Top = 68
    Width = 40
    Height = 13
    Caption = 'In Stock'
  end
  object Label4: TLabel
    Left = 16
    Top = 148
    Width = 52
    Height = 13
    Caption = 'Adjustment'
  end
  object Label5: TLabel
    Left = 16
    Top = 108
    Width = 53
    Height = 13
    Caption = 'New Stock'
  end
  object edtProduct: TEdit
    Left = 96
    Top = 20
    Width = 217
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    Text = 'EDTPRODUCT'
    OnChange = EnableOK
    OnExit = edtProductExit
    OnKeyPress = edtProductKeyPress
  end
  object btnOK: TBitBtn
    Left = 229
    Top = 215
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Enabled = False
    TabOrder = 1
    OnClick = btnOKClick
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
  end
  object btbtnClose: TBitBtn
    Left = 317
    Top = 215
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 2
    Kind = bkCancel
  end
  object memInStock: TMemo
    Left = 97
    Top = 64
    Width = 97
    Height = 23
    Color = clBtnFace
    Enabled = False
    TabOrder = 3
    WantReturns = False
    WordWrap = False
  end
  object memNewStock: TMemo
    Left = 97
    Top = 104
    Width = 97
    Height = 23
    TabOrder = 4
    WantReturns = False
    WordWrap = False
    OnChange = memNewStockChange
    OnEnter = memNewStockEnter
    OnExit = memNewStockExit
  end
  object memAdj: TMemo
    Left = 97
    Top = 144
    Width = 97
    Height = 23
    Color = clBtnFace
    Enabled = False
    TabOrder = 5
    WantReturns = False
    WordWrap = False
  end
  object btnPart: TBitBtn
    Left = 320
    Top = 18
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnPartClick
  end
  object qryGetPart: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Part'
      'where Part = :Part')
    Left = 256
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
end
