object PBMaintInvChgsfrm: TPBMaintInvChgsfrm
  Left = 179
  Top = 138
  ActiveControl = cmbbxAddChrg
  BorderStyle = bsDialog
  Caption = 'Additional charge details'
  ClientHeight = 182
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object lblDelete: TLabel
    Left = 152
    Top = 148
    Width = 133
    Height = 16
    Caption = 'Delete these charges'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 299
    Top = 144
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
    TabOrder = 1
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 387
    Top = 144
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 0
    Width = 489
    Height = 137
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 12
      Width = 35
      Height = 13
      Caption = 'Details'
    end
    object Label2: TLabel
      Left = 24
      Top = 44
      Width = 24
      Height = 13
      Caption = 'Price'
    end
    object Label3: TLabel
      Left = 24
      Top = 76
      Width = 18
      Height = 13
      Caption = 'VAT'
    end
    object Nominal: TLabel
      Left = 271
      Top = 76
      Width = 43
      Height = 13
      Caption = 'Nominal'
    end
    object Label4: TLabel
      Left = 288
      Top = 44
      Width = 23
      Height = 13
      Caption = 'Cost'
    end
    object Label5: TLabel
      Left = 196
      Top = 108
      Width = 118
      Height = 13
      Caption = 'Associated Invoice Line'
    end
    object memPrice: TMemo
      Left = 72
      Top = 40
      Width = 113
      Height = 23
      Alignment = taRightJustify
      TabOrder = 2
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = memPriceEnter
      OnExit = memPriceExit
    end
    object dblkpVat: TDBLookupComboBox
      Left = 72
      Top = 72
      Width = 169
      Height = 21
      KeyField = 'Vat_Code'
      ListField = 'Description'
      ListSource = dsVAT
      TabOrder = 3
      OnClick = CheckOK
    end
    object btnLUAddChrg: TButton
      Left = 440
      Top = 7
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnLUAddChrgClick
    end
    object cmbbxAddChrg: TComboBox
      Left = 72
      Top = 8
      Width = 353
      Height = 21
      TabOrder = 0
      OnClick = cmbbxAddChrgClick
    end
    object memCost: TMemo
      Left = 320
      Top = 40
      Width = 113
      Height = 23
      Alignment = taRightJustify
      TabOrder = 4
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
      OnEnter = memPriceEnter
      OnExit = memPriceExit
    end
    object edtNominal: TMaskEdit
      Left = 320
      Top = 72
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!90009999/900/000;0;_'
      MaxLength = 16
      TabOrder = 5
      Text = ''
      OnChange = CheckOK
    end
    object cmbLines: TComboBox
      Left = 320
      Top = 104
      Width = 65
      Height = 21
      Style = csDropDownList
      TabOrder = 6
    end
  end
  object qryVAT: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from VAT_Code')
    Left = 72
    Top = 96
  end
  object dsVAT: TDataSource
    DataSet = qryVAT
    Left = 104
    Top = 96
  end
  object qryAddChrgs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from additional_charge'
      'order by details')
    Left = 352
    Top = 40
  end
end
