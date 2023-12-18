object frmPBRSQuote: TfrmPBRSQuote
  Left = 416
  Top = 188
  BorderStyle = bsDialog
  Caption = 'Print Quote Details'
  ClientHeight = 243
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 414
    Height = 243
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      414
      243)
    object CancelBitBtn: TBitBtn
      Left = 9
      Top = 209
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
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
      Left = 97
      Top = 209
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
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
      Left = 177
      Top = 209
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
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
    object FaxBitBtn: TBitBtn
      Left = 257
      Top = 209
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Fax'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
    object EmailBitBtn: TBitBtn
      Left = 336
      Top = 209
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Email'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
        000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
        FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
        FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
        9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
        0000777777777777777733333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      TabOrder = 4
      OnClick = EmailBitBtnClick
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 5
      Width = 393
      Height = 148
      ParentBackground = False
      TabOrder = 5
      object EstNumLabel: TLabel
        Left = 8
        Top = 15
        Width = 32
        Height = 13
        Caption = 'Quote'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 8
        Top = 43
        Width = 49
        Height = 13
        Caption = 'Customer'
      end
      object Label2: TLabel
        Left = 8
        Top = 75
        Width = 59
        Height = 13
        Caption = 'Description'
      end
      object Label3: TLabel
        Left = 8
        Top = 111
        Width = 44
        Height = 13
        Caption = 'Quantity'
      end
      object memSelection: TMemo
        Left = 88
        Top = 11
        Width = 97
        Height = 21
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        WantReturns = False
        WordWrap = False
      end
      object edtCustomer: TMemo
        Left = 88
        Top = 39
        Width = 297
        Height = 21
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        WantReturns = False
        WordWrap = False
      end
      object memDescription: TMemo
        Left = 88
        Top = 72
        Width = 297
        Height = 21
        Color = clWhite
        ReadOnly = True
        TabOrder = 2
      end
      object SelectLst: TListBox
        Left = 304
        Top = 3
        Width = 25
        Height = 105
        ItemHeight = 13
        Sorted = True
        TabOrder = 3
        Visible = False
      end
      object memQuantity: TMemo
        Left = 88
        Top = 107
        Width = 97
        Height = 21
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        WantReturns = False
        WordWrap = False
      end
    end
    object chkbxShowDetails: TCheckBox
      Left = 8
      Top = 160
      Width = 177
      Height = 17
      Caption = 'Show detailed breakdown'
      TabOrder = 6
    end
    object chkbxEndUser: TCheckBox
      Left = 8
      Top = 184
      Width = 177
      Height = 17
      Caption = 'Print/Email End User Version'
      TabOrder = 7
    end
  end
  object qryGetRange: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT distinct Works_Order.Works_Order_number'
      'FROM Works_order'
      'WHERE'
      '  (Works_Order_Number >= :From_Works_Order) and'
      '  (Works_Order_Number <= :To_Works_order)')
    Left = 240
    Top = 40
    ParamData = <
      item
        Name = 'From_Works_Order'
      end
      item
        Name = 'To_Works_order'
      end>
  end
  object qryGetQuote: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT  Int_Sel.Int_Sel_Code,'
      '        Int_Sel.Sel1,'
      '        Quote.Quote,'
      '        Quote.Customer,'
      '        Quote.Customer_Name,'
      '        Quote.Contact_Name,'
      '        Customer.Fax_number as Customer_Fax,'
      '        Customer.Email_Address as Customer_Email,'
      '        Customer.Is_Retail_Customer'
      'FROM Int_Sel'
      '      RIGHT JOIN (Customer'
      '      INNER JOIN Quote ON'
      '        Customer.Customer = Quote.Customer) ON'
      '        Int_Sel.Sel1 = Quote.Quote'
      'WHERE Int_Sel.Int_Sel_Code = :Int_Sel_Code')
    Left = 168
    Top = 42
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end>
  end
  object qryBlank: TFDQuery
    ConnectionName = 'PB'
    Left = 168
    Top = 101
  end
end
