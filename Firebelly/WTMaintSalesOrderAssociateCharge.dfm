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
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
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
      Left = 328
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
      ExplicitLeft = 302
    end
    object btnOK: TBitBtn
      Left = 488
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
      ExplicitLeft = 482
    end
    object btnCancel: TBitBtn
      Left = 568
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
      ExplicitLeft = 562
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
    object Label1: TLabel
      Left = 10
      Top = 54
      Width = 75
      Height = 15
      Caption = 'Product Code'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 289
      Top = 113
      Width = 45
      Height = 15
      Caption = 'Unit Size'
    end
    object Label4: TLabel
      Left = 10
      Top = 112
      Width = 78
      Height = 15
      Caption = 'Sell Price/unit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 10
      Top = 145
      Width = 47
      Height = 15
      Caption = 'Vat Rate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 10
      Top = 84
      Width = 64
      Height = 15
      Caption = 'Description'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 10
      Top = 25
      Width = 109
      Height = 15
      Caption = 'Associate Customer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtProduct: TEdit
      Left = 136
      Top = 49
      Width = 137
      Height = 23
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
      Height = 23
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object edtPackSize: TEdit
      Left = 340
      Top = 109
      Width = 81
      Height = 23
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
      Height = 23
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
        Width = 95
        Height = 15
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
      Height = 23
      KeyField = 'Vat'
      ListField = 'Description'
      ListSource = dtmdlSalesOrder.dtsVAT
      TabOrder = 10
    end
  end
end
