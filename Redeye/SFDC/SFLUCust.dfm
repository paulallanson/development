object SFLUCustFrm: TSFLUCustFrm
  Left = 208
  Top = 150
  BorderStyle = bsDialog
  Caption = 'Look-Up A Customer'
  ClientHeight = 440
  ClientWidth = 469
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object CountLabel: TLabel
    Left = 286
    Top = 272
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'CountLabel'
  end
  object SearchGrpBox: TGroupBox
    Left = 14
    Top = 291
    Width = 331
    Height = 62
    Caption = 'Type here to narrow the search'
    TabOrder = 1
    object edtName: TEdit
      Left = 8
      Top = 16
      Width = 281
      Height = 21
      TabOrder = 0
      OnChange = edtNameChange
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 42
      Width = 209
      Height = 17
      Caption = 'Only show active customers'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = chkbxShowInactiveClick
    end
  end
  object SelectBitBtn: TBitBtn
    Left = 369
    Top = 370
    Width = 75
    Height = 25
    Caption = '&Select'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Glyph.Data = {
      CE070000424DCE07000000000000360000002800000024000000120000000100
      1800000000009807000000000000000000000000000000000000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F7F00007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F7F0000007F00007F007F0000007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F0000007F00007F00007F0000
      7F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F000000
      7F00007F00007F00007F00007F00007F007F0000007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F
      7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F7F0000007F00007F00007F0000FF00007F00007F00007F00007F00
      7F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFF
      FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F00007F00007F0000FF00007F7F
      00FF00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F7F7F7FFFFFFF007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00
      007F0000FF00007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F00
      7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F00FF
      00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F
      7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF0000
      7F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F
      7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00
      007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFF
      FFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F00FF00007F00007F007F0000007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F
      7F7FFFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00007F
      00007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 2
    OnClick = SelectBitBtnClick
  end
  object CloseBitBtn: TBitBtn
    Left = 369
    Top = 407
    Width = 75
    Height = 25
    Caption = 'C&lose'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 3
    OnClick = CloseBitBtnClick
  end
  object DispPanel: TPanel
    Left = 14
    Top = 358
    Width = 331
    Height = 75
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 4
    object DBCustText: TDBText
      Left = 91
      Top = 3
      Width = 206
      Height = 17
      DataField = 'Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBPhoneText: TDBText
      Left = 91
      Top = 19
      Width = 206
      Height = 13
      DataField = 'Phone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBFaxText: TDBText
      Left = 91
      Top = 35
      Width = 206
      Height = 15
      DataField = 'Fax_Number'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelName: TLabel
      Left = 28
      Top = 2
      Width = 32
      Height = 13
      Caption = 'Name:'
    end
    object LabelPhone: TLabel
      Left = 28
      Top = 18
      Width = 36
      Height = 13
      Caption = 'Phone:'
    end
    object LabelFax: TLabel
      Left = 28
      Top = 34
      Width = 20
      Height = 13
      Caption = 'Fax:'
    end
    object RepLabel: TLabel
      Left = 28
      Top = 50
      Width = 23
      Height = 13
      Caption = 'Rep:'
    end
    object DBRepText: TDBText
      Left = 91
      Top = 50
      Width = 206
      Height = 17
      DataField = 'Rep_Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object dbgDetails: TDBGrid
    Left = 16
    Top = 9
    Width = 329
    Height = 256
    DrawingStyle = gdsGradient
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnColEnter = dbgDetailsColEnter
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Customer Name'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Account_Code'
        Title.Caption = 'Account Code'
        Width = 85
        Visible = True
      end>
  end
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 160
    Top = 48
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Customer.Customer,'
      '        Customer.Name, Customer_Branch.Narrative,'
      '        Customer_Branch.Phone,Customer_Branch.Account_Code,'
      
        '        Customer_Branch.Fax_Number,Customer_Branch.Branch_No, Cu' +
        'stomer_Branch.Name as Branch_Name,'
      '        (SELECT top 1 Rep.Name'
      
        #9'FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Re' +
        'p'
      
        #9'WHERE (((Reps_Branches.Customer)=Customer_Branch.Customer) AND ' +
        '((Reps_Branches.Branch_no)=Customer_Branch.Branch_no))) as Rep_N' +
        'ame'
      ' From Customer, Customer_Branch'
      'Where'
      '      ('
      '      (Customer.Name Like :Code_From) or'
      '      (Customer_Branch.Account_Code Like :Code_From)'
      '      ) and'
      '      ((Acc_Active = '#39'Y'#39') or (:Active_Only = '#39'N'#39')) and'
      '      (Customer_Branch.Customer = Customer.Customer)'
      '      and (Customer_Branch.Branch_No = 0)'
      'Order By Customer.Name'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 104
    Top = 48
    ParamData = <
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Code_From'
        DataType = ftString
      end
      item
        Name = 'Active_Only'
        DataType = ftString
      end>
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 264
    Top = 48
  end
  object SelectedSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Customer.Customer,'
      '        Customer.Name,'
      '        Customer.Acc_Active,'
      '        Customer.Credit_Limit,'
      '        Customer.Settlement_Days,'
      '        Customer.Settlement_Discount,'
      '        Customer_Branch.Account_Code,'
      '        Customer.Credit_Status,'
      '        Customer_Branch.Inv_To_Customer,'
      '        Customer_Branch.Inv_To_Branch,'
      '        Customer.Customer_Type,'
      '        Customer_Branch.Branch_No,'
      '        Customer_Branch.Building_No_Name,'
      '        Customer_Branch.Street,'
      '        Customer_Branch.Locale,'
      '        Customer_Branch.PostCode,'
      '        Customer_Branch.Town,'
      '        Customer_Branch.Phone,'
      '        Customer_Branch.Fax_Number,'
      '        Customer_Branch.EMail,'
      '        Customer_Branch.Narrative,'
      '        Customer.Intrastat_Id,'
      '        Customer.Available_Credit,'
      '        Customer_Branch.Account_Code_On_Ledger,'
      '        Customer.Country_Id,'
      '        Customer.VAT_Reference,'
      '        Customer.Currency_Code_Def,'
      '        Customer_Branch.Delivery_Narrative,'
      '        Customer.VAT_Code_Def,'
      '        Customer.Customer_Status,'
      '        Customer.Online_Ordering,'
      '        Customer.Email_Address_Order_Confirm,'
      '        Customer.Cost_Centre_Level'
      'From Customer, Customer_Branch'
      'Where (Customer.Customer = :Customer) and'
      '      (Customer_Branch.Customer = Customer.Customer) and'
      '      (Customer_Branch.Branch_No = 0)'
      'Order By Customer.Name'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 40
    Top = 48
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
  object NullSRC: TDataSource
    Left = 208
    Top = 48
  end
end
