object STMaintSOrdSerialNosFrm: TSTMaintSOrdSerialNosFrm
  Left = 64
  Top = 90
  BorderStyle = bsDialog
  Caption = 'Maintain sales order line serial numbers'
  ClientHeight = 434
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 624
    Height = 65
    Align = alTop
    TabOrder = 0
    object label3: TLabel
      Left = 8
      Top = 16
      Width = 40
      Height = 13
      Caption = 'Product:'
    end
    object lblProductCode: TLabel
      Left = 72
      Top = 16
      Width = 72
      Height = 13
      Caption = 'lblProductCode'
    end
    object Label4: TLabel
      Left = 432
      Top = 16
      Width = 83
      Height = 13
      Caption = 'Quantity Ordered:'
    end
    object lblQuantity: TLabel
      Left = 544
      Top = 16
      Width = 49
      Height = 13
      Caption = 'lblQuantity'
    end
    object Label5: TLabel
      Left = 8
      Top = 40
      Width = 83
      Height = 13
      Caption = 'Total Serial items:'
    end
    object lblSerialItems: TLabel
      Left = 120
      Top = 40
      Width = 61
      Height = 13
      Caption = 'lblSerialItems'
    end
  end
  object Panel2: TPanel
    ParentBackground = False
    Left = 0
    Top = 393
    Width = 624
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnOK: TBitBtn
      Left = 230
      Top = 8
      Width = 75
      Height = 25
      Enabled = False
      TabOrder = 0
      OnClick = btnOKClick
      Kind = bkOK
    end
    object btnCancel: TBitBtn
      Left = 318
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel3: TPanel
    ParentBackground = False
    Left = 0
    Top = 65
    Width = 355
    Height = 328
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 3
      Width = 151
      Height = 13
      Caption = 'Serial Numbers on this order line'
    end
    object lstbxSOLSerialNos: TListBox
      Left = 8
      Top = 22
      Width = 241
      Height = 297
      ItemHeight = 13
      TabOrder = 0
    end
    object btnAdd: TBitBtn
      Left = 259
      Top = 24
      Width = 81
      Height = 25
      Caption = '&Add'
      Enabled = False
      TabOrder = 1
      OnClick = btnAddClick
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
    end
    object btnChange: TBitBtn
      Left = 259
      Top = 56
      Width = 81
      Height = 25
      Caption = '&Change'
      Enabled = False
      TabOrder = 2
      OnClick = btnChangeClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object btnDelete: TBitBtn
      Left = 259
      Top = 88
      Width = 81
      Height = 25
      Caption = '&Delete'
      Enabled = False
      TabOrder = 3
      OnClick = btnDeleteClick
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
    end
  end
  object Panel4: TPanel
    ParentBackground = False
    Left = 355
    Top = 65
    Width = 269
    Height = 328
    Align = alRight
    Caption = 'Panel4'
    TabOrder = 3
    object Label1: TLabel
      Left = 6
      Top = 5
      Width = 162
      Height = 13
      Caption = 'Serial Numbers currently available:'
    end
    object lstbxSerialNos: TListBox
      Left = 4
      Top = 22
      Width = 261
      Height = 297
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
    end
  end
  object qrySerialNos: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Store_Stock.Store_Stock,'
      '           Store_Stock.Part,'
      '           Store_Stock_Serial_item.Serial_item_no,'
      '           Store_Stock_Serial_item.Serial_item_from,'
      '           Store_Stock_Serial_item.Serial_item_to,'
      
        '           (Store_Stock_Serial_item.Serial_item_From + '#39' to '#39' + ' +
        'Store_Stock_Serial_item.Serial_item_to) as Serial_Range,'
      '           Store_Stock_Serial_item.Sales_order,'
      '           Store_Stock_Serial_item.Sales_order_line_no,'
      '           Store_Stock.Sets_per_pad'
      'from Store_Stock_Serial_item, Store_Stock'
      'where Store_Stock.Part = :Part and'
      '(Store_Stock.Store_Stock = Store_stock_serial_item.store_Stock)'
      'order by Serial_item_From'
      ' ')
    Left = 472
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object srcSerialNos: TDataSource
    DataSet = qrySerialNos
    Left = 552
    Top = 384
  end
end
