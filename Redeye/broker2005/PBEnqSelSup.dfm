object PBEnqSelSupFrm: TPBEnqSelSupFrm
  Left = 121
  Top = 10
  BorderStyle = bsDialog
  Caption = 'Select Suppliers'
  ClientHeight = 529
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 67
    Height = 13
    Caption = 'Not selected:'
  end
  object Label3: TLabel
    Left = 8
    Top = 228
    Width = 46
    Height = 13
    Caption = 'Selected:'
  end
  object NoOfSuppsLabel: TLabel
    Left = 344
    Top = 8
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'No of items'
  end
  object NoOfSelSupLabel: TLabel
    Left = 344
    Top = 400
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'No of items'
  end
  object WaitLabel: TLabel
    Left = 136
    Top = 7
    Width = 92
    Height = 16
    Caption = 'Please Wait....'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SuppsDBGrid: TDBGrid
    Left = 8
    Top = 24
    Width = 393
    Height = 193
    DataSource = SuppsSRC
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = SelPopUpMenu
    TabOrder = 6
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = SuppsDBGridCellClick
    OnDblClick = SuppsDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Supp_Name'
        Title.Caption = 'Supplier'
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Branch_Name'
        Title.Caption = 'Branch'
        Width = 179
        Visible = True
      end>
  end
  object AddBitBtn: TBitBtn
    Left = 414
    Top = 80
    Width = 83
    Height = 25
    Caption = 'Select'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
      333333333337F33333333333333033333333333333373F333333333333090333
      33333333337F7F33333333333309033333333333337373F33333333330999033
      3333333337F337F33333333330999033333333333733373F3333333309999903
      333333337F33337F33333333099999033333333373333373F333333099999990
      33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333300033333333333337773333333}
    NumGlyphs = 2
    TabOrder = 0
    OnClick = AddBitBtnClick
  end
  object RemBitBtn: TBitBtn
    Left = 414
    Top = 272
    Width = 83
    Height = 25
    Caption = 'De-select'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
      3333333333777F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
      3333333777737777F333333099999990333333373F3333373333333309999903
      333333337F33337F33333333099999033333333373F333733333333330999033
      3333333337F337F3333333333099903333333333373F37333333333333090333
      33333333337F7F33333333333309033333333333337373333333333333303333
      333333333337F333333333333330333333333333333733333333}
    NumGlyphs = 2
    TabOrder = 1
    OnClick = RemBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 414
    Top = 472
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
    TabOrder = 2
  end
  object OKBitBtn: TBitBtn
    Left = 414
    Top = 440
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
    TabOrder = 3
    OnClick = OKBitBtnClick
  end
  object CapableChkBox: TCheckBox
    Left = 8
    Top = 400
    Width = 273
    Height = 17
    Caption = 'Only show suppliers with required capabilities'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = CapableChkBoxClick
  end
  object OtherBranchesChkBox: TCheckBox
    Left = 8
    Top = 416
    Width = 265
    Height = 17
    Caption = 'Show other branches for selected suppliers'
    TabOrder = 5
    OnClick = OtherBranchesChkBoxClick
  end
  object SupSelDBGrid: TDBGrid
    Left = 8
    Top = 246
    Width = 393
    Height = 147
    DataSource = SelSupSRC
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = DeSelPopUpMenu
    TabOrder = 7
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = SupSelDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Supp_Name'
        Title.Caption = 'Supplier'
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Branch_Name'
        Title.Caption = 'Branch'
        Width = 179
        Visible = True
      end>
  end
  object SelSuppBitBtn: TBitBtn
    Left = 416
    Top = 24
    Width = 25
    Height = 25
    Hint = 'Maintain Suppliers'
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = SelSuppBitBtnClick
  end
  object SearchGrpBox: TGroupBox
    Left = 8
    Top = 453
    Width = 321
    Height = 49
    Caption = 'Type here to narrow the search'
    ParentBackground = False
    TabOrder = 9
    object SearchEdit: TEdit
      Left = 8
      Top = 16
      Width = 305
      Height = 21
      TabOrder = 0
      OnChange = SearchEditChange
    end
  end
  object AddAllBitBtn: TBitBtn
    Left = 414
    Top = 120
    Width = 83
    Height = 25
    Caption = 'Select All'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
      333333333337F33333333333333033333333333333373F333333333333090333
      33333333337F7F33333333333309033333333333337373F33333333330999033
      3333333337F337F33333333330999033333333333733373F3333333309999903
      333333337F33337F33333333099999033333333373333373F333333099999990
      33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333300033333333333337773333333}
    NumGlyphs = 2
    TabOrder = 10
    OnClick = AddAllBitBtnClick
  end
  object RemAllBitBtn: TBitBtn
    Left = 414
    Top = 312
    Width = 83
    Height = 25
    Caption = 'De-select All'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
      3333333333777F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333337F7F333333333333090333
      33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
      3333333777737777F333333099999990333333373F3333373333333309999903
      333333337F33337F33333333099999033333333373F333733333333330999033
      3333333337F337F3333333333099903333333333373F37333333333333090333
      33333333337F7F33333333333309033333333333337373333333333333303333
      333333333337F333333333333330333333333333333733333333}
    NumGlyphs = 2
    TabOrder = 11
    OnClick = RemAllBitBtnClick
  end
  object chkbxShowInactive: TCheckBox
    Left = 8
    Top = 432
    Width = 265
    Height = 17
    Caption = 'Show Inactive Suppliers'
    TabOrder = 12
    OnClick = chkbxShowInactiveClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 510
    Width = 509
    Height = 19
    Panels = <
      item
        Text = 'You may assign upto x suppliers.'
        Width = 50
      end>
  end
  object GetSuppsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select SB1.Supplier, SB1.Branch_No, SB1.Name as Branch_Name, S1.' +
        'Name as Supp_Name'
      'From Supplier S1, Supplier_Branch SB1'
      'Where (S1.Supplier = SB1.Supplier) and'
      '      (Not Exists (Select IS1.Sel2'
      '                   From Int_Sel IS1'
      '                   Where (IS1.Int_Sel_Code = :Int_Sel_Code) and'
      '                         (IS1.Sel1 = 1) and'
      '                        Not Exists (Select SBPTC1.Supplier'
      
        '                                    From Splr_BrnchPrdct_TypCpbl' +
        'ty SBPTC1'
      
        '                                    Where (SBPTC1.Supplier = SB1' +
        '.Supplier) and'
      
        '                                          (SBPTC1.Branch_No = SB' +
        '1.Branch_No) and'
      
        '                                          (SBPTC1.Product_Type =' +
        ' :Product_Type) and'
      
        '                                          (SBPTC1.Capability = I' +
        'S1.Sel2))) and'
      '      (Not Exists (Select IS2.Sel1'
      '                   From Int_Sel IS2'
      '                   Where (IS2.Int_Sel_Code = :Int_Sel_Code) and'
      '                         (IS2.Sel1 = 2) and'
      '                         (IS2.Sel2 = S1.Supplier) and'
      
        '                         ((IS2.Sel3 = SB1.Branch_No) or (:Other_' +
        'Branches = '#39'N'#39')))) and'
      '      (S1.Name Like :Name_From)'
      'Order By S1.Name, SB1.Name'
      ' ')
    Left = 24
    Top = 136
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Other_Branches'
      end
      item
        Name = 'Name_From'
      end>
  end
  object GetSuppsSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Supplier_Enquiry.Supplier, Supplier_Enquiry.Branch_no, Su' +
        'pplier_Enquiry.Line'
      'FROM Supplier_Enquiry'
      'WHERE (Supplier_Enquiry.Enquiry = :Enquiry ) AND'
      '      (Supplier_Enquiry.Line = :Line )'
      '')
    Left = 312
    Top = 152
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object DelSuppsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Supplier_Enquiry'
      'where (Enquiry = :Enquiry) and'
      '      (Line = :Line) and'
      '      (Is_Updated = '#39'N'#39')')
    Left = 240
    Top = 184
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object UpdSuppsNSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Supplier_Enquiry'
      'Set Is_Updated = '#39'N'#39
      'where (Enquiry = :Enquiry) and'
      '      (Line = :Line)')
    Left = 48
    Top = 56
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object GetSuppSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Supplier'
      'From Supplier_Enquiry'
      'where (Enquiry = :Enquiry) and'
      '      (Line = :Line) and'
      '      (Supplier = :Supplier) and'
      '      (Branch_No = :Branch_No)')
    Left = 136
    Top = 56
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
        Name = 'Branch_No'
      end>
  end
  object AddSuppSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Supplier_Enquiry'
      
        '(Supplier, Branch_No, Enquiry, Line, Is_Updated, Printed_Enquiry' +
        ')'
      'Values'
      '(:Supplier, :Branch_No, :Enquiry, :Line, '#39'Y'#39', '#39'N'#39')'
      '')
    Left = 232
    Top = 304
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object UpdSuppYSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Supplier_Enquiry'
      'Set Is_Updated = '#39'Y'#39
      'where (Enquiry = :Enquiry) and'
      '      (Line = :Line) and'
      '      (Supplier = :Supplier) and'
      '      (Branch_No = :Branch_No)')
    Left = 104
    Top = 176
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
        Name = 'Branch_No'
      end>
  end
  object GetSuppNameSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Supplier.Name as Supp_Name, Supplier_Branch.Name as Branc' +
        'h_Name'
      'From Supplier, Supplier_Branch'
      'Where (Supplier.Supplier = :Supplier) and'
      '      (Supplier_Branch.Supplier = Supplier.Supplier) and'
      '      (Supplier_Branch.Branch_No = :Branch_No)')
    Left = 288
    Top = 72
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object CheckCapSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Capability'
      'From Splr_BrnchPrdct_TypCpblty'
      'Where (Supplier = :Supplier) and'
      '      (Branch_No = :Branch_No) and'
      '      (Product_Type = :Product_Type) and'
      '      (Capability = :Capability)'
      '')
    Left = 104
    Top = 112
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Capability'
      end>
  end
  object GetLastIntSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select max(Int_Sel_Code) as Last_Code from Int_Sel')
    Left = 184
    Top = 72
  end
  object AddIntSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4)'
      'Values'
      '(:Int_Sel_Code, :Sel1, :Sel2, :Sel3, :Sel4)')
    Left = 40
    Top = 304
    ParamData = <
      item
        Name = 'Int_Sel_Code'
        DataType = ftInteger
      end
      item
        Name = 'Sel1'
        DataType = ftInteger
      end
      item
        Name = 'Sel2'
        DataType = ftInteger
      end
      item
        Name = 'Sel3'
        DataType = ftInteger
      end
      item
        Name = 'Sel4'
        DataType = ftInteger
      end>
  end
  object SuppsSRC: TDataSource
    DataSet = GetSuppsSQL
    Left = 168
    Top = 168
  end
  object DelIntSelsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) and'
      '      (Sel1 = :Sel1) ')
    Left = 208
    Top = 128
    ParamData = <
      item
        Name = 'Int_Sel_Code'
        DataType = ftInteger
      end
      item
        Name = 'Sel1'
      end>
  end
  object SelSupSRC: TDataSource
    DataSet = SelSupSQL
    Left = 104
    Top = 336
  end
  object SelSupSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Supplier.Name as Supp_Name, Supplier_Branch.Name as Branc' +
        'h_Name,'
      '       Supplier_Branch.Supplier, Supplier_Branch.Branch_No'
      'From Supplier_Branch, Supplier, Int_Sel'
      'Where (Int_Sel.Int_Sel_Code = :Int_Sel_Code) and'
      '      (Int_Sel.Sel1 = 2) and'
      '      (Supplier_Branch.Supplier = Int_Sel.Sel2) and'
      '      (Supplier_Branch.Branch_No = Int_Sel.Sel3) and'
      '      (Supplier.Supplier = Supplier_Branch.Supplier)'
      'Order by Supplier.Name, Supplier_Branch.Name'
      '')
    Left = 296
    Top = 312
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end>
  end
  object DelIntSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) and'
      '      (Sel1 = :Sel1) and'
      '      (Sel2 = :Sel2) and'
      '      (Sel3 = :Sel3) and'
      '      (Sel4 = :Sel4) ')
    Left = 168
    Top = 320
    ParamData = <
      item
        Name = 'Int_Sel_Code'
        DataType = ftInteger
      end
      item
        Name = 'Sel1'
      end
      item
        Name = 'Sel2'
      end
      item
        Name = 'Sel3'
      end
      item
        Name = 'Sel4'
      end>
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 416
    Top = 352
  end
  object ChkIntSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Int_Sel_Code'
      'From Int_Sel'
      'where ((Int_Sel_Code = :Int_Sel_Code) and'
      '      (Sel1 = :Sel1) and'
      '      (Sel2 = :Sel2) and'
      '      (Sel3 = :Sel3) and'
      '      (sel4 = :Sel4))'
      '')
    Left = 40
    Top = 344
    ParamData = <
      item
        Name = 'Int_Sel_Code'
        DataType = ftInteger
      end
      item
        Name = 'Sel1'
        DataType = ftInteger
      end
      item
        Name = 'Sel2'
        DataType = ftInteger
      end
      item
        Name = 'Sel3'
        DataType = ftInteger
      end
      item
        Name = 'Sel4'
        DataType = ftInteger
      end>
  end
  object SelPopUpMenu: TPopupMenu
    Left = 264
    Top = 136
    object Select1: TMenuItem
      Caption = 'Select'
      OnClick = Select1Click
    end
    object SelectAllpopupbtn: TMenuItem
      Caption = 'Select All'
      OnClick = SelectAllpopupbtnClick
    end
  end
  object DeSelPopUpMenu: TPopupMenu
    Left = 352
    Top = 336
    object DeselPopUp: TMenuItem
      Caption = 'De-select'
      ImageIndex = 0
      OnClick = RemBitBtnClick
    end
    object DeSelAllPopUp: TMenuItem
      Caption = 'De-select All'
      OnClick = RemAllBitBtnClick
    end
  end
end
