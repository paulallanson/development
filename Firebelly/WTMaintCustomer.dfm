object frmWtMaintCustomer: TfrmWtMaintCustomer
  Left = 322
  Top = 35
  Caption = 'Customer details'
  ClientHeight = 542
  ClientWidth = 838
  Color = clBtnFace
  Constraints.MinHeight = 459
  Constraints.MinWidth = 850
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 481
    Width = 838
    Height = 42
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    object lblDelete: TLabel
      Left = 397
      Top = 14
      Width = 142
      Height = 13
      Caption = 'Delete the selected record ?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOK: TBitBtn
      Left = 576
      Top = 9
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 662
      Top = 9
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      NumGlyphs = 2
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object chkbxInactive: TCheckBox
      Left = 13
      Top = 13
      Width = 97
      Height = 17
      Caption = 'inactive account'
      TabOrder = 0
    end
    object NotesBitBtn: TBitBtn
      Left = 158
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Notes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = NotesBitBtnClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object pgDetails: TPageControl
    Left = 0
    Top = 0
    Width = 838
    Height = 481
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object tsGeneral: TTabSheet
      Caption = 'General'
      object pnlDetails: TPanel
        Left = 0
        Top = 0
        Width = 830
        Height = 453
        Align = alClient
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          830
          453)
        object Label1: TLabel
          Left = 8
          Top = 12
          Width = 31
          Height = 13
          Caption = 'Name'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 8
          Top = 43
          Width = 30
          Height = 13
          Caption = 'Street'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 8
          Top = 91
          Width = 28
          Height = 13
          Caption = 'Town'
        end
        object Label6: TLabel
          Left = 8
          Top = 115
          Width = 48
          Height = 13
          Caption = 'Postcode'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 8
          Top = 139
          Width = 37
          Height = 13
          Caption = 'County'
        end
        object Label7: TLabel
          Left = 8
          Top = 171
          Width = 34
          Height = 13
          Caption = 'Phone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 8
          Top = 196
          Width = 17
          Height = 13
          Caption = 'Fax'
        end
        object Label9: TLabel
          Left = 8
          Top = 219
          Width = 68
          Height = 13
          Caption = 'Web Address'
        end
        object Label10: TLabel
          Left = 384
          Top = 43
          Width = 78
          Height = 13
          Caption = 'Customer Type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDiscountRate: TLabel
          Left = 384
          Top = 91
          Width = 85
          Height = 13
          Caption = 'Discount Rate %'
          FocusControl = chkbxFactored
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 384
          Top = 115
          Width = 45
          Height = 13
          Caption = 'VAT Rate'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 384
          Top = 224
          Width = 66
          Height = 13
          Caption = 'Credit Status'
        end
        object Label13: TLabel
          Left = 384
          Top = 250
          Width = 58
          Height = 13
          Caption = 'Credit Limit'
        end
        object Label14: TLabel
          Left = 384
          Top = 196
          Width = 72
          Height = 13
          Caption = 'Account Code'
        end
        object SpeedButton1: TSpeedButton
          Left = 661
          Top = 38
          Width = 23
          Height = 22
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton1Click
        end
        object SpeedButton2: TSpeedButton
          Left = 661
          Top = 110
          Width = 23
          Height = 22
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton2Click
        end
        object Label15: TLabel
          Left = 384
          Top = 171
          Width = 84
          Height = 13
          Caption = 'Deposit Terms %'
        end
        object Label16: TLabel
          Left = 8
          Top = 276
          Width = 20
          Height = 13
          Caption = 'Rep'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton3: TSpeedButton
          Left = 266
          Top = 271
          Width = 23
          Height = 22
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton3Click
        end
        object Label17: TLabel
          Left = 8
          Top = 245
          Width = 71
          Height = 13
          Caption = 'Email Address'
        end
        object Label23: TLabel
          Left = 384
          Top = 310
          Width = 89
          Height = 13
          Caption = 'No. of Employees'
        end
        object Label18: TLabel
          Left = 384
          Top = 139
          Width = 75
          Height = 13
          Caption = 'Payment Terms'
        end
        object SpeedButton6: TSpeedButton
          Left = 713
          Top = 134
          Width = 23
          Height = 22
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton6Click
        end
        object Label30: TLabel
          Left = 384
          Top = 281
          Width = 66
          Height = 13
          Caption = 'Invoice Label'
        end
        object Label11: TLabel
          Left = 384
          Top = 12
          Width = 47
          Height = 13
          Caption = 'Category'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnClearGroup: TSpeedButton
          Left = 297
          Top = 271
          Width = 23
          Height = 22
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
          OnClick = btnClearGroupClick
        end
        object Label35: TLabel
          Left = 384
          Top = 67
          Width = 58
          Height = 13
          Caption = 'Importance'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object SpeedButton7: TSpeedButton
          Left = 661
          Top = 62
          Width = 23
          Height = 22
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = SpeedButton7Click
        end
        object Label36: TLabel
          Left = 384
          Top = 340
          Width = 108
          Height = 13
          Caption = 'End User Price Factor'
          FocusControl = chkbxFactored
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label37: TLabel
          Left = 680
          Top = 340
          Width = 28
          Height = 13
          Caption = 'Value'
        end
        object dblkpCustomerType: TDBLookupComboBox
          Left = 501
          Top = 39
          Width = 153
          Height = 21
          KeyField = 'Customer_Type'
          ListField = 'Description'
          TabOrder = 12
          OnClick = EnableOK
        end
        object dblkpVat: TDBLookupComboBox
          Left = 501
          Top = 111
          Width = 153
          Height = 21
          KeyField = 'Vat'
          ListField = 'Description'
          TabOrder = 15
          OnClick = EnableOK
        end
        object dblkpCreditStatus: TDBLookupComboBox
          Left = 501
          Top = 220
          Width = 145
          Height = 21
          KeyField = 'Credit_status'
          ListField = 'Credit_Status_description'
          TabOrder = 19
        end
        object chkbxOnline: TCheckBox
          Left = 384
          Top = 441
          Width = 153
          Height = 17
          Caption = 'Use online facilities'
          TabOrder = 27
          Visible = False
        end
        object dblkpRep: TDBLookupComboBox
          Left = 88
          Top = 272
          Width = 169
          Height = 21
          KeyField = 'Rep'
          ListField = 'Rep_Name'
          TabOrder = 10
          OnClick = EnableOK
        end
        object dblkpPaymentTerms: TDBLookupComboBox
          Left = 502
          Top = 135
          Width = 204
          Height = 21
          KeyField = 'Payment_Terms'
          ListField = 'Payment_Terms_description'
          TabOrder = 16
        end
        object cmbCustomerCategory: TComboBox
          Left = 501
          Top = 8
          Width = 153
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 11
          OnChange = cmbCustomerCategoryChange
          Items.Strings = (
            'Trade'
            'Retail'
            'Commercial')
        end
        object chkbxSpeculative: TCheckBox
          Left = 384
          Top = 369
          Width = 265
          Height = 17
          Caption = 'This is a speculative trade account'
          TabOrder = 24
        end
        object chkbxFactored: TCheckBox
          Left = 384
          Top = 393
          Width = 265
          Height = 17
          Caption = 'Invoices are factored'
          TabOrder = 25
        end
        object dblkpLevelofImportance: TDBLookupComboBox
          Left = 501
          Top = 63
          Width = 153
          Height = 21
          KeyField = 'Level_of_Importance'
          ListField = 'Importance_Description'
          ListSource = dtmdlCustomers.dtsLeveloFImportance
          TabOrder = 13
          OnClick = EnableOK
        end
        object chkbxShowLabourCharges: TCheckBox
          Left = 384
          Top = 417
          Width = 265
          Height = 17
          Caption = 'Customer deducts CIS'
          TabOrder = 26
        end
        object edtCustomerName: TEdit
          Left = 88
          Top = 8
          Width = 233
          Height = 21
          TabOrder = 0
          Text = 'edtCustomerName'
          OnChange = EnableOK
        end
        object edtStreet: TEdit
          Left = 88
          Top = 39
          Width = 233
          Height = 21
          TabOrder = 1
          Text = 'edtStreet'
          OnChange = EnableOK
        end
        object edtLocale: TEdit
          Left = 88
          Top = 63
          Width = 233
          Height = 21
          TabOrder = 2
          Text = 'edtLocale'
        end
        object edtTownCity: TEdit
          Left = 88
          Top = 87
          Width = 233
          Height = 21
          TabOrder = 3
          Text = 'edtTownCity'
        end
        object edtPostcode: TEdit
          Left = 88
          Top = 111
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 4
          Text = 'EDTPOSTCODE'
          OnChange = EnableOK
        end
        object edtCountyState: TEdit
          Left = 88
          Top = 135
          Width = 233
          Height = 21
          TabOrder = 5
          Text = 'edtCountyState'
        end
        object edtTelephoneNumber: TEdit
          Left = 88
          Top = 167
          Width = 169
          Height = 21
          TabOrder = 6
          Text = 'edtTelephoneNumber'
          OnChange = EnableOK
        end
        object edtFaxNumber: TEdit
          Left = 88
          Top = 192
          Width = 169
          Height = 21
          TabOrder = 7
          Text = 'edtFaxNumber'
        end
        object edtEmailAddress: TEdit
          Left = 88
          Top = 241
          Width = 265
          Height = 21
          TabOrder = 9
          Text = 'edtEmailAddress'
        end
        object edtWebAddress: TEdit
          Left = 88
          Top = 216
          Width = 265
          Height = 21
          TabOrder = 8
          Text = 'edtWebAddress'
        end
        object edtDiscountRate: TCREditFloat
          Left = 501
          Top = 87
          Width = 73
          Height = 21
          TabOrder = 14
          Text = 'edtDiscountRate'
          OnChange = EnableOK
        end
        object edtDepositTerms: TCREditFloat
          Left = 501
          Top = 167
          Width = 81
          Height = 21
          TabOrder = 17
          Text = 'edtDepositTerms'
        end
        object edtAccountCode: TEdit
          Left = 501
          Top = 192
          Width = 81
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 18
          Text = 'EDTACCOUNTCODE'
          OnChange = edtAccountCodeChange
          OnEnter = edtAccountCodeEnter
          OnExit = edtAccountCodeExit
        end
        object edtCreditLimit: TCREditMoney
          Left = 501
          Top = 246
          Width = 81
          Height = 21
          TabOrder = 20
          Text = 'edtCreditLimit'
        end
        object edtInvoiceLabel: TEdit
          Left = 501
          Top = 277
          Width = 228
          Height = 21
          TabOrder = 21
          Text = 'edtInvoiceLabel'
        end
        object edtNoOfEmployees: TCREditInt
          Left = 501
          Top = 306
          Width = 46
          Height = 21
          TabOrder = 22
          Text = 'edtNoOfEmployees'
        end
        object edtEndUserMarkup: TCREditFloat
          Left = 717
          Top = 336
          Width = 84
          Height = 21
          TabOrder = 23
          Text = 'edtEndUserMarkup'
        end
        object dbgAccountCodes: TDBGrid
          Tag = 200
          Left = 383
          Top = 213
          Width = 357
          Height = 111
          TabStop = False
          Anchors = [akLeft, akTop, akRight]
          DataSource = dtsGetAccountCodes
          TabOrder = 28
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Visible = False
          Columns = <
            item
              Expanded = False
              FieldName = 'Account_Code'
              Title.Caption = 'Account Code'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Customer_Name'
              Title.Caption = 'Customer'
              Width = 261
              Visible = True
            end>
        end
        object cmbbxEndUserPriceFactor: TComboBox
          Left = 501
          Top = 336
          Width = 145
          Height = 21
          Style = csDropDownList
          TabOrder = 29
          Items.Strings = (
            'None'
            'End User Markup'
            'Retail Multiplier')
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Contract Details'
      ImageIndex = 8
      object Panel14: TPanel
        Left = 0
        Top = 0
        Width = 272
        Height = 453
        Align = alLeft
        ParentBackground = False
        TabOrder = 0
        object Label31: TLabel
          Left = 24
          Top = 67
          Width = 102
          Height = 13
          Caption = 'Cut Out Discount %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label32: TLabel
          Left = 24
          Top = 99
          Width = 87
          Height = 13
          Caption = 'Edge Discount %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblTemplatingDiscount: TLabel
          Left = 24
          Top = 193
          Width = 84
          Height = 13
          Caption = 'Templating Price'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblFittingDiscount: TLabel
          Left = 24
          Top = 227
          Width = 61
          Height = 13
          Caption = 'Fitting Price'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 24
          Top = 259
          Width = 67
          Height = 13
          Caption = 'Delivery Price'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 24
          Top = 131
          Width = 107
          Height = 13
          Caption = 'Worktop Discount %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label38: TLabel
          Left = 24
          Top = 355
          Width = 48
          Height = 13
          Caption = 'Unit Cost'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Panel16: TPanel
          Left = 1
          Top = 1
          Width = 270
          Height = 40
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvNone
          Caption = 'Discounts'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 6
        end
        object chkbxUseforGeneralQuoting: TCheckBox
          Left = 24
          Top = 305
          Width = 153
          Height = 17
          Caption = 'Use for General Quoting'
          TabOrder = 7
        end
        object edtCutoutDiscount: TCREditFloat
          Left = 140
          Top = 63
          Width = 73
          Height = 21
          TabOrder = 0
          Text = 'edtCutoutDiscount'
        end
        object edtEdgeDiscount: TCREditFloat
          Left = 140
          Top = 95
          Width = 73
          Height = 21
          TabOrder = 1
          Text = 'edtEdgeDiscount'
        end
        object edtWorktopDiscount: TCREditFloat
          Left = 140
          Top = 127
          Width = 73
          Height = 21
          TabOrder = 2
          Text = 'edtWorktopDiscount'
        end
        object edtSurveyPrice: TCREditMoney
          Left = 140
          Top = 189
          Width = 73
          Height = 21
          TabOrder = 3
          Text = 'edtSurveyPrice'
        end
        object edtInstallationPrice: TCREditMoney
          Left = 140
          Top = 223
          Width = 73
          Height = 21
          TabOrder = 4
          Text = 'edtInstallationPrice'
        end
        object edtDeliveryPrice: TCREditMoney
          Left = 140
          Top = 255
          Width = 73
          Height = 21
          TabOrder = 5
          Text = 'edtDeliveryPrice'
        end
        object edtUnitCost: TCREditMoney
          Left = 140
          Top = 351
          Width = 73
          Height = 21
          TabOrder = 8
          Text = 'edtDeliveryPrice'
        end
      end
      object Panel13: TPanel
        Left = 272
        Top = 0
        Width = 558
        Height = 453
        Align = alClient
        Caption = 'Panel13'
        ParentBackground = False
        TabOrder = 1
        object Panel15: TPanel
          Left = 1
          Top = 1
          Width = 556
          Height = 41
          Align = alTop
          Caption = 'Material Types'
          ParentBackground = False
          TabOrder = 0
        end
        object pnlMaterialTypeFunctions: TPanel
          Left = 465
          Top = 42
          Width = 92
          Height = 369
          Align = alRight
          ParentBackground = False
          TabOrder = 1
          object btnMTAdd: TBitBtn
            Left = 10
            Top = 8
            Width = 75
            Height = 25
            Caption = '&Add'
            TabOrder = 0
            OnClick = btnMTAddClick
          end
          object btnMTChange: TBitBtn
            Left = 10
            Top = 40
            Width = 75
            Height = 25
            Caption = '&Change'
            TabOrder = 1
            OnClick = btnMTChangeClick
          end
          object btnMTDelete: TBitBtn
            Left = 10
            Top = 72
            Width = 75
            Height = 25
            Caption = '&Delete'
            TabOrder = 2
            OnClick = btnMTDeleteClick
          end
        end
        object dbgMaterialTypes: TDBGrid
          Left = 1
          Top = 42
          Width = 464
          Height = 369
          Align = alClient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDrawColumnCell = dbgMaterialTypesDrawColumnCell
          OnDblClick = dbgMaterialTypesDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Description'
              Title.Caption = 'Material Type'
              Width = 179
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Retail_Multiplier'
              Title.Caption = 'Retail Multiplier'
              Width = 94
              Visible = True
            end>
        end
        object pnlMaterialTypeFooter: TPanel
          Left = 1
          Top = 411
          Width = 556
          Height = 41
          Align = alBottom
          ParentBackground = False
          TabOrder = 3
          object chkbxShowInactiveMaterialTypes: TCheckBox
            Left = 8
            Top = 8
            Width = 177
            Height = 17
            Caption = 'Show inactive Material Types'
            TabOrder = 0
            OnClick = chkbxShowInactiveMaterialTypesClick
          end
        end
      end
    end
    object tsShowrooms: TTabSheet
      Caption = 'Sites'
      ImageIndex = 1
      object dbgBranches: TDBGrid
        Left = 0
        Top = 0
        Width = 313
        Height = 453
        Align = alLeft
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbgBranchesDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Branch_Name'
            Title.Caption = 'Sites/Showrooms'
            Width = 237
            Visible = True
          end>
      end
      object btnAdd: TBitBtn
        Left = 336
        Top = 9
        Width = 75
        Height = 25
        Caption = '&Add'
        TabOrder = 1
        OnClick = btnAddClick
      end
      object btnChange: TBitBtn
        Left = 336
        Top = 49
        Width = 75
        Height = 25
        Caption = '&Change'
        Enabled = False
        TabOrder = 2
        OnClick = btnChangeClick
      end
      object btnDelete: TBitBtn
        Left = 336
        Top = 89
        Width = 75
        Height = 25
        Caption = '&Delete'
        Enabled = False
        TabOrder = 3
        OnClick = btnDeleteClick
      end
    end
    object tbsQuotes: TTabSheet
      Caption = 'Quotes'
      ImageIndex = 2
      object Panel2: TPanel
        Left = 745
        Top = 0
        Width = 85
        Height = 417
        Align = alRight
        ParentBackground = False
        TabOrder = 0
        ExplicitLeft = 739
        ExplicitHeight = 408
        object btnChangeQ: TBitBtn
          Left = 4
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Change'
          TabOrder = 1
          OnClick = btnChangeQClick
        end
        object btnDeleteQ: TBitBtn
          Left = 4
          Top = 104
          Width = 75
          Height = 25
          Caption = '&Delete'
          TabOrder = 3
          OnClick = btnDeleteQClick
        end
        object btnAddQ: TBitBtn
          Left = 4
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          TabOrder = 0
          OnClick = btnAddQClick
        end
        object btnPrintQ: TBitBtn
          Left = 4
          Top = 136
          Width = 75
          Height = 25
          Caption = '&Print'
          TabOrder = 4
          OnClick = btnPrintQClick
        end
        object btnCopyQ: TBitBtn
          Left = 4
          Top = 72
          Width = 75
          Height = 25
          Caption = 'C&opy'
          TabOrder = 2
          OnClick = btnCopyQClick
        end
        object BitBtn1: TBitBtn
          Left = 4
          Top = 168
          Width = 75
          Height = 25
          Caption = 'Con&vert'
          TabOrder = 5
          OnClick = BitBtn1Click
        end
      end
      object dbgQuotes: TDBGrid
        Left = 0
        Top = 0
        Width = 745
        Height = 417
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbgQuotesDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Quote'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Raised'
            Title.Caption = 'Date'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Description'
            Width = 219
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Reference'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Material_Description'
            Title.Caption = 'Material'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Operator_Name'
            Title.Caption = 'Operator'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Status_Description'
            Title.Caption = 'Status'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Gross_Price'
            Title.Caption = 'Gross Price'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Installation_Price'
            Title.Caption = 'Installation Price'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Survey_Price'
            Title.Caption = 'Survey Price'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Delivery_Price'
            Title.Caption = 'Delivery Price'
            Width = 88
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 0
        Top = 417
        Width = 830
        Height = 36
        Align = alBottom
        ParentBackground = False
        TabOrder = 2
        ExplicitTop = 408
        ExplicitWidth = 824
        object Label19: TLabel
          Left = 8
          Top = 12
          Width = 34
          Height = 13
          Caption = 'Search'
        end
        object edtQuoteDesc: TEdit
          Left = 72
          Top = 8
          Width = 233
          Height = 21
          TabOrder = 0
          OnChange = edtQuoteDescChange
        end
      end
    end
    object tbsSOrders: TTabSheet
      Caption = 'Sales Orders'
      ImageIndex = 3
      OnShow = tbsSOrdersShow
      object dbgSOrders: TDBGrid
        Left = 0
        Top = 0
        Width = 745
        Height = 417
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbgSOrdersDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Sales_Order'
            Title.Caption = 'Sales Order'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Raised'
            Title.Caption = 'Date'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Reference'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Required'
            Title.Caption = 'Required'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Order_Ref_No'
            Title.Caption = 'Customer Order No'
            Width = 131
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Goods_Value'
            Title.Caption = 'Order Value'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VAT_Value'
            Title.Caption = 'VAT'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_Value'
            Title.Caption = 'Total'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sales_Order_Status_Desc'
            Title.Caption = 'Status'
            Width = 101
            Visible = True
          end>
      end
      object Panel5: TPanel
        Left = 745
        Top = 0
        Width = 85
        Height = 417
        Align = alRight
        ParentBackground = False
        TabOrder = 1
        ExplicitLeft = 739
        ExplicitHeight = 408
        object btnChangeSO: TBitBtn
          Left = 4
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Change'
          TabOrder = 0
          OnClick = btnChangeSOClick
        end
        object btnDeleteSO: TBitBtn
          Left = 4
          Top = 72
          Width = 75
          Height = 25
          Caption = '&Delete'
          TabOrder = 1
          OnClick = btnDeleteSOClick
        end
        object btnAddSO: TBitBtn
          Left = 4
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          TabOrder = 2
          OnClick = btnAddSOClick
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 417
        Width = 830
        Height = 36
        Align = alBottom
        ParentBackground = False
        TabOrder = 2
        ExplicitTop = 408
        ExplicitWidth = 824
        object Label20: TLabel
          Left = 8
          Top = 12
          Width = 34
          Height = 13
          Caption = 'Search'
        end
        object edtSOrderDesc: TEdit
          Left = 72
          Top = 8
          Width = 233
          Height = 21
          TabOrder = 0
          OnChange = edtSOrderDescChange
        end
      end
    end
    object tbsJobs: TTabSheet
      Caption = 'Jobs'
      ImageIndex = 4
      OnShow = tbsJobsShow
      object Panel7: TPanel
        Left = 745
        Top = 0
        Width = 85
        Height = 417
        Align = alRight
        ParentBackground = False
        TabOrder = 0
        ExplicitLeft = 739
        ExplicitHeight = 408
        object btnChangeJob: TBitBtn
          Left = 4
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Change'
          TabOrder = 0
          OnClick = btnChangeJobClick
        end
        object btnDeleteJob: TBitBtn
          Left = 4
          Top = 72
          Width = 75
          Height = 25
          Caption = '&Delete'
          TabOrder = 1
          OnClick = btnDeleteJobClick
        end
        object btnAddJob: TBitBtn
          Left = 4
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          TabOrder = 2
          OnClick = btnAddJobClick
        end
      end
      object Panel8: TPanel
        Left = 0
        Top = 417
        Width = 830
        Height = 36
        Align = alBottom
        ParentBackground = False
        TabOrder = 1
        ExplicitTop = 408
        ExplicitWidth = 824
        object Label21: TLabel
          Left = 8
          Top = 12
          Width = 34
          Height = 13
          Caption = 'Search'
        end
        object edtJobDesc: TEdit
          Left = 72
          Top = 8
          Width = 233
          Height = 21
          TabOrder = 0
          OnChange = edtJobDescChange
        end
      end
      object dbgJobs: TDBGrid
        Left = 0
        Top = 0
        Width = 745
        Height = 417
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbgJobsDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Job'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Raised'
            Title.Caption = 'Date'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Description'
            Width = 219
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Reference'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Material_Description'
            Title.Caption = 'Material'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Operator_Name'
            Title.Caption = 'Operator'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Status_Description'
            Title.Caption = 'Status'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Gross_Price'
            Title.Caption = 'Gross Price'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Installation_Price'
            Title.Caption = 'Installation Price'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Survey_Price'
            Title.Caption = 'Survey Price'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Delivery_Price'
            Title.Caption = 'Delivery Price'
            Width = 88
            Visible = True
          end>
      end
    end
    object tbsInvoices: TTabSheet
      Caption = 'Invoices'
      ImageIndex = 5
      OnShow = tbsInvoicesShow
      object dbgInvoices: TDBGrid
        Left = 0
        Top = 0
        Width = 745
        Height = 417
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbgInvoicesDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Invoice_no'
            Title.Caption = 'Invoice No'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Invoice_Date'
            Title.Caption = 'Date'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Description'
            Width = 248
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Reference'
            Title.Caption = 'Order No'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Goods_Value'
            Title.Caption = 'Goods'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VAT_Value'
            Title.Caption = 'VAT'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_Value'
            Title.Caption = 'Total'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Status_Description'
            Title.Caption = 'Status'
            Width = 139
            Visible = True
          end>
      end
      object Panel9: TPanel
        Left = 745
        Top = 0
        Width = 85
        Height = 417
        Align = alRight
        ParentBackground = False
        TabOrder = 1
        ExplicitLeft = 739
        ExplicitHeight = 408
        object btnPrintInv: TBitBtn
          Left = 4
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Print'
          TabOrder = 0
          OnClick = btnPrintInvClick
        end
        object btnViewInv: TBitBtn
          Left = 4
          Top = 8
          Width = 75
          Height = 25
          Caption = '&View'
          TabOrder = 1
          OnClick = btnViewInvClick
        end
      end
      object Panel10: TPanel
        Left = 0
        Top = 417
        Width = 830
        Height = 36
        Align = alBottom
        ParentBackground = False
        TabOrder = 2
        ExplicitTop = 408
        ExplicitWidth = 824
        object Label22: TLabel
          Left = 8
          Top = 12
          Width = 34
          Height = 13
          Caption = 'Search'
        end
        object edtInvoiceDesc: TEdit
          Left = 72
          Top = 8
          Width = 233
          Height = 21
          TabOrder = 0
          OnChange = edtInvoiceDescChange
        end
      end
    end
    object tbsActivity: TTabSheet
      Caption = 'Activity'
      ImageIndex = 6
      object Panel3: TPanel
        Left = 737
        Top = 0
        Width = 93
        Height = 320
        Align = alRight
        ParentBackground = False
        TabOrder = 0
        ExplicitLeft = 731
        ExplicitHeight = 311
        object btnChangeEv: TBitBtn
          Left = 9
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Change'
          TabOrder = 0
          OnClick = btnChangeEvClick
        end
        object btnDeleteEv: TBitBtn
          Left = 9
          Top = 72
          Width = 75
          Height = 25
          Caption = '&Delete'
          TabOrder = 1
          OnClick = btnDeleteEvClick
        end
        object btnAddEv: TBitBtn
          Left = 9
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          TabOrder = 2
          OnClick = btnAddEvClick
        end
      end
      object dbgEvents: TDBGrid
        Left = 0
        Top = 0
        Width = 737
        Height = 320
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = dbgEventsDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Date_Time_Entered'
            Title.Caption = 'Date'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Contact_Name'
            Title.Caption = 'Contact'
            Width = 146
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Prospect_Action_Description'
            Title.Caption = 'Action'
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Event_Title'
            Title.Caption = 'Description'
            Width = 254
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Operator_name'
            Title.Caption = 'Operator'
            Width = 105
            Visible = True
          end>
      end
      object TPanel
        Left = 0
        Top = 320
        Width = 830
        Height = 133
        Align = alBottom
        TabOrder = 2
        ExplicitTop = 311
        ExplicitWidth = 824
        object Label28: TLabel
          Left = 291
          Top = 29
          Width = 32
          Height = 13
          Caption = 'Status'
        end
        object Label29: TLabel
          Left = 8
          Top = 8
          Width = 36
          Height = 13
          Caption = 'Phone:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object DBText2: TDBText
          Left = 56
          Top = 8
          Width = 40
          Height = 13
          AutoSize = True
          DataField = 'Telephone_Number'
          DataSource = dtsOneCustomer
        end
        object GroupBox1: TGroupBox
          Left = 4
          Top = 48
          Width = 645
          Height = 81
          Caption = 'Next Action'
          ParentBackground = False
          TabOrder = 0
          object Label24: TLabel
            Left = 8
            Top = 24
            Width = 33
            Height = 13
            Caption = 'Action'
          end
          object Label25: TLabel
            Left = 288
            Top = 24
            Width = 24
            Height = 13
            Caption = 'Date'
          end
          object Label26: TLabel
            Left = 8
            Top = 53
            Width = 47
            Height = 13
            Caption = 'To whom'
          end
          object Label27: TLabel
            Left = 288
            Top = 53
            Width = 46
            Height = 13
            Caption = 'By whom'
          end
          object SpeedButton4: TSpeedButton
            Left = 234
            Top = 19
            Width = 23
            Height = 22
            Caption = '...'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = SpeedButton4Click
          end
          object SpeedButton5: TSpeedButton
            Left = 234
            Top = 48
            Width = 23
            Height = 22
            Caption = '...'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            OnClick = SpeedButton5Click
          end
          object dblkpProspectAction: TDBLookupComboBox
            Left = 64
            Top = 20
            Width = 160
            Height = 21
            KeyField = 'Prospect_Action'
            ListField = 'Prospect_Action_Description'
            TabOrder = 0
          end
          object dblkpProspectContact: TDBLookupComboBox
            Left = 64
            Top = 49
            Width = 160
            Height = 21
            KeyField = 'Contact_no'
            ListField = 'Contact_Name'
            TabOrder = 1
          end
          object dblkpProspectOperator: TDBLookupComboBox
            Left = 344
            Top = 49
            Width = 169
            Height = 21
            KeyField = 'Operator'
            ListField = 'Operator_Name'
            TabOrder = 2
          end
          object edtActionDate: TEdit
            Left = 344
            Top = 20
            Width = 97
            Height = 21
            TabOrder = 3
            OnExit = edtActionDateExit
          end
          object btnActionDate: TBitBtn
            Left = 448
            Top = 18
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
            TabOrder = 4
            OnClick = btnActionDateClick
          end
          object BitBtn3: TBitBtn
            Left = 561
            Top = 48
            Width = 75
            Height = 25
            Caption = '&Appt'
            TabOrder = 5
            OnClick = BitBtn3Click
          end
        end
        object chkbxProspect: TCheckBox
          Left = 8
          Top = 27
          Width = 73
          Height = 17
          Caption = 'Prospect'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dblkpProspectStatus: TDBLookupComboBox
          Left = 349
          Top = 25
          Width = 164
          Height = 21
          KeyField = 'Prospect_status'
          ListField = 'Prospect_Status_descr'
          TabOrder = 2
        end
      end
    end
    object tbsDocuments: TTabSheet
      Caption = 'Documents'
      ImageIndex = 7
      object Panel11: TPanel
        Left = 0
        Top = 17
        Width = 830
        Height = 436
        Align = alClient
        Caption = 'Panel11'
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 824
        ExplicitHeight = 427
        object lstvwDocuments: TListView
          Left = 1
          Top = 1
          Width = 799
          Height = 434
          Align = alClient
          Columns = <
            item
              Caption = 'Name'
              Width = 200
            end
            item
              Caption = 'Type'
              Width = 200
            end
            item
              Caption = 'Date modified'
              Width = 200
            end>
          LargeImages = imgDocuments
          RowSelect = True
          PopupMenu = pmnuDocuments
          SmallImages = imgDocuments
          TabOrder = 0
          OnColumnClick = lstvwDocumentsColumnClick
          OnCompare = lstvwDocumentsCompare
          OnDblClick = lstvwDocumentsDblClick
        end
        object ToolBar1: TToolBar
          Left = 800
          Top = 1
          Width = 29
          Height = 434
          Align = alRight
          ButtonHeight = 30
          ButtonWidth = 30
          Caption = 'ToolBar1'
          HotImages = imgIcons
          Images = imgIcons
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          object btnExcel: TToolButton
            Left = 0
            Top = 0
            Hint = 'Excel'
            Caption = 'btnExcel'
            ImageIndex = 0
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = btnWordClick
          end
          object btnWord: TToolButton
            Left = 0
            Top = 30
            Hint = 'Word'
            Caption = 'btnWord'
            ImageIndex = 1
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = btnWordClick
          end
          object btnEmail: TToolButton
            Left = 0
            Top = 60
            Hint = 'Email'
            Caption = 'btnEmail'
            ImageIndex = 2
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = btnEmailClick
          end
          object btnAttach: TToolButton
            Left = 0
            Top = 90
            Hint = 'Attach Documents'
            Caption = 'btnAttach'
            ImageIndex = 3
            ParentShowHint = False
            ShowHint = True
            OnClick = btnAttachClick
          end
        end
      end
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 830
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        ExplicitWidth = 824
        object Label44: TLabel
          Left = 2
          Top = 4
          Width = 58
          Height = 13
          Caption = 'Documents'
        end
      end
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 523
    Width = 838
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object dtsOneCustomer: TDataSource
    DataSet = qryOneCustomer
    Left = 408
    Top = 168
  end
  object qryCompany: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from company')
    Left = 480
    Top = 168
  end
  object tmrDetails: TTimer
    Interval = 500
    OnTimer = tmrDetailsTimer
    Left = 316
    Top = 432
  end
  object imgDocuments: TImageList
    Left = 240
    Top = 444
  end
  object imgIcons: TImageList
    Left = 176
    Top = 428
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      00007F7F7F007F7F7F007F7F7F0000FFFF0000FFFF007F7F7F007F7F7F007F7F
      7F007F7F7F0000FFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FF
      FF0000FFFF00000000000000000000000000000000000000000000000000FFFF
      FF00BFBFBF00BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00F5F5F500F2F2
      F200EEEEEE00EEEEEE00E7E7E700E7E7E700E7E7E700E8E8E800EEEEEE00EEEE
      EE00F5F5F500F9F9F900FDFDFD000000000000000000FDFDFD001C1C1C000312
      0700031206000311060003110500041104000410030004100200040F0200050F
      01000308010090909000000000000000000000000000FDFDFD001C1C1C00120E
      0000110D0100110D0100110D0100110D0200110C0200110C0200110C0300110B
      0300090602009090900000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ECECEC00DBDBDB00D1D1D100C9CB
      CE00B8B3A800BCBCBD00BEBEC000BDBDBD00BDBDBD00BDBDBD00BDBDBD00C7C7
      C700CBCBCB00D4D4D400E3E3E300FCFCFC0000000000031E0F001DD0630020CC
      5A0023C8510025C3480028BE3F002BBB36002DB72D0030B3240033AF1B0035AA
      130038A70B0037990200A7A7A70000000000000000001D170200C59E0100C39B
      0400C2980800C0950C00BF921000BD8E1300BC8B1700BB881C00B9852000B881
      2400B77E2800AA742900A7A7A700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F1ECE0009E79
      2400E2D7BD00AA8B4200B2945000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000014AF5E001BD36A00FAFC
      F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0086CB6E0038A70B001E1E1E000000000000000000A5891800C8A20F00FDFB
      F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D3B17D00B77E28001E1E1E00000000000C0C0C000071B6000077BF000077
      BF000077BF000077BF000077BF000077BF000077BF000077BF000077BF000077
      BF000077BF000077BF0000355500D4D4D40000000000FEFDFC00AF904B000000
      00000000000000000000B5995900BCA369000000000000000000000000000000
      0000000000000000000000000000000000000000000012B567001BD36A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8FCF300E8FCF300FAFE
      FC00E3F4E10035AA13001C1C1C000000000000000000AA8F2600C9A41F00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F5EEE100B88124001C1C1C000000000000659A0000A7FF0000A7FF0000A7
      FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7
      FF0000A7FF0000A7FF0000A7FF002323230000000000A5803000000000000000
      0000000000000000000000000000B2924C00CBB5850000000000000000000000
      000000000000000000000000000000000000000000000FB96E0018D77400FFFF
      FF004EE8A50025E3910038E59A00FFFFFF0041E69E0013E1870025E39100FFFF
      FF00E2F6E40033AF1B001C1C1C000000000000000000AD933400CCA92C00FFFF
      FF00FFFFFF00DCC46500E7D89800F4EDD100DCC46500FEFEFD00FFFFFF00FFFF
      FF00F6EFDF00B98520001C1C1C0000000000006A9F0000ACFB0000AFFF0000AF
      FF0000AFFF0000AFFF0000AFFF000077CE000096EA0000AFFF0000AFFF0000AF
      FF0000AFFF0000AFFF0000A6FA002020200000000000B28D3E00000000000000
      000000000000C7AE7900AC863500D0BA8C00B18E4200D8C7A100000000000000
      000000000000000000000000000000000000000000000EBC760015DC7E00FFFF
      FF00FFFFFF0018E18A0013DF850042E4990015DD800014DF8400FEFFFE00FFFF
      FF00E1F7E70030B324001C1C1C000000000000000000AF974200CFAE3A00FFFF
      FF00FFFFFF00D9BF5F00D9BF5F00F3EBCF00D9BF5F00E0CA7C00FFFFFF00FFFF
      FF00F6F0DE00BB881C001C1C1C0000000000006E9F0000B0FF0000B4F90000B8
      FF0000B8FF0000B8FF00009BCD0000EBFF0000EDFD00008FE00000B8FF0000B8
      FF0000B8FF0000A6F40000B0FF002020200000000000F2EAD900AF8737000000
      0000F5EFE300DECFAE0000000000B8944A00D8C49D00B28B3C00E4D7BB000000
      000000000000000000000000000000000000000000000CBF7D0013E18900FFFF
      FF00FFFFFF00FEFEFE0016DC7D0017D9770018D87400E5FBF000FFFFFF00FFFF
      FF00E1F8E9002DB72D001C1C1C000000000000000000B29B5000D2B44700FFFF
      FF00FFFFFF00D3B45700D3B45700D3B45800D3B45700D3B45700FEFEFD00FFFF
      FF00F7F1DD00BC8B17001C1C1C000000000000729F0000B7FF0000B7FF0000BC
      F80000C0FF00008CC40000E2FF0000E2FF0000E2FF0000E3FE0000ACF20000C0
      FF0000A5EA0000B7FF0000B7FF00202020000000000000000000E8D9B800B893
      4700F9F6F000B58E3E000000000000000000B8924400E3D5B700B68F3E00EDE4
      D10000000000000000000000000000000000000000000AC2840010E69300FFFF
      FF00FFFFFF00FFFFFF0021CA55001CD267001FCE5E00E7F9EC00FFFFFF00FFFF
      FF00E0F9EC002BBB36001C1C1C000000000000000000B49F5E00D6B95800FFFF
      FF00FFFFFF00CBA34B00E0C99600CBA34B00CBA34B00D4B36C00D4B36C00FFFF
      FF00F7F3DF00BD8E13001C1C1C000000000000779F0000BEFF0000BEFF0000BE
      FE000086BE0000D9FF0000D9FF0000D9FF0000D9FF0000D9FF0000D8FC00009A
      DA0000BEFF0000BEFF0000BEFF0020202000000000000000000000000000E4D1
      A700C19E5700EBDDBD00BD984C000000000000000000BB944300EDE2CE00BB94
      4300F5EFE2000000000000000000000000000000000007C68C000CEA9E00FFFF
      FF00FFFFFF0051C4540028BE3D0035C9590025C2470029BC3A00FDFEFD00FFFF
      FF00DFFAEF0028BE3F001C1C1C000000000000000000B7A46B00D9BF6B00FFFF
      FF00E7D4B700BE8C3C00F2E7D800BE8C3C00BE8C3C00EBDCC400BE8C3C00E4D0
      AF00F8F4E400BF9210001C1C1C0000000000007E9F0000CAFF0000CAFF000091
      CA0000D0FF0000D0FF0000D0FF0000D0FF0000D0FF0000D0FF0000D0FF0000CC
      FA0000CAFE0000CAFF0000CAFF00202020000000000000000000000000000000
      0000E2CC9C00CBAB6A00E8D6AF00C5A25C000000000000000000C0984800F4EE
      E100C09848000000000000000000000000000000000005C993000AEFA800FFFF
      FF00BCE0AA003EAF1F003AB52D00FFFFFF008FD88F003BB3280041AC1A00FFFF
      FF00DEFCF10025C348001C1C1C000000000000000000B9A97900DDC67E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F9F6E900C0950C001C1C1C000000000000849F0000D4FF0000ADDD0000C6
      FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6
      FF0000C0F80000D4FF0000D4FF00202020000000000000000000000000000000
      000000000000E3CA9400D6B87F00E7D3A500D0AE6D000000000000000000C69D
      4D00F8F3EA000000000000000000000000000000000003CC9A0006F4B300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDFDF40023C851001C1C1C000000000000000000BCAD8700E0CC9200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FAF7EE00C29808001C1C1C0000000000008B9F0000CAEE0000BDFF0000BD
      FF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BD
      FF0000BDFF0000BAF80000DFFF00202020000000000000000000000000000000
      00000000000000000000E2C68900DFC69600E7D09B00D8B87D00000000000000
      0000CCA15100FCF9F40000000000000000000000000002CE9E0004F8BC00C0FD
      ED00D3FDF200D4FCF100D4FCEF00D4FBEE00D4FBED00D5FAEC00D5FAEB00D5F9
      EA0048DE8C0020CC5A001C1C1C000000000000000000BDAE9000E4D1A400F7F3
      E600F9F6EC00F9F5EA00F9F4E800F8F4E600F8F3E400F7F3E200F7F2E000F7F1
      DE00D4B74600C39B04001C1C1C0000000000008C9A0000B7FF0000B7FF0000B7
      FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7
      FF0000B7FF0000B7FF0000BFFA00202020000000000000000000000000000000
      0000000000000000000000000000E3C38200E8D3AC00FCF8ED00000000000000
      000000000000D1A656000000000000000000000000001E6E160001FCC50004F8
      BC0006F4B30009F0AA000CECA1000EE8980011E48F0013E0860015DC7D0018D8
      74001BD46C001AD56F0044444400000000000000000076572D00E7D6B500E4D1
      A400E1CC9300DEC78300DAC17200D7BC6100D4B75100D1B24000CEAD2F00CBA8
      1F00C8A30F00C8A2230044444400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000202020000000000000000000000000000000
      000000000000000000000000000000000000E1BF7900EFDEC100000000000000
      000000000000EDD7B000FDFAF50000000000000000005C5C5C00278012002CB1
      2F0025B844001EBF590018C66E0012CD830014CA79001BC2640022BC4F0028B5
      3A002FAC2300091E0300FEFEFE0000000000000000005C5C5C0090693500C396
      5400CA9F6100CFA96E00D4B37B00D9BD8800D7B98200D1AE7400CBA36500C498
      5700BD8B470022180A00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4BE7500F5E9D4000000
      000000000000DAAD5C0000000000000000000000000000000000FDFDFD00D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700E0E0E0000000000000000000000000000000000000000000FDFDFD00D7D7
      D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7D700D7D7
      D700E0E0E0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E4BF7800DBAD
      5F00E4BD7400000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF7EE00FFC0000009001E00FFC000000
      C003E00F20000000E003E00F00000000E003E00F00000000E003E00F00000000
      E003E00F000000000001A00B000000008000C00700000000E007E00F00000000
      E00FE00FE0000000E00FC007F8000000E027C007F0000000C073C007E0010000
      9E79F83FC40300007EFEF83FEC070000FFFFFFFFFFFF800180038003FFFF0000
      80018001FFFFC1FF8001800100009CFF800180010000BE7F800180010000B83F
      800180010000921F800180010000C30F800180010000E187800180010000F0C7
      800180010000F867800180010000FC33800180010000FE3B800180010000FF39
      80018001FFFFFF9BC007C007FFFFFFC700000000000000000000000000000000
      000000000000}
  end
  object DocOpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofAllowMultiSelect, ofEnableSizing]
    Left = 640
    Top = 160
  end
  object svDlgOfficeDoc: TSaveDialog
    Left = 217
    Top = 86
  end
  object tmrNotes: TTimer
    Enabled = False
    OnTimer = tmrNotesTimer
    Left = 272
    Top = 368
  end
  object qryUpdNotesOnly: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Update Customer'
      'Set     Narrative = :Narrative'
      'Where'
      '(Customer = :Customer) ')
    Left = 568
    Top = 168
    ParamData = <
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
      end>
  end
  object pmnuDocuments: TPopupMenu
    OnPopup = pmnuDocumentsPopup
    Left = 734
    Top = 222
    object pmnuOpen: TMenuItem
      Caption = 'Open'
      OnClick = lstvwDocumentsDblClick
    end
    object pmnuPaste: TMenuItem
      Caption = 'Paste'
      OnClick = pmnuPasteClick
    end
    object pmnuDelete: TMenuItem
      Caption = 'Delete'
      OnClick = pmnuDeleteClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object pmnuSelectAll: TMenuItem
      Caption = 'Select All'
      OnClick = pmnuSelectAllClick
    end
  end
  object qryOneCustomer: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Customer'
      'WHERE Customer = :Customer')
    Left = 332
    Top = 168
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Customer'
      'SET'
      '      Customer_Name = :Customer_Name,'
      '      Street = :Street,'
      '      Locale = :Locale,'
      '      Town_City = :Town_City,'
      '      Postcode = :Postcode,'
      '      County_State = :County_State,'
      '      Telephone_Number = :Telephone_Number,'
      '      Fax_Number = :Fax_Number,'
      '      Web_Address = :Web_Address,'
      '      Email_Address = :Email_Address,'
      '      Rep = :Rep,'
      '      Is_retail_customer = :Is_Retail_Customer,'
      '      Is_commercial_customer = :Is_Commercial_Customer,'
      '      Customer_Type = :Customer_Type,'
      '      Level_of_Importance = :Level_Of_Importance,'
      '      Discount_Rate = :Discount_Rate,'
      '      Vat = :Vat,'
      '      Payment_Terms = :Payment_Terms,'
      '      Deposit_Terms = :Deposit_Terms,'
      '      Account_Code = :Account_Code,'
      '      Credit_Status = :Credit_Status,'
      '      Credit_Limit = :Credit_Limit,'
      '      Invoice_Label = :Invoice_Label,'
      '      No_of_Employees = :No_Of_Employees,'
      '      End_User_Markup_percentage = :End_User_Markup_percentage,'
      '      Not_Active = :Not_Active,'
      '      Use_Online_Ordering = :Use_Online_Ordering,'
      '      Use_For_General_Quoting = :Use_For_General_Quoting,'
      
        '      Separate_Labour_Invoice_Value = :Separate_Labour_Invoice_V' +
        'alue,'
      '      Account_Is_Factored = :Account_Is_Factored,'
      '      Customer_is_Speculative = :Customer_is_Speculative,'
      '      Prospect = :Prospect,'
      '      Prospect_Action_Next_Date = :Prospect_Action_Next_Date,'
      '      Narrative = :Narrative,'
      '      CutOut_Discount = :CutOut_Discount,'
      '      Edge_Discount = :Edge_Discount,'
      '      Worktop_Discount = :Worktop_Discount,'
      '      Survey_Price = :Survey_Price,'
      '      Installation_Price = :Installation_Price,'
      '      Delivery_Price = :Delivery_Price,'
      '      Prospect_Status = :Prospect_Status,'
      '      Prospect_Action = :Prospect_Action,'
      '      Contact_no = :Contact_no,'
      '      Prospect_Action_Operator = :Prospect_Action_Operator,'
      '      End_User_Price_Factor = :End_User_Price_Factor,'
      '      Unit_Cost = :Unit_Cost,'
      '      Requires_App_For_Payment = :Requires_App_For_Payment'
      'WHERE'
      '  Customer = :Customer')
    Left = 570
    Top = 380
    ParamData = <
      item
        Name = 'Customer_Name'
        DataType = ftString
      end
      item
        Name = 'Street'
        DataType = ftString
      end
      item
        Name = 'Locale'
        DataType = ftString
      end
      item
        Name = 'Town_City'
        DataType = ftString
      end
      item
        Name = 'Postcode'
        DataType = ftString
      end
      item
        Name = 'County_State'
        DataType = ftString
      end
      item
        Name = 'Telephone_Number'
        DataType = ftString
      end
      item
        Name = 'Fax_Number'
        DataType = ftString
      end
      item
        Name = 'Web_Address'
        DataType = ftString
      end
      item
        Name = 'Email_Address'
        DataType = ftString
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Is_Retail_Customer'
        DataType = ftString
      end
      item
        Name = 'Is_Commercial_Customer'
        DataType = ftString
      end
      item
        Name = 'Customer_Type'
        DataType = ftInteger
      end
      item
        Name = 'Level_Of_Importance'
        DataType = ftInteger
      end
      item
        Name = 'Discount_Rate'
      end
      item
        Name = 'Vat'
        DataType = ftInteger
      end
      item
        Name = 'Payment_Terms'
        DataType = ftInteger
      end
      item
        Name = 'Deposit_Terms'
      end
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Credit_Status'
        DataType = ftString
      end
      item
        Name = 'Credit_Limit'
      end
      item
        Name = 'Invoice_Label'
        DataType = ftString
      end
      item
        Name = 'No_Of_Employees'
      end
      item
        Name = 'End_User_Markup_percentage'
      end
      item
        Name = 'Not_Active'
      end
      item
        Name = 'Use_Online_Ordering'
      end
      item
        Name = 'Use_For_General_Quoting'
      end
      item
        Name = 'Separate_Labour_Invoice_Value'
      end
      item
        Name = 'Account_Is_Factored'
      end
      item
        Name = 'Customer_is_Speculative'
      end
      item
        Name = 'Prospect'
      end
      item
        Name = 'Prospect_Action_Next_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'CutOut_Discount'
      end
      item
        Name = 'Edge_Discount'
      end
      item
        Name = 'Worktop_Discount'
      end
      item
        Name = 'Survey_Price'
      end
      item
        Name = 'Installation_Price'
      end
      item
        Name = 'Delivery_Price'
      end
      item
        Name = 'Prospect_Status'
        DataType = ftInteger
      end
      item
        Name = 'Prospect_Action'
        DataType = ftInteger
      end
      item
        Name = 'Contact_no'
        DataType = ftInteger
      end
      item
        Name = 'Prospect_Action_Operator'
        DataType = ftInteger
      end
      item
        Name = 'End_User_Price_Factor'
      end
      item
        Name = 'Unit_Cost'
      end
      item
        DataType = ftUnknown
        Name = 'Requires_App_For_Payment'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Customer'
      '        (Customer, Customer_Type, Vat, Date_Created,'
      '        Customer_Name)'
      'Select Max(Customer)+1, 1, 2, now(), :GUID'
      'From Customer'
      ' ')
    Left = 648
    Top = 380
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Delete From Customer'
      'Where'
      '(Category = :Customer)')
    Left = 726
    Top = 380
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Customer'
      'From Customer'
      'Where Customer_Name = :GUID')
    Left = 568
    Top = 288
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    Left = 648
    Top = 288
  end
  object qryGetAccountCodes: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select  Customer.Account_Code,'
      '        Customer.Customer_Name'
      'From Customer'
      
        'Where Customer.Account_Code LIKE :Account_Code and :Account_Code' +
        ' <> '#39'%'#39' AND'
      '      Customer.Customer <> :Customer')
    Left = 332
    Top = 224
    ParamData = <
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Account_Code'
      end
      item
        Name = 'Customer'
      end>
  end
  object qryCheckCustAccExists: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Customer_Name'
      'From Customer'
      'Where (Customer.Customer <> :Customer) and'
      '      (Customer.Account_Code = :Account_Code)')
    Left = 328
    Top = 276
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Account_Code'
      end>
  end
  object dtsGetAccountCodes: TDataSource
    DataSet = qryGetAccountCodes
    Left = 408
    Top = 224
  end
end
