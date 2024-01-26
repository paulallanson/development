object PBMaintPOrdLineDelivFrm: TPBMaintPOrdLineDelivFrm
  Left = 102
  Top = 14
  Caption = 'Maintain Purchase Order Line Deliveries'
  ClientHeight = 546
  ClientWidth = 586
  Color = clBtnFace
  Constraints.MinHeight = 575
  Constraints.MinWidth = 600
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 505
    Width = 586
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    object DelLabel: TLabel
      Left = 224
      Top = 11
      Width = 145
      Height = 15
      Caption = 'Delete the above details ?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object OKBitBtn: TBitBtn
      Left = 384
      Top = 6
      Width = 75
      Height = 25
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
      Left = 472
      Top = 6
      Width = 75
      Height = 25
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
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 586
    Height = 41
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object POrdLabel: TLabel
      Left = 8
      Top = 3
      Width = 53
      Height = 13
      Caption = 'POrdLabel'
    end
    object DeliverViachk: TCheckBox
      Left = 8
      Top = 19
      Width = 385
      Height = 17
      Caption = 'DeliverViachk'
      TabOrder = 0
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 41
    Width = 586
    Height = 464
    Align = alClient
    Caption = 'pnlDetails'
    ParentBackground = False
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 584
      Height = 292
      Align = alTop
      ParentBackground = False
      TabOrder = 0
      object Label9: TLabel
        Left = 160
        Top = 270
        Width = 79
        Height = 13
        Caption = 'Cust req'#39'd date'
      end
      object Label11: TLabel
        Left = 378
        Top = 270
        Width = 74
        Height = 13
        Caption = 'Date delivered'
      end
      object Label13: TLabel
        Left = 160
        Top = 242
        Width = 83
        Height = 13
        Caption = 'Supp req'#39'd date'
      end
      object AddrTypeRadGrp: TRadioGroup
        Left = 8
        Top = 4
        Width = 105
        Height = 105
        Caption = 'Address Type'
        Items.Strings = (
          'Ad Hoc'
          'Supplier'
          'Rep'
          'Customer'
          'Company')
        ParentBackground = False
        TabOrder = 0
        OnClick = AddrTypeRadGrpClick
      end
      object AddrGrpBox: TGroupBox
        Left = 160
        Top = 4
        Width = 388
        Height = 225
        Caption = 'Address Details'
        ParentBackground = False
        TabOrder = 1
        object AddrTypeLabel: TLabel
          Left = 8
          Top = 24
          Width = 51
          Height = 13
          Caption = 'Addr Type'
        end
        object BranchNameLabel: TLabel
          Left = 8
          Top = 74
          Width = 35
          Height = 13
          Caption = 'Branch'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 8
          Top = 100
          Width = 41
          Height = 13
          Caption = 'Address'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 8
          Top = 198
          Width = 47
          Height = 13
          Caption = 'Postcode'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblFAO: TLabel
          Left = 8
          Top = 49
          Width = 21
          Height = 13
          Caption = 'FAO'
        end
        object Label3: TLabel
          Left = 184
          Top = 198
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
        object NameEdit: TEdit
          Left = 85
          Top = 20
          Width = 260
          Height = 21
          MaxLength = 40
          ReadOnly = True
          TabOrder = 0
        end
        object BranchNameEdit: TEdit
          Left = 85
          Top = 70
          Width = 260
          Height = 21
          MaxLength = 40
          ReadOnly = True
          TabOrder = 1
        end
        object BuildingEdit: TEdit
          Left = 85
          Top = 95
          Width = 260
          Height = 21
          MaxLength = 40
          ReadOnly = True
          TabOrder = 2
        end
        object StreetEdit: TEdit
          Left = 85
          Top = 120
          Width = 260
          Height = 21
          MaxLength = 40
          ReadOnly = True
          TabOrder = 3
        end
        object LocaleEdit: TEdit
          Left = 85
          Top = 145
          Width = 260
          Height = 21
          MaxLength = 40
          ReadOnly = True
          TabOrder = 4
        end
        object TownEdit: TEdit
          Left = 85
          Top = 170
          Width = 260
          Height = 21
          MaxLength = 40
          ReadOnly = True
          TabOrder = 5
        end
        object PostCodeEdit: TEdit
          Left = 85
          Top = 194
          Width = 84
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 10
          ReadOnly = True
          TabOrder = 6
        end
        object edtFAO: TEdit
          Left = 85
          Top = 45
          Width = 260
          Height = 21
          MaxLength = 40
          TabOrder = 8
        end
        object btnLUContact: TButton
          Left = 352
          Top = 44
          Width = 25
          Height = 25
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          OnClick = btnLUContactClick
        end
        object CountyEdit: TEdit
          Left = 229
          Top = 194
          Width = 116
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 10
          ReadOnly = True
          TabOrder = 7
        end
      end
      object QtysGrpBox: TGroupBox
        Left = 8
        Top = 117
        Width = 145
        Height = 166
        Caption = 'Quantities'
        ParentBackground = False
        TabOrder = 2
        object Label5: TLabel
          Left = 8
          Top = 20
          Width = 50
          Height = 13
          Caption = 'To Deliver'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 8
          Top = 46
          Width = 48
          Height = 13
          Caption = 'Delivered'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 8
          Top = 72
          Width = 43
          Height = 13
          Caption = 'Invoiced'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 8
          Top = 98
          Width = 32
          Height = 26
          Caption = 'No of boxes'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label14: TLabel
          Left = 8
          Top = 125
          Width = 68
          Height = 13
          Caption = 'Weight (gms)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
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
          Top = 121
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
      end
      object SearchBtn: TButton
        Left = 512
        Top = 23
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = SearchBtnClick
      end
      object DeliveryDateEdit: TEdit
        Left = 464
        Top = 262
        Width = 81
        Height = 21
        ReadOnly = True
        TabOrder = 4
        OnExit = DeliveryDateEditExit
      end
      object DatePointEdit: TEdit
        Left = 250
        Top = 238
        Width = 81
        Height = 21
        TabOrder = 5
        OnExit = DatePointEditExit
      end
      object CustReqDateEdit: TEdit
        Left = 250
        Top = 262
        Width = 81
        Height = 21
        TabOrder = 6
        OnExit = CustReqDateEditExit
      end
      object DatePointBtn: TBitBtn
        Left = 338
        Top = 236
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
        Left = 552
        Top = 258
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
        Visible = False
        OnClick = DeliveryDateBtnClick
      end
      object CustReqDateBtn: TBitBtn
        Left = 338
        Top = 258
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
        TabOrder = 9
        OnClick = CustReqDateBtnClick
      end
      object btnClear: TBitBtn
        Left = 554
        Top = 23
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
        TabOrder = 10
        OnClick = btnClearClick
      end
      object DeliveryToStockChk: TCheckBox
        Left = 376
        Top = 237
        Width = 133
        Height = 17
        Caption = 'Delivery in to stock'
        TabOrder = 11
      end
    end
    object pnlCourierService: TPanel
      Left = 1
      Top = 293
      Width = 584
      Height = 36
      Align = alTop
      ParentBackground = False
      TabOrder = 1
      object Label2: TLabel
        Left = 160
        Top = 12
        Width = 35
        Height = 13
        Caption = 'Service'
      end
      object lblCourier: TLabel
        Left = 16
        Top = 12
        Width = 137
        Height = 13
        AutoSize = False
        Caption = 'Courier Details'
      end
      object Label16: TLabel
        Left = 377
        Top = 12
        Width = 68
        Height = 13
        Caption = 'Package Type'
      end
      object dblkppackageType: TDBLookupComboBox
        Left = 464
        Top = 8
        Width = 115
        Height = 21
        KeyField = 'Package_Type'
        ListField = 'Package_Type_Descr'
        ListSource = PBPODM.dtsPackageType
        TabOrder = 0
      end
      object dblkpCourierService: TDBLookupComboBox
        Left = 208
        Top = 8
        Width = 153
        Height = 21
        KeyField = 'Service_no'
        ListField = 'Service_Description'
        ListSource = PBPODM.dtsCourierService
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 329
      Width = 584
      Height = 65
      Align = alClient
      ParentBackground = False
      TabOrder = 2
      object Label12: TLabel
        Left = 17
        Top = 10
        Width = 73
        Height = 13
        Caption = 'Delivery Notes'
      end
      object DelNotesMemo: TMemo
        Left = 147
        Top = 2
        Width = 374
        Height = 70
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
    end
    object DelInstructPanel: TPanel
      Left = 1
      Top = 394
      Width = 584
      Height = 69
      Align = alBottom
      ParentBackground = False
      TabOrder = 3
      object Label10: TLabel
        Left = 17
        Top = 10
        Width = 104
        Height = 13
        Caption = 'Delivery Instructions'
      end
      object DelInstructMemo: TMemo
        Left = 147
        Top = 2
        Width = 374
        Height = 70
        TabOrder = 0
      end
    end
  end
end
