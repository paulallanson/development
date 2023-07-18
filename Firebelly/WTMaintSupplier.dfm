object frmWTMaintSupplier: TfrmWTMaintSupplier
  Left = 436
  Top = 74
  Caption = 'Supplier Details'
  ClientHeight = 516
  ClientWidth = 1004
  Color = clBtnFace
  Constraints.MinHeight = 555
  Constraints.MinWidth = 1020
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 497
    Width = 1004
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 455
    Width = 1004
    Height = 42
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      1004
      42)
    object lblDelete: TLabel
      Left = 655
      Top = 15
      Width = 163
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Delete the selected record ?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOK: TBitBtn
      Left = 834
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 920
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      NumGlyphs = 2
      TabOrder = 2
      OnClick = BitBtn2Click
    end
    object chkbxInactive: TCheckBox
      Left = 13
      Top = 13
      Width = 244
      Height = 17
      Caption = 'Make this supplier inactive'
      TabOrder = 0
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 1004
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 20
      Width = 33
      Height = 13
      Caption = 'Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtSupplierName: TEdit
      Left = 88
      Top = 16
      Width = 233
      Height = 21
      TabOrder = 0
      Text = 'edtSupplierName'
      OnChange = EnableOK
    end
  end
  object pgDetails: TPageControl
    Left = 0
    Top = 49
    Width = 1004
    Height = 406
    ActivePage = tsProducts
    Align = alClient
    TabOrder = 1
    object tsDetails: TTabSheet
      Caption = 'Details'
      object Label2: TLabel
        Left = 24
        Top = 19
        Width = 35
        Height = 13
        Caption = 'Street'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 24
        Top = 67
        Width = 27
        Height = 13
        Caption = 'Town'
      end
      object Label6: TLabel
        Left = 24
        Top = 91
        Width = 54
        Height = 13
        Caption = 'Postcode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 24
        Top = 115
        Width = 33
        Height = 13
        Caption = 'County'
      end
      object Label7: TLabel
        Left = 24
        Top = 148
        Width = 37
        Height = 13
        Caption = 'Phone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 24
        Top = 172
        Width = 17
        Height = 13
        Caption = 'Fax'
      end
      object Label9: TLabel
        Left = 24
        Top = 200
        Width = 64
        Height = 13
        Caption = 'Web Address'
      end
      object Label14: TLabel
        Left = 24
        Top = 324
        Width = 68
        Height = 13
        Caption = 'Account Code'
      end
      object Label15: TLabel
        Left = 23
        Top = 293
        Width = 43
        Height = 13
        Caption = 'Leadtime'
      end
      object Label16: TLabel
        Left = 175
        Top = 293
        Width = 22
        Height = 13
        Caption = 'days'
      end
      object Label17: TLabel
        Left = 24
        Top = 227
        Width = 66
        Height = 13
        Caption = 'Email Address'
      end
      object Label18: TLabel
        Left = 23
        Top = 258
        Width = 53
        Height = 13
        Caption = 'Discount %'
      end
      object SpinEdit1: TSpinEdit
        Left = 104
        Top = 288
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 10
        Value = 0
      end
      object edtStreet: TEdit
        Left = 104
        Top = 15
        Width = 233
        Height = 21
        TabOrder = 0
        Text = 'edtStreet'
        OnChange = EnableOK
      end
      object edtLocale: TEdit
        Left = 104
        Top = 39
        Width = 233
        Height = 21
        TabOrder = 1
        Text = 'edtLocale'
      end
      object edtTownCity: TEdit
        Left = 104
        Top = 63
        Width = 233
        Height = 21
        TabOrder = 2
        Text = 'edtTownCity'
      end
      object edtPostcode: TEdit
        Left = 104
        Top = 87
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 3
        Text = 'EDTPOSTCODE'
        OnChange = EnableOK
      end
      object edtCountyState: TEdit
        Left = 104
        Top = 111
        Width = 233
        Height = 21
        TabOrder = 4
        Text = 'edtCountyState'
      end
      object edtTelephoneNumber: TEdit
        Left = 104
        Top = 144
        Width = 169
        Height = 21
        TabOrder = 5
        Text = 'edtTelephoneNumber'
        OnChange = EnableOK
      end
      object edtFaxNumber: TEdit
        Left = 104
        Top = 168
        Width = 169
        Height = 21
        TabOrder = 6
        Text = 'edtFaxNumber'
      end
      object edtWebAddress: TEdit
        Left = 104
        Top = 196
        Width = 265
        Height = 21
        TabOrder = 7
        Text = 'edtWebAddress'
      end
      object edtEmailAddress: TEdit
        Left = 104
        Top = 223
        Width = 265
        Height = 21
        TabOrder = 8
        Text = 'edtEmailAddress'
      end
      object edtDiscountPercentage: TCREditFloat
        Left = 104
        Top = 254
        Width = 65
        Height = 21
        TabOrder = 9
        Text = 'edtDiscountPercentage'
      end
      object edtAccountCode: TEdit
        Left = 104
        Top = 320
        Width = 81
        Height = 21
        TabOrder = 11
        Text = 'edtAccountCode'
        OnChange = EnableOK
      end
    end
    object tsMaterials: TTabSheet
      Caption = 'Material Cost Details'
      ImageIndex = 2
      OnShow = tsMaterialsShow
      object Panel3: TPanel
        Left = 911
        Top = 0
        Width = 93
        Height = 324
        Align = alRight
        TabOrder = 0
        object btnChange: TBitBtn
          Left = 10
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Change'
          TabOrder = 1
          OnClick = btnChangeClick
        end
        object btnDelete: TBitBtn
          Left = 10
          Top = 72
          Width = 75
          Height = 25
          Caption = '&Delete'
          TabOrder = 2
          OnClick = btnDeleteClick
        end
        object btnAdd: TBitBtn
          Left = 10
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          TabOrder = 0
          OnClick = btnAddClick
        end
        object btnMaterials: TBitBtn
          Left = 10
          Top = 144
          Width = 75
          Height = 25
          Caption = '&Materials'
          TabOrder = 4
          OnClick = btnMaterialsClick
        end
        object btnCosts: TBitBtn
          Left = 10
          Top = 109
          Width = 75
          Height = 25
          Caption = '&Costs'
          TabOrder = 3
          OnClick = btnCostsClick
        end
        object btnWorktops: TBitBtn
          Left = 10
          Top = 178
          Width = 75
          Height = 25
          Caption = '&Worktops'
          TabOrder = 5
          OnClick = btnWorktopsClick
        end
      end
      object dbgDetails: TDBGrid
        Left = 0
        Top = 0
        Width = 911
        Height = 324
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgDetailsDrawColumnCell
        OnDblClick = dbgDetailsDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Material_Type_Description'
            Title.Caption = 'Material'
            Width = 125
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Worktop_Group_Description'
            Title.Caption = 'Group'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Worktop_Description'
            Title.Caption = 'Colour'
            Width = 211
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Thickness_mm'
            Title.Caption = 'Thickness (mm)'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Unit_Cost'
            Title.Caption = 'Unit Cost (sq m)'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Effective_Date'
            Title.Caption = 'Effective Date'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Changed'
            Title.Caption = 'Date Changed'
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Operator_Name'
            Title.Caption = 'Operator'
            Visible = True
          end>
      end
      object pnlMaterialsFooter: TPanel
        Left = 0
        Top = 324
        Width = 1004
        Height = 62
        Align = alBottom
        TabOrder = 2
        DesignSize = (
          996
          62)
        object Label3: TLabel
          Left = 8
          Top = 12
          Width = 37
          Height = 13
          Caption = 'Material'
        end
        object Label10: TLabel
          Left = 160
          Top = 12
          Width = 30
          Height = 13
          Caption = 'Colour'
        end
        object Label11: TLabel
          Left = 304
          Top = 12
          Width = 49
          Height = 13
          Caption = 'Thickness'
        end
        object Label12: TLabel
          Left = 448
          Top = 12
          Width = 29
          Height = 13
          Caption = 'Group'
        end
        object Label13: TLabel
          Left = 592
          Top = 12
          Width = 68
          Height = 13
          Caption = 'Effective Date'
        end
        object edtMaterial: TEdit
          Left = 56
          Top = 8
          Width = 85
          Height = 21
          TabOrder = 0
          OnChange = edtMaterialChange
        end
        object Panel4: TPanel
          Left = 892
          Top = 1
          Width = 103
          Height = 60
          Align = alRight
          Alignment = taRightJustify
          BevelOuter = bvNone
          TabOrder = 4
          ExplicitLeft = 900
        end
        object edtColour: TEdit
          Left = 200
          Top = 8
          Width = 85
          Height = 21
          TabOrder = 1
          OnChange = edtColourChange
        end
        object edtThickness: TEdit
          Left = 360
          Top = 8
          Width = 73
          Height = 21
          TabOrder = 2
          OnChange = edtThicknessChange
        end
        object edtGroup: TEdit
          Left = 488
          Top = 8
          Width = 85
          Height = 21
          TabOrder = 3
          OnChange = edtGroupChange
        end
        object btnClear: TBitBtn
          Left = 832
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Cl&ear'
          TabOrder = 5
          OnClick = btnClearClick
        end
        object edtEffectiveDate: TEdit
          Left = 669
          Top = 8
          Width = 85
          Height = 21
          TabOrder = 6
          OnExit = edtEffectiveDateExit
          OnKeyPress = edtEffectiveDateKeyPress
        end
        object btnEffectiveDate: TBitBtn
          Left = 757
          Top = 6
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
          TabOrder = 7
          OnClick = btnEffectiveDateClick
        end
        object BitBtn5: TBitBtn
          Left = 789
          Top = 6
          Width = 25
          Height = 25
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          TabOrder = 8
          OnClick = BitBtn5Click
        end
        object btnSweep: TBitBtn
          Left = 896
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'S&weep'
          TabOrder = 9
          OnClick = btnSweepClick
          ExplicitLeft = 920
        end
        object chkbxShowInactive: TCheckBox
          Left = 9
          Top = 37
          Width = 160
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = 'Show inactive materials'
          TabOrder = 10
          OnClick = chkbxShowInactiveClick
        end
      end
    end
    object tsWorktops: TTabSheet
      Caption = 'Material Summary'
      ImageIndex = 4
      OnShow = tsWorktopsShow
      object Panel2: TPanel
        Left = 0
        Top = 324
        Width = 1004
        Height = 62
        Align = alBottom
        TabOrder = 0
        DesignSize = (
          996
          62)
        object Label20: TLabel
          Left = 8
          Top = 12
          Width = 37
          Height = 13
          Caption = 'Material'
        end
        object Label21: TLabel
          Left = 160
          Top = 12
          Width = 30
          Height = 13
          Caption = 'Colour'
        end
        object Label23: TLabel
          Left = 304
          Top = 12
          Width = 29
          Height = 13
          Caption = 'Group'
        end
        object edtMaterial1: TEdit
          Left = 56
          Top = 8
          Width = 85
          Height = 21
          TabOrder = 0
          OnChange = edtMaterial1Change
        end
        object Panel5: TPanel
          Left = 892
          Top = 1
          Width = 103
          Height = 60
          Align = alRight
          Alignment = taRightJustify
          BevelOuter = bvNone
          TabOrder = 3
          ExplicitLeft = 900
        end
        object edtColour1: TEdit
          Left = 200
          Top = 8
          Width = 85
          Height = 21
          TabOrder = 1
          OnChange = edtColour1Change
        end
        object edtGroup1: TEdit
          Left = 344
          Top = 8
          Width = 85
          Height = 21
          TabOrder = 2
          OnChange = edtGroup1Change
        end
        object BitBtn1: TBitBtn
          Left = 832
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Cl&ear'
          TabOrder = 4
          OnClick = BitBtn1Click
        end
        object CheckBox1: TCheckBox
          Left = 9
          Top = 37
          Width = 160
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = 'Show inactive materials'
          TabOrder = 5
          OnClick = CheckBox1Click
        end
      end
      object Panel7: TPanel
        Left = 903
        Top = 0
        Width = 93
        Height = 316
        Align = alRight
        TabOrder = 1
        ExplicitLeft = 911
        ExplicitHeight = 324
        object btnChangeWorktop: TBitBtn
          Left = 10
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Change'
          TabOrder = 1
          OnClick = btnChangeWorktopClick
        end
        object btnDeleteWorktop: TBitBtn
          Left = 10
          Top = 72
          Width = 75
          Height = 25
          Caption = '&Delete'
          TabOrder = 2
          OnClick = btnDeleteClick
        end
        object BitBtn9: TBitBtn
          Left = 10
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          TabOrder = 0
          OnClick = btnAddClick
        end
        object BitBtn10: TBitBtn
          Left = 10
          Top = 144
          Width = 75
          Height = 25
          Caption = '&Materials'
          TabOrder = 3
          OnClick = btnMaterialsClick
        end
        object BitBtn12: TBitBtn
          Left = 10
          Top = 178
          Width = 75
          Height = 25
          Caption = '&Worktops'
          TabOrder = 4
          OnClick = btnWorktopsClick
        end
      end
      object dbgWorktopDetails: TDBGrid
        Left = 0
        Top = 0
        Width = 903
        Height = 316
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgWorktopDetailsDrawColumnCell
        OnDblClick = dbgWorktopDetailsDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Material_Type_Description'
            Title.Caption = 'Material'
            Width = 149
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Worktop_Group_Description'
            Title.Caption = 'Group'
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Worktop_Description'
            Title.Caption = 'Colour'
            Width = 232
            Visible = True
          end>
      end
    end
    object tsProducts: TTabSheet
      Caption = 'Products'
      ImageIndex = 3
      OnShow = tsProductsShow
      object pnlProductsFooter: TPanel
        Left = 0
        Top = 316
        Width = 996
        Height = 62
        Align = alBottom
        TabOrder = 0
        DesignSize = (
          996
          62)
        object Label19: TLabel
          Left = 8
          Top = 12
          Width = 34
          Height = 13
          Caption = 'Search'
        end
        object edtSearch: TEdit
          Left = 56
          Top = 8
          Width = 137
          Height = 21
          TabOrder = 0
          OnChange = edtSearchChange
        end
        object btnProdClear: TBitBtn
          Left = 224
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Cl&ear'
          TabOrder = 1
          OnClick = btnProdClearClick
        end
        object btnProdSweep: TBitBtn
          Left = 912
          Top = 6
          Width = 75
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'S&weep'
          TabOrder = 2
          OnClick = btnProdSweepClick
        end
        object chkbxShowInactiveProducts: TCheckBox
          Left = 9
          Top = 37
          Width = 160
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = 'Show inactive products'
          TabOrder = 3
          OnClick = chkbxShowInactiveProductsClick
        end
      end
      object dbgProductDetails: TDBGrid
        Left = 0
        Top = 0
        Width = 903
        Height = 316
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbgProductDetailsDrawColumnCell
        OnDblClick = dbgProductDetailsDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Supplier_Product_Code'
            Title.Caption = 'Product Code'
            Width = 179
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
            FieldName = 'Unit_Cost'
            Title.Caption = 'Unit Cost'
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Effective_Date'
            Title.Caption = 'Effective Date'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Changed'
            Title.Caption = 'Date Changed'
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Operator_Name'
            Title.Caption = 'Operator'
            Width = 155
            Visible = True
          end>
      end
      object Panel6: TPanel
        Left = 903
        Top = 0
        Width = 93
        Height = 316
        Align = alRight
        TabOrder = 2
        object btnProdChange: TBitBtn
          Left = 10
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Change'
          TabOrder = 1
          OnClick = btnProdChangeClick
        end
        object btnProdDelete: TBitBtn
          Left = 10
          Top = 72
          Width = 75
          Height = 25
          Caption = '&Delete'
          TabOrder = 2
          OnClick = btnProdDeleteClick
        end
        object btnProdAdd: TBitBtn
          Left = 10
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          TabOrder = 0
          OnClick = btnProdAddClick
        end
      end
    end
    object tsDocuments: TTabSheet
      Caption = 'Documents'
      ImageIndex = 3
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 1004
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label44: TLabel
          Left = 2
          Top = 4
          Width = 54
          Height = 13
          Caption = 'Documents'
        end
      end
      object Panel11: TPanel
        Left = 0
        Top = 17
        Width = 1004
        Height = 369
        Align = alClient
        Caption = 'Panel11'
        TabOrder = 1
        object lstvwDocuments: TListView
          Left = 1
          Top = 1
          Width = 973
          Height = 367
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
          Left = 974
          Top = 1
          Width = 29
          Height = 367
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
            Top = 2
            Hint = 'Excel'
            Caption = 'btnExcel'
            ImageIndex = 0
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = btnExcelClick
          end
          object btnWord: TToolButton
            Left = 0
            Top = 32
            Hint = 'Word'
            Caption = 'btnWord'
            ImageIndex = 1
            ParentShowHint = False
            Wrap = True
            ShowHint = True
            OnClick = btnExcelClick
          end
          object btnEmail: TToolButton
            Left = 0
            Top = 62
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
            Top = 92
            Hint = 'Attach Documents'
            Caption = 'btnAttach'
            ImageIndex = 3
            ParentShowHint = False
            ShowHint = True
            OnClick = btnAttachClick
          end
        end
      end
    end
  end
  object tblOneSupplier: TTable
    OnNewRecord = tblOneSupplierNewRecord
    DatabaseName = 'wt'
    Filtered = True
    TableName = 'Supplier'
    Left = 376
    Top = 336
  end
  object dtsOneSupplier: TDataSource
    DataSet = qryOneSupplier
    Left = 480
    Top = 336
  end
  object qryNewSupplier: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select max(Supplier) from Supplier')
    Left = 376
    Top = 280
  end
  object imgIcons: TImageList
    Left = 344
    Top = 188
    Bitmap = {
      494C010107000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FF7EE00FFC0000009001E00FFC000000
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
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 352
    Top = 112
  end
  object tmrProductSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrProductSearchTimer
    Left = 456
    Top = 112
  end
  object tmrWorktopSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrWorktopSearchTimer
    Left = 560
    Top = 112
  end
  object pmnuDocuments: TPopupMenu
    OnPopup = pmnuDocumentsPopup
    Left = 638
    Top = 222
    object pmnuOpen: TMenuItem
      Caption = 'Open'
      OnClick = pmnuOpenClick
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
  object imgDocuments: TImageList
    Left = 424
    Top = 196
  end
  object svDlgOfficeDoc: TSaveDialog
    Left = 217
    Top = 86
  end
  object DocOpenDialog: TOpenDialog
    Options = [ofHideReadOnly, ofNoChangeDir, ofAllowMultiSelect, ofEnableSizing]
    Left = 640
    Top = 160
  end
  object qryOneSupplier: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Supplier'
      'WHERE Supplier = :Supplier')
    Left = 380
    Top = 392
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryUpdate: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'UPDATE Supplier'
      'SET'
      '      Supplier_Name = :Supplier_Name,'
      '      Street = :Street,'
      '      Locale = :Locale,'
      '      Town_City = :Town_City,'
      '      Postcode = :Postcode,'
      '      County_State = :County_State,'
      '      Telephone_Number = :Telephone_Number,'
      '      Fax_Number = :Fax_Number,'
      '      Web_Address = :Web_Address,'
      '      Email_Address = :Email_Address,'
      '      Discount_Percentage = :Discount_Percentage,'
      '      Account_Code = :Account_Code,'
      '      inActive = :InActive'
      'WHERE'
      '  Supplier = :Supplier')
    Left = 632
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Street'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Locale'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Town_City'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Postcode'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'County_State'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Telephone_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Fax_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Web_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Email_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Discount_Percentage'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Account_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'InActive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Insert Into Supplier'
      '        (Supplier,'
      '        Supplier_Name)'
      'Select Max(Supplier)+1, :GUID'
      'From Supplier'
      ' ')
    Left = 688
    Top = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryDelete: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Delete From Supplier'
      'Where'
      '(Supplier = :Supplier)')
    Left = 744
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryGetLast: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Select Supplier'
      'From Supplier'
      'Where Supplier_Name = :GUID')
    Left = 800
    Top = 400
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryZero: TQuery
    DatabaseName = 'WT'
    Left = 864
    Top = 400
  end
end
