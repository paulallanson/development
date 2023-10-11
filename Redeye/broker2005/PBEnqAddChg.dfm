object PBEnqAddChgFrm: TPBEnqAddChgFrm
  Left = 138
  Top = 117
  Caption = 'Supplier'#39's Additional Charges'
  ClientHeight = 171
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object AddChargesGrid: TStringGrid
    Left = 8
    Top = 8
    Width = 473
    Height = 120
    ColCount = 3
    DefaultColWidth = 250
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
    OnClick = AddChargesGridClick
    OnDrawCell = AddChargesGridDrawCell
    OnKeyPress = AddChargesGridKeyPress
    OnSelectCell = AddChargesGridSelectCell
    ColWidths = (
      286
      84
      75)
  end
  object BitBtn1: TBitBtn
    Left = 152
    Top = 136
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 240
    Top = 136
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object DeleteButton: TBitBtn
    Left = 488
    Top = 32
    Width = 22
    Height = 22
    Glyph.Data = {
      BE060000424DBE06000000000000360400002800000024000000120000000100
      0800000000008802000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303F8F80303030303030303030303030303030303FF03030303030303030303
      0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
      03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
      030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
      FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
      030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
      F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
      010101F8030303030303030303F8FF030303030303FFF8030303030303030303
      030101010101F80303030303030303030303F8FF0303030303F8030303030303
      0303030303F901010101F8030303030303030303030303F8FF030303F8030303
      0303030303030303F90101010101F8030303030303030303030303F803030303
      F8FF030303030303030303F9010101F8010101F803030303030303030303F803
      03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
      03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
      03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
      0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
      030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
      03030303030303030303030303030303030303030303030303F8F8F803030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303}
    NumGlyphs = 2
    TabOrder = 3
    Visible = False
    OnClick = DeleteButtonClick
  end
  object UpdateSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'update supp_Enq_Add_Charge'
      'set'
      '  Quotation_Price = :Price'
      'where'
      '  Supplier = :Supplier and'
      '  Branch_no = :Branch and'
      '  Enquiry = :Enquiry and'
      '  Line = :Line and'
      '  Additional_charge = :charges')
    Left = 104
    Top = 104
    ParamData = <
      item
        Name = 'Price'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'charges'
      end>
  end
  object DeleteSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'delete from Supp_Enq_Add_charge'
      'where (Enquiry = :Enquiry) AND'
      '           (Line = :Line) AND'
      '           (Supplier = :Supplier) AND'
      '           (Branch_no = :Branch)')
    Left = 160
    Top = 96
    ParamData = <
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Branch'
        DataType = ftInteger
      end>
  end
  object InsertSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into supp_Enq_Add_Charge'
      '                (Supplier,'
      '                 Branch_no,'
      '                 Enquiry,'
      '                 Line,'
      '                 Additional_charge,'
      '                 Details,'
      '                 Amount,'
      '                 Quotation_Price)'
      'values'
      '                 (:Supplier,'
      '                  :Branch,'
      '                  :Enquiry,'
      '                  :Line,'
      '                  :charges,'
      '                  :Details,'
      '                  :Cost,'
      '                  :Price)')
    Left = 232
    Top = 88
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'charges'
      end
      item
        Name = 'Details'
      end
      item
        Name = 'Cost'
      end
      item
        Name = 'Price'
      end>
  end
  object addchargesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select supp_Enq_Add_Charge.*'
      'from supp_Enq_Add_Charge'
      'where (supp_Enq_Add_Charge.Enquiry = :enquiry) AND'
      '           (supp_Enq_Add_Charge.Line = :line) AND'
      '           (supp_Enq_Add_Charge.Supplier = :Supplier) AND'
      '           (supp_Enq_Add_Charge.Branch_no = :Branch)'
      'order by additional_charge')
    Left = 320
    Top = 80
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch'
      end>
  end
end
