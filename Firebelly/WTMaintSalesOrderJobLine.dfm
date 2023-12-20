object frmWTMaintSalesOrderJobLine: TfrmWTMaintSalesOrderJobLine
  Left = 200
  Top = 149
  BorderStyle = bsDialog
  Caption = 'Sales Order line details'
  ClientHeight = 251
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object pnlFunctions: TPanel
    Left = 0
    Top = 211
    Width = 649
    Height = 40
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    TabStop = True
    DesignSize = (
      649
      40)
    object lblDelete: TLabel
      Left = 321
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
      ExplicitLeft = 329
    end
    object btnOK: TBitBtn
      Left = 481
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
      Left = 561
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
    Top = 0
    Width = 649
    Height = 211
    Align = alClient
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 24
      Width = 76
      Height = 13
      Caption = 'Quote Number'
    end
    object Label3: TLabel
      Left = 8
      Top = 186
      Width = 52
      Height = 13
      Caption = 'Total Price'
    end
    object Label2: TLabel
      Left = 232
      Top = 124
      Width = 46
      Height = 13
      Caption = 'Pack Size'
      Visible = False
    end
    object OrdqtyLbl: TLabel
      Left = 386
      Top = 130
      Width = 44
      Height = 13
      Caption = 'Quantity'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label5: TLabel
      Left = 234
      Top = 186
      Width = 42
      Height = 13
      Caption = 'Vat Rate'
    end
    object Label6: TLabel
      Left = 483
      Top = 187
      Width = 62
      Height = 13
      Caption = 'Job Number'
    end
    object lblJob: TLabel
      Left = 547
      Top = 187
      Width = 31
      Height = 13
      Caption = 'lblJob'
    end
    object Label7: TLabel
      Left = 10
      Top = 52
      Width = 31
      Height = 13
      Caption = 'Fixing'
    end
    object Label8: TLabel
      Left = 10
      Top = 76
      Width = 83
      Height = 13
      Caption = 'Survey/Template'
    end
    object Label9: TLabel
      Left = 10
      Top = 100
      Width = 40
      Height = 13
      Caption = 'Delivery'
    end
    object Supply: TLabel
      Left = 10
      Top = 124
      Width = 35
      Height = 13
      Caption = 'Supply'
    end
    object Bevel1: TBevel
      Left = 0
      Top = 173
      Width = 625
      Height = 5
      Shape = bsTopLine
      Style = bsRaised
    end
    object Label10: TLabel
      Left = 10
      Top = 148
      Width = 46
      Height = 13
      Caption = 'Discount'
    end
    object edtQuote: TEdit
      Left = 104
      Top = 20
      Width = 137
      Height = 21
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
      OnChange = CheckOK
    end
    object memPrice: TMemo
      Left = 103
      Top = 182
      Width = 81
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
      WordWrap = False
    end
    object edtDescription: TEdit
      Left = 272
      Top = 20
      Width = 345
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edtPackSize: TEdit
      Left = 288
      Top = 120
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
      Visible = False
    end
    object edtQtyPacks: TEdit
      Left = 472
      Top = 126
      Width = 81
      Height = 21
      TabOrder = 4
      Visible = False
    end
    object dblkpVAT: TDBLookupComboBox
      Left = 289
      Top = 182
      Width = 144
      Height = 21
      KeyField = 'Vat'
      ListField = 'Vat_Rate'
      ListSource = dtmdlSalesOrder.dtsVAT
      TabOrder = 5
    end
    object Button1: TButton
      Left = 443
      Top = 180
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Button1Click
    end
    object memFixing: TMemo
      Left = 104
      Top = 48
      Width = 81
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      TabOrder = 7
      WordWrap = False
      OnChange = UpdateOrderLine
    end
    object memTemplate: TMemo
      Left = 104
      Top = 72
      Width = 81
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      TabOrder = 8
      WordWrap = False
      OnChange = UpdateOrderLine
    end
    object memDelivery: TMemo
      Left = 104
      Top = 96
      Width = 81
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      TabOrder = 9
      WordWrap = False
      OnChange = UpdateOrderLine
    end
    object memSupply: TMemo
      Left = 104
      Top = 120
      Width = 81
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      TabOrder = 10
      WordWrap = False
      OnChange = UpdateOrderLine
    end
    object memDiscount: TMemo
      Left = 104
      Top = 144
      Width = 81
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      TabOrder = 11
      WordWrap = False
      OnChange = UpdateOrderLine
    end
  end
end
