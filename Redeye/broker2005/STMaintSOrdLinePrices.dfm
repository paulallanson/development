object STMaintSOrdLinePricesFrm: TSTMaintSOrdLinePricesFrm
  Left = 37
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Maintain Sales Order Details'
  ClientHeight = 260
  ClientWidth = 722
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlproduct: TPanel
    Left = 0
    Top = 0
    Width = 722
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 19
      Width = 68
      Height = 13
      Caption = 'Product Code:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 312
      Top = 19
      Width = 53
      Height = 13
      Caption = 'Description'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object PartEdit: TEdit
      Left = 104
      Top = 15
      Width = 201
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DescriptionEdit: TEdit
      Left = 376
      Top = 15
      Width = 337
      Height = 21
      TabStop = False
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnlFunctions: TPanel
    Left = 0
    Top = 209
    Width = 722
    Height = 51
    Align = alBottom
    TabOrder = 2
    TabStop = True
    DesignSize = (
      722
      51)
    object OKBtn: TBitBtn
      Left = 558
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = OKBtnClick
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
    object CancelBtn: TBitBtn
      Left = 638
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 49
    Width = 722
    Height = 160
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 13
      Width = 48
      Height = 13
      Caption = 'Cost Price'
    end
    object Label3: TLabel
      Left = 8
      Top = 43
      Width = 44
      Height = 13
      Caption = 'Sell Price'
    end
    object Label7: TLabel
      Left = 192
      Top = 13
      Width = 41
      Height = 13
      Caption = 'Cost unit'
    end
    object Label8: TLabel
      Left = 192
      Top = 43
      Width = 37
      Height = 13
      Caption = 'Sell unit'
    end
    object Label4: TLabel
      Left = 352
      Top = 45
      Width = 47
      Height = 13
      Caption = 'VAT Rate'
    end
    object Label6: TLabel
      Left = 8
      Top = 73
      Width = 80
      Height = 13
      Caption = 'Quantity Ordered'
    end
    object Label9: TLabel
      Left = 8
      Top = 133
      Width = 83
      Height = 13
      Caption = 'Quantity Invoiced'
    end
    object Label10: TLabel
      Left = 192
      Top = 73
      Width = 40
      Height = 13
      Caption = '(Singles)'
    end
    object Label11: TLabel
      Left = 192
      Top = 133
      Width = 40
      Height = 13
      Caption = '(Singles)'
    end
    object Label12: TLabel
      Left = 8
      Top = 103
      Width = 87
      Height = 13
      Caption = 'Quantity Delivered'
    end
    object Label13: TLabel
      Left = 192
      Top = 103
      Width = 40
      Height = 13
      Caption = '(Singles)'
    end
    object SellPriceMemo: TMemo
      Left = 104
      Top = 39
      Width = 75
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      WantReturns = False
    end
    object PurchPricememo: TMemo
      Left = 104
      Top = 9
      Width = 75
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      WantReturns = False
    end
    object PackSizeMemo: TMemo
      Left = 238
      Top = 41
      Width = 75
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      WantReturns = False
    end
    object PurchPackMemo: TMemo
      Left = 238
      Top = 9
      Width = 75
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      WantReturns = False
    end
    object dblkpVat: TDBLookupComboBox
      Left = 424
      Top = 41
      Width = 145
      Height = 21
      KeyField = 'Vat_Code'
      ListField = 'Description'
      ListSource = STSalesOrdDM.dtsVat
      TabOrder = 4
    end
    object memOrderQuantity: TEdit
      Left = 104
      Top = 69
      Width = 75
      Height = 21
      TabOrder = 5
      OnKeyPress = memOrderQuantityKeyPress
    end
    object memInvoiceQuantity: TEdit
      Left = 104
      Top = 129
      Width = 75
      Height = 21
      TabOrder = 7
      OnKeyPress = memInvoiceQuantityKeyPress
    end
    object memDeliveryQuantity: TEdit
      Left = 104
      Top = 99
      Width = 75
      Height = 21
      TabOrder = 6
      OnKeyPress = memInvoiceQuantityKeyPress
    end
  end
end
