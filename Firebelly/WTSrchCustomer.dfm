object frmWTSrchCustomer: TfrmWTSrchCustomer
  Left = 506
  Top = 152
  Caption = 'Search for customer'
  ClientHeight = 443
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 312
    Height = 335
    Align = alClient
    DataSource = dtsDetails
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Customer_Name'
        Title.Caption = 'Customer'
        Width = 242
        Visible = True
      end>
  end
  object pnlFunctions: TPanel
    Left = 312
    Top = 0
    Width = 98
    Height = 335
    Align = alRight
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      98
      335)
    object btnAdd: TBitBtn
      Left = 15
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Add'
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnChange: TBitBtn
      Left = 15
      Top = 40
      Width = 75
      Height = 25
      Caption = '&Change'
      Enabled = False
      TabOrder = 1
      OnClick = btnChangeClick
    end
    object btnDelete: TBitBtn
      Left = 15
      Top = 72
      Width = 75
      Height = 25
      Caption = '&Delete'
      Enabled = False
      TabOrder = 2
      OnClick = btnDeleteClick
    end
    object btnSweep: TBitBtn
      Left = 15
      Top = 297
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'S&weep'
      Enabled = False
      TabOrder = 3
      OnClick = btnSweepClick
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 335
    Width = 410
    Height = 89
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      410
      89)
    object Label1: TLabel
      Left = 8
      Top = 36
      Width = 86
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Customer Search'
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 8
      Width = 193
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Show inactive customers'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object edtSearch: TEdit
      Left = 8
      Top = 56
      Width = 257
      Height = 21
      Anchors = [akLeft, akBottom]
      TabOrder = 1
      OnChange = edtSearchChange
    end
    object btnSelect: TBitBtn
      Left = 329
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Select'
      ModalResult = 1
      TabOrder = 2
      OnClick = btnSelectClick
    end
    object BitBtn2: TBitBtn
      Left = 329
      Top = 54
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Canc&el'
      TabOrder = 3
      OnClick = BitBtn2Click
    end
  end
  object stbrDetails: TStatusBar
    Left = 0
    Top = 424
    Width = 410
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object qryDetails: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Customer, Customer_Name, Is_retail_customer, Vat,'
      '           Discount_Rate, '
      '           Deposit_Terms, '
      '           Rep, '
      '           Not_Active,'
      '           Narrative,'
      '           Customer_is_Speculative,'
      '           Use_For_General_Quoting,'
      '           Installation_Price,'
      '           Delivery_Price,'
      '           Survey_Price'
      'from Customer'
      'where Customer_name like :Name and'
      
        '(Not_Active = '#39'N'#39' or Not_Active is NULL or Not_Active = :Not_Act' +
        'ive) AND'
      
        '((Requires_App_For_Payment = :Requires_App_For_Payment) OR (Requ' +
        'ires_App_For_Payment = '#39'Y'#39'))'
      'order by Customer_Name')
    Left = 64
    Top = 64
    ParamData = <
      item
        Name = 'Name'
        DataType = ftString
      end
      item
        DataType = ftUnknown
        Name = 'Not_Active'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Requires_App_For_Payment'
        ParamType = ptUnknown
      end>
  end
  object dtsDetails: TDataSource
    DataSet = qryDetails
    Left = 120
    Top = 64
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 96
    Top = 128
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'delete '
      'from customer'
      'where customer = :Customer')
    Left = 272
    Top = 72
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
end
