object frmWTMaintPurchaseOrderLine: TfrmWTMaintPurchaseOrderLine
  Left = 549
  Top = 128
  Caption = 'Purchase Order Line'
  ClientHeight = 453
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object pnlFunctions: TPanel
    Left = 0
    Top = 413
    Width = 750
    Height = 40
    Align = alBottom
    TabOrder = 4
    TabStop = True
    DesignSize = (
      750
      40)
    object lblDelete: TLabel
      Left = 434
      Top = 12
      Width = 145
      Height = 15
      Anchors = [akRight, akBottom]
      Caption = 'Delete the above details ?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOK: TBitBtn
      Left = 594
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
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
    end
    object btnCancel: TBitBtn
      Left = 674
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 41
    Width = 750
    Height = 224
    Align = alClient
    TabOrder = 1
    object Label6: TLabel
      Left = 26
      Top = 14
      Width = 37
      Height = 13
      Caption = 'Material'
    end
    object Label8: TLabel
      Left = 26
      Top = 44
      Width = 41
      Height = 13
      Caption = 'Worktop'
    end
    object Label9: TLabel
      Left = 26
      Top = 74
      Width = 49
      Height = 13
      Caption = 'Thickness'
    end
    object Label10: TLabel
      Left = 26
      Top = 134
      Width = 58
      Height = 13
      Caption = 'Length (mm)'
    end
    object Label11: TLabel
      Left = 26
      Top = 164
      Width = 54
      Height = 13
      Caption = 'Depth (mm)'
    end
    object btnWorktops: TSpeedButton
      Left = 378
      Top = 39
      Width = 23
      Height = 23
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 26
      Top = 104
      Width = 44
      Height = 13
      Caption = 'Slab Size'
    end
    object SpeedButton1: TSpeedButton
      Left = 304
      Top = 9
      Width = 23
      Height = 23
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object Label4: TLabel
      Left = 26
      Top = 202
      Width = 56
      Height = 13
      Caption = 'Cost per m2'
    end
    object Label5: TLabel
      Left = 227
      Top = 202
      Width = 45
      Height = 13
      Caption = 'Slab Cost'
    end
    object btnContactClear: TSpeedButton
      Left = 378
      Top = 99
      Width = 23
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
        05555777775555557F5555000555555505555577755555557555}
      NumGlyphs = 2
      ParentFont = False
      OnClick = btnContactClearClick
    end
    object Label1: TLabel
      Left = 222
      Top = 164
      Width = 50
      Height = 13
      Caption = 'Slab Label'
    end
    object edtDepth: TCREditInt
      Left = 112
      Top = 160
      Width = 80
      Height = 21
      TabOrder = 5
      OnChange = edtLengthChange
    end
    object edtLength: TCREditInt
      Left = 112
      Top = 130
      Width = 80
      Height = 21
      TabOrder = 4
      OnChange = edtLengthChange
    end
    object dblkpWTThickness: TDBLookupComboBox
      Left = 112
      Top = 70
      Width = 89
      Height = 21
      KeyField = 'Thickness'
      ListField = 'Thickness_mm'
      ListSource = dtmdlPurchaseOrder.dtsWTThickness
      TabOrder = 2
      OnClick = dblkpWTThicknessClick
    end
    object dblkpWorktop: TDBLookupComboBox
      Left = 112
      Top = 40
      Width = 249
      Height = 21
      KeyField = 'Worktop'
      ListField = 'Description'
      ListSource = dtmdlPurchaseOrder.dtsWorktops
      TabOrder = 1
      OnClick = dblkpWorktopClick
    end
    object dblkpMaterial: TDBLookupComboBox
      Left = 112
      Top = 10
      Width = 170
      Height = 21
      KeyField = 'Material_Type'
      ListField = 'Description'
      ListSource = dtmdlPurchaseOrder.dtsMaterial
      TabOrder = 0
      OnClick = dblkpMaterialClick
    end
    object dblkpSlabSize: TDBLookupComboBox
      Left = 112
      Top = 100
      Width = 249
      Height = 21
      KeyField = 'Slab_size'
      ListField = 'Slab_Description'
      ListSource = dtmdlPurchaseOrder.dtsMaterialSlab
      TabOrder = 3
      OnClick = dblkpSlabSizeClick
    end
    object edtSlabUnitCost: TCREditMoney
      Left = 112
      Top = 198
      Width = 80
      Height = 21
      TabOrder = 7
      OnChange = edtLengthChange
    end
    object edtSlabTotalCost: TMemo
      Left = 280
      Top = 198
      Width = 80
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 8
      WantReturns = False
      WordWrap = False
    end
    object edtSlabLabel: TEdit
      Left = 280
      Top = 160
      Width = 121
      Height = 21
      TabOrder = 6
      Text = 'edtSlabLabel'
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 26
      Top = 14
      Width = 55
      Height = 13
      Caption = 'Sales Order'
    end
    object SpeedButton2: TSpeedButton
      Left = 226
      Top = 9
      Width = 23
      Height = 23
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object edtSalesOrder: TCREditInt
      Left = 112
      Top = 10
      Width = 97
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 265
    Width = 750
    Height = 65
    Align = alBottom
    TabOrder = 2
    object OrdqtyLbl: TLabel
      Left = 26
      Top = 40
      Width = 76
      Height = 13
      Caption = 'Order Qty (units)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblQtyDelivered: TLabel
      Left = 202
      Top = 40
      Width = 76
      Height = 13
      Caption = 'Delivered (units)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblQtyInvoiced: TLabel
      Left = 423
      Top = 40
      Width = 72
      Height = 13
      Caption = 'Invoiced (units)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label12: TLabel
      Left = 26
      Top = 10
      Width = 43
      Height = 13
      Caption = 'Unit Cost'
    end
    object Label3: TLabel
      Left = 226
      Top = 10
      Width = 43
      Height = 13
      Caption = 'Cost Unit'
    end
    object Label13: TLabel
      Left = 442
      Top = 10
      Width = 53
      Height = 13
      Caption = 'Discount %'
    end
    object edtOrderQty: TMemo
      Left = 112
      Top = 36
      Width = 80
      Height = 21
      TabOrder = 3
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
    end
    object edtDeliveredQty: TMemo
      Left = 288
      Top = 36
      Width = 80
      Height = 21
      TabOrder = 4
      Visible = False
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
    end
    object edtInvoicedQty: TMemo
      Left = 504
      Top = 36
      Width = 80
      Height = 21
      TabOrder = 5
      Visible = False
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
    end
    object edtUnitCost: TCREditMoney
      Left = 112
      Top = 6
      Width = 80
      Height = 21
      TabOrder = 0
      OnChange = CheckOK
    end
    object edtCostUnit: TMemo
      Left = 288
      Top = 6
      Width = 80
      Height = 21
      TabOrder = 1
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
    end
    object edtDiscount: TCREditMoney
      Left = 504
      Top = 6
      Width = 80
      Height = 21
      TabOrder = 2
      OnChange = edtLengthChange
    end
  end
  object pnlNotes: TPanel
    Left = 0
    Top = 330
    Width = 750
    Height = 83
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      750
      83)
    object Label7: TLabel
      Left = 26
      Top = 13
      Width = 28
      Height = 13
      Caption = 'Notes'
    end
    object memNotes: TMemo
      Left = 112
      Top = 8
      Width = 473
      Height = 66
      Anchors = [akLeft, akTop, akBottom]
      Lines.Strings = (
        'memNotes')
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
