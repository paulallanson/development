object PBRSPurchByInvFrm: TPBRSPurchByInvFrm
  Left = 30
  Top = 58
  Caption = 'Purchases By Invoice Number'
  ClientHeight = 415
  ClientWidth = 727
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 745
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object pnlDisplay: TPanel
    Left = 0
    Top = 145
    Width = 727
    Height = 229
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 238
    object dbgDetails: TDBGrid
      Left = 1
      Top = 1
      Width = 731
      Height = 245
      Align = alClient
      DataSource = dtsrcPurchByInv
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgDetailsDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'Name_1'
          Title.Caption = 'Supplier'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Name'
          Title.Caption = 'Branch'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Invoice_Date'
          Title.Caption = 'Invoice Date'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Supplier_Invoice_no'
          Title.Caption = 'Supplier Invoice no'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'goods'
          Title.Caption = 'Goods Value'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vat'
          Title.Caption = 'Vat Value'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total_goods'
          Title.Caption = 'Invoice Total'
          Width = 82
          Visible = True
        end>
    end
    object OleContainer1: TOleContainer
      Left = 416
      Top = 200
      Width = 129
      Height = 89
      Caption = 'OleContainer1'
      Color = clBtnFace
      TabOrder = 1
      Visible = False
    end
  end
  object pnlControls: TPanel
    Left = 0
    Top = 0
    Width = 727
    Height = 145
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 95
      Width = 52
      Height = 13
      Caption = 'Sort first by'
    end
    object Label4: TLabel
      Left = 160
      Top = 95
      Width = 55
      Height = 13
      Caption = 'then sort by'
    end
    object DateFromButton: TSpeedButton
      Left = 551
      Top = 21
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
      OnClick = DateFromButtonClick
    end
    object DateToButton: TSpeedButton
      Left = 551
      Top = 64
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
      OnClick = DateToButtonClick
    end
    object Label1: TLabel
      Left = 448
      Top = 7
      Width = 90
      Height = 13
      Caption = 'From Invoice Date:'
    end
    object Label2: TLabel
      Left = 448
      Top = 52
      Width = 80
      Height = 13
      Caption = 'To Invoice Date:'
    end
    object Label5: TLabel
      Left = 328
      Top = 95
      Width = 89
      Height = 13
      Caption = 'Invoices to include'
    end
    object rgSupplier: TRadioGroup
      Left = 8
      Top = 8
      Width = 100
      Height = 60
      Caption = 'By Supplier'
      ItemIndex = 0
      Items.Strings = (
        'All Suppliers'
        'One Supplier')
      ParentBackground = False
      TabOrder = 0
      OnClick = rgSupplierClick
    end
    object pnlSuppSearch: TPanel
      Left = 120
      Top = 11
      Width = 305
      Height = 57
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object lblSuppBran: TLabel
        Left = 8
        Top = 1
        Width = 83
        Height = 13
        Caption = 'Supplier / Branch'
      end
      object edtSupplier: TEdit
        Left = 8
        Top = 17
        Width = 257
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object btnSupplier: TButton
        Left = 272
        Top = 17
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnSupplierClick
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
        OnClick = chkbxBranchesClick
      end
    end
    object cbSort1: TComboBox
      Left = 8
      Top = 109
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnChange = cbSortChange
      Items.Strings = (
        'Supplier'
        'Invoice Number'
        'Invoice Date')
    end
    object cbSort2: TComboBox
      Left = 160
      Top = 109
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      OnChange = cbSortChange
      Items.Strings = (
        'Supplier'
        'Invoice Number'
        'Invoice Date')
    end
    object DateFromEdit: TEdit
      Left = 447
      Top = 23
      Width = 98
      Height = 21
      MaxLength = 10
      TabOrder = 4
      OnChange = DateFromEditChange
      OnExit = DateFromEditExit
    end
    object cbValues: TComboBox
      Left = 328
      Top = 109
      Width = 217
      Height = 21
      Style = csDropDownList
      TabOrder = 5
      OnChange = cbValuesChange
      Items.Strings = (
        'non zero invoice values only'
        'zero values only'
        'credit values only'
        'All invoices/credits')
    end
    object DateToEdit: TEdit
      Left = 447
      Top = 65
      Width = 98
      Height = 21
      MaxLength = 10
      TabOrder = 6
      OnChange = DateToEditChange
      OnExit = DateToEditExit
    end
    object rdgrpType: TRadioGroup
      Left = 600
      Top = 8
      Width = 113
      Height = 60
      Caption = 'Type'
      ItemIndex = 0
      Items.Strings = (
        'Summary'
        'Detailed')
      ParentBackground = False
      TabOrder = 7
    end
    object chkbxPageBreak: TCheckBox
      Left = 576
      Top = 119
      Width = 161
      Height = 17
      Caption = 'Page break by sort type'
      TabOrder = 8
    end
    object chkbxIncludeQuery: TCheckBox
      Left = 576
      Top = 100
      Width = 161
      Height = 17
      Caption = 'Include flagged as query'
      TabOrder = 9
    end
  end
  object pnlPrintControl: TPanel
    Left = 0
    Top = 374
    Width = 727
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 383
    DesignSize = (
      727
      41)
    object lblRecordCount: TLabel
      Left = 104
      Top = 16
      Width = 3
      Height = 13
    end
    object Label6: TLabel
      Left = 24
      Top = 16
      Width = 69
      Height = 13
      Caption = 'Record Count:'
    end
    object Panel1: TPanel
      Left = 494
      Top = 1
      Width = 232
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object PreviewReportBitBtn: TBitBtn
        Left = 30
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Preview'
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
        OnClick = PreviewReportBitBtnClick
      end
      object PrintReportBitBtn: TBitBtn
        Left = 126
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Print'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = PrintReportBitBtnClick
      end
    end
    object CancelBitBtn: TBitBtn
      Left = 319
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      ExplicitLeft = 331
    end
    object btbtnExcel: TBitBtn
      Left = 415
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Excel'
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00A407070700FF
        FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFFA407070700FF
        FFFFFFFFFFFF07FFFFFF00000000000707070707070707070707A407070700FF
        FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA407000700FF
        FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA400000700FF
        FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFF000000000000
        00000000000000000000A4070707000707070707070700070707A40707070007
        07000700070700070707A4070707000707000000070700070707A40707070007
        07000700070700070707A4A4A4A400A4A4A400A4A4A400A4A4A4}
      TabOrder = 2
      OnClick = btbtnExcelClick
      ExplicitLeft = 427
    end
  end
  object pnlExportPrgrss: TPanel
    Left = 260
    Top = 252
    Width = 289
    Height = 61
    ParentBackground = False
    TabOrder = 3
    Visible = False
    object lblExporting: TLabel
      Left = 16
      Top = 12
      Width = 53
      Height = 13
      Caption = 'Exporting...'
    end
    object prgbrExport: TProgressBar
      Left = 16
      Top = 32
      Width = 257
      Height = 16
      Step = 1
      TabOrder = 0
    end
  end
  object dtsrcPurchByInv: TDataSource
    DataSet = qryPurchByInv
    Left = 112
    Top = 200
  end
  object qryPurchByInv: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT Supplier_Invoice.Vat_Value as vat,'
      
        '  Supplier_Invoice.Goods_Value as goods, (Supplier_Invoice.Goods' +
        '_value + Supplier_Invoice.Vat_Value) as total_goods,'
      
        '  Supplier_Invoice.Invoice_Date, Supplier_Invoice.Supplier_Invoi' +
        'ce_no,'
      
        '  Supplier_Invoice.Invoice_or_Credit, Supplier_Branch.Name, Supp' +
        'lier.Name'
      
        'FROM Supplier INNER JOIN (Supplier_Branch INNER JOIN Supplier_In' +
        'voice ON'
      ' (Supplier_Branch.Branch_no = Supplier_Invoice.Branch_no) AND'
      ' (Supplier_Branch.Supplier = Supplier_Invoice.Supplier)) ON'
      ' (Supplier_Invoice.Supplier = Supplier.Supplier) AND'
      ' (Supplier.Supplier = Supplier_Branch.Supplier)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 320
    Top = 184
    object qryPurchByInvvat: TCurrencyField
      FieldName = 'vat'
    end
    object qryPurchByInvgoods: TCurrencyField
      FieldName = 'goods'
    end
    object qryPurchByInvtotal_goods: TCurrencyField
      FieldName = 'total_goods'
    end
    object qryPurchByInvInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qryPurchByInvSupplier_Invoice_no: TStringField
      FieldName = 'Supplier_Invoice_no'
      FixedChar = True
      Size = 40
    end
    object qryPurchByInvInvoice_or_Credit: TStringField
      FieldName = 'Invoice_or_Credit'
      FixedChar = True
      Size = 2
    end
    object qryPurchByInvName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object qryPurchByInvName_1: TStringField
      FieldName = 'Name_1'
      FixedChar = True
      Size = 80
    end
  end
  object qryDetail: TFDQuery
    ConnectionName = 'pb'
    Left = 424
    Top = 185
  end
end
