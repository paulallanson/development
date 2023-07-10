object frmWTMaintQuote: TfrmWTMaintQuote
  Left = 165
  Top = 16
  Width = 1136
  Height = 716
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Quote details'
  Color = clBtnFace
  Constraints.MinHeight = 671
  Constraints.MinWidth = 1123
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label21: TLabel
    Left = 432
    Top = 240
    Width = 51
    Height = 13
    Caption = 'Telephone'
  end
  object Label22: TLabel
    Left = 432
    Top = 268
    Width = 66
    Height = 13
    Caption = 'Email Address'
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1128
    Height = 169
    Align = alTop
    TabOrder = 0
    object pnlRevenueCentre: TPanel
      Left = 1
      Top = 128
      Width = 1126
      Height = 40
      Align = alBottom
      TabOrder = 1
      DesignSize = (
        1126
        40)
      object Label59: TLabel
        Left = 7
        Top = 12
        Width = 78
        Height = 13
        Caption = 'Revenue Centre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 308
        Top = 7
        Width = 23
        Height = 22
        Hint = 'Clear Revenue Centre'
        Anchors = [akLeft, akBottom]
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
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object dblkpRevenueCentre: TDBLookupComboBox
        Left = 96
        Top = 8
        Width = 201
        Height = 21
        KeyField = 'Revenue_Centre'
        ListField = 'Revenue_Centre_Descr'
        TabOrder = 0
        OnClick = dblkpRevenueCentreClick
      end
    end
    object pnlHeader: TPanel
      Left = 1
      Top = 1
      Width = 1126
      Height = 127
      Align = alClient
      TabOrder = 0
      DesignSize = (
        1126
        127)
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 59
        Height = 13
        Caption = 'Quote No.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 212
        Top = 12
        Width = 66
        Height = 13
        Caption = 'Quote Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 914
        Top = 12
        Width = 83
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Office Contact'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 8
        Top = 40
        Width = 46
        Height = 13
        Caption = 'Material'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 63
        Width = 65
        Height = 13
        Caption = 'Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 700
        Top = 90
        Width = 60
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Reference'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 593
        Top = 12
        Width = 88
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Follow Up Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnHigh: TSpeedButton
        Left = 814
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Importance: High'
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btnHighClick
      end
      object btnLow: TSpeedButton
        Left = 838
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Importance: Low'
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000EB040000EB0400000000000000000000F7F7F7F7F7F7
          F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
          F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7EE
          B88BEDBB8FF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
          F7F7F7F7F7F7F7F7F7F7F7F7F3C7A4C47E3BCC8039F3C9A8F7F7F7F7F7F7F7F7
          F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F3D3BBE08834FF
          D09BD3A779C87225F3D6BFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
          F7F7F7F7F7F7F5DECDD77C2BFEC991F7BA7DF7B776C99864C86D20F4DFD0F7F7
          F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F5E6DCD37829FAC289F4B577F0
          AF6CF0AB67EEA962C58C50C66E24F5E7DFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
          F6EFE8D28037FDC58AF8C48DF0B579EBA660EAA35AE99F55EBA052C28440C673
          33F5EEEAF7F7F7F7F7F7F7F7F7F6F3F0D0823FCA7020CB7831DD9656F2C18DE8
          9D53E69A4EDD9348BA6B24B45B12B4570EC97D43F6F3F2F7F7F7F7F7F7F6F5F5
          F6F0ECF5EFECF7F7F7CE782FF1BB84E49647E49445DC8F3EAA5511F7F7F7F4F0
          ECF5F0ECF6F5F5F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7CC762EEFB77AE0
          8E3CE08E39D98834AA5410F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
          F7F7F7F7F7F7F7F7F7C9712AECAF70DD8630DB852ED68229A9500AF7F7F7F7F7
          F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7C46C24E7A760D9
          7E21D87D21D37A1CA74D07F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
          F7F7F7F7F7F7F7F7F7C46B20F0BC7EE49A4BE08B33D57B17A74A03F7F7F7F7F7
          F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7AD4809B04D0CAD
          4808AB4B0CAF4D0CA5420AF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
          F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
          F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
          F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnLowClick
      end
      object btnCalendarTask: TSpeedButton
        Left = 870
        Top = 6
        Width = 25
        Height = 25
        Hint = 'Create Calendar Task'
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          A2070000424DA207000000000000360000002800000019000000190000000100
          1800000000006C07000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFF
          FFFFFFFFFF00FDFDFDE5E5E5D4D4D4C7C7C7BFBFBFBBBBBBB5B5B5B5B5B5B6B6
          B6ADADADADADADADADADADADADADADADADADADADADADADADADB3B3B3B5B5B5B6
          B6B6BEBEBEC0C0C0CACACAD6D6D6E7E7E700FFFFFFEFEFEFE9E9E9DDDDDDDCDC
          DCDDDDDDE1E1E1DDDDDDE3E3E3E2E2E2E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3
          E3E3E1E1E1DDDDDDDDDDDDDDDDDDDCDCDCDBDBDBDCDCDCE0E0E0F2F2F200FFFF
          FFFFFFFFDADADADCDCDCDDDDDDDFDFDFE0E0E0E1E1E1E1E1E1E2E2E2E2E2E2E2
          E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E1E1E1E0E0E0E0E0E0DFDFDFDDDDDD
          DCDCDCDADADAF9F9F900FFFFFFFFFFFFDBDBDBDDDDDDDFDFDFE0E0E0E3E3E3E6
          E6E6E6E6E6E7E7E7E7E7E7E7E7E7E6E6E6E4E4E4E4E4E4E5E5E5ECECECE5E5E5
          E4E4E4E1E1E1E0E0E0DFDFDFDDDDDDDCDCDCD8D8D800FFFFFFFFFFFFDCDCDCDF
          DFDFE0E0E0E1E1E18B8B8B000000000000000000000000000000000000E7E7E7
          EFEFEF000000000000000000000000ECECECE1E1E1E0E0E0DFDFDFDEDEDEDADA
          DA00FFFFFFFFFFFFDDDDDDE0E0E0E2E2E2E2E2E2ECECEC000000000000CDCDCD
          CFCFCFC9C9C9F2F2F2EAEAEA000000020202E5E5E5F9F9F9000000000000E4E4
          E4E1E1E1E0E0E0DFDFDFDADADA00FFFFFFFFFFFFDFDFDFE0E0E0E2E2E2E3E3E3
          E3E3E3ECECEC000000040404F2F2F2E9E9E9E9E9E9A7A7A7000000F0F0F0E8E8
          E8E3E3E3000000000000E6E6E6E2E2E2E1E1E1E0E0E0DBDBDB00FFFFFFFFFFFF
          E0E0E0E1E1E1E3E3E3E4E4E4E5E5E5E5E5E5E9E9E9020202090909C2C2C2EBEB
          EB0000000000001A1A1AEEEEEEFAFAFA000000000000E6E6E6E3E3E3E2E2E2E1
          E1E1DBDBDB00FFFFFFFDFDFDE1E1E1E2E2E2E4E4E4E4E4E4EAEAEAEAEAEAE9E9
          E9EFEFEF0000000B0B0BF6F6F61A1A1A0000000A0A0A0E0E0E090909000000EB
          EBEBE5E5E5E4E4E4E3E3E3E1E1E1DCDCDC00FFFFFFFDFDFDE1E1E1E2E2E2E5E5
          E5E6E6E65454540B0B0BECECECEAEAEAF7F7F7000000020202F2F2F20000009D
          9D9DF4F4F4ECECECAEAEAEECECECE6E6E6E4E4E4E3E3E3E2E2E2DDDDDD00FFFF
          FFFCFCFCE2E2E2E4E4E4E4E4E4E6E6E6F9F9F90101010D0D0DF3F3F300000000
          0000ECECECEDEDED050505030303F9F9F9CACACA000000ECECECE7E7E7E5E5E5
          E3E3E3E2E2E2E1E1E100FFFFFFFDFDFDE2E2E2E3E3E3E5E5E5E6E6E6F2F2F2A9
          A9A9020202000000000000C3C3C3EEEEEEEDEDEDEAEAEA000000000000000000
          060606EAEAEAE6E6E6E5E5E5E4E4E4E2E2E2E0E0E000FFFFFFFDFDFDE2E2E2E3
          E3E3E6E6E6E6E6E6E8E8E8E9E9E9E9E9E9F0F0F0F2F2F2ECECECEDEDEDEDEDED
          ECECECEDEDEDF3F3F3EDEDEDEAEAEAE9E9E9E6E6E6E5E5E5E4E4E4E3E3E3DFDF
          DF00FFFFFFFDFDFDE2E2E2E3E3E3E6E6E6E6E6E6E8E8E8E9E9E9EAEAEAEAEAEA
          ECECECEDEDEDEDEDEDEDEDEDEDEDEDECECECEBEBEBEBEBEBEAEAEAE9E9E9E8E8
          E8E5E5E5E4E4E4E3E3E3DFDFDF00FFFFFFFFFBFF1DD0811ED1821ED1821DD081
          1ED1821CCF801DD0811CCF801DD0811DD0811CCF801CCF801DD0811DD0811CCF
          801DD0811CCF801ED1821DD0811ED1821DD0811DD0811BCC8700FFFFFFFFFDFF
          1DD68C26D7881DD68C09D086FDFCFF82E5BD69DFAF1EDA8F0BD2881DD68C1DD6
          8C1DD68C1DD68C1DD68C1DD68C1DD68C1DD68C1DD68C1DD68C1DD68C1DD68C1D
          D68C11CF8800FFFFFFFFFBFE1DD99119DC96FFFCFFF0FFFFF9F9FFA4F5DCF3FC
          F282E5BD00D9921EDA921DD9911DD9911DD9911DD9911DD9911DD9911DD9911D
          D9911DD9911DD9911DD9911DD9910ED48C00FFFFFFFFFAFC1ADA9317DA923EDC
          951DE49325D4910FE29816DE9725DE9A1FDB941ADA931ADA931ADA931ADA931A
          DA931ADA931ADA931ADA931ADA931ADA931ADA931ADA931ADA930BD58E00FFFF
          FFFFFAFC1CD8911CD8911CD8911CD8911CD8911CD8911CD8911CD8911CD8911C
          D8911CD8911CD8911CD8911CD8911CD8911CD8911CD8911CD8911CD8911CD891
          1CD8911CD8910DD38C00FFFFFFFFF9FF1FD08A1FD08A1FD08A1FD08A23CB88DF
          E7E0DDE2E378BC831FD08A1FD08A1FD08A1FD08A1FD08A1FD08A32C07DE5E6E2
          EADCE81DD5891FD08A1FD08A1FD08A1FD08A15CD8700FFFFFFFFF9FE36C48127
          C87D27C87D27C87D11CC7DEDEDEDEDEDEDE4F3F627C87D27C87D27C87D27C87D
          27C87D27C87DFFFCEFF1F1F1F1F1F11EC07E27C87D27C87D27C87D2CC17D16C4
          7E00FFFFFFFFFCFA25B8642CBD6F2CBD6F2CBD6F32B473F5F5F5F5F5F5EBF7F9
          2CBD6F2CBD6F2CBD6F2CBD6F2CBD6F2CBD6FFCFBF1F6F6F6F6F6F617BD762CBD
          6F2CBD6F2CB86B3BC185EFFDE100FFFFFFFFF9FDFBF8FF20A65324B15424B154
          24AE61F6F6F6F6F6F6FFF5F824B15424B15424B15424B15424B15424B154FDFF
          F4F5F5F5F5F5F52AA45E24B15423B0532FB158FFFFF2FFFDF700FFFFFFFFFFFF
          FFFFFFF9FBFCF4FDFFF4FDFFEFF7EDEEEEEEEEEEEEF8EDEFF4FDFFF4FDFFF4FD
          FFF4FDFFF4FDFFF4FDFFEBF4F8EDEDEDEDEDEDFFFAFFF4FDFFF4FDFFFFFBFFFF
          FFFFFFFFFF00}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCalendarTaskClick
      end
      object Label63: TLabel
        Left = 700
        Top = 66
        Width = 33
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Project'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblExpiryDate: TLabel
        Left = 392
        Top = 12
        Width = 42
        Height = 13
        Caption = 'Expires'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtQuoteNumber: TEdit
        Left = 96
        Top = 8
        Width = 97
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object dtpckQuoteDate: TDateTimePicker
        Left = 288
        Top = 8
        Width = 89
        Height = 21
        Date = 37882.000000000000000000
        Time = 37882.000000000000000000
        TabOrder = 1
      end
      object dblkpOperator: TDBLookupComboBox
        Left = 1002
        Top = 8
        Width = 114
        Height = 21
        Anchors = [akTop, akRight]
        KeyField = 'Operator'
        ListField = 'Operator_Name'
        TabOrder = 2
      end
      object dblkpMaterial: TDBLookupComboBox
        Left = 96
        Top = 36
        Width = 250
        Height = 21
        KeyField = 'Material_Type'
        ListField = 'Description'
        TabOrder = 3
        OnClick = dblkpMaterialClick
      end
      object edtReference: TEdit
        Left = 773
        Top = 86
        Width = 345
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 4
        OnChange = edtReferenceChange
      end
      object btnLUMatType: TBitBtn
        Left = 352
        Top = 35
        Width = 22
        Height = 22
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = btnLUMatTypeClick
      end
      object edtDescription: TMemo
        Left = 96
        Top = 62
        Width = 577
        Height = 59
        Anchors = [akLeft, akTop, akRight]
        Lines.Strings = (
          '')
        MaxLength = 255
        TabOrder = 6
        OnChange = edtDescriptionChange
      end
      object edtFollowUpDate: TEdit
        Left = 685
        Top = 8
        Width = 89
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 7
        OnExit = edtFollowUpDateExit
      end
      object btnFollowUpDate: TBitBtn
        Left = 781
        Top = 6
        Width = 25
        Height = 25
        Anchors = [akTop, akRight]
        TabOrder = 8
        OnClick = btnFollowUpDateClick
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
      end
      object edtProject: TEdit
        Left = 773
        Top = 62
        Width = 345
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 9
        OnChange = edtProjectChange
      end
      object edtExpiryDate: TEdit
        Left = 443
        Top = 8
        Width = 89
        Height = 21
        TabOrder = 10
        OnExit = edtFollowUpDateExit
      end
      object btnExpiryDate: TBitBtn
        Left = 539
        Top = 6
        Width = 25
        Height = 25
        TabOrder = 11
        OnClick = btnExpiryDateClick
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
      end
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 666
    Width = 1128
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object pcDetails: TPageControl
    Left = 0
    Top = 169
    Width = 1128
    Height = 316
    ActivePage = tbCustomer
    Align = alClient
    TabOrder = 2
    object tbCustomer: TTabSheet
      Caption = 'Customer'
      ImageIndex = 7
      DesignSize = (
        1120
        288)
      object Label4: TLabel
        Left = 8
        Top = 16
        Width = 53
        Height = 13
        Caption = 'Customer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 8
        Top = 40
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
      object Label6: TLabel
        Left = 7
        Top = 124
        Width = 37
        Height = 13
        Caption = 'Contact'
      end
      object Label20: TLabel
        Left = 8
        Top = 100
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
      object Label23: TLabel
        Left = 8
        Top = 81
        Width = 59
        Height = 13
        Caption = 'Town/City'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblAccepted: TLabel
        Left = 726
        Top = 218
        Width = 72
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Date Accepted'
        Visible = False
      end
      object Label30: TLabel
        Left = 726
        Top = 250
        Width = 78
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Templating Date'
        Visible = False
      end
      object Label17: TLabel
        Left = 7
        Top = 159
        Width = 50
        Height = 13
        Caption = 'Showroom'
      end
      object btnContactClear: TSpeedButton
        Left = 614
        Top = 121
        Width = 23
        Height = 22
        Anchors = [akTop, akRight]
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
        OnClick = btnContactClearClick
      end
      object lblDesigner: TLabel
        Left = 7
        Top = 189
        Width = 42
        Height = 13
        Caption = 'Designer'
      end
      object lblSalesLead: TLabel
        Left = 7
        Top = 220
        Width = 64
        Height = 13
        Caption = 'Sales Lead'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnCustomerSearch: TBitBtn
        Left = 587
        Top = 12
        Width = 22
        Height = 22
        Hint = 'Search for Customer'
        Anchors = [akTop, akRight]
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnCustomerSearchClick
        NumGlyphs = 2
      end
      object pnlAddress: TPanel
        Left = 74
        Top = 0
        Width = 512
        Height = 153
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 1
        DesignSize = (
          512
          153)
        object Label24: TLabel
          Left = 104
          Top = 101
          Width = 33
          Height = 13
          Caption = 'County'
        end
        object edtCustomerName: TEdit
          Left = 8
          Top = 12
          Width = 494
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnChange = edtCustomerNameChange
        end
        object edtStreet: TEdit
          Left = 8
          Top = 36
          Width = 494
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object edtlocale: TEdit
          Left = 8
          Top = 56
          Width = 494
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object edtTown: TEdit
          Left = 8
          Top = 77
          Width = 494
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object edtPostcode: TEdit
          Left = 8
          Top = 97
          Width = 81
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 4
        end
        object edtCounty: TEdit
          Left = 152
          Top = 97
          Width = 350
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
        end
        object edtContact: TEdit
          Left = 8
          Top = 120
          Width = 495
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
          OnChange = edtContactChange
        end
      end
      object btnContactSearch: TBitBtn
        Left = 587
        Top = 121
        Width = 22
        Height = 22
        Hint = 'Search for Customer'
        Anchors = [akTop, akRight]
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnContactSearchClick
        NumGlyphs = 2
      end
      object pnlTelephone: TPanel
        Left = 725
        Top = 0
        Width = 391
        Height = 153
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        TabOrder = 3
        object Telephone: TLabel
          Left = 0
          Top = 16
          Width = 61
          Height = 13
          Caption = 'Telephone'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Email: TLabel
          Left = 0
          Top = 40
          Width = 25
          Height = 13
          Caption = 'Email'
        end
        object Label50: TLabel
          Left = 0
          Top = 80
          Width = 48
          Height = 13
          Caption = 'Timescale'
        end
        object Label54: TLabel
          Left = 0
          Top = 104
          Width = 67
          Height = 13
          Caption = 'Call Back Day'
        end
        object Label56: TLabel
          Left = 0
          Top = 128
          Width = 71
          Height = 13
          Caption = 'Call Back Time'
        end
        object edtTelephone: TEdit
          Left = 88
          Top = 12
          Width = 289
          Height = 21
          TabOrder = 0
        end
        object edtEmail: TEdit
          Left = 88
          Top = 35
          Width = 289
          Height = 21
          TabOrder = 1
        end
        object edtTimescale: TEdit
          Left = 88
          Top = 75
          Width = 233
          Height = 21
          TabOrder = 2
          OnChange = edtTimescaleChange
        end
        object edtCallBackDay: TEdit
          Left = 88
          Top = 99
          Width = 177
          Height = 21
          TabOrder = 3
          OnChange = edtCallBackDayChange
        end
        object edtCallBackTime: TEdit
          Left = 88
          Top = 123
          Width = 121
          Height = 21
          TabOrder = 4
          OnChange = edtCallBackTimeChange
        end
        object chkbxOnMailingList: TCheckBox
          Left = 288
          Top = 128
          Width = 97
          Height = 17
          Caption = 'On Mailing List'
          TabOrder = 5
        end
      end
      object edtAccepted: TEdit
        Left = 814
        Top = 214
        Width = 90
        Height = 21
        Anchors = [akRight, akBottom]
        TabOrder = 4
        Visible = False
        OnExit = edtTemplateExit
      end
      object btnAccepted: TBitBtn
        Left = 910
        Top = 212
        Width = 25
        Height = 25
        Anchors = [akRight, akBottom]
        TabOrder = 5
        Visible = False
        OnClick = btnAcceptedClick
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
      end
      object edtTemplate: TEdit
        Left = 814
        Top = 246
        Width = 90
        Height = 21
        Anchors = [akRight, akBottom]
        TabOrder = 6
        Visible = False
        OnExit = edtTemplateExit
      end
      object btntemplate: TBitBtn
        Left = 910
        Top = 244
        Width = 25
        Height = 25
        Anchors = [akRight, akBottom]
        TabOrder = 7
        Visible = False
        OnClick = btntemplateClick
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
      end
      object dblkpShowroom: TDBLookupComboBox
        Left = 82
        Top = 155
        Width = 430
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        KeyField = 'Branch_no'
        ListField = 'Branch_Name'
        TabOrder = 8
      end
      object dblkpDesigner: TDBLookupComboBox
        Left = 82
        Top = 184
        Width = 430
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        KeyField = 'Designer'
        ListField = 'Designer_Name'
        TabOrder = 9
      end
      object btnDesigner: TBitBtn
        Left = 522
        Top = 183
        Width = 22
        Height = 22
        Hint = 'Search for Customer'
        Anchors = [akTop, akRight]
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        OnClick = btnDesignerClick
        NumGlyphs = 2
      end
      object dblkpLeadSource: TDBLookupComboBox
        Left = 81
        Top = 216
        Width = 201
        Height = 21
        KeyField = 'Sales_Lead_Source'
        ListField = 'Sales_Lead_Source_Descr'
        TabOrder = 10
      end
      object btnSalesLead: TBitBtn
        Left = 298
        Top = 215
        Width = 22
        Height = 22
        Hint = 'Search for Customer'
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        OnClick = btnSalesLeadClick
        NumGlyphs = 2
      end
    end
    object tbWorktops: TTabSheet
      Caption = 'Worktops'
      object Label10: TLabel
        Left = 16
        Top = 48
        Width = 25
        Height = 13
        Caption = 'Sizes'
      end
      object sgElements: TStringGrid
        Left = 0
        Top = 0
        Width = 1035
        Height = 260
        Align = alClient
        ColCount = 10
        DefaultColWidth = 40
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        OnDblClick = sgElementsDblClick
        ColWidths = (
          40
          179
          58
          73
          70
          76
          68
          72
          78
          206)
      end
      object Panel2: TPanel
        Left = 0
        Top = 260
        Width = 1120
        Height = 28
        Align = alBottom
        TabOrder = 1
        object lblWTTotalArea: TLabel
          Left = 8
          Top = 7
          Width = 83
          Height = 13
          Caption = 'Total Area (sqm): '
        end
        object lblWTTotalSales: TLabel
          Left = 296
          Top = 7
          Width = 89
          Height = 13
          Caption = 'Total Sales Value: '
        end
      end
      object Panel10: TPanel
        Left = 1035
        Top = 0
        Width = 85
        Height = 260
        Align = alRight
        TabOrder = 2
        object btnAddElts: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          Enabled = False
          TabOrder = 0
          OnClick = btnAddEltsClick
        end
        object btnChangeElts: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeEltsClick
        end
        object btnDeleteElts: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteEltsClick
        end
        object btnGlobalElts: TBitBtn
          Left = 8
          Top = 120
          Width = 75
          Height = 25
          Caption = '&Global'
          Enabled = False
          TabOrder = 3
          OnClick = btnGlobalEltsClick
        end
      end
    end
    object tbCutOuts: TTabSheet
      Caption = 'Cut Outs'
      ImageIndex = 1
      object sgCutOuts: TStringGrid
        Left = 0
        Top = 0
        Width = 1064
        Height = 215
        Align = alClient
        ColCount = 7
        DefaultColWidth = 40
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        OnDblClick = sgCutOutsDblClick
        ColWidths = (
          40
          158
          94
          85
          89
          82
          88)
      end
      object Panel5: TPanel
        Left = 1064
        Top = 0
        Width = 86
        Height = 215
        Align = alRight
        TabOrder = 1
        object btnAddCutOuts: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          Enabled = False
          TabOrder = 0
          OnClick = btnAddCutOutsClick
        end
        object btnChangeCutOuts: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeCutOutsClick
        end
        object btnDeleteCutOuts: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteCutOutsClick
        end
      end
      object Panel14: TPanel
        Left = 0
        Top = 215
        Width = 1150
        Height = 28
        Align = alBottom
        TabOrder = 2
        object lblCOTotalSales: TLabel
          Left = 8
          Top = 7
          Width = 86
          Height = 13
          Caption = 'Total Sales Value:'
        end
        object lblCOTotalCost: TLabel
          Left = 296
          Top = 7
          Width = 84
          Height = 13
          Caption = 'Total Cost Value: '
        end
      end
    end
    object tbEdges: TTabSheet
      Caption = 'Edges'
      ImageIndex = 2
      object sgEdges: TStringGrid
        Left = 0
        Top = 0
        Width = 1064
        Height = 215
        Align = alClient
        ColCount = 7
        DefaultColWidth = 40
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        OnDblClick = sgEdgesDblClick
        ColWidths = (
          40
          158
          108
          86
          94
          92
          92)
      end
      object Panel6: TPanel
        Left = 1064
        Top = 0
        Width = 86
        Height = 215
        Align = alRight
        TabOrder = 1
        object btnAddEdges: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          Enabled = False
          TabOrder = 0
          OnClick = btnAddEdgesClick
        end
        object btnChangeEdges: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeEdgesClick
        end
        object btnDeleteEdges: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Caption = '&Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteEdgesClick
        end
      end
      object Panel15: TPanel
        Left = 0
        Top = 215
        Width = 1150
        Height = 28
        Align = alBottom
        TabOrder = 2
        object lblEdgeTotalSales: TLabel
          Left = 8
          Top = 7
          Width = 86
          Height = 13
          Caption = 'Total Sales Value:'
        end
        object lblEdgeTotalCost: TLabel
          Left = 296
          Top = 7
          Width = 84
          Height = 13
          Caption = 'Total Cost Value: '
        end
      end
    end
    object tbUpstands: TTabSheet
      Caption = 'Upstands/Splashbacks etc'
      ImageIndex = 3
      object Panel1: TPanel
        Left = 1065
        Top = 0
        Width = 85
        Height = 215
        Align = alRight
        TabOrder = 0
        object btnAddUpstds: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          Enabled = False
          TabOrder = 0
          OnClick = btnAddUpstdsClick
        end
        object btnChangeUpstds: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeUpstdsClick
        end
        object btnDeleteUpstds: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteUpstdsClick
        end
        object btnGlobalUpstds: TBitBtn
          Left = 8
          Top = 120
          Width = 75
          Height = 25
          Caption = '&Global'
          Enabled = False
          TabOrder = 3
          OnClick = btnGlobalUpstdsClick
        end
      end
      object sgUpstands: TStringGrid
        Left = 0
        Top = 0
        Width = 1065
        Height = 215
        Align = alClient
        ColCount = 12
        DefaultColWidth = 40
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 1
        OnDblClick = sgUpstandsDblClick
        ColWidths = (
          40
          190
          58
          73
          70
          49
          83
          77
          86
          84
          117
          86)
      end
      object Panel4: TPanel
        Left = 0
        Top = 215
        Width = 1150
        Height = 28
        Align = alBottom
        TabOrder = 2
        object lblUpTotalArea: TLabel
          Left = 8
          Top = 7
          Width = 83
          Height = 13
          Caption = 'Total Area (sqm): '
        end
        object lblUpTotalSales: TLabel
          Left = 296
          Top = 7
          Width = 89
          Height = 13
          Caption = 'Total Sales Value: '
        end
        object lblUpTotalPolishCost: TLabel
          Left = 600
          Top = 7
          Width = 88
          Height = 13
          Caption = 'Total Polish Cost:: '
        end
      end
    end
    object tbCharges: TTabSheet
      Caption = 'Charges'
      ImageIndex = 4
      object sgExtras: TStringGrid
        Left = 0
        Top = 0
        Width = 1064
        Height = 215
        Align = alClient
        ColCount = 7
        DefaultColWidth = 40
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 0
        OnDblClick = sgExtrasDblClick
        ColWidths = (
          40
          158
          82
          81
          80
          86
          64)
      end
      object Panel7: TPanel
        Left = 1064
        Top = 0
        Width = 86
        Height = 215
        Align = alRight
        TabOrder = 1
        object btnAddExtras: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          Enabled = False
          TabOrder = 0
          OnClick = btnAddExtrasClick
        end
        object btnChangeExtras: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeExtrasClick
        end
        object btnDeleteExtras: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteExtrasClick
        end
      end
      object Panel16: TPanel
        Left = 0
        Top = 215
        Width = 1150
        Height = 28
        Align = alBottom
        TabOrder = 2
        object lblExTotalSales: TLabel
          Left = 8
          Top = 7
          Width = 86
          Height = 13
          Caption = 'Total Sales Value:'
        end
        object lblExTotalCost: TLabel
          Left = 296
          Top = 7
          Width = 84
          Height = 13
          Caption = 'Total Cost Value: '
        end
      end
    end
    object tbSlabs: TTabSheet
      Caption = 'Slab Details'
      ImageIndex = 9
      object Panel24: TPanel
        Left = 1064
        Top = 0
        Width = 86
        Height = 215
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object btnAddSlabs: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          Enabled = False
          TabOrder = 0
          OnClick = btnAddSlabsClick
        end
        object btnChangeSlabs: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = '&Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeSlabsClick
        end
        object btnDeleteSlabs: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Caption = '&Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteSlabsClick
        end
      end
      object Panel25: TPanel
        Left = 0
        Top = 215
        Width = 1150
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object lblSlabTotalArea: TLabel
          Left = 288
          Top = 7
          Width = 86
          Height = 13
          Caption = 'Total Sales Value:'
        end
        object lblSlabTotalCost: TLabel
          Left = 8
          Top = 7
          Width = 84
          Height = 13
          Caption = 'Total Cost Value: '
        end
        object lblSlabWasteCost: TLabel
          Left = 632
          Top = 7
          Width = 94
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Waste Value: '
        end
      end
      object Panel26: TPanel
        Left = 0
        Top = 0
        Width = 1064
        Height = 215
        Align = alClient
        Caption = 'Panel26'
        TabOrder = 2
        object Panel27: TPanel
          Left = 1
          Top = 161
          Width = 1062
          Height = 53
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
        end
        object Panel28: TPanel
          Left = 1
          Top = 1
          Width = 1062
          Height = 160
          Align = alClient
          Caption = 'Panel28'
          TabOrder = 1
          object sgSlabs: TStringGrid
            Left = 1
            Top = 1
            Width = 1060
            Height = 158
            Align = alClient
            ColCount = 11
            DefaultColWidth = 40
            DefaultRowHeight = 18
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
            TabOrder = 0
            OnDblClick = sgSlabsDblClick
            ColWidths = (
              40
              200
              78
              137
              78
              76
              66
              96
              97
              97
              81)
            RowHeights = (
              18
              18
              18
              18
              18)
          end
        end
      end
    end
    object tbInstallation: TTabSheet
      Caption = 'Installation'
      ImageIndex = 8
      object Panel19: TPanel
        Left = 0
        Top = 0
        Width = 1120
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label16: TLabel
          Left = 2
          Top = 0
          Width = 147
          Height = 13
          Caption = 'Installation Address (100 chars)'
        end
      end
      object Panel21: TPanel
        Left = 715
        Top = 17
        Width = 405
        Height = 271
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          405
          271)
        object Label26: TLabel
          Left = 8
          Top = -815
          Width = 90
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Installation Contact'
        end
        object Label27: TLabel
          Left = 8
          Top = -779
          Width = 90
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Installation Number'
        end
        object edtInstallName: TEdit
          Left = 120
          Top = -819
          Width = 161
          Height = 21
          Anchors = [akLeft, akBottom]
          TabOrder = 0
        end
        object edtInstallPhone: TEdit
          Left = 120
          Top = -783
          Width = 161
          Height = 21
          Anchors = [akLeft, akBottom]
          TabOrder = 1
        end
      end
      object Panel22: TPanel
        Left = 0
        Top = 17
        Width = 715
        Height = 271
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel20: TPanel
          Left = 0
          Top = 0
          Width = 465
          Height = 271
          Align = alLeft
          Caption = 'Panel20'
          TabOrder = 0
          object memInstallAdd: TMemo
            Left = 1
            Top = 1
            Width = 463
            Height = 269
            Align = alClient
            MaxLength = 100
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
    object tbDocuments: TTabSheet
      Caption = 'Documents'
      ImageIndex = 5
      OnShow = tbDocumentsShow
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 1120
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label25: TLabel
          Left = 2
          Top = 0
          Width = 54
          Height = 13
          Caption = 'Documents'
        end
      end
      object ToolBar1: TToolBar
        Left = 1079
        Top = 17
        Width = 41
        Height = 271
        Align = alRight
        ButtonHeight = 30
        ButtonWidth = 30
        Caption = 'ToolBar1'
        EdgeBorders = [ebLeft, ebTop, ebRight]
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
          OnClick = btnWordClick
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
          OnClick = btnWordClick
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
      object stvDocuments: TShellTreeView
        Left = 0
        Top = 17
        Width = 161
        Height = 271
        ObjectTypes = [otFolders]
        Root = 'C:\'
        ShellListView = slvDocuments
        UseShellImages = True
        Align = alLeft
        AutoRefresh = False
        Indent = 19
        ParentColor = False
        RightClickSelect = True
        ShowRoot = False
        TabOrder = 2
        OnDragDrop = stvDocumentsDragDrop
        OnDragOver = stvDocumentsDragOver
      end
      object slvDocuments: TShellListView
        Left = 161
        Top = 17
        Width = 918
        Height = 271
        AutoRefresh = True
        ObjectTypes = [otFolders, otNonFolders]
        Root = 'C:\'
        ShellTreeView = stvDocuments
        Sorted = True
        Align = alClient
        ReadOnly = False
        HideSelection = False
        MultiSelect = True
        OnMouseMove = slvDocumentsMouseMove
        TabOrder = 3
        ViewStyle = vsReport
      end
    end
    object tbNotes: TTabSheet
      Caption = 'Notes'
      ImageIndex = 12
      object Panel23: TPanel
        Left = 0
        Top = 0
        Width = 1120
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label65: TLabel
          Left = 2
          Top = 0
          Width = 54
          Height = 13
          Caption = 'Documents'
        end
      end
      object Panel12: TPanel
        Left = 1085
        Top = 17
        Width = 35
        Height = 271
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object bynSpecialInstructions: TBitBtn
          Left = 8
          Top = 8
          Width = 22
          Height = 22
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = bynSpecialInstructionsClick
        end
      end
      object pnlNotes: TPanel
        Left = 0
        Top = 17
        Width = 1085
        Height = 271
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object memNotes: TMemo
          Left = 0
          Top = 0
          Width = 1085
          Height = 271
          Align = alClient
          TabOrder = 0
        end
      end
    end
    object tbEvents: TTabSheet
      Caption = 'Events'
      ImageIndex = 7
      object Panel3: TPanel
        Left = 0
        Top = 17
        Width = 305
        Height = 271
        Align = alLeft
        TabOrder = 0
        object sgEvents: TStringGrid
          Left = 1
          Top = 1
          Width = 303
          Height = 269
          Align = alClient
          ColCount = 3
          DefaultColWidth = 40
          DefaultRowHeight = 20
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          TabOrder = 0
          OnClick = sgEventsClick
          OnDblClick = sgEventsDblClick
          ColWidths = (
            40
            107
            126)
        end
      end
      object Panel8: TPanel
        Left = 755
        Top = 17
        Width = 365
        Height = 271
        Align = alRight
        TabOrder = 1
        object memEventNotes: TMemo
          Left = 1
          Top = 1
          Width = 363
          Height = 269
          Align = alClient
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 1120
        Height = 17
        Align = alTop
        TabOrder = 2
      end
      object Panel18: TPanel
        Left = 305
        Top = 17
        Width = 450
        Height = 271
        Align = alClient
        TabOrder = 3
        object btnAddEvents: TBitBtn
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Add'
          TabOrder = 0
          OnClick = btnAddEventsClick
        end
        object btnChangeEvents: TBitBtn
          Left = 8
          Top = 40
          Width = 75
          Height = 25
          Caption = 'Change'
          Enabled = False
          TabOrder = 1
          OnClick = btnChangeEventsClick
        end
        object btnDeleteEvents: TBitBtn
          Left = 8
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Delete'
          Enabled = False
          TabOrder = 2
          OnClick = btnDeleteEventsClick
        end
      end
    end
    object tbAnalysis: TTabSheet
      Caption = 'Cost Analysis'
      ImageIndex = 9
      OnShow = tbAnalysisShow
      object Panel17: TPanel
        Left = 0
        Top = 260
        Width = 1120
        Height = 28
        Align = alBottom
        TabOrder = 0
        object Label32: TLabel
          Left = 272
          Top = 6
          Width = 74
          Height = 13
          Caption = 'Grand Totals'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object memTotalCost: TMemo
          Left = 399
          Top = 2
          Width = 79
          Height = 21
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
          WantReturns = False
          WordWrap = False
        end
        object memTotalSell: TMemo
          Left = 541
          Top = 2
          Width = 79
          Height = 21
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 1
          WantReturns = False
          WordWrap = False
        end
        object memTotalMargin: TMemo
          Left = 637
          Top = 2
          Width = 79
          Height = 21
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 2
          WantReturns = False
          WordWrap = False
        end
        object memTotalMarginPerc: TMemo
          Left = 741
          Top = 2
          Width = 65
          Height = 21
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 3
          WantReturns = False
          WordWrap = False
        end
      end
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 1120
        Height = 260
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 1
        DesignSize = (
          1103
          260)
        object Label45: TLabel
          Left = 16
          Top = 76
          Width = 68
          Height = 13
          Caption = 'Cut Out Totals'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 16
          Top = 100
          Width = 218
          Height = 13
          Caption = 'Edge Totals (incl Upstands, Splashbacks, etc)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 16
          Top = 124
          Width = 61
          Height = 13
          Caption = 'Extras Totals'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 16
          Top = 205
          Width = 37
          Height = 13
          Caption = 'Mileage'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 16
          Top = 229
          Width = 80
          Height = 13
          Caption = 'Template Labour'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label35: TLabel
          Left = 176
          Top = 229
          Width = 40
          Height = 13
          Caption = 'hours @'
        end
        object Label36: TLabel
          Left = 288
          Top = 229
          Width = 29
          Height = 13
          Caption = '/ hour'
        end
        object Label37: TLabel
          Left = 176
          Top = 205
          Width = 37
          Height = 13
          Caption = 'miles @'
        end
        object Label38: TLabel
          Left = 288
          Top = 205
          Width = 35
          Height = 13
          Caption = 'p / mile'
        end
        object Label44: TLabel
          Left = 16
          Top = 29
          Width = 184
          Height = 13
          Caption = 'Worktop/Upstands/Splashback Totals'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label39: TLabel
          Left = 350
          Top = 5
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Slab Area'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label40: TLabel
          Left = 425
          Top = 5
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cost Value'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 487
          Top = 5
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Area Req'#39'd'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label42: TLabel
          Left = 561
          Top = 5
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Sales Value'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label48: TLabel
          Left = 689
          Top = 148
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Profit'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label49: TLabel
          Left = 769
          Top = 148
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = '% Profit'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label51: TLabel
          Left = 16
          Top = 278
          Width = 64
          Height = 13
          Caption = 'Fitting Labour'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label52: TLabel
          Left = 176
          Top = 278
          Width = 40
          Height = 13
          Caption = 'hours @'
        end
        object Label53: TLabel
          Left = 288
          Top = 278
          Width = 29
          Height = 13
          Caption = '/ hour'
        end
        object lblDiscountAnalysis: TLabel
          Left = 16
          Top = 148
          Width = 42
          Height = 13
          Caption = 'Discount'
        end
        object Label57: TLabel
          Left = 192
          Top = 180
          Width = 157
          Height = 13
          Caption = 'Total Supply Costs && Prices'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape1: TShape
          Left = 0
          Top = 169
          Width = -939
          Height = 1
          Anchors = [akLeft, akTop, akRight]
        end
        object lblDiscountMarkup: TLabel
          Left = 504
          Top = 148
          Width = 27
          Height = 13
          Caption = 'minus'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 16
          Top = 52
          Width = 80
          Height = 13
          Caption = 'Handling/Cutting'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label55: TLabel
          Left = 168
          Top = 52
          Width = 30
          Height = 13
          Caption = '/ sq m'
        end
        object Label58: TLabel
          Left = 296
          Top = 52
          Width = 45
          Height = 13
          Caption = 'sq metres'
        end
        object Label60: TLabel
          Left = 16
          Top = 326
          Width = 74
          Height = 13
          Caption = 'Delivery Labour'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label61: TLabel
          Left = 176
          Top = 326
          Width = 40
          Height = 13
          Caption = 'hours @'
        end
        object Label62: TLabel
          Left = 288
          Top = 326
          Width = 29
          Height = 13
          Caption = '/ hour'
        end
        object Label12: TLabel
          Left = 360
          Top = 278
          Width = 21
          Height = 13
          Caption = 'Men'
        end
        object Label13: TLabel
          Left = 360
          Top = 326
          Width = 21
          Height = 13
          Caption = 'Men'
        end
        object memTempMileageCost: TMemo
          Left = 399
          Top = 249
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 20
          WantReturns = False
          WordWrap = False
        end
        object memExtrasCost: TMemo
          Left = 399
          Top = 120
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 14
          WantReturns = False
          WordWrap = False
        end
        object memEdgeCost: TMemo
          Left = 399
          Top = 96
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 15
          WantReturns = False
          WordWrap = False
        end
        object memCutOutCost: TMemo
          Left = 399
          Top = 72
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 16
          WantReturns = False
          WordWrap = False
        end
        object memCutOutSell: TMemo
          Left = 540
          Top = 72
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 17
          WantReturns = False
          WordWrap = False
        end
        object memEdgeSell: TMemo
          Left = 540
          Top = 96
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 18
          WantReturns = False
          WordWrap = False
        end
        object memExtrasSell: TMemo
          Left = 540
          Top = 120
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 19
          WantReturns = False
          WordWrap = False
        end
        object memTempLabourCost: TMemo
          Left = 399
          Top = 225
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 21
          WantReturns = False
          WordWrap = False
        end
        object memTemplateSell: TMemo
          Left = 540
          Top = 249
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 23
          WantReturns = False
          WordWrap = False
          OnChange = memTemplateSellChange
        end
        object memTempLabour: TMemo
          Left = 112
          Top = 225
          Width = 57
          Height = 21
          Alignment = taRightJustify
          TabOrder = 3
          WantReturns = False
          WordWrap = False
          OnChange = memTempLabourChange
          OnEnter = memTempMilesEnter
          OnExit = ValidateMoney
        end
        object memTempLabourRate: TMemo
          Left = 226
          Top = 225
          Width = 55
          Height = 21
          Alignment = taRightJustify
          TabOrder = 4
          WantReturns = False
          WordWrap = False
          OnChange = memTempLabourChange
          OnEnter = memTempMilesEnter
          OnExit = ValidateMoney
        end
        object memSlabArea: TMemo
          Left = 338
          Top = 25
          Width = 61
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 22
          WantReturns = False
          WordWrap = False
        end
        object memSlabCost: TMemo
          Left = 399
          Top = 25
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 31
          WantReturns = False
          WordWrap = False
        end
        object memWorktopArea: TMemo
          Left = 478
          Top = 25
          Width = 61
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 32
          WantReturns = False
          WordWrap = False
        end
        object memWorktopSell: TMemo
          Left = 540
          Top = 25
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 33
          WantReturns = False
          WordWrap = False
        end
        object Memo1: TMemo
          Left = 637
          Top = 72
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 34
          Visible = False
          WantReturns = False
          WordWrap = False
        end
        object Memo2: TMemo
          Left = 637
          Top = 96
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 35
          Visible = False
          WantReturns = False
          WordWrap = False
        end
        object Memo3: TMemo
          Left = 637
          Top = 120
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 36
          Visible = False
          WantReturns = False
          WordWrap = False
        end
        object memTemplateMargin: TMemo
          Left = 637
          Top = 249
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 24
          WantReturns = False
          WordWrap = False
        end
        object Memo5: TMemo
          Left = 637
          Top = 25
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 37
          Visible = False
          WantReturns = False
          WordWrap = False
        end
        object Memo6: TMemo
          Left = 741
          Top = 72
          Width = 65
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 38
          Visible = False
          WantReturns = False
          WordWrap = False
        end
        object Memo7: TMemo
          Left = 741
          Top = 96
          Width = 65
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 39
          Visible = False
          WantReturns = False
          WordWrap = False
        end
        object Memo8: TMemo
          Left = 741
          Top = 120
          Width = 65
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 40
          Visible = False
          WantReturns = False
          WordWrap = False
        end
        object memTemplateMarginPerc: TMemo
          Left = 741
          Top = 249
          Width = 65
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 25
          WantReturns = False
          WordWrap = False
        end
        object Memo10: TMemo
          Left = 741
          Top = 25
          Width = 65
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 41
          Visible = False
          WantReturns = False
          WordWrap = False
        end
        object memFitMileageCost: TMemo
          Left = 399
          Top = 297
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 26
          WantReturns = False
          WordWrap = False
        end
        object memFitLabourCost: TMemo
          Left = 399
          Top = 274
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 27
          WantReturns = False
          WordWrap = False
        end
        object memFittingSell: TMemo
          Left = 540
          Top = 297
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 28
          WantReturns = False
          WordWrap = False
          OnChange = memFittingSellChange
        end
        object memFitLabour: TMemo
          Left = 112
          Top = 274
          Width = 57
          Height = 21
          Alignment = taRightJustify
          TabOrder = 6
          WantReturns = False
          WordWrap = False
          OnChange = memFitLabourChange
          OnEnter = memTempMilesEnter
          OnExit = ValidateMoney
        end
        object memFitLabourRate: TMemo
          Left = 226
          Top = 274
          Width = 55
          Height = 21
          Alignment = taRightJustify
          TabOrder = 7
          WantReturns = False
          WordWrap = False
          OnChange = memFitLabourChange
          OnEnter = memTempMilesEnter
          OnExit = ValidateMoney
        end
        object memFittingMargin: TMemo
          Left = 637
          Top = 297
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 29
          WantReturns = False
          WordWrap = False
        end
        object memFittingMarginPerc: TMemo
          Left = 741
          Top = 297
          Width = 65
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 30
          WantReturns = False
          WordWrap = False
        end
        object memSupplyCost: TMemo
          Left = 399
          Top = 176
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 42
          WantReturns = False
          WordWrap = False
        end
        object memSupplyPrice: TMemo
          Left = 540
          Top = 176
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 43
          WantReturns = False
          WordWrap = False
        end
        object memSupplyMargin: TMemo
          Left = 637
          Top = 176
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 44
          WantReturns = False
          WordWrap = False
        end
        object memSupplyMarginPerc: TMemo
          Left = 741
          Top = 176
          Width = 65
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 45
          WantReturns = False
          WordWrap = False
        end
        object memDiscountValueAnalysis: TMemo
          Left = 540
          Top = 144
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 46
          WantReturns = False
          WordWrap = False
          OnChange = memDiscountValueAnalysisChange
        end
        object memHandlingRate: TMemo
          Left = 112
          Top = 48
          Width = 55
          Height = 21
          Alignment = taRightJustify
          TabOrder = 0
          WantReturns = False
          WordWrap = False
          OnChange = memHandlingRateChange
          OnEnter = memTempMilesEnter
          OnExit = ValidateMoney
        end
        object memHandlingArea: TMemo
          Left = 234
          Top = 48
          Width = 61
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 47
          WantReturns = False
          WordWrap = False
        end
        object memHandlingCost: TMemo
          Left = 400
          Top = 48
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 48
          WantReturns = False
          WordWrap = False
        end
        object memDelMileageCost: TMemo
          Left = 399
          Top = 345
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 49
          WantReturns = False
          WordWrap = False
        end
        object memDelLabourCost: TMemo
          Left = 399
          Top = 322
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 50
          WantReturns = False
          WordWrap = False
        end
        object memDeliverySell: TMemo
          Left = 540
          Top = 345
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 51
          WantReturns = False
          WordWrap = False
          OnChange = memDeliverySellChange
        end
        object memDelLabour: TMemo
          Left = 112
          Top = 322
          Width = 57
          Height = 21
          Alignment = taRightJustify
          TabOrder = 10
          WantReturns = False
          WordWrap = False
          OnChange = memDelLabourChange
          OnEnter = memTempMilesEnter
          OnExit = ValidateMoney
        end
        object memDelLabourRate: TMemo
          Left = 226
          Top = 322
          Width = 55
          Height = 21
          Alignment = taRightJustify
          TabOrder = 11
          WantReturns = False
          WordWrap = False
          OnChange = memDelLabourChange
          OnEnter = memTempMilesEnter
          OnExit = ValidateMoney
        end
        object memDeliveryMargin: TMemo
          Left = 637
          Top = 345
          Width = 79
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 52
          WantReturns = False
          WordWrap = False
        end
        object memDeliveryMarginPerc: TMemo
          Left = 741
          Top = 345
          Width = 65
          Height = 21
          TabStop = False
          Alignment = taRightJustify
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 53
          WantReturns = False
          WordWrap = False
        end
        object chkbxDelMileage: TCheckBox
          Left = 14
          Top = 348
          Width = 112
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Delivery Mileage'
          TabOrder = 13
          OnClick = chkbxDelMileageClick
        end
        object chkbxFitMileage: TCheckBox
          Left = 14
          Top = 300
          Width = 111
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Fitting Mileage  '
          TabOrder = 9
          OnClick = chkbxFitMileageClick
        end
        object chkbxTempMileage: TCheckBox
          Left = 14
          Top = 252
          Width = 111
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Template Mileage'
          TabOrder = 5
          OnClick = chkbxTempMileageClick
        end
        object memMileage: TMemo
          Left = 112
          Top = 201
          Width = 57
          Height = 21
          Alignment = taRightJustify
          TabOrder = 1
          WantReturns = False
          WordWrap = False
          OnChange = memMileageChange
          OnEnter = memTempMilesEnter
          OnExit = ValidateQty
        end
        object memMileageRate: TMemo
          Left = 226
          Top = 201
          Width = 55
          Height = 21
          Alignment = taRightJustify
          TabOrder = 2
          WantReturns = False
          WordWrap = False
          OnChange = memMileageChange
          OnEnter = memTempMilesEnter
          OnExit = ValidateQty
        end
        object memFitLabourMen: TMemo
          Left = 330
          Top = 274
          Width = 23
          Height = 21
          Alignment = taRightJustify
          TabOrder = 8
          WantReturns = False
          WordWrap = False
          OnChange = memFitLabourChange
          OnEnter = memTempMilesEnter
          OnExit = ValidateQty
        end
        object memDelLabourMen: TMemo
          Left = 330
          Top = 322
          Width = 23
          Height = 21
          Alignment = taRightJustify
          TabOrder = 12
          WantReturns = False
          WordWrap = False
          OnChange = memDelLabourChange
          OnEnter = memTempMilesEnter
          OnExit = ValidateQty
        end
      end
    end
    object tbLinkedQuotes: TTabSheet
      Caption = 'Linked Quotes'
      ImageIndex = 11
      OnShow = tbLinkedQuotesShow
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 1120
        Height = 288
        Align = alClient
        DataSource = dtmdlQuote.dtsGetLinkedQuotes
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Quote'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date_Raised'
            Title.Caption = 'Date'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quote_Number'
            Title.Caption = 'Quote Reference'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Description'
            Width = 257
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Material_Type_Description'
            Title.Caption = 'Material'
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Original_Quote'
            Title.Caption = 'Original Quote'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Complete_Price'
            Title.Caption = 'Complete'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Installation_price'
            Title.Caption = 'Install'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Survey_price'
            Title.Caption = 'Survey'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Delivery_Price'
            Title.Caption = 'Delivery'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total_Price'
            Title.Caption = 'Total'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quote_status_description'
            Title.Caption = 'Status'
            Width = 204
            Visible = True
          end>
      end
    end
  end
  object pnlFoot: TPanel
    Left = 0
    Top = 485
    Width = 1128
    Height = 181
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      1128
      181)
    object lblDeletePrompt: TLabel
      Left = 13
      Top = 127
      Width = 151
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'Delete this quotation?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label31: TLabel
      Left = 13
      Top = 13
      Width = 59
      Height = 13
      Caption = 'Supply Price'
    end
    object lblReason: TLabel
      Left = 138
      Top = 104
      Width = 37
      Height = 13
      Caption = 'Reason'
      Visible = False
    end
    object lblWasteValue: TLabel
      Left = 192
      Top = 13
      Width = 88
      Height = 13
      Caption = 'Total Waste Value'
    end
    object lblFrontWTTotalArea: TLabel
      Left = 13
      Top = 39
      Width = 83
      Height = 13
      Caption = 'Total Area (sqm): '
    end
    object lblFrontSlabTotalArea: TLabel
      Left = 13
      Top = 63
      Width = 84
      Height = 13
      Caption = 'Total Cost Value: '
    end
    object edtNettPrice: TMemo
      Left = 81
      Top = 9
      Width = 89
      Height = 21
      Alignment = taRightJustify
      Color = cl3DLight
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 0
      WantReturns = False
      WordWrap = False
    end
    object btnOK: TBitBtn
      Left = 13
      Top = 151
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'OK'
      Default = True
      Enabled = False
      TabOrder = 1
      OnClick = btnOKClick
      NumGlyphs = 2
    end
    object btnCancel: TBitBtn
      Left = 93
      Top = 151
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = btnCancelClick
      NumGlyphs = 2
    end
    object pnlTotals: TPanel
      Left = 621
      Top = 1
      Width = 506
      Height = 179
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
      DesignSize = (
        506
        179)
      object lblDiscountRate: TLabel
        Left = 8
        Top = 12
        Width = 74
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Discount rate %'
      end
      object lblDiscountValue: TLabel
        Left = 178
        Top = 12
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'Discount Value'
      end
      object Label11: TLabel
        Left = 350
        Top = 12
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'Complete'
      end
      object Label8: TLabel
        Left = 367
        Top = 60
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'Fixing'
      end
      object Label9: TLabel
        Left = 342
        Top = 36
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'Templating'
      end
      object Label14: TLabel
        Left = 356
        Top = 84
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'Delivery'
      end
      object lblVat: TLabel
        Left = 373
        Top = 109
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'VAT'
      end
      object lblTotal: TLabel
        Left = 343
        Top = 133
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Caption = 'Total Price'
      end
      object Label28: TLabel
        Left = 8
        Top = 110
        Width = 68
        Height = 13
        Caption = 'Deposit Terms'
      end
      object Label29: TLabel
        Left = 8
        Top = 133
        Width = 60
        Height = 13
        Caption = 'Deposit Paid'
      end
      object edtDiscountRate: TCREditMoney
        Left = 93
        Top = 8
        Width = 65
        Height = 21
        Anchors = [akLeft, akBottom]
        TabOrder = 0
        OnChange = edtDiscountRateChange
        OnEnter = edtDiscountRateEnter
        OnExit = edtDiscountRateExit
      end
      object edtDiscountValue: TCREditMoney
        Left = 257
        Top = 8
        Width = 72
        Height = 21
        Anchors = [akRight, akBottom]
        TabOrder = 1
        OnChange = edtDiscountValueChange
        OnEnter = edtDiscountValueEnter
        OnExit = edtDiscountValueExit
      end
      object edtComplete: TMemo
        Left = 409
        Top = 8
        Width = 89
        Height = 21
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Color = cl3DLight
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 2
        WantReturns = False
        WordWrap = False
      end
      object edtInstallPrice: TCREditMoney
        Left = 409
        Top = 56
        Width = 89
        Height = 21
        Anchors = [akRight, akBottom]
        TabOrder = 3
        OnChange = edtInstallPriceChange
        OnExit = edtInstallPriceExit
      end
      object edtSurveyPrice: TCREditMoney
        Left = 409
        Top = 32
        Width = 89
        Height = 21
        Anchors = [akRight, akBottom]
        TabOrder = 4
        OnChange = edtSurveyPriceChange
        OnExit = edtInstallPriceExit
      end
      object edtDeliveryPrice: TCREditMoney
        Left = 409
        Top = 80
        Width = 89
        Height = 21
        Anchors = [akRight, akBottom]
        TabOrder = 5
        OnChange = edtDeliveryPriceChange
        OnExit = edtInstallPriceExit
      end
      object edtVatValue: TMemo
        Left = 409
        Top = 105
        Width = 89
        Height = 21
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Color = cl3DLight
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 6
        WantReturns = False
        WordWrap = False
      end
      object edtGrossPrice: TMemo
        Left = 409
        Top = 129
        Width = 89
        Height = 21
        Alignment = taRightJustify
        Anchors = [akRight, akBottom]
        Color = cl3DLight
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 7
        WantReturns = False
        WordWrap = False
      end
      object spnDepositTerms: TSpinEdit
        Left = 85
        Top = 105
        Width = 73
        Height = 22
        Increment = 5
        MaxValue = 100
        MinValue = 0
        TabOrder = 8
        Value = 0
        OnChange = spnDepositTermsChange
      end
      object edtDepositPaid: TCREditMoney
        Left = 85
        Top = 129
        Width = 73
        Height = 21
        TabOrder = 9
        OnChange = edtDepositPaidChange
      end
      object dblkpVatRate: TDBLookupComboBox
        Left = 205
        Top = 106
        Width = 129
        Height = 21
        KeyField = 'Vat'
        ListField = 'Description'
        TabOrder = 10
        OnClick = dblkpVatRateClick
      end
    end
    object chkbxDeclined: TCheckBox
      Left = 13
      Top = 102
      Width = 97
      Height = 17
      Caption = 'Quote Declined'
      TabOrder = 4
      OnClick = chkbxDeclinedClick
    end
    object dblkpReason: TDBLookupComboBox
      Left = 189
      Top = 100
      Width = 225
      Height = 21
      KeyField = 'Inactive_Reason'
      ListField = 'Inactive_Reason_Descr'
      TabOrder = 5
      Visible = False
    end
    object btnReason: TButton
      Left = 426
      Top = 99
      Width = 23
      Height = 23
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      Visible = False
      OnClick = btnReasonClick
    end
    object edtWasteValue: TMemo
      Left = 289
      Top = 9
      Width = 89
      Height = 21
      Alignment = taRightJustify
      Color = cl3DLight
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 7
      WantReturns = False
      WordWrap = False
    end
    object chkbxApproved: TCheckBox
      Left = 189
      Top = 131
      Width = 172
      Height = 17
      Caption = 'Approve pending estimate'
      TabOrder = 8
      OnClick = chkbxDeclinedClick
    end
  end
  object imgDocuments: TImageList
    Left = 264
    Top = 204
  end
  object imgIcons: TImageList
    Left = 712
    Top = 172
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
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
    Left = 832
    Top = 96
  end
  object svDlgOfficeDoc: TSaveDialog
    Left = 217
    Top = 86
  end
  object taoWinControl1: TtaoWinControl
    Control = pcDetails
    Options = [coCopy, coDelete, coPaste, coSource, coSourceOleCopy, coSourceOleLink, coSourceVclCopy, coSourceVclMove, coTarget, coTargetOleCopy, coTargetVclCopy, coTargetVclMove, coTargetScroll, coTargetFeedback]
    OnSetDataPaste = taoWinControl1SetDataPaste
    OnSetDataTarget = taoWinControl1SetDataTarget
    OnUpdateAction = taoWinControl1UpdateAction
    Left = 663
    Top = 56
    object taoWinControl1In1: TtaoInFileContents
    end
    object taoWinControl1In2: TtaoInCells
      FormatName = 'TaoCells'
      PasteSpecialName = 'Cells'
      PasteSpecialResult = 'tabular cells'
      PasteSpecialFlags = [psfPasteOnly]
    end
    object taoWinControl1In3: TtaoInBiff8
    end
    object taoWinControl1In4: TtaoInBiff5
    end
    object taoWinControl1In5: TtaoInUnicodeText
    end
    object taoWinControl1In6: TtaoInText
    end
    object taoWinControl1In7: TtaoInHDrop
    end
    object taoWinControl1In8: TtaoInShellIDList
    end
    object taoWinControl1In9: TtaoInFileContentsW
    end
    object taoWinControl1In10: TtaoInOEMessage
    end
    object taoWinControl1In11: TtaoInURL
    end
    object taoWinControl1In12: TtaoInURLNetscape4
    end
    object taoWinControl1Out1: TtaoOutBiff8
      DisplayStyle = 'Biff8'
    end
    object taoWinControl1Out2: TtaoOutRtf
      DisplayStyle = 'Text'
    end
    object taoWinControl1Out3: TtaoOutUnicodeText
      DisplayStyle = 'Text'
    end
    object taoWinControl1Out4: TtaoOutText
      DisplayStyle = 'Text'
    end
    object taoWinControl1Out5: TtaoOutCells
      FormatName = 'TaoCells'
    end
    object taoWinControl1Out6: TtaoOutHDrop
    end
    object taoWinControl1Out7: TtaoOutFileNameMap
    end
    object taoWinControl1Out8: TtaoOutShellIDList
    end
    object taoWinControl1Out9: TtaoOutFileDescriptor
    end
    object taoWinControl1Out10: TtaoOutFileDescriptorW
    end
    object taoWinControl1Out11: TtaoOutFileContents
    end
    object taoWinControl1Out12: TtaoOutPreferredEffect
    end
    object taoWinControl1Out13: TtaoOutURL
      DisplayStyle = 'Text'
    end
    object taoWinControl1Out14: TtaoOutURLShortcut
      DisplayStyle = 'Text'
    end
    object taoWinControl1Out15: TtaoOutURLShortcutTitle
      DisplayStyle = 'Text'
    end
  end
  object pmnuDocuments: TPopupMenu
    OnPopup = pmnuDocumentsPopup
    Left = 510
    Top = 238
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
end
