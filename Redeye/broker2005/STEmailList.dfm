object STEmailListFrm: TSTEmailListFrm
  Left = 29
  Top = 150
  AutoScroll = False
  Caption = 'STEmailListFrm'
  ClientHeight = 271
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 749
    Height = 230
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object EmailListGrid: TStringGrid
      Left = 1
      Top = 1
      Width = 747
      Height = 228
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
      Height = 21
      KeyField = 'ExportFilter'
      ListField = 'Description'
      ListSource = ExFilterSRC
      TabOrder = 1
      Visible = False
      OnClick = cmbExportFilterClick
    end
  end
  object Panel2: TPanel
    ParentBackground = False
    Left = 0
    Top = 230
    Width = 749
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 445
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 525
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object ExFilterSQL: TFDQuery
    ConnectionName = 'PB'
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
