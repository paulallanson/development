object PBRSAccManPerformanceFrm: TPBRSAccManPerformanceFrm
  Left = 209
  Top = 64
  Caption = 'Account Manager Performance Report'
  ClientHeight = 444
  ClientWidth = 914
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object pnlFooter: TPanel
    Left = 0
    Top = 384
    Width = 914
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      914
      41)
    object btnClose: TButton
      Left = 820
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Close'
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnExcel: TBitBtn
      Left = 716
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Excel'
      Enabled = False
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00A407070700FF
        FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFFA407070700FF
        FFFFFFFFFFFF07FFFFFF00000000000707070707070707070707A407070700FF
        FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA407000700FF
        FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA400000700FF
        FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFF000000000000
        00000000000000000000A4070707000707070707070700070707A40707070007
        07000700070700070707A4070707000707000000070700070707A40707070007
        07000700070700070707A4A4A4A400A4A4A400A4A4A400A4A4A4}
      TabOrder = 1
      OnClick = btnExcelClick
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 914
    Height = 81
    Align = alTop
    TabOrder = 1
    object rgAccMan: TRadioGroup
      Left = 8
      Top = 8
      Width = 145
      Height = 65
      Caption = 'Selection'
      ItemIndex = 0
      Items.Strings = (
        'All Account Managers'
        'One Account Manager')
      TabOrder = 0
      OnClick = rgAccManClick
    end
    object pnlAccMan: TPanel
      Left = 158
      Top = 16
      Width = 329
      Height = 57
      TabOrder = 1
      Visible = False
      object lblCustBran: TLabel
        Left = 8
        Top = 8
        Width = 116
        Height = 13
        Caption = 'Account Manager Name'
      end
      object edtAccMan: TEdit
        Left = 8
        Top = 24
        Width = 257
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object btnAccMan: TButton
        Left = 288
        Top = 24
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnAccManClick
      end
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 81
    Width = 914
    Height = 303
    Align = alClient
    DataSource = dtsReport
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Operator_Name'
        Title.Caption = 'Account Manager'
        Width = 147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer_Name'
        Title.Caption = 'Customer'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Importance_description'
        Title.Caption = 'Category'
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Analysis_Code_1'
        Title.Caption = 'Analysis 1'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Analysis_Code_2'
        Title.Caption = 'Analysis 2'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Analysis_Code_3'
        Title.Caption = 'Analysis 3'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Analysis_Code_4'
        Title.Caption = 'Analysis 4'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Year0_TO'
        Title.Caption = 'Current Year GP'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Year1_TO'
        Title.Caption = 'Year 1'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Year2_TO'
        Title.Caption = 'Year 2'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Year3_TO'
        Title.Caption = 'Year 3'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Year4_TO'
        Title.Caption = 'Year 4'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Last_Visit_Date'
        Title.Caption = 'Visit Date'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Next_Contact_Date'
        Title.Caption = 'Next Contact Date'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Last_Order_Date'
        Title.Caption = 'Date of Last Order'
        Visible = True
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 425
    Width = 914
    Height = 19
    Panels = <>
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer_Operator.Operator,'
      '        Operator.Name as Operator_Name,'
      '        Customer_Operator.Customer,'
      '        Customer.Name as Customer_Name,'
      '        Level_of_Importance.Level_of_importance,'
      '        Level_of_Importance.Importance_description,'
      '        Level_of_Importance.Color as Importance_Color,'
      '        Level_of_Importance.Font_Color as Importance_Font_Color,'
      '        ISNULL((SELECT sum(Total_Sales_Value-Total_Cost_Value)'
      '         FROM Sales_Profit'
      
        '         WHERE ((Sales_Profit.Period >= :period0_Start) AND (Sal' +
        'es_Profit.Period <= :Period0_End)) AND'
      
        '                (Sales_Profit.Customer = Customer_Operator.Custo' +
        'mer)'
      '         Group by Sales_Profit.Customer),0) as Year0_TO,'
      '        ISNULL((SELECT sum(Total_Sales_Value-Total_Cost_Value)'
      '         FROM Sales_Profit'
      
        '         WHERE ((Sales_Profit.Period >= :period1_Start) AND (Sal' +
        'es_Profit.Period <= :Period1_End)) AND'
      
        '                (Sales_Profit.Customer = Customer_Operator.Custo' +
        'mer)'
      '         Group by Sales_Profit.Customer),0) as Year1_TO,'
      '        ISNULL((SELECT sum(Total_Sales_Value-Total_Cost_Value)'
      '         FROM Sales_Profit'
      
        '         WHERE ((Sales_Profit.Period >= :period2_Start) AND (Sal' +
        'es_Profit.Period <= :Period2_End)) AND'
      
        '                (Sales_Profit.Customer = Customer_Operator.Custo' +
        'mer)'
      '         Group by Sales_Profit.Customer),0) as Year2_TO,'
      '        ISNULL((SELECT sum(Total_Sales_Value-Total_Cost_Value)'
      '         FROM Sales_Profit'
      
        '         WHERE ((Sales_Profit.Period >= :period3_Start) AND (Sal' +
        'es_Profit.Period <= :Period3_End)) AND'
      
        '                (Sales_Profit.Customer = Customer_Operator.Custo' +
        'mer)'
      '         Group by Sales_Profit.Customer),0) as Year3_TO,'
      '        ISNULL((SELECT sum(Total_Sales_Value-Total_Cost_Value)'
      '         FROM Sales_Profit'
      
        '         WHERE ((Sales_Profit.Period >= :period4_Start) AND (Sal' +
        'es_Profit.Period <= :Period4_End)) AND'
      
        '                (Sales_Profit.Customer = Customer_Operator.Custo' +
        'mer)'
      '         Group by Sales_Profit.Customer),0) as Year4_TO,'
      #9#9'    (SELECT TOP 1 Activity.Due_Date_Time'
      #9#9'      FROM Activity'
      #9#9'    WHERE Activity.Customer = Customer_Operator.Customer AND'
      
        #9#9#9#9'  Activity.Due_Date_Time > GetDate() and (Activity.Activity_' +
        'Status < 30)'
      #9#9'    ORDER BY Activity.Due_Date_Time) as Next_Contact_Date,'
      #9#9'    (SELECT TOP 1 Activity.Due_Date_Time'
      #9#9'      FROM Activity_Type'
      
        '            INNER JOIN Activity ON Activity_Type.Activity_Type =' +
        ' Activity.Activity_Type'
      #9#9'    WHERE Activity.Customer = Customer_Operator.Customer AND'
      
        #9#9#9#9'  (Activity.Due_Date_Time <= GetDate()) and (Activity_Type.F' +
        'ace_To_Face_Activity = '#39'Y'#39') and (Activity.Activity_Status >= 30)'
      #9#9'    ORDER BY Activity.Due_Date_Time) as Last_Visit_Date,'
      '        (SELECT TOP 1 Purchase_Order.Date_Point'
      '         FROM Purchase_Order'
      '              INNER JOIN Purchase_OrderLine'
      
        '                ON Purchase_Order.Purchase_Order = Purchase_Orde' +
        'rLine.Purchase_Order'
      
        '         WHERE ((Purchase_OrderLine.Customer = Customer_Operator' +
        '.Customer) AND (Purchase_OrderLine.Inactive = '#39'N'#39'))'
      
        '         ORDER BY Purchase_Order.Date_Point DESC) as Last_Order_' +
        'Date,'
      '        Customer.Analysis_Code_1,'
      '        Customer.Analysis_Code_2,'
      '        Customer.Analysis_Code_3,'
      '        Customer.Analysis_Code_4'
      'FROM Operator'
      '      INNER JOIN (Level_of_Importance'
      '      INNER JOIN (Customer'
      '      INNER JOIN Customer_Operator'
      '        ON Customer.Customer = Customer_Operator.Customer)'
      
        '        ON Level_of_Importance.Level_of_importance = Customer.Le' +
        'vel_of_Importance)'
      '        ON Operator.Operator = Customer_Operator.Operator')
    Left = 792
    Top = 8
    ParamData = <
      item
        Name = 'period0_Start'
        DataType = ftInteger
      end
      item
        Name = 'Period0_End'
        DataType = ftInteger
      end
      item
        Name = 'period1_Start'
        DataType = ftInteger
      end
      item
        Name = 'Period1_End'
        DataType = ftInteger
      end
      item
        Name = 'period2_Start'
        DataType = ftInteger
      end
      item
        Name = 'Period2_End'
        DataType = ftInteger
      end
      item
        Name = 'period3_Start'
        DataType = ftInteger
      end
      item
        Name = 'Period3_End'
        DataType = ftInteger
      end
      item
        Name = 'period4_Start'
        DataType = ftInteger
      end
      item
        Name = 'Period4_End'
        DataType = ftInteger
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 848
    Top = 8
  end
  object qryDummy: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer_Operator.Operator,'
      '        Operator.Name as Operator_Name,'
      '        Customer_Operator.Customer,'
      '        Customer.Name as Customer_Name,'
      '        Level_of_Importance.Level_of_importance,'
      '        Level_of_Importance.Importance_description,'
      '        Level_of_Importance.Color as Importance_Color,'
      '        Level_of_Importance.Font_Color as Importance_Font_Color,'
      '        ISNULL((SELECT sum(Total_Sales_Value-Total_Cost_Value)'
      '         FROM Sales_Profit'
      
        '         WHERE ((Sales_Profit.Period >= :period0_Start) AND (Sal' +
        'es_Profit.Period <= :Period0_End)) AND'
      
        '                (Sales_Profit.Customer = Customer_Operator.Custo' +
        'mer)'
      '         Group by Sales_Profit.Customer),0) as Year0_TO,'
      '        ISNULL((SELECT sum(Total_Sales_Value-Total_Cost_Value)'
      '         FROM Sales_Profit'
      
        '         WHERE ((Sales_Profit.Period >= :period1_Start) AND (Sal' +
        'es_Profit.Period <= :Period1_End)) AND'
      
        '                (Sales_Profit.Customer = Customer_Operator.Custo' +
        'mer)'
      '         Group by Sales_Profit.Customer),0) as Year1_TO,'
      '        ISNULL((SELECT sum(Total_Sales_Value-Total_Cost_Value)'
      '         FROM Sales_Profit'
      
        '         WHERE ((Sales_Profit.Period >= :period2_Start) AND (Sal' +
        'es_Profit.Period <= :Period2_End)) AND'
      
        '                (Sales_Profit.Customer = Customer_Operator.Custo' +
        'mer)'
      '         Group by Sales_Profit.Customer),0) as Year2_TO,'
      '        ISNULL((SELECT sum(Total_Sales_Value-Total_Cost_Value)'
      '         FROM Sales_Profit'
      
        '         WHERE ((Sales_Profit.Period >= :period3_Start) AND (Sal' +
        'es_Profit.Period <= :Period3_End)) AND'
      
        '                (Sales_Profit.Customer = Customer_Operator.Custo' +
        'mer)'
      '         Group by Sales_Profit.Customer),0) as Year3_TO,'
      '        ISNULL((SELECT sum(Total_Sales_Value-Total_Cost_Value)'
      '         FROM Sales_Profit'
      
        '         WHERE ((Sales_Profit.Period >= :period4_Start) AND (Sal' +
        'es_Profit.Period <= :Period4_End)) AND'
      
        '                (Sales_Profit.Customer = Customer_Operator.Custo' +
        'mer)'
      '         Group by Sales_Profit.Customer),0) as Year4_TO,'
      
        #9#9'    (SELECT TOP 1 convert(nvarchar, Activity.Due_Date_Time, 10' +
        '3)'
      #9#9'      FROM Activity'
      
        #9#9'    WHERE ((Activity.Customer = Customer_Operator.Customer) AN' +
        'D (Activity.Assigned_To = Customer_Operator.Operator)) AND'
      #9#9#9#9'  (Activity.Activity_Status < 30)'
      #9#9'    ORDER BY Activity.Due_Date_Time) as Next_Contact_Date,'
      
        #9#9'    (SELECT TOP 1 convert(nvarchar, Activity.Due_Date_Time, 10' +
        '3)'
      #9#9'      FROM Activity_Type'
      
        '            INNER JOIN Activity ON Activity_Type.Activity_Type =' +
        ' Activity.Activity_Type'
      #9#9'    WHERE Activity.Customer = Customer_Operator.Customer AND'
      
        #9#9#9#9'  (Activity.Due_Date_Time <= GetDate()) and (Activity_Type.F' +
        'ace_To_Face_Activity = '#39'Y'#39') and (Activity.Activity_Status >= 30)'
      #9#9'    ORDER BY Activity.Due_Date_Time) as Last_Visit_Date,'
      '        (SELECT TOP 1 Purchase_Order.Date_Point'
      '         FROM Purchase_Order'
      '              INNER JOIN Purchase_OrderLine'
      
        '                ON Purchase_Order.Purchase_Order = Purchase_Orde' +
        'rLine.Purchase_Order'
      
        '         WHERE ((Purchase_OrderLine.Customer = Customer_Operator' +
        '.Customer) AND (Purchase_OrderLine.Inactive = '#39'N'#39'))'
      
        '         ORDER BY Purchase_Order.Date_Point DESC) as Last_Order_' +
        'Date,'
      '        Customer.Analysis_Code_1,'
      '        Customer.Analysis_Code_2,'
      '        Customer.Analysis_Code_3,'
      '        Customer.Analysis_Code_4'
      'FROM Operator'
      '      INNER JOIN (Level_of_Importance'
      '      INNER JOIN (Customer'
      '      INNER JOIN Customer_Operator'
      '        ON Customer.Customer = Customer_Operator.Customer)'
      
        '        ON Level_of_Importance.Level_of_importance = Customer.Le' +
        'vel_of_Importance)'
      '        ON Operator.Operator = Customer_Operator.Operator')
    Left = 736
    Top = 8
    ParamData = <
      item
        Name = 'period0_Start'
      end
      item
        Name = 'Period0_End'
      end
      item
        Name = 'period1_Start'
      end
      item
        Name = 'Period1_End'
      end
      item
        Name = 'period2_Start'
      end
      item
        Name = 'Period2_End'
      end
      item
        Name = 'period3_Start'
      end
      item
        Name = 'Period3_End'
      end
      item
        Name = 'period4_Start'
      end
      item
        Name = 'Period4_End'
      end>
  end
  object qryFY: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 5'
      '        Financial_Year,'
      '        Title,'
      '        No_of_periods'
      'from Financial_Year'
      'where Financial_year <= :Current_Year'
      'order by Financial_Year desc')
    Left = 792
    Top = 128
    ParamData = <
      item
        Name = 'Current_Year'
      end>
  end
end
