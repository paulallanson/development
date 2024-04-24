object STMntPOrdFrm: TSTMntPOrdFrm
  Left = 150
  Top = 90
  Caption = 'Maintain Purchase Orders'
  ClientHeight = 529
  ClientWidth = 798
  Color = clBtnFace
  Constraints.MinHeight = 565
  Constraints.MinWidth = 810
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object TotLabel: TLabel
    Left = 664
    Top = 429
    Width = 97
    Height = 15
    Alignment = taRightJustify
    Caption = 'Total Value:   0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSuppOrderType: TLabel
    Left = 384
    Top = 448
    Width = 3
    Height = 13
    Visible = False
  end
  object Label7: TLabel
    Left = 8
    Top = 376
    Width = 76
    Height = 13
    Caption = 'Extra Charges: '
  end
  object TotRecLabel: TLabel
    Left = 664
    Top = 453
    Width = 97
    Height = 15
    Alignment = taRightJustify
    Caption = 'Total Value:   0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DetsGrpBox: TGroupBox
    Left = 8
    Top = 4
    Width = 777
    Height = 365
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 32
      Top = 52
      Width = 24
      Height = 13
      Caption = 'Date'
    end
    object NoLabel: TLabel
      Left = 8
      Top = 20
      Width = 48
      Height = 13
      Caption = 'Order No'
    end
    object Label5: TLabel
      Left = 400
      Top = 68
      Width = 59
      Height = 13
      Caption = 'Description'
    end
    object Label8: TLabel
      Left = 400
      Top = 95
      Width = 69
      Height = 13
      Caption = 'Requested By'
    end
    object Label9: TLabel
      Left = 176
      Top = 20
      Width = 74
      Height = 13
      Caption = 'Date Required'
    end
    object pgDetails: TPageControl
      Left = 8
      Top = 119
      Width = 761
      Height = 239
      ActivePage = tsOrder
      TabOrder = 11
      object tsOrder: TTabSheet
        Caption = 'Details'
        object LinesListView: TListView
          Left = 0
          Top = 0
          Width = 753
          Height = 211
          Align = alClient
          Columns = <
            item
              Caption = 'Product'
              Width = 150
            end
            item
              Caption = 'Description'
              Width = 275
            end
            item
              Alignment = taRightJustify
              Caption = 'Qty'
            end
            item
              Alignment = taRightJustify
              Caption = 'Pack'
            end
            item
              Alignment = taRightJustify
              Caption = 'Pack Price'
              Width = 70
            end
            item
              Alignment = taRightJustify
              Caption = 'Rec'#39'd'
            end
            item
              Alignment = taRightJustify
              Caption = 'Line Value'
              Width = 90
            end>
          GridLines = True
          MultiSelect = True
          ReadOnly = True
          RowSelect = True
          PopupMenu = ppmnPOLines
          TabOrder = 0
          ViewStyle = vsReport
          OnClick = LinesListViewClick
          OnDblClick = ChangePOLineClick
        end
      end
      object tsInvoices: TTabSheet
        Caption = 'Invoices'
        ImageIndex = 1
        object dbgInvoices: TDBGrid
          Left = 0
          Top = 0
          Width = 753
          Height = 211
          Align = alClient
          DataSource = dtsGetSInvoice
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
          OnDblClick = dbgInvoicesDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Invoice_Date'
              Title.Caption = 'Invoice Date'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'supplier_invoice_no'
              Title.Caption = 'Invoice No'
              Width = 118
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'supp_inv_alt_ref'
              Title.Caption = 'PIN Reference'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'goods_value'
              Title.Caption = 'Goods Value'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'vat_value'
              Title.Caption = 'Vat Value'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Total_value'
              Title.Caption = 'Total Value'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Supplier_invoice_status_Descr'
              Title.Caption = 'Status'
              Width = 165
              Visible = True
            end>
        end
      end
    end
    object DateEdit: TEdit
      Left = 64
      Top = 48
      Width = 81
      Height = 21
      MaxLength = 30
      ReadOnly = True
      TabOrder = 1
      OnChange = SuppNameEditChange
    end
    object DateBitBtn: TBitBtn
      Left = 152
      Top = 47
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = DateBitBtnClick
    end
    object OrdNoEdit: TEdit
      Left = 64
      Top = 16
      Width = 81
      Height = 21
      MaxLength = 30
      ReadOnly = True
      TabOrder = 0
      OnChange = SuppNameEditChange
    end
    object StoreFromGroupBox: TGroupBox
      Left = 8
      Top = 76
      Width = 321
      Height = 41
      ParentBackground = False
      TabOrder = 6
      object Label4: TLabel
        Left = 8
        Top = 14
        Width = 56
        Height = 13
        Caption = 'Store From'
      end
      object StoreFromDBLookupComboBox: TDBLookupComboBox
        Left = 88
        Top = 14
        Width = 217
        Height = 21
        KeyField = 'Part_Store'
        ListField = 'Part_Store_Name'
        ListSource = StoresFromDataSource
        TabOrder = 0
        OnClick = StoreFromDBLookupComboBoxClick
      end
    end
    object DescrEdit: TEdit
      Left = 504
      Top = 64
      Width = 241
      Height = 21
      TabOrder = 7
      OnChange = DescrEditChange
    end
    object pnlStoreDetails: TPanel
      Left = 392
      Top = 16
      Width = 377
      Height = 41
      ParentBackground = False
      TabOrder = 8
      object Label3: TLabel
        Left = 12
        Top = 14
        Width = 81
        Height = 13
        Caption = 'Replenish Store'
      end
      object StoreDBLookupComboBox: TDBLookupComboBox
        Left = 112
        Top = 10
        Width = 217
        Height = 21
        KeyField = 'Part_Store'
        ListField = 'Part_Store_Name'
        ListSource = StoresDataSource
        TabOrder = 0
        OnClick = StoreDBLookupComboBoxClick
      end
    end
    object pnlSalesDetails: TPanel
      Left = 368
      Top = 192
      Width = 377
      Height = 41
      ParentBackground = False
      TabOrder = 9
      Visible = False
      object Label6: TLabel
        Left = 16
        Top = 8
        Width = 109
        Height = 13
        Caption = 'Direct Delivery Order:'
      end
      object lblSalesOrder: TLabel
        Left = 160
        Top = 8
        Width = 69
        Height = 13
        Caption = 'lblSalesOrder'
      end
    end
    object SuppGroupBox: TGroupBox
      Left = 8
      Top = 76
      Width = 353
      Height = 41
      ParentBackground = False
      TabOrder = 5
      object Label1: TLabel
        Left = 8
        Top = 17
        Width = 43
        Height = 13
        Caption = 'Supplier'
      end
      object SuppNameEdit: TEdit
        Left = 72
        Top = 13
        Width = 241
        Height = 21
        MaxLength = 30
        ReadOnly = True
        TabOrder = 0
        OnChange = SuppNameEditChange
      end
      object SuppBitBtn: TBitBtn
        Left = 320
        Top = 12
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = SuppBitBtnClick
      end
    end
    object RequestedByEdit: TEdit
      Left = 504
      Top = 91
      Width = 241
      Height = 21
      TabOrder = 10
      OnChange = DescrEditChange
    end
    object DateReqEdit: TEdit
      Left = 256
      Top = 16
      Width = 81
      Height = 21
      MaxLength = 30
      ReadOnly = True
      TabOrder = 3
      OnChange = SuppNameEditChange
    end
    object BitBtn1: TBitBtn
      Left = 344
      Top = 15
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn1Click
    end
  end
  object strgrdExtChgDets: TStringGrid
    Left = 8
    Top = 392
    Width = 412
    Height = 81
    ColCount = 3
    DefaultRowHeight = 18
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = ppmnExChrgsGrid
    TabOrder = 1
    OnSelectCell = strgrdExtChgDetsSelectCell
    ColWidths = (
      202
      96
      91)
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 477
    Width = 798
    Height = 33
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    object DelLabel: TLabel
      Left = 486
      Top = 10
      Width = 98
      Height = 15
      Caption = 'Delete the order?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object NotesBitBtn: TBitBtn
      Left = 8
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Notes'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F777773FF333333008877700
        33333337733FFF773F33330887000777033333733F777FFF73F3308800000007
        703337F37777777FF7F33080000000007033373777777777F73F087000222000
        77037F3777333777FF7F08000222220007037F777F3333777F7F0F0002222200
        07037F777F3333777F7F0F000822220008037F777FF33377737F0F7000882000
        780373F777FFF777F373308000000000803337F77777777737F330F800000008
        8033373F777777733733330F8700078803333373FF77733F733333300FFF8800
        3333333773FFFF77333333333000003333333333377777333333}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = NotesBitBtnClick
    end
    object OKBitBtn: TBitBtn
      Left = 622
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F7F00007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F7F0000007F00007F007F0000007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F0000007F00007F00007F0000
        7F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F000000
        7F00007F00007F00007F00007F00007F007F0000007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F
        7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F7F0000007F00007F00007F0000FF00007F00007F00007F00007F00
        7F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFF
        FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F00007F00007F0000FF00007F7F
        00FF00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F7F7F7FFFFFFF007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00
        007F0000FF00007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F00
        7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F00FF
        00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F
        7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF0000
        7F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F
        7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00
        007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFF
        FFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F00FF00007F00007F007F0000007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F
        7F7FFFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00007F
        00007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F}
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 1
      OnClick = OKBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 710
      Top = 6
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
        7F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F0000FF7F7F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF007F7F
        007F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F00
        00FF00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        FFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7FFFFFFF7F7F7F7F7F7FFFFF
        FF007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00
        007F7F7F7F007F7F0000FF00007F00007F00007F00007F7F7F7F007F7F007F7F
        007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7FFFFF
        FF7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F00
        7F7F0000FF00007F00007F00007F00007F7F7F7F00007F00007F00007F00007F
        00007F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F
        7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF00
        7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00007F
        00007F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F00
        7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        0000FF00007F00007F00007F00007F00007F00007F7F7F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F00
        7F7F007F7F007F7F007F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F00007F00007F00007F00007F00007F7F7F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
        7F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
        7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F0000FF00007F00007F00007F00007F00007F7F7F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F7F7F7F00007F00
        007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00
        007F7F7F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F7F7F7FFFFF
        FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F0000FF00007F00007F7F7F7F007F7F007F7F007F7F0000FF00007F00007F
        00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F007F7F007F7F007F7F
        007F7F007F7F0000FF00007F00007F00007F007F7F007F7F007F7F007F7F007F
        7F007F7F7F7F7FFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F7F7F7FFFFFFF00
        7F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F0000FF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F00
        7F7F007F7F007F7F7F7F7FFFFFFFFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F7F7F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F}
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 2
      OnClick = CancelBitBtnClick
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 510
    Width = 798
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purch_Ord'
      'Set'
      'Supplier = :Supplier,'
      'Branch_No = :Branch_No,'
      'Purch_Ord_Date = :Purch_Ord_Date,'
      'Part_Store = :Part_Store,'
      'Part_Store_From = :Part_Store_From,'
      'Purch_Ord_Descr = :Purch_Ord_Descr,'
      'Supp_Order_Type = :Supp_Order_type,'
      'Narrative = :Narrative,'
      'Requested_By = :Requested_By,'
      'Date_Required = :Date_Required'
      'Where'
      '(Purch_Ord = :Purch_Ord)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 224
    Top = 200
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftString
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Purch_Ord_Date'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Store_From'
        DataType = ftString
      end
      item
        Name = 'Purch_Ord_Descr'
      end
      item
        Name = 'Supp_Order_type'
        DataType = ftString
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Requested_By'
        DataType = ftString
      end
      item
        Name = 'Date_Required'
      end
      item
        Name = 'Purch_Ord'
        DataType = ftString
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Purch_Ord'
      
        '(Purch_Ord, Supplier, Branch_No, Purch_Ord_Status, Purch_Ord_Dat' +
        'e, Purch_Ord_No,'
      
        ' Purch_Ord_Rec_Ref, Part_Store, Part_Store_From, Purch_Ord_Descr' +
        ', Supp_Order_type,'
      ' Narrative, Operator, Requested_By, Date_Required)'
      'Values'
      
        '(:Purch_Ord, :Supplier, :Branch_No, :Purch_Ord_Status, :Purch_Or' +
        'd_Date, :Purch_Ord_No,'
      
        ' :Purch_Ord_Rec_Ref, :Part_Store, :Part_Store_From, :Purch_Ord_D' +
        'escr, :Supp_Order_Type,'
      ' :Narrative, :Operator, :Requested_By, :Date_Required)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 56
    Top = 168
    ParamData = <
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Supplier'
        DataType = ftString
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Purch_Ord_Status'
      end
      item
        Name = 'Purch_Ord_Date'
      end
      item
        Name = 'Purch_Ord_No'
        DataType = ftString
      end
      item
        Name = 'Purch_Ord_Rec_Ref'
        DataType = ftString
      end
      item
        Name = 'Part_Store'
        DataType = ftString
      end
      item
        Name = 'Part_Store_From'
        DataType = ftString
      end
      item
        Name = 'Purch_Ord_Descr'
      end
      item
        Name = 'Supp_Order_Type'
        DataType = ftString
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Requested_By'
      end
      item
        Name = 'Date_Required'
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Purch_Ord'
      'where Purch_Ord = :Purch_Ord'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 320
    Top = 176
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Purch_Ord) as Last_Code'
      'From Purch_Ord'
      ' '
      ' '
      ' ')
    Left = 152
    Top = 184
  end
  object GetLinesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Purch_Ord_Line.Part, Purch_Ord_Line.Quantity_Ordered,'
      
        '       Purch_Ord_Line.Quantity_Received, Purch_Ord_Line.Date_Del' +
        'iv_Expected,'
      
        '       Purch_Ord_Line.Date_Deliv_Actual, Purch_Ord_Line.Purch_Pa' +
        'ck_Quantity,'
      '       Part.Part_Description, Purch_Ord_Line.Purch_Ord_Line_No,'
      '       Purch_Ord_Line.GRN_No, Purch_Ord_Line.Purchase_Price,'
      '       Purch_Ord_Line.Discount, Purch_Ord_Line.Cost_Price,'
      
        '       Purch_Ord_Line.Qty_Invoiced, Purch_Ord_Line.Line_Notes, P' +
        'urch_Ord_Line.Line_Is_Sample'
      'From Purch_Ord_Line, Part'
      'Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord) and'
      '      (Part.Part = Purch_Ord_Line.Part)'
      'Order by Purch_Ord_Line.Purch_Ord_Line_No'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 120
    Top = 252
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object GetStoresSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Store, Part_Store_Name , Part_Store_Type'
      'From Part_Store'
      'Order By Part_Store_Name')
    Left = 344
    Top = 148
  end
  object StoresDataSource: TDataSource
    DataSet = GetStoresSQL
    Left = 280
    Top = 108
  end
  object GetReqdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      ''
      ' ')
    Left = 392
    Top = 236
  end
  object AddWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Text100, Sel1, Sel2, Sel3, Sel4)'
      'Values'
      '(:Int_Sel_Code, :Text100,:Sel1,0,0,0)'
      '')
    Left = 344
    Top = 308
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Text100'
      end
      item
        Name = 'Sel1'
      end>
  end
  object UpdCompRefSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set'
      'Last_Purch_Ord_Rec_Ref = :Last_Purch_Ord_Rec_Ref,'
      'Last_Purch_Ord_No = :Last_Purch_Ord_No'
      ' ')
    Left = 240
    Top = 128
    ParamData = <
      item
        Name = 'Last_Purch_Ord_Rec_Ref'
      end
      item
        Name = 'Last_Purch_Ord_No'
      end>
  end
  object GetLastLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Purch_Ord_Line_No) as Last_Code'
      'From Purch_Ord_Line'
      'Where (Purch_Ord = :Purch_Ord)'
      ' '
      ' '
      ' ')
    Left = 168
    Top = 160
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object AddLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Purch_Ord_Line'
      
        '(Purch_Ord, Purch_Ord_Line_No, Part, Quantity_Ordered, Quantity_' +
        'Received,'
      ' Date_Deliv_Expected, Date_Deliv_Actual, Purchase_Price, GRN_No,'
      
        ' Fully_Received, Quantity_Sent, Quantity_Allocated, Purch_Pack_Q' +
        'uantity, Discount, Cost_Price,'
      ' Qty_Invoiced, Line_Notes, Line_Is_Sample)'
      'Values'
      
        '(:Purch_Ord, :Purch_Ord_Line_No, :Part, :Quantity_Ordered, :Quan' +
        'tity_Received,'
      
        ' :Date_Deliv_Expected, :Date_Deliv_Actual, :Purchase_Price, :GRN' +
        '_No,'
      ' '#39'N'#39',0,0, :Purch_Pack_Quantity, :Discount, :Cost_Price,'
      ' :Qty_Invoiced, :Line_Notes, :Line_Is_Sample)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 72
    Top = 200
    ParamData = <
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Line_No'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Quantity_Ordered'
      end
      item
        Name = 'Quantity_Received'
      end
      item
        Name = 'Date_Deliv_Expected'
        DataType = ftDate
      end
      item
        Name = 'Date_Deliv_Actual'
        DataType = ftDate
      end
      item
        Name = 'Purchase_Price'
      end
      item
        Name = 'GRN_No'
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Discount'
      end
      item
        Name = 'Cost_Price'
      end
      item
        Name = 'Qty_Invoiced'
      end
      item
        Name = 'Line_Notes'
      end
      item
        Name = 'Line_Is_Sample'
      end>
  end
  object UpdLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purch_Ord_Line'
      'Set'
      'Part = :Part,'
      'Quantity_Ordered = :Quantity_Ordered,'
      'Quantity_Received = :Quantity_Received,'
      'Date_Deliv_Expected = :Date_Deliv_Expected,'
      'Date_Deliv_Actual = :Date_Deliv_Actual,'
      'Purchase_Price = :Purchase_Price,'
      'GRN_No = :GRN_No,'
      'Purch_Pack_Quantity = :Purch_Pack_Quantity ,'
      'Discount = :Discount,'
      'Cost_Price = :Cost_Price,'
      'Line_Notes = :Line_Notes,'
      'Line_Is_Sample = :Line_Is_Sample'
      'Where'
      '(Purch_Ord = :Purch_Ord) and'
      '(Purch_Ord_Line_No = :Purch_Ord_Line_No)'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 128
    Top = 160
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Quantity_Ordered'
      end
      item
        Name = 'Quantity_Received'
      end
      item
        Name = 'Date_Deliv_Expected'
        DataType = ftDate
      end
      item
        Name = 'Date_Deliv_Actual'
        DataType = ftDate
      end
      item
        Name = 'Purchase_Price'
      end
      item
        Name = 'GRN_No'
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Discount'
      end
      item
        Name = 'Cost_Price'
      end
      item
        Name = 'Line_Notes'
      end
      item
        Name = 'Line_Is_Sample'
      end
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Line_No'
      end>
  end
  object DelLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Purch_Ord_Line'
      'Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord) and'
      '      (Purch_Ord_Line.Purch_Ord_Line_no = :Purch_Ord_Line_no)'
      ' ')
    Left = 224
    Top = 268
    ParamData = <
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Line_no'
      end>
  end
  object DelLinesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Purch_Ord_Line'
      'Where (Purch_Ord_Line.Purch_Ord = :Purch_Ord) '
      ' '
      ' ')
    Left = 200
    Top = 244
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object GetStoresFromSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Store, Part_Store_Name , Part_Store_Type'
      'From Part_Store'
      'Order By Part_Store_Name'
      ' ')
    Left = 224
    Top = 92
  end
  object StoresFromDataSource: TDataSource
    DataSet = GetStoresFromSQL
    Left = 176
    Top = 92
  end
  object GetReqdPOSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Part_Store_Levels.Minimum_Stock, Part_Store_Levels.Maximu' +
        'm_Stock,'
      '       Part_Store_Levels.Part, Part_Store.Part_Store,'
      '       Part_Store.Part_Store_Name, Part.Part_Description,'
      '       Part.Purch_Pack_Quantity, Part.Part_Purchase_Price,'
      
        '       (Select sum(Purch_Ord_Line.Quantity_Ordered - Purch_Ord_L' +
        'ine.Quantity_Received)'
      #9'From Purch_Ord, Purch_Ord_Line'
      #9'Where        (Purch_Ord.Part_Store = Part_Store.Part_Store) and'
      
        '       '#9'      (Purch_Ord_Line.Purch_Ord = Purch_Ord.Purch_Ord) a' +
        'nd'
      '              (Purch_Ord_Line.Part = Part_Store_Levels.Part) and'
      '              (Purch_Ord.Purch_Ord_Status <> '#39'R'#39') and'
      
        '              (Purch_Ord_Line.Fully_Received <> '#39'Y'#39')) as Qty_On_' +
        'Order,'
      
        '       (Select Sum(Store_Stock.Store_Quantity - Store_Stock.Quan' +
        'tity_Allocated)'
      '        From Store_Stock'
      '        Where (Store_Stock.Part = Part_Store_Levels.Part) and'
      
        '              (Store_Stock.Part_Store = Part_Store.Part_Store)) ' +
        'as Free_Stock'
      'From Part_Store_Levels,Part_Store, Part, Part_Supplier'
      
        'Where  ((Part_Store.Part_Store = :Part_Store) or (:Part_Store = ' +
        '0)) and'
      
        '       (Part_Store_Levels.Part_Store_Type = Part_Store.Part_Stor' +
        'e_Type) and'
      '       (Part.Part = Part_Store_Levels.Part) and'
      '       (Part_Store_Levels.Purchase_Or_Store = '#39'P'#39') and'
      '       (Part_Supplier.Part = Part_Store_Levels.Part) and'
      '       (Part_Supplier.Supplier = :Supplier) and'
      '       (Part_Supplier.Branch_No = :Branch_No) and'
      '       (Part_Supplier.Supplier_Preference_Order = 0) and'
      '       ( Not Exists  (Select Int_Sel_Code'
      '                                 From Int_Sel'
      '                                 Where (Int_Sel_Code = XUCX) and'
      '                                       (Text100 = Part.Part)))'
      'Order By Part_Store_Levels.Part, Part_Store.Part_Store'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 424
    Top = 236
    ParamData = <
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object GetReqdSOSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Part_Store_Levels.Minimum_Stock, Part_Store_Levels.Maximu' +
        'm_Stock,'
      '       Part_Store_Levels.Part, Part_Store.Part_Store,'
      '       Part_Store.Part_Store_Name, Part.Part_Description,'
      '       Part.Purch_Pack_Quantity, Part.Part_Purchase_Price,'
      
        '       (Select sum(Purch_Ord_Line.Quantity_Ordered - Purch_Ord_L' +
        'ine.Quantity_Received)'
      #9'From Purch_Ord, Purch_Ord_Line'
      #9'Where        (Purch_Ord.Part_Store = Part_Store.Part_Store) and'
      
        '       '#9'      (Purch_Ord_Line.Purch_Ord = Purch_Ord.Purch_Ord) a' +
        'nd'
      '              (Purch_Ord_Line.Part = Part_Store_Levels.Part) and'
      '              (Purch_Ord.Purch_Ord_Status <> '#39'R'#39') and'
      
        '              (Purch_Ord_Line.Fully_Received <> '#39'Y'#39')) as Qty_On_' +
        'Order,'
      
        '       (Select Sum(Store_Stock.Store_Quantity - Store_Stock.Quan' +
        'tity_Allocated)'
      '        From Store_Stock'
      '        Where (Store_Stock.Part = Part_Store_Levels.Part) and'
      
        '              (Store_Stock.Part_Store = Part_Store.Part_Store)) ' +
        'as Free_Stock'
      
        'From Part_Store_Levels,Part_Store, Part, Part_Store Part_Store_F' +
        'rom'
      
        'Where  ((Part_Store.Part_Store = :Part_Store) or (:Part_Store = ' +
        '0)) and'
      
        '       (Part_Store_Levels.Part_Store_Type = Part_Store.Part_Stor' +
        'e_Type) and'
      '       (Part.Part = Part_Store_Levels.Part) and'
      '       (Part_Store_Levels.Purchase_Or_Store = '#39'S'#39') and'
      
        '       (Part_Store_From.Part_Store = Part_Store_Levels.Replenish' +
        '_Store) and'
      '       (Part_Store_From.Part_Store = :Part_Store_From) and'
      '       (Part.Part Not In (Select Text100'
      '                                 From Int_Sel'
      '                                 Where (Int_Sel_Code = XUCX) and'
      '                                       (Text100 = Part.Part)))'
      'Order By Part_Store_Levels.Part'
      ' '
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 392
    Top = 196
    ParamData = <
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Part_Store_From'
      end>
  end
  object GetPFJJobSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Job'
      'From Parts_For_Job'
      'Where Parts_For_Job = :Parts_For_Job'
      ' '
      ' '
      ' ')
    Left = 424
    Top = 196
    ParamData = <
      item
        Name = 'Parts_For_Job'
      end>
  end
  object GetAllocsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Parts_For_Job'
      'From Purch_Ord_Line_Alloc'
      'Where (Purch_Ord_Line_Alloc.Purch_Ord = :Purch_Ord) and'
      
        '      ((Purch_Ord_Line_Alloc.Purch_Ord_Line_No = :Purch_Ord_Line' +
        '_No) or (:Purch_Ord_Line_No = 0))'
      ' '
      ' ')
    Left = 160
    Top = 252
    ParamData = <
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Line_No'
      end
      item
        Name = 'Purch_Ord_Line_No'
      end>
  end
  object AddPFJSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Purch_Ord_Line_Alloc'
      
        '(Purch_Ord, Purch_Ord_Line_No, Parts_For_Job, Quantity_Allocated' +
        ')'
      'Values'
      '(:Purch_Ord, :Purch_Ord_Line_No, :Parts_For_Job, 0)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 64
    Top = 288
    ParamData = <
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Line_No'
      end
      item
        Name = 'Parts_For_Job'
      end>
  end
  object DelPFJSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Purch_Ord_Line_Alloc'
      'Where (Purch_Ord = :Purch_Ord) and'
      
        '      ((Purch_Ord_Line_No = :Purch_Ord_Line_No) or (:Purch_Ord_L' +
        'ine_No = 0))'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 96
    Top = 192
    ParamData = <
      item
        Name = 'Purch_Ord'
      end
      item
        Name = 'Purch_Ord_Line_No'
      end
      item
        Name = 'Purch_Ord_Line_No'
      end>
  end
  object UpdPFJStatusOSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Parts_For_Job'
      'Set Part_Status = '#39'O'#39
      'Where (Parts_For_Job = :Parts_For_Job) and'
      '      (Part_Status = '#39'R'#39')'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 48
    Top = 256
    ParamData = <
      item
        Name = 'Parts_For_Job'
      end>
  end
  object UpdPFJStatusRSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Parts_For_Job'
      'Set Part_Status = '#39'R'#39
      'Where (Parts_For_Job = :Parts_For_Job) and'
      '      (Part_Status = '#39'O'#39')'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 80
    Top = 232
    ParamData = <
      item
        Name = 'Parts_For_Job'
      end>
  end
  object GetDiscRateSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Supplier.Discount, Part_Supplier.Discount'
      'From Supplier, Part_Supplier'
      'where ((Supplier.Supplier = Part_Supplier.Supplier) and'
      '    (Part_Supplier.Part = :Part) and'
      '    (Supplier.Supplier = :Supplier) and'
      '    (Part_Supplier.Discount_This_Part = '#39'Y'#39'))')
    Left = 448
    Top = 128
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Supplier'
      end>
  end
  object ppmnPOLines: TPopupMenu
    Left = 84
    Top = 108
    object AddPOLine: TMenuItem
      Caption = '&Add'
      ShortCut = 16449
      OnClick = AddPOLineClick
    end
    object ChangePOLine: TMenuItem
      Caption = '&Change'
      ShortCut = 16451
      OnClick = ChangePOLineClick
    end
    object DeletePOLine: TMenuItem
      Caption = '&Delete'
      ShortCut = 16452
      OnClick = DeletePOLineClick
    end
    object RecommendPOLine: TMenuItem
      Caption = '&Recommend'
      ShortCut = 16466
      OnClick = RecommendPOLineClick
    end
  end
  object ppmnExChrgsGrid: TPopupMenu
    OnPopup = ppmnExChrgsGridPopup
    Left = 48
    Top = 432
    object AddExChrg: TMenuItem
      Caption = '&Add'
      ShortCut = 16449
      OnClick = AddExChrgClick
    end
    object ChangeExChrg: TMenuItem
      Caption = '&Change'
      ShortCut = 16451
      OnClick = ChangeExChrgClick
    end
    object DeleteExChrg: TMenuItem
      Caption = '&Delete'
      ShortCut = 16452
      OnClick = DeleteExChrgClick
    end
  end
  object pmnDummy: TPopupMenu
    OnPopup = ppmnExChrgsGridPopup
    Left = 280
    Top = 424
    object MenuItem1: TMenuItem
      Caption = '&Add'
      ShortCut = 16449
      OnClick = AddExChrgClick
    end
    object MenuItem2: TMenuItem
      Caption = '&Change'
      ShortCut = 16451
      OnClick = ChangeExChrgClick
    end
    object MenuItem3: TMenuItem
      Caption = '&Delete'
      ShortCut = 16452
      OnClick = DeleteExChrgClick
    end
  end
  object qryInsSOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Sales_Order_Line'
      '(Sales_Order, Sales_Order_line_no, Part, Part_Cost,'
      'Purch_Pack_Quantity, Part_Sales_Price, Sell_Pack_Quantity,'
      'Quantity_Ordered, Quantity_Allocated, Quantity_Delivered,'
      'Contract, Contract_Line_no, Sales_order_Line_Status,'
      'Quantity_Invoiced, Line_Complete, vat_code, Discount_Type,'
      'Discount_value, Replacement_For_Line, Original_Sell_Price)'
      'Values'
      '(:Sales_Order, :Sales_Order_line_no, :Part,:Part_Cost,'
      ':Purch_Pack_Quantity, :Part_Sales_Price, :Sell_Pack_Quantity,'
      ':Quantity_Ordered, :Quantity_Allocated, :Quantity_Delivered,'
      ':Contract, :Contract_Line_no, :Sales_order_Line_Status,'
      ':Quantity_Invoiced, :Line_Complete,:vat_code, :Discount_Type,'
      ':Discount_value, :Replacement_For_Line, :Original_Sell_Price);')
    Left = 608
    Top = 196
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_line_no'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Part_Cost'
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Part_Sales_Price'
      end
      item
        Name = 'Sell_Pack_Quantity'
      end
      item
        Name = 'Quantity_Ordered'
      end
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Quantity_Delivered'
      end
      item
        Name = 'Contract'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Contract_Line_no'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Sales_order_Line_Status'
      end
      item
        Name = 'Quantity_Invoiced'
      end
      item
        Name = 'Line_Complete'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'vat_code'
      end
      item
        Name = 'Discount_Type'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Discount_value'
        DataType = ftCurrency
        ParamType = ptInput
      end
      item
        Name = 'Replacement_For_Line'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Original_Sell_Price'
        DataType = ftCurrency
        ParamType = ptInput
      end>
  end
  object qrySelHighestSOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select max(sales_order_line_no) as line_no from sales_order_line' +
        ' '
      'where sales_order = :sales_order;')
    Left = 608
    Top = 236
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qrySelPart: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from part where part = :part;')
    Left = 608
    Top = 276
    ParamData = <
      item
        Name = 'part'
      end>
  end
  object qrySelSO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from sales_order where sales_order = :sales_order;')
    Left = 664
    Top = 196
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 712
    Top = 176
  end
  object qryDelPONarrative: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from narrative_line'
      'where narrative = :narrative'
      ' ')
    Left = 496
    Top = 312
    ParamData = <
      item
        Name = 'narrative'
      end>
  end
  object qryGetPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Purch_Ord.Supplier, Purch_Ord.Branch_No,Purch_Ord.Purch_O' +
        'rd_Date,'
      '       Purch_Ord.Purch_Ord_No, Purch_Ord.Purch_Ord_No as PO_Ref,'
      
        '       (Supplier.Name + '#39', '#39' + Supplier_Branch.Name) as From_Nam' +
        'e, Purch_Ord.Purch_Ord,'
      '       Purch_Ord.Part_Store, Purch_Ord.Purch_Ord_Descr,'
      
        '       Purch_Ord_Status.Status_Descr, Purch_Ord.Purch_Ord_Status' +
        ', Purch_Ord.Date_Required,'
      
        '       Purch_ord.Sales_order, Purch_Ord.Supp_Order_type, Purch_O' +
        'rd.Narrative, Purch_Ord.Operator, Purch_Ord.Requested_By'
      'From Purch_Ord, Supplier, Supplier_Branch, Purch_Ord_Status'
      'Where (Purch_Ord.Purch_Ord = :Purch_Ord) and'
      '      (Supplier.Supplier = Purch_Ord.Supplier) and'
      '      (Supplier_Branch.Supplier = Purch_Ord.Supplier) and'
      '      (Supplier_Branch.Branch_No = Purch_Ord.Branch_No) and'
      
        '      (Purch_Ord_Status.Purch_Ord_Status = Purch_Ord.Purch_Ord_S' +
        'tatus)'
      ''
      ''
      ''
      ' '
      ''
      ''
      ' ')
    Left = 512
    Top = 432
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryGetOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Operator, Name as Operator_Name'
      'from Operator'
      'where Operator = :Operator')
    Left = 608
    Top = 340
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object qryGetSInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct'
      '  Supplier_invoice.Supplier_invoice,'
      '  Supplier_invoice.invoice_date,'
      '  Supplier_invoice.supplier_invoice_no,'
      #9'Supplier_invoice.supp_inv_alt_ref,'
      #9'Supplier_invoice.invoice_or_credit,'
      
        #9'Supplier_invoice.goods_value + Supplier_invoice.goods_value_dif' +
        'f as Goods_Value,'
      
        #9'Supplier_invoice.vat_value + Supplier_invoice.vat_value_diff as' +
        ' Vat_Value,'
      
        #9'Supplier_invoice.goods_value + Supplier_invoice.goods_value_dif' +
        'f + Supplier_invoice.vat_value + Supplier_invoice.vat_value_diff' +
        ' as Total_Value,'
      #9'Supplier_invoice.supp_invoice_status,'
      
        #9'Supp_invoice_status.Description as Supplier_invoice_status_Desc' +
        'r,'
      #9'Supplier.Name '
      
        'from Supplier_invoice_line, supplier_invoice, supp_invoice_statu' +
        's, Supplier'
      'where purch_ord = :Purch_Ord and'
      
        'supplier_invoice_line.supplier_invoice = supplier_invoice.suppli' +
        'er_invoice and'
      
        'Supplier_invoice.supp_invoice_status = Supp_invoice_status.supp_' +
        'invoice_status and '
      'Supplier_invoice.supplier = supplier.supplier'
      'Order by Supplier_invoice.Supplier_invoice')
    Left = 456
    Top = 376
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object dtsGetSInvoice: TDataSource
    DataSet = qryGetSInvoice
    Left = 528
    Top = 376
  end
  object qryPurchChkStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select purch_ord_line.Purch_ord, purch_ord.purch_ord_status, '
      '          sum(Qty_Invoiced) as Qty_Invoiced,'
      '          sum(Quantity_Received) as Qty_Received,'
      '          sum(Quantity_Ordered) as Qty_Ordered'
      'from Purch_Ord_Line, purch_ord'
      'where purch_ord_line.purch_ord = purch_ord.purch_ord'
      'Group BY purch_ord_line.Purch_ord, purch_ord.purch_ord_status'
      'Having purch_ord_line.Purch_Ord = :Purch_Ord'
      '')
    Left = 128
    Top = 352
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryPurchUpStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purch_ord'
      'set Purch_ord_Status = :Purch_Ord_Status'
      'where Purch_ord = :Purch_Ord')
    Left = 232
    Top = 352
    ParamData = <
      item
        Name = 'Purch_Ord_Status'
      end
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryGetSOStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_order_Head_Status'
      'from Sales_order'
      'where Sales_Order = :Sales_Order')
    Left = 708
    Top = 283
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryUpSOStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_Order'
      'Set Sales_Order_Head_Status = 10'
      'Where Sales_Order = :Sales_Order')
    Left = 708
    Top = 339
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object UpdSOlineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Sales_Order_Line'
      
        'SET Part_Cost = :Part_Cost, Purch_Pack_Quantity = :Purch_Pack_Qu' +
        'antity'
      'WHERE Sales_Order = :Sales_Order AND'
      '      Part = :Part')
    Left = 136
    Top = 480
    ParamData = <
      item
        Name = 'Part_Cost'
      end
      item
        Name = 'Purch_Pack_Quantity'
      end
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Part'
      end>
  end
end
