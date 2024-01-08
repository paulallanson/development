object PBRSPORepMFrm: TPBRSPORepMFrm
  Left = 216
  Top = 103
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Purchase Order Margins'
  ClientHeight = 471
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object SupplierLabel: TLabel
    Left = 176
    Top = 8
    Width = 82
    Height = 13
    Caption = 'Supplier/Branch'
    Visible = False
  end
  object Label1: TLabel
    Left = 8
    Top = 160
    Width = 56
    Height = 13
    Caption = 'Date From:'
    Visible = False
  end
  object Label2: TLabel
    Left = 8
    Top = 224
    Width = 42
    Height = 13
    Caption = 'Date To:'
    Visible = False
  end
  object DateFromButton: TSpeedButton
    Left = 128
    Top = 176
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
    OnClick = DateFromButtonClick
  end
  object DateToButton: TSpeedButton
    Left = 128
    Top = 240
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
    OnClick = DateToButtonClick
  end
  object CustBranchLabel: TLabel
    Left = 176
    Top = 80
    Width = 49
    Height = 13
    Caption = 'Customer'
    Visible = False
  end
  object AllOrOneRadioGroup: TRadioGroup
    Left = 8
    Top = 8
    Width = 113
    Height = 65
    ItemIndex = 0
    Items.Strings = (
      'All Suppliers'
      'One Supplier')
    ParentBackground = False
    TabOrder = 0
    OnClick = AllOrOneRadioGroupClick
  end
  object PrintBitBtn: TBitBtn
    Left = 336
    Top = 432
    Width = 75
    Height = 25
    Caption = '&Print'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
    TabOrder = 1
    OnClick = PrintBitBtnClick
  end
  object PreviewBitBtn: TBitBtn
    Left = 248
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Pre&view'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    TabOrder = 2
    OnClick = PreviewBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 8
    Top = 432
    Width = 75
    Height = 25
    Caption = '&Cancel'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object SuppEdit: TEdit
    Left = 176
    Top = 24
    Width = 201
    Height = 21
    ReadOnly = True
    TabOrder = 4
    Visible = False
  end
  object RepTypeRadioGroup: TRadioGroup
    Left = 160
    Top = 160
    Width = 129
    Height = 145
    Caption = 'Sort first by'
    ItemIndex = 0
    Items.Strings = (
      'Product Type                       '
      'Supplier'
      'Customer'
      'Rep                         '
      'Estimator                          '
      'Account Type'
      'Customer Branch')
    ParentBackground = False
    TabOrder = 5
  end
  object DateFromEdit: TEdit
    Left = 8
    Top = 176
    Width = 113
    Height = 21
    MaxLength = 10
    TabOrder = 6
    OnExit = DateFromEditExit
  end
  object DateToEdit: TEdit
    Left = 8
    Top = 240
    Width = 113
    Height = 21
    MaxLength = 10
    TabOrder = 7
    OnExit = DateToEditExit
  end
  object LUSuppButton: TButton
    Left = 384
    Top = 24
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    Visible = False
    OnClick = LUSuppButtonClick
  end
  object CustRadioGroup: TRadioGroup
    Left = 8
    Top = 80
    Width = 113
    Height = 65
    ItemIndex = 0
    Items.Strings = (
      'All Customers'
      'One Customer')
    ParentBackground = False
    TabOrder = 9
    OnClick = CustRadioGroupClick
  end
  object CustEdit: TEdit
    Left = 176
    Top = 96
    Width = 201
    Height = 21
    ReadOnly = True
    TabOrder = 10
    Visible = False
  end
  object LUCustButton: TButton
    Left = 384
    Top = 96
    Width = 25
    Height = 25
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    Visible = False
    OnClick = LUCustButtonClick
  end
  object sort2RadioGroup: TRadioGroup
    Left = 296
    Top = 160
    Width = 113
    Height = 89
    Caption = 'then sort by'
    ItemIndex = 0
    Items.Strings = (
      'Order'
      'Product Type'
      'Job Description')
    ParentBackground = False
    TabOrder = 12
  end
  object Panel1: TPanel
    Left = 8
    Top = 307
    Width = 217
    Height = 86
    ParentBackground = False
    TabOrder = 13
    object ExCallOffsChkBox: TCheckBox
      Left = 16
      Top = 8
      Width = 193
      Height = 17
      Caption = 'Exclude Call Off Orders'
      TabOrder = 0
    end
    object ChkBxCnclld: TCheckBox
      Left = 16
      Top = 61
      Width = 193
      Height = 17
      Caption = 'Only Show Cancelled Orders'
      TabOrder = 1
    end
    object ExJobBagsChkBox: TCheckBox
      Left = 16
      Top = 25
      Width = 193
      Height = 17
      Caption = 'Exclude Job Bag Orders'
      TabOrder = 2
    end
  end
  object AddCostsCheckBox: TCheckBox
    Left = 24
    Top = 351
    Width = 193
    Height = 17
    Caption = 'Include Additional costs'
    TabOrder = 14
  end
  object rdgrpInclude: TRadioGroup
    Left = 230
    Top = 304
    Width = 185
    Height = 65
    Caption = 'Orders to include '
    ItemIndex = 0
    Items.Strings = (
      'All Purchase Orders'
      'Invoice on Call Off Orders')
    ParentBackground = False
    TabOrder = 15
  end
end
