object PBEmailToOneFrm: TPBEmailToOneFrm
  Left = 319
  Top = 190
  BorderStyle = bsDialog
  Caption = 'Email Send Confirmation'
  ClientHeight = 176
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object FaxDescrLabel: TLabel
    Left = 64
    Top = 10
    Width = 58
    Height = 13
    Caption = 'Emailing To:'
  end
  object Label1: TLabel
    Left = 8
    Top = 10
    Width = 42
    Height = 13
    Caption = 'Emailing:'
  end
  object Label2: TLabel
    Left = 8
    Top = 42
    Width = 41
    Height = 13
    Caption = 'Address:'
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 65
    Height = 33
    AutoSize = False
    Caption = 'Attachment Type'
    WordWrap = True
  end
  object FaxNoEdit: TEdit
    Left = 93
    Top = 40
    Width = 369
    Height = 21
    TabOrder = 0
    OnChange = FaxNoEditChange
  end
  object CancelBitBtn: TBitBtn
    Left = 392
    Top = 128
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object OKBitBtn: TBitBtn
    Left = 312
    Top = 128
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = OKBitBtnClick
  end
  object cmbExportFilter: TDBLookupComboBox
    Left = 93
    Top = 80
    Width = 145
    Height = 21
    KeyField = 'ExportFilter'
    ListField = 'Description'
    ListSource = ExFilterSRC
    TabOrder = 3
  end
  object ExFilterSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select ExportFilter, Description'
      'from Exportfilter')
    Left = 280
    Top = 72
  end
  object ExFilterSRC: TDataSource
    DataSet = ExFilterSQL
    Left = 320
    Top = 72
  end
end
