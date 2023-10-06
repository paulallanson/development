object PBMaintProcessFrm: TPBMaintProcessFrm
  Left = 225
  Top = 152
  Caption = 'Maintain Processes'
  ClientHeight = 377
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    442
    377)
  TextHeight = 13
  object DelLabel: TLabel
    Left = 117
    Top = 343
    Width = 125
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Delete these details ?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 15
    Top = 12
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object OKBitBtn: TBitBtn
    Left = 253
    Top = 335
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
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
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 0
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 333
    Top = 335
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
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
  object PageControl1: TPageControl
    Left = 8
    Top = 40
    Width = 425
    Height = 281
    ActivePage = TabSheet1
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Details'
      object DetsGrpBox: TGroupBox
        Left = 8
        Top = 8
        Width = 401
        Height = 241
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object Label2: TLabel
          Left = 15
          Top = 160
          Width = 83
          Height = 13
          Caption = 'Default Price Unit'
        end
        object Label3: TLabel
          Left = 15
          Top = 129
          Width = 64
          Height = 13
          Caption = 'Product Type'
        end
        object Label4: TLabel
          Left = 15
          Top = 101
          Width = 82
          Height = 13
          Caption = 'Product Category'
        end
        object Label6: TLabel
          Left = 15
          Top = 70
          Width = 66
          Height = 13
          Caption = 'Process Code'
        end
        object Label8: TLabel
          Left = 15
          Top = 16
          Width = 70
          Height = 13
          Caption = 'Process Group'
        end
        object Label11: TLabel
          Left = 15
          Top = 43
          Width = 81
          Height = 13
          Caption = 'Short Description'
        end
        object dblkpPriceUnit: TDBLookupComboBox
          Left = 110
          Top = 156
          Width = 107
          Height = 21
          KeyField = 'price_unit'
          ListField = 'description'
          ListSource = dtsPriceUnit
          TabOrder = 6
          OnClick = CheckOK
        end
        object dblkpProductCat: TDBLookupComboBox
          Left = 110
          Top = 97
          Width = 150
          Height = 21
          KeyField = 'category'
          ListField = 'description'
          ListSource = dtsCategory
          TabOrder = 3
        end
        object edtProductType: TEdit
          Left = 110
          Top = 126
          Width = 211
          Height = 21
          ReadOnly = True
          TabOrder = 4
        end
        object btnProdType: TButton
          Left = 332
          Top = 124
          Width = 25
          Height = 25
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = btnProdTypeClick
        end
        object ShortEdit: TEdit
          Left = 110
          Top = 66
          Width = 83
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 15
          TabOrder = 2
          Text = 'SHORTEDIT'
          OnChange = CheckOK
        end
        object dblkpProcessGroup: TDBLookupComboBox
          Left = 110
          Top = 12
          Width = 150
          Height = 21
          KeyField = 'Process_Group'
          ListField = 'Process_Group_description'
          ListSource = dtsprocessGroup
          TabOrder = 0
          OnClick = CheckOK
        end
        object chkbxDefault: TCheckBox
          Left = 15
          Top = 192
          Width = 226
          Height = 17
          Caption = 'Default this process to use'
          TabOrder = 7
        end
        object chkbxInactive: TCheckBox
          Left = 15
          Top = 211
          Width = 218
          Height = 17
          Caption = 'Process is inactive'
          TabOrder = 8
        end
        object edtShortDescription: TEdit
          Left = 110
          Top = 39
          Width = 155
          Height = 21
          MaxLength = 20
          TabOrder = 1
          OnChange = CheckOK
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Options'
      ImageIndex = 2
      object Label7: TLabel
        Left = 8
        Top = 116
        Width = 64
        Height = 13
        Caption = 'Number Type'
      end
      object Label10: TLabel
        Left = 8
        Top = 84
        Width = 110
        Height = 13
        Caption = 'Paper Prompt Narrative'
      end
      object chkbxSimplexDuplex: TCheckBox
        Left = 8
        Top = 24
        Width = 209
        Height = 17
        Caption = 'Prompt for Simplex or Duplex'
        TabOrder = 0
      end
      object dblkpNumberType: TDBLookupComboBox
        Left = 136
        Top = 112
        Width = 145
        Height = 21
        KeyField = 'Number_Type'
        ListField = 'Number_Type_Description'
        ListSource = dtsNumberType
        TabOrder = 1
      end
      object chkbxPaperSize: TCheckBox
        Left = 8
        Top = 48
        Width = 209
        Height = 17
        Caption = 'Prompt for Paper Size'
        TabOrder = 2
      end
      object edtPaperPrompt: TEdit
        Left = 136
        Top = 80
        Width = 201
        Height = 21
        MaxLength = 20
        TabOrder = 3
        Text = 'edtPaperPrompt'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Paper Sizes'
      ImageIndex = 1
      object Label5: TLabel
        Left = 0
        Top = 8
        Width = 93
        Height = 13
        Caption = 'Current Paper Sizes'
      end
      object Label9: TLabel
        Left = 256
        Top = 8
        Width = 115
        Height = 13
        Caption = 'Unassigned Paper Sizes'
      end
      object lstbxMembers: TListBox
        Left = 0
        Top = 28
        Width = 145
        Height = 150
        ItemHeight = 13
        MultiSelect = True
        TabOrder = 0
        OnClick = lstbxMembersClick
        OnDblClick = lstbxMembersDblClick
      end
      object lstbxMembersCodes: TListBox
        Left = 80
        Top = 28
        Width = 41
        Height = 150
        ItemHeight = 13
        TabOrder = 1
        Visible = False
      end
      object btnAdd: TBitBtn
        Left = 159
        Top = 32
        Width = 81
        Height = 25
        Caption = '&Add'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333FF3333333333333003333333333333F77F33333333333009033
          333333333F7737F333333333009990333333333F773337FFFFFF330099999000
          00003F773333377777770099999999999990773FF33333FFFFF7330099999000
          000033773FF33777777733330099903333333333773FF7F33333333333009033
          33333333337737F3333333333333003333333333333377333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        TabOrder = 2
        OnClick = btnAddClick
      end
      object btnRemove: TBitBtn
        Left = 159
        Top = 72
        Width = 81
        Height = 25
        Caption = '&Remove'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333FF3333333333333003333
          3333333333773FF3333333333309003333333333337F773FF333333333099900
          33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
          99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
          33333333337F3F77333333333309003333333333337F77333333333333003333
          3333333333773333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        TabOrder = 3
        OnClick = btnRemoveClick
      end
      object lstbxNonMembers: TListBox
        Left = 256
        Top = 28
        Width = 145
        Height = 150
        ItemHeight = 13
        MultiSelect = True
        TabOrder = 4
        OnClick = lstbxNonMembersClick
        OnDblClick = lstbxNonMembersDblClick
      end
      object lstbxNonMembersCodes: TListBox
        Left = 336
        Top = 28
        Width = 41
        Height = 150
        ItemHeight = 13
        TabOrder = 5
        Visible = False
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'SFDC'
      ImageIndex = 3
      object chkbxSFDCSimplexDuplex: TCheckBox
        Left = 8
        Top = 24
        Width = 209
        Height = 17
        Caption = 'Prompt for Simplex or Duplex'
        TabOrder = 0
      end
      object chkbxSFDCPaperSize: TCheckBox
        Left = 8
        Top = 48
        Width = 209
        Height = 17
        Caption = 'Prompt for Paper Size'
        TabOrder = 1
      end
      object chkbxSFDCNumberUp: TCheckBox
        Left = 8
        Top = 72
        Width = 209
        Height = 17
        Caption = 'Prompt for Number Up/Inserts'
        TabOrder = 2
      end
    end
  end
  object DescrEdit: TEdit
    Left = 86
    Top = 8
    Width = 252
    Height = 21
    MaxLength = 40
    TabOrder = 3
    Text = 'DescrEdit'
    OnChange = CheckOK
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Process.*'
      'From Process'
      'Where Process_Description = :GUID')
    Left = 360
    Top = 264
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Process'
      '        (Process,'
      '        Process_Description)'
      'Select Max(Process)+1, :GUID'
      'From Process'
      ' ')
    Left = 344
    Top = 16
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Process'
      'Set Process_Description = :Process_Description,'
      'Price_Unit = :Price_Unit,'
      'Product_Type = :Product_Type,'
      'Short_Desc = :Short_Desc,'
      'Process_Group = :Process_Group,'
      'Use_as_Default = :Use_as_default,'
      'Inactive = :Inactive,'
      'Prompt_For_Laser_Format = :Prompt_For_Laser_Format,'
      'Prompt_For_Paper_Size = :Prompt_For_Paper_Size,'
      'SFDC_Prompt_For_Laser_Format = :SFDC_Prompt_For_Laser_Format,'
      'SFDC_Prompt_For_Paper_Size = :SFDC_Prompt_For_Paper_Size,'
      'SFDC_Prompt_For_Number_Up = :SFDC_Prompt_For_Number_Up,'
      'Number_Type = :Number_Type,'
      'Paper_Prompt_Narrative = :Paper_Prompt_Narrative,'
      'Short_Description = :Short_Description'
      'Where (Process = :Process) '
      ''
      ' ')
    Left = 288
    Top = 16
    ParamData = <
      item
        Name = 'Process_Description'
      end
      item
        Name = 'Price_Unit'
      end
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Short_Desc'
      end
      item
        Name = 'Process_Group'
      end
      item
        Name = 'Use_as_default'
      end
      item
        Name = 'Inactive'
      end
      item
        Name = 'Prompt_For_Laser_Format'
        DataType = ftString
      end
      item
        Name = 'Prompt_For_Paper_Size'
      end
      item
        Name = 'SFDC_Prompt_For_Laser_Format'
      end
      item
        Name = 'SFDC_Prompt_For_Paper_Size'
      end
      item
        Name = 'SFDC_Prompt_For_Number_Up'
      end
      item
        Name = 'Number_Type'
        DataType = ftInteger
      end
      item
        Name = 'Paper_Prompt_Narrative'
      end
      item
        Name = 'Short_Description'
      end
      item
        Name = 'Process'
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Process'
      'Where'
      '(Process= :Process)')
    Left = 360
    Top = 208
    ParamData = <
      item
        Name = 'Process'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Product_Type'
      'Set     Description = :Description,'
      '        Short_Desc = :Short_Desc,'
      '        Nominal = :Nominal,'
      '        Category = :Category,'
      '        Narrative = :Narrative'
      ''
      'Where'
      '(Product_Type = :Product_Type) '
      '')
    Left = 240
    Top = 16
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Short_Desc'
      end
      item
        Name = 'Nominal'
      end
      item
        Name = 'Category'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Product_Type'
      end>
  end
  object qryPriceUnit: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from price_unit'
      'order by description')
    Left = 280
    Top = 64
  end
  object qryCategory: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from category'
      'order by description')
    Left = 280
    Top = 112
  end
  object dtsPriceUnit: TDataSource
    DataSet = qryPriceUnit
    Left = 328
    Top = 64
  end
  object dtsCategory: TDataSource
    DataSet = qryCategory
    Left = 320
    Top = 112
  end
  object qryProcessGroup: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Process_Group'
      'order by process_group_description')
    Left = 280
    Top = 240
  end
  object dtsprocessGroup: TDataSource
    DataSet = qryProcessGroup
    Left = 192
    Top = 24
  end
  object qryMembers: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Process_Paper_Size.*, Paper_Size.Description as Paper_Siz' +
        'e_Description'
      'from Process_Paper_Size, Paper_size'
      'where Process = :Process and'
      'Process_Paper_Size.Paper_Size = Paper_Size.Paper_Size'
      'order by Paper_Size.Description')
    Left = 280
    Top = 176
    ParamData = <
      item
        Name = 'Process'
      end>
  end
  object qryDummy: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Paper_size.Paper_Size, Paper_Size.Description as Paper_Si' +
        'ze_Description'
      'from Paper_Size'
      'WHERE 1=1')
    Left = 280
    Top = 288
  end
  object qryPapers: TFDQuery
    ConnectionName = 'PB'
    Left = 188
    Top = 200
  end
  object qryDelete: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Process_Paper_Size'
      'where Process = :Process')
    Left = 400
    Top = 120
    ParamData = <
      item
        Name = 'Process'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Process_Paper_Size'
      '(Process,'
      'Paper_Size,'
      'Inactive'
      ')'
      'values'
      '(  :Process,'
      ':Paper_Size,'
      ':Inactive'
      ')'
      '')
    Left = 400
    Top = 176
    ParamData = <
      item
        Name = 'Process'
      end
      item
        Name = 'Paper_Size'
      end
      item
        Name = 'Inactive'
      end>
  end
  object qryNumberType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Process_Number_Type'
      'Order By Number_Type_Description')
    Left = 396
    Top = 16
  end
  object dtsNumberType: TDataSource
    DataSet = qryNumberType
    Left = 396
    Top = 64
  end
end
