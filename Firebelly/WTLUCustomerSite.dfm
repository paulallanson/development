object frmWTLUCustomerSite: TfrmWTLUCustomerSite
  Left = 444
  Top = 160
  BorderStyle = bsDialog
  Caption = 'Customer Sites'
  ClientHeight = 412
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 33
    Width = 408
    Height = 286
    Align = alClient
    DataSource = srcCustomerSite
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Branch_Name'
        Title.Caption = 'Site Name'
        Width = 272
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inactive'
        Visible = False
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 393
    Width = 497
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 319
    Width = 497
    Height = 74
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      497
      74)
    object Label4: TLabel
      Left = 8
      Top = 20
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 50
      Width = 169
      Height = 17
      Caption = 'Show inactive sites'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object BitBtn4: TBitBtn
      Left = 414
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
    object edtName: TEdit
      Left = 56
      Top = 16
      Width = 177
      Height = 21
      TabOrder = 2
      OnChange = edtNameChange
    end
  end
  object Panel2: TPanel
    Left = 408
    Top = 33
    Width = 89
    Height = 286
    Align = alRight
    ParentBackground = False
    TabOrder = 3
    DesignSize = (
      89
      286)
    object BitBtn1: TBitBtn
      Left = 8
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object btnEdit: TBitBtn
      Left = 6
      Top = 80
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDelete: TBitBtn
      Left = 6
      Top = 120
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object btnExcel: TBitBtn
      Left = 6
      Top = 160
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      TabOrder = 3
      OnClick = btnExcelClick
    end
    object btnSelect: TBitBtn
      Left = 6
      Top = 254
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Select'
      TabOrder = 4
      OnClick = btnSelectClick
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 497
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 4
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Customer:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCustomerName: TLabel
      Left = 72
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Customer:'
    end
  end
  object srcCustomerSite: TDataSource
    DataSet = qryCustomerBranch
    OnDataChange = srcCustomerSiteDataChange
    Left = 168
    Top = 56
  end
  object qryCustomerBranch: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '    Customer_Branch.*, '
      #9#9'Customer_contact.Contact_name as Install_Contact_Name,'
      #9#9'Customer_contact.Email_address as Install_Email_Address,'
      #9#9'Customer_contact.Mobile_number as Install_Mobile_Number,'
      #9#9'Customer_contact.Telephone_number as Install_Phone_Number'
      'FROM Customer_Branch '
      #9#9'LEFT JOIN Customer_contact '
      
        #9#9#9'ON (Customer_Branch.Installation_Contact = Customer_contact.C' +
        'ontact_no) AND (Customer_Branch.Customer = Customer_contact.Cust' +
        'omer)'
      'WHERE (Customer_Branch.Customer = :Customer) AND'
      
        '      ((Customer_Branch.inactive = :inactive) or (Customer_Branc' +
        'h.inactive is NULL) or (Customer_Branch.inactive = '#39'N'#39')) AND'
      #9#9'(Branch_Name LIKE :Description)'
      'ORDER BY Customer_Branch.Branch_Name')
    Left = 80
    Top = 56
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Description'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 304
    Top = 56
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 168
    Top = 120
  end
end
