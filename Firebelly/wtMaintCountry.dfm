object frmWTMaintCountry: TfrmWTMaintCountry
  Left = 506
  Top = 162
  Width = 366
  Height = 134
  Caption = 'Country'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 28
    Width = 33
    Height = 13
    Caption = 'Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 176
    Top = 64
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 264
    Top = 64
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    NumGlyphs = 2
  end
  object edtDescription: TEdit
    Left = 54
    Top = 24
    Width = 185
    Height = 21
    TabOrder = 0
    Text = 'edtDescription'
    OnChange = EnableOK
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Country'
      'SET'
      '      Description = :Description'
      'WHERE'
      '  Country = :Country')
    Left = 80
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Country'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Country'
      '('
      '        Description'
      ')'
      'Values'
      '('
      '        :Description'
      ')'
      ' ')
    Left = 136
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select max(Country) as Country'
      'From Country')
    Left = 200
    Top = 40
  end
end
