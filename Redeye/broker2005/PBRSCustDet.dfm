object PBRSCustDetFrm: TPBRSCustDetFrm
  Left = 182
  Top = 92
  Caption = 'Customer Details'
  ClientHeight = 415
  ClientWidth = 911
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 640
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object pnlDisplay: TPanel
    Left = 0
    Top = 121
    Width = 911
    Height = 275
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    object dbgrdCustStatus: TDBGrid
      Left = 1
      Top = 1
      Width = 909
      Height = 232
      Align = alClient
      DataSource = dtsrcCurrentCustStatus
      DrawingStyle = gdsGradient
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object pnlPrintControl: TPanel
      Left = 1
      Top = 233
      Width = 909
      Height = 41
      Align = alBottom
      ParentBackground = False
      TabOrder = 1
      object lblRecordCount: TLabel
        Left = 104
        Top = 16
        Width = 3
        Height = 13
      end
      object Panel1: TPanel
        Left = 644
        Top = 1
        Width = 264
        Height = 39
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          264
          39)
        object PreviewReportBitBtn: TBitBtn
          Left = 94
          Top = 8
          Width = 75
          Height = 25
          Anchors = [akTop]
          Caption = 'Preview'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
            33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
            3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
            33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
            333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
          TabOrder = 0
          OnClick = PreviewReportBitBtnClick
        end
        object PrintReportBitBtn: TBitBtn
          Left = 182
          Top = 8
          Width = 75
          Height = 25
          Anchors = [akTop]
          Caption = 'Print'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
            0003377777777777777308888888888888807F33333333333337088888888888
            88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
            8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
            8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
            03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
            03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
            33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
            33333337FFFF7733333333300000033333333337777773333333}
          NumGlyphs = 2
          TabOrder = 1
          OnClick = PrintReportBitBtnClick
        end
        object btnExcel: TBitBtn
          Left = 5
          Top = 8
          Width = 75
          Height = 25
          Anchors = [akTop]
          Caption = 'Excel'
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
          TabOrder = 2
          OnClick = btnExcelClick
        end
      end
      object CancelBitBtn: TBitBtn
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  object pnlControls: TPanel
    Left = 0
    Top = 0
    Width = 911
    Height = 121
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 78
      Width = 57
      Height = 14
      Caption = 'Sort first by'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 184
      Top = 78
      Width = 58
      Height = 14
      Caption = 'then sort by'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object pnlStatusSelect: TPanel
      Left = 174
      Top = 12
      Width = 161
      Height = 57
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 31
        Height = 14
        Caption = 'Status'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object cmbbxCustStatus: TComboBox
        Left = 8
        Top = 24
        Width = 137
        Height = 21
        Enabled = False
        TabOrder = 0
        Text = 'Show All'
        OnChange = cmbbxCustStatusChange
        Items.Strings = (
          'Show All'
          'Prospect'
          'Lapsed')
      end
    end
    object cbSort1: TComboBox
      Left = 8
      Top = 92
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnChange = cbSortChange
      Items.Strings = (
        'Customer Type'
        'Customer Status'
        'Level of Importance'
        'Rep'
        'Customer')
    end
    object cbSort2: TComboBox
      Left = 184
      Top = 92
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 2
      OnChange = cbSortChange
      Items.Strings = (
        'Customer Type'
        'Customer Status'
        'Level of Importance'
        'Rep'
        'Customer')
    end
    object Panel2: TPanel
      Left = 6
      Top = 12
      Width = 161
      Height = 57
      ParentBackground = False
      TabOrder = 3
      object lblCustomerType: TLabel
        Left = 8
        Top = 8
        Width = 23
        Height = 14
        Caption = 'Type'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object TypeComboBox: TComboBox
        Left = 8
        Top = 24
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'Show All'
        OnChange = cmbbxCustStatusChange
      end
    end
    object Panel3: TPanel
      Left = 518
      Top = 12
      Width = 161
      Height = 57
      ParentBackground = False
      TabOrder = 4
      object Label7: TLabel
        Left = 8
        Top = 8
        Width = 19
        Height = 14
        Caption = 'Rep'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RepComboBox: TComboBox
        Left = 8
        Top = 24
        Width = 145
        Height = 21
        TabOrder = 0
        Text = 'Show All'
        OnChange = RepComboBoxChange
      end
    end
    object RadioGroup1: TRadioGroup
      Left = 808
      Top = 8
      Width = 97
      Height = 65
      Caption = 'Report Type'
      ItemIndex = 0
      Items.Strings = (
        'Summary'
        'Detail')
      ParentBackground = False
      TabOrder = 5
      OnClick = RadioGroup1Click
    end
    object chkbxCustomers: TCheckBox
      Left = 744
      Top = 96
      Width = 161
      Height = 17
      Caption = 'Include inactive Customers'
      TabOrder = 6
      OnClick = chkbxCustomersClick
    end
    object pnlLevelofImp: TPanel
      Left = 345
      Top = 12
      Width = 161
      Height = 57
      ParentBackground = False
      TabOrder = 7
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 95
        Height = 14
        Caption = 'Level of Importance'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object cmbbxLevelOfImp: TComboBox
        Left = 8
        Top = 24
        Width = 137
        Height = 21
        TabOrder = 0
        Text = 'Show All'
        OnChange = cmbbxCustStatusChange
      end
    end
  end
  object pnlExportPrgrss: TPanel
    Left = 228
    Top = 148
    Width = 289
    Height = 61
    ParentBackground = False
    TabOrder = 2
    Visible = False
    object lblExporting: TLabel
      Left = 16
      Top = 12
      Width = 59
      Height = 13
      Caption = 'Exporting...'
    end
    object prgbrExport: TProgressBar
      Left = 16
      Top = 32
      Width = 257
      Height = 16
      Step = 1
      TabOrder = 0
    end
  end
  object OleContainer1: TOleContainer
    Left = 376
    Top = 120
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 3
    Visible = False
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 396
    Width = 911
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object qryCurrentCustStatus: TFDQuery
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      
        'SELECT Customer_Branch.*, Customer_Status.*, Customer_Type.*, Re' +
        'p.Rep, Rep.Name,'
      
        'Customer.Name+'#39'/'#39'+Customer_Branch.name as Cust_name, Customer.Na' +
        'me, Customer.Acc_Active, '
      
        'Customer.Analysis_Code_1, Customer.Analysis_Code_2, Customer.Ana' +
        'lysis_Code_3, Customer.Analysis_Code_4'
      'FROM Rep Right JOIN ((Customer_Type'
      'INNER JOIN (Customer_Status'
      'INNER JOIN (Customer'
      'INNER JOIN Customer_Branch'
      '  ON Customer.Customer = Customer_Branch.Customer)'
      '  ON Customer_Status.Customer_Status = Customer.Customer_Status)'
      '  ON Customer_Type.Customer_Type = Customer.Customer_Type)'
      '  Left JOIN Reps_Branches'
      
        '    ON (Customer_Branch.Branch_no = Reps_Branches.Branch_no) AND' +
        ' (Customer_Branch.Customer = Reps_Branches.Customer))'
      '      ON Rep.Rep = Reps_Branches.Rep'
      
        '      where customer_Branch.Branch_no = 0 and Customer.Acc_Activ' +
        'e = '#39'Y'#39
      ''
      ''
      ''
      ''
      ''
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 28
    Top = 244
    object qryCurrentCustStatusCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'Customer'
      Required = True
    end
    object qryCurrentCustStatusBranch_no: TIntegerField
      FieldName = 'Branch_no'
      Origin = 'Branch_no'
      Required = True
    end
    object qryCurrentCustStatusName: TWideStringField
      FieldName = 'Name'
      Origin = 'Name'
      Size = 50
    end
    object qryCurrentCustStatusBuilding_No_name: TWideStringField
      FieldName = 'Building_No_name'
      Origin = 'Building_No_name'
      Size = 50
    end
    object qryCurrentCustStatusStreet: TWideStringField
      FieldName = 'Street'
      Origin = 'Street'
      Size = 50
    end
    object qryCurrentCustStatusLocale: TWideStringField
      FieldName = 'Locale'
      Origin = 'Locale'
      Size = 50
    end
    object qryCurrentCustStatusTown: TWideStringField
      FieldName = 'Town'
      Origin = 'Town'
      Size = 50
    end
    object qryCurrentCustStatusPostcode: TWideStringField
      FieldName = 'Postcode'
      Origin = 'Postcode'
      Required = True
      Size = 10
    end
    object qryCurrentCustStatusPhone: TWideStringField
      FieldName = 'Phone'
      Origin = 'Phone'
      Required = True
    end
    object qryCurrentCustStatusFax_Number: TWideStringField
      FieldName = 'Fax_Number'
      Origin = 'Fax_Number'
    end
    object qryCurrentCustStatusEmail: TWideStringField
      FieldName = 'Email'
      Origin = 'Email'
      Size = 40
    end
    object qryCurrentCustStatusCustomer0: TIntegerField
      FieldName = 'Customer0'
      Origin = 'Customer0'
    end
    object qryCurrentCustStatusBranch_no0: TIntegerField
      FieldName = 'Branch_no0'
      Origin = 'Branch_no0'
    end
    object qryCurrentCustStatusMainRep: TIntegerField
      FieldName = 'MainRep'
      Origin = 'MainRep'
    end
    object qryCurrentCustStatusNarrative: TIntegerField
      FieldName = 'Narrative'
      Origin = 'Narrative'
    end
    object qryCurrentCustStatusAccount_Code: TWideStringField
      FieldName = 'Account_Code'
      Origin = 'Account_Code'
      Size = 10
    end
    object qryCurrentCustStatusInv_To_Customer: TIntegerField
      FieldName = 'Inv_To_Customer'
      Origin = 'Inv_To_Customer'
    end
    object qryCurrentCustStatusInv_To_Branch: TIntegerField
      FieldName = 'Inv_To_Branch'
      Origin = 'Inv_To_Branch'
    end
    object qryCurrentCustStatusAccount_Code_On_Ledger: TWideStringField
      FieldName = 'Account_Code_On_Ledger'
      Origin = 'Account_Code_On_Ledger'
      Size = 1
    end
    object qryCurrentCustStatusDelivery_Narrative: TIntegerField
      FieldName = 'Delivery_Narrative'
      Origin = 'Delivery_Narrative'
    end
    object qryCurrentCustStatusLast_Statement_ref: TWideStringField
      FieldName = 'Last_Statement_ref'
      Origin = 'Last_Statement_ref'
      Size = 15
    end
    object qryCurrentCustStatusUse_Branch_Name: TWideStringField
      FieldName = 'Use_Branch_Name'
      Origin = 'Use_Branch_Name'
      Size = 1
    end
    object qryCurrentCustStatusShort_Code: TWideStringField
      FieldName = 'Short_Code'
      Origin = 'Short_Code'
      Size = 10
    end
    object qryCurrentCustStatusHO_Department: TIntegerField
      FieldName = 'HO_Department'
      Origin = 'HO_Department'
    end
    object qryCurrentCustStatusUse_HO_Delivery_Notes: TWideStringField
      FieldName = 'Use_HO_Delivery_Notes'
      Origin = 'Use_HO_Delivery_Notes'
      Size = 1
    end
    object qryCurrentCustStatusCounty: TWideStringField
      FieldName = 'County'
      Origin = 'County'
      Size = 30
    end
    object qryCurrentCustStatusConsumer_Code: TWideStringField
      FieldName = 'Consumer_Code'
      Origin = 'Consumer_Code'
    end
    object qryCurrentCustStatusInactive: TWideStringField
      FieldName = 'Inactive'
      Origin = 'Inactive'
      Size = 1
    end
    object qryCurrentCustStatusOnline_Ordering_Email: TWideStringField
      FieldName = 'Online_Ordering_Email'
      Origin = 'Online_Ordering_Email'
      Size = 100
    end
    object qryCurrentCustStatusInv_To_Contact: TIntegerField
      FieldName = 'Inv_To_Contact'
      Origin = 'Inv_To_Contact'
    end
    object qryCurrentCustStatusCustomer_Status: TIntegerField
      FieldName = 'Customer_Status'
      Origin = 'Customer_Status'
      Required = True
    end
    object qryCurrentCustStatusCustomer_Status_Descr: TWideStringField
      FieldName = 'Customer_Status_Descr'
      Origin = 'Customer_Status_Descr'
      Required = True
      Size = 12
    end
    object qryCurrentCustStatusCustomer_Type: TIntegerField
      FieldName = 'Customer_Type'
      Origin = 'Customer_Type'
      Required = True
    end
    object qryCurrentCustStatusDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 40
    end
    object qryCurrentCustStatusColor: TIntegerField
      FieldName = 'Color'
      Origin = 'Color'
    end
    object qryCurrentCustStatusFont_Color: TIntegerField
      FieldName = 'Font_Color'
      Origin = 'Font_Color'
    end
    object qryCurrentCustStatusRep: TIntegerField
      FieldName = 'Rep'
      Origin = 'Rep'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryCurrentCustStatusName_1: TWideStringField
      FieldName = 'Name_1'
      Origin = 'Name'
      Size = 40
    end
    object qryCurrentCustStatusCust_name: TWideStringField
      FieldName = 'Cust_name'
      Origin = 'Cust_name'
      ReadOnly = True
      Size = 151
    end
    object qryCurrentCustStatusName_2: TWideStringField
      FieldName = 'Name_2'
      Origin = 'Name'
      Required = True
      Size = 100
    end
    object qryCurrentCustStatusAcc_Active: TWideStringField
      FieldName = 'Acc_Active'
      Origin = 'Acc_Active'
      Size = 1
    end
    object qryCurrentCustStatusAnalysis_Code_1: TWideStringField
      FieldName = 'Analysis_Code_1'
      Origin = 'Analysis_Code_1'
    end
    object qryCurrentCustStatusAnalysis_Code_2: TWideStringField
      FieldName = 'Analysis_Code_2'
      Origin = 'Analysis_Code_2'
    end
    object qryCurrentCustStatusAnalysis_Code_3: TWideStringField
      FieldName = 'Analysis_Code_3'
      Origin = 'Analysis_Code_3'
      Size = 50
    end
    object qryCurrentCustStatusAnalysis_Code_4: TWideStringField
      FieldName = 'Analysis_Code_4'
      Origin = 'Analysis_Code_4'
      Size = 50
    end
  end
  object dtsrcCurrentCustStatus: TDataSource
    DataSet = qryCurrentCustStatus
    Left = 188
    Top = 244
  end
  object qryCustStatus: TFDQuery
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      'select Customer_Status, Customer_status.Customer_Status_descr'
      'from Customer_status'
      'Order By Customer_Status'
      ' '
      ' '
      ' '
      ' ')
    Left = 132
    Top = 149
    object qryCustStatusCustomer_Status_descr: TWideStringField
      FieldName = 'Customer_Status_descr'
      Origin = 'Customer_Status_descr'
      Required = True
      Size = 12
    end
  end
  object QryCustType: TFDQuery
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      'select * from Customer_Type'
      'order by Customer_Type'
      ' '
      ' ')
    Left = 32
    Top = 149
    object QryCustTypeDescription: TWideStringField
      FieldName = 'Description'
      Origin = 'Description'
      Size = 40
    end
  end
  object QryRep: TFDQuery
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      'select Rep, Name'
      'from Rep'
      'Order by Rep.Name'
      ' '
      ' ')
    Left = 564
    Top = 161
    object QryRepName: TWideStringField
      FieldName = 'Name'
      Origin = 'Name'
      Required = True
      Size = 40
    end
  end
  object NewStdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '  Customer_Branch.*,'
      '  Customer_Status.*,'
      '  Customer_Type.*,'
      '  (SELECT top 1 Rep.Rep'
      
        '   FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.' +
        'Rep'
      #9' WHERE (Reps_Branches.Customer = Customer_Branch.Customer AND'
      
        '                Reps_Branches.Branch_no = Customer_Branch.Branch' +
        '_No) AND'
      
        '                ((Reps_Branches.Is_Main_Rep is NULL) or (Reps_Br' +
        'anches.Is_Main_Rep = '#39'Y'#39'))'
      '   ORDER BY Reps_Branches.Is_Main_Rep DESC) as Rep,'
      '  (SELECT top 1 Rep.Name'
      
        '   FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.' +
        'Rep'
      #9' WHERE (Reps_Branches.Customer = Customer_Branch.Customer AND'
      
        '                Reps_Branches.Branch_no = Customer_Branch.Branch' +
        '_No) AND'
      
        '                ((Reps_Branches.Is_Main_Rep is NULL) or (Reps_Br' +
        'anches.Is_Main_Rep = '#39'Y'#39'))'
      '   ORDER BY Reps_Branches.Is_Main_Rep DESC) as Rep_Name,'
      '  (SELECT top 1 Rep.Name'
      
        '   FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.' +
        'Rep'
      #9' WHERE (Reps_Branches.Customer = Customer_Branch.Customer AND'
      
        '         Reps_Branches.Branch_no = Customer_Branch.Branch_No) AN' +
        'D'
      
        '        ((Reps_Branches.Is_Main_Rep is NULL) or (Reps_Branches.I' +
        's_Main_Rep = '#39'N'#39'))'
      '   ORDER BY Reps_Branches.Is_Main_Rep DESC) as Sub_Rep_Name,'
      '  (SELECT top 1 Operator.Name'
      '      FROM Operator'
      
        '        INNER JOIN Customer_Operator ON Operator.Operator = Cust' +
        'omer_Operator.Operator'
      
        '      WHERE Customer_Operator.Customer = Customer_Branch.Custome' +
        'r'
      
        '   ORDER BY Customer_Operator.Is_main_Operator DESC) as Account_' +
        'Manager_Name,'
      '   Customer.Name+'#39'/'#39'+Customer_Branch.name as Cust_name,'
      '   Customer.Acc_Active,'
      '   Customer.Analysis_Code_1,'
      '   Customer.Analysis_Code_2,'
      '   Customer.Analysis_Code_3,'
      '   Customer.Analysis_Code_4,'
      '   Level_of_Importance.Level_of_importance,'
      '   Level_of_Importance.Importance_description'
      'FROM Level_of_Importance'
      '      RIGHT JOIN ((Customer_Type'
      '      INNER JOIN (Customer_Status'
      '      INNER JOIN Customer'
      
        '        ON Customer_Status.Customer_Status = Customer.Customer_S' +
        'tatus)'
      '        ON Customer_Type.Customer_Type = Customer.Customer_Type)'
      '      INNER JOIN Customer_Branch'
      '        ON Customer.Customer = Customer_Branch.Customer)'
      
        '        ON Level_of_Importance.Level_of_importance = Customer.Le' +
        'vel_of_Importance'
      'WHERE 1 = 1')
    Left = 348
    Top = 239
  end
  object qryLevelOfImp: TFDQuery
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      'select * from Level_of_Importance'
      'order by Importance_Description'
      ' '
      ' ')
    Left = 658
    Top = 161
    object qryLevelOfImpImportance_Description: TWideStringField
      FieldName = 'Importance_Description'
      Origin = 'Importance_Description'
      Required = True
      Size = 100
    end
  end
  object StdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer_Branch.*,'
      '        Customer_Status.*,'
      '        Customer_Type.*,'
      '        Rep.Rep,'
      '        Rep.Name as Rep_Name,'
      '        CASE Rep.Rep_is_sub_rep WHEN '#39'Y'#39' THEN '#39'Sub-Rep'#39
      '        ELSE'
      '        '#39#39
      #9#9'    END AS '#39'Rep_Type'#39','
      '        Customer.Name+'#39'/'#39'+Customer_Branch.name as Cust_name,'
      '        Customer.Acc_Active,'
      '        Customer.Analysis_Code_1,'
      '        Customer.Analysis_Code_2,'
      '        Customer.Analysis_Code_3,'
      '        Customer.Analysis_Code_4,'
      '        Level_of_Importance.Level_of_importance,'
      '        Level_of_Importance.Importance_description'
      'FROM Level_of_Importance'
      '      RIGHT JOIN (Rep'
      '      RIGHT JOIN (((Customer_Type'
      '      INNER JOIN (Customer_Status'
      '      INNER JOIN Customer'
      
        '        ON Customer_Status.Customer_Status = Customer.Customer_S' +
        'tatus)'
      '        ON Customer_Type.Customer_Type = Customer.Customer_Type)'
      '      INNER JOIN Customer_Branch'
      '        ON Customer.Customer = Customer_Branch.Customer)'
      '      LEFT JOIN Reps_Branches'
      
        '        ON (Customer_Branch.Branch_no = Reps_Branches.Branch_no)' +
        ' AND (Customer_Branch.Customer = Reps_Branches.Customer))'
      '        ON Rep.Rep = Reps_Branches.Rep)'
      
        '        ON Level_of_Importance.Level_of_importance = Customer.Le' +
        'vel_of_Importance'
      'WHERE 1 = 1')
    Left = 438
    Top = 239
  end
end
