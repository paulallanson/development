object PBEnqInActLineFrm: TPBEnqInActLineFrm
  Left = 163
  Top = 147
  BorderStyle = bsDialog
  Caption = 'Inactive Enquiries'
  ClientHeight = 262
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 212
    Width = 146
    Height = 13
    Caption = 'Reason for marking inactive '
  end
  object EnqNoDBText: TDBText
    Left = 0
    Top = 0
    Width = 57
    Height = 15
    DataField = 'Enquiry'
    DataSource = DetsSRC
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object DescDBText: TDBText
    Left = 40
    Top = 0
    Width = 58
    Height = 13
    AutoSize = True
    DataField = 'Description'
    DataSource = DetsSRC
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object EnqLinesStringGrid: TStringGrid
    Left = 0
    Top = 24
    Width = 465
    Height = 169
    ColCount = 4
    DefaultRowHeight = 20
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 0
    OnDrawCell = EnqLinesStringGridDrawCell
    OnSelectCell = EnqLinesStringGridSelectCell
    ColWidths = (
      41
      211
      160
      25)
  end
  object ReasonsDBLUCB: TDBLookupComboBox
    Left = 160
    Top = 208
    Width = 193
    Height = 21
    KeyField = 'Enq_InActive_Reason'
    ListField = 'Description'
    ListSource = ReasonsSRC
    TabOrder = 1
    OnClick = ReasonsDBLUCBClick
  end
  object CancelBitBtn: TBitBtn
    Left = 392
    Top = 240
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object OKBitBtn: TBitBtn
    Left = 312
    Top = 240
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
    OnClick = OKBitBtnClick
  end
  object ReasMntBitBtn: TBitBtn
    Left = 360
    Top = 208
    Width = 25
    Height = 23
    Hint = 'Maintain Reasons'
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = ReasMntBitBtnClick
  end
  object GetReasonsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Enq_InActive_Reason.Enq_InActive_Reason, Enq_InActive_Rea' +
        'son.Description'
      'from Enq_InActive_Reason'
      'Order By Enq_InActive_Reason.Description')
    Left = 104
    Top = 160
  end
  object ReasonsSRC: TDataSource
    DataSet = GetReasonsSQL
    Left = 200
    Top = 160
  end
  object UpdActiveLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update EnquiryLine'
      'Set Enq_InActive = '#39'Y'#39','
      '    Enq_Inactive_Reason = :Enq_Inactive_Reason,'
      '    Enq_Inactive_Date = :Enq_Inactive_Date '
      'Where (Enquiry = :Enquiry) and'
      '      (Line = :Line)')
    Left = 304
    Top = 72
    ParamData = <
      item
        Name = 'Enq_Inactive_Reason'
      end
      item
        Name = 'Enq_Inactive_Date'
        DataType = ftDate
      end
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end>
  end
  object UpdActiveHeadSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Enquiry'
      'Set Enq_InActive = :Enq_InActive'
      'Where (Enquiry = :Enquiry) ')
    Left = 376
    Top = 136
    ParamData = <
      item
        Name = 'Enq_InActive'
      end
      item
        Name = 'Enquiry'
      end>
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select EnquiryLine.Line, EnquiryLine.Form_Description,'
      '       Enquiry_Status.Description'
      'From EnquiryLine, Enquiry_Status'
      'Where (EnquiryLine.Enquiry = :Enquiry) and'
      
        '      (Enquiry_Status.Enquiry_Status = EnquiryLine.Enquiry_Statu' +
        's) and'
      '      (EnquiryLine.Enq_Inactive <> :Enq_Inactive )')
    Left = 256
    Top = 24
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Enq_Inactive'
      end>
  end
  object GDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Enquiry.Enquiry, Enquiry.Description'
      'From Enquiry'
      'Where (Enquiry.Enquiry = :Enquiry) and'
      '      (Enquiry.Description = Enquiry.Description) '
      ''
      '')
    Left = 392
    Top = 56
    ParamData = <
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end>
    object GDetsSQLEnquiry: TIntegerField
      FieldName = 'Enquiry'
      KeyFields = 'Enquiry'
      ReadOnly = True
      Required = True
    end
    object GDetsSQLDescription: TStringField
      FieldName = 'Description'
      ReadOnly = True
      Required = True
      FixedChar = True
      Size = 160
    end
  end
  object DetsSRC: TDataSource
    DataSet = GDetsSQL
    Left = 320
    Top = 24
  end
  object UpdInActiveSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update EnquiryLine'
      'Set Enq_Inactive = '#39'N'#39','
      '      Enq_Inactive_Reason = NULL,'
      '      Enq_Inactive_Date = NULL'
      'Where (Enquiry = :Enquiry) and'
      '      (Line = :Line)'
      ' ')
    Left = 176
    Top = 56
    ParamData = <
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end>
  end
end
