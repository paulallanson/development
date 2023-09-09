object STSelSOrdSerialNosFrm: TSTSelSOrdSerialNosFrm
  Left = 241
  Top = 168
  BorderStyle = bsDialog
  Caption = 'Confirm Serial number selection'
  ClientHeight = 152
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 15
  object btnOK: TBitBtn
    Left = 82
    Top = 132
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 178
    Top = 132
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 321
    Height = 113
    Caption = 'Numbering'
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 28
      Width = 32
      Height = 15
      Caption = 'From:'
    end
    object Label2: TLabel
      Left = 16
      Top = 60
      Width = 16
      Height = 15
      Caption = 'To:'
    end
    object Label3: TLabel
      Left = 16
      Top = 88
      Width = 44
      Height = 15
      Caption = 'Quantity'
    end
    object lblCount: TLabel
      Left = 72
      Top = 88
      Width = 46
      Height = 15
      Caption = 'lblCount'
    end
    object lblSetsPerPad: TLabel
      Left = 160
      Top = 88
      Width = 103
      Height = 15
      Caption = 'Sets per pad/book:'
    end
    object edtNumberFrom: TEdit
      Left = 72
      Top = 24
      Width = 217
      Height = 23
      TabOrder = 0
      OnChange = edtNumberFromChange
    end
    object edtNumberTo: TEdit
      Left = 72
      Top = 56
      Width = 217
      Height = 23
      TabOrder = 1
      OnChange = edtNumberToChange
    end
  end
end
