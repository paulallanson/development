inherited frmWTMaintCutOutDtls: TfrmWTMaintCutOutDtls
  Caption = 'Cut out details'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited dblkpDescription: TDBLookupComboBox
    DataField = 'cutout'
    DataSource = frmWtLUCutOutDtls.srcCOutThickness
    KeyField = 'CutOut'
    ListSource = srclkpCutOuts
  end
  object lkpCutOuts: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select * from cutout'
      'where cutout not in'
      '(select cutout from cutout_thickness'
      
        ' where material_type = :Material_type and Edge_Type = :Edge_Type' +
        ')'
      'order by Description')
    Left = 72
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Material_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Edge_Type'
        ParamType = ptUnknown
      end>
  end
  object srclkpCutOuts: TDataSource
    DataSet = lkpCutOuts
    Left = 128
    Top = 8
  end
end
