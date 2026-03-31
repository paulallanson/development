object frmWTMaintSalesOrderAssociateCharge: TfrmWTMaintSalesOrderAssociateCharge
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Associate Charge'
  ClientHeight = 294
  ClientWidth = 674
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
    Top = 254
    Width = 674
    Height = 40
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    TabStop = True
    ExplicitTop = 245
    ExplicitWidth = 668
    DesignSize = (
      674
      40)
    object lblDelete: TLabel
      Left = 314
      Top = 12
      Width = 162
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = 'Delete the above details?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOK: TBitBtn
      Left = 482
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
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = btnOKClick
      ExplicitLeft = 476
    end
    object btnCancel: TBitBtn
      Left = 562
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 2
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 556
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 674
    Height = 254
    Align = alClient
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 668
    ExplicitHeight = 245
    object Label1: TLabel
      Left = 10
      Top = 54
      Width = 83
      Height = 17
      Caption = 'Product Code'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 289
      Top = 113
      Width = 50
      Height = 17
      Caption = 'Unit Size'
    end
    object Label4: TLabel
      Left = 10
      Top = 112
      Width = 87
      Height = 17
      Caption = 'Sell Price/unit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 10
      Top = 145
      Width = 51
      Height = 17
      Caption = 'Vat Rate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 10
      Top = 84
      Width = 71
      Height = 17
      Caption = 'Description'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 10
      Top = 25
      Width = 121
      Height = 17
      Caption = 'Associate Customer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtProduct: TEdit
      Left = 136
      Top = 49
      Width = 137
      Height = 25
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = CheckOK
      OnKeyPress = edtProductKeyPress
    end
    object btnLUProducts: TButton
      Left = 289
      Top = 49
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
    object edtDescription: TEdit
      Left = 136
      Top = 80
      Width = 471
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edtPackSize: TEdit
      Left = 352
      Top = 109
      Width = 81
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object memSellPrice: TMemo
      Left = 136
      Top = 109
      Width = 81
      Height = 21
      Alignment = taRightJustify
      TabOrder = 4
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateMoney
    end
    object Button1: TButton
      Left = 286
      Top = 140
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object edtCustomerName: TEdit
      Left = 136
      Top = 20
      Width = 471
      Height = 25
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 6
    end
    object Button2: TButton
      Left = 622
      Top = 20
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = Button2Click
    end
    object grpbxInvoiced: TGroupBox
      Left = 340
      Top = 162
      Width = 307
      Height = 71
      TabOrder = 8
      object lblInvoiceNumber: TLabel
        Left = 40
        Top = 24
        Width = 102
        Height = 17
        Caption = 'lblInvoiceNumber'
      end
    end
    object chkbxInvoiced: TCheckBox
      Left = 347
      Top = 152
      Width = 97
      Height = 17
      Caption = 'Invoiced'
      TabOrder = 9
    end
    object dblkpVat: TDBLookupComboBox
      Left = 136
      Top = 141
      Width = 145
      Height = 25
      KeyField = 'Vat'
      ListField = 'Description'
      ListSource = dtmdlSalesOrder.dtsVAT
      TabOrder = 10
    end
  end
end
