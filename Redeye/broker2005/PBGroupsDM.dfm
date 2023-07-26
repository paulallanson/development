object dmGroups: TdmGroups
  Height = 479
  Width = 741
  object GetLastContTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Contact_Type'
      'From Contact_Type'
      'Where Description = :GUID')
    Left = 48
    Top = 392
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object GetLastCurrencySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Currency_Code'
      'From Currency_Code'
      'Where Currency_Code_Descr = :GUID')
    Left = 152
    Top = 159
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdPTCatSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Category'
      'Set'
      'Description = :Description,'
      'Commission_Rate = :Comm_Rt'
      'Where'
      'Category = :Category'
      ''
      ''
      ' ')
    Left = 264
    Top = 64
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Comm_Rt'
      end
      item
        Name = 'Category'
      end>
  end
  object GetLastCustTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Customer_Type'
      'From Customer_Type'
      'Where Description = :GUID')
    Left = 48
    Top = 168
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdCountrySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Country_Id'
      'Set'
      'Country_Id_Descr = :Country_Id_Descr'
      'Where'
      'Country_Id = :Country_Id'
      ''
      '')
    Left = 160
    Top = 288
    ParamData = <
      item
        Name = 'Country_Id_Descr'
      end
      item
        Name = 'Country_Id'
      end>
  end
  object GetLastPTCatSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Category'
      'From Category'
      'Where Description = :GUID')
    Left = 264
    Top = 160
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddCustTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Customer_Type'
      '(Customer_Type, Description)'
      'Select Max(Customer_Type)+1, :GUID From Customer_Type'
      '')
    Left = 48
    Top = 16
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddPTCatSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Category'
      '(Category, Description)'
      'Select Max(Category)+1, :GUID From Category'
      '')
    Left = 264
    Top = 16
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object GetLastCountrySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Country_Id'
      'From Country_Id'
      'Where Country_Id_Descr = :GUID')
    Left = 160
    Top = 384
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddCurrencySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Currency_Code'
      '(Currency_Code, Currency_Code_Descr)'
      'Select Max(Currency_Code)+1, :GUID From Currency_Code')
    Left = 152
    Top = 16
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdContTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Contact_Type'
      'Set'
      'Description = :Description'
      'Where'
      'Contact_Type = :Contact_Type'
      ''
      '')
    Left = 48
    Top = 296
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Contact_Type'
      end>
  end
  object AddCountrySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Country_Id'
      '(Country_Id, Country_Id_Descr)'
      'Select Max(Country_Id)+1, :GUID From Country_Id'
      '')
    Left = 160
    Top = 240
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object DelCustTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Customer_Type'
      'Where Customer_Type = :Customer_Type')
    Left = 48
    Top = 112
    ParamData = <
      item
        Name = 'Customer_Type'
      end>
  end
  object DelCountrySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Country_Id'
      'Where Country_Id = :Country_Id')
    Left = 160
    Top = 336
    ParamData = <
      item
        Name = 'Country_Id'
      end>
  end
  object UpdCustTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Customer_Type'
      'Set'
      'Description = :Description,'
      'Color = :Color,'
      'Font_Color = :Font_Color'
      'Where'
      'Customer_Type = :Customer_Type'
      ''
      '')
    Left = 48
    Top = 64
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Color'
      end
      item
        Name = 'Font_Color'
      end
      item
        Name = 'Customer_Type'
      end>
  end
  object UpdCurrencySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Currency_Code'
      'Set'
      'Currency_Code_Descr = :Currency_Code_Descr'
      'Where'
      'Currency_Code = :Currency_Code'
      ''
      '')
    Left = 152
    Top = 63
    ParamData = <
      item
        Name = 'Currency_Code_Descr'
      end
      item
        Name = 'Currency_Code'
      end>
  end
  object DelIntrastatSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Intrastat_Id'
      'Where Intrastat_Id = :Intrastat_Id')
    Left = 272
    Top = 344
    ParamData = <
      item
        Name = 'Intrastat_Id'
      end>
  end
  object UpdIntrastatSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Intrastat_Id'
      'Set'
      'Intrastat_Id_Descr = :Intrastat_Id_Descr'
      'Where'
      'Intrastat_Id = :Intrastat_Id'
      ''
      '')
    Left = 272
    Top = 288
    ParamData = <
      item
        Name = 'Intrastat_Id_Descr'
      end
      item
        Name = 'Intrastat_Id'
      end>
  end
  object DelPTCatSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Category'
      'Where Category = :Category')
    Left = 264
    Top = 112
    ParamData = <
      item
        Name = 'Category'
      end>
  end
  object AddIntrastatSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Intrastat_Id'
      '(Intrastat_Id, Intrastat_Id_Descr)'
      'Select Max(Intrastat_Id)+1, :GUID From Intrastat_Id')
    Left = 272
    Top = 232
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object DelCurrencySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Currency_Code'
      'Where Currency_Code = :Currency_Code')
    Left = 152
    Top = 111
    ParamData = <
      item
        Name = 'Currency_Code'
      end>
  end
  object AddContTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Contact_type'
      '(Contact_Type, Description)'
      'Select Max(Contact_Type)+1, :GUID From Contact_Type')
    Left = 48
    Top = 240
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object GetLastIntrastatSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Intrastat_Id'
      'From Intrastat_Id'
      'Where Intrastat_Id_Descr = :GUID')
    Left = 272
    Top = 392
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object DelContTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Contact_Type'
      'where Contact_Type = :Contact_Type')
    Left = 48
    Top = 344
    ParamData = <
      item
        Name = 'Contact_Type'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Customer_Type'
      '(Customer_Type, Description)'
      'Select Max(Customer_Type)+1, :GUID From Customer_Type'
      '')
    Left = 160
    Top = 456
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddColourSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Paper_Colour'
      '(Paper_Colour, Paper_Colour_Description)'
      'Select Max(Paper_Colour)+1, :GUID From Paper_Colour')
    Left = 416
    Top = 232
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdColourSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Paper_Colour'
      'Set'
      'Paper_Colour_Description = :Description'
      'Where'
      'Paper_Colour = :Paper_Colour'
      '')
    Left = 416
    Top = 280
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Paper_Colour'
      end>
  end
  object DelColourSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Paper_Colour'
      'where Paper_Colour = :Paper_Colour')
    Left = 416
    Top = 328
    ParamData = <
      item
        Name = 'Paper_Colour'
      end>
  end
  object GetLastColourSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Paper_Colour'
      'From Paper_Colour'
      'Where Paper_Colour_Description = :GUID')
    Left = 416
    Top = 376
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddWeightSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Paper_Weight'
      '(Paper_Weight, Paper_Weight_Description)'
      'Select Max(Paper_Weight)+1, :GUID From Paper_Weight')
    Left = 344
    Top = 232
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdWeightSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Paper_Weight'
      'Set'
      'Paper_Weight_Description = :Description'
      'Where'
      'Paper_Weight = :Paper_Weight')
    Left = 344
    Top = 280
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Paper_Weight'
      end>
  end
  object DelWeightSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Paper_Weight'
      'where Paper_Weight = :Paper_Weight')
    Left = 344
    Top = 328
    ParamData = <
      item
        Name = 'Paper_Weight'
      end>
  end
  object GetLastWeightSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Paper_Weight'
      'From Paper_Weight'
      'Where Paper_Weight_Description = :GUID')
    Left = 344
    Top = 376
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddBrandSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Paper_Brand'
      '(Paper_Brand, Paper_Brand_Description)'
      'Select Max(Paper_Brand)+1, :GUID From Paper_Brand')
    Left = 336
    Top = 16
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddMaterialSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Paper_Material'
      '(Paper_Material, Paper_Material_Description)'
      'Select Max(Paper_Material)+1, :GUID From Paper_Material')
    Left = 408
    Top = 16
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdBrandSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Paper_Brand'
      'Set'
      'Paper_Brand_Description = :Description'
      'Where'
      'Paper_Brand = :Paper_Brand')
    Left = 336
    Top = 64
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Paper_Brand'
      end>
  end
  object UpdMaterialSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Paper_Material'
      'Set'
      'Paper_Material_Description = :Description'
      'Where'
      'Paper_Material = :Paper_Material'
      '')
    Left = 408
    Top = 64
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Paper_Material'
      end>
  end
  object DelBrandSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Paper_Brand'
      'where Paper_Brand = :Paper_Brand')
    Left = 336
    Top = 112
    ParamData = <
      item
        Name = 'Paper_Brand'
      end>
  end
  object DelMaterialSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete from Paper_Material'
      'where Paper_Material = :Paper_Material')
    Left = 408
    Top = 112
    ParamData = <
      item
        Name = 'Paper_Material'
      end>
  end
  object GetLastBrandSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Paper_Brand'
      'From Paper_Brand'
      'Where Paper_Brand_Description = :GUID')
    Left = 336
    Top = 160
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object GetLastMaterialSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Paper_Material'
      'From Paper_Material'
      'Where Paper_Material_Description = :GUID')
    Left = 408
    Top = 160
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddContLevelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Contact_Level'
      '(Contact_Level, Description)'
      'Select Max(Contact_Level)+1, :GUID From Contact_Level'
      '')
    Left = 512
    Top = 16
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdContLevelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Contact_Level'
      'Set'
      'Description = :Description'
      'Where'
      'Contact_Level = :Contact_Level'
      ''
      '')
    Left = 512
    Top = 64
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Contact_Level'
      end>
  end
  object DelContLevelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Contact_Level'
      'Where Contact_Level = :Contact_Level')
    Left = 512
    Top = 112
    ParamData = <
      item
        Name = 'Contact_Level'
      end>
  end
  object GetLastContLevelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Contact_Level'
      'From Contact_Level'
      'Where Description = :GUID')
    Left = 512
    Top = 168
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddEnqReasonSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Enq_InActive_Reason'
      '(Enq_InActive_Reason, Description)'
      
        'Select Max(Enq_InActive_Reason)+1, :GUID From Enq_InActive_Reaso' +
        'n'
      '')
    Left = 496
    Top = 232
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdEnqReasonSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Enq_InActive_Reason'
      'Set'
      'Description = :Description'
      'Where'
      'Enq_InActive_Reason = :Enq_InActive_Reason'
      ''
      '')
    Left = 496
    Top = 280
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'Enq_InActive_Reason'
      end>
  end
  object DelEnqReasonSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Enq_InActive_Reason'
      'Where Enq_InActive_Reason = :Enq_InActive_Reason')
    Left = 496
    Top = 328
    ParamData = <
      item
        Name = 'Enq_InActive_Reason'
      end>
  end
  object GetLastEnqReasonSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Enq_InActive_Reason'
      'From Enq_InActive_Reason'
      'Where Description = :GUID')
    Left = 496
    Top = 384
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddPOReasonSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into InActive_Reason'
      '(InActive_Reason, Description)'
      'Select Max(InActive_Reason)+1, :GUID From InActive_Reason'
      '')
    Left = 86
    Top = 128
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdPOReasonSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update InActive_Reason'
      'Set'
      'Description = :Description'
      'Where'
      'InActive_Reason = :InActive_Reason'
      ''
      '')
    Left = 86
    Top = 176
    ParamData = <
      item
        Name = 'Description'
      end
      item
        Name = 'InActive_Reason'
      end>
  end
  object DelPOReasonSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From InActive_Reason'
      'Where InActive_Reason = :InActive_Reason')
    Left = 86
    Top = 224
    ParamData = <
      item
        Name = 'InActive_Reason'
      end>
  end
  object GetLastPOReasonSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select InActive_Reason'
      'From InActive_Reason'
      'Where Description = :GUID')
    Left = 86
    Top = 280
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
end
