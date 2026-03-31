object frmWTMaintSalesOrderLine: TfrmWTMaintSalesOrderLine
  Left = 231
  Top = 123
  BorderStyle = bsDialog
  Caption = 'Sales Order line details'
  ClientHeight = 290
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 17
  object pnlFunctions: TPanel
    Left = 0
    Top = 250
    Width = 622
    Height = 40
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    TabStop = True
    ExplicitTop = 241
    ExplicitWidth = 616
    DesignSize = (
      622
      40)
    object lblDelete: TLabel
      Left = 276
      Top = 12
      Width = 166
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = 'Delete the above details ?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 282
    end
    object btnOK: TBitBtn
      Left = 436
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 0
      OnClick = btnOKClick
      ExplicitLeft = 430
    end
    object btnCancel: TBitBtn
      Left = 516
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 510
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 622
    Height = 250
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 1
    object Label1: TLabel
      Left = 10
      Top = 24
      Width = 80
      Height = 17
      Caption = 'Product Code'
    end
    object Label3: TLabel
      Left = 10
      Top = 81
      Width = 54
      Height = 17
      Caption = 'Price/unit'
    end
    object Label2: TLabel
      Left = 210
      Top = 80
      Width = 50
      Height = 17
      Caption = 'Unit Size'
    end
    object OrdqtyLbl: TLabel
      Left = 10
      Top = 139
      Width = 98
      Height = 17
      Caption = 'Order Qty (units)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 10
      Top = 108
      Width = 78
      Height = 17
      Caption = 'Sell Price/unit'
    end
    object Label5: TLabel
      Left = 210
      Top = 108
      Width = 48
      Height = 17
      Caption = 'Vat Rate'
    end
    object lblQtyDelivered: TLabel
      Left = 210
      Top = 139
      Width = 94
      Height = 17
      Caption = 'Delivered (units)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label7: TLabel
      Left = 10
      Top = 52
      Width = 66
      Height = 17
      Caption = 'Description'
    end
    object lblQtyInvoiced: TLabel
      Left = 418
      Top = 139
      Width = 87
      Height = 17
      Caption = 'Invoiced (units)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label6: TLabel
      Left = 10
      Top = 202
      Width = 73
      Height = 17
      Caption = 'Job Number'
    end
    object Label8: TLabel
      Left = 10
      Top = 170
      Width = 95
      Height = 16
      Caption = 'Allocated (units)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtProduct: TEdit
      Left = 112
      Top = 21
      Width = 137
      Height = 25
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = CheckOK
      OnKeyPress = edtProductKeyPress
    end
    object btnLUProducts: TButton
      Left = 256
      Top = 19
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnLUProductsClick
    end
    object memPrice: TMemo
      Left = 112
      Top = 78
      Width = 81
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
      WordWrap = False
    end
    object edtDescription: TEdit
      Left = 112
      Top = 49
      Width = 471
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edtPackSize: TEdit
      Left = 312
      Top = 77
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
    end
    object memSellPrice: TMemo
      Left = 112
      Top = 106
      Width = 81
      Height = 21
      Alignment = taRightJustify
      TabOrder = 5
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateMoney
    end
    object dblkpVAT: TDBLookupComboBox
      Left = 312
      Top = 104
      Width = 144
      Height = 25
      KeyField = 'Vat'
      ListField = 'Description'
      ListSource = dtmdlSalesOrder.dtsVAT
      TabOrder = 7
    end
    object edtQtyPacks: TMemo
      Left = 112
      Top = 136
      Width = 81
      Height = 21
      TabOrder = 6
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateQty
    end
    object Button1: TButton
      Left = 464
      Top = 104
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = Button1Click
    end
    object edtDelivered: TMemo
      Left = 312
      Top = 135
      Width = 81
      Height = 21
      TabOrder = 9
      Visible = False
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateQty
    end
    object edtInvoiced: TMemo
      Left = 512
      Top = 135
      Width = 81
      Height = 21
      TabOrder = 10
      Visible = False
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateQty
    end
    object edtJobNumber: TMemo
      Left = 112
      Top = 200
      Width = 81
      Height = 21
      TabOrder = 12
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateQty
    end
    object edtAllocated: TMemo
      Left = 112
      Top = 168
      Width = 81
      Height = 21
      TabOrder = 11
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateQty
    end
  end
end
