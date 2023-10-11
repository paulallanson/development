object frmSTMaintSalesOrderLine: TfrmSTMaintSalesOrderLine
  Left = 247
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Maintain Sales Order Line'
  ClientHeight = 250
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 209
    Width = 491
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      491
      41)
    object btnOK: TBitBtn
      Left = 305
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      Enabled = False
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
      TabOrder = 0
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 393
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 106
    Width = 491
    Height = 103
    Align = alClient
    TabOrder = 1
    object Label3: TLabel
      Left = 15
      Top = 16
      Width = 88
      Height = 13
      Caption = 'Quantity Produced'
    end
    object Label4: TLabel
      Left = 15
      Top = 76
      Width = 44
      Height = 13
      Caption = 'Sell Price'
    end
    object Label6: TLabel
      Left = 274
      Top = 76
      Width = 48
      Height = 13
      Caption = 'Pack Size'
    end
    object Label9: TLabel
      Left = 15
      Top = 46
      Width = 75
      Height = 13
      Caption = 'Return to Stock'
    end
    object Label10: TLabel
      Left = 279
      Top = 46
      Width = 43
      Height = 13
      Caption = 'Wastage'
    end
    object memProduced: TMemo
      Left = 113
      Top = 12
      Width = 97
      Height = 21
      TabOrder = 0
      WantReturns = False
      WordWrap = False
      OnChange = memProducedChange
      OnKeyPress = memProducedKeyPress
    end
    object memPrice: TMemo
      Left = 113
      Top = 71
      Width = 97
      Height = 21
      Alignment = taRightJustify
      TabOrder = 2
      WantReturns = False
      WordWrap = False
      OnChange = EnableOK
      OnEnter = SaveMemoField
      OnExit = ValidateMoney
      OnKeyPress = memPriceKeyPress
    end
    object memPackSize: TMemo
      Left = 337
      Top = 71
      Width = 97
      Height = 21
      Alignment = taRightJustify
      TabOrder = 3
      WantReturns = False
      WordWrap = False
      OnChange = EnableOK
      OnKeyPress = memPackSizeKeyPress
    end
    object memReturns: TMemo
      Left = 113
      Top = 42
      Width = 97
      Height = 21
      TabOrder = 1
      WantReturns = False
      WordWrap = False
      OnChange = memReturnsChange
      OnKeyPress = memReturnsKeyPress
    end
    object memWastage: TMemo
      Left = 337
      Top = 42
      Width = 96
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 4
      WantReturns = False
      WordWrap = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 491
    Height = 65
    Align = alTop
    TabOrder = 2
    object Label7: TLabel
      Left = 15
      Top = 12
      Width = 68
      Height = 13
      Caption = 'Product Code:'
    end
    object Label8: TLabel
      Left = 15
      Top = 40
      Width = 56
      Height = 13
      Caption = 'Description:'
    end
    object edtProductCode: TEdit
      Left = 112
      Top = 8
      Width = 281
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtDescription: TEdit
      Left = 112
      Top = 35
      Width = 361
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 491
    Height = 41
    Align = alTop
    TabOrder = 3
    object Label1: TLabel
      Left = 15
      Top = 16
      Width = 80
      Height = 13
      Caption = 'Quantity Ordered'
    end
    object Label2: TLabel
      Left = 239
      Top = 16
      Width = 83
      Height = 13
      Caption = 'Overs Requested'
    end
    object memQuantity: TMemo
      Left = 113
      Top = 12
      Width = 97
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
      WantReturns = False
      WordWrap = False
    end
    object memOvers: TMemo
      Left = 337
      Top = 12
      Width = 97
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
      WantReturns = False
      WordWrap = False
    end
  end
end
