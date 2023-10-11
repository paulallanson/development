object CSMaintUOMFrm: TCSMaintUOMFrm
  Left = 388
  Top = 182
  Width = 303
  Height = 139
  Caption = 'CSMaintUOMFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object DeleteLabel: TLabel
    Left = 8
    Top = 76
    Width = 92
    Height = 13
    Caption = 'Delete Details ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DetsGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 273
    Height = 57
    Caption = ' Description '
    TabOrder = 0
    object edtDescription: TEdit
      Left = 8
      Top = 24
      Width = 257
      Height = 23
      MaxLength = 40
      TabOrder = 0
      OnChange = edtDescriptionChange
    end
  end
  object OKBitBtn: TBitBtn
    Left = 128
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = OKBitBtnClick
    Kind = bkOK
  end
  object CancelBitBtn: TBitBtn
    Left = 208
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end
