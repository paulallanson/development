object PBMaintPrdTypFrm: TPBMaintPrdTypFrm
  Left = 225
  Top = 152
  Caption = 'Maintain Product Types'
  ClientHeight = 368
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object DelLabel: TLabel
    Left = 133
    Top = 336
    Width = 109
    Height = 13
    Caption = 'Delete these details ?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 59
    Height = 13
    Caption = 'Description'
  end
  object OKBitBtn: TBitBtn
    Left = 269
    Top = 330
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
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 0
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 349
    Top = 330
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
  object PageControl1: TPageControl
    Left = 8
    Top = 40
    Width = 417
    Height = 281
    ActivePage = TabSheet1
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Details'
      object DetsGrpBox: TGroupBox
        Left = 5
        Top = 1
        Width = 397
        Height = 248
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object Label2: TLabel
          Left = 16
          Top = 18
          Width = 46
          Height = 13
          Caption = 'Category'
        end
        object Label5: TLabel
          Left = 16
          Top = 48
          Width = 59
          Height = 26
          Caption = 'Short Description'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object Label11: TLabel
          Left = 16
          Top = 97
          Width = 63
          Height = 13
          Caption = 'Nominal Acc'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 16
          Top = 130
          Width = 63
          Height = 13
          Caption = 'Nominal Acc'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 16
          Top = 116
          Width = 46
          Height = 13
          Caption = 'Purchase'
        end
        object Label6: TLabel
          Left = 16
          Top = 83
          Width = 26
          Height = 13
          Caption = 'Sales'
        end
        object Label7: TLabel
          Left = 16
          Top = 152
          Width = 147
          Height = 39
          Caption = 'Minimum no of Suppliers to send enquiries for this product type'
          WordWrap = True
        end
        object lblFSCProductType: TLabel
          Left = 16
          Top = 196
          Width = 88
          Height = 13
          Caption = 'FSC Product Type'
        end
        object CatDBLUCB: TDBLookupComboBox
          Left = 118
          Top = 14
          Width = 129
          Height = 21
          KeyField = 'Category'
          ListField = 'Description'
          ListSource = CatsSRC
          TabOrder = 0
          OnClick = CatDBLUCBClick
        end
        object NotesBitBtn: TBitBtn
          Left = 296
          Top = 212
          Width = 75
          Height = 25
          Hint = 'Invoice Notes'
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
          TabOrder = 8
          OnClick = NotesBitBtnClick
        end
        object ShortDescrEdit: TEdit
          Left = 118
          Top = 51
          Width = 155
          Height = 21
          TabStop = False
          MaxLength = 15
          TabOrder = 2
          Text = 'ShortDescrEdit'
          OnChange = ShortDescrEditChange
        end
        object ProdTypeMaintBitBtn: TBitBtn
          Left = 256
          Top = 13
          Width = 25
          Height = 23
          Hint = 'Product Type Maintenance'
          Caption = '...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'System'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = ProdTypeMaintBitBtnClick
        end
        object chkbxActive: TCheckBox
          Left = 16
          Top = 220
          Width = 185
          Height = 17
          Caption = 'Product type is active'
          TabOrder = 7
        end
        object NomAccEdit: TMaskEdit
          Left = 118
          Top = 84
          Width = 155
          Height = 21
          CharCase = ecUpperCase
          EditMask = '!90009999/900/000;0;_'
          MaxLength = 16
          TabOrder = 3
          Text = ''
        end
        object PurchNomAccEdt: TMaskEdit
          Left = 118
          Top = 117
          Width = 155
          Height = 21
          CharCase = ecUpperCase
          EditMask = '!90009999/900/000;0;_'
          MaxLength = 16
          TabOrder = 4
          Text = ''
        end
        object spnSuppliers: TSpinEdit
          Left = 184
          Top = 155
          Width = 65
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 5
          Value = 0
        end
        object edtFSCProductType: TEdit
          Left = 118
          Top = 192
          Width = 83
          Height = 21
          TabStop = False
          MaxLength = 15
          TabOrder = 6
          Text = 'edtFSCProductType'
          OnChange = ShortDescrEditChange
          OnKeyPress = edtFSCProductTypeKeyPress
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Price Units'
      ImageIndex = 1
      object Label8: TLabel
        Left = 0
        Top = 8
        Width = 96
        Height = 13
        Caption = 'Current Price Units'
      end
      object Label9: TLabel
        Left = 256
        Top = 8
        Width = 118
        Height = 13
        Caption = 'Unassigned Price Units'
      end
      object Label10: TLabel
        Left = 0
        Top = 188
        Width = 38
        Height = 13
        Caption = 'Default'
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
        TabOrder = 1
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
        TabOrder = 2
        OnClick = btnRemoveClick
      end
      object lstbxNonMembers: TListBox
        Left = 256
        Top = 28
        Width = 145
        Height = 150
        ItemHeight = 13
        MultiSelect = True
        TabOrder = 3
        OnClick = lstbxNonMembersClick
        OnDblClick = lstbxNonMembersDblClick
      end
      object lstbxNonMembersCodes: TListBox
        Left = 336
        Top = 28
        Width = 41
        Height = 150
        ItemHeight = 13
        TabOrder = 4
        Visible = False
      end
      object lstbxMembersCodes: TListBox
        Left = 80
        Top = 28
        Width = 41
        Height = 150
        ItemHeight = 13
        TabOrder = 5
        Visible = False
      end
      object cmbDefaults: TComboBox
        Left = 40
        Top = 184
        Width = 105
        Height = 21
        Style = csDropDownList
        TabOrder = 6
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
  object GetCatsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Category, Description From Category'
      'Order By Description')
    Left = 376
    Top = 16
  end
  object CatsSRC: TDataSource
    DataSet = GetCatsSQL
    Left = 288
    Top = 16
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Product_Type'
      'From Product_Type'
      'Where Description = :GUID')
    Left = 160
    Top = 8
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
      'Insert Into Product_Type'
      '        (Product_Type,'
      '        Description,'
      '        Short_Desc,'
      '        Nominal,'
      '        Purchase_Nominal,'
      '        Category)'
      'Select Max(Product_Type)+1, :GUID, :GUID, '#39' '#39', '#39' '#39',:Category'
      'From Product_Type'
      ' ')
    Left = 368
    Top = 128
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Category'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Product_Type'
      'Set     Description = :Description,'
      '        Short_Desc = :Short_Desc,'
      '        Nominal = :Nominal,'
      '        Purchase_Nominal = :Purch_Nominal,'
      '        Category = :Category,'
      '        Narrative = :Narrative,'
      '        Inactive = :inactive,'
      '        Enquiry_Min_Suppliers = :Enquiry_Min_Suppliers,'
      '        Default_Price_Unit = :Default_Price_Unit,'
      '        FSC_Product_Type_Code = :FSC_Product_Type_Code'
      'Where'
      '(Product_Type = :Product_Type) '
      ''
      ' ')
    Left = 368
    Top = 48
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
        Name = 'Purch_Nominal'
      end
      item
        Name = 'Category'
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Enquiry_Min_Suppliers'
      end
      item
        Name = 'Default_Price_Unit'
      end
      item
        Name = 'FSC_Product_Type_Code'
      end
      item
        Name = 'Product_Type'
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Product_Type'
      'Where'
      '(Product_Type = :Product_Type)')
    Left = 240
    Top = 16
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object FlashTimer: TTimer
    Enabled = False
    OnTimer = FlashTimerTimer
    Left = 328
    Top = 72
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
    Left = 336
    Top = 88
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
  object UpdNotesOnlySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Product_Type'
      'Set     Narrative = :Narrative'
      'Where'
      '(Product_Type = :Product_Type)'
      ' '
      ' '
      ' ')
    Left = 368
    Top = 192
    ParamData = <
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Product_Type'
      end>
  end
  object qryInsDefCap: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Product_typeCapability'
      '  (Product_Type,'
      '  Capability,'
      '  Description,'
      '  Default_for_All)'
      'values'
      '  (:product_type,'
      '  1,'
      '  :description,'
      '  '#39'Y'#39');')
    Left = 376
    Top = 80
    ParamData = <
      item
        Name = 'product_type'
      end
      item
        Name = 'description'
      end>
  end
  object qryMembers: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Product_TypePrice_Unit.*, Price_Unit.Description as Price' +
        '_Unit_Description'
      'from Product_TypePrice_Unit, Price_Unit'
      'where Product_Type = :Product_Type and'
      'Product_TypePrice_Unit.Price_Unit = Price_Unit.Price_Unit'
      'order by Price_Unit.Description')
    Left = 24
    Top = 40
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object qryPriceUnit: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Price_Unit.Price_Unit, Price_Unit.Description as Price_Un' +
        'it_Description'
      'from Price_Unit')
    Left = 128
    Top = 152
  end
  object dtsPriceUnit: TDataSource
    DataSet = qryPriceUnit
    Left = 200
    Top = 184
  end
  object qryDummy: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Price_Unit.Price_Unit, Price_Unit.Description as Price_Un' +
        'it_Description'
      'from Price_Unit'
      'WHERE 1=1')
    Left = 192
    Top = 136
  end
  object qryDelete: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Product_TypePrice_Unit'
      'where Product_Type = :Product_Type')
    Left = 32
    Top = 152
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Product_TypePrice_Unit'
      '(Product_Type,'
      'Price_Unit,'
      'Inactive'
      ')'
      'values'
      '(  :Product_Type,'
      ':Price_Unit,'
      ':Inactive'
      ')'
      '')
    Left = 40
    Top = 152
    ParamData = <
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Price_Unit'
      end
      item
        Name = 'Inactive'
      end>
  end
end
