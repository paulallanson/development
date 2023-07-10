object frmWTMaintPurchaseOrderLineCon: TfrmWTMaintPurchaseOrderLineCon
  Left = 275
  Top = 129
  Width = 766
  Height = 317
  Caption = 'Purchase Order Line - Consumables'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
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
    TabOrder = 4
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
      Default = True
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
    Height = 77
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 26
      Top = 13
      Width = 65
      Height = 13
      Caption = 'Product Code'
    end
    object Label2: TLabel
      Left = 26
      Top = 45
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object edtProductCode: TEdit
      Left = 112
      Top = 8
      Width = 385
      Height = 21
      TabOrder = 0
      Text = 'edtProductCode'
    end
    object edtDescription: TEdit
      Left = 112
      Top = 40
      Width = 625
      Height = 21
      TabOrder = 1
      Text = 'edtDescription'
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
  object Panel1: TPanel
    Left = 0
    Top = 185
    Width = 758
    Height = 65
    Align = alBottom
    TabOrder = 3
    object OrdqtyLbl: TLabel
      Left = 26
      Top = 40
      Width = 76
      Height = 13
      Caption = 'Order Qty (units)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
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
      Font.Name = 'MS Sans Serif'
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
      Font.Name = 'MS Sans Serif'
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
    Top = 102
    Width = 758
    Height = 83
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      758
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
