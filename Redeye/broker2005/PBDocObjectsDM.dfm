object dmPBDocObjects: TdmPBDocObjects
  OldCreateOrder = False
  Left = 64
  Top = 176
  Height = 480
  Width = 696
  object qryDelPOLineDocs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Purchase_orderlineDocs'
      'where purchase_order = :purchase_order and line = :line; ')
    Left = 40
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qryInsPOLineDocs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Purchase_orderlineDocs'
      '(Purchase_Order, Line, Document_no, Document_Title, Document)'
      'values'
      
        '(:Purchase_Order, :Line, :Document_no, :Document_Title, :Documen' +
        't)'
      ' ')
    Left = 40
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document_Title'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document'
        ParamType = ptUnknown
      end>
  end
  object qryDelEnqLineDocs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from EnquiryLineDocs'
      'where enquiry = :enquiry and '
      ' Line = :line')
    Left = 136
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'enquiry'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qryInsEnqLineDoc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into EnquiryLineDocs'
      '(Enquiry, Line, Document_no, Document_Title, Document)'
      'values'
      '(:Enquiry, :Line, :Document_no, :Document_Title, :Document)')
    Left = 136
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document_Title'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Document'
        ParamType = ptUnknown
      end>
  end
  object qrySelEnqLineDocs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from EnquiryLineDocs '
      'where enquiry = :enquiry and line = :line '
      'order by document_no')
    Left = 136
    Top = 100
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qrySelPOLineDocs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Purchase_orderlineDocs '
      'where purchase_order = :purchase_order '
      'and line = :line '
      'order by Document_no;'
      ' ')
    Left = 40
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    Left = 224
    Top = 8
  end
end
