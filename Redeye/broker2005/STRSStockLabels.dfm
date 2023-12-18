object STRSStockLabelsfrm: TSTRSStockLabelsfrm
  Left = 206
  Top = 65
  BorderStyle = bsDialog
  Caption = 'Print Stock Labels'
  ClientHeight = 220
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object CancelBitBtn: TBitBtn
    Left = 16
    Top = 181
    Width = 75
    Height = 25
    Caption = '&Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Kind = bkCancel
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 0
  end
  object PreviewBitBtn: TBitBtn
    Left = 136
    Top = 181
    Width = 75
    Height = 25
    Caption = 'Pre&view'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 1
    OnClick = PreviewBitBtnClick
  end
  object PrintBitBtn: TBitBtn
    Left = 224
    Top = 181
    Width = 75
    Height = 25
    Caption = '&Print'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
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
    ParentFont = False
    TabOrder = 2
    OnClick = PrintBitBtnClick
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 8
    Width = 361
    Height = 137
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 108
      Width = 52
      Height = 13
      Caption = 'Customer:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object CustomerLbl: TLabel
      Left = 120
      Top = 108
      Width = 64
      Height = 13
      Caption = 'CustomerLbl'
    end
    object Label2: TLabel
      Left = 16
      Top = 47
      Width = 62
      Height = 13
      Caption = 'Description:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object DescrLbl: TLabel
      Left = 120
      Top = 47
      Width = 43
      Height = 13
      Caption = 'DescrLbl'
    end
    object Label3: TLabel
      Left = 16
      Top = 20
      Width = 73
      Height = 13
      Caption = 'Product Code:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object productlbl: TLabel
      Left = 120
      Top = 20
      Width = 55
      Height = 13
      Caption = 'ProductLbl'
    end
    object Label4: TLabel
      Left = 16
      Top = 76
      Width = 83
      Height = 13
      Caption = 'Form Reference:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object FromReferencelbl: TLabel
      Left = 120
      Top = 76
      Width = 90
      Height = 13
      Caption = 'FromReferencelbl'
    end
  end
  object chkbxPrintLogo: TCheckBox
    Left = 16
    Top = 152
    Width = 153
    Height = 17
    Caption = 'Print Company logo'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object CountSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Part.Part, Part.Part_Description, Customer.Name, Part.Sel' +
        'l_Pack_Quantity'
      
        'FROM Part LEFT JOIN Customer ON Part.Customer = Customer.Custome' +
        'r'
      'where part.part = :part'
      ''
      ' '
      ' '
      ' ')
    Left = 288
    Top = 56
    ParamData = <
      item
        Name = 'part'
      end>
  end
end
