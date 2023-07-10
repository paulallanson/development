object frmWTMaintPurchaseOrderLineProd: TfrmWTMaintPurchaseOrderLineProd
  Left = 274
  Top = 147
  BorderStyle = bsDialog
  Caption = 'Purchase Order Line - Products'
  ClientHeight = 290
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFunctions: TPanel
    Left = 0
    Top = 250
    Width = 758
    Height = 40
    Align = alBottom
    TabOrder = 3
    TabStop = True
    DesignSize = (
      758
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
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnOKClick
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
    object btnCancel: TBitBtn
      Left = 674
      Top = 7
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
  object pnlDetails: TPanel
    Left = 0
    Top = 25
    Width = 758
    Height = 142
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 18
      Top = 13
      Width = 65
      Height = 13
      Caption = 'Product Code'
    end
    object Label2: TLabel
      Left = 18
      Top = 45
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object btnLUProducts: TSpeedButton
      Left = 562
      Top = 8
      Width = 23
      Height = 23
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnLUProductsClick
    end
    object OrdqtyLbl: TLabel
      Left = 18
      Top = 104
      Width = 86
      Height = 13
      Caption = 'Order Qty (singles)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblQtyDelivered: TLabel
      Left = 202
      Top = 104
      Width = 86
      Height = 13
      Caption = 'Delivered (singles)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblQtyInvoiced: TLabel
      Left = 423
      Top = 104
      Width = 82
      Height = 13
      Caption = 'Invoiced (singles)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label12: TLabel
      Left = 18
      Top = 74
      Width = 43
      Height = 13
      Caption = 'Unit Cost'
    end
    object Label3: TLabel
      Left = 202
      Top = 74
      Width = 84
      Height = 13
      Caption = 'Cost Unit (singles)'
    end
    object Label13: TLabel
      Left = 442
      Top = 74
      Width = 53
      Height = 13
      Caption = 'Discount %'
    end
    object edtOrderQty: TMemo
      Left = 112
      Top = 100
      Width = 80
      Height = 21
      TabOrder = 5
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = edtOrderQtyEnter
      OnExit = edtOrderQtyExit
      OnKeyPress = edtDescriptionKeyPress
    end
    object edtDeliveredQty: TMemo
      Left = 296
      Top = 100
      Width = 80
      Height = 21
      TabOrder = 6
      Visible = False
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnKeyPress = edtDescriptionKeyPress
    end
    object edtInvoicedQty: TMemo
      Left = 512
      Top = 100
      Width = 80
      Height = 21
      TabOrder = 7
      Visible = False
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnKeyPress = edtDescriptionKeyPress
    end
    object edtUnitCost: TCREditMoney
      Left = 112
      Top = 70
      Width = 80
      Height = 21
      TabOrder = 2
      OnChange = CheckOK
      OnKeyPress = edtDescriptionKeyPress
    end
    object edtCostUnit: TMemo
      Left = 296
      Top = 70
      Width = 80
      Height = 21
      TabOrder = 3
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnKeyPress = edtDescriptionKeyPress
    end
    object edtDiscount: TCREditMoney
      Left = 512
      Top = 70
      Width = 80
      Height = 21
      TabOrder = 4
      OnChange = CheckOK
      OnKeyPress = edtDescriptionKeyPress
    end
    object cmbProducts: TComboBox
      Left = 112
      Top = 9
      Width = 433
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cmbProducts'
      OnEnter = cmbProductsEnter
      OnExit = cmbProductsExit
      OnKeyPress = cmbProductsKeyPress
    end
    object edtDescription: TMemo
      Left = 112
      Top = 41
      Width = 625
      Height = 21
      Lines.Strings = (
        'edtDescription')
      TabOrder = 1
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnKeyPress = edtDescriptionKeyPress
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 25
    Align = alTop
    TabOrder = 0
  end
  object pnlNotes: TPanel
    Left = 0
    Top = 167
    Width = 758
    Height = 83
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      758
      83)
    object Label7: TLabel
      Left = 18
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
      OnChange = CheckOK
      OnKeyPress = edtDescriptionKeyPress
    end
  end
end
