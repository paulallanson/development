object PBLUSupplierInvoicePOFrm: TPBLUSupplierInvoicePOFrm
  Left = 131
  Top = 32
  Caption = 'Purchase Order Selection'
  ClientHeight = 490
  ClientWidth = 1094
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object stBrDetails: TStatusBar
    Left = 0
    Top = 471
    Width = 1094
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 343
    Width = 1094
    Height = 128
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 732
      Height = 128
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object CustomerGroupBox: TGroupBox
        Left = 8
        Top = 66
        Width = 422
        Height = 56
        Caption = 'Type here to narrow the search'
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 27
          Width = 43
          Height = 13
          Caption = 'Supplier'
        end
        object edtSupplierName: TEdit
          Left = 51
          Top = 23
          Width = 216
          Height = 21
          TabOrder = 0
          OnChange = edtSupplierNameChange
          OnKeyUp = edtSupplierNameKeyUp
        end
        object btnSupplier: TBitBtn
          Left = 273
          Top = 21
          Width = 25
          Height = 25
          Hint = 'Select Customer'
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnSupplierClick
        end
        object bitbtnPriceUnitClear: TBitBtn
          Left = 305
          Top = 21
          Width = 25
          Height = 25
          Hint = 'Clear'
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
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = bitbtnPriceUnitClearClick
        end
        object btnSweep: TBitBtn
          Left = 336
          Top = 21
          Width = 75
          Height = 25
          Caption = 'S&weep'
          Enabled = False
          TabOrder = 3
          OnClick = btnSweepClick
        end
      end
      object rdgrpOrders: TRadioGroup
        Left = 437
        Top = 42
        Width = 145
        Height = 79
        Caption = 'Display Orders where'
        ItemIndex = 0
        Items.Strings = (
          'Orders Delivered'
          'Sales Invoice Raised'
          'All Orders Raised')
        ParentBackground = False
        TabOrder = 1
        OnClick = rdgrpOrdersClick
      end
      object chkbxIncZeroValue: TCheckBox
        Left = 8
        Top = 41
        Width = 233
        Height = 17
        Caption = 'Include zero value orders'
        TabOrder = 2
        OnClick = chkbxIncZeroValueClick
      end
      object btnExcel: TBitBtn
        Left = 590
        Top = 88
        Width = 75
        Height = 25
        Caption = 'Excel'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
          C8807FF7777777777FF700000000000000007777777777777777333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        TabOrder = 3
        OnClick = btnExcelClick
      end
      object btnPO: TBitBtn
        Left = 10
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Open PO'
        Enabled = False
        NumGlyphs = 2
        TabOrder = 4
        OnClick = btnPOClick
      end
    end
    object Panel2: TPanel
      Left = 732
      Top = 0
      Width = 362
      Height = 128
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object GroupBox2: TGroupBox
        Left = 252
        Top = 40
        Width = 105
        Height = 82
        Caption = 'Function'
        ParentBackground = False
        TabOrder = 0
        object btnSelect: TBitBtn
          Left = 14
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Select '
          Enabled = False
          Glyph.Data = {
            BE060000424DBE06000000000000360400002800000024000000120000000100
            0800000000008802000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            03030303030303030303030303030303030303030303FF030303030303030303
            03030303030303040403030303030303030303030303030303F8F8FF03030303
            03030303030303030303040202040303030303030303030303030303F80303F8
            FF030303030303030303030303040202020204030303030303030303030303F8
            03030303F8FF0303030303030303030304020202020202040303030303030303
            0303F8030303030303F8FF030303030303030304020202FA0202020204030303
            0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
            040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
            03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
            FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
            0303030303030303030303FA0202020403030303030303030303030303F8FF03
            03F8FF03030303030303030303030303FA020202040303030303030303030303
            0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
            03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
            030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
            0202040303030303030303030303030303F8FF03F8FF03030303030303030303
            03030303FA0202030303030303030303030303030303F8FFF803030303030303
            030303030303030303FA0303030303030303030303030303030303F803030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303}
          NumGlyphs = 2
          TabOrder = 0
          OnClick = btnSelectClick
        end
        object BitBtn2: TBitBtn
          Left = 14
          Top = 49
          Width = 75
          Height = 25
          Caption = 'Close'
          Kind = bkClose
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object GroupBox1: TGroupBox
        Left = 128
        Top = 73
        Width = 113
        Height = 49
        Caption = 'Selected PO'
        ParentBackground = False
        TabOrder = 1
        object edtPONumber: TEdit
          Left = 8
          Top = 16
          Width = 89
          Height = 21
          TabOrder = 0
          OnKeyPress = edtPONumberKeyPress
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 73
        Width = 113
        Height = 49
        Caption = 'Selected Job Bag'
        ParentBackground = False
        TabOrder = 2
        object edtJBNumber: TEdit
          Left = 8
          Top = 16
          Width = 89
          Height = 21
          TabOrder = 0
          OnKeyPress = edtJBNumberKeyPress
        end
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 1094
    Height = 343
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel4'
    ParentBackground = False
    TabOrder = 2
    object dbgdetails: TDBGrid
      Left = 0
      Top = 0
      Width = 1094
      Height = 343
      Align = alClient
      DataSource = dmSupplierInvoice.dsPOLine
      DrawingStyle = gdsGradient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      OnCellClick = dbgdetailsCellClick
      OnDrawColumnCell = dbgdetailsDrawColumnCell
      OnDblClick = dbgdetailsDblClick
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'POLine'
          Title.Caption = 'Order'
          Width = 65
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Date_Point'
          Title.Alignment = taRightJustify
          Title.Caption = 'Date'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Supplier_Name'
          Title.Caption = 'Supplier'
          Width = 155
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cust_Order_No'
          Title.Caption = 'Order Reference'
          Width = 194
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Suppliers_Desc'
          Title.Caption = 'Description'
          Width = 194
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Invoice_Quantity'
          Title.Alignment = taRightJustify
          Title.Caption = 'Quantity'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Order_Price'
          Title.Alignment = taRightJustify
          Title.Caption = 'Order Price'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Price_Unit_Description'
          Title.Caption = 'Order Unit'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Customer_Name'
          Title.Caption = 'Customer'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Job_Bag'
          Title.Caption = 'Job Bag'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sales_Invoice_no'
          Title.Caption = 'Invoice No'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Invoice_Date'
          Title.Caption = 'Invoice Date'
          Width = 90
          Visible = True
        end>
    end
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = SearchTimerTimer
    Left = 264
    Top = 48
  end
end
