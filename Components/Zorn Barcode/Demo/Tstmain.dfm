object Form1: TForm1
  Left = 443
  Top = 127
  Width = 278
  Height = 214
  Caption = 'ZBarcode Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poScreenCenter
  OnPaint = FormPaint
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 270
    Height = 168
    Align = alClient
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 8
    object File1: TMenuItem
      Caption = 'File'
      object Print2: TMenuItem
        Caption = 'Print'
        object Print1: TMenuItem
          Caption = 'Stretched'
          OnClick = Print1Click
        end
        object PrintDirect1: TMenuItem
          Caption = 'Direct'
          OnClick = PrintDirect1Click
        end
      end
      object Saveas1: TMenuItem
        Caption = 'Save as...'
        OnClick = Saveas1Click
      end
      object CopytoClipboard1: TMenuItem
        Caption = 'Copy to Clipboard'
        OnClick = CopytoClipboard1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      object Text1: TMenuItem
        Caption = 'Text...'
        OnClick = Text1Click
      end
      object Prefix1: TMenuItem
        Caption = 'Prefix...'
        OnClick = Prefix1Click
      end
      object AddOn1: TMenuItem
        Caption = 'AddOn...'
        OnClick = AddOn1Click
      end
      object Font1: TMenuItem
        Caption = 'Font...'
        OnClick = Font1Click
      end
    end
    object View1: TMenuItem
      Caption = 'View'
      object Direct1: TMenuItem
        Caption = 'Direct'
        GroupIndex = 1
        RadioItem = True
        OnClick = Stretched1Click
      end
      object Stretched1: TMenuItem
        Caption = 'Stretched'
        Checked = True
        GroupIndex = 1
        RadioItem = True
        OnClick = Stretched1Click
      end
    end
    object Symbolgy1: TMenuItem
      Caption = 'Symbology'
      object Code391: TMenuItem
        Caption = 'Code 39'
        GroupIndex = 2
        RadioItem = True
        OnClick = SymbolClick
      end
      object Code39wCheck1: TMenuItem
        Tag = 1
        Caption = 'Code 39 w. Check'
        GroupIndex = 2
        RadioItem = True
        OnClick = SymbolClick
      end
      object Code1281: TMenuItem
        Tag = 2
        Caption = 'Code 128'
        GroupIndex = 2
        RadioItem = True
        OnClick = SymbolClick
      end
      object EAN81: TMenuItem
        Tag = 3
        Caption = 'EAN-8'
        GroupIndex = 2
        RadioItem = True
        OnClick = SymbolClick
      end
      object EAN131: TMenuItem
        Tag = 4
        Caption = 'EAN-13'
        Checked = True
        GroupIndex = 2
        RadioItem = True
        OnClick = SymbolClick
      end
      object ITF1: TMenuItem
        Tag = 5
        Caption = 'ITF'
        GroupIndex = 2
        RadioItem = True
        OnClick = SymbolClick
      end
      object ITFwCheck1: TMenuItem
        Tag = 6
        Caption = 'ITF w. Check'
        GroupIndex = 2
        RadioItem = True
        OnClick = SymbolClick
      end
      object Postnet1: TMenuItem
        Tag = 7
        Caption = 'Postnet'
        GroupIndex = 2
        RadioItem = True
        OnClick = SymbolClick
      end
      object UPCA1: TMenuItem
        Tag = 8
        Caption = 'UPC-A'
        GroupIndex = 2
        RadioItem = True
        OnClick = SymbolClick
      end
    end
    object About1: TMenuItem
      Caption = 'About...'
      OnClick = About1Click
    end
  end
  object ZBarCode1: TZBarCode
    BarType = btEAN13
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Version = '3.0 Demo'
    Height = 204
    Width = 452
    Atom = 4
    Enhanced = True
    Left = 104
    Top = 8
  end
  object SaveDialog1: TSavePictureDialog
    Filter = 'Enhanced Metafiles (*.emf)|*.emf|Metafiles (*.wmf)|*.wmf'
    Left = 104
    Top = 64
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 24
    Top = 64
  end
end
