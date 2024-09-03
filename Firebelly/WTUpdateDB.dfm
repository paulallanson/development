object dtmdlUpdateDB: TdtmdlUpdateDB
  Height = 1090
  Width = 1930
  PixelsPerInch = 120
  object qryGetDBVersion: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Database_Version'
      'from Company')
    Left = 44
    Top = 8
  end
  object Acc50Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job ADD'
      '    Risk_Notes int NULL')
    Left = 65453
    Top = 383
  end
  object Acc56Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Sales_Order_Status'
      'SET Sales_Order_Status_Desc = '#39'New Order'#39
      'WHERE Sales_Order_Status = 10')
    Left = 65453
    Top = 413
  end
  object sql240Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Audit_Type'
      '('#9'Audit_Type int NOT NULL,'
      #9'Audit_Type_Descr nvarchar(40) NOT NULL,'
      #9'Audit_Table_Name nvarchar(40) NULL,'
      #9'Audit_Code_1_Field nvarchar(30) NULL,'
      #9'Audit_Code_2_Field nvarchar(30) NULL,'
      #9'Audit_Code_3_Field nvarchar(30) NULL,'
      #9'Audit_Code_4_Field nvarchar(30) NULL,'
      #9'Audit_Field_Name nvarchar(30) NULL,'
      '  PRIMARY KEY (Audit_Type)'
      ')')
    Left = 149
    Top = 8
  end
  object sql240Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Audit_Trail  ADD CONSTRAINT FK_AuditTrail_Audit_Type'
      #9'FOREIGN KEY (Audit_Type)'
      #9'REFERENCES Audit_Type')
    Left = 293
    Top = 8
  end
  object sql240Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE dbo.Audit_Trail ADD CONSTRAINT FK_AuditTrail_Operato' +
        'r'
      'FOREIGN KEY(Operator)'
      'REFERENCES Operator')
    Left = 365
    Top = 8
  end
  object sql240Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Audit_Trail'
      '('#9'Audit_Trail int NOT NULL IDENTITY PRIMARY KEY,'
      #9'Operator int NOT NULL,'
      #9'Date_Time_Entered datetime NOT NULL,'
      #9'Audit_Type int NOT NULL,'
      #9'Audit_Code_1 float NULL,'
      #9'Audit_Code_2 float NULL,'
      #9'Audit_Code_3 float NULL,'
      #9'Audit_Text nvarchar(50) NULL,'
      #9'Audit_Code_4 float NULL'
      ')')
    Left = 221
    Top = 8
  end
  object sql240Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'INSERT INTO Audit_Type (Audit_Type, Audit_Type_Descr, Audit_Tabl' +
        'e_Name)'
      'VALUES (4000, '#39'Sales Order Add'#39', '#39'Sales_Order'#39')')
    Left = 437
    Top = 8
  end
  object sql240Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'INSERT INTO Audit_Type (Audit_Type, Audit_Type_Descr, Audit_Tabl' +
        'e_Name)'
      'VALUES (4100, '#39'Sales Order Change'#39', '#39'Sales_Order'#39')')
    Left = 509
    Top = 8
  end
  object sql240Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'INSERT INTO Audit_Type (Audit_Type, Audit_Type_Descr, Audit_Tabl' +
        'e_Name)'
      'VALUES (4200, '#39'Sales Order Line Add'#39', '#39'Sales_Order_Line'#39')')
    Left = 589
    Top = 8
  end
  object sql240Q8: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'INSERT INTO Audit_Type (Audit_Type, Audit_Type_Descr, Audit_Tabl' +
        'e_Name)'
      'VALUES (4300, '#39'Sales Order Line Change'#39', '#39'Sales_Order_Line'#39')')
    Left = 669
    Top = 8
  end
  object sql240Q9: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = '#39'24.1'#39)
    Left = 749
    Top = 8
  end
end
