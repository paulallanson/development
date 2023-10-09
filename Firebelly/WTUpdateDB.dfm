object dtmdlUpdateDB: TdtmdlUpdateDB
  Height = 872
  Width = 1544
  object qryGetDBVersion: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Database_Version'
      'from Company')
    Left = 16
    Top = 6
  end
  object Acc50Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job ADD'
      '    Risk_Notes int NULL')
    Left = 65470
    Top = 306
  end
  object Acc56Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Sales_Order_Status'
      'SET Sales_Order_Status_Desc = '#39'New Order'#39
      'WHERE Sales_Order_Status = 10')
    Left = 65470
    Top = 330
  end
  object Acc143Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Quote Add'
      '        Rep  int NULL')
    Left = 16
    Top = 56
  end
  object Acc143Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Quote ADD CONSTRAINT FK_Quote_Rep'
      '       FOREIGN KEY (Rep)'
      '       REFERENCES Rep')
    Left = 48
    Top = 56
  end
  object Acc143Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote Add'
      '        Rep  int NULL')
    Left = 80
    Top = 56
  end
  object Acc143Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote ADD CONSTRAINT FK_ContractQuote_Rep'
      '       FOREIGN KEY (Rep)'
      '       REFERENCES Rep')
    Left = 112
    Top = 56
  end
  object Acc143Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote Add'
      '        Expected_Start_Date  datetime  NULL')
    Left = 144
    Top = 56
  end
  object Acc143Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Worktop_Group ADD'
      '        Use_For_General_Quoting  text(1)  NULL')
    Left = 176
    Top = 56
  end
  object Acc143Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Purchase_Order_Internal_Note'
      '('
      'Purchase_Order                          int     NOT NULL,'
      'Internal_Note                              int     NOT NULL,'
      'Date_Time_Entered                    datetime    NOT NULL,'
      'Narrative                                     int    NULL,'
      'Operator                                      int    NOT NULL,'
      'PRIMARY KEY (Purchase_Order, Internal_Note)'
      ')')
    Left = 208
    Top = 56
  end
  object Acc143Q8: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE Purchase_Order_Internal_Note ADD CONSTRAINT FK_POIN_' +
        'PO'
      '          FOREIGN KEY (Purchase_Order)'
      '          REFERENCES Purchase_Order')
    Left = 240
    Top = 56
  end
  object Acc143Q9: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE Purchase_Order_Internal_Note ADD CONSTRAINT FK_POIN_' +
        'Operator'
      '          FOREIGN KEY (Operator)'
      '          REFERENCES Operator')
    Left = 272
    Top = 56
  end
  object Acc143Q10: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Customer_Cutout_Edge_Group'
      '('
      'Group_ID                           AutoIncrement     NOT NULL,'
      'Group_Description            text(100)    NULL,'
      'Customer                           int    NULL,'
      'Material_Type                   int     NULL,'
      'Effective_Date                 datetime  NULL,'
      'Ineffective_Date              datetime  NULL,'
      'PRIMARY KEY (Group_ID)'
      ')')
    Left = 304
    Top = 56
  end
  object Acc143Q11: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE Customer_Cutout_Edge_Group ADD CONSTRAINT FK_CCEG_Cu' +
        'stomer'
      '           FOREIGN KEY (Customer)'
      '           REFERENCES Customer')
    Left = 336
    Top = 56
  end
  object Acc143Q12: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE Customer_Cutout_Edge_Group ADD CONSTRAINT FK_CCEG_Ma' +
        'terialType'
      '           FOREIGN KEY (Material_Type)'
      '           REFERENCES Material_Type')
    Left = 368
    Top = 56
  end
  object Acc143Q13: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Customer_Cutout'
      '('
      'Cutout_ID                          AutoIncrement  NOT NULL,'
      'Group_ID                           int    NOT NULL,'
      'CutOut                               int    NOT NULL,'
      'Price_Pointer                     int    NOT NULL,'
      'PRIMARY KEY (Cutout_ID)'
      ')')
    Left = 400
    Top = 56
  end
  object Acc143Q14: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Cutout ADD CONSTRAINT FK_CCO_CCEG'
      '           FOREIGN KEY (Group_ID)'
      '           REFERENCES Customer_CutOut_Edge_Group')
    Left = 432
    Top = 56
  end
  object Acc143Q15: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Cutout ADD CONSTRAINT FK_CCO_Cutout'
      '           FOREIGN KEY (Cutout)'
      '           REFERENCES CutOut')
    Left = 464
    Top = 56
  end
  object Acc143Q16: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Customer_Edge'
      '('
      'Edge_ID                          AutoIncrement  NOT NULL,'
      'Group_ID                           int    NOT NULL,'
      'Edge_Profile                      int    NOT NULL,'
      'Price_Pointer                     int    NOT NULL,'
      'PRIMARY KEY (Edge_ID)'
      ')')
    Left = 496
    Top = 56
  end
  object Acc143Q17: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Edge ADD CONSTRAINT FK_CCE_CCEG'
      '           FOREIGN KEY (Group_ID)'
      '           REFERENCES Customer_CutOut_Edge_Group')
    Left = 528
    Top = 56
  end
  object Acc143Q18: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Edge ADD CONSTRAINT FK_CCO_Edge'
      '           FOREIGN KEY (Edge_Profile)'
      '           REFERENCES Edge_Profile')
    Left = 560
    Top = 56
  end
  object Acc143Q19: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Worktop_Group_Thick   ADD '
      
        '       Markup_Percentage             double                  NUL' +
        'L')
    Left = 592
    Top = 56
  end
  object Acc143Q20: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 14.3')
    Left = 624
    Top = 54
  end
  object Acc144Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Cutout ADD'
      '                      Edge_Type              int      NULL')
    Left = 696
    Top = 55
  end
  object Acc144Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Cutout ADD CONSTRAINT CustCutOut_Edge_Type'
      '              FOREIGN KEY (Edge_Type)'
      '              REFERENCES Edge_Type')
    Left = 736
    Top = 55
  end
  object Acc144Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Edge ADD'
      '                      Edge_Type              int      NULL')
    Left = 776
    Top = 55
  end
  object Acc144Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Edge ADD CONSTRAINT CustEdge_Edge_Type'
      '              FOREIGN KEY (Edge_Type)'
      '              REFERENCES Edge_Type')
    Left = 816
    Top = 55
  end
  object Acc144Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Cutout_Edge_Group ADD'
      '                      inactive              text(1)      NULL')
    Left = 856
    Top = 55
  end
  object Acc144Q8: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 14.4')
    Left = 976
    Top = 55
  end
  object Acc144Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Cutout_Edge_Group ADD'
      '        Use_For_General_Quoting  text(1)  NULL')
    Left = 896
    Top = 56
  end
  object Acc144Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer ADD'
      '        Use_For_General_Quoting  text(1)  NULL')
    Left = 936
    Top = 56
  end
  object Acc145Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Quote_Slab ALTER COLUMN'
      '                      Quantity              double      NULL')
    Left = 16
    Top = 103
  end
  object Acc145Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Purchase_OrderLine ALTER COLUMN'
      '                      Quantity              double      NULL')
    Left = 56
    Top = 103
  end
  object Acc145Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Purchase_OrderLine ALTER COLUMN'
      
        '                      Quantity_Delivered              double    ' +
        '  NULL')
    Left = 96
    Top = 103
  end
  object Acc145Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Purchase_OrderLine ALTER COLUMN'
      
        '                      Quantity_Invoiced              double     ' +
        ' NULL')
    Left = 136
    Top = 103
  end
  object Acc145Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Purchase_OrderLine_Deliv ALTER COLUMN'
      '                      Quantity              double      NULL')
    Left = 176
    Top = 103
  end
  object Acc145Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote_Line_Option ADD'
      
        '                      Markup_Percentage              double     ' +
        ' NULL')
    Left = 216
    Top = 103
  end
  object Acc145Q8: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Email_Application'
      'VALUES ('#39'OUT2016'#39', '#39'Outlook 2016'#39')')
    Left = 296
    Top = 103
  end
  object Acc145Q9: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Email_Application'
      'VALUES ('#39'OUT365'#39', '#39'Outlook 365'#39')')
    Left = 336
    Top = 103
  end
  object Acc145Q10: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 14.5')
    Left = 376
    Top = 103
  end
  object Acc145Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote_Line_Option ADD'
      '                      Original_Quote              int      NULL')
    Left = 256
    Top = 103
  end
  object Acc146Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Worktop_Thickness ADD'
      '                      inactive    text(1)      NULL')
    Left = 440
    Top = 103
  end
  object Acc146Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer ADD'
      
        '                      End_User_Markup_Percentage       double   ' +
        '   NULL')
    Left = 472
    Top = 103
  end
  object Acc146Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 14.6')
    Left = 568
    Top = 103
  end
  object Acc146Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Vat ADD'
      
        '                      Invoice_Text               text(100)      ' +
        'NULL')
    Left = 504
    Top = 103
  end
  object Acc146Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Vat ADD'
      
        '                      Reverse_Charge               text(1)      ' +
        'NULL')
    Left = 536
    Top = 103
  end
  object Acc147Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE AppointmentStatus'
      '('
      'Id                        int            NOT NULL,'
      'Is_Opened                Text(50)                 NULL,'
      'User                      Text(50)                 NULL'
      ')')
    Left = 640
    Top = 103
  end
  object Acc147Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 14.7')
    Left = 672
    Top = 103
  end
  object Acc148Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Fitter ADD'
      
        '               Include_In_Schedule            text(1)           ' +
        '   NULL')
    Left = 728
    Top = 103
  end
  object Acc148Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 14.8')
    Left = 760
    Top = 103
  end
  object Acc149Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      
        '               Shared_Folder            text(50)              NU' +
        'LL')
    Left = 808
    Top = 103
  end
  object Acc149Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 14.9')
    Left = 840
    Top = 103
  end
  object Acc150Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Worktop_Type_Thickness'
      '('
      'ID    AUTOINCREMENT    NOT NULL,'
      'Worktop_Type  int   NOT NULL,'
      'Thickness     int   NOT NULL,'
      'Weight_kg     double  NOT NULL,'
      'PRIMARY KEY (ID)'
      ')')
    Left = 888
    Top = 103
  end
  object Acc150Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 15')
    Left = 1048
    Top = 103
  end
  object Acc150Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE AppointmentStatus ADD'
      '    Workstation int       NULL'
      '')
    Left = 1008
    Top = 103
  end
  object Acc150Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE Worktop_Type_Thickness ADD CONSTRAINT FK_WTT_Worktop' +
        '_Type'
      '    FOREIGN KEY (Worktop_Type)'
      '    REFERENCES Worktop_Type'
      '')
    Left = 928
    Top = 103
  end
  object Acc150Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE Worktop_Type_Thickness ADD CONSTRAINT FK_WTT_Thickne' +
        'ss'
      '    FOREIGN KEY (Thickness)'
      '    REFERENCES Thickness')
    Left = 968
    Top = 103
  end
  object Acc151Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '  Default_Quote_Follow_up_Days    int  NULL')
    Left = 1104
    Top = 103
  end
  object Acc151Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 15.1')
    Left = 1200
    Top = 103
  end
  object Acc151Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote_Line ALTER COLUMN'
      '  Drawing_Number    text(100)  NULL')
    Left = 1152
    Top = 103
  end
  object Acc152Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Thickness ALTER COLUMN'
      #9'Thickness_mm'#9'text(50)'#9'NOT NULL'
      '')
    Left = 16
    Top = 159
  end
  object Acc152Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Worktop_Group ALTER COLUMN'
      #9'Worktop_Group_Description'#9'text(50)'#9'NOT NULL'
      '')
    Left = 72
    Top = 159
  end
  object Acc152Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 15.2')
    Left = 128
    Top = 159
  end
  object Acc153Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Int_Sel ADD COLUMN'
      #9'Sel5    double'#9' NULL'
      '')
    Left = 192
    Top = 159
  end
  object Acc153Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 15.3')
    Left = 336
    Top = 159
  end
  object Acc153Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer ADD COLUMN'
      #9'Is_Commercial_Customer'#9'text(1)'#9'NULL'
      '')
    Left = 240
    Top = 159
  end
  object Acc153Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Customer '
      'SET Is_Commercial_Customer'#9'= '#39'N'#39
      '')
    Left = 288
    Top = 159
  end
  object Acc200Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '                   Customer_Sales_Lead_Source     int     NULL'
      '')
    Left = 408
    Top = 159
  end
  object Acc200Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.0')
    Left = 496
    Top = 159
  end
  object Acc200Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD CONSTRAINT FK_Company_Sales_Lead'
      '                   FOREIGN KEY (Customer_Sales_Lead_Source)'
      '                   REFERENCES Sales_Lead_Source'
      '')
    Left = 456
    Top = 159
  end
  object Acc201Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '                   Location_Plan_Document   text(200)   NULL'
      '')
    Left = 560
    Top = 159
  end
  object Acc201Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.1')
    Left = 608
    Top = 159
  end
  object Acc202Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Document_Structure'
      '('
      #9'ID            AUTOINCREMENT NOT NULL,'
      #9'Module_ID     int   NOT NULL,'
      #9'Folder_Name   text(50)  NOT NULL,'
      #9'Creation_Date datetime NOT NULL,'
      '  PRIMARY KEY (ID)'
      ')'
      '')
    Left = 680
    Top = 159
  end
  object Acc202Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.2')
    Left = 720
    Top = 159
  end
  object Acc203Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Vat ALTER COLUMN '
      '     Vat_Code text(2)     NULL'
      '')
    Left = 776
    Top = 159
  end
  object Acc203Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.3')
    Left = 824
    Top = 159
  end
  object sql203Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Vat ALTER COLUMN '
      '     Vat_Code    nvarchar(2)     NULL'
      '')
    Left = 792
    Top = 191
  end
  object sql203Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.3')
    Left = 840
    Top = 191
  end
  object Acc204Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Vat ADD'
      '     Reverse_Charge_VAT_Rate  float     NULL'
      '')
    Left = 888
    Top = 159
  end
  object Acc204Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.4')
    Left = 1032
    Top = 159
  end
  object sql204Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Vat ADD'
      '     Reverse_Charge_VAT_Rate  float     NULL'
      '')
    Left = 904
    Top = 191
  end
  object sql204Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.4')
    Left = 1048
    Top = 191
  end
  object Acc204Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote ADD'
      '     Site_Contact  text(30)     NULL'
      '')
    Left = 936
    Top = 159
  end
  object Acc204Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote ADD'
      '     Site_Phone  text(30)     NULL'
      '')
    Left = 984
    Top = 159
  end
  object sql204Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote ADD'
      '     Site_Contact  nvarchar(30)     NULL'
      '')
    Left = 952
    Top = 191
  end
  object sql204Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote ADD'
      '     Site_Phone  nvarchar(30)     NULL'
      '')
    Left = 1000
    Top = 191
  end
  object Acc205Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '     Contract_Drawing_Folder_Name     text(50)  NULL'
      '')
    Left = 1096
    Top = 159
  end
  object Acc205Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.5')
    Left = 1152
    Top = 159
  end
  object sql205Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '     Contract_Drawing_Folder_Name     nvarchar(50)  NULL'
      '')
    Left = 1112
    Top = 191
  end
  object sql205Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.5')
    Left = 1168
    Top = 191
  end
  object Acc206Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '     Collection_Only     text(1)  NULL'
      '')
    Left = 1208
    Top = 159
  end
  object Acc206Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.6')
    Left = 1256
    Top = 159
  end
  object sql206Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '     Collection_Only    nvarchar(1)  NULL'
      '')
    Left = 1224
    Top = 191
  end
  object sql206Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.6')
    Left = 1272
    Top = 191
  end
  object Acc207Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Schedule_Package'
      'VALUES ('#39'Moraware'#39','#39'Moraware Systemize'#39')')
    Left = 1320
    Top = 159
  end
  object Acc207Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.7')
    Left = 1384
    Top = 159
  end
  object sql207Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Schedule_Package'
      'VALUES ('#39'Moraware'#39','#39'Moraware Systemize'#39')')
    Left = 1336
    Top = 191
  end
  object sql207Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.7')
    Left = 1400
    Top = 191
  end
  object Acc208Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '      Installation_Address  int     NULL')
    Left = 16
    Top = 247
  end
  object Acc208Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Address ADD'
      '      Installation_Address  text(1)     NULL')
    Left = 128
    Top = 247
  end
  object Acc208Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.8')
    Left = 336
    Top = 247
  end
  object sql208Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '      Installation_Address  int     NULL')
    Left = 16
    Top = 287
  end
  object sql208Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Address ADD'
      '      Installation_Address  nvarchar(1)     NULL')
    Left = 120
    Top = 279
  end
  object sql208Q8: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.8')
    Left = 360
    Top = 279
  end
  object Acc208Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE Sales_Order ADD CONSTRAINT FK_SOrder_InstallationAdd' +
        'ress'
      '     FOREIGN KEY (Installation_Address)'
      '     REFERENCES Address ')
    Left = 72
    Top = 247
  end
  object sql208Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE Sales_Order ADD CONSTRAINT FK_SOrder_InstallationAdd' +
        'ress'
      '     FOREIGN KEY (Installation_Address)'
      '     REFERENCES Address ')
    Left = 72
    Top = 279
  end
  object Acc208Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Address ALTER COLUMN'
      '      Address_Name  text(50)     NULL')
    Left = 176
    Top = 247
  end
  object sql208Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Address ALTER COLUMN'
      '      Address_Name  nvarchar(50)     NULL')
    Left = 168
    Top = 279
  end
  object Acc208Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Quote ADD'
      '      Installation_Address  int     NULL')
    Left = 232
    Top = 247
  end
  object Acc208Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Quote ADD CONSTRAINT FK_Quote_InstallationAddress'
      '     FOREIGN KEY (Installation_Address)'
      '     REFERENCES Address ')
    Left = 288
    Top = 247
  end
  object sql208Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Quote ADD'
      '      Installation_Address  int     NULL')
    Left = 216
    Top = 279
  end
  object sql208Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Quote ADD CONSTRAINT FK_Quote_InstallationAddress'
      '     FOREIGN KEY (Installation_Address)'
      '     REFERENCES Address ')
    Left = 264
    Top = 279
  end
  object sql208Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE dbo.Address DROP CONSTRAINT SSMA_CC$Address$Address_' +
        'Name$disallow_zero_length')
    Left = 312
    Top = 279
  end
  object Acc209Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Quote_Element ADD'
      '    Element_Description   text(50)  NULL'
      '')
    Left = 424
    Top = 247
  end
  object Acc209Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Element ADD'
      '    Element_Description   text(50)  NULL')
    Left = 480
    Top = 247
  end
  object sql209Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Quote_Element ADD'
      '    Element_Description   nvarchar(50)  NULL')
    Left = 432
    Top = 279
  end
  object sql209Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Element ADD'
      '    Element_Description   nvarchar(50)  NULL')
    Left = 488
    Top = 279
  end
  object Acc209Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.9')
    Left = 536
    Top = 247
  end
  object sql209Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.9')
    Left = 544
    Top = 279
  end
  object sql2010Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Material_Use ADD'
      '    Use_Type   int    NULL')
    Left = 632
    Top = 279
  end
  object sql2010Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.10')
    Left = 760
    Top = 279
  end
  object Acc2010Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Material_Use ADD'
      '    Use_Type   int  NULL')
    Left = 624
    Top = 247
  end
  object Acc2010Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 20.10')
    Left = 752
    Top = 247
  end
  object Acc2010Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Material_Use'
      'SET Use_Type = 2')
    Left = 688
    Top = 247
  end
  object sql2010Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Material_Use'
      'SET Use_Type = 2')
    Left = 696
    Top = 279
  end
  object Acc210Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '    Contract_Inactive_reason   int  NULL')
    Left = 808
    Top = 247
  end
  object Acc210Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.0')
    Left = 920
    Top = 247
  end
  object sql210Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '    Contract_Inactive_reason   int   NULL')
    Left = 816
    Top = 279
  end
  object sql210Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.0')
    Left = 928
    Top = 279
  end
  object Acc210Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD CONSTRAINT FK_Company_Inactive'
      'FOREIGN KEY (Contract_Inactive_reason)'
      'REFERENCES Inactive_Reason')
    Left = 864
    Top = 247
  end
  object sql210Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD CONSTRAINT FK_Company_Inactive'
      'FOREIGN KEY (Contract_Inactive_reason)'
      'REFERENCES Inactive_Reason')
    Left = 872
    Top = 279
  end
  object Acc211Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '    Template_Docs_Returned   text(1)  NULL')
    Left = 976
    Top = 247
  end
  object Acc211Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '    Fitting_Docs_Returned   text(1)  NULL')
    Left = 1032
    Top = 247
  end
  object Acc211Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.1')
    Left = 1088
    Top = 247
  end
  object sql211Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '    Template_Docs_Returned   nvarchar(1)  NULL')
    Left = 984
    Top = 279
  end
  object sql211Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '    Fitting_Docs_Returned   nvarchar(1)  NULL')
    Left = 1040
    Top = 279
  end
  object sql211Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.1')
    Left = 1096
    Top = 279
  end
  object Acc212Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Material_Type ADD'
      '    Warranty_Description   int NULL')
    Left = 1152
    Top = 247
  end
  object Acc212Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Material_Type ADD'
      '    Maintenance_Description   int  NULL')
    Left = 1208
    Top = 247
  end
  object Acc212Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.2')
    Left = 1256
    Top = 247
  end
  object sql212Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Material_Type ADD'
      '    Warranty_Description   int  NULL')
    Left = 1160
    Top = 279
  end
  object sql212Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Material_Type ADD'
      '    Maintenance_Description   int  NULL')
    Left = 1216
    Top = 279
  end
  object sql212Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.2')
    Left = 1264
    Top = 279
  end
  object sql213Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD '
      #9'Use_Revenue_Centres'#9#9'nvarchar(1)'#9#9'NULL')
    Left = 8
    Top = 375
  end
  object sql213Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Revenue_Centre'
      '('
      
        #9'Revenue_Centre'#9'INT           NOT NULL    IDENTITY    PRIMARY KE' +
        'Y,'
      #9'Revenue_Centre_Descr nvarchar(50) NULL,'
      #9'Inactive nvarchar(1) NULL,'
      #9'Color int NULL,'
      #9'Font_Color int NULL,'
      #9'Logo_Path nvarchar(300) NULL,'
      #9'Logo_Image image NULL,'
      #9'Invoice_Payment_Notes int NULL,'
      #9'Registered_Address nvarchar(500) NULL,'
      #9'VAT_Registration_No'#9'nvarchar(30)'#9'NULL,'
      #9'Accounts_Package nvarchar(20)'#9'NULL'
      ')')
    Left = 56
    Top = 375
  end
  object sql213Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Revenue_Centre ADD CONSTRAINT FK_RC_Accounts_Package'
      #9'FOREIGN KEY (Accounts_Package)'
      #9'REFERENCES Accounts_Package')
    Left = 104
    Top = 375
  end
  object sql213Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Operator ADD'
      #9'Revenue_Centre'#9#9'int'#9#9'NULL')
    Left = 152
    Top = 375
  end
  object sql213Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Quote ADD'
      #9'Revenue_Centre'#9#9'int'#9#9'NULL')
    Left = 200
    Top = 375
  end
  object sql213Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote ADD'
      #9'Revenue_Centre'#9#9'int'#9#9'NULL')
    Left = 248
    Top = 375
  end
  object sql213Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      #9'Revenue_Centre'#9#9'int'#9#9'NULL')
    Left = 296
    Top = 375
  end
  object sql213Q8: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Invoice ADD'
      #9'Revenue_Centre'#9#9'int'#9#9'NULL')
    Left = 344
    Top = 375
  end
  object sql213Q9: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Quote ADD CONSTRAINT FK_Quote_Revenue_Centre'
      #9'FOREIGN KEY (Revenue_Centre)'
      #9'REFERENCES Revenue_Centre')
    Left = 392
    Top = 375
  end
  object sql213Q10: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote ADD CONSTRAINT FK_CQ_Revenue_Centre'
      #9'FOREIGN KEY (Revenue_Centre)'
      #9'REFERENCES Revenue_Centre')
    Left = 440
    Top = 375
  end
  object sql213Q11: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD CONSTRAINT FK_SOrder_Revenue_Centre'
      #9'FOREIGN KEY (Revenue_Centre)'
      #9'REFERENCES Revenue_Centre')
    Left = 488
    Top = 375
  end
  object sql213Q12: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE Sales_Invoice ADD CONSTRAINT FK_SInvoice_Revenue_Cen' +
        'tre'
      #9'FOREIGN KEY (Revenue_Centre)'
      #9'REFERENCES Revenue_Centre')
    Left = 536
    Top = 375
  end
  object sql213Q13: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Remedial_Type'
      '('
      
        #9'Remedial_Type'#9#9'INT           NOT NULL    IDENTITY    PRIMARY KE' +
        'Y,'
      #9'Remedial_Type_Descr nvarchar(50) NOT NULL,'
      #9'inactive nvarchar(1) NULL'
      ''
      ')')
    Left = 584
    Top = 375
  end
  object sql213Q14: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Remedial_Category'
      '('
      
        #9'Remedial_Category'#9'INT           NOT NULL    IDENTITY    PRIMARY' +
        ' KEY,'
      #9'Remedial_Category_Descr nvarchar(50) NOT NULL,'
      #9'inactive nvarchar(1) NULL'
      ''
      ')')
    Left = 632
    Top = 375
  end
  object sql213Q15: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Remedial_Dept'
      '('
      
        #9'Remedial_Dept INT           NOT NULL    IDENTITY    PRIMARY KEY' +
        ','
      #9'Remedial_Dept_Descr nvarchar(50) NOT NULL,'
      #9'inactive nvarchar(1) NULL'
      ')')
    Left = 680
    Top = 375
  end
  object sql213Q16: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Remedial '#9'ADD'
      #9'Items_To_Return_To_Site'#9#9'nvarchar(255)'#9#9'NULL')
    Left = 728
    Top = 375
  end
  object sql213Q17: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Items_Still_on_Site'#9#9'nvarchar(255)'#9#9'NULL')
    Left = 776
    Top = 375
  end
  object sql213Q18: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Tools_Required'#9#9'nvarchar(255)'#9#9'NULL')
    Left = 824
    Top = 375
  end
  object sql213Q19: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Site_Requirements'#9#9'nvarchar(255)'#9#9'NULL')
    Left = 872
    Top = 375
  end
  object sql213Q20: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Additional_Notes'#9#9'int'#9#9'NULL')
    Left = 920
    Top = 375
  end
  object sql213Q21: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Manufacturing_Notes'#9#9'int'#9#9'NULL')
    Left = 968
    Top = 375
  end
  object sql213Q22: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Remedial_Type'#9#9'int'#9#9'NULL')
    Left = 1016
    Top = 375
  end
  object sql213Q23: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Remedial_Dept'#9#9'int'#9#9'NULL')
    Left = 1064
    Top = 375
  end
  object sql213Q24: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Remedial_Category'#9#9'int'#9#9'NULL')
    Left = 1112
    Top = 375
  end
  object sql213Q25: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Original_Templater'#9'int'#9#9'NULL')
    Left = 1160
    Top = 375
  end
  object sql213Q26: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Original_Fitter'#9'int'#9#9'NULL')
    Left = 1208
    Top = 375
  end
  object sql213Q27: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD CONSTRAINT FK_JR_Remedial_Type'
      #9'FOREIGN KEY (Remedial_Type)'
      #9'REFERENCES Remedial_Type')
    Left = 1256
    Top = 375
  end
  object sql213Q28: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Remedial'#9'  ADD CONSTRAINT FK_JR_Remedial_Dept'
      #9'FOREIGN KEY (Remedial_Dept)'
      #9'REFERENCES Remedial_Dept')
    Left = 1304
    Top = 375
  end
  object sql213Q29: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD CONSTRAINT FK_JR_Remedial_Category'
      #9'FOREIGN KEY (Remedial_Category)'
      #9'REFERENCES Remedial_Category')
    Left = 1352
    Top = 375
  end
  object sql213Q30: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD Constraint FK_JR_OrigTemplater'
      #9'FOREIGN KEY (Original_Templater)'
      #9'REFERENCES Fitter')
    Left = 1400
    Top = 375
  end
  object sql213Q31: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Remedial'#9'   ADD Constraint FK_JR_OrigFitter'
      #9'FOREIGN KEY (Original_Fitter)'
      #9'REFERENCES Fitter')
    Left = 1448
    Top = 375
  end
  object sql213Q32: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.3')
    Left = 1496
    Top = 375
  end
  object Acc213Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD '
      #9'Use_Revenue_Centres'#9#9'text(1)'#9#9'NULL')
    Left = 8
    Top = 343
  end
  object Acc213Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Revenue_Centre'
      '('
      #9'Revenue_Centre'#9'AUTOINCREMENT NOT NULL,'
      #9'Revenue_Centre_Descr text(50) NULL,'
      #9'Inactive text(1) NULL,'
      #9'Color int NULL,'
      #9'Font_Color int NULL,'
      #9'Logo_Path text(255) NULL,'
      #9'Logo_Image image NULL,'
      #9'Invoice_Payment_Notes int NULL,'
      #9'Registered_Address text(255) NULL,'
      #9'VAT_Registration_No'#9'text(30)'#9'NULL,'
      #9'Accounts_Package text(20)'#9'NULL,'
      'PRIMARY KEY (Revenue_Centre)'
      ')')
    Left = 56
    Top = 343
  end
  object Acc213Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Revenue_Centre ADD CONSTRAINT FK_RC_Accounts_Package'
      #9'FOREIGN KEY (Accounts_Package)'
      #9'REFERENCES Accounts_Package')
    Left = 104
    Top = 343
  end
  object Acc213Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Operator ADD'
      #9'Revenue_Centre'#9#9'int'#9#9'NULL')
    Left = 152
    Top = 343
  end
  object Acc213Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Quote ADD'
      #9'Revenue_Centre'#9#9'int'#9#9'NULL')
    Left = 200
    Top = 343
  end
  object Acc213Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote ADD'
      #9'Revenue_Centre'#9#9'int'#9#9'NULL')
    Left = 248
    Top = 343
  end
  object Acc213Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      #9'Revenue_Centre'#9#9'int'#9#9'NULL')
    Left = 296
    Top = 343
  end
  object Acc213Q8: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Invoice ADD'
      #9'Revenue_Centre'#9#9'int'#9#9'NULL')
    Left = 344
    Top = 343
  end
  object Acc213Q9: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Quote ADD CONSTRAINT FK_Quote_Revenue_Centre'
      #9'FOREIGN KEY (Revenue_Centre)'
      #9'REFERENCES Revenue_Centre')
    Left = 392
    Top = 343
  end
  object Acc213Q10: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote ADD CONSTRAINT FK_CQ_Revenue_Centre'
      #9'FOREIGN KEY (Revenue_Centre)'
      #9'REFERENCES Revenue_Centre')
    Left = 440
    Top = 343
  end
  object Acc213Q11: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD CONSTRAINT FK_SOrder_Revenue_Centre'
      #9'FOREIGN KEY (Revenue_Centre)'
      #9'REFERENCES Revenue_Centre')
    Left = 488
    Top = 343
  end
  object Acc213Q12: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE Sales_Invoice ADD CONSTRAINT FK_SInvoice_Revenue_Cen' +
        'tre'
      #9'FOREIGN KEY (Revenue_Centre)'
      #9'REFERENCES Revenue_Centre')
    Left = 536
    Top = 343
  end
  object Acc213Q13: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Remedial_Type'
      '('
      #9'Remedial_Type'#9'AUTOINCREMENT NOT NULL,'
      #9'Remedial_Type_Descr text(50) NOT NULL,'
      #9'inactive text(1) NULL,'
      'PRIMARY KEY (Remedial_Type)'
      ''
      ')')
    Left = 584
    Top = 343
  end
  object Acc213Q14: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Remedial_Category'
      '('
      #9'Remedial_Category'#9#9'AUTOINCREMENT NOT NULL,'
      #9'Remedial_Category_Descr text(50) NOT NULL,'
      #9'inactive text(1) NULL,'
      'PRIMARY KEY (Remedial_Category)'
      ''
      ')')
    Left = 632
    Top = 343
  end
  object Acc213Q15: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Remedial_Dept'
      '('
      #9'Remedial_Dept'#9'AUTOINCREMENT NOT NULL,'
      #9'Remedial_Dept_Descr text(50) NOT NULL,'
      #9'inactive text(1) NULL,'
      'PRIMARY KEY (Remedial_Dept)'
      ')')
    Left = 680
    Top = 343
  end
  object Acc213Q16: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Remedial '#9'ADD'
      #9'Items_To_Return_To_Site'#9#9'text(255)'#9#9'NULL')
    Left = 728
    Top = 343
  end
  object Acc213Q17: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Items_Still_on_Site'#9#9'text(255)'#9#9'NULL')
    Left = 776
    Top = 343
  end
  object Acc213Q18: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Tools_Required'#9#9'text(255)'#9#9'NULL')
    Left = 824
    Top = 343
  end
  object Acc213Q19: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Site_Requirements'#9#9'text(255)'#9#9'NULL')
    Left = 872
    Top = 343
  end
  object Acc213Q20: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Additional_Notes'#9#9'int'#9#9'NULL')
    Left = 920
    Top = 343
  end
  object Acc213Q21: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Manufacturing_Notes'#9#9'int'#9#9'NULL')
    Left = 968
    Top = 343
  end
  object Acc213Q22: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Remedial_Type'#9#9'int'#9#9'NULL')
    Left = 1016
    Top = 343
  end
  object Acc213Q23: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Remedial_Dept'#9#9'int'#9#9'NULL')
    Left = 1064
    Top = 343
  end
  object Acc213Q24: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Remedial_Category'#9#9'int'#9#9'NULL')
    Left = 1112
    Top = 343
  end
  object Acc213Q25: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Original_Templater'#9'int'#9#9'NULL')
    Left = 1160
    Top = 343
  end
  object Acc213Q26: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Original_Fitter'#9'int'#9#9'NULL')
    Left = 1208
    Top = 343
  end
  object Acc213Q27: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD CONSTRAINT FK_JR_Remedial_Type'
      #9'FOREIGN KEY (Remedial_Type)'
      #9'REFERENCES Remedial_Type')
    Left = 1256
    Top = 343
  end
  object Acc213Q28: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Remedial'#9'  ADD CONSTRAINT FK_JR_Remedial_Dept'
      #9'FOREIGN KEY (Remedial_Dept)'
      #9'REFERENCES Remedial_Dept')
    Left = 1304
    Top = 343
  end
  object Acc213Q29: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD CONSTRAINT FK_JR_Remedial_Category'
      #9'FOREIGN KEY (Remedial_Category)'
      #9'REFERENCES Remedial_Category')
    Left = 1352
    Top = 343
  end
  object Acc213Q30: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD Constraint FK_JR_OrigTemplater'
      #9'FOREIGN KEY (Original_Templater)'
      #9'REFERENCES Fitter')
    Left = 1400
    Top = 343
  end
  object Acc213Q31: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Remedial'#9'   ADD Constraint FK_JR_OrigFitter'
      #9'FOREIGN KEY (Original_Fitter)'
      #9'REFERENCES Fitter')
    Left = 1448
    Top = 343
  end
  object Acc213Q32: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.3')
    Left = 1496
    Top = 343
  end
  object Acc214Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Remedial'
      '('
      #9'ID'#9'AUTOINCREMENT NOT NULL,'
      #9'Date_Raised datetime NOT NULL,'
      #9'Operator   int NOT NULL,'
      #9'Sales_Order int NULL,'
      '                Remedial_Type  int  NULL,'
      '                Remedial_Dept   int  NULL,'
      '                Remedial_Category  int  NULL,'
      #9'Job int NULL,'
      #9'Remedial_Number  int NULL,'
      'PRIMARY KEY (ID)'
      ')')
    Left = 8
    Top = 431
  end
  object sql214Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Remedial'
      '('
      #9'ID'#9'INT           NOT NULL    IDENTITY    PRIMARY KEY,'
      #9'Date_Raised datetime NOT NULL,'
      #9'Operator   int NOT NULL,'
      #9'Sales_Order int NULL,'
      '  Remedial_Type  int  NULL,'
      '  Remedial_Dept   int  NULL,'
      '  Remedial_Category  int  NULL,'
      #9'Job int NULL,'
      #9'Remedial_Number  int NULL'
      ')')
    Left = 8
    Top = 479
  end
  object Acc214Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Remedial'#9'ADD CONSTRAINT FK_Remedial_Remedial_Type'
      #9'FOREIGN KEY (Remedial_Type)'
      #9'REFERENCES Remedial_Type')
    Left = 56
    Top = 431
  end
  object Acc214Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Remedial'#9'  ADD CONSTRAINT FK_Remedial_Remedial_Dept'
      #9'FOREIGN KEY (Remedial_Dept)'
      #9'REFERENCES Remedial_Dept')
    Left = 104
    Top = 431
  end
  object Acc214Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE  Remedial'#9'ADD CONSTRAINT FK_Remedial_Remedial_Catego' +
        'ry'
      #9'FOREIGN KEY (Remedial_Category)'
      #9'REFERENCES Remedial_Category')
    Left = 152
    Top = 431
  end
  object sql214Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Remedial'#9'ADD CONSTRAINT FK_Remedial_Remedial_Type'
      #9'FOREIGN KEY (Remedial_Type)'
      #9'REFERENCES Remedial_Type')
    Left = 56
    Top = 479
  end
  object sql214Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Remedial'#9'  ADD CONSTRAINT FK_Remedial_Remedial_Dept'
      #9'FOREIGN KEY (Remedial_Dept)'
      #9'REFERENCES Remedial_Dept')
    Left = 104
    Top = 479
  end
  object sql214Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE  Remedial'#9'ADD CONSTRAINT FK_Remedial_Remedial_Catego' +
        'ry'
      #9'FOREIGN KEY (Remedial_Category)'
      #9'REFERENCES Remedial_Category')
    Left = 152
    Top = 479
  end
  object Acc214Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.4')
    Left = 304
    Top = 431
  end
  object sql214Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.4')
    Left = 304
    Top = 479
  end
  object Acc214Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Remedial'#9'  int'#9#9'NULL')
    Left = 200
    Top = 431
  end
  object sql214Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD'
      #9'Remedial   '#9'int'#9#9'NULL')
    Left = 200
    Top = 479
  end
  object Acc214Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD CONSTRAINT FK_JR_Remedial'
      #9'FOREIGN KEY (Remedial)'
      #9'REFERENCES Remedial')
    Left = 248
    Top = 431
  end
  object sql214Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE  Job_Remedial'#9'ADD CONSTRAINT FK_JR_Remedial'
      #9'FOREIGN KEY (Remedial)'
      #9'REFERENCES Remedial')
    Left = 248
    Top = 479
  end
  object Acc215Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Revenue_Centre ADD'
      '  Company_Reg_Number  text(30)  NULL')
    Left = 376
    Top = 431
  end
  object Acc215Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Revenue_Centre ADD'
      '  Telephone_Number  text(50)  NULL')
    Left = 432
    Top = 431
  end
  object Acc215Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Revenue_Centre ADD'
      '  Email_Address  text(50)  NULL')
    Left = 488
    Top = 431
  end
  object Acc215Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Revenue_Centre ADD'
      '  Retail_Payment_Notes   int   NULL')
    Left = 544
    Top = 431
  end
  object Acc215Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.5')
    Left = 600
    Top = 431
  end
  object sql215Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Revenue_Centre ADD'
      '  Company_Reg_Number  nvarchar(30)  NULL')
    Left = 376
    Top = 479
  end
  object sql215Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Revenue_Centre ADD'
      '  Telephone_Number  nvarchar(50)  NULL')
    Left = 432
    Top = 479
  end
  object sql215Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Revenue_Centre ADD'
      '  Email_Address  nvarchar(50)  NULL')
    Left = 488
    Top = 479
  end
  object sql215Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Revenue_Centre ADD'
      '  Retail_Payment_Notes   int   NULL')
    Left = 544
    Top = 479
  end
  object sql215Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.5')
    Left = 600
    Top = 479
  end
  object sql216Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '  Remedial_Production    nvarchar(1)   NULL')
    Left = 672
    Top = 479
  end
  object sql216Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '  Sales_Order_Number    float   NULL')
    Left = 784
    Top = 479
  end
  object sql216Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '  Original_Sales_Order   int   NULL')
    Left = 840
    Top = 479
  end
  object sql216Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '  Remedial_ID   int   NULL')
    Left = 896
    Top = 479
  end
  object sql216Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '  Def_Remedial_Product_Code   int   NULL')
    Left = 952
    Top = 479
  end
  object sql216Q10: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.6')
    Left = 1184
    Top = 479
  end
  object sql216Q8: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO AppointmentType'
      'VALUES (5, '#39'Remedial - Production'#39',9,NULL)')
    Left = 1064
    Top = 479
  end
  object sql216Q9: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO AppointmentType'
      'VALUES (6, '#39'Remedial - No Production'#39', 4, NULL)')
    Left = 1120
    Top = 479
  end
  object sql216Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '  Remedial_No_Production    nvarchar(1)   NULL')
    Left = 728
    Top = 479
  end
  object sql216Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Remedial ADD'
      '  Production_Required   nvarchar(1)   NULL')
    Left = 1008
    Top = 479
  end
  object Acc216Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '  Remedial_Production    text(1)   NULL')
    Left = 672
    Top = 431
  end
  object Acc216Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '  Sales_Order_Number    float   NULL')
    Left = 784
    Top = 431
  end
  object Acc216Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '  Original_Sales_Order   int   NULL')
    Left = 840
    Top = 431
  end
  object Acc216Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '  Remedial_ID   int   NULL')
    Left = 896
    Top = 431
  end
  object Acc216Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '  Def_Remedial_Product_Code   int   NULL')
    Left = 952
    Top = 431
  end
  object Acc216Q10: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.6')
    Left = 1184
    Top = 431
  end
  object Acc216Q8: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO AppointmentType'
      'VALUES (5, '#39'Remedial - Production'#39',9,NULL)')
    Left = 1064
    Top = 431
  end
  object Acc216Q9: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO AppointmentType'
      'VALUES (6, '#39'Remedial - No Production'#39', 4, NULL)')
    Left = 1120
    Top = 431
  end
  object Acc216Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '  Remedial_No_Production    text(1)   NULL')
    Left = 728
    Top = 431
  end
  object Acc216Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Remedial ADD'
      '  Production_Required   text(1)   NULL')
    Left = 1008
    Top = 431
  end
  object Acc217Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_Order'
      'SET    Original_sales_order = Sales_Order,'
      '       Sales_order_number = sales_order')
    Left = 1256
    Top = 431
  end
  object Acc217Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.7')
    Left = 1312
    Top = 431
  end
  object sql217Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_Order'
      'SET    Original_sales_order = Sales_Order,'
      '       Sales_order_number = sales_order')
    Left = 1256
    Top = 479
  end
  object sql217Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.7')
    Left = 1312
    Top = 479
  end
  object Acc218Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Remedial ADD '
      '     Customer    int    NULL')
    Left = 8
    Top = 535
  end
  object Acc218Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Remedial ADD CONSTRAINT FK_JR_Customer'
      '     FOREIGN KEY (Customer)'
      '     REFERENCES Customer')
    Left = 64
    Top = 535
  end
  object Acc218Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD '
      '     Inv_Customer    int    NULL')
    Left = 120
    Top = 535
  end
  object Acc218Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD CONSTRAINT FK_SO_Invoice_Customer'
      '     FOREIGN KEY (Inv_Customer)'
      '     REFERENCES Customer')
    Left = 176
    Top = 535
  end
  object Acc218Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Branch ADD'
      '       Address int    NULL')
    Left = 232
    Top = 535
  end
  object Acc218Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Branch ADD CONSTRAINT FK_CB_Address'
      '     FOREIGN KEY (Address)'
      '     REFERENCES Address')
    Left = 288
    Top = 535
  end
  object sql218Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Remedial ADD '
      '     Customer    int    NULL')
    Left = 8
    Top = 583
  end
  object sql218Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Remedial ADD CONSTRAINT FK_JR_Customer'
      '     FOREIGN KEY (Customer)'
      '     REFERENCES Customer')
    Left = 64
    Top = 583
  end
  object sql218Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD '
      '     Inv_Customer    int    NULL')
    Left = 120
    Top = 583
  end
  object sql218Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD CONSTRAINT FK_SO_Invoice_Customer'
      '     FOREIGN KEY (Inv_Customer)'
      '     REFERENCES Customer')
    Left = 176
    Top = 583
  end
  object sql218Q13: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.8')
    Left = 680
    Top = 583
  end
  object sql218Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Branch ADD'
      '       Address int    NULL')
    Left = 232
    Top = 583
  end
  object sql218Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Branch ADD CONSTRAINT FK_CB_Address'
      '     FOREIGN KEY (Address)'
      '     REFERENCES Address')
    Left = 288
    Top = 583
  end
  object sql218Q8: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote ADD CONSTRAINT FK_CQ_CustomerBranch'
      '     FOREIGN KEY (Customer, Branch_no)'
      '     REFERENCES Customer_Branch')
    Left = 400
    Top = 583
  end
  object sql218Q10: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD CONSTRAINT FK_SO_CustomerBranch'
      '     FOREIGN KEY (Customer, Branch_no)'
      '     REFERENCES Customer_Branch')
    Left = 512
    Top = 583
  end
  object sql218Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote ADD'
      '       Branch_no  int    NULL')
    Left = 344
    Top = 583
  end
  object sql218Q9: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '       Branch_no int    NULL')
    Left = 456
    Top = 583
  end
  object Acc218Q13: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.8')
    Left = 680
    Top = 535
  end
  object Acc218Q8: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Top 1 Contract_Quote'
      'FROM Contract_Quote')
    Left = 400
    Top = 535
  end
  object Acc218Q10: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Top 1 sales_Order'
      'FROM Sales_Order')
    Left = 512
    Top = 535
  end
  object Acc218Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Contract_Quote ADD'
      '       Branch_no  int    NULL')
    Left = 344
    Top = 535
  end
  object Acc218Q9: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '       Branch_no int    NULL')
    Left = 456
    Top = 535
  end
  object Acc218Q11: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '    Do_not_invoice    text(1)   NULL')
    Left = 568
    Top = 535
  end
  object sql218Q11: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Order ADD'
      '    Do_not_invoice    nvarchar(1)   NULL')
    Left = 568
    Top = 583
  end
  object Acc218Q12: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Job_Remedial'
      'SET Original_Fitter = Fitter')
    Left = 624
    Top = 535
  end
  object sql218Q12: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Job_Remedial'
      'SET Original_Fitter = Fitter')
    Left = 624
    Top = 583
  end
  object Acc219Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Invoice ADD'
      '    Branch_No   int NULL')
    Left = 744
    Top = 535
  end
  object Acc219Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1 Sales_invoice'
      'FROM Sales_Invoice')
    Left = 792
    Top = 535
  end
  object Acc219Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Invoice  ADD '
      '     Application_Reference    text(15)    NULL')
    Left = 848
    Top = 535
  end
  object Acc219Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Invoice  ADD '
      '     Application_Date    datetime    NULL')
    Left = 896
    Top = 535
  end
  object Acc219Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Invoice  ADD '
      '     Application_Date_From    datetime    NULL')
    Left = 944
    Top = 535
  end
  object Acc219Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Invoice  ADD '
      '     Application_Date_To    datetime    NULL')
    Left = 992
    Top = 535
  end
  object Acc219Q12: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.9')
    Left = 1296
    Top = 535
  end
  object sql219Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Invoice  ADD CONSTRAINT FK_SI_Customer_Branch'
      '     FOREIGN KEY (Customer, Branch_No) '
      '     REFERENCES Customer_Branch')
    Left = 792
    Top = 583
  end
  object sql219Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Invoice  ADD '
      '     Application_Reference    nvarchar(15)    NULL')
    Left = 848
    Top = 583
  end
  object sql219Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Invoice  ADD '
      '     Application_Date    datetime    NULL')
    Left = 896
    Top = 583
  end
  object sql219Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Invoice  ADD '
      '     Application_Date_From    datetime    NULL')
    Left = 944
    Top = 583
  end
  object sql219Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Invoice  ADD '
      '     Application_Date_To    datetime    NULL')
    Left = 992
    Top = 583
  end
  object sql219Q12: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 21.9')
    Left = 1296
    Top = 583
  end
  object Acc219Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Remedial  ADD '
      '     Office_Notes    int   NULL')
    Left = 1040
    Top = 535
  end
  object sql219Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Job_Remedial  ADD '
      '     Office_Notes    int   NULL')
    Left = 1040
    Top = 583
  end
  object sql219Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Invoice ADD'
      '    Branch_No   int NULL')
    Left = 744
    Top = 584
  end
  object Acc219Q8: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer  ADD '
      '     Last_Application_Ref    text(15)    NULL')
    Left = 1088
    Top = 535
  end
  object sql219Q8: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer  ADD '
      '     Last_Application_Ref    nvarchar(15)    NULL')
    Left = 1088
    Top = 583
  end
  object Acc219Q9: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Branch  ADD '
      '     Special_Instructions    int    NULL')
    Left = 1136
    Top = 535
  end
  object sql219Q9: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Branch  ADD '
      '     Special_Instructions    int    NULL')
    Left = 1136
    Top = 583
  end
  object Acc219Q10: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Branch  ADD '
      '     Site_QS_Contact    int    NULL')
    Left = 1192
    Top = 535
  end
  object sql219Q10: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Branch  ADD '
      '     Site_QS_Contact    int    NULL')
    Left = 1192
    Top = 583
  end
  object Acc219Q11: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1 Customer'
      'FROM Customer_Branch')
    Left = 1240
    Top = 535
  end
  object sql219Q11: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Branch  ADD CONSTRAINT FK_CB_Contact_QS'
      '     FOREIGN KEY (Customer, Site_QS_Contact)'
      '     REFERENCES Customer_Contact')
    Left = 1240
    Top = 583
  end
  object sql220Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Branch ADD'
      '    Installation_Contact  int NULL')
    Left = 8
    Top = 680
  end
  object sql220Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Branch ADD CONSTRAINT FK_CB_Install_Contact'
      '   FOREIGN KEY (Customer, Installation_Contact)'
      '   REFERENCES Customer_Contact')
    Left = 64
    Top = 680
  end
  object sql220Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 22.0')
    Left = 120
    Top = 679
  end
  object Acc220Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer_Branch ADD'
      '    Installation_Contact  int NULL')
    Left = 8
    Top = 640
  end
  object Acc220Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1 Customer '
      'FROM Customer_Branch')
    Left = 64
    Top = 640
  end
  object Acc220Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 22.0')
    Left = 120
    Top = 639
  end
  object Acc221Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Invoice ADD'
      '    Application_Labour_Value money NULL')
    Left = 184
    Top = 640
  end
  object Acc221Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '      Template_Docs_Out    text(50)  NULL')
    Left = 232
    Top = 640
  end
  object Acc221Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '      Template_Docs_In    text(50)  NULL')
    Left = 288
    Top = 640
  end
  object Acc221Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '      Fitting_Docs_Out    text(50)  NULL')
    Left = 344
    Top = 640
  end
  object Acc221Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '      Fitting_Docs_In    text(50)  NULL')
    Left = 400
    Top = 640
  end
  object Acc221Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 22.1')
    Left = 456
    Top = 639
  end
  object sql221Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Sales_Invoice ADD'
      '    Application_Labour_Value money NULL')
    Left = 184
    Top = 680
  end
  object sql221Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '      Template_Docs_Out    nvarchar(50)  NULL')
    Left = 232
    Top = 680
  end
  object sql221Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '      Template_Docs_In    nvarchar(50)  NULL'
      '')
    Left = 288
    Top = 680
  end
  object sql221Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '      Fitting_Docs_Out   nvarchar(50)  NULL'
      '')
    Left = 344
    Top = 680
  end
  object sql221Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '      Fitting_Docs_In   nvarchar(50)  NULL'
      '')
    Left = 400
    Top = 680
  end
  object sql221Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 22.1')
    Left = 456
    Top = 679
  end
  object Acc222Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Schedule_Package'
      'VALUES ('#39'Outaware'#39', '#39'Outlook & Moraware'#39')')
    Left = 544
    Top = 640
  end
  object Acc222Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 22.2')
    Left = 600
    Top = 639
  end
  object sql222Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Schedule_Package'
      'VALUES ('#39'Outaware'#39', '#39'Outlook & Moraware'#39')')
    Left = 544
    Top = 680
  end
  object sql222Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 22.2')
    Left = 600
    Top = 679
  end
  object Acc223Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '          Use_Document_Transfer    text(1)       NULL')
    Left = 680
    Top = 640
  end
  object Acc223Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '          Quotation_Document_Folder   text(50)       NULL')
    Left = 728
    Top = 640
  end
  object Acc223Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '          Safety_Document_Folder  text(50)       NULL')
    Left = 784
    Top = 640
  end
  object Acc223Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '          Remedial_Document_Folder   text(50)       NULL')
    Left = 840
    Top = 640
  end
  object Acc223Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 22.3')
    Left = 952
    Top = 639
  end
  object sql223Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '          Use_Document_Transfer    nvarchar(1)       NULL')
    Left = 680
    Top = 680
  end
  object sql223Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '          Quotation_Document_Folder   nvarchar(50)       NULL')
    Left = 728
    Top = 680
  end
  object sql223Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '          Safety_Document_Folder   nvarchar(50)       NULL')
    Left = 784
    Top = 680
  end
  object sql223Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '          Remedial_Document_Folder   nvarchar(50)       NULL')
    Left = 840
    Top = 680
  end
  object sql223Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 22.3')
    Left = 952
    Top = 679
  end
  object Acc223Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '          Plan_Document_Folder   text(50)       NULL')
    Left = 896
    Top = 640
  end
  object sql223Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '          Plan_Document_Folder   nvarchar(50)       NULL')
    Left = 896
    Top = 680
  end
  object Acc224Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '          Use_Remedials_As_Orders    text(1)       NULL')
    Left = 1040
    Top = 640
  end
  object Acc224Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer ADD'
      '          End_User_Price_Factor    text(1)       NULL')
    Left = 1096
    Top = 640
  end
  object Acc224Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer ADD'
      '          Unit_Cost    currency      NULL')
    Left = 1152
    Top = 640
  end
  object sql224Q1: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Company ADD'
      '          Use_Remedials_As_Orders    nvarchar(1)       NULL')
    Left = 1040
    Top = 680
  end
  object sql224Q2: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer ADD'
      '          End_User_Price_Factor    nvarchar(1)       NULL')
    Left = 1096
    Top = 680
  end
  object sql224Q3: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'ALTER TABLE Customer ADD'
      '          Unit_Cost    money      NULL')
    Left = 1152
    Top = 680
  end
  object sql224Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Customer_Material_Type'
      '('
      #9'ID'#9#9'INT           NOT NULL    IDENTITY    PRIMARY KEY,'
      #9'Customer      int     NOT NULL,'
      #9'Material_type      int     NOT NULL,'
      #9'Retail_Multiplier        float     NULL,'
      '  inactive        nvarchar(1) NULL'
      ')'
      '')
    Left = 1208
    Top = 680
  end
  object sql224Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE Customer_Material_Type   ADD CONSTRAINT FK_CMT_Custo' +
        'mer'
      '     FOREIGN KEY (Customer)'
      '     REFERENCES Customer')
    Left = 1256
    Top = 680
  end
  object sql224Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 22.4')
    Left = 1368
    Top = 679
  end
  object sql224Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE Customer_Material_Type   ADD CONSTRAINT FK_CMT_MatTy' +
        'pe'
      '     FOREIGN KEY (Material_Type)'
      '     REFERENCES Material_Type')
    Left = 1312
    Top = 680
  end
  object Acc224Q4: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'CREATE TABLE Customer_Material_Type'
      '('
      #9'ID'#9#9'AUTOINCREMENT NOT NULL,'
      #9'Customer      int     NOT NULL,'
      #9'Material_type      int     NOT NULL,'
      #9'Retail_Multiplier        double     NULL,'
      '  inactive        text(1) NULL,'
      'PRIMARY KEY (ID)'
      ')'
      '')
    Left = 1208
    Top = 640
  end
  object Acc224Q5: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE Customer_Material_Type   ADD CONSTRAINT FK_CMT_Custo' +
        'mer'
      '     FOREIGN KEY (Customer)'
      '     REFERENCES Customer')
    Left = 1256
    Top = 640
  end
  object Acc224Q6: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      
        'ALTER TABLE Customer_Material_Type   ADD CONSTRAINT FK_CMT_MatTy' +
        'pe'
      '     FOREIGN KEY (Material_Type)'
      '     REFERENCES Material_Type')
    Left = 1312
    Top = 640
  end
  object Acc224Q7: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Company'
      'set Database_Version = 22.4')
    Left = 1368
    Top = 639
  end
end
