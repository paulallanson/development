object PBRSBoxLabelsfrm: TPBRSBoxLabelsfrm
  Left = 473
  Top = 100
  BorderStyle = bsDialog
  Caption = 'Print Box Labels'
  ClientHeight = 408
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    420
    408)
  PixelsPerInch = 96
  TextHeight = 13
  object POGroupBox: TGroupBox
    ParentBackground = False
    Left = 8
    Top = 0
    Width = 393
    Height = 89
    Caption = 'Order: '
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 47
      Height = 13
      Caption = 'Customer:'
    end
    object CustomerLbl: TLabel
      Left = 80
      Top = 24
      Width = 58
      Height = 13
      Caption = 'CustomerLbl'
    end
    object DescrLbl: TLabel
      Left = 80
      Top = 46
      Width = 42
      Height = 13
      Caption = 'DescrLbl'
    end
    object Label2: TLabel
      Left = 7
      Top = 46
      Width = 56
      Height = 13
      Caption = 'Description:'
    end
    object Label7: TLabel
      Left = 21
      Top = 68
      Width = 42
      Height = 13
      Caption = 'Quantity:'
    end
    object QtyLbl: TLabel
      Left = 80
      Top = 68
      Width = 30
      Height = 13
      Caption = 'QtyLbl'
    end
  end
  object GroupBox2: TGroupBox
    ParentBackground = False
    Left = 8
    Top = 142
    Width = 209
    Height = 160
    Caption = 'Box Quantities'
    TabOrder = 1
    object Label3: TLabel
      Left = 49
      Top = 21
      Width = 60
      Height = 13
      Caption = 'Box Quantity'
    end
    object Label4: TLabel
      Left = 17
      Top = 108
      Width = 92
      Height = 13
      Caption = 'Start at box number'
    end
    object Label5: TLabel
      Left = 49
      Top = 79
      Width = 60
      Height = 13
      Caption = 'No. of boxes'
    end
    object Label10: TLabel
      Left = 18
      Top = 50
      Width = 91
      Height = 13
      Caption = 'Sets per Book/Pad'
    end
    object Label11: TLabel
      Left = 77
      Top = 132
      Width = 32
      Height = 13
      Caption = 'Format'
    end
    object BoxQuantityEdit: TEdit
      Left = 120
      Top = 13
      Width = 73
      Height = 21
      TabOrder = 0
      OnKeyPress = BoxQuantityEditKeyPress
      OnKeyUp = BoxQuantityEditKeyUp
    end
    object StartBoxSpinEdit: TSpinEdit
      Left = 120
      Top = 100
      Width = 49
      Height = 22
      MaxValue = 9999
      MinValue = 1
      TabOrder = 2
      Value = 1
    end
    object NoofBoxesSpinEdit: TSpinEdit
      Left = 120
      Top = 71
      Width = 49
      Height = 22
      MaxValue = 999
      MinValue = 1
      TabOrder = 1
      Value = 1
    end
    object SetsEdit: TEdit
      Left = 120
      Top = 42
      Width = 73
      Height = 21
      TabOrder = 3
    end
    object cmbFormat: TComboBox
      Left = 120
      Top = 128
      Width = 82
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      OnChange = cmbFormatChange
      Items.Strings = (
        'Reels'
        'Sheet')
    end
  end
  object GroupBox3: TGroupBox
    ParentBackground = False
    Left = 224
    Top = 142
    Width = 177
    Height = 75
    Caption = 'Numbering'
    TabOrder = 2
    object Label6: TLabel
      Left = 24
      Top = 24
      Width = 20
      Height = 13
      Caption = 'from'
    end
    object Label8: TLabel
      Left = 19
      Top = 56
      Width = 26
      Height = 13
      Caption = 'Prefix'
    end
    object FromEdit: TEdit
      Left = 56
      Top = 16
      Width = 97
      Height = 21
      TabOrder = 0
    end
    object PrefixEdit: TEdit
      Left = 56
      Top = 48
      Width = 57
      Height = 21
      TabOrder = 1
    end
  end
  object CancelBitBtn: TBitBtn
    Left = 8
    Top = 369
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Kind = bkCancel
  end
  object PreviewBitBtn: TBitBtn
    Left = 144
    Top = 369
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Pre&view'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = PreviewBitBtnClick
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
  end
  object GroupBox1: TGroupBox
    ParentBackground = False
    Left = 8
    Top = 90
    Width = 393
    Height = 45
    TabOrder = 5
    object Label9: TLabel
      Left = 8
      Top = 20
      Width = 64
      Height = 13
      Caption = 'Delivery Date'
    end
    object DeliveryDateEdit: TEdit
      Left = 120
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'DeliveryDateEdit'
      OnChange = DeliveryDateEditChange
      OnExit = DeliveryDateEditExit
    end
    object BitBtn2: TBitBtn
      Left = 248
      Top = 14
      Width = 25
      Height = 25
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
    end
  end
  object PrintBitBtn: TBitBtn
    Left = 232
    Top = 369
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    Default = True
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = PrintBitBtnClick
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
  object GroupBox4: TGroupBox
    ParentBackground = False
    Left = 224
    Top = 219
    Width = 177
    Height = 82
    Caption = 'Address'
    TabOrder = 7
    object chkAddressOnly: TCheckBox
      Left = 8
      Top = 60
      Width = 153
      Height = 17
      Caption = 'Print Address Only'
      TabOrder = 0
    end
    object rdbtnCustAddr: TRadioButton
      Left = 8
      Top = 20
      Width = 153
      Height = 17
      Caption = 'Use Customer Details'
      TabOrder = 1
    end
    object rdbtnDelAddr: TRadioButton
      Left = 8
      Top = 40
      Width = 145
      Height = 17
      Caption = 'Use Delivery Details'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  object GroupBox5: TGroupBox
    ParentBackground = False
    Left = 8
    Top = 306
    Width = 393
    Height = 45
    TabOrder = 8
    object Label12: TLabel
      Left = 56
      Top = 20
      Width = 53
      Height = 13
      Caption = 'Label Logo'
    end
    object dblkpLogos: TDBLookupComboBox
      Left = 120
      Top = 16
      Width = 185
      Height = 21
      KeyField = 'ID'
      ListField = 'Logo_Name'
      ListSource = dtsLogos
      TabOrder = 0
    end
    object FormRefClrBitBtn: TBitBtn
      Left = 322
      Top = 14
      Width = 23
      Height = 23
      Hint = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = FormRefClrBitBtnClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
  end
  object CountSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Int_Sel.*,'
      'Delivery_Detail.*,'
      'Purchase_OrderLine.Cust_Order_no,'
      'Purchase_OrderLine.Customers_Desc,'
      'Purchase_OrderLine.Quantity,'
      'Purchase_OrderLine.Form_Reference,'
      'Form_Reference.Form_Reference_id'
      'FROM Int_Sel INNER JOIN'
      '((Purchase_OrderLine LEFT JOIN Form_Reference '
      
        'ON Purchase_OrderLine.Form_Reference = Form_Reference.Form_Refer' +
        'ence)'
      'INNER JOIN Delivery_Detail'
      'ON (Purchase_OrderLine.Line = Delivery_Detail.Line) '
      
        'AND (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchas' +
        'e_Order))'
      'ON (Int_Sel.Sel4 = Delivery_Detail.Delivery_no)'
      'AND (Int_Sel.Sel3 = Delivery_Detail.Line)'
      'AND (Int_Sel.Sel2 = Delivery_Detail.Purchase_Order)'
      'WHERE'#9'Int_Sel.Int_Sel_Code = :Int_sel_code'
      'ORDER BY Int_Sel.sel1 ASC')
    Left = 352
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_sel_code'
        ParamType = ptInput
      end>
  end
  object qryLogos: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Document_Logo'
      'WHERE Document_Type = '#39'L'#39' AND'
      '((inactive = '#39'N'#39') or (inactive is NULL))'
      'ORDER BY Logo_Name')
    Left = 16
    Top = 282
  end
  object dtsLogos: TDataSource
    DataSet = qryLogos
    Left = 72
    Top = 286
  end
end
