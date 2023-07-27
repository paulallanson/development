object PBMaintDelivFrm: TPBMaintDelivFrm
  Left = 129
  Top = 4
  Caption = 'Maintain Purchase Order Line Deliveries'
  ClientHeight = 611
  ClientWidth = 628
  Color = clBtnFace
  Constraints.MinHeight = 580
  Constraints.MinWidth = 610
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object BottomPanel: TPanel
    ParentBackground = False
    Left = 0
    Top = 551
    Width = 628
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 563
    ExplicitWidth = 636
    DesignSize = (
      628
      41)
    object DelLabel: TLabel
      Left = 277
      Top = 11
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
    object OKBitBtn: TBitBtn
      Left = 437
      Top = 6
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
      TabOrder = 0
      OnClick = OKBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 525
      Top = 6
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
      TabOrder = 1
      OnClick = CancelBitBtnClick
    end
  end
  object pnlFormRef: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 628
    Height = 81
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 636
    object POrderLbl: TLabel
      Left = 8
      Top = 4
      Width = 47
      Height = 13
      Caption = 'POrderLbl'
    end
    object CustomerLbl: TLabel
      Left = 208
      Top = 4
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object Label12: TLabel
      Left = 8
      Top = 55
      Width = 76
      Height = 13
      Caption = 'Form Reference'
    end
    object Label17: TLabel
      Left = 8
      Top = 30
      Width = 81
      Height = 13
      Caption = 'Stock Reference'
    end
    object lblOrderPrice: TLabel
      Left = 384
      Top = 22
      Width = 52
      Height = 13
      Caption = 'Order price'
    end
    object lblOrderQty: TLabel
      Left = 384
      Top = 47
      Width = 45
      Height = 13
      Caption = 'Order Qty'
    end
    object edtFormRef: TEdit
      Left = 96
      Top = 51
      Width = 233
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object btnFormRef: TBitBtn
      Left = 336
      Top = 25
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnFormRefClick
    end
    object edtStockRef: TEdit
      Left = 96
      Top = 26
      Width = 233
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object dblkpVersions: TDBLookupComboBox
      Left = 96
      Top = 26
      Width = 265
      Height = 21
      KeyField = 'Stock_Code_No'
      ListField = 'Stock_Description'
      ListSource = dtsVersions
      TabOrder = 3
      Visible = False
      OnClick = dblkpVersionsClick
    end
  end
  object pgDeliveryDetails: TPageControl
    Left = 0
    Top = 81
    Width = 628
    Height = 470
    ActivePage = tbshtDetails
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 636
    ExplicitHeight = 482
    object tbshtDetails: TTabSheet
      Caption = 'Details'
      object DelInstructPanel: TPanel
        ParentBackground = False
        Left = 0
        Top = 352
        Width = 620
        Height = 90
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 628
        ExplicitHeight = 102
        object Label10: TLabel
          Left = 16
          Top = 10
          Width = 95
          Height = 13
          Caption = 'Delivery Instructions'
        end
        object DelInstructMemo: TMemo
          Left = 147
          Top = 2
          Width = 430
          Height = 87
          TabOrder = 0
        end
      end
      object Panel1: TPanel
        ParentBackground = False
        Left = 0
        Top = 0
        Width = 620
        Height = 316
        Align = alTop
        Caption = 'Panel1'
        TabOrder = 1
        ExplicitWidth = 628
        object Label9: TLabel
          Left = 160
          Top = 258
          Width = 75
          Height = 13
          Caption = 'Supp req'#39'd date'
        end
        object Label11: TLabel
          Left = 376
          Top = 284
          Width = 71
          Height = 13
          Caption = 'Date Delivered'
        end
        object Label18: TLabel
          Left = 160
          Top = 284
          Width = 71
          Height = 13
          Caption = 'Cust req'#39'd date'
        end
        object AddrTypeRadGrp: TRadioGroup
          ParentBackground = False
          Left = 8
          Top = 24
          Width = 105
          Height = 113
          Caption = 'Address Type'
          Items.Strings = (
            'Ad Hoc'
            'Supplier'
            'Rep'
            'Customer'
            'Company')
          TabOrder = 0
          OnClick = AddrTypeRadGrpClick
        end
        object AddrGrpBox: TGroupBox
          ParentBackground = False
          Left = 160
          Top = 24
          Width = 377
          Height = 225
          Caption = 'Address Details'
          TabOrder = 1
          object AddrTypeLabel: TLabel
            Left = 8
            Top = 19
            Width = 49
            Height = 13
            Caption = 'Addr Type'
          end
          object BranchNameLabel: TLabel
            Left = 8
            Top = 66
            Width = 34
            Height = 13
            Caption = 'Branch'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 8
            Top = 89
            Width = 38
            Height = 13
            Caption = 'Address'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 8
            Top = 184
            Width = 45
            Height = 13
            Caption = 'Postcode'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lblFAO: TLabel
            Left = 8
            Top = 42
            Width = 21
            Height = 13
            Caption = 'FAO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label19: TLabel
            Left = 184
            Top = 182
            Width = 33
            Height = 13
            Caption = 'County'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object NameEdit: TEdit
            Left = 85
            Top = 15
            Width = 252
            Height = 21
            MaxLength = 40
            ReadOnly = True
            TabOrder = 0
          end
          object BranchNameEdit: TEdit
            Left = 85
            Top = 62
            Width = 252
            Height = 21
            MaxLength = 40
            ReadOnly = True
            TabOrder = 1
          end
          object BuildingEdit: TEdit
            Left = 85
            Top = 85
            Width = 252
            Height = 21
            MaxLength = 40
            ReadOnly = True
            TabOrder = 2
          end
          object StreetEdit: TEdit
            Left = 85
            Top = 109
            Width = 252
            Height = 21
            MaxLength = 40
            ReadOnly = True
            TabOrder = 3
          end
          object LocaleEdit: TEdit
            Left = 85
            Top = 133
            Width = 252
            Height = 21
            MaxLength = 40
            ReadOnly = True
            TabOrder = 4
          end
          object TownEdit: TEdit
            Left = 85
            Top = 156
            Width = 252
            Height = 21
            MaxLength = 40
            ReadOnly = True
            TabOrder = 5
          end
          object PostCodeEdit: TEdit
            Left = 85
            Top = 180
            Width = 84
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            ReadOnly = True
            TabOrder = 6
          end
          object DelivNotesBitBtn: TBitBtn
            Left = 344
            Top = 177
            Width = 25
            Height = 25
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333FFFFF3333333333000003333333333F777773FF333333008877700
              33333337733FFF773F33330887000777033333733F777FFF73F330880FAFAF07
              703337F37733377FF7F33080F00000F07033373733777337F73F087F00A2200F
              77037F3737333737FF7F080A0A2A220A07037F737F3333737F7F0F0F0AAAA20F
              07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373737F0F7F00FFA00F
              780373F737FFF737F3733080F00000F0803337F73377733737F330F80FAFAF08
              8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
              3333333773FFFF77333333333000003333333333377777333333}
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 7
            OnClick = DelivNotesBitBtnClick
          end
          object chkbxInvoice: TCheckBox
            Left = 221
            Top = 204
            Width = 121
            Height = 17
            Caption = 'Invoice upfront'
            TabOrder = 8
          end
          object edtFAO: TEdit
            Left = 85
            Top = 38
            Width = 252
            Height = 21
            MaxLength = 40
            TabOrder = 9
          end
          object btnLUContact: TButton
            Left = 344
            Top = 36
            Width = 25
            Height = 25
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
            OnClick = btnLUContactClick
          end
          object CountyEdit: TEdit
            Left = 221
            Top = 178
            Width = 116
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 10
            ReadOnly = True
            TabOrder = 11
          end
        end
        object QtysGrpBox: TGroupBox
          ParentBackground = False
          Left = 8
          Top = 138
          Width = 145
          Height = 171
          Caption = 'Quantities'
          TabOrder = 2
          object Label5: TLabel
            Left = 8
            Top = 20
            Width = 49
            Height = 13
            Caption = 'To Deliver'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 8
            Top = 46
            Width = 45
            Height = 13
            Caption = 'Delivered'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 8
            Top = 72
            Width = 41
            Height = 13
            Caption = 'Invoiced'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label1: TLabel
            Left = 8
            Top = 123
            Width = 57
            Height = 13
            Caption = 'No of boxes'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 8
            Top = 98
            Width = 37
            Height = 13
            Caption = 'Box Qty'
          end
          object Label2: TLabel
            Left = 8
            Top = 148
            Width = 62
            Height = 13
            Caption = 'Weight (gms)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object QtyToDeliverMemo: TMemo
            Left = 72
            Top = 16
            Width = 65
            Height = 21
            Alignment = taRightJustify
            TabOrder = 0
            WantReturns = False
            WordWrap = False
            OnChange = CheckOK
            OnEnter = SaveValue
            OnExit = ValidateQty
            OnKeyPress = QtyToDeliverMemoKeyPress
            OnKeyUp = QtyToDeliverMemoKeyUp
          end
          object QtyDeliveredMemo: TMemo
            Left = 72
            Top = 42
            Width = 65
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            TabOrder = 1
            WantReturns = False
            WordWrap = False
            OnChange = CheckOK
            OnEnter = SaveValue
            OnExit = ValidateQty
          end
          object QtyInvoicedMemo: TMemo
            Left = 72
            Top = 68
            Width = 65
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            TabOrder = 2
            WantReturns = False
            WordWrap = False
            OnChange = CheckOK
            OnEnter = SaveValue
            OnExit = ValidateQty
          end
          object NoOfBoxesMemo: TMemo
            Left = 72
            Top = 119
            Width = 65
            Height = 21
            Alignment = taRightJustify
            TabOrder = 4
            WantReturns = False
            WordWrap = False
            OnChange = CheckOK
            OnEnter = SaveValue
            OnExit = ValidateQty
          end
          object BoxQtyMemo: TMemo
            Left = 72
            Top = 94
            Width = 65
            Height = 21
            Alignment = taRightJustify
            TabOrder = 3
            WantReturns = False
            WordWrap = False
            OnChange = CheckOK
            OnEnter = SaveValue
            OnExit = ValidateQty
          end
          object WeightMemo: TMemo
            Left = 72
            Top = 144
            Width = 65
            Height = 21
            Alignment = taRightJustify
            TabOrder = 5
            WantReturns = False
            WordWrap = False
            OnChange = CheckOK
            OnEnter = SaveValue
            OnExit = ValidateQty
          end
        end
        object DatePointEdit: TEdit
          Left = 250
          Top = 254
          Width = 81
          Height = 21
          TabOrder = 3
          OnExit = DatePointEditExit
        end
        object SearchBtn: TButton
          Left = 504
          Top = 34
          Width = 25
          Height = 25
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = SearchBtnClick
        end
        object DeliveryDateEdit: TEdit
          Left = 461
          Top = 280
          Width = 81
          Height = 21
          TabOrder = 5
          OnExit = DeliveryDateEditExit
        end
        object DeliverViachk: TCheckBox
          Left = 8
          Top = 5
          Width = 385
          Height = 17
          Caption = 'DeliverViachk'
          TabOrder = 6
        end
        object DatePointBtn: TBitBtn
          Left = 336
          Top = 252
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
          OnClick = DatePointBtnClick
        end
        object DeliveryDateBtn: TBitBtn
          Left = 548
          Top = 279
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
          OnClick = DeliveryDateBtnClick
        end
        object CustReqDateEdit: TEdit
          Left = 250
          Top = 280
          Width = 81
          Height = 21
          TabOrder = 9
          OnExit = CustReqDateEditExit
        end
        object CustReqDatebtn: TBitBtn
          Left = 336
          Top = 279
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
          OnClick = CustReqDatebtnClick
        end
        object btnClear: TBitBtn
          Left = 544
          Top = 35
          Width = 27
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
          TabOrder = 11
          OnClick = btnClearClick
        end
        object DeliveryToStockChk: TCheckBox
          Left = 168
          Top = 228
          Width = 121
          Height = 17
          Caption = 'Delivery in to Stock'
          TabOrder = 12
          OnClick = DeliveryToStockChkClick
        end
      end
      object pnlCourierService: TPanel
        ParentBackground = False
        Left = 0
        Top = 316
        Width = 620
        Height = 36
        Align = alTop
        TabOrder = 2
        ExplicitWidth = 628
        object lblCourier: TLabel
          Left = 16
          Top = 12
          Width = 137
          Height = 13
          AutoSize = False
          Caption = 'Courier Details'
        end
        object Label20: TLabel
          Left = 160
          Top = 12
          Width = 36
          Height = 13
          Caption = 'Service'
        end
        object Label21: TLabel
          Left = 377
          Top = 12
          Width = 70
          Height = 13
          Caption = 'Package Type'
        end
        object dblkpCourierService: TDBLookupComboBox
          Left = 208
          Top = 8
          Width = 153
          Height = 21
          KeyField = 'Service_no'
          ListField = 'Service_Description'
          ListSource = PBPODM.dtsCourierService
          TabOrder = 0
        end
        object dblkppackageType: TDBLookupComboBox
          Left = 464
          Top = 8
          Width = 115
          Height = 21
          KeyField = 'Package_Type'
          ListField = 'Package_Type_Descr'
          ListSource = PBPODM.dtsPackageType
          TabOrder = 1
        end
      end
    end
    object tbshtStock: TTabSheet
      Caption = 'Locations'
      ImageIndex = 1
      OnShow = tbshtStockShow
      object Label3: TLabel
        Left = 16
        Top = 266
        Width = 74
        Height = 15
        Caption = 'Qty To Deliver'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object sgBins: TStringGrid
        Left = 8
        Top = 16
        Width = 489
        Height = 233
        DefaultRowHeight = 22
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        PopupMenu = pMnBins
        TabOrder = 0
        OnDblClick = popChangeClick
        OnDrawCell = sgBinsDrawCell
        ColWidths = (
          173
          74
          71
          71
          69)
      end
      object memQtyDelivIn: TMemo
        Left = 104
        Top = 256
        Width = 65
        Height = 25
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 1
        WantReturns = False
        OnChange = CheckOK
        OnEnter = SaveValue
        OnExit = ValidateQty
        OnKeyPress = QtyToDeliverMemoKeyPress
        OnKeyUp = QtyToDeliverMemoKeyUp
      end
    end
    object tbshtCallOffs: TTabSheet
      Caption = 'Picking Locations'
      ImageIndex = 2
      OnShow = tbshtCallOffsShow
      object Label13: TLabel
        Left = 16
        Top = 266
        Width = 101
        Height = 15
        Caption = 'Quantity To Deliver'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 16
        Top = 298
        Width = 75
        Height = 13
        Caption = 'Quantity to Pick'
      end
      object sgPick: TStringGrid
        Left = 16
        Top = 16
        Width = 545
        Height = 233
        ColCount = 4
        DefaultRowHeight = 22
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 0
        OnDrawCell = sgPickDrawCell
        OnKeyPress = sgPickKeyPress
        OnKeyUp = sgPickKeyUp
        OnSelectCell = sgPickSelectCell
        ColWidths = (
          159
          178
          89
          82)
      end
      object memQtyDElivOut: TMemo
        Left = 128
        Top = 256
        Width = 65
        Height = 25
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 1
        WantReturns = False
        OnChange = CheckOK
        OnEnter = SaveValue
        OnExit = ValidateQty
        OnKeyPress = QtyToDeliverMemoKeyPress
        OnKeyUp = QtyToDeliverMemoKeyUp
      end
      object memQtyToPick: TMemo
        Left = 128
        Top = 288
        Width = 65
        Height = 25
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 2
        WantReturns = False
        OnChange = CheckOK
        OnEnter = SaveValue
        OnExit = ValidateQty
        OnKeyPress = QtyToDeliverMemoKeyPress
        OnKeyUp = QtyToDeliverMemoKeyUp
      end
    end
    object TbShtStkLocs: TTabSheet
      Caption = 'Stock Locations'
      ImageIndex = 3
      OnShow = TbShtStkLocsShow
      object Label16: TLabel
        Left = 16
        Top = 322
        Width = 66
        Height = 15
        Caption = 'Qty To Stock'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object FromStoreLabel: TLabel
        Left = 32
        Top = 24
        Width = 25
        Height = 13
        Caption = 'Store'
      end
      object MemQtyToStock: TMemo
        Left = 96
        Top = 312
        Width = 65
        Height = 25
        Alignment = taRightJustify
        ReadOnly = True
        TabOrder = 0
        WantReturns = False
        OnChange = CheckOK
        OnEnter = SaveValue
        OnExit = ValidateQty
        OnKeyPress = QtyToDeliverMemoKeyPress
        OnKeyUp = QtyToDeliverMemoKeyUp
      end
      object SGStock: TStringGrid
        Left = 16
        Top = 64
        Width = 545
        Height = 233
        ColCount = 6
        DefaultRowHeight = 22
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        PopupMenu = pMenuStock
        TabOrder = 1
        OnDblClick = SGStockDblClick
        OnDrawCell = SGStockDrawCell
        OnKeyPress = sgPickKeyPress
        OnSelectCell = sgPickSelectCell
        ColWidths = (
          101
          72
          72
          67
          100
          98)
      end
      object StoreDBLookupComboBox: TDBLookupComboBox
        Left = 72
        Top = 16
        Width = 193
        Height = 21
        KeyField = 'Part_Store'
        ListField = 'Part_Store_Name'
        ListSource = dtmdlStockMove.StoresDataSource
        TabOrder = 2
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 592
    Width = 628
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 604
    ExplicitWidth = 636
  end
  object pMnBins: TPopupMenu
    OnPopup = pMnBinsPopup
    Left = 124
    Top = 227
    object popAdd: TMenuItem
      Caption = 'Add'
      OnClick = popAddClick
    end
    object popChange: TMenuItem
      Caption = 'Change'
      OnClick = popChangeClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Adjustment1: TMenuItem
      Caption = 'Adjustment'
      OnClick = Adjustment1Click
    end
  end
  object pMenuStock: TPopupMenu
    OnPopup = pMenuStockPopup
    Left = 188
    Top = 235
    object StockAdd: TMenuItem
      Caption = '&Add'
      OnClick = StockAddClick
    end
    object StockChange: TMenuItem
      Caption = '&Change'
      OnClick = StockChangeClick
    end
    object StockDel: TMenuItem
      Caption = '&Delete'
      OnClick = StockDelClick
    end
  end
  object QueryGetPOlineDets: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purchase_orderline.Purchase_order,'
      '                Purchase_orderline.Forms_per_Box,'
      '                Purchase_orderline.Quantity,'
      '                Purchase_OrderLine.Order_Price,'
      '                Purchase_OrderLine.Selling_Price,'
      '                Purchase_OrderLine.Order_Unit,'
      '                Purchase_OrderLine.Sell_Unit,'
      '                Purchase_OrderLine.Vat_Code,'
      '                Purchase_OrderLine.Invoice_upfront,'
      '                Purchase_OrderLine.Number_Instructions,'
      '                Purchase_orderLine.Product_Type,'
      '                Purchase_orderLine.FSC_Material_Claim,'
      '                Purchase_orderLine.FSC_Mixed_Percentage'
      'from Purchase_orderline'
      'where'
      '(Purchase_orderline.purchase_order = :OrderNo) and'
      '(Purchase_orderline.Line = :OrderLine)')
    Left = 100
    Top = 163
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OrderNo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OrderLine'
        ParamType = ptUnknown
      end>
  end
  object GetMoveRecsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Store_Quantity,'
      '        Part_Movement_Bin,'
      '        Part_movement_Notes,'
      '        Stock_pack_Quantity,'
      '        Store_Cost'
      'from Part_Movement'
      'where'
      '  (Part_Movement.Part_Movement_Reference = :MoveRef) and'
      '   (Part_Movement.Part_Movement_Type = :MoveType) and'
      '   (Part_Movement.Part_Movement_Store = :Store)'
      ' '
      ' ')
    Left = 324
    Top = 243
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MoveRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MoveType'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store'
        ParamType = ptUnknown
      end>
  end
  object UpdStoreLvlSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Part_Store_Levels'
      
        '(Part, Part_Store_Type, Minimum_Stock, Maximum_Stock, Purchase_O' +
        'r_Store, Replenish_Store)'
      'values'
      '(:Part, 1, :MinMax_Qty, :MinMax_Qty, '#39'P'#39', :rep_Store)'
      ' '
      ' '
      ' '
      ' ')
    Left = 336
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MinMax_Qty'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MinMax_Qty'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'rep_Store'
        ParamType = ptUnknown
      end>
  end
  object StoreLvlSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select part'
      'from Part_Store_Levels'
      'where (Purchase_or_Store = '#39'P'#39') and (Part_store_Type ='#39'1'#39')  and'
      '  (part = :Part)')
    Left = 392
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end>
  end
  object FlashDelivTimer: TTimer
    Enabled = False
    OnTimer = FlashDelivTimerTimer
    Left = 416
    Top = 260
  end
  object ChkOneDelivSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT (Delivery_Detail.Qty_Invoiced+Delivery_Detail.Qty_Deliver' +
        'ed) AS Tot_qty'
      'FROM Delivery_Detail'
      'WHERE (((Delivery_Detail.Purchase_Order)=:Purch_Ord))'
      ' '
      ' ')
    Left = 148
    Top = 267
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end>
  end
  object UpdOrdQtySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purchase_OrderLine'
      'set quantity = :deliv_Qty'
      'WHERE (Purchase_OrderLine.Purchase_Order =:Purch_Ord) and'
      '  (Purchase_OrderLine.Line = :Line)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 148
    Top = 323
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'deliv_Qty'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryVersions: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'Select Purchase_Order,'
      '       Line,'
      '       Stock_Code_No,'
      '       Purchase_OrderLineStockCode.Form_Reference,'
      '       Quantity_Ordered,'
      '       Quantity_Delivered,'
      
        '       (Quantity_Ordered - Quantity_Delivered) as Quantity_Outst' +
        'anding,'
      '       Form_Reference.Form_Reference_ID,'
      '       Form_Reference.Form_Reference_Descr as Description,'
      '       Form_Reference.Stock_Reference,'
      
        '       Form_Reference.Stock_Reference + '#39' - '#39' + Form_Reference.F' +
        'orm_Reference_Descr as Stock_Description'
      'From Purchase_OrderLineStockCode, Form_Reference'
      'Where Purchase_Order = :Purchase_Order and Line = 1 and'
      
        '      Purchase_OrderLineStockCode.Form_Reference = Form_Referenc' +
        'e.Form_Reference and'
      '      (Quantity_Ordered - Quantity_Delivered) > 0'
      'Order By Form_Reference.Stock_Reference')
    Left = 464
    Top = 18
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object dtsVersions: TDataSource
    DataSet = qryVersions
    Left = 513
    Top = 22
  end
  object qryUpPOVersions: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purchase_OrderLineStockCode'
      
        'set Quantity_Delivered = Quantity_Delivered + :Quantity_Delivere' +
        'd'
      'WHERE Purchase_Order = :Purchase_Order AND'
      'Line = :Line AND'
      'Stock_Code_No = :Stock_Code_No')
    Left = 466
    Top = 79
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quantity_Delivered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Code_No'
        ParamType = ptUnknown
      end>
  end
  object qryGetPODelivery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 * '
      'from Delivery_Detail'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :Line'
      'Order By Delivery_no Desc')
    Left = 34
    Top = 455
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryAddPODelivery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Delivery_Detail'
      '(Purchase_order,'
      'Line,'
      'Delivery_no,'
      'Qty_to_deliver,'
      'Qty_Delivered,'
      'Qty_Invoiced,'
      'Date_Point,'
      'Delivery_to_Stock,'
      'Company_Branch'
      ')'
      'Values'
      '(:Purchase_order,'
      ':Line,'
      ':Delivery_no,'
      ':Qty_to_deliver,'
      ':Qty_Delivered,'
      ':Qty_Invoiced,'
      ':Date_Point,'
      ':Delivery_to_Stock,'
      ':Company_Branch'
      ')')
    Left = 121
    Top = 454
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_to_deliver'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Delivered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Point'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_to_Stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Company_Branch'
        ParamType = ptUnknown
      end>
  end
  object qryGetNextPODelivery: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select max(Delivery_no) as Last_Delivery'
      'from delivery_detail'
      'where purchase_order = :purchase_order and Line = :Line')
    Left = 210
    Top = 455
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
end
