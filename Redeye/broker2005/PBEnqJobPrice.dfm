object PBEnqJobPriceFrm: TPBEnqJobPriceFrm
  Left = 465
  Top = 67
  Caption = 'Job Pricing'
  ClientHeight = 570
  ClientWidth = 734
  Color = clBtnFace
  Constraints.MinHeight = 600
  Constraints.MinWidth = 750
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object EnquiryLineListBox: TListBox
    Left = 344
    Top = 240
    Width = 345
    Height = 81
    TabStop = False
    ItemHeight = 13
    TabOrder = 0
    OnClick = EnquiryLineListBoxClick
  end
  object GroupBox1: TGroupBox
    Left = 568
    Top = 96
    Width = 81
    Height = 49
    Caption = 'GroupBox1'
    ParentBackground = False
    TabOrder = 1
    Visible = False
    object Label10: TLabel
      Left = 8
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Supplier'
    end
    object Label11: TLabel
      Left = 8
      Top = 64
      Width = 34
      Height = 13
      Caption = 'Branch'
    end
    object Label9: TLabel
      Left = 10
      Top = 112
      Width = 49
      Height = 13
      Caption = 'Comments'
    end
    object Label8: TLabel
      Left = 47
      Top = 228
      Width = 75
      Height = 13
      Caption = 'Additional Costs'
    end
    object AddCostsSpeedBtn: TSpeedButton
      Left = 234
      Top = 220
      Width = 23
      Height = 23
      Caption = '...'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = AddCostsSpeedBtnClick
    end
    object SupplierEdit: TEdit
      Left = 8
      Top = 32
      Width = 249
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = 'SupplierEdit'
    end
    object BranchEdit: TEdit
      Left = 8
      Top = 80
      Width = 249
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = 'BranchEdit'
    end
    object SupplierMemo: TMemo
      Left = 8
      Top = 128
      Width = 249
      Height = 81
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 2
    end
    object AddCostsMemo: TMemo
      Left = 144
      Top = 220
      Width = 81
      Height = 23
      Alignment = taRightJustify
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 535
    Width = 734
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      734
      35)
    object SaveBitBtn: TBitBtn
      Left = 525
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Save'
      Glyph.Data = {
        BE060000424DBE06000000000000360400002800000024000000120000000100
        0800000000008802000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        03030303030303030303030303030303030303030303FF030303030303030303
        03030303030303040403030303030303030303030303030303F8F8FF03030303
        03030303030303030303040202040303030303030303030303030303F80303F8
        FF030303030303030303030303040202020204030303030303030303030303F8
        03030303F8FF0303030303030303030304020202020202040303030303030303
        0303F8030303030303F8FF030303030303030304020202FA0202020204030303
        0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
        040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
        03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
        FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
        0303030303030303030303FA0202020403030303030303030303030303F8FF03
        03F8FF03030303030303030303030303FA020202040303030303030303030303
        0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
        03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
        030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
        0202040303030303030303030303030303F8FF03F8FF03030303030303030303
        03030303FA0202030303030303030303030303030303F8FFF803030303030303
        030303030303030303FA0303030303030303030303030303030303F803030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = SaveBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 613
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancel'
      Glyph.Data = {
        BE060000424DBE06000000000000360400002800000024000000120000000100
        0800000000008802000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303F8F80303030303030303030303030303030303FF03030303030303030303
        0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
        03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
        030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
        FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
        030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
        F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
        010101F8030303030303030303F8FF030303030303FFF8030303030303030303
        030101010101F80303030303030303030303F8FF0303030303F8030303030303
        0303030303F901010101F8030303030303030303030303F8FF030303F8030303
        0303030303030303F90101010101F8030303030303030303030303F803030303
        F8FF030303030303030303F9010101F8010101F803030303030303030303F803
        03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
        03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
        03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
        0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
        030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
        03030303030303030303030303030303030303030303030303F8F8F803030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = CancelBitBtnClick
    end
    object PrintBitBtn: TBitBtn
      Left = 435
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Print'
      TabOrder = 2
      OnClick = PrintBitBtnClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 406
    Width = 734
    Height = 129
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    object Panel9: TPanel
      Left = 0
      Top = 0
      Width = 734
      Height = 129
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 615
        Height = 129
        Align = alClient
        TabOrder = 0
        object PUnitCombo: TComboBox
          Left = 260
          Top = 80
          Width = 77
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          Visible = False
          OnChange = PUnitComboChange
          OnDropDown = PUnitComboDropDown
          OnEnter = PUnitComboEnter
          OnExit = PUnitComboExit
        end
        object Panel10: TPanel
          Left = 2
          Top = 15
          Width = 611
          Height = 112
          Align = alClient
          ParentBackground = False
          TabOrder = 1
          object SelectedPricesGrid: TStringGrid
            Left = 1
            Top = 1
            Width = 609
            Height = 110
            Align = alClient
            ColCount = 2
            DefaultColWidth = 195
            DefaultRowHeight = 20
            Enabled = False
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goTabs]
            PopupMenu = PricesPopUp
            TabOrder = 0
            OnClick = SelectedPricesGridClick
            OnDrawCell = SelectedPricesGridDrawCell
            OnExit = SelectedPricesGridExit
            OnKeyPress = SelectedPricesGridKeyPress
            OnKeyUp = SelectedPricesGridKeyUp
            OnMouseUp = SelectedPricesGridMouseUp
            OnSelectCell = SelectedPricesGridSelectCell
            OnTopLeftChanged = SelectedPricesGridTopLeftChanged
            ColWidths = (
              195
              84)
            RowHeights = (
              20
              20
              20
              20
              20)
          end
        end
      end
      object Panel8: TPanel
        Left = 615
        Top = 0
        Width = 119
        Height = 129
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        object grpBxSelectedRunOn: TGroupBox
          Left = 0
          Top = 0
          Width = 119
          Height = 129
          Align = alClient
          TabOrder = 0
          object Panel12: TPanel
            Left = 2
            Top = 15
            Width = 115
            Height = 112
            Align = alClient
            ParentBackground = False
            TabOrder = 0
            object SelectedROPricesGrid: TStringGrid
              Left = 1
              Top = 1
              Width = 113
              Height = 110
              Align = alClient
              ColCount = 1
              DefaultColWidth = 80
              DefaultRowHeight = 20
              FixedCols = 0
              RowCount = 4
              TabOrder = 0
              OnDrawCell = SelectedROPricesGridDrawCell
              OnExit = SelectedROPricesGridExit
              OnKeyPress = SelectedROPricesGridKeyPress
              OnKeyUp = SelectedROPricesGridKeyUp
              OnSelectCell = SelectedROPricesGridSelectCell
            end
          end
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 123
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 4
    DesignSize = (
      734
      123)
    object GroupBox4: TGroupBox
      Left = 8
      Top = -8
      Width = 685
      Height = 122
      Anchors = [akLeft, akTop, akRight]
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        685
        122)
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 35
        Height = 13
        Caption = 'Enquiry'
      end
      object Label2: TLabel
        Left = 144
        Top = 16
        Width = 44
        Height = 13
        Caption = 'Customer'
      end
      object Label5: TLabel
        Left = 8
        Top = 41
        Width = 25
        Height = 13
        Caption = 'Lines'
      end
      object Label6: TLabel
        Left = 571
        Top = 72
        Width = 51
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Price Units'
        ExplicitLeft = 613
      end
      object Label3: TLabel
        Left = 520
        Top = 16
        Width = 37
        Height = 13
        Caption = 'Contact'
      end
      object EnquiryEdit: TEdit
        Left = 56
        Top = 12
        Width = 73
        Height = 21
        Hint = 'Enter an enquiry number and press return'
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
        OnKeyPress = EnquiryEditKeyPress
      end
      object CustNameEdit: TEdit
        Left = 208
        Top = 12
        Width = 273
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
      object EnquiryLineGrid: TStringGrid
        Left = 56
        Top = 41
        Width = 471
        Height = 74
        Anchors = [akLeft, akTop, akRight]
        ColCount = 2
        DefaultColWidth = 40
        DefaultRowHeight = 20
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 2
        OnClick = EnquiryLineGridClick
        ColWidths = (
          40
          285)
        RowHeights = (
          20
          20)
      end
      object JobUnitcombo: TComboBox
        Left = 571
        Top = 92
        Width = 105
        Height = 21
        Style = csDropDownList
        Anchors = [akTop, akRight]
        TabOrder = 3
        OnClick = JobUnitcomboClick
        OnDropDown = JobUnitcomboDropDown
      end
      object edtContact: TEdit
        Left = 568
        Top = 12
        Width = 145
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 4
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 123
    Width = 734
    Height = 283
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 5
    object Panel5: TPanel
      Left = 615
      Top = 0
      Width = 119
      Height = 283
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object grpBxSupplierRunOn: TGroupBox
        Left = 0
        Top = 0
        Width = 119
        Height = 283
        Align = alClient
        Caption = 'Run On Quantity'
        TabOrder = 0
        object Panel11: TPanel
          Left = 2
          Top = 15
          Width = 115
          Height = 266
          Align = alClient
          ParentBackground = False
          TabOrder = 0
          object SupplierROPricesGrid: TStringGrid
            Left = 1
            Top = 1
            Width = 113
            Height = 264
            Align = alClient
            ColCount = 1
            DefaultColWidth = 80
            DefaultRowHeight = 20
            FixedCols = 0
            RowCount = 2
            TabOrder = 0
            OnDrawCell = SupplierROPricesGridDrawCell
          end
        end
      end
    end
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 615
      Height = 283
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 615
        Height = 283
        Align = alClient
        Caption = 'Supplier Price Responses'
        TabOrder = 0
        object Panel7: TPanel
          Left = 2
          Top = 15
          Width = 611
          Height = 266
          Align = alClient
          ParentBackground = False
          TabOrder = 0
          object SupplierPricesGrid: TStringGrid
            Left = 1
            Top = 1
            Width = 609
            Height = 264
            Align = alClient
            ColCount = 2
            DefaultColWidth = 195
            DefaultRowHeight = 20
            DefaultDrawing = False
            Enabled = False
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goThumbTracking]
            ParentShowHint = False
            PopupMenu = SelectPopUpMenu
            ShowHint = True
            TabOrder = 0
            OnClick = SupplierPricesGridClick
            OnDblClick = SupplierPricesGridDblClick
            OnDrawCell = SupplierPricesGridDrawCell
            OnMouseDown = SupplierPricesGridMouseDown
            OnMouseUp = SupplierPricesGridMouseUp
            OnSelectCell = SupplierPricesGridSelectCell
            OnTopLeftChanged = SupplierPricesGridTopLeftChanged
            ColWidths = (
              195
              84)
          end
        end
      end
    end
  end
  object SuppQtySQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Supplier_EnquiryQty.*, Name'
      'from Supplier_EnquiryQty, Supplier'
      'where (Supplier_EnquiryQty.Supplier = Supplier.Supplier) AND'
      '(Enquiry = :enquiry) AND'
      '(Line = :Line)'
      
        'order by Enquiry, Line, Supplier_EnquiryQty.Supplier, Supplier_E' +
        'nquiryQty.Branch_no, Quantity')
    Left = 240
    Top = 424
    ParamData = <
      item
        Name = 'enquiry'
        DataType = ftInteger
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end>
  end
  object EnqQtySQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Enquiry_LineQuantity.*,'
      ' '#9#9#9#9#9#9'Price_Unit.Description as Price_Unit_Description,'
      #9#9#9#9#9#9'Price_Unit.Price_Unit_Factor'
      
        'from Price_Unit right join Enquiry_LineQuantity on Price_Unit.Pr' +
        'ice_Unit ='
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'Enquiry_LineQuantity.Price_Unit'
      'where (Enquiry = :Enquiry) AND'
      '(Line = :Line)'
      'order by Quantity')
    Left = 168
    Top = 424
    ParamData = <
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end>
  end
  object SelectPopUpMenu: TPopupMenu
    OnPopup = SelectPopUpMenuPopup
    Left = 328
    Top = 200
    object mnuSelectThis1: TMenuItem
      Caption = 'Select this Supplier price'
      OnClick = mnuSelectThis1Click
    end
    object mnuSelectAll: TMenuItem
      Caption = 'Select recommended prices'
      OnClick = mnuSelectAllClick
    end
  end
  object UpEnqQtySQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update Enquiry_LineQuantity'
      'set Supplier_Price = :Cost,'
      '      Quotation_Price = :Price,'
      '      Supplier = :Supplier,'
      '      Branch_no = :Branch,'
      '      Price_Unit = :Unit'
      'where (Enquiry = :Enquiry) AND'
      '(Line = :Line) AND'
      '(Quantity = :Quantity)')
    Left = 440
    Top = 400
    ParamData = <
      item
        Name = 'Cost'
        DataType = ftFloat
      end
      item
        Name = 'Price'
        DataType = ftFloat
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch'
      end
      item
        Name = 'Unit'
      end
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Quantity'
        DataType = ftInteger
      end>
  end
  object EnqHeadSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Enquiry'
      'from Enquiry'
      'where Enquiry = :Enquiry')
    Left = 152
    Top = 72
    ParamData = <
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end>
  end
  object UpEnqLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update EnquiryLine'
      'set Enquiry_Status = :status,'
      'Run_On_Price = :Run_On_Price,'
      'Run_on_Cost = :Run_on_Cost'
      'where Enquiry = :Enquiry AND'
      '           Line = :Line')
    Left = 48
    Top = 368
    ParamData = <
      item
        Name = 'status'
      end
      item
        Name = 'Run_On_Price'
      end
      item
        Name = 'Run_on_Cost'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object UpEnqHeadSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Enquiry'
      'set Enquiry_Status = :Status'
      'where enquiry = :Enquiry')
    Left = 312
    Top = 328
    ParamData = <
      item
        Name = 'Status'
      end
      item
        Name = 'Enquiry'
      end>
  end
  object UpSuppEnqQtySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Supplier_EnquiryQty'
      'set Price_Selected = '#39'Y'#39','
      '      Marked_up_Price = :Price'
      'where'
      '      (Enquiry = :Enquiry) AND'
      '      (Line = :Line) AND'
      '      (Supplier = :Supplier) AND'
      '      (Branch_no = :Branch) AND'
      '      (Quantity = :Quantity)')
    Left = 384
    Top = 336
    ParamData = <
      item
        Name = 'Price'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch'
      end
      item
        Name = 'Quantity'
      end>
  end
  object PUnitSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from Price_unit')
    Left = 672
    Top = 312
  end
  object PricesPopUp: TPopupMenu
    OnPopup = PricesPopUpPopup
    Left = 514
    Top = 413
    object Applysamemarkup: TMenuItem
      Caption = 'Apply same markup for all'
      OnClick = ApplysamemarkupClick
    end
    object ApplysamePriceUnit: TMenuItem
      Caption = 'Apply same Price Unit for all'
      OnClick = ApplysamePriceUnitClick
    end
  end
  object qrySupplier: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Phone, Fax_Number'
      'from Supplier_branch'
      'where Supplier = :Supplier and '
      'Branch_no = :Branch_no')
    Left = 450
    Top = 196
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object ResetSuppEnqQtySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Supplier_EnquiryQty'
      'set Price_Selected = '#39'N'#39', Marked_up_Price = NULL'
      
        'where Enquiry = :Enquiry and Line = :Line and Quantity = :Quanti' +
        'ty')
    Left = 450
    Top = 252
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Quantity'
      end>
  end
  object qryGetPriceUnit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Price_Unit'
      'where Price_unit = :Price_unit')
    Left = 146
    Top = 226
    ParamData = <
      item
        Name = 'Price_unit'
      end>
  end
  object qryPTPriceUnit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Product_TypePrice_Unit.*, Price_Unit.Description, Price_U' +
        'nit_Factor, Price_unit_Inactive'
      'from Product_TypePrice_Unit, Price_Unit'
      'where Product_Type = :Product_Type and'
      'Product_TypePrice_Unit.Price_Unit = Price_Unit.Price_Unit'
      'order by Price_Unit.Description')
    Left = 650
    Top = 250
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object qryProdType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Product_Type.Default_Price_unit,'
      '       Price_Unit.Description as Price_Unit_description'
      'from Product_type, Price_unit'
      'where product_type = :product_type and'
      '  Product_Type.Default_Price_Unit = Price_Unit.Price_Unit')
    Left = 514
    Top = 162
    ParamData = <
      item
        Name = 'product_type'
      end>
  end
end
