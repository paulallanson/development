inherited frmWTMaintCutOutDtls: TfrmWTMaintCutOutDtls
  Caption = 'Cut out details'
  TextHeight = 13
  inherited dblkpDescription: TDBLookupComboBox
    DataField = 'cutout'
    DataSource = frmWtLUCutOutDtls.srcCOutThickness
    KeyField = 'CutOut'
    ListSource = srclkpCutOuts
  end
  object lkpCutOuts: TFDQuery
    ConnectionName = 'WT'
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
        Name = 'Material_type'
      end
      item
        Name = 'Edge_Type'
      end>
  end
  object srclkpCutOuts: TDataSource
    DataSet = lkpCutOuts
    Left = 128
    Top = 8
  end
end
