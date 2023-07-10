object PBLUStkHistoryfrm: TPBLUStkHistoryfrm
  Left = 259
  Top = 145
  Width = 751
  Height = 464
  Caption = 'Stock Movements'
  Color = clBtnFace
  Constraints.MinHeight = 460
  Constraints.MinWidth = 750
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 89
    Width = 743
    Height = 300
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object detsDBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 741
      Height = 298
      Align = alClient
      DataSource = dtmdlForms.dtsHistory
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      PopupMenu = pMnuStock
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = detsDBGridDrawColumnCell
      OnDblClick = detsDBGridDblClick
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'PONumber'
          Title.Caption = 'Order No'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date_Point'
          Title.Caption = 'Due Date'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cust_Order_No'
          Title.Caption = 'Customer Ref'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 124
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Qty_To_Deliver'
          Title.Caption = 'Qty to Deliver'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 81
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Qty_In'
          Title.Caption = 'Move In'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Qty_Out'
          Title.Caption = 'Move Out'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date_Deliv_Actual'
          Title.Caption = 'Delivery Date'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DeliveryName'
          Title.Caption = 'Deliver To'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 195
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Supplier_Name'
          Title.Caption = 'Supplier'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 186
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Suppliers_Desc'
          Title.Caption = 'Job Description'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 189
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 743
    Height = 89
    Align = alTop
    Anchors = [akTop, akRight]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      743
      89)
    object Label1: TLabel
      Left = 8
      Top = 44
      Width = 81
      Height = 13
      Caption = 'Stock Reference'
    end
    object Label2: TLabel
      Left = 8
      Top = 70
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object Label3: TLabel
      Left = 536
      Top = 44
      Width = 67
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Reorder Level'
    end
    object Label4: TLabel
      Left = 536
      Top = 19
      Width = 67
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Total In Stock'
    end
    object Label5: TLabel
      Left = 8
      Top = 19
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object edtStockRef: TEdit
      Left = 104
      Top = 36
      Width = 185
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object edtFormDescr: TEdit
      Left = 104
      Top = 62
      Width = 369
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object edtCustomerName: TEdit
      Left = 104
      Top = 11
      Width = 369
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object memoReorder: TMemo
      Left = 624
      Top = 36
      Width = 97
      Height = 23
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 3
      WantReturns = False
    end
    object memoStock: TMemo
      Left = 624
      Top = 11
      Width = 97
      Height = 23
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      ReadOnly = True
      TabOrder = 4
      WantReturns = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 389
    Width = 743
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      743
      41)
    object CancelBitBtn: TBitBtn
      Left = 640
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Kind = bkClose
    end
    object RepeatBitBtn: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Repeat'
      TabOrder = 1
      Visible = False
      OnClick = RepeatBitBtnClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
    end
    object ChgBitBtn: TBitBtn
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Change'
      TabOrder = 2
      Visible = False
      OnClick = ChgBitBtnClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
    object DeliveryBitBtn: TBitBtn
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delivery'
      TabOrder = 3
      Visible = False
      OnClick = DeliveryBitBtnClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object pMnuStock: TPopupMenu
    Left = 344
    Top = 169
    object Repeat1: TMenuItem
      Caption = 'Repeat'
      OnClick = RepeatBitBtnClick
    end
    object Change1: TMenuItem
      Caption = 'Change'
      OnClick = ChgBitBtnClick
    end
    object Delivery1: TMenuItem
      Caption = 'Delivery'
      OnClick = DeliveryBitBtnClick
    end
    object Close1: TMenuItem
      Caption = '-'
    end
    object Close2: TMenuItem
      Caption = 'Close'
    end
  end
end
