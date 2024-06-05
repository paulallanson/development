object PBMaintCustFrm: TPBMaintCustFrm
  Left = 112
  Top = 0
  HorzScrollBar.Visible = False
  Caption = 'Maintain Customers'
  ClientHeight = 743
  ClientWidth = 1176
  Color = clBtnFace
  Constraints.MinHeight = 723
  Constraints.MinWidth = 970
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 13
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 724
    Width = 1176
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 250
      end>
  end
  object pnlBody: TPanel
    Left = 0
    Top = 0
    Width = 1176
    Height = 724
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object pgCustomer: TPageControl
      Left = 0
      Top = 41
      Width = 1176
      Height = 642
      ActivePage = tbDetails
      Align = alClient
      TabOrder = 0
      object tbDetails: TTabSheet
        Caption = 'Details'
        object lblCreatedOn: TLabel
          Left = 7
          Top = 572
          Width = 72
          Height = 13
          Caption = 'Account Code'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object pnlGeneralDetails: TPanel
          Left = 0
          Top = 0
          Width = 481
          Height = 614
          Align = alLeft
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            481
            614)
          object grpbxAnalysis: TGroupBox
            Left = 8
            Top = 314
            Width = 465
            Height = 290
            Anchors = [akLeft, akTop, akRight, akBottom]
            Caption = 'Analysis  '
            ParentBackground = False
            TabOrder = 2
            DesignSize = (
              465
              290)
            object Label1: TLabel
              Left = 9
              Top = 20
              Width = 78
              Height = 13
              Caption = 'Customer Type'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblRevenueCentre: TLabel
              Left = 8
              Top = 79
              Width = 81
              Height = 13
              Caption = 'Revenue Centre'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object lblStatus: TLabel
              Left = 9
              Top = 223
              Width = 32
              Height = 13
              Caption = 'Status'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label45: TLabel
              Left = 9
              Top = 49
              Width = 100
              Height = 13
              Caption = 'Level of Importance'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object lblAnalysis1: TLabel
              Left = 8
              Top = 108
              Width = 80
              Height = 13
              Caption = 'Analysis Code 1'
              Visible = False
            end
            object lblAnalysis2: TLabel
              Left = 8
              Top = 137
              Width = 80
              Height = 13
              Caption = 'Analysis Code 2'
              Visible = False
            end
            object lblAnalysis3: TLabel
              Left = 8
              Top = 166
              Width = 80
              Height = 13
              Caption = 'Analysis Code 3'
              Visible = False
            end
            object lblAnalysis4: TLabel
              Left = 8
              Top = 194
              Width = 80
              Height = 13
              Caption = 'Analysis Code 4'
              Visible = False
            end
            object TypeDBLUCB: TDBLookupComboBox
              Left = 125
              Top = 16
              Width = 260
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              KeyField = 'Customer_Type'
              ListField = 'Description'
              TabOrder = 0
              OnClick = TypeDBLUCBClick
            end
            object CustTypeMaintBitBtn: TBitBtn
              Left = 398
              Top = 15
              Width = 25
              Height = 23
              Hint = 'Customer Type maintenance'
              Anchors = [akTop, akRight]
              Caption = '...'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = CustTypeMaintBitBtnClick
            end
            object btnRevenueCentre: TBitBtn
              Left = 398
              Top = 74
              Width = 25
              Height = 23
              Hint = 'Customer Type maintenance'
              Anchors = [akTop, akRight]
              Caption = '...'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnClick = btnRevenueCentreClick
            end
            object dblkpRevenueCentre: TDBLookupComboBox
              Left = 125
              Top = 75
              Width = 260
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              KeyField = 'Invoice_Location'
              ListField = 'Invoice_location_Descr'
              TabOrder = 4
            end
            object dblkpCustStatus: TDBLookupComboBox
              Left = 125
              Top = 219
              Width = 300
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              KeyField = 'Customer_Status'
              ListField = 'Customer_Status_Descr'
              TabOrder = 11
              Visible = False
              OnClick = dblkpCustStatusClick
            end
            object dblkpLevelOfImportance: TDBLookupComboBox
              Left = 125
              Top = 45
              Width = 260
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              KeyField = 'Level_of_Importance'
              ListField = 'Importance_Description'
              TabOrder = 2
              OnClick = dblkpCustStatusClick
            end
            object btnRevenueCentreClear: TBitBtn
              Left = 431
              Top = 74
              Width = 25
              Height = 23
              Anchors = [akTop, akRight]
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
              TabOrder = 6
              OnClick = btnRevenueCentreClearClick
            end
            object btnLevelOfImportance: TBitBtn
              Left = 398
              Top = 44
              Width = 25
              Height = 23
              Hint = 'Customer Type maintenance'
              Anchors = [akTop, akRight]
              Caption = '...'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = btnLevelOfImportanceClick
            end
            object edtAnalysis1: TEdit
              Left = 125
              Top = 104
              Width = 297
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 7
              Text = 'edtAnalysis1'
              Visible = False
            end
            object edtAnalysis2: TEdit
              Left = 125
              Top = 133
              Width = 297
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 8
              Text = 'edtAnalysis2'
              Visible = False
            end
            object BitBtn7: TBitBtn
              Left = 431
              Top = 44
              Width = 25
              Height = 23
              Anchors = [akTop, akRight]
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
              TabOrder = 12
              OnClick = BitBtn7Click
            end
            object edtAnalysis3: TEdit
              Left = 125
              Top = 162
              Width = 297
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 9
              Text = 'edtAnalysis3'
              Visible = False
            end
            object edtAnalysis4: TEdit
              Left = 125
              Top = 190
              Width = 297
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 10
              Text = 'edtAnalysis4'
              Visible = False
            end
            object chkbxAcquiredCompany: TCheckBox
              Left = 8
              Top = 238
              Width = 177
              Height = 17
              Anchors = [akLeft, akBottom]
              Caption = 'This is a Reseller Customer'
              TabOrder = 13
            end
            object chkbxCTRLPCustomer: TCheckBox
              Left = 8
              Top = 262
              Width = 249
              Height = 17
              Anchors = [akLeft, akBottom]
              Caption = 'This is a CTRL-P Master Customer'
              TabOrder = 14
            end
          end
          object grpbxDetails: TGroupBox
            Left = 8
            Top = 2
            Width = 465
            Height = 271
            Anchors = [akLeft, akTop, akRight]
            ParentBackground = False
            TabOrder = 0
            DesignSize = (
              465
              271)
            object Label20: TLabel
              Left = 7
              Top = 20
              Width = 42
              Height = 13
              Caption = 'Address'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label21: TLabel
              Left = 7
              Top = 133
              Width = 48
              Height = 13
              Caption = 'Postcode'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label22: TLabel
              Left = 7
              Top = 186
              Width = 34
              Height = 13
              Caption = 'Phone'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label23: TLabel
              Left = 7
              Top = 214
              Width = 17
              Height = 13
              Caption = 'Fax'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label24: TLabel
              Left = 7
              Top = 252
              Width = 27
              Height = 13
              Caption = 'Email'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label14: TLabel
              Left = 7
              Top = 105
              Width = 53
              Height = 13
              Caption = 'Town/City'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 223
              Top = 133
              Width = 37
              Height = 13
              Caption = 'County'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label27: TLabel
              Left = 7
              Top = 160
              Width = 41
              Height = 13
              Caption = 'Country'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object TownEdit: TEdit
              Left = 100
              Top = 101
              Width = 141
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              MaxLength = 40
              TabOrder = 3
              Text = 'TownEdit'
              OnChange = CheckOK
            end
            object BuildingEdit: TEdit
              Left = 100
              Top = 16
              Width = 348
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              MaxLength = 40
              TabOrder = 0
              Text = 'BuildingEdit'
              OnChange = CheckOK
            end
            object StreetEdit: TEdit
              Left = 100
              Top = 44
              Width = 348
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              MaxLength = 40
              TabOrder = 1
              Text = 'StreetEdit'
            end
            object LocaleEdit: TEdit
              Left = 100
              Top = 72
              Width = 348
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              MaxLength = 40
              TabOrder = 2
              Text = 'LocaleEdit'
            end
            object PhoneEdit: TEdit
              Left = 100
              Top = 183
              Width = 253
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              MaxLength = 20
              TabOrder = 9
              Text = 'PhoneEdit'
              OnChange = CheckOK
            end
            object FaxEdit: TEdit
              Left = 100
              Top = 211
              Width = 253
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              MaxLength = 20
              TabOrder = 10
              Text = 'FaxEdit'
            end
            object EMailEdit: TEdit
              Left = 100
              Top = 244
              Width = 348
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              MaxLength = 40
              TabOrder = 11
              Text = 'EMailEdit'
            end
            object PostCodeEdit: TEdit
              Left = 100
              Top = 129
              Width = 101
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 10
              TabOrder = 4
              Text = 'POSTCODEEDIT'
              OnChange = CheckOK
            end
            object CountyEdit: TEdit
              Left = 267
              Top = 129
              Width = 181
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              MaxLength = 40
              TabOrder = 5
              Text = 'CountyEdit'
            end
            object dblkpCountry: TDBLookupComboBox
              Left = 100
              Top = 156
              Width = 253
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              KeyField = 'Country_Id'
              ListField = 'Country_Id_Descr'
              TabOrder = 6
            end
            object BitBtn2: TBitBtn
              Left = 366
              Top = 155
              Width = 25
              Height = 23
              Hint = 'Customer Type maintenance'
              Anchors = [akTop, akRight]
              Caption = '...'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              OnClick = BitBtn2Click
            end
            object btnCountryClear: TBitBtn
              Left = 399
              Top = 155
              Width = 25
              Height = 23
              Anchors = [akTop, akRight]
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
              TabOrder = 8
              OnClick = CountryClearBitBtnClick
            end
          end
          object grpbxAccountCode: TGroupBox
            Left = 8
            Top = 273
            Width = 465
            Height = 38
            Anchors = [akLeft, akTop, akRight]
            ParentBackground = False
            TabOrder = 1
            object Label11: TLabel
              Left = 7
              Top = 14
              Width = 72
              Height = 13
              Caption = 'Account Code'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object AccCodeEdit: TEdit
              Left = 101
              Top = 10
              Width = 90
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 8
              TabOrder = 0
              Text = 'ACCCODEEDIT'
              OnChange = AccCodeEditChange
              OnEnter = AccCodeEditEnter
              OnExit = AccCodeEditExit
            end
            object chkbxInvUpFrnt: TCheckBox
              Tag = 200
              Left = 280
              Top = 12
              Width = 169
              Height = 17
              Caption = 'All orders are invoiced upfront'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object dbgAccountCodes: TDBGrid
            Tag = 200
            Left = 7
            Top = 306
            Width = 466
            Height = 88
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            DrawingStyle = gdsGradient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
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
        end
        object pnlHOContacts: TPanel
          Left = 481
          Top = 0
          Width = 687
          Height = 614
          Align = alClient
          Caption = 'pnlHOContacts'
          ParentBackground = False
          TabOrder = 1
          object Panel26: TPanel
            Left = 1
            Top = 1
            Width = 685
            Height = 24
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Head Office Contacts'
            ParentBackground = False
            TabOrder = 0
          end
          object Panel27: TPanel
            Left = 677
            Top = 57
            Width = 9
            Height = 556
            Align = alRight
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 1
          end
          object CoolBar9: TCoolBar
            Left = 1
            Top = 25
            Width = 685
            Height = 32
            Bands = <
              item
                Control = ToolBar2
                ImageIndex = -1
                Width = 681
              end>
            EdgeInner = esLowered
            EdgeOuter = esNone
            object ToolBar2: TToolBar
              Left = 11
              Top = 0
              Width = 672
              Height = 25
              Align = alBottom
              Caption = 'ToolBar2'
              Images = imglstButtons
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              object btnHOContactAdd: TToolButton
                Left = 0
                Top = 0
                Hint = 'New'
                Caption = 'Add'
                ImageIndex = 0
                OnClick = btnHOContactAddClick
              end
              object btnHOContactChange: TToolButton
                Left = 23
                Top = 0
                Hint = 'Change'
                Caption = 'Chnage'
                ImageIndex = 1
                OnClick = btnHOContactChangeClick
              end
              object btnHOContactDelete: TToolButton
                Left = 46
                Top = 0
                Hint = 'Delete'
                ImageIndex = 3
                OnClick = btnHOContactDeleteClick
              end
              object btnHOContactOnline: TToolButton
                Left = 69
                Top = 0
                Hint = 'Online'
                Caption = 'btnHOContactOnline'
                ImageIndex = 9
              end
              object btnHOContactEmail: TToolButton
                Left = 92
                Top = 0
                Hint = 'Email'
                Caption = 'btnHOContactEmail'
                ImageIndex = 10
              end
            end
          end
          object pnlContactDetails: TPanel
            Left = 501
            Top = 57
            Width = 176
            Height = 556
            Align = alRight
            ParentBackground = False
            TabOrder = 3
            object Panel31: TPanel
              Left = 1
              Top = 1
              Width = 174
              Height = 24
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Product Categories'
              ParentBackground = False
              TabOrder = 0
            end
            object dblstContactCategories: TDBListBox
              Left = 1
              Top = 25
              Width = 174
              Height = 232
              Align = alTop
              DataField = 'Description'
              ItemHeight = 13
              TabOrder = 1
            end
          end
          object Panel28: TPanel
            Left = 480
            Top = 57
            Width = 21
            Height = 556
            Align = alRight
            ParentBackground = False
            TabOrder = 4
          end
          object Panel29: TPanel
            Left = 1
            Top = 57
            Width = 479
            Height = 556
            Align = alClient
            Caption = 'Panel29'
            ParentBackground = False
            TabOrder = 5
            object dbgHOContactDetails: TDBGrid
              Left = 1
              Top = 1
              Width = 477
              Height = 389
              Align = alClient
              DrawingStyle = gdsGradient
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              OnDrawColumnCell = dbgContactDetailsDrawColumnCell
              OnDblClick = dbgHOContactDetailsDblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Name'
                  Title.Caption = 'Full Name'
                  Width = 151
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Contact_Type_Description'
                  Title.Caption = 'Contact Type'
                  Width = 139
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Phone'
                  Width = 136
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Mobile_no'
                  Title.Caption = 'Mobile Phone'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Email'
                  Title.Caption = 'Email Address'
                  Width = 130
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Contact_Level_description'
                  Title.Caption = 'Contact Level'
                  Width = 123
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Contact_Status_Description'
                  Title.Caption = 'Status'
                  Width = 138
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Salutation'
                  Width = 127
                  Visible = True
                end>
            end
            object Panel30: TPanel
              Left = 1
              Top = 390
              Width = 477
              Height = 165
              Align = alBottom
              BevelOuter = bvNone
              ParentBackground = False
              TabOrder = 1
              object LabelName: TLabel
                Left = 4
                Top = 10
                Width = 32
                Height = 13
                Caption = 'Name:'
              end
              object LabelPhone: TLabel
                Left = 4
                Top = 30
                Width = 36
                Height = 13
                Caption = 'Phone:'
              end
              object LabelFax: TLabel
                Left = 4
                Top = 51
                Width = 39
                Height = 13
                Caption = 'Mobile:'
              end
              object DBContactText: TDBText
                Left = 47
                Top = 8
                Width = 214
                Height = 17
                DataField = 'Name'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBCPhoneText: TDBText
                Left = 47
                Top = 30
                Width = 214
                Height = 13
                DataField = 'Phone'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBCMobileText: TDBText
                Left = 47
                Top = 50
                Width = 214
                Height = 15
                DataField = 'Mobile_No'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label67: TLabel
                Left = 4
                Top = 96
                Width = 35
                Height = 13
                Caption = 'Status:'
              end
              object DBCStatusText: TDBText
                Left = 47
                Top = 94
                Width = 214
                Height = 16
                DataField = 'Contact_Status_Description'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label68: TLabel
                Left = 4
                Top = 74
                Width = 30
                Height = 13
                Caption = 'Email:'
              end
              object DBCEmailText: TDBText
                Left = 47
                Top = 72
                Width = 214
                Height = 17
                DataField = 'Email'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
          end
        end
      end
      object tbFinancials: TTabSheet
        Caption = 'Financials/Credit Details/GDPR'
        ImageIndex = 12
        object pnlInvoiceDetails: TPanel
          Left = 0
          Top = 0
          Width = 673
          Height = 614
          Align = alLeft
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            673
            614)
          object grpbxInvoicing: TGroupBox
            Left = 8
            Top = 2
            Width = 662
            Height = 521
            Anchors = [akLeft, akTop, akRight, akBottom]
            Caption = 'Invoice To'
            Color = clBtnFace
            ParentColor = False
            TabOrder = 0
            DesignSize = (
              662
              521)
            object Label35: TLabel
              Tag = 200
              Left = 8
              Top = 20
              Width = 50
              Height = 13
              Caption = 'Customer'
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label36: TLabel
              Tag = 200
              Left = 8
              Top = 52
              Width = 36
              Height = 13
              Caption = 'Branch'
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label37: TLabel
              Tag = 200
              Left = 8
              Top = 84
              Width = 40
              Height = 13
              Caption = 'Contact'
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object Label10: TLabel
              Tag = 200
              Left = 7
              Top = 290
              Width = 73
              Height = 13
              Caption = 'Intrastat Code'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label29: TLabel
              Tag = 200
              Left = 7
              Top = 321
              Width = 72
              Height = 13
              Caption = 'VAT Reference'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label31: TLabel
              Tag = 200
              Left = 7
              Top = 190
              Width = 86
              Height = 13
              Caption = 'Default Currency'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label4: TLabel
              Tag = 200
              Left = 515
              Top = 280
              Width = 59
              Height = 26
              Anchors = [akTop, akRight]
              Caption = 'Accounting Status'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              Visible = False
              WordWrap = True
            end
            object Label2: TLabel
              Tag = 200
              Left = 8
              Top = 156
              Width = 60
              Height = 13
              Caption = 'Default VAT'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Tag = 200
              Left = 7
              Top = 220
              Width = 66
              Height = 13
              Caption = 'Settle Disc %'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Tag = 200
              Left = 501
              Top = 220
              Width = 57
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Settle Days'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label34: TLabel
              Tag = 200
              Left = 7
              Top = 244
              Width = 63
              Height = 26
              Caption = 'Pre-Payment Balance'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object Label69: TLabel
              Tag = 200
              Left = 8
              Top = 111
              Width = 28
              Height = 13
              Caption = 'Email'
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object BitBtn5: TBitBtn
              Tag = 200
              Left = 629
              Top = 79
              Width = 25
              Height = 23
              Hint = 'Customer Type maintenance'
              Anchors = [akTop, akRight]
              Caption = '...'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnClick = BitBtn5Click
            end
            object edtInvToContact: TEdit
              Tag = 200
              Left = 101
              Top = 80
              Width = 519
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 4
              Text = 'edtInvToContact'
            end
            object IntrastatDBLookupComboBox: TDBLookupComboBox
              Tag = 200
              Left = 101
              Top = 286
              Width = 385
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              KeyField = 'Intrastat_Id'
              ListField = 'Intrastat_Id_Descr'
              TabOrder = 13
              OnClick = TypeDBLUCBClick
            end
            object VATRefEdit: TEdit
              Tag = 200
              Left = 101
              Top = 319
              Width = 523
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              MaxLength = 40
              TabOrder = 14
              Text = 'VATRefEdit'
            end
            object DefCurrDBLookupComboBox: TDBLookupComboBox
              Tag = 200
              Left = 101
              Top = 186
              Width = 482
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              KeyField = 'Currency_Code'
              ListField = 'Currency_Code_Descr'
              TabOrder = 8
            end
            object rdgrpCostCentre: TRadioGroup
              Tag = 200
              Left = 7
              Top = 352
              Width = 441
              Height = 81
              Anchors = [akLeft, akTop, akRight]
              Caption = 'Cost Centre Level '
              ItemIndex = 0
              Items.Strings = (
                'None'
                'by Customer'
                'by Branch')
              ParentBackground = False
              TabOrder = 15
            end
            object ProspectComboBox: TComboBox
              Left = 584
              Top = 283
              Width = 37
              Height = 21
              Style = csDropDownList
              Anchors = [akTop, akRight]
              TabOrder = 17
              TabStop = False
              Visible = False
              Items.Strings = (
                'Prospect'
                'Put on Ledger')
            end
            object DefVATDBLookupComboBox: TDBLookupComboBox
              Tag = 200
              Left = 101
              Top = 152
              Width = 482
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              KeyField = 'Vat_Code'
              ListField = 'Description'
              TabOrder = 6
              OnClick = DefVATDBLookupComboBoxClick
            end
            object VatMaintBitBtn: TBitBtn
              Tag = 200
              Left = 598
              Top = 152
              Width = 25
              Height = 23
              Hint = 'Vat Code Maintenance'
              Anchors = [akTop, akRight]
              Caption = '...'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              OnClick = VatMaintBitBtnClick
            end
            object btnDefaultCurrencyClear: TBitBtn
              Tag = 200
              Left = 597
              Top = 185
              Width = 25
              Height = 23
              Anchors = [akTop, akRight]
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
              TabOrder = 9
              OnClick = DefCurrClearBitBtnClick
            end
            object chkbxDisplayDiscounts: TCheckBox
              Tag = 200
              Left = 8
              Top = 443
              Width = 169
              Height = 17
              Caption = 'Display Discounts on Invoices'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 16
            end
            object SettDiscMemo: TMemo
              Tag = 200
              Left = 101
              Top = 216
              Width = 76
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                'Sett Disc')
              TabOrder = 10
              WantReturns = False
              OnChange = CheckOK
              OnExit = SettDiscMemoExit
            end
            object SettDaysMemo: TMemo
              Tag = 200
              Left = 579
              Top = 216
              Width = 43
              Height = 21
              Alignment = taRightJustify
              Anchors = [akTop, akRight]
              Lines.Strings = (
                'Days')
              TabOrder = 11
              WantReturns = False
              OnChange = CheckOK
              OnExit = SettDaysMemoExit
            end
            object memPrepayBalance: TMemo
              Tag = 200
              Left = 101
              Top = 249
              Width = 76
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                'memPrepayB'
                'al'
                'an'
                'ce')
              TabOrder = 12
              WantReturns = False
              OnExit = memPrepayBalanceExit
            end
            object BitBtn3: TBitBtn
              Tag = 200
              Left = 629
              Top = 47
              Width = 25
              Height = 23
              Hint = 'Customer Type maintenance'
              Anchors = [akTop, akRight]
              Caption = '...'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = InvToBranchClick
            end
            object BitBtn6: TBitBtn
              Tag = 200
              Left = 629
              Top = 15
              Width = 25
              Height = 23
              Hint = 'Customer Type maintenance'
              Anchors = [akTop, akRight]
              Caption = '...'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = InvCustBtnClick
            end
            object edtInvToBranch: TEdit
              Tag = 200
              Left = 101
              Top = 48
              Width = 519
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 2
              Text = 'edtInvToBranch'
            end
            object edtInvToCustomer: TEdit
              Tag = 200
              Left = 101
              Top = 16
              Width = 519
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 0
              Text = 'edtInvToCustomer'
            end
            object edtInvToContactEmail: TEdit
              Tag = 200
              Left = 101
              Top = 107
              Width = 519
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clBtnFace
              ReadOnly = True
              TabOrder = 18
              Text = 'edtInvToContact'
            end
          end
          object grpbxGDPR: TGroupBox
            Left = 8
            Top = 478
            Width = 662
            Height = 126
            Anchors = [akLeft, akTop, akRight, akBottom]
            Caption = 'GDPR '
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
            Visible = False
            object lblGDPRSignedOperatorName: TLabel
              Left = 308
              Top = 50
              Width = 156
              Height = 13
              Caption = 'lblGDPRSignedOperatorName'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object chkbxGDPRLetterSent: TCheckBox
              Left = 16
              Top = 24
              Width = 97
              Height = 17
              Caption = 'Letter Sent'
              TabOrder = 0
            end
            object chkbxGDPRSigned: TCheckBox
              Left = 16
              Top = 48
              Width = 145
              Height = 17
              Caption = 'Signed and Returned'
              TabOrder = 1
              OnClick = chkbxGDPRSignedClick
            end
            object edtdateGDPRSigned: TEdit
              Left = 171
              Top = 46
              Width = 98
              Height = 21
              TabOrder = 2
              OnChange = CheckOK
              OnExit = edtdateGDPRSignedExit
            end
            object btnDateGDPRSigned: TBitBtn
              Left = 277
              Top = 44
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
              TabOrder = 3
              OnClick = btnDateGDPRSignedClick
            end
          end
        end
        object pnlCreditDetails: TPanel
          Left = 673
          Top = 0
          Width = 495
          Height = 614
          Align = alClient
          ParentBackground = False
          TabOrder = 1
          DesignSize = (
            495
            614)
          object grpbxCredit: TGroupBox
            Left = 6
            Top = 2
            Width = 425
            Height = 580
            Anchors = [akLeft, akTop, akRight, akBottom]
            Caption = 'Credit Details'
            TabOrder = 0
            DesignSize = (
              425
              580)
            object Label5: TLabel
              Tag = 100
              Left = 7
              Top = 60
              Width = 58
              Height = 13
              Caption = 'Credit Limit'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label30: TLabel
              Tag = 100
              Left = 7
              Top = 91
              Width = 80
              Height = 13
              Caption = 'Available Credit'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Tag = 100
              Left = 7
              Top = 124
              Width = 62
              Height = 13
              Caption = 'Credit Score'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label38: TLabel
              Tag = 100
              Left = 7
              Top = 394
              Width = 74
              Height = 13
              Caption = 'Company Type'
            end
            object Label39: TLabel
              Tag = 100
              Left = 7
              Top = 422
              Width = 63
              Height = 13
              Caption = 'UK SIC Code'
            end
            object Label40: TLabel
              Tag = 100
              Left = 7
              Top = 366
              Width = 72
              Height = 13
              Caption = 'Issued Capital'
            end
            object Label41: TLabel
              Tag = 100
              Left = 7
              Top = 239
              Width = 108
              Height = 13
              Caption = 'Latest Annual Return'
            end
            object Label42: TLabel
              Tag = 100
              Left = 7
              Top = 269
              Width = 116
              Height = 13
              Caption = 'Date Accounts Lodged'
            end
            object Label43: TLabel
              Tag = 100
              Left = 7
              Top = 300
              Width = 135
              Height = 13
              Caption = 'Latest Filed Accounts Date'
            end
            object Label44: TLabel
              Tag = 100
              Left = 7
              Top = 328
              Width = 128
              Height = 13
              Caption = 'Accounts Reference Date'
            end
            object Bevel1: TBevel
              Tag = 100
              Left = 0
              Top = 223
              Width = 426
              Height = 7
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
              ExplicitWidth = 492
            end
            object Bevel2: TBevel
              Tag = 100
              Left = 0
              Top = 358
              Width = 426
              Height = 7
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
              ExplicitWidth = 492
            end
            object lblLastCreditCheck: TLabel
              Tag = 100
              Left = 7
              Top = 456
              Width = 88
              Height = 13
              Caption = 'Last Credit Check'
            end
            object Label25: TLabel
              Tag = 100
              Left = 7
              Top = 161
              Width = 75
              Height = 13
              Caption = 'Payment Terms'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object lblDirectDebit: TLabel
              Tag = 100
              Left = 7
              Top = 192
              Width = 91
              Height = 13
              Caption = 'Direct Debit Code'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              Visible = False
            end
            object Label9: TLabel
              Tag = 100
              Left = 7
              Top = 28
              Width = 66
              Height = 13
              Caption = 'Credit Status'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object CredAvailMemo: TMemo
              Tag = 100
              Left = 101
              Top = 87
              Width = 182
              Height = 21
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                'Cred Avail')
              TabOrder = 0
              WantReturns = False
              OnExit = CredAvailMemoExit
            end
            object spnCreditScore: TSpinEdit
              Tag = 100
              Left = 101
              Top = 119
              Width = 152
              Height = 22
              MaxValue = 100
              MinValue = 1
              TabOrder = 1
              Value = 100
            end
            object rdgrpCreditRating: TRadioGroup
              Tag = 100
              Left = 364
              Top = 11
              Width = 117
              Height = 131
              Caption = 'Credit Rating '
              Items.Strings = (
                'Not Rated'
                'Good'
                'Moderate'
                'High Risk'
                'Very High Risk')
              ParentBackground = False
              TabOrder = 2
            end
            object edtLastReturnDate: TEdit
              Tag = 100
              Left = 152
              Top = 235
              Width = 237
              Height = 21
              TabOrder = 7
              OnChange = CheckOK
              OnExit = edtLastReturnDateExit
            end
            object btnLastReturnDate: TBitBtn
              Tag = 100
              Left = 396
              Top = 233
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
              TabOrder = 8
              OnClick = btnLastReturnDateClick
            end
            object edtAccLodgedDate: TEdit
              Tag = 100
              Left = 152
              Top = 265
              Width = 237
              Height = 21
              TabOrder = 9
              OnChange = CheckOK
              OnExit = edtLastReturnDateExit
            end
            object btnAccLodgedDate: TBitBtn
              Tag = 100
              Left = 396
              Top = 263
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
              TabOrder = 10
              OnClick = btnAccLodgedDateClick
            end
            object edtAccountsFiledDate: TEdit
              Tag = 100
              Left = 152
              Top = 296
              Width = 237
              Height = 21
              TabOrder = 11
              OnChange = CheckOK
              OnExit = edtLastReturnDateExit
            end
            object btnAccountsFiledDate: TBitBtn
              Tag = 100
              Left = 396
              Top = 294
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
              TabOrder = 12
              OnClick = btnAccountsFiledDateClick
            end
            object edtAccRefDate: TEdit
              Tag = 100
              Left = 152
              Top = 324
              Width = 237
              Height = 21
              TabOrder = 13
              OnChange = CheckOK
            end
            object memIssCapital: TMemo
              Tag = 100
              Left = 93
              Top = 362
              Width = 176
              Height = 21
              Alignment = taRightJustify
              TabOrder = 14
              WantReturns = False
              OnChange = CheckOK
              OnExit = CredLimMemoExit
            end
            object dblkpCompanyType: TDBLookupComboBox
              Tag = 100
              Left = 93
              Top = 391
              Width = 312
              Height = 21
              KeyField = 'Company_Type'
              ListField = 'Company_Type_Description'
              TabOrder = 15
            end
            object edtSICCode: TEdit
              Tag = 100
              Left = 93
              Top = 419
              Width = 360
              Height = 21
              ReadOnly = True
              TabOrder = 16
              OnChange = CheckOK
            end
            object BitBtn8: TBitBtn
              Left = 460
              Top = 418
              Width = 25
              Height = 23
              Hint = 'Vat Code Maintenance'
              Caption = '...'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 17
              OnClick = BitBtn8Click
            end
            object dblkpPaymentTerms: TDBLookupComboBox
              Tag = 100
              Left = 101
              Top = 157
              Width = 308
              Height = 21
              KeyField = 'Payment_terms'
              ListField = 'Payment_terms_description'
              TabOrder = 3
              OnClick = dblkpPaymentTermsClick
            end
            object btnTerms: TBitBtn
              Tag = 100
              Left = 420
              Top = 156
              Width = 25
              Height = 23
              Hint = 'Customer Type maintenance'
              Caption = '...'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = btnTermsClick
            end
            object BitBtn4: TBitBtn
              Tag = 100
              Left = 451
              Top = 156
              Width = 25
              Height = 23
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
              TabOrder = 5
              OnClick = BitBtn4Click
            end
            object DDCodeEdit: TEdit
              Tag = 100
              Left = 101
              Top = 188
              Width = 182
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 10
              TabOrder = 6
              Text = 'DDCODEEDIT'
              Visible = False
            end
            object CredStatDBLCB: TDBLookupComboBox
              Tag = 100
              Left = 101
              Top = 24
              Width = 244
              Height = 21
              KeyField = 'Credit_Status'
              ListField = 'Credit_Status_Descr'
              TabOrder = 18
              OnClick = CheckOK
            end
            object CredLimMemo: TMemo
              Tag = 100
              Left = 101
              Top = 56
              Width = 182
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                'Cred Lim')
              TabOrder = 19
              WantReturns = False
              OnChange = CheckOK
              OnExit = CredLimMemoExit
            end
          end
          object chkbxConverttoCustomer: TCheckBox
            Left = 8
            Top = 587
            Width = 177
            Height = 17
            Anchors = [akLeft, akBottom]
            Caption = 'Convert Prospect to Customer'
            TabOrder = 1
            Visible = False
          end
        end
      end
      object tbOptions: TTabSheet
        Caption = 'Options'
        ImageIndex = 2
        object GroupBox2: TGroupBox
          Left = 454
          Top = 0
          Width = 390
          Height = 515
          Caption = 'Stock Options'
          ParentBackground = False
          TabOrder = 0
          object lblFormRefPref: TLabel
            Left = 16
            Top = 54
            Width = 101
            Height = 13
            Caption = 'Product Code Prefix'
          end
          object Label12: TLabel
            Left = 16
            Top = 116
            Width = 82
            Height = 13
            Caption = 'Existing Prefixes'
          end
          object Label13: TLabel
            Left = 16
            Top = 28
            Width = 136
            Height = 13
            Caption = 'Call Off Delivery Note Type'
          end
          object edtProdPrefix: TEdit
            Left = 200
            Top = 50
            Width = 121
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
            OnChange = edtProdPrefixChange
          end
          object DBGrid1: TDBGrid
            Left = 16
            Top = 132
            Width = 353
            Height = 301
            DrawingStyle = gdsGradient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
          end
          object cmbCallOffDeliveryNote: TComboBox
            Left = 200
            Top = 24
            Width = 145
            Height = 21
            Style = csDropDownList
            TabOrder = 2
            Items.Strings = (
              'No Header')
          end
          object chkbxProductPrefix: TCheckBox
            Left = 16
            Top = 84
            Width = 169
            Height = 17
            Caption = 'Product Prefix not required'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 441
          Height = 614
          Align = alLeft
          Caption = 'Ecommerce'
          TabOrder = 1
          object GroupBox1: TGroupBox
            Left = 16
            Top = 101
            Width = 409
            Height = 113
            Caption = 'Ordering'
            ParentBackground = False
            TabOrder = 0
            object Label6: TLabel
              Left = 23
              Top = 84
              Width = 78
              Height = 13
              Caption = 'Despatch Email'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label15: TLabel
              Left = 23
              Top = 28
              Width = 82
              Height = 13
              Caption = 'Consumer Code'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 23
              Top = 56
              Width = 67
              Height = 13
              Caption = 'Contract Ref:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object EdtEmailOrder: TEdit
              Left = 108
              Top = 80
              Width = 252
              Height = 21
              MaxLength = 40
              TabOrder = 0
            end
            object edtConsumerCode: TEdit
              Left = 108
              Top = 24
              Width = 252
              Height = 21
              MaxLength = 40
              TabOrder = 1
            end
            object edtContractRef: TEdit
              Left = 108
              Top = 52
              Width = 252
              Height = 21
              MaxLength = 40
              TabOrder = 2
            end
          end
          object grpbxEInvoicing: TGroupBox
            Left = 16
            Top = 224
            Width = 409
            Height = 201
            Caption = 'Electronic Invoicing'
            Enabled = False
            TabOrder = 1
            object Label17: TLabel
              Left = 7
              Top = 68
              Width = 60
              Height = 13
              Caption = 'Client Code'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label26: TLabel
              Left = 8
              Top = 172
              Width = 42
              Height = 13
              Caption = 'Site URL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label28: TLabel
              Left = 8
              Top = 100
              Width = 51
              Height = 13
              Caption = 'Username'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label32: TLabel
              Left = 8
              Top = 132
              Width = 49
              Height = 13
              Caption = 'Password'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object lblSystem: TLabel
              Left = 8
              Top = 32
              Width = 35
              Height = 13
              Caption = 'System'
            end
            object edtClientCode: TEdit
              Left = 76
              Top = 64
              Width = 205
              Height = 21
              MaxLength = 40
              TabOrder = 1
            end
            object rdgrpProtocol: TRadioGroup
              Left = 296
              Top = 56
              Width = 105
              Height = 97
              Caption = 'Transfer Protocol'
              ItemIndex = 3
              Items.Strings = (
                'EDI'
                'FTP'
                'HTTPS'
                'None')
              ParentBackground = False
              TabOrder = 5
            end
            object edtSiteURL: TEdit
              Left = 75
              Top = 168
              Width = 326
              Height = 21
              MaxLength = 20
              TabOrder = 4
              Text = 'edtSiteURL'
            end
            object edtUsername: TEdit
              Left = 76
              Top = 96
              Width = 205
              Height = 21
              MaxLength = 20
              TabOrder = 2
              Text = 'edtUsername'
            end
            object edtPassword: TEdit
              Left = 76
              Top = 128
              Width = 205
              Height = 21
              MaxLength = 20
              TabOrder = 3
              Text = 'edtPassword'
            end
            object dblkpSystem: TDBLookupComboBox
              Left = 76
              Top = 28
              Width = 145
              Height = 21
              KeyField = 'e_Invoicing_System'
              ListField = 'e_Invoicing_System_Name'
              TabOrder = 0
              OnClick = dblkpSystemClick
            end
            object BitBtn1: TBitBtn
              Left = 231
              Top = 28
              Width = 49
              Height = 20
              Caption = 'Clear'
              TabOrder = 6
              OnClick = CountryClearBitBtnClick
            end
          end
          object chkbxEInvoicing: TCheckBox
            Left = 24
            Top = 221
            Width = 161
            Height = 17
            Caption = 'Require Electronic Invoices'
            TabOrder = 2
            OnClick = chkbxEInvoicingClick
          end
          object chkbxUsePrintEvolved: TCheckBox
            Left = 16
            Top = 454
            Width = 201
            Height = 17
            Hint = 'Customer Orders on-line ?'
            Caption = 'Use Print Evolved Online Ordering'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
          object chkbxUseKingfieldOpips: TCheckBox
            Left = 16
            Top = 430
            Width = 209
            Height = 17
            Hint = 'Customer Orders on-line ?'
            Caption = 'Use Kingfield Opips Ordering'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
          end
          object grpbxOnline: TGroupBox
            Left = 16
            Top = 23
            Width = 409
            Height = 73
            Caption = 'grpbxOnline'
            Enabled = False
            ParentBackground = False
            TabOrder = 5
            object chkbxCreateBranchOnline: TCheckBox
              Left = 24
              Top = 24
              Width = 177
              Height = 17
              Hint = 'Customer Orders on-line ?'
              Caption = 'Can Create Branches Online'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object chkbxShowAvailableStock: TCheckBox
              Left = 24
              Top = 49
              Width = 177
              Height = 17
              Hint = 'Customer Orders on-line ?'
              Caption = 'Show Available Stock'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object ChkBxOnLnOrd: TCheckBox
            Left = 24
            Top = 22
            Width = 127
            Height = 17
            Hint = 'Customer Orders on-line ?'
            Caption = 'Use On-Line Ordering'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            OnClick = ChkBxOnLnOrdClick
          end
        end
        object GroupBox4: TGroupBox
          Left = 857
          Top = 0
          Width = 240
          Height = 137
          Caption = 'Production'
          ParentBackground = False
          TabOrder = 2
          object Label70: TLabel
            Left = 16
            Top = 56
            Width = 52
            Height = 13
            Caption = 'Markup %'
          end
          object memQuoteCostMarkup: TMemo
            Left = 87
            Top = 51
            Width = 90
            Height = 23
            Alignment = taRightJustify
            Enabled = False
            TabOrder = 0
            WantReturns = False
            WordWrap = False
            OnExit = memQuoteCostMarkupExit
          end
          object chkbxOverrideCostCharges: TCheckBox
            Left = 16
            Top = 24
            Width = 217
            Height = 17
            Caption = 'Override Default Cost Charges'
            TabOrder = 1
            OnClick = chkbxOverrideCostChargesClick
          end
        end
      end
      object tbBranches: TTabSheet
        Caption = 'Branches'
        ImageIndex = 10
        OnExit = tbBranchesExit
        OnShow = tbBranchesShow
        object pnlBranchTop: TPanel
          Left = 0
          Top = 0
          Width = 1168
          Height = 273
          Align = alTop
          ParentBackground = False
          TabOrder = 0
          object Panel13: TPanel
            Left = 1
            Top = 232
            Width = 1166
            Height = 40
            Align = alBottom
            ParentBackground = False
            TabOrder = 0
            object Label57: TLabel
              Left = 8
              Top = 13
              Width = 34
              Height = 13
              Caption = 'Search'
            end
            object edtBranchName: TEdit
              Left = 56
              Top = 9
              Width = 177
              Height = 21
              TabOrder = 0
              OnChange = edtBranchNameChange
            end
            object chkbxActiveBranchOnly: TCheckBox
              Left = 264
              Top = 12
              Width = 177
              Height = 14
              Caption = 'Only show active branches'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = chkbxActiveBranchOnlyClick
            end
          end
          object CoolBar8: TCoolBar
            Left = 1
            Top = 1
            Width = 1166
            Height = 45
            Bands = <
              item
                Control = ToolBar9
                ImageIndex = -1
                MinHeight = 41
                Width = 1164
              end>
            object ToolBar9: TToolBar
              Left = 11
              Top = 0
              Width = 1151
              Height = 41
              ButtonHeight = 36
              ButtonWidth = 59
              Caption = 'ToolBar1'
              Images = imglstjobs
              ShowCaptions = True
              TabOrder = 0
              object btnBranchAdd: TToolButton
                Left = 0
                Top = 0
                Caption = '&Add'
                ImageIndex = 0
                OnClick = btnBranchAddClick
              end
              object btnBranchChange: TToolButton
                Left = 59
                Top = 0
                Caption = '  &Change  '
                Enabled = False
                ImageIndex = 1
                OnClick = btnBranchChangeClick
              end
              object btnBranchDelete: TToolButton
                Left = 118
                Top = 0
                Caption = '&Delete'
                Enabled = False
                ImageIndex = 3
                OnClick = btnBranchDeleteClick
              end
            end
          end
          object dbgBranchDetails: TDBGrid
            Left = 1
            Top = 46
            Width = 1166
            Height = 186
            Align = alClient
            DrawingStyle = gdsGradient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 2
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDrawColumnCell = dbgBranchDetailsDrawColumnCell
            OnDblClick = dbgBranchDetailsDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Name'
                Title.Caption = 'Branch Name'
                Width = 149
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Account_Code'
                Title.Caption = 'Account Code'
                Width = 78
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Building_no_Name'
                Title.Caption = 'Address 1'
                Width = 154
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Street'
                Title.Caption = 'Address 2'
                Width = 165
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Locale'
                Title.Caption = 'Address 3'
                Width = 145
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Town'
                Title.Caption = 'Town/City'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'County'
                Width = 89
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Postcode'
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Phone'
                Width = 89
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Fax_Number'
                Title.Caption = 'Fax'
                Width = 89
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Email'
                Width = 150
                Visible = True
              end>
          end
        end
        object pnlContacts: TPanel
          Left = 0
          Top = 273
          Width = 1168
          Height = 341
          Align = alClient
          Caption = 'pnlContacts'
          ParentBackground = False
          TabOrder = 1
          object dbgContactDetails: TDBGrid
            Left = 1
            Top = 25
            Width = 1073
            Height = 275
            Align = alClient
            DrawingStyle = gdsGradient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            ParentFont = False
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDrawColumnCell = dbgContactDetailsDrawColumnCell
            OnDblClick = dbgContactDetailsDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Name'
                Title.Caption = 'Full Name'
                Width = 151
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Contact_Type_Description'
                Title.Caption = 'Contact Type'
                Width = 139
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Phone'
                Width = 136
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Mobile_no'
                Title.Caption = 'Mobile Phone'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Email'
                Title.Caption = 'Email Address'
                Width = 130
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Contact_Level_description'
                Title.Caption = 'Contact Level'
                Width = 123
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Contact_Status_Description'
                Title.Caption = 'Status'
                Width = 138
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Salutation'
                Width = 127
                Visible = True
              end>
          end
          object Panel14: TPanel
            Left = 1
            Top = 300
            Width = 1166
            Height = 40
            Align = alBottom
            ParentBackground = False
            TabOrder = 1
            object Label58: TLabel
              Left = 8
              Top = 13
              Width = 34
              Height = 13
              Caption = 'Search'
            end
            object edtContactName: TEdit
              Left = 56
              Top = 9
              Width = 177
              Height = 21
              TabOrder = 0
              OnChange = edtContactNameChange
            end
            object chkbxActiveContactOnly: TCheckBox
              Left = 344
              Top = 12
              Width = 177
              Height = 14
              Caption = 'Only show active Contacts'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = chkbxActiveContactOnlyClick
            end
            object Button2: TButton
              Left = 250
              Top = 7
              Width = 75
              Height = 25
              Caption = 'S&weep'
              TabOrder = 2
              OnClick = Button2Click
            end
          end
          object Panel15: TPanel
            Left = 1
            Top = 1
            Width = 1166
            Height = 24
            Align = alTop
            ParentBackground = False
            TabOrder = 2
            object Label59: TLabel
              Left = 9
              Top = 4
              Width = 45
              Height = 13
              Caption = 'Contacts'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object pnlContactFunctions: TPanel
            Left = 1074
            Top = 25
            Width = 93
            Height = 275
            Align = alRight
            ParentBackground = False
            TabOrder = 3
            DesignSize = (
              93
              275)
            object btnContactAdd: TBitBtn
              Left = 9
              Top = 8
              Width = 75
              Height = 25
              Caption = 'Add'
              NumGlyphs = 2
              TabOrder = 0
              OnClick = btnContactAddClick
            end
            object btnContactChange: TBitBtn
              Left = 9
              Top = 41
              Width = 75
              Height = 25
              Caption = 'Change'
              Enabled = False
              NumGlyphs = 2
              TabOrder = 1
              OnClick = btnContactChangeClick
            end
            object btnContactDelete: TBitBtn
              Left = 9
              Top = 75
              Width = 75
              Height = 25
              Caption = 'Delete'
              Enabled = False
              NumGlyphs = 2
              TabOrder = 2
              OnClick = btnContactDeleteClick
            end
            object btnContactOnline: TBitBtn
              Left = 9
              Top = 142
              Width = 75
              Height = 25
              Anchors = [akTop, akRight]
              Caption = 'Online'
              Enabled = False
              TabOrder = 3
              OnClick = btnContactOnlineClick
            end
            object btnContactMove: TBitBtn
              Left = 9
              Top = 110
              Width = 75
              Height = 25
              Anchors = [akTop, akRight]
              Caption = 'Move'
              Enabled = False
              TabOrder = 4
              OnClick = btnContactMoveClick
            end
          end
        end
      end
      object tbQuotes: TTabSheet
        Caption = 'Quotes'
        ImageIndex = 4
        OnExit = tbQuotesExit
        OnShow = tbQuotesShow
        object stsBrQuoteDetails: TStatusBar
          Left = 0
          Top = 595
          Width = 1168
          Height = 19
          Panels = <
            item
              Width = 150
            end
            item
              Width = 150
            end
            item
              Width = 50
            end>
        end
        object CoolBar6: TCoolBar
          Left = 0
          Top = 0
          Width = 1168
          Height = 45
          Bands = <
            item
              Control = tbrQuotes
              ImageIndex = -1
              MinHeight = 41
              Width = 1166
            end>
          object tbrQuotes: TToolBar
            Left = 11
            Top = 0
            Width = 1153
            Height = 41
            ButtonHeight = 36
            ButtonWidth = 59
            Caption = 'ToolBar1'
            HotImages = imglstButtons
            Images = imglstButtons
            ShowCaptions = True
            TabOrder = 0
            object btnQuoteAdd: TToolButton
              Left = 0
              Top = 0
              Caption = '&Add'
              ImageIndex = 0
              OnClick = btnQuoteAddClick
            end
            object btnQuoteChange: TToolButton
              Left = 59
              Top = 0
              Caption = '  &Change  '
              Enabled = False
              ImageIndex = 1
              OnClick = btnQuoteChangeClick
            end
            object btnQuoteCopy: TToolButton
              Left = 118
              Top = 0
              Caption = '&Copy'
              Enabled = False
              ImageIndex = 2
              OnClick = btnQuoteCopyClick
            end
            object btnQuoteReQuote: TToolButton
              Left = 177
              Top = 0
              Caption = 'Re-Quote'
              Enabled = False
              ImageIndex = 5
              OnClick = btnQuoteReQuoteClick
            end
            object btnQuoteDelete: TToolButton
              Left = 236
              Top = 0
              Caption = '&Delete'
              Enabled = False
              ImageIndex = 3
              OnClick = btnQuoteDeleteClick
            end
            object btnQuotePrint: TToolButton
              Left = 295
              Top = 0
              Caption = '&Print'
              Enabled = False
              ImageIndex = 4
              OnClick = btnQuotePrintClick
            end
            object ToolButton5: TToolButton
              Left = 354
              Top = 0
              Width = 8
              Caption = 'ToolButton1'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object btnQuoteConvert: TToolButton
              Left = 362
              Top = 0
              Caption = 'Con&vert'
              Enabled = False
              ImageIndex = 7
              OnClick = btnQuoteConvertClick
            end
          end
        end
        object dbgQuoteDetails: TDBGrid
          Left = 0
          Top = 45
          Width = 1168
          Height = 509
          Align = alClient
          DrawingStyle = gdsGradient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 2
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDblClick = dbgQuoteDetailsDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Quote'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Date_Point'
              Title.Caption = 'Date'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Description'
              Width = 181
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'Quantity'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Quote_Status_Description'
              Title.Caption = 'Status'
              Width = 133
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Date_Start'
              Title.Caption = 'Start Date'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Date_Required'
              Title.Caption = 'Date Required'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Rep_Name'
              Title.Caption = 'Rep'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Operator_Name'
              Title.Caption = 'Operator'
              Width = 154
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'Total_Cost_Value'
              Title.Caption = 'Total Cost Price'
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'Total_Sales_Value'
              Title.Caption = 'Total Sales Price'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Job_Bag'
              Title.Caption = 'Job Bag'
              Width = 78
              Visible = True
            end>
        end
        object Panel12: TPanel
          Left = 0
          Top = 554
          Width = 1168
          Height = 41
          Align = alBottom
          ParentBackground = False
          TabOrder = 3
          DesignSize = (
            1168
            41)
          object Label55: TLabel
            Left = 8
            Top = 16
            Width = 96
            Height = 13
            Caption = 'Description Search'
          end
          object Label56: TLabel
            Left = 964
            Top = 16
            Width = 76
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = 'Quote Number'
          end
          object edtQuoteSearch: TEdit
            Left = 107
            Top = 12
            Width = 180
            Height = 21
            TabOrder = 0
            OnChange = edtQuoteSearchChange
          end
          object edtQuoteNumber: TEdit
            Left = 1044
            Top = 12
            Width = 90
            Height = 21
            Anchors = [akRight, akBottom]
            TabOrder = 1
            OnKeyPress = edtQuoteNumberKeyPress
          end
          object BitBtn11: TBitBtn
            Left = 296
            Top = 10
            Width = 75
            Height = 25
            Caption = '&Search'
            TabOrder = 2
            OnClick = BitBtn11Click
          end
        end
      end
      object tbEnquiries: TTabSheet
        Caption = 'Enquiries'
        ImageIndex = 5
        OnExit = tbEnquiriesExit
        OnShow = tbEnquiriesShow
        object stsBrEnqDetails: TStatusBar
          Left = 0
          Top = 595
          Width = 1168
          Height = 19
          Panels = <
            item
              Width = 150
            end
            item
              Width = 150
            end
            item
              Width = 50
            end>
        end
        object CoolBar1: TCoolBar
          Left = 0
          Top = 0
          Width = 1168
          Height = 45
          Bands = <
            item
              Control = tbrEnquiries
              ImageIndex = -1
              MinHeight = 41
              Width = 1166
            end>
          object tbrEnquiries: TToolBar
            Left = 11
            Top = 0
            Width = 1153
            Height = 41
            ButtonHeight = 36
            ButtonWidth = 59
            Caption = 'Toolbar1'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            Images = imgEnquiries
            ParentFont = False
            ParentShowHint = False
            ShowCaptions = True
            ShowHint = True
            TabOrder = 0
            object btnEnqQuick: TToolButton
              Left = 0
              Top = 0
              Caption = '&Quick'
              ImageIndex = 5
              ParentShowHint = False
              ShowHint = True
              OnClick = btnEnqQuickClick
            end
            object btnEnqAdd: TToolButton
              Left = 59
              Top = 0
              Hint = 'Add Enquiry'
              Caption = '&Add'
              ImageIndex = 0
              ParentShowHint = False
              ShowHint = True
              OnClick = btnEnqAddClick
            end
            object btnEnqChange: TToolButton
              Left = 118
              Top = 0
              Hint = 'Change enquiry'
              Caption = '  &Change  '
              Enabled = False
              ImageIndex = 1
              ParentShowHint = False
              ShowHint = True
              OnClick = btnEnqChangeClick
            end
            object btnEnqCopy: TToolButton
              Left = 177
              Top = 0
              Caption = 'Cop&y'
              Enabled = False
              ImageIndex = 3
              ParentShowHint = False
              ShowHint = True
              OnClick = btnEnqCopyClick
            end
            object btnEnqDecline: TToolButton
              Left = 236
              Top = 0
              Caption = '&Decline'
              Enabled = False
              ImageIndex = 2
              OnClick = btnEnqDeclineClick
            end
            object ToolButton4: TToolButton
              Left = 295
              Top = 0
              Width = 8
              Caption = 'ToolButton4'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object btnEnqPrint: TToolButton
              Left = 303
              Top = 0
              Caption = '&Print'
              Enabled = False
              ImageIndex = 4
              ParentShowHint = False
              ShowHint = True
              OnClick = btnEnqPrintClick
            end
            object btnRepliesSpacer: TToolButton
              Left = 362
              Top = 0
              Width = 8
              Caption = 'btnRepliesSpacer'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object btnEnqReplies: TToolButton
              Left = 370
              Top = 0
              Caption = '&Replies'
              Enabled = False
              ImageIndex = 6
              OnClick = btnEnqRepliesClick
            end
            object btnEnqPricing: TToolButton
              Left = 429
              Top = 0
              Caption = 'Pri&cing'
              Enabled = False
              ImageIndex = 7
              OnClick = btnEnqPricingClick
            end
            object btnEnqQuote: TToolButton
              Left = 488
              Top = 0
              Caption = 'Quo&te'
              Enabled = False
              ImageIndex = 8
              OnClick = btnEnqQuoteClick
            end
            object btnEnqConvert: TToolButton
              Left = 547
              Top = 0
              Caption = 'Con&vert'
              Enabled = False
              ImageIndex = 9
              OnClick = btnEnqConvertClick
            end
          end
        end
        object dbgEnquiryDetails: TDBGrid
          Left = 0
          Top = 45
          Width = 1168
          Height = 509
          Align = alClient
          DrawingStyle = gdsGradient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentFont = False
          TabOrder = 2
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDrawColumnCell = dbgEnquiryDetailsDrawColumnCell
          OnDblClick = dbgEnquiryDetailsDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Enquiry'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Line'
              Width = 26
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Date_Point'
              Title.Caption = 'Date'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Description'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Form_Reference_ID'
              Title.Caption = 'Form Reference'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'rep_Name'
              Title.Caption = 'Rep'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Office_Contact_Name'
              Title.Caption = 'Office Contact'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Operator_Name'
              Title.Caption = 'Operator'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Branch_Name'
              Title.Caption = 'Branch'
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Product_Type_Description'
              Title.Caption = 'Product Type'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Status_Text'
              Title.Caption = 'Status'
              Width = 245
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 0
          Top = 554
          Width = 1168
          Height = 41
          Align = alBottom
          ParentBackground = False
          TabOrder = 3
          DesignSize = (
            1168
            41)
          object Label46: TLabel
            Left = 8
            Top = 16
            Width = 96
            Height = 13
            Caption = 'Description Search'
          end
          object Label47: TLabel
            Left = 964
            Top = 16
            Width = 83
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = 'Enquiry Number'
          end
          object edtEnqSearch: TEdit
            Left = 107
            Top = 12
            Width = 180
            Height = 21
            TabOrder = 0
            OnChange = edtEnqSearchChange
          end
          object edtEnqNumber: TEdit
            Left = 1044
            Top = 12
            Width = 90
            Height = 21
            Anchors = [akRight, akBottom]
            TabOrder = 1
            OnKeyPress = edtEnqNumberKeyPress
          end
          object btnSearch: TBitBtn
            Left = 296
            Top = 10
            Width = 75
            Height = 25
            Caption = '&Search'
            TabOrder = 2
            OnClick = btnSearchClick
          end
        end
      end
      object tbOrders: TTabSheet
        Caption = 'Orders'
        ImageIndex = 6
        OnExit = tbOrdersExit
        OnShow = tbOrdersShow
        object stsBrOrderDetails: TStatusBar
          Left = 0
          Top = 595
          Width = 1168
          Height = 19
          Panels = <
            item
              Width = 250
            end
            item
              Width = 50
            end>
        end
        object Panel3: TPanel
          Left = 0
          Top = 554
          Width = 1168
          Height = 41
          Align = alBottom
          ParentBackground = False
          TabOrder = 1
          DesignSize = (
            1168
            41)
          object Label48: TLabel
            Left = 8
            Top = 16
            Width = 96
            Height = 13
            Caption = 'Description Search'
          end
          object Label49: TLabel
            Left = 934
            Top = 16
            Width = 73
            Height = 13
            Anchors = [akRight, akBottom]
            Caption = 'Order number'
            ExplicitLeft = 952
          end
          object edtOrderSearch: TEdit
            Left = 104
            Top = 12
            Width = 180
            Height = 21
            TabOrder = 0
            OnChange = edtOrderSearchChange
          end
          object edtOrderNumber: TEdit
            Left = 1012
            Top = 12
            Width = 90
            Height = 21
            Anchors = [akRight, akBottom]
            TabOrder = 1
            OnKeyPress = edtOrderNumberKeyPress
          end
          object chkbxShowUnauthorised: TCheckBox
            Left = 376
            Top = 14
            Width = 169
            Height = 17
            Caption = 'Only show unauthorised orders'
            TabOrder = 2
            OnClick = chkbxShowUnauthorisedClick
          end
          object BitBtn9: TBitBtn
            Left = 288
            Top = 10
            Width = 75
            Height = 25
            Caption = '&Search'
            TabOrder = 3
            OnClick = BitBtn9Click
          end
        end
        object CoolBar2: TCoolBar
          Left = 0
          Top = 0
          Width = 1168
          Height = 44
          Bands = <
            item
              Control = PageScroller1
              ImageIndex = -1
              MinHeight = 41
              Width = 1166
            end>
          object PageScroller1: TPageScroller
            Left = 11
            Top = 0
            Width = 1153
            Height = 41
            Control = tbrOrders
            TabOrder = 0
            object tbrOrders: TToolBar
              Left = 0
              Top = 0
              Width = 1153
              Height = 41
              ButtonHeight = 29
              ButtonWidth = 65
              Caption = 'ToolBar1'
              Images = imglstOrders
              ParentShowHint = False
              ShowCaptions = True
              ShowHint = True
              TabOrder = 0
              object btnOrderAdd: TToolButton
                Left = 0
                Top = 0
                Hint = 'Add new production order'
                Caption = '&Add'
                ImageIndex = 0
                OnClick = btnOrderAddClick
                OnMouseDown = btnOrderAddMouseDown
              end
              object btnOrderChange: TToolButton
                Left = 65
                Top = 0
                Hint = 'Change order details'
                Caption = '  &Change  '
                Enabled = False
                ImageIndex = 1
                OnClick = btnOrderChangeClick
              end
              object btnOrderRepeat: TToolButton
                Left = 130
                Top = 0
                Hint = 'Repeat Order'
                Caption = '&Repeat'
                Enabled = False
                ImageIndex = 3
                OnClick = btnOrderRepeatClick
              end
              object btnOrderDelete: TToolButton
                Left = 195
                Top = 0
                Caption = 'Delete'
                Enabled = False
                ImageIndex = 12
                OnClick = btnOrderDeleteClick
              end
              object btnOrderPrint: TToolButton
                Left = 260
                Top = 0
                Hint = 'Print'
                Caption = '&Print'
                Enabled = False
                ImageIndex = 4
                OnClick = btnOrderPrintClick
              end
              object btnOrderRequote: TToolButton
                Left = 325
                Top = 0
                Caption = 'Re-quote'
                Enabled = False
                ImageIndex = 10
                OnClick = btnOrderRequoteClick
              end
              object btnOrderHistory: TToolButton
                Left = 390
                Top = 0
                Hint = 'Show Order History'
                Caption = '&History'
                Enabled = False
                ImageIndex = 13
                OnClick = btnOrderHistoryClick
              end
              object btnOrderSeparator1: TToolButton
                Left = 455
                Top = 0
                Width = 8
                Caption = 'btnOrderSeparator1'
                ImageIndex = 7
                Style = tbsSeparator
                Visible = False
              end
              object btnOrderAllocatefnc: TToolButton
                Left = 463
                Top = 0
                Caption = 'Al&locate'
                DropdownMenu = pmnOrderAllocate
                Enabled = False
                ImageIndex = 7
                Style = tbsDropDown
              end
              object btnOrderPicking: TToolButton
                Left = 543
                Top = 0
                Caption = 'Pic&king'
                DropdownMenu = pmnOrderPicking
                Enabled = False
                ImageIndex = 7
              end
              object ToolButton3: TToolButton
                Left = 608
                Top = 0
                Width = 8
                Caption = 'ToolButton3'
                ImageIndex = 7
                Style = tbsSeparator
              end
              object btnOrderProofs: TToolButton
                Left = 616
                Top = 0
                Caption = 'Proo&fs'
                DropdownMenu = pmnOrderProofs
                Enabled = False
                ImageIndex = 7
              end
              object btnOrderDeliveriesSpacer: TToolButton
                Left = 681
                Top = 0
                Width = 8
                Caption = 'btnOrderDeliveriesSpacer'
                ImageIndex = 7
                Style = tbsSeparator
              end
              object btnOrderDeliveries: TToolButton
                Left = 689
                Top = 0
                Hint = 'Deliveries'
                Caption = 'Deliver&y'
                Enabled = False
                ImageIndex = 5
                OnClick = btnOrderDeliveriesClick
              end
              object btnOrderHold: TToolButton
                Left = 754
                Top = 0
                Hint = 'On Hold'
                Caption = '&Hold'
                Enabled = False
                ImageIndex = 6
                OnClick = btnOrderHoldClick
              end
            end
          end
        end
        object dbgOrderDetails: TDBGrid
          Left = 0
          Top = 44
          Width = 1168
          Height = 510
          Align = alClient
          DataSource = dtmdlOrders.dtsOrders
          DrawingStyle = gdsGradient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 3
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDrawColumnCell = dbgOrderDetailsDrawColumnCell
          OnDblClick = dbgOrderDetailsDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Sales_order'
              Title.Caption = 'Order'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Order_date'
              Title.Caption = 'Order Date'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Description'
              Width = 149
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Order_Price'
              Title.Caption = 'Cost Price'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Order_unit'
              Title.Caption = 'Cost Unit'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Selling_Price'
              Title.Caption = 'Sell Price'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Selling_unit'
              Title.Caption = 'Sell Unit'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Quantity'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cust_Order_No'
              Title.Caption = 'Customer Order No.'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Goods_Required'
              Title.Caption = 'Date Required'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Stock_Reference'
              Title.Caption = 'Product Code'
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Supplier_Name'
              Title.Caption = 'Supplier'
              Width = 131
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Form_Reference_ID'
              Title.Caption = 'Form Reference'
              Width = 128
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Branch_Name'
              Title.Caption = 'Branch'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Status_Text'
              Title.Caption = 'Status'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'job_bag'
              Title.Caption = 'Job Bag'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Description_Reference'
              Title.Caption = 'Descriptive Reference'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Rep_Name'
              Title.Caption = 'Rep'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Operator_Name'
              Title.Caption = 'Operator'
              Visible = True
            end>
        end
      end
      object tbJobs: TTabSheet
        Caption = 'Jobs'
        ImageIndex = 7
        OnExit = tbJobsExit
        OnShow = tbJobsShow
        object stsbrJobDetails: TStatusBar
          Left = 0
          Top = 554
          Width = 1168
          Height = 19
          Panels = <
            item
              Width = 200
            end
            item
              Width = 50
            end
            item
              Width = 50
            end>
        end
        object CoolBar3: TCoolBar
          Left = 0
          Top = 0
          Width = 1168
          Height = 45
          Bands = <
            item
              Control = tbrJobs
              ImageIndex = -1
              MinHeight = 41
              Width = 1166
            end>
          object tbrJobs: TToolBar
            Left = 11
            Top = 0
            Width = 1153
            Height = 41
            ButtonHeight = 36
            ButtonWidth = 59
            Caption = 'ToolBar1'
            Images = imglstjobs
            ShowCaptions = True
            TabOrder = 0
            object btnJobAdd: TToolButton
              Left = 0
              Top = 0
              Caption = '&Add'
              ImageIndex = 0
              OnClick = btnJobAddClick
            end
            object btnJobChange: TToolButton
              Left = 59
              Top = 0
              Caption = '  &Change  '
              Enabled = False
              ImageIndex = 1
              OnClick = btnJobChangeClick
            end
            object btnJobRepeat: TToolButton
              Left = 118
              Top = 0
              Caption = '&Repeat'
              Enabled = False
              ImageIndex = 4
              OnClick = btnJobRepeatClick
            end
            object btnJobDelete: TToolButton
              Left = 177
              Top = 0
              Caption = '&Delete'
              Enabled = False
              ImageIndex = 3
              OnClick = btnJobDeleteClick
            end
            object btnJobPrint: TToolButton
              Left = 236
              Top = 0
              Caption = '&Print'
              Enabled = False
              ImageIndex = 5
              OnClick = btnJobPrintClick
            end
            object ToolButton2: TToolButton
              Left = 295
              Top = 0
              Width = 8
              Caption = 'ToolButton2'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object btnJobDraft: TToolButton
              Left = 303
              Top = 0
              Caption = 'Dra&ft'
              Enabled = False
              ImageIndex = 4
              OnClick = btnJobDraftClick
            end
          end
        end
        object dbgJobDetails: TDBGrid
          Left = 0
          Top = 45
          Width = 1168
          Height = 509
          Align = alClient
          DrawingStyle = gdsGradient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 2
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDrawColumnCell = dbgJobDetailsDrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'Job_Bag'
              Title.Caption = 'Job bag No.'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Date_Point'
              Title.Caption = 'Date'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Job_Bag_Descr'
              Title.Caption = 'Description'
              Width = 181
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'Quantity'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Job_Bag_Status_descr'
              Title.Caption = 'Status'
              Width = 133
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cust_Order_no'
              Title.Caption = 'Customer Order number'
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Goods_Required'
              Title.Caption = 'Date Required'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Operator_Name'
              Title.Caption = 'Operator'
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Account_Manager'
              Title.Caption = 'Account Manager'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Description_Reference'
              Title.Caption = 'Description Reference'
              Width = 144
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Date_Start'
              Title.Caption = 'Start Date'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Quote'
              Width = 82
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 0
          Top = 573
          Width = 1168
          Height = 41
          Align = alBottom
          ParentBackground = False
          TabOrder = 3
          object Label50: TLabel
            Left = 8
            Top = 16
            Width = 96
            Height = 13
            Caption = 'Description Search'
          end
          object edtJobSearch: TEdit
            Left = 104
            Top = 8
            Width = 233
            Height = 21
            TabOrder = 0
            OnChange = edtJobSearchChange
          end
          object Panel5: TPanel
            Left = 894
            Top = 1
            Width = 273
            Height = 39
            Align = alRight
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 1
            DesignSize = (
              273
              39)
            object Label51: TLabel
              Left = 86
              Top = 16
              Width = 62
              Height = 13
              Anchors = [akRight, akBottom]
              Caption = 'Job Number'
            end
            object edtJobNumber: TEdit
              Left = 167
              Top = 12
              Width = 90
              Height = 21
              Anchors = [akRight, akBottom]
              TabOrder = 0
              OnKeyPress = edtJobNumberKeyPress
            end
          end
          object BitBtn10: TBitBtn
            Left = 344
            Top = 6
            Width = 75
            Height = 25
            Caption = '&Search'
            TabOrder = 2
            OnClick = BitBtn10Click
          end
        end
      end
      object tbStock: TTabSheet
        Caption = 'Stock'
        ImageIndex = 3
        OnExit = tbStockExit
        OnShow = tbStockShow
        object stsbrStockDetails: TStatusBar
          Left = 0
          Top = 595
          Width = 1168
          Height = 19
          Panels = <
            item
              Width = 300
            end
            item
              Width = 300
            end
            item
              Width = 300
            end>
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 1168
          Height = 595
          Align = alClient
          Caption = 'Panel7'
          ParentBackground = False
          TabOrder = 1
          object CoolBar4: TCoolBar
            Left = 1
            Top = 1
            Width = 1166
            Height = 44
            Bands = <
              item
                Control = PageScroller2
                ImageIndex = -1
                MinHeight = 41
                Width = 1164
              end>
            object PageScroller2: TPageScroller
              Left = 11
              Top = 0
              Width = 1151
              Height = 41
              Control = tbrStock
              TabOrder = 0
              object tbrStock: TToolBar
                Left = 0
                Top = 0
                Width = 1151
                Height = 41
                ButtonHeight = 44
                ButtonWidth = 68
                Caption = 'ToolBar1'
                HotImages = imglstMaint
                Images = imglstMaint
                ShowCaptions = True
                TabOrder = 0
                Wrapable = False
                object btnStockChange: TToolButton
                  Left = 0
                  Top = 0
                  Hint = 'Change product'
                  Caption = '     &View     '
                  Enabled = False
                  ImageIndex = 1
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btnStockChangeClick
                end
                object btnStockLabels: TToolButton
                  Left = 68
                  Top = 0
                  Hint = 'Print labels'
                  Caption = 'Labels'
                  Enabled = False
                  ImageIndex = 11
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btnStockLabelsClick
                end
                object ToolButton1: TToolButton
                  Left = 136
                  Top = 0
                  Width = 8
                  Caption = 'ToolButton1'
                  ImageIndex = 5
                  Style = tbsSeparator
                end
                object btnStockLevels: TToolButton
                  Left = 144
                  Top = 0
                  Hint = 'Maintain stock levels'
                  Caption = '&Levels'
                  Enabled = False
                  ImageIndex = 3
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = btnStockLevelsClick
                end
                object btnStockEnquiry: TToolButton
                  Left = 212
                  Top = 0
                  Caption = 'Enquiry'
                  DropdownMenu = pmnStockEnquiry
                  Enabled = False
                  ImageIndex = 6
                  Style = tbsDropDown
                end
              end
            end
          end
          object dbgStockDetails: TDBGrid
            Left = 1
            Top = 45
            Width = 1166
            Height = 508
            Align = alClient
            DrawingStyle = gdsGradient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDrawColumnCell = dbgStockDetailsDrawColumnCell
            OnDblClick = dbgStockDetailsDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Part'
                Title.Caption = 'Product'
                Width = 97
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'description'
                Title.Caption = 'Description'
                Width = 177
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'form_reference_id'
                Title.Caption = 'Form reference'
                Width = 157
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'store_qty'
                Title.Caption = 'In Stock'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'qty_alloc'
                Title.Caption = 'Allocated'
                Width = 54
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'qty_free'
                Title.Caption = 'Free Stock'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'paid_for'
                Title.Caption = 'Paid for'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'not_paid_for'
                Title.Caption = 'Unpaid'
                Width = 49
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'prod_ord_qty'
                Title.Caption = 'On Buy Print'
                Width = 68
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'purch_ord_qty'
                Title.Caption = 'On Purchase'
                Width = 67
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Maximum_Stock'
                Title.Caption = 'Maximum'
                Width = 54
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Minimum_Stock'
                Title.Caption = 'Minimum'
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Reorder_Level'
                Title.Caption = 'Reorder'
                Width = 54
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Forward_Qty'
                Title.Caption = 'Forward'
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SO_unallocated'
                Title.Caption = 'Unallocated SO'
                Width = 83
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Future_Stock'
                Title.Caption = 'Future Stock'
                Width = 68
                Visible = True
              end>
          end
          object Panel8: TPanel
            Left = 1
            Top = 553
            Width = 1166
            Height = 41
            Align = alBottom
            ParentBackground = False
            TabOrder = 2
            DesignSize = (
              1166
              41)
            object Label52: TLabel
              Left = 8
              Top = 16
              Width = 77
              Height = 13
              Anchors = [akLeft, akBottom]
              Caption = 'Product Search'
            end
            object edtStockSearch: TEdit
              Left = 104
              Top = 8
              Width = 233
              Height = 21
              Anchors = [akLeft, akBottom]
              CharCase = ecUpperCase
              TabOrder = 0
              OnChange = edtStockSearchChange
            end
            object Panel9: TPanel
              Left = 980
              Top = 1
              Width = 185
              Height = 39
              Align = alRight
              BevelOuter = bvNone
              ParentBackground = False
              TabOrder = 1
            end
            object chkbxShowNotinUse: TCheckBox
              Left = 360
              Top = 8
              Width = 217
              Height = 17
              Caption = 'Show products not in use'
              TabOrder = 2
              OnClick = chkbxShowNotinUseClick
            end
          end
        end
      end
      object tbInvoices: TTabSheet
        Caption = 'Invoices'
        ImageIndex = 8
        OnExit = tbInvoicesExit
        OnShow = tbInvoicesShow
        object stsbrInvoiceDetails: TStatusBar
          Left = 0
          Top = 557
          Width = 1168
          Height = 19
          Panels = <
            item
              Width = 250
            end
            item
              Width = 50
            end>
        end
        object CoolBar5: TCoolBar
          Left = 0
          Top = 0
          Width = 1168
          Height = 44
          Bands = <
            item
              Control = PageScroller3
              ImageIndex = -1
              MinHeight = 40
              Width = 1166
            end>
          object PageScroller3: TPageScroller
            Left = 11
            Top = 0
            Width = 1153
            Height = 40
            Align = alClient
            Control = tbrInvoices
            TabOrder = 0
            object tbrInvoices: TToolBar
              Left = 0
              Top = 0
              Width = 1153
              Height = 40
              ButtonHeight = 36
              ButtonWidth = 53
              Caption = 'ToolBar1'
              HotImages = imglstFunctions
              Images = imglstFunctions
              ParentShowHint = False
              ShowCaptions = True
              ShowHint = True
              TabOrder = 0
              Wrapable = False
              object btnInvoiceChange: TToolButton
                Left = 0
                Top = 0
                Hint = 'Change order details'
                Caption = '    &View   '
                Enabled = False
                ImageIndex = 1
                OnClick = btnInvoiceChangeClick
              end
              object btnInvoiceReprint: TToolButton
                Left = 53
                Top = 0
                Caption = '&Reprint'
                Enabled = False
                ImageIndex = 6
                OnClick = btnInvoiceReprintClick
              end
            end
          end
        end
        object dbgInvoiceDetails: TDBGrid
          Left = 0
          Top = 44
          Width = 1168
          Height = 513
          Align = alClient
          DrawingStyle = gdsGradient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 2
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDrawColumnCell = dbgInvoiceDetailsDrawColumnCell
          OnDblClick = dbgInvoiceDetailsDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Sales_Invoice_no'
              Title.Caption = 'Invoice No.'
              Width = 63
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
              FieldName = 'Invoice_Description'
              Title.Caption = 'Description'
              Width = 161
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Reference'
              Title.Caption = 'Order No.'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Goods_Value'
              Title.Caption = 'Goods'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Vat_Value'
              Title.Caption = 'VAT'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Total_Value'
              Title.Caption = 'Total'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Status_Description'
              Title.Caption = 'Status'
              Width = 83
              Visible = True
            end>
        end
        object Panel10: TPanel
          Left = 0
          Top = 576
          Width = 1168
          Height = 38
          Align = alBottom
          ParentBackground = False
          TabOrder = 3
          object Label53: TLabel
            Left = 8
            Top = 13
            Width = 59
            Height = 13
            Caption = 'Description'
          end
          object edtInvoiceSearch: TEdit
            Left = 100
            Top = 9
            Width = 153
            Height = 21
            TabOrder = 0
            OnChange = edtInvoiceSearchChange
          end
          object Panel11: TPanel
            Left = 884
            Top = 1
            Width = 283
            Height = 36
            Align = alRight
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 1
            object Label54: TLabel
              Left = 88
              Top = 13
              Width = 80
              Height = 13
              Caption = 'Invoice Number'
            end
            object edtInvoiceNumber: TEdit
              Left = 176
              Top = 9
              Width = 81
              Height = 21
              TabOrder = 0
              OnKeyPress = edtInvoiceNumberKeyPress
            end
          end
          object chkbxShowInactive: TCheckBox
            Left = 264
            Top = 11
            Width = 113
            Height = 17
            Caption = 'Show deleted'
            TabOrder = 2
          end
        end
      end
      object tbDocuments: TTabSheet
        Caption = 'Documents'
        ImageIndex = 4
        object Panel1: TPanel
          Left = 0
          Top = 573
          Width = 1168
          Height = 41
          Align = alBottom
          ParentBackground = False
          TabOrder = 0
          object Label33: TLabel
            Left = 8
            Top = 16
            Width = 45
            Height = 13
            Caption = 'Logo file'
          end
          object edtLogoLocation: TEdit
            Left = 56
            Top = 12
            Width = 281
            Height = 21
            TabOrder = 0
          end
          object Button4: TButton
            Left = 342
            Top = 10
            Width = 75
            Height = 25
            Caption = 'Browse'
            TabOrder = 1
            OnClick = Button4Click
          end
        end
        object ToolBar1: TToolBar
          Left = 1129
          Top = 0
          Width = 39
          Height = 573
          Align = alRight
          ButtonHeight = 36
          ButtonWidth = 40
          Caption = 'ToolBar1'
          HotImages = imgIcons
          Images = imgIcons
          ParentShowHint = False
          ShowCaptions = True
          ShowHint = True
          TabOrder = 1
          object btnWord: TToolButton
            Left = 0
            Top = 0
            Hint = 'Word'
            Caption = 'Word'
            ImageIndex = 1
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = btnWordClick
          end
          object btnExcel: TToolButton
            Left = 0
            Top = 36
            Hint = 'Excel'
            Caption = 'Excel'
            ImageIndex = 0
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = btnWordClick
          end
          object btnAttach: TToolButton
            Left = 0
            Top = 72
            Hint = 'Attach Documents'
            Caption = 'Attach'
            ImageIndex = 3
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = btnAttachClick
          end
          object btnEmail: TToolButton
            Left = 0
            Top = 108
            Hint = 'Email'
            Caption = 'Email'
            ImageIndex = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnEmailClick
          end
        end
        object lstvwDocuments: TListView
          Left = 0
          Top = 0
          Width = 1129
          Height = 573
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
          MultiSelect = True
          RowSelect = True
          PopupMenu = pmnuDocuments
          SmallImages = imgDocuments
          TabOrder = 2
          OnColumnClick = lstvwDocumentsColumnClick
          OnCompare = lstvwDocumentsCompare
          OnDblClick = lstvwDocumentsDblClick
        end
      end
      object tbActivity: TTabSheet
        Caption = 'Activity'
        ImageIndex = 10
        OnExit = tbActivityExit
        OnShow = tbActivityShow
        object pnlActivityDetails: TPanel
          Left = 0
          Top = 321
          Width = 1168
          Height = 293
          Align = alClient
          ParentBackground = False
          TabOrder = 0
          object Panel17: TPanel
            Left = 1
            Top = 1
            Width = 1166
            Height = 24
            Align = alTop
            ParentBackground = False
            TabOrder = 0
            object Label61: TLabel
              Left = 9
              Top = 4
              Width = 35
              Height = 13
              Caption = 'Details'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object Panel18: TPanel
            Left = 1
            Top = 25
            Width = 821
            Height = 267
            Align = alLeft
            Caption = 'Panel18'
            ParentBackground = False
            TabOrder = 1
            object memNarrative: TMemo
              Left = 1
              Top = 1
              Width = 819
              Height = 265
              Align = alClient
              Color = clBtnFace
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              Lines.Strings = (
                'Memo1')
              ParentFont = False
              TabOrder = 0
            end
          end
          object Panel19: TPanel
            Left = 822
            Top = 25
            Width = 345
            Height = 267
            Align = alClient
            ParentBackground = False
            TabOrder = 2
          end
        end
        object pnlActivityList: TPanel
          Left = 0
          Top = 0
          Width = 1168
          Height = 321
          Align = alTop
          Caption = 'pnlActivityList'
          ParentBackground = False
          TabOrder = 1
          object CoolBar7: TCoolBar
            Left = 1
            Top = 1
            Width = 1166
            Height = 45
            Bands = <
              item
                Control = ToolBar8
                ImageIndex = -1
                MinHeight = 41
                Width = 1164
              end>
            object ToolBar8: TToolBar
              Left = 11
              Top = 0
              Width = 1151
              Height = 41
              ButtonHeight = 36
              ButtonWidth = 59
              Caption = 'ToolBar1'
              Images = imglstjobs
              ShowCaptions = True
              TabOrder = 0
              object btnActivityAdd: TToolButton
                Left = 0
                Top = 0
                Caption = '&Add'
                ImageIndex = 0
                OnClick = btnActivityAddClick
              end
              object btnActivityChange: TToolButton
                Left = 59
                Top = 0
                Caption = '  &Change  '
                Enabled = False
                ImageIndex = 1
                OnClick = btnActivityChangeClick
              end
              object btnActivityDelete: TToolButton
                Left = 118
                Top = 0
                Caption = '&Delete'
                Enabled = False
                ImageIndex = 3
                OnClick = btnActivityDeleteClick
              end
            end
          end
          object Panel16: TPanel
            Left = 1
            Top = 280
            Width = 1166
            Height = 40
            Align = alBottom
            ParentBackground = False
            TabOrder = 1
            object Label60: TLabel
              Left = 8
              Top = 13
              Width = 34
              Height = 13
              Caption = 'Search'
            end
            object Edit1: TEdit
              Left = 56
              Top = 9
              Width = 177
              Height = 21
              TabOrder = 0
            end
          end
          object dbgActivityDetails: TDBGrid
            Left = 1
            Top = 46
            Width = 1166
            Height = 234
            Align = alClient
            DrawingStyle = gdsGradient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
            ParentFont = False
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDrawColumnCell = dbgActivityDetailsDrawColumnCell
            OnDblClick = dbgActivityDetailsDblClick
            OnTitleClick = dbgActivityDetailsTitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Due_Date_Time'
                Title.Caption = 'Due Date'
                Width = 125
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Activity_Priority_description'
                Title.Caption = 'Priority'
                Width = 123
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Activity_Subject'
                Title.Caption = 'Subject'
                Width = 128
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Branch_Name'
                Title.Caption = 'Branch'
                Width = 178
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Contact_Name'
                Title.Caption = 'Contact'
                Width = 172
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Activity_Type_Description'
                Title.Caption = 'Type'
                Width = 115
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Activity_Status_Description'
                Title.Caption = 'Status'
                Width = 134
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Operator_Name'
                Title.Caption = 'Created by'
                Width = 108
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Assigned_To_Name'
                Title.Caption = 'Assigned To'
                Width = 101
                Visible = True
              end>
          end
        end
      end
      object tbCrossSelling: TTabSheet
        Caption = 'Cross Selling Check List'
        ImageIndex = 11
        OnShow = tbCrossSellingShow
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 1168
          Height = 25
          Align = alTop
          ParentBackground = False
          TabOrder = 0
        end
        object Panel20: TPanel
          Left = 0
          Top = 25
          Width = 585
          Height = 589
          Align = alLeft
          ParentBackground = False
          TabOrder = 1
          object Panel21: TPanel
            Left = 1
            Top = 396
            Width = 583
            Height = 192
            Align = alBottom
            ParentBackground = False
            TabOrder = 0
            object memCategoryNarrative: TMemo
              Left = 1
              Top = 1
              Width = 581
              Height = 190
              Align = alClient
              Color = clBtnFace
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              Lines.Strings = (
                'Memo1')
              ParentFont = False
              TabOrder = 0
            end
          end
          object Panel25: TPanel
            Left = 1
            Top = 372
            Width = 583
            Height = 24
            Align = alBottom
            ParentBackground = False
            TabOrder = 1
            object Label64: TLabel
              Left = 8
              Top = 8
              Width = 34
              Height = 13
              Caption = 'Notes:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object dbgCategoryDetails: TDBGrid
            Left = 1
            Top = 1
            Width = 479
            Height = 371
            Align = alClient
            DrawingStyle = gdsGradient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            ParentFont = False
            TabOrder = 2
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -12
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            OnDrawColumnCell = dbgCategoryDetailsDrawColumnCell
            OnDblClick = dbgCategoryDetailsDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Category_Description'
                Title.Caption = 'Category'
                Width = 308
                Visible = True
              end>
          end
          object Panel22: TPanel
            Left = 480
            Top = 1
            Width = 104
            Height = 371
            Align = alRight
            ParentBackground = False
            TabOrder = 3
            object Button1: TButton
              Left = 16
              Top = 16
              Width = 75
              Height = 25
              Caption = 'Use'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = Button1Click
            end
            object Button3: TButton
              Left = 16
              Top = 56
              Width = 75
              Height = 25
              Caption = 'Not Used'
              TabOrder = 1
              OnClick = Button3Click
            end
            object Button5: TButton
              Left = 16
              Top = 96
              Width = 75
              Height = 25
              Caption = 'We Supply'
              TabOrder = 2
              OnClick = Button5Click
            end
            object Button6: TButton
              Left = 16
              Top = 136
              Width = 75
              Height = 25
              Caption = 'Don'#39't Supply'
              TabOrder = 3
              OnClick = Button6Click
            end
            object btnCategoryNotes: TButton
              Left = 16
              Top = 184
              Width = 75
              Height = 25
              Caption = 'Notes'
              TabOrder = 4
              OnClick = btnCategoryNotesClick
            end
            object Button8: TButton
              Left = 16
              Top = 224
              Width = 75
              Height = 25
              Caption = 'Sweep'
              TabOrder = 5
              OnClick = Button8Click
            end
          end
        end
        object Panel23: TPanel
          Left = 585
          Top = 25
          Width = 192
          Height = 589
          Align = alLeft
          ParentBackground = False
          TabOrder = 2
          object Label62: TLabel
            Left = 8
            Top = 22
            Width = 57
            Height = 13
            Caption = 'Colour Key'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label63: TLabel
            Left = 8
            Top = 63
            Width = 93
            Height = 13
            Caption = 'Used by Customer'
          end
          object Label65: TLabel
            Left = 8
            Top = 95
            Width = 114
            Height = 13
            Caption = 'Not used by Customer'
          end
          object Label66: TLabel
            Left = 8
            Top = 127
            Width = 55
            Height = 13
            Caption = 'We Supply'
          end
          object Edit2: TEdit
            Left = 120
            Top = 59
            Width = 65
            Height = 21
            Color = clYellow
            TabOrder = 0
            Text = 'Direct Mail'
          end
          object Edit3: TEdit
            Left = 120
            Top = 91
            Width = 65
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = [fsStrikeOut]
            ParentFont = False
            TabOrder = 1
            Text = 'Direct Mail'
          end
          object Edit4: TEdit
            Left = 120
            Top = 123
            Width = 65
            Height = 21
            Color = clGreen
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = 'Direct Mail'
          end
        end
      end
    end
    object pnlFooter: TPanel
      Left = 0
      Top = 683
      Width = 1176
      Height = 41
      Align = alBottom
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        1176
        41)
      object DelLabel: TLabel
        Left = 801
        Top = 16
        Width = 109
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Delete these details ?'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 819
      end
      object OKBitBtn: TBitBtn
        Left = 947
        Top = 10
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'OK'
        Default = True
        Glyph.Data = {
          CE070000424DCE07000000000000360000002800000024000000120000000100
          1800000000009807000000000000000000000000000000000000007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F7F00007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F007F7F007F7F7F0000007F00007F007F0000007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F7F0000007F00007F00007F0000
          7F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F000000
          7F00007F00007F00007F00007F00007F007F0000007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F
          7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F7F0000007F00007F00007F0000FF00007F00007F00007F00007F00
          7F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFF
          FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7FFFFFFF007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F00007F00007F0000FF00007F7F
          00FF00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F007F7F7F7F7FFFFFFF007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F00
          7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00
          007F0000FF00007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F00
          7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F00FF
          00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F
          7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF0000
          7F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F
          7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00
          007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFF
          FFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F00FF00007F00007F007F0000007F7F007F7F007F7F007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F
          7F7FFFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00007F
          00007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F}
        NumGlyphs = 2
        TabOrder = 4
        OnClick = OKBitBtnClick
      end
      object CancelBitBtn: TBitBtn
        Left = 1027
        Top = 10
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = 'Cancel'
        Glyph.Data = {
          CE070000424DCE07000000000000360000002800000024000000120000000100
          1800000000009807000000000000000000000000000000000000007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
          7F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F0000FF7F7F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF007F7F
          007F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F
          7F007F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F00
          00FF00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
          FFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7FFFFFFF7F7F7F7F7F7FFFFF
          FF007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00
          007F7F7F7F007F7F0000FF00007F00007F00007F00007F7F7F7F007F7F007F7F
          007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7FFFFF
          FF7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F00
          7F7F0000FF00007F00007F00007F00007F7F7F7F00007F00007F00007F00007F
          00007F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F
          7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF00
          7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00007F
          00007F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F00
          7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          0000FF00007F00007F00007F00007F00007F00007F7F7F7F007F7F007F7F007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F00
          7F7F007F7F007F7F007F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F00007F00007F00007F00007F00007F7F7F
          7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
          7F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
          7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F0000FF00007F00007F00007F00007F00007F7F7F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
          007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F
          7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F7F7F7F00007F00
          007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00
          007F7F7F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F7F7F7FFFFF
          FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F0000FF00007F00007F7F7F7F007F7F007F7F007F7F0000FF00007F00007F
          00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
          7F007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F007F7F007F7F007F7F
          007F7F007F7F0000FF00007F00007F00007F007F7F007F7F007F7F007F7F007F
          7F007F7F7F7F7FFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F7F7F7FFFFFFF00
          7F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F0000FF007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F00
          7F7F007F7F007F7F7F7F7FFFFFFFFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F7F7F7F
          007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
          7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
          007F7F007F7F007F7F007F7F007F7F007F7F}
        ModalResult = 2
        NumGlyphs = 2
        TabOrder = 5
        OnClick = CancelBitBtnClick
      end
      object PrintBitBtn: TBitBtn
        Left = 9
        Top = 10
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Print'
        TabOrder = 0
        OnClick = PrintBitBtnClick
      end
      object ActiveChkBox: TCheckBox
        Left = 112
        Top = 16
        Width = 127
        Height = 17
        Hint = 'Customers Account  Open  ?'
        Caption = 'Customer Is Active'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object DelivNotesBitBtn: TBitBtn
        Left = 343
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Delivery'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
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
        ParentFont = False
        TabOrder = 3
        OnClick = DelivNotesBitBtnClick
      end
      object NotesBitBtn: TBitBtn
        Left = 238
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Notes'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
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
        ParentFont = False
        TabOrder = 2
        OnClick = NotesBitBtnClick
      end
    end
    object pnlHeader: TPanel
      Left = 0
      Top = 0
      Width = 1176
      Height = 41
      Align = alTop
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        1176
        41)
      object Label19: TLabel
        Left = 7
        Top = 12
        Width = 84
        Height = 13
        Caption = 'Company Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object NameEdit: TEdit
        Left = 108
        Top = 8
        Width = 531
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
        MaxLength = 100
        TabOrder = 0
        Text = 'NameEdit'
        OnChange = NameEditChange
        OnExit = NameEditExit
      end
    end
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 312
    Top = 216
  end
  object FlashDelivTimer: TTimer
    Enabled = False
    OnTimer = FlashDelivTimerTimer
    Left = 464
    Top = 120
  end
  object pmnuDocuments: TPopupMenu
    OnPopup = pmnuDocumentsPopup
    Left = 734
    Top = 118
    object CreateExcelDocument1: TMenuItem
      Caption = 'Create Excel Document'
      OnClick = btnWordClick
    end
    object CreateWordDocument1: TMenuItem
      Caption = 'Create Word Document'
      OnClick = btnWordClick
    end
    object Email1: TMenuItem
      Caption = 'Create Email'
      OnClick = btnEmailClick
    end
    object Adddocument1: TMenuItem
      Caption = 'Attach Document'
      OnClick = btnAttachClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
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
  object svDlgOfficeDoc: TSaveDialog
    Left = 401
    Top = 294
  end
  object imgDocuments: TImageList
    Left = 176
    Top = 204
  end
  object imgIcons: TImageList
    Left = 296
    Top = 444
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF800180038003FFFF0000
      80018001FFFFC1FF8001800100009CFF800180010000BE7F800180010000B83F
      800180010000921F800180010000C30F800180010000E187800180010000F0C7
      800180010000F867800180010000FC33800180010000FE3B800180010000FF39
      80018001FFFFFF9BC007C007FFFFFFC700000000000000000000000000000000
      000000000000}
  end
  object DocOpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofAllowMultiSelect, ofEnableSizing]
    Left = 408
    Top = 344
  end
  object imglstjobs: TImageList
    Left = 320
    Top = 344
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00000000000000FF000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF00000000000000FFFFFF0000000000FF0000000000
      00000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000FFFFFF0000000000FFFFFF0000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FF00000000000000000000000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF0000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FF000000000000000000000000000000BFBFBF00FFFFFF00BFBF
      BF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBF
      BF00FFFFFF000000FF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF0000000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FF0000000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
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
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      00007F7F7F007F7F7F007F7F7F0000FFFF0000FFFF007F7F7F007F7F7F007F7F
      7F007F7F7F0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F0000000000000000007F7F7F00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00007F7F7F007F7F7F0000FFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00007F7F7F0000FFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000
      00000000FF0000000000000000007F7F7F000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      00007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000000000000000FFFF
      FF00BFBFBF00BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F0000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00000000000000000000000000FFFFFF0000000000BFBF
      BF00FFFFFF0000000000FFFFFF000000000000000000000000007F7F7F000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF800100000000FE3F000000000000
      F81F000000000000F40F000000000000E0070000000000008003000000000000
      400100000000000000000000000000000000E007000000008001E00700000000
      C003E00700000000E00FE00700000000F07FE00F00000000F8FFE01F00000000
      FFFFE03F00000000FFFFE07F00000000FF7EFC00FC00E00F9001FC00FC00E00F
      C0032000FC00E00FE0030000FC00E00FE00300000000E00FE00300000000E00F
      E00300000000E00F000100000000A00B800000000023C007E00700000001E00F
      E00FE0000000E00FE00FF8000023C007E027F0000063C007C073E00100C3C007
      9E79C4030107F83F7EFEEC0703FFF83F00000000000000000000000000000000
      000000000000}
  end
  object imgEnquiries: TImageList
    Left = 352
    Top = 80
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000FFFF00007F7F7F0000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF00000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000FFFFFF000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF00000000000000FFFF007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000FFFF0000FFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFF00000000
      000000FFFF000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFF00000000000000FFFF007F7F7F00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFF00000000000000FFFF007F7F7F00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000000000FFFF00000000000000FFFF007F7F7F00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000FFFF00000000000000000000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000FFFF007F7F7F00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000FFFF007F7F7F00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000FFFF007F7F7F00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FFFF000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
      00007F7F7F007F7F7F0000000000000000007F7F7F0000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F00000000007F7F7F00000000007F7F7F00000000000000000000FF
      FF00000000000000000000000000000000000000000000FFFF007F7F7F007F7F
      7F0000000000000000007F7F7F007F7F7F0000FFFF0000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F00000000007F7F7F00000000007F7F7F0000000000000000000000
      00000000FF000000000000000000000000000000000000FFFF0000FFFF007F7F
      7F0000000000000000007F7F7F0000FFFF0000FFFF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F0000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
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
      00000000000000000000000000000000000000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F0000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000000000000000
      0000000000007F7F7F0000000000000000000000000000000000000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000000000000000
      000000000000000000007F7F7F00FFFFFF0000000000FFFFFF007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF000000FF000000FF000000FF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF000000000000000000000000000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF000000000000000000000000000000000000000000BFBFBF00FFFFFF00BFBF
      BF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBF
      BF00FFFFFF000000FF00FFFFFF0000000000000000007F7F7F00000000007F7F
      7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007F7F7F00000000007F7F7F0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF000000000000000000000000000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF007F7F7F00000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF000000FF0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF007F7F7F007F7F
      7F007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF00FF00000000FF000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000000000000000000000000000000000007F7F7F00000000007F7F
      7F00FFFFFF00FFFFFF0000000000FFFFFF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF007F7F7F00000000007F7F7F0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF0000FF00000000FF0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000FFFF000000000000FFFF000000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F00FFFFFF000000FF00FFFFFF007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00FFFFFF0000000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      000000000000000000007F7F7F000000000000000000000000007F7F7F000000
      000000000000000000007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000FFFF0000FFFF000000
      00007F7F7F007F7F7F007F7F7F0000FFFF0000FFFF007F7F7F007F7F7F007F7F
      7F007F7F7F0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF0000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F0000000000000000007F7F7F00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00007F7F7F007F7F7F0000FFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00007F7F7F0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000
      00000000FF0000000000000000007F7F7F000000000000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F7F000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00BFBFBF00BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000BFBF
      BF00FFFFFF0000000000FFFFFF000000000000000000000000007F7F7F000000
      FF000000FF000000FF0000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF0000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00803FFC0000000000001FFC0000000000
      0004FC0000000000000000000000000000000001000000000000000300000000
      0000000700000000000000070000000000000023000000000000000100000000
      0007000000000000001F002300000000000F0023000000008007002300000000
      80230007000000005577003F000000008001FFFFFFFFC0070000F80FFFFFC007
      0000F0070000C0070000E0030000C0070000C0010000C007000080000000C007
      000080000000C007000080000000C007E00780000000C007E00780000000C007
      E007C0010000C007E007E003FFFFC007E00FC001FFFFC007E01FC809FFFFC007
      E03FFF7FFFFFC007E07FFE3FFFFFC007FF7EFC00E00FFC009001FC00E00FFC00
      C0032000E00FFC00E0030000E00FFC00E0030000E00F0000E0030000E00F0000
      E0030000E00F000000010000A00B000080000000C0070023E0070000E00F0001
      E00FE000E00F0000E00FF800C0070023E027F000C0070063C073E001C00700C3
      9E79C403F83F01077EFEEC07F83F03FF00000000000000000000000000000000
      000000000000}
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 325
    OnTimer = tmrSearchTimer
    Left = 312
    Top = 272
  end
  object imglstOrders: TImageList
    Left = 296
    Top = 392
    Bitmap = {
      494C01010E001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF007F7F7F000000000000000000000000007F7F7F00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000BFBFBF00FFFFFF00FFFFFF00FFFFFF00BFBFBF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000FFFFFF007F7F
      7F00BFBFBF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF007F7F
      7F00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000FF000000000000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000FFFFFF007F7F
      7F00BFBFBF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00BFBFBF007F7F
      7F00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000BFBFBF00FFFFFF0000000000FFFFFF00BFBFBF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF007F7F7F000000000000000000000000007F7F7F00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00BFBFBF00BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
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
      000000000000000000000000000000000000000000007F7F7F00000000007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF00000080000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBFBF007F7F7F00000000007F7F
      7F00000000000000000000000000000000000000000000000000000000007F7F
      7F00000000007F7F7F000000000000000000000000007F7F7F00000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF00000080000000FF0000000000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F7F7F000000000000000000000000007F7F7F007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000007F7F7F0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000080000000FF000080800000808000000000000000000000FFFF00BFBF
      BF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF000000
      00000000000000000000000000000000000000000000FFFFFF007F7F7F007F7F
      7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F00FFFFFF0000000000BFBFBF00BFBFBF007F7F7F000000
      0000000000007F7F7F0000000000000000000000000000000000000000007F7F
      7F0000000000000000007F7F7F007F7F7F0000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000080000000FF0000808000008080000000000000FFFF000000000000FF
      FF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F0000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      FF00000080000000FF00008080000000000000000000FFFFFF0000FFFF000000
      000000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBF
      BF0000FFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F0000000000000000007F7F
      7F00000000007F7F7F0000000000000000000000000000000000000000000000
      000000000000BFBFBF00000000007F7F7F00000000007F7F7F00000000000000
      000000000000FFFFFF00000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF007F7F7F000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F00BFBFBF0000000000BFBFBF0000000000000000007F7F7F000000
      0000FFFFFF00000000007F7F7F00000000000000000000000000000080000000
      80000000800000008000000080000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF007F7F7F000000
      00007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF00000000007F7F7F000000000000000000000000000000
      0000000000007F7F7F0000000000000000000000000000808000008080000080
      8000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF000000000000000000000000007F7F7F00FFFF
      0000FFFF0000FFFF000000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000007F7F7F00000000000000
      00007F7F7F0000000000000000007F7F7F00000000007F7F7F00000000000000
      0000000000007F7F7F00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000080800000808000008080000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F0000000000000000000000
      00007F7F7F000000000000000000000000007F7F7F0000000000000000007F7F
      7F0000000000000000007F7F7F00BFBFBF000000000000000000000000000000
      0000000000000000000000000000008080000080800000808000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF000000000000000000000000007F7F7F00FFFF
      0000FFFF0000FFFF000000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F0000000000000000007F7F7F00000000000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000008080000080800000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000007F7F7F000000
      00007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000007F7F7F007F7F7F000000
      000000000000000000007F7F7F007F7F7F000000000000000000000000007F7F
      7F00000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000080800000808000008080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000BFBFBF00000000007F7F
      7F007F7F7F007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808000000000000000000000000000000000007F7F
      7F00000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000007F7F7F00BFBFBF0000000000BFBF
      BF00000000007F7F7F00000000007F7F7F007F7F7F007F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00000000000000000000000000BFBFBF00000000007F7F
      7F00BFBFBF007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000000
      00000000000000000000000000007F7F7F000000000000000000000000007F7F
      7F00000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000007F7F7F00BFBFBF000000
      000000000000000000007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F00BFBFBF007F7F7F00000000007F7F7F00BFBFBF007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF007F7F7F00000000007F7F7F00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      80000000000000000000000000000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F00BFBFBF00BFBFBF0000000000BFBFBF00BFBFBF007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000080000000
      8000000080000000800000008000000080000000800000008000000000000000
      80000000800000000000000000000000000000000000BFBFBF00FFFFFF00BFBF
      BF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBF
      BF00FFFFFF000000FF00FFFFFF000000000000000000FFFFFF00BFBFBF00BFBF
      BF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00FFFFFF00FFFFFF00FFFF
      FF00BFBFBF00BFBFBF00FFFFFF0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000800000008000000000000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00BFBFBF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007F7F7F00000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F000000000000000000000000007F7F7F007F7F
      7F007F7F7F007F7F7F00000000000000000000000000000000007F7F7F000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000800000008000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00BFBFBF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000008000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000FF00FFFFFF00FFFFFF00FFFFFF0000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF007F7F7F0000000000000000000000000000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BFBFBF000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF007F7F7F0000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF00000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      000000000000BFBFBF000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F00BFBFBF00000000000000000000000000BFBFBF007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
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
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      00007F7F7F007F7F7F007F7F7F0000FFFF0000FFFF007F7F7F007F7F7F007F7F
      7F007F7F7F0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F0000000000000000007F7F7F000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00007F7F7F007F7F7F0000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00007F7F7F0000FFFF0000FFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00000000000000000000FFFF0000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000
      00000000FF0000000000000000007F7F7F0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF000000FF000000FF00000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00000000000000FF000000
      FF000000FF000000FF000000FF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000FFFFFF0000000000BFBF
      BF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00000000000000000000000000FFFFFF0000000000BFBF
      BF00FFFFFF0000000000FFFFFF000000000000000000000000007F7F7F000000
      FF000000FF000000FF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00E00F800300000000E00F800300000000
      E00F800300000000E00F800300000000E00F800300000000E00F800300000000
      E00F800300000000A00B800300000000C007800300000000E00F800300000000
      E00F800300000000C007800300000000C007800300000000C007800700000000
      F83F800F00000000F83F801F0000000081FEF862FFFF800001E280E0801F0000
      07E001E00000000003E001E00000000003F031E10000000023C031C100000000
      3FC0C18100000000E3C0C307000000002230FE17000000000020CC3780008000
      0020A8778000C000006240F7FC00F000001E01E3FC01FC00001FC1E3FC03FC01
      001FC0E3FC07FC03007FC83FFFFFFC078001FFFFFC1FFFFF0000FFFFF007E01F
      0000CFF3E003C00F000087E1C001800700000000C001000300000000C0010001
      00000000C001800000000001C001C000E0070003E003E000E0070007F1C7F000
      E007000FF1C7F801E007FE8BF1C7FC01E00FFFDFF007FE01E01FFF77F80FFF1F
      E03FFFDFFC1FFFFFE07FFFFFFFFFFFFFFF7EFC00FC00FFDF9001FC00FC00FFCF
      C0032000FC00FFC7E0030000FC000003E003000000000001E003000000000000
      E00300000000000100010000000000038000000000230007E00700000001000F
      E00FE0000000001FE00FF8000023007FE027F000006300FFC073E00100C301FF
      9E79C403010703FF7EFEEC0703FFFFFF00000000000000000000000000000000
      000000000000}
  end
  object imglstMaint: TImageList
    Left = 296
    Top = 496
    Bitmap = {
      494C01010D000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
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
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF000000000000FFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000FFFF00FFFFFF0000FFFF000000000000FFFF000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000000000FFFF
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FF000000FFFFFF00FF000000FF00000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF0000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF000000FF000000FF000000FF00BFBF
      BF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000FFFF0000FFFF0000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FF000000FFFFFF00FF000000FF00000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      00000000000000FFFF00000000000000000000000000FFFF0000FFFF0000FFFF
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FF000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF00000000000000000000FFFF0000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF000000000000000000FFFF0000FFFF0000FFFF00000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FF000000FFFFFF0000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FFFF00000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000FFFF00000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FF000000FF000000FFFFFF00FFFFFF0000000000BFBFBF00FFFFFF00BFBF
      BF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBF
      BF00FFFFFF000000FF00FFFFFF0000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF0000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFF
      FF00FF000000FF000000FFFFFF00FFFFFF0000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF0000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000BFBFBF0000000000BFBFBF0000000000BFBFBF0000000000BFBF
      BF00000000000000000000000000000000000000000000000000FFFF0000FFFF
      000000000000FFFF0000BFBFBF0000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000000000000000000000FFFF000000
      000000FFFF00FFFFFF0000000000FFFFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF000000000000BFBFBF000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000FFFFFF0000FF
      FF000000000000FFFF00FFFFFF0000000000FFFFFF0000FFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00FFFFFF0000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000FFFF000000000000FFFF000000000000BFBF
      BF00000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF00000000000000000000FF000000FF000000000000000000
      000000000000000000000000000000FFFF00FFFFFF000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF0000000000000000000000000000000000000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF00000000000000000000FF000000FF0000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF00FFFF
      FF000000FF000000FF00FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000000000000000FF000000
      FF0000000000000000000000000000000000FFFFFF000000FF000000FF00FFFF
      FF000000FF000000FF00FFFFFF00FFFFFF000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00FFFFFF0000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000FF000000FF0000000000FF00
      0000FF000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF000000FF000000FF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000FF000000FF0000000000FF00
      0000FF000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF00FFFFFF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F000000000000000000000000000000FF000000FF0000000000000000000000
      00007F7F7F007F7F7F0000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000007F7F7F007F7F7F0000FFFF0000FFFF0000FFFF007F7F7F007F7F
      7F000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BFBFBF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F00FFFF
      FF00FFFFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF000000000000000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00000000000000000000000000000000007F7F7F007F7F
      7F000000000000000000000000000000FF000000FF0000000000000000000000
      00007F7F7F007F7F7F0000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF007F7F7F007F7F7F00FFFFFF007F7F7F00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000FFFF007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF0000000000000000007F7F7F0000FFFF007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F7F7F007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F
      7F00000000000000000000000000000000000000000000000000000000007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000000000000000
      00007F7F7F00000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF000000
      00007F7F7F007F7F7F007F7F7F0000FFFF0000FFFF007F7F7F007F7F7F007F7F
      7F007F7F7F0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF00000000000000000000FFFF0000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF000000000000FFFF00000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      000000000000FFFF0000BFBFBF0000000000000000000000000000000000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF000000000000BFBFBF000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00BFBFBF00BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F00000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF00000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF000000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF00000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFF0000000000008017000000000000
      FFF7000000000000FE63000000000000FC03000000000000F803000000000000
      F003000000000000F003000000000000E003000000000000C003000000000000
      80030000000000000003000000000000000300000000000001E3000000000000
      83E3000000000000C7E3000000000000C007C003FFFF8001C007C003C6000000
      C007C00382000000C007C00300000000C007C00300000000C007C00300000000
      C007C00380000000C007C00380000000C007C0038000E007C007C0038000E007
      C007C003C800E007C007C0033C00E007C007C0030E00E00FC007C003CE00E01F
      C007C0032600E03FC007C0032600E07F83C0F0078001FE7F0000C0030000FE1F
      000080030000FC07866180030000FC01866180030000F800FE7F80030000F800
      0240800300000000000080030000000000008003000000018661800300000032
      866180038001003EF81F8003C003003EF81F8003C003003EF81FB007C003001D
      FC3FD007C0030023FC3FEAAFC003003FFF7EFC00E00FC0039001FC00E00FC003
      C0032000E00FC003E0030000E00FC003E0030000E00FC003E0030000E00FC003
      E0030000E00FC00300010000A00BC00380000000C007C003E0070000E00FC003
      E00FE000E00FC003E00FF800C007C003E027F000C007C003C073E001C007C003
      9E79C403F83FC0037EFEEC07F83FC00300000000000000000000000000000000
      000000000000}
  end
  object imglstFunctions: TImageList
    Left = 296
    Top = 544
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      0000FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F7F000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00BFBFBF00BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
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
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF0000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00000000000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000000000000000BFBFBF00FFFFFF00BFBF
      BF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBF
      BF00FFFFFF000000FF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00000000000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF000000000000FFFF0000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000BFBF
      BF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFE00FFC000000E007E00FF0000000
      E007E00FC0000000E007E00F00000000E007E00F00000000E007E00F00000000
      E007E00F00000000E007A00B00000000E007C00700000000E007E00F00000000
      E007E00F00010000E00FC00700030000E01FC00700070000E03FC007001F0000
      FFFFF83F007F0000FFFFF83F01FF0000FF7EFC00FFDF80019001FC00FFCF0000
      C0032000FFC70000E003000000030000E003000000010000E003000000000000
      E0030000000100000001000000030000800000000007E007E0070000000FE007
      E00FE000001FE007E00FF800007FE007E027F00000FFE00FC073E00101FFE01F
      9E79C40303FFE03F7EFEEC07FFFFE07F00000000000000000000000000000000
      000000000000}
  end
  object pmnStockEnquiry: TPopupMenu
    Left = 792
    Top = 152
    object StockMovements2: TMenuItem
      Caption = 'Stock Movements'
      OnClick = StockMovements2Click
    end
    object Numbersequences1: TMenuItem
      Caption = 'Number sequences'
      OnClick = Numbersequences1Click
    end
    object BinLocations1: TMenuItem
      Caption = 'Bin Locations'
      OnClick = BinLocations1Click
    end
    object SalesOrdersCallOffs1: TMenuItem
      Caption = 'Sales Orders/Call Offs'
      OnClick = SalesOrdersCallOffs1Click
    end
    object ProductionOrders2: TMenuItem
      Caption = 'Production Orders'
      OnClick = ProductionOrders2Click
    end
    object PurchaseOrders2: TMenuItem
      Caption = 'Purchase Orders'
      OnClick = PurchaseOrders2Click
    end
  end
  object pmnOrderAdd: TPopupMenu
    Left = 632
    Top = 120
    object btnFromPO: TMenuItem
      Caption = '... production order'
      OnClick = btnFromPOClick
    end
    object btnFromSO: TMenuItem
      Caption = '... sales order'
      OnClick = btnFromSOClick
    end
  end
  object pmnOrderPicking: TPopupMenu
    Left = 640
    Top = 264
    object btnPrintPickNote: TMenuItem
      Caption = 'Print picking note'
      OnClick = btnPrintPickNoteClick
    end
    object btnConfirmPick: TMenuItem
      Caption = 'Confirm picking details'
      OnClick = btnConfirmPickClick
    end
  end
  object pmnOrderProofs: TPopupMenu
    Left = 640
    Top = 224
    object Approvalform1: TMenuItem
      Caption = 'Approval form'
      OnClick = Approvalform1Click
    end
    object btnStatus1: TMenuItem
      Caption = 'Status'
      OnClick = btnStatus1Click
    end
  end
  object pmnOrderAllocate: TPopupMenu
    OnPopup = pmnOrderAllocatePopup
    Left = 680
    Top = 184
    object mnuAllocate: TMenuItem
      Caption = 'Allocate'
      OnClick = mnuAllocateClick
    end
    object mnuDeAllocate: TMenuItem
      Caption = 'De-allocate'
      OnClick = mnuDeAllocateClick
    end
  end
  object imglstButtons: TImageList
    Left = 80
    Top = 216
    Bitmap = {
      494C01010B000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000FFFFFF00FFFFFF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000FFFFFF00FFFF
      FF00FFFFFF008000000080000000800000008000000080000000C0C0C000C0C0
      C000C0C0C000C0C0C000FFFFFF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000C0C0C000C0C0C000C0C0C0000000FF000C0C0C000071B6000077BF000077
      BF000077BF000077BF000077BF000077BF000077BF000077BF000077BF000077
      BF000077BF000077BF0000355500D4D4D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000800000008000
      0000800000008000000000808000800000008000000080000000800000008000
      000080000000C0C0C000C0C0C0000000FF0000659A0000A7FF0000A7FF0000A7
      FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7FF0000A7
      FF0000A7FF0000A7FF0000A7FF00232323000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000800000008000
      000080000000800000000080800080000000FF00000080000000800000008000
      000080000000C0C0C000C0C0C0000000FF00006A9F0000ACFB0000AFFF0000AF
      FF0000AFFF0000AFFF0000AFFF000077CE000096EA0000AFFF0000AFFF0000AF
      FF0000AFFF0000AFFF0000A6FA00202020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000008080800080000000800000008000
      000080000000008080000080800000808000FF000000FF00000080000000FF00
      00008000000000808000C0C0C0000000FF00006E9F0000B0FF0000B4F90000B8
      FF0000B8FF0000B8FF00009BCD0000EBFF0000EDFD00008FE00000B8FF0000B8
      FF0000B8FF0000A6F40000B0FF00202020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000008080800080000000800000008000
      000080000000008080000080800000808000FF000000FF000000FF000000FF00
      00008000000000808000C0C0C0000000FF0000729F0000B7FF0000B7FF0000BC
      F80000C0FF00008CC40000E2FF0000E2FF0000E2FF0000E3FE0000ACF20000C0
      FF0000A5EA0000B7FF0000B7FF00202020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000008080800080000000800000008000
      0000800000000080800000808000FF000000FF000000FF000000FF0000000080
      80000080800000808000C0C0C0000000FF0000779F0000BEFF0000BEFF0000BE
      FE000086BE0000D9FF0000D9FF0000D9FF0000D9FF0000D9FF0000D8FC00009A
      DA0000BEFF0000BEFF0000BEFF00202020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000008080800080000000800000008000
      00008000000000808000FF000000FF000000FF000000FF000000FF0000000080
      80000080800000808000C0C0C0000000FF00007E9F0000CAFF0000CAFF000091
      CA0000D0FF0000D0FF0000D0FF0000D0FF0000D0FF0000D0FF0000D0FF0000CC
      FA0000CAFE0000CAFF0000CAFF00202020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000008080800080808000800000008000
      000080000000008080000080800000808000FF000000FF000000FF000000FF00
      000080000000C0C0C000FFFFFF000000FF0000849F0000D4FF0000ADDD0000C6
      FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6FF0000C6
      FF0000C0F80000D4FF0000D4FF00202020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000008080800080808000800000008000
      000000808000008080000080800000808000FF000000FF000000FF0000000080
      800080000000FFFFFF00FFFFFF000000FF00008B9F0000CAEE0000BDFF0000BD
      FF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BDFF0000BD
      FF0000BDFF0000BAF80000DFFF00202020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      FF00000000000000000000000000000000008080800080808000808080008000
      00000080800000808000008080000080800000808000FF000000800000000080
      8000FFFFFF00FFFFFF00FFFFFF000000FF00008C9A0000B7FF0000B7FF0000B7
      FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7FF0000B7
      FF0000B7FF0000B7FF0000BFFA00202020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F000000FF000000000000000000000000008080800080808000808080008080
      8000808080008000000000808000800000008000000080000000808080008080
      800080808000FFFFFF00FFFFFF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000202020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000FFFFFF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000808080000000FF000000000000000000000000000000
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
      00000000000000000000000000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000000000000000
      0000000000000000000000000000FF00000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      00007F7F7F007F7F7F0000000000000000000000000000000000000000000080
      80000080800000808000008080000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00BFBFBF00BFBFBF00000000000000000000000000000000000000
      000000000000FF000000FF00000000000000FFFFFF0000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      00007F7F7F0000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF00000000000080
      800000FFFF000080800000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000FFFFFF0000000000FFFFFF0000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000000000000000000000FFFF000000
      00007F7F7F007F7F7F00000000000000000000000000000000000000000000FF
      FF000080800000FFFF00008080000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF0000000000000000000000000000000000FF00
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BFBFBF0000000000000000000000000000FFFF000000
      00007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000FF
      FF0000FFFF000080800000FFFF000000000000000000BFBFBF00FFFFFF00BFBF
      BF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBF
      BF00FFFFFF000000FF00FFFFFF000000000000000000FF000000FF0000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF0000000000FF00000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FFFF000000
      00007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000FF
      FF0000FFFF0000FFFF00008080000000000000000000FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFFFF00BFBFBF00FFFF
      FF00BFBFBF00FFFFFF00BFBFBF0000000000FF0000000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FF000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000000000000000000000FFFF000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FFFF000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF000000000000000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      00007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F0000FFFF007F7F7F0000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      800000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF0000000000000000007F7F7F0000FFFF007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000080800000FFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000080
      800000FFFF000080800000FFFF00000000000000000000000000000000000000
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
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      00007F7F7F007F7F7F007F7F7F0000FFFF0000FFFF007F7F7F007F7F7F007F7F
      7F007F7F7F0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF007F7F7F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F7F
      7F0000000000000000007F7F7F00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00007F7F7F007F7F7F0000FFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00007F7F7F0000FFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000000000000000FFFFFF0000000000000000000000
      00000000FF0000000000000000007F7F7F000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF0000000000BFBFBF00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000FFFFFF0000000000BFBFBF00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      00007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000FF000000000000000000000000000000000000000000FFFF
      FF00BFBFBF00BFBFBF00BFBFBF007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F0000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00000000000000000000000000FFFFFF0000000000BFBF
      BF00FFFFFF0000000000FFFFFF000000000000000000000000007F7F7F000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F0000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFF0000FFFF0000FFFF0000FFFF0000
      F9FF0000FFFF0000F0FF000000000000F0FF000000000000E07F000000000000
      C07F000000000000843F0000000000001E3F000000000000FE1F000000000000
      FF1F000000000000FF8F000000000000FFC7000000000000FFE3000000000000
      FFF80000FFFF0000FFFF0000FFFF00008001FFFFFE7F8FC00000FE3FFE1F8000
      0000F81FFC0780000000F40FFC0100000000E007F800800000008003F8008000
      00004001000080000000000000008A80E007000000018A80E007800100328A80
      E007C003003E8000E007E00F003E8A80E00FF07F003E8FC0E01FF8FF001DFFC0
      E03FFFFF0023FFC0E07FFFFF003FFFC0FF7EFC00FC00E00F9001FC00FC00E00F
      C0032000FC00E00FE0030000FC00E00FE00300000000E00FE00300000000E00F
      E00300000000E00F000100000000A00B800000000023C007E00700000001E00F
      E00FE0000000E00FE00FF8000023C007E027F0000063C007C073E00100C3C007
      9E79C4030107F83F7EFEEC0703FFF83F00000000000000000000000000000000
      000000000000}
  end
  object DropComboTarget1: TDropComboTarget
    DragTypes = [dtCopy, dtLink]
    OnDrop = DropComboTarget1Drop
    Target = pgCustomer
    Left = 534
    Top = 234
  end
end
