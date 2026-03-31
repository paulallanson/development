object AllEmailListFrm: TAllEmailListFrm
  Left = 41
  Top = 205
  Caption = 'AllEmailListFrm'
  ClientHeight = 258
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 737
    Height = 217
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object EmailListGrid: TStringGrid
      Left = 1
      Top = 1
      Width = 735
      Height = 215
      Align = alClient
      ColCount = 4
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
      OnClick = EmailListGridClick
      OnDrawCell = EmailListGridDrawCell
      OnSelectCell = EmailListGridSelectCell
      ColWidths = (
        171
        249
        159
        142)
    end
    object cmbExportFilter: TDBLookupComboBox
      Left = 456
      Top = 88
      Width = 145
      Height = 25
      KeyField = 'ExportFilter'
      ListField = 'Description'
      ListSource = ExFilterSRC
      TabOrder = 1
      Visible = False
      OnClick = cmbExportFilterClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 217
    Width = 737
    Height = 41
    Align = alBottom
    TabOrder = 1
    object lblCount: TLabel
      Left = 8
      Top = 16
      Width = 48
      Height = 17
      Caption = 'lblCount'
    end
    object BitBtn1: TBitBtn
      Left = 445
      Top = 8
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 525
      Top = 8
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object ExFilterSQL: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'select ExportFilter, Description'
      'from Exportfilter')
    Left = 432
    Top = 128
  end
  object ExFilterSRC: TDataSource
    DataSet = ExFilterSQL
    Left = 472
    Top = 128
  end
end
