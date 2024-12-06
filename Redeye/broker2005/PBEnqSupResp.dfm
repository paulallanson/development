object PBEnqSupRespFrm: TPBEnqSupRespFrm
  Left = 58
  Top = 126
  Caption = 'Update Supplier Responses'
  ClientHeight = 496
  ClientWidth = 744
  Color = clBtnFace
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
  object Bevel3: TBevel
    Left = 384
    Top = 328
    Width = 353
    Height = 121
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 8
    Top = 8
    Width = 729
    Height = 121
    Shape = bsFrame
  end
  object Bevel1: TBevel
    Left = 384
    Top = 136
    Width = 353
    Height = 185
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 39
    Height = 13
    Caption = 'Enquiry'
  end
  object Label2: TLabel
    Left = 24
    Top = 50
    Width = 49
    Height = 13
    Caption = 'Customer'
  end
  object Label3: TLabel
    Left = 40
    Top = 76
    Width = 35
    Height = 13
    Caption = 'Branch'
  end
  object Label4: TLabel
    Left = 16
    Top = 104
    Width = 59
    Height = 13
    Caption = 'Description'
  end
  object Label5: TLabel
    Left = 384
    Top = 16
    Width = 104
    Height = 13
    Caption = 'Enquiry Line Details:'
  end
  object Label7: TLabel
    Left = 392
    Top = 144
    Width = 75
    Height = 13
    Caption = 'Supplier Prices'
  end
  object Label12: TLabel
    Left = 392
    Top = 336
    Width = 255
    Height = 13
    Caption = 'Awaiting Responses from the following Suppliers'
  end
  object lblRunOnQty: TLabel
    Left = 392
    Top = 296
    Width = 85
    Height = 13
    Caption = 'Run on Quantity'
  end
  object lblRunOnCost: TLabel
    Left = 584
    Top = 296
    Width = 23
    Height = 13
    Caption = 'Cost'
  end
  object EnquiryEdit: TEdit
    Left = 88
    Top = 16
    Width = 73
    Height = 21
    Hint = 'Enter an enquiry number and press return'
    ReadOnly = True
    TabOrder = 0
    OnKeyPress = EnquiryEditKeyPress
  end
  object CustNameEdit: TEdit
    Left = 88
    Top = 42
    Width = 289
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object BranchNameEdit: TEdit
    Left = 88
    Top = 68
    Width = 289
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object DescEdit: TEdit
    Left = 88
    Top = 96
    Width = 289
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object EnquiryLineListBox: TListBox
    Left = 384
    Top = 40
    Width = 345
    Height = 81
    TabStop = False
    ItemHeight = 13
    TabOrder = 10
    OnClick = EnquiryLineListBoxClick
  end
  object SupplierPricesGrid: TStringGrid
    Left = 392
    Top = 160
    Width = 305
    Height = 121
    ColCount = 3
    DefaultColWidth = 70
    DefaultRowHeight = 20
    DrawingStyle = gdsGradient
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 6
    OnClick = SupplierPricesGridClick
    OnDrawCell = SupplierPricesGridDrawCell
    OnExit = SupplierPricesGridExit
    OnKeyPress = SupplierPricesGridKeyPress
    OnKeyUp = SupplierPricesGridKeyUp
    OnSelectCell = SupplierPricesGridSelectCell
    ColWidths = (
      70
      81
      126)
    RowHeights = (
      20
      20)
  end
  object SaveBitBtn: TBitBtn
    Left = 568
    Top = 456
    Width = 75
    Height = 25
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
    TabOrder = 11
    OnClick = SaveBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 664
    Top = 456
    Width = 75
    Height = 25
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
    TabOrder = 13
    OnClick = CancelBitBtnClick
  end
  object BitBtn3: TBitBtn
    Left = 376
    Top = 456
    Width = 75
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 9
    Visible = False
    OnClick = BitBtn3Click
  end
  object PUnitCombo: TComboBox
    Left = 504
    Top = 184
    Width = 129
    Height = 21
    Style = csDropDownList
    TabOrder = 12
    Visible = False
    OnClick = PUnitComboClick
    OnDropDown = PUnitComboDropDown
    OnEnter = PUnitComboEnter
    OnExit = PUnitComboExit
    OnKeyPress = PUnitComboKeyPress
  end
  object ResponseList: TListBox
    Left = 392
    Top = 352
    Width = 337
    Height = 89
    ItemHeight = 13
    TabOrder = 8
    OnClick = ResponseListClick
  end
  object ResponseCodeList: TListBox
    Left = 432
    Top = 336
    Width = 41
    Height = 41
    ItemHeight = 13
    TabOrder = 14
    Visible = False
  end
  object EnquiryLineGrid: TStringGrid
    Left = 384
    Top = 32
    Width = 345
    Height = 89
    ColCount = 2
    DefaultColWidth = 40
    DefaultRowHeight = 20
    DrawingStyle = gdsGradient
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 4
    OnClick = EnquiryLineGridClick
    ColWidths = (
      40
      282)
  end
  object SelectedSuppliersGroup: TGroupBox
    Left = 8
    Top = 130
    Width = 369
    Height = 319
    Enabled = False
    ParentBackground = False
    TabOrder = 5
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 97
      Height = 13
      Caption = 'Selected Suppliers:'
    end
    object Label9: TLabel
      Left = 8
      Top = 56
      Width = 35
      Height = 13
      Caption = 'Branch'
    end
    object Label10: TLabel
      Left = 8
      Top = 96
      Width = 51
      Height = 13
      Caption = 'Reference'
    end
    object Label11: TLabel
      Left = 168
      Top = 96
      Width = 77
      Height = 13
      Caption = 'Response Date'
    end
    object Label13: TLabel
      Left = 168
      Top = 138
      Width = 99
      Height = 13
      Caption = 'Additional Charges'
    end
    object ResponseDateBtn: TSpeedButton
      Left = 296
      Top = 114
      Width = 23
      Height = 23
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
      OnClick = ResponseDateBtnClick
    end
    object Label8: TLabel
      Left = 8
      Top = 178
      Width = 97
      Height = 13
      Caption = 'Delivery Comments'
    end
    object SupplierCombo: TComboBox
      Left = 8
      Top = 32
      Width = 313
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnChange = SupplierComboChange
    end
    object SuppBranchEdit: TEdit
      Tag = 1
      Left = 8
      Top = 72
      Width = 313
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object SuppDateEdit: TEdit
      Tag = 1
      Left = 168
      Top = 114
      Width = 121
      Height = 21
      MaxLength = 10
      TabOrder = 3
      OnExit = SuppDateEditExit
    end
    object SuppRefEdit: TEdit
      Tag = 1
      Left = 8
      Top = 114
      Width = 153
      Height = 21
      MaxLength = 20
      TabOrder = 2
      OnKeyUp = SuppRefEditKeyUp
    end
    object SupplierMemo: TMemo
      Tag = 1
      Left = 8
      Top = 192
      Width = 313
      Height = 65
      TabOrder = 6
      OnKeyUp = SupplierMemoKeyUp
    end
    object AddChargesEdit: TMemo
      Tag = 1
      Left = 168
      Top = 155
      Width = 73
      Height = 23
      Alignment = taRightJustify
      ReadOnly = True
      TabOrder = 4
      WordWrap = False
    end
    object SpeedButton3: TButton
      Left = 248
      Top = 156
      Width = 23
      Height = 23
      Hint = 'Maintain Supplier'#39's additional charges'
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = SpeedButton3Click
    end
    object btnDelete: TBitBtn
      Left = 8
      Top = 272
      Width = 75
      Height = 25
      Caption = 'Delete'
      Enabled = False
      TabOrder = 7
      OnClick = btnDeleteClick
    end
    object chkbxDecline: TCheckBox
      Left = 8
      Top = 152
      Width = 153
      Height = 17
      Caption = 'Declined to quote'
      TabOrder = 8
      OnClick = chkbxDeclineClick
    end
  end
  object SpeedButton2: TBitBtn
    Left = 704
    Top = 161
    Width = 25
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      300033FFFFFF3333377739999993333333333777777F3333333F399999933333
      3300377777733333337733333333333333003333333333333377333333333333
      3333333333333333333F333333333333330033333F33333333773333C3333333
      330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
      993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
      333333377F33333333FF3333C333333330003333733333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 7
    OnClick = SpeedButton2Click
  end
  object AddChargesGrid: TStringGrid
    Left = 140
    Top = 392
    Width = 233
    Height = 53
    ColCount = 4
    DefaultRowHeight = 12
    DrawingStyle = gdsGradient
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -8
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    Visible = False
  end
  object edtRunOnQty: TEdit
    Left = 488
    Top = 288
    Width = 81
    Height = 21
    Color = clBtnFace
    Enabled = False
    TabOrder = 16
    Text = 'edtRunOnQty'
  end
  object memRunOnCost: TMemo
    Left = 616
    Top = 288
    Width = 81
    Height = 23
    Alignment = taRightJustify
    Lines.Strings = (
      'memRunOn'
      'Cost')
    TabOrder = 17
    OnChange = memRunOnCostChange
    OnEnter = memRunOnCostEnter
    OnExit = memRunOnCostExit
    OnKeyPress = memRunOnCostKeyPress
  end
  object PUnitSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * '
      'from Price_unit'
      
        'WHERE ((Price_unit_Inactive is NULL) or (Price_unit_inactive = '#39 +
        'N'#39'))'
      'Order By Description')
    Left = 440
    Top = 312
  end
  object UpEnqSuppSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update Supplier_Enquiry'
      'set Act_Response_Date = :Date,'
      '     Delivery_Comment = :Comment,'
      '     Supplier_Reference = :Reference,'
      '     Run_on_Price = :Run_on_Price,'
      '     Decline_to_Quote = :Decline_to_Quote'
      'where (Enquiry = :Enquiry) AND'
      '          (Line = :Line) AND'
      '          (Supplier = :Supplier) AND'
      '          (Branch_no = :Branch)')
    Left = 436
    Top = 248
    ParamData = <
      item
        Name = 'Date'
        DataType = ftDateTime
      end
      item
        Name = 'Comment'
        DataType = ftString
      end
      item
        Name = 'Reference'
        DataType = ftString
      end
      item
        Name = 'Run_on_Price'
        DataType = ftFloat
      end
      item
        Name = 'Decline_to_Quote'
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
      end>
  end
  object UpEnqSuppQtySQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'Update Supplier_EnquiryQty'
      'set Supplier_Price = :Price,'
      '      Price_Unit = :Unit,'
      '      Response_Quantity = :Response'
      'where (Enquiry = :enquiry) AND'
      '           (Line = :Line) AND'
      '           (Supplier = :Supplier) AND'
      '           (Branch_no = :branch) AND'
      '           (Quantity = :Quantity)')
    Left = 584
    Top = 240
    ParamData = <
      item
        Name = 'Price'
        DataType = ftFloat
      end
      item
        Name = 'Unit'
        DataType = ftString
      end
      item
        Name = 'Response'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'branch'
      end
      item
        Name = 'Quantity'
      end>
  end
  object EnqHeadSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Enquiry'
      'from Enquiry'
      'where Enquiry = :Enquiry')
    Left = 280
    Top = 40
    ParamData = <
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end>
  end
  object AddEnqSuppQtySQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into Supplier_EnquiryQty'
      '                (Supplier,'
      '                 Branch_no,'
      '                 Enquiry,'
      '                 Line,'
      '                 Quantity,'
      '                 Supplier_Price,'
      '                 Price_Unit,'
      '                 Response_Quantity,'
      '                 Price_Selected)'
      'values (:Supplier,'
      '            :Branch,'
      '            :Enquiry,'
      '            :Line,'
      '            :Quantity,'
      '            :Price,'
      '            :Unit,'
      '            :Response,'
      '            '#39'N'#39')')
    Left = 548
    Top = 238
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Price'
      end
      item
        Name = 'Unit'
      end
      item
        Name = 'Response'
      end>
  end
  object AddEnqQtySQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into Enquiry_LineQuantity'
      '                (Enquiry,'
      '                 Line,'
      '                 Quantity)'
      'values'
      '               (:Enquiry,'
      '                :Line,'
      '                :Quantity)')
    Left = 400
    Top = 244
    ParamData = <
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
  object UpEnqLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update EnquiryLine'
      'set Enquiry_Status = :Status'
      'where Enquiry = :Enquiry AND'
      '           Line = :Line')
    Left = 224
    Top = 328
    ParamData = <
      item
        Name = 'Status'
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
      'where Enquiry = :Enquiry')
    Left = 24
    Top = 330
    ParamData = <
      item
        Name = 'Status'
      end
      item
        Name = 'Enquiry'
      end>
  end
  object DelEnqSuppQtySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Supplier_EnquiryQty'
      'where (Enquiry = :enquiry) AND'
      '           (Line = :Line) AND'
      '           (Supplier = :Supplier) AND'
      '           (Branch_no = :branch) AND'
      '           (Quantity = :Quantity)')
    Left = 620
    Top = 242
    ParamData = <
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
end
