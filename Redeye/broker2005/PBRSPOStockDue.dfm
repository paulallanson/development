object PBRSPOStockDueFrm: TPBRSPOStockDueFrm
  Left = 261
  Top = 114
  Caption = 'Orders due for delivery to stock'
  ClientHeight = 453
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 13
  object pnlControl: TPanel
    Left = 0
    Top = 412
    Width = 749
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      749
      41)
    object pnlRightControl: TPanel
      Left = 418
      Top = 0
      Width = 331
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object PreviewBitBtn: TBitBtn
        Left = 144
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Pre&view'
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
        TabOrder = 0
      end
      object PrintBitBtn: TBitBtn
        Left = 232
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Print'
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
        TabOrder = 1
      end
    end
    object CancelBitBtn: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Cancel'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object pnlSelections: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 177
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 128
      Width = 59
      Height = 13
      Caption = 'Sort first by'
    end
    object Label4: TLabel
      Left = 160
      Top = 128
      Width = 62
      Height = 13
      Caption = 'then sort by'
    end
    object Label5: TLabel
      Left = 312
      Top = 128
      Width = 92
      Height = 13
      Caption = 'and finally sort by'
    end
    object Label1: TLabel
      Left = 439
      Top = 3
      Width = 93
      Height = 13
      Caption = 'Delivery due after:'
    end
    object DateFromButton: TSpeedButton
      Left = 552
      Top = 14
      Width = 25
      Height = 25
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
    object Label2: TLabel
      Left = 439
      Top = 48
      Width = 103
      Height = 13
      Caption = 'Delivery due before:'
    end
    object DateToButton: TSpeedButton
      Left = 552
      Top = 59
      Width = 25
      Height = 25
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
    object rgSupplier: TRadioGroup
      Left = 8
      Top = 1
      Width = 100
      Height = 58
      Caption = ' By supplier '
      ItemIndex = 0
      Items.Strings = (
        'All Suppliers'
        'One Supplier')
      ParentBackground = False
      TabOrder = 0
    end
    object rgCustomer: TRadioGroup
      Left = 8
      Top = 63
      Width = 100
      Height = 60
      Caption = ' By customer '
      ItemIndex = 0
      Items.Strings = (
        'All Customers'
        'One Customer')
      ParentBackground = False
      TabOrder = 1
    end
    object SupplierPanel: TPanel
      Left = 113
      Top = 6
      Width = 281
      Height = 49
      ParentBackground = False
      TabOrder = 2
      object lblSupplier: TLabel
        Left = 8
        Top = 4
        Width = 82
        Height = 13
        Caption = 'Supplier/Branch'
      end
      object edtSupplier: TEdit
        Left = 8
        Top = 20
        Width = 233
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnSupplier: TButton
        Left = 248
        Top = 19
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object CustomerPanel: TPanel
      Left = 115
      Top = 68
      Width = 281
      Height = 57
      ParentBackground = False
      TabOrder = 3
      object lblCustomer: TLabel
        Left = 8
        Top = 1
        Width = 88
        Height = 13
        Caption = 'Customer/Branch'
      end
      object edtCustomer: TEdit
        Left = 8
        Top = 17
        Width = 233
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnCustomer: TButton
        Left = 248
        Top = 16
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object chkbxBranches: TCheckBox
        Left = 8
        Top = 38
        Width = 193
        Height = 17
        Caption = 'Report on all branches'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
    end
    object cbSort1: TComboBox
      Left = 8
      Top = 144
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 4
      Items.Strings = (
        'Customer'
        'Supplier'
        'Order Number'
        'Order Date'
        'Delivery Date')
    end
    object cbSort2: TComboBox
      Left = 160
      Top = 144
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 5
      Items.Strings = (
        'Customer'
        'Supplier'
        'Order Number'
        'Order Date'
        'Delivery Date')
    end
    object cbSort3: TComboBox
      Left = 312
      Top = 144
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 6
      Items.Strings = (
        'Customer'
        'Supplier'
        'Order Number'
        'Order Date'
        'Delivery Date')
    end
    object pnlDates: TPanel
      Left = 571
      Top = 0
      Width = 178
      Height = 177
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 7
      object chkbxPageBreak: TCheckBox
        Left = 33
        Top = 120
        Width = 145
        Height = 17
        Caption = 'Page break on total'
        Enabled = False
        TabOrder = 0
      end
      object ExcOnHoldCheckBox: TCheckBox
        Left = 33
        Top = 140
        Width = 145
        Height = 17
        Caption = 'Exclude on hold items'
        TabOrder = 1
      end
      object TotByRadioGroup: TRadioGroup
        Left = 33
        Top = 8
        Width = 105
        Height = 105
        Caption = 'Report Totals'
        ItemIndex = 3
        Items.Strings = (
          'By Customer'
          'By Supplier'
          'By Rep'
          'Do not total')
        ParentBackground = False
        TabOrder = 2
      end
      object chkbxShowSales: TCheckBox
        Left = 33
        Top = 159
        Width = 145
        Height = 17
        Caption = 'Hide sales value'
        TabOrder = 3
      end
    end
    object DateFromEdit: TEdit
      Left = 439
      Top = 16
      Width = 98
      Height = 21
      MaxLength = 10
      TabOrder = 8
    end
    object DateToEdit: TEdit
      Left = 439
      Top = 61
      Width = 98
      Height = 21
      MaxLength = 10
      TabOrder = 9
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 177
    Width = 749
    Height = 235
    Align = alClient
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'POLine'
        Title.Caption = 'Order'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Customer Name'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customers_Desc'
        Title.Caption = 'Form Title'
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Delivery_Date'
        Title.Caption = 'Delivery Date'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Deliv_Actual'
        Title.Caption = 'Date Delivered'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Account_Code'
        Title.Caption = 'Supplier'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cust_Order_No'
        Title.Caption = 'Order Ref'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Point'
        Title.Caption = 'Order Date'
        Width = 77
        Visible = True
      end>
  end
end
