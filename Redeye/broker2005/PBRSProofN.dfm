object PBRSProofNFrm: TPBRSProofNFrm
  Left = 260
  Top = 159
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Proof Approval Print'
  ClientHeight = 183
  ClientWidth = 355
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 64
    Width = 74
    Height = 13
    Caption = 'Proof Revision'
  end
  object Label2: TLabel
    Left = 16
    Top = 96
    Width = 58
    Height = 13
    Caption = 'New Status'
  end
  object PrintBitBtn: TBitBtn
    Left = 184
    Top = 152
    Width = 75
    Height = 25
    Caption = '&Print'
    Enabled = False
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
    TabOrder = 0
    OnClick = PrintBitBtnClick
  end
  object PreviewBitBtn: TBitBtn
    Left = 96
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Pre&view'
    Enabled = False
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
  object CancelBitBtn: TBitBtn
    Left = 8
    Top = 152
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
    TabOrder = 2
  end
  object SelOneGrpBox: TGroupBox
    Left = 16
    Top = 0
    Width = 265
    Height = 41
    ParentBackground = False
    TabOrder = 3
    object EstNumLabel: TLabel
      Left = 8
      Top = 22
      Width = 65
      Height = 13
      Caption = 'P.O. Number'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object QuoLUSpeedButton: TSpeedButton
      Left = 224
      Top = 10
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object OrderMemo: TMemo
      Left = 96
      Top = 10
      Width = 105
      Height = 25
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      WantReturns = False
      OnKeyPress = OrderMemoKeyPress
    end
  end
  object chkbxPrintLogo: TCheckBox
    Left = 8
    Top = 124
    Width = 129
    Height = 17
    Caption = 'Print Company Logo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object edtProofRevision: TEdit
    Left = 104
    Top = 56
    Width = 177
    Height = 21
    TabOrder = 5
  end
  object dblkpProofStatus: TDBLookupComboBox
    Left = 104
    Top = 88
    Width = 177
    Height = 21
    KeyField = 'Proof_Status'
    ListField = 'Description'
    ListSource = ProofStatusSRC
    TabOrder = 6
    OnClick = CanPrint
  end
  object EmailBitBtn: TBitBtn
    Left = 272
    Top = 151
    Width = 75
    Height = 25
    Caption = '&Email'
    Enabled = False
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
    TabOrder = 7
    OnClick = EmailBitBtnClick
  end
  object GetPOsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '               Purchase_OrderLine.Supplier_Job_Ref, Purchase_Ord' +
        'erLine.Goods_Required,'
      
        '               Purchase_OrderLine.Enquiry, Purchase_OrderLine.Li' +
        'ne0,'
      
        '               Purchase_OrderLine.Quantity, Purchase_OrderLine.O' +
        'rder_Price, '
      
        '               Purchase_Order.Date_Point, Purchase_OrderLine.Sup' +
        'pliers_Desc, Purchase_OrderLine.Customers_Desc,'
      
        '               Purchase_OrderLine.Supplier_Job_Ref, Purchase_Ord' +
        'erLine.Product_Type,'
      '               Supplier.Name, Supplier_Branch.Building_No_name,'
      
        '               Supplier_Branch.Street, Supplier_Branch.Locale, S' +
        'upplier_Branch.Town, '
      
        '               Supplier_Branch.Postcode, Supplier_Branch.Supplie' +
        'r,'
      
        '               Supplier_Branch.Branch_No, Supplier_Branch.Fax_Nu' +
        'mber,'
      '               Purchase_Orderline.Proof_Revision'
      
        'FROM Purchase_Order, Supplier_Branch, Supplier, Purchase_OrderLi' +
        'ne'
      
        'WHERE (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) and'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) and'
      '      (Supplier_Branch.Branch_No = Purchase_Order.Branch_No) and'
      '      (Supplier.Supplier = Supplier_Branch.Supplier) and'
      
        '      ((Purchase_Orderline.Purchase_Order = :Purchase_Order ) an' +
        'd'
      '      (Purchase_OrderLine.Line = :Line)'
      '      )')
    Left = 232
    Top = 98
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
      end
      item
        Name = 'Line'
      end>
  end
  object UpdPOSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Purchase_orderLine'
      'set Proof_Revision = :Proof_Revision'
      'where Purchase_Order = :Purchase_order and'
      'Line = :Line')
    Left = 232
    Top = 56
    ParamData = <
      item
        Name = 'Proof_Revision'
      end
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end>
  end
  object ProofStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'from Proof_Status')
    Left = 88
    Top = 16
  end
  object ProofStatusSRC: TDataSource
    DataSet = ProofStatusSQL
    Left = 16
    Top = 85
  end
  object DefStatSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Proof_Status'
      'from Proof_Status'
      'where Proof_Approval_Status = '#39'Y'#39)
    Left = 152
    Top = 112
  end
end
