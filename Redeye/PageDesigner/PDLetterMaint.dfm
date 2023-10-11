object PDLetterMaintFrm: TPDLetterMaintFrm
  Left = 192
  Top = 6
  BorderStyle = bsDialog
  Caption = 'Letter Layout Maintenance'
  ClientHeight = 630
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object lblLayout: TLabel
    Left = 8
    Top = 8
    Width = 66
    Height = 13
    Caption = 'Layout Name '
  end
  object pcSettings: TPageControl
    Left = 7
    Top = 192
    Width = 385
    Height = 433
    ActivePage = tsSettings
    TabOrder = 0
    object tsFonts: TTabSheet
      Caption = 'Letter Settings'
      object Label1: TLabel
        Left = 5
        Top = 160
        Width = 53
        Height = 13
        Caption = 'Tab Stop 1'
      end
      object Label2: TLabel
        Left = 5
        Top = 186
        Width = 53
        Height = 13
        Caption = 'Tab Stop 2'
      end
      object Label3: TLabel
        Left = 5
        Top = 212
        Width = 62
        Height = 13
        Caption = 'Tab measure'
      end
      inline fmFont1: TfmFontInfo
        Left = 3
        Top = 6
        Width = 373
        Height = 24
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 6
        inherited lblFont: TLabel
          Width = 71
          Height = 13
          ExplicitWidth = 71
          ExplicitHeight = 13
        end
        inherited cbFontName: TComboBox
          Height = 21
          ExplicitHeight = 21
        end
        inherited edtFontSize: TSpinEdit
          MinValue = 6
        end
      end
      inline fmFont2: TfmFontInfo
        Left = 3
        Top = 36
        Width = 373
        Height = 24
        TabOrder = 1
        ExplicitLeft = 3
        ExplicitTop = 36
        inherited lblFont: TLabel
          Width = 30
          Height = 13
          Caption = 'Font 2'
          ExplicitWidth = 30
          ExplicitHeight = 13
        end
        inherited cbFontName: TComboBox
          Height = 21
          ExplicitHeight = 21
        end
        inherited edtFontSize: TSpinEdit
          MinValue = 6
        end
      end
      inline fmFont3: TfmFontInfo
        Left = 3
        Top = 66
        Width = 373
        Height = 24
        TabOrder = 2
        ExplicitLeft = 3
        ExplicitTop = 66
        inherited lblFont: TLabel
          Width = 30
          Height = 13
          Caption = 'Font 3'
          ExplicitWidth = 30
          ExplicitHeight = 13
        end
        inherited cbFontName: TComboBox
          Height = 21
          ExplicitHeight = 21
        end
        inherited edtFontSize: TSpinEdit
          MinValue = 6
        end
      end
      inline fmFont4: TfmFontInfo
        Left = 3
        Top = 96
        Width = 373
        Height = 24
        TabOrder = 3
        ExplicitLeft = 3
        ExplicitTop = 96
        inherited lblFont: TLabel
          Width = 30
          Height = 13
          Caption = 'Font 4'
          ExplicitWidth = 30
          ExplicitHeight = 13
        end
        inherited cbFontName: TComboBox
          Height = 21
          ExplicitHeight = 21
        end
        inherited edtFontSize: TSpinEdit
          MinValue = 6
        end
      end
      inline fmFont5: TfmFontInfo
        Left = 3
        Top = 126
        Width = 373
        Height = 24
        TabOrder = 4
        ExplicitLeft = 3
        ExplicitTop = 126
        inherited lblFont: TLabel
          Width = 30
          Height = 13
          Caption = 'Font 5'
          ExplicitWidth = 30
          ExplicitHeight = 13
        end
        inherited cbFontName: TComboBox
          Height = 21
          ExplicitHeight = 21
        end
        inherited edtFontSize: TSpinEdit
          MinValue = 6
        end
      end
      object edtTabStop1: TEdit
        Left = 83
        Top = 156
        Width = 60
        Height = 21
        TabOrder = 5
        Text = '0'
        OnKeyPress = edtTabStop1KeyPress
      end
      object edtTabStop2: TEdit
        Left = 83
        Top = 182
        Width = 60
        Height = 21
        TabOrder = 6
        Text = '0'
        OnKeyPress = edtTabStop1KeyPress
      end
      object cbTabUnit: TComboBox
        Left = 83
        Top = 208
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 7
        Items.Strings = (
          'inches'
          'centimetres')
      end
    end
    object tsSettings: TTabSheet
      Caption = 'Element Settings'
      ImageIndex = 1
      object pnlPrintOrder: TPanel
        Left = 0
        Top = 2
        Width = 377
        Height = 127
        TabOrder = 0
        object lblPrintOrder: TLabel
          Left = 5
          Top = 9
          Width = 50
          Height = 13
          Caption = 'Print Order'
        end
        object lblUsesTab: TLabel
          Left = 128
          Top = 33
          Width = 166
          Height = 13
          Caption = 'Indent data from text using tab stop'
        end
        object edtPrintOrder: TEdit
          Left = 76
          Top = 5
          Width = 32
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = 'edtPrintOrder'
        end
        object cbColumn: TComboBox
          Left = 114
          Top = 5
          Width = 130
          Height = 21
          Style = csDropDownList
          TabOrder = 1
          Items.Strings = (
            'Full line width'
            'Column 1'
            'Column 2'
            'Column 3')
        end
        object btnPreview: TBitBtn
          Left = 261
          Top = 3
          Width = 110
          Height = 25
          Caption = 'Edit &Print Order'
          Default = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            0003377777777777777308888888888888807F33333333333337088888888888
            88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
            8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
            8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
          TabOrder = 2
          OnClick = btnPreviewClick
        end
        object cbPrinted: TCheckBox
          Left = 5
          Top = 30
          Width = 84
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Item is printed'
          TabOrder = 3
        end
        object cbBlankBefore: TCheckBox
          Left = 264
          Top = 52
          Width = 97
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Blank line before'
          TabOrder = 4
        end
        object cbBlankAfter: TCheckBox
          Left = 264
          Top = 76
          Width = 97
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Blank line after'
          TabOrder = 5
        end
        object rgAlignment: TRadioGroup
          Left = 4
          Top = 81
          Width = 234
          Height = 31
          Caption = ' Alignment '
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Left justify'
            'Centre'
            'Right justify')
          TabOrder = 6
          OnClick = rgAlignmentClick
        end
        object cbUsesTab: TComboBox
          Left = 304
          Top = 29
          Width = 57
          Height = 21
          TabOrder = 7
          OnChange = cbUsesTabChange
          Items.Strings = (
            '<None>'
            '1'
            '2')
        end
        object DtldCheckBox: TCheckBox
          Left = 8
          Top = 48
          Width = 81
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Detailed'
          TabOrder = 8
        end
      end
      object gbVariable: TGroupBox
        Left = 0
        Top = 139
        Width = 377
        Height = 134
        Caption = ' Variable part '
        TabOrder = 1
        object lblCanEdit: TLabel
          Left = 2
          Top = 42
          Width = 108
          Height = 13
          Caption = 'This text can be edited'
        end
        object reText1: TRichEdit
          Left = 2
          Top = 56
          Width = 372
          Height = 74
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Lines.Strings = (
            'Edit this text to change what appears on the printout.')
          ParentFont = False
          PopupMenu = pmnuRichTextEditor
          TabOrder = 0
        end
        inline fmElementFont1: TfmFontInfo
          Left = 2
          Top = 14
          Width = 373
          Height = 24
          TabOrder = 1
          ExplicitLeft = 2
          ExplicitTop = 14
          inherited lblFont: TLabel
            Width = 21
            Height = 13
            Caption = 'Font'
            ExplicitWidth = 21
            ExplicitHeight = 13
          end
          inherited cbFontName: TComboBox
            Height = 21
            OnChange = fmElementFont1cbFontNameChange
            Items.Strings = (
              'Font 1 (default)'
              'Font 2'
              'Font 3'
              'Font 4'
              'Font 5')
            ExplicitHeight = 21
          end
          inherited edtFontSize: TSpinEdit
            MinValue = 6
            OnChange = fmElementFont1edtFontSizeChange
          end
        end
      end
      object gbDatabase: TGroupBox
        Left = 0
        Top = 283
        Width = 377
        Height = 113
        Caption = 'Fixed (database) part '
        TabOrder = 2
        object Label5: TLabel
          Left = 2
          Top = 38
          Width = 61
          Height = 13
          Caption = 'Font preview'
        end
        inline fmElementFont2: TfmFontInfo
          Tag = 2
          Left = 2
          Top = 14
          Width = 373
          Height = 24
          TabOrder = 0
          ExplicitLeft = 2
          ExplicitTop = 14
          inherited lblFont: TLabel
            Width = 21
            Height = 13
            Caption = 'Font'
            ExplicitWidth = 21
            ExplicitHeight = 13
          end
          inherited cbFontName: TComboBox
            Height = 21
            OnChange = fmElementFont2cbFontNameChange
            Items.Strings = (
              'Font 1 (default)'
              'Font 2'
              'Font 3'
              'Font 4'
              'Font 5')
            ExplicitHeight = 21
          end
          inherited edtFontSize: TSpinEdit
            MinValue = 6
            OnChange = fmElementFont2edtFontSizeChange
          end
        end
        object reText2: TRichEdit
          Left = 2
          Top = 53
          Width = 372
          Height = 54
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Lines.Strings = (
            'This is some sample text.')
          ParentFont = False
          PopupMenu = pmnuRichTextEditor
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
  object tcElements: TTabControl
    Left = 4
    Top = 45
    Width = 389
    Height = 144
    MultiLine = True
    Style = tsButtons
    TabOrder = 1
    Tabs.Strings = (
      'Letter Settings'
      'Addressee'
      'Contact'
      'Date'
      'Enquiry Heading'
      'To Whom'
      'Preamble'
      'Description'
      'Parts Information'
      'No of Plates'
      'Artwork'
      'Quantities'
      'Boxed In'
      'Questions and Answers'
      'Additional Details'
      'Quote Date'
      'Notes'
      'Postamble'
      'Signatory'
      'Continuation')
    TabIndex = 0
    OnChange = tcElementsChange
    OnChanging = tcElementsChanging
  end
  object btnSave: TBitBtn
    Left = 234
    Top = 2
    Width = 75
    Height = 25
    Caption = '&Save'
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
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object btnCancel: TBitBtn
    Left = 315
    Top = 2
    Width = 75
    Height = 25
    Caption = '&Cancel'
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
    TabOrder = 3
  end
  object edtLayout: TEdit
    Left = 77
    Top = 4
    Width = 140
    Height = 21
    TabOrder = 4
    OnChange = edtLayoutChange
  end
  object cbDefault: TCheckBox
    Left = 77
    Top = 28
    Width = 244
    Height = 17
    Caption = 'Layout is default for this type'
    TabOrder = 5
  end
  object pmnuRichTextEditor: TPopupMenu
    OnPopup = pmnuRichTextEditorPopup
    Left = 291
    Top = 356
    object mnuUnDo: TMenuItem
      Caption = 'Undo'
      OnClick = mnuUnDoClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuCut: TMenuItem
      Caption = 'Cut'
      OnClick = mnuCutClick
    end
    object mnuCopy: TMenuItem
      Caption = 'Copy'
      OnClick = mnuCopyClick
    end
    object mnuPaste: TMenuItem
      Caption = 'Paste'
      OnClick = mnuPasteClick
    end
    object mnuDelete: TMenuItem
      Caption = 'Delete'
      OnClick = mnuDeleteClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnuSelectAll: TMenuItem
      Caption = 'Select All'
      OnClick = mnuSelectAllClick
    end
  end
end
