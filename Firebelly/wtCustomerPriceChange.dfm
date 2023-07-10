object frmwtCustomerPriceChange: TfrmwtCustomerPriceChange
  Left = 541
  Top = 121
  BorderStyle = bsDialog
  Caption = 'Customer Price Change'
  ClientHeight = 478
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object lblPriceChange: TLabel
    Left = 16
    Top = 366
    Width = 64
    Height = 13
    Caption = 'Price Change'
  end
  object Label2: TLabel
    Left = 16
    Top = 396
    Width = 68
    Height = 13
    Caption = 'Effective Date'
  end
  object Label5: TLabel
    Left = 224
    Top = 396
    Width = 23
    Height = 13
    Caption = 'Time'
  end
  object BasisGroup: TRadioGroup
    Left = 16
    Top = 272
    Width = 143
    Height = 57
    Caption = 'Price Change type'
    ItemIndex = 0
    Items.Strings = (
      'Uplift price by %'
      'Reduce price by %')
    TabOrder = 5
    OnClick = BasisGroupClick
  end
  object dtpckEffective: TDateTimePicker
    Left = 104
    Top = 392
    Width = 103
    Height = 21
    Date = 37563.834117939810000000
    Time = 37563.834117939810000000
    TabOrder = 7
  end
  object edtTime: TMaskEdit
    Left = 252
    Top = 392
    Width = 51
    Height = 21
    EditMask = '!90:00;1;_'
    MaxLength = 5
    TabOrder = 8
    Text = '00:01'
    OnExit = edtTimeExit
  end
  object BitBtn2: TBitBtn
    Left = 207
    Top = 432
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 10
    NumGlyphs = 2
  end
  object btnOK: TBitBtn
    Left = 119
    Top = 432
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    TabOrder = 9
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object edtChange: TCREditFloat
    Left = 104
    Top = 360
    Width = 105
    Height = 21
    TabOrder = 6
    OnChange = edtChangeChange
  end
  object rdgrpCustomer: TRadioGroup
    Left = 16
    Top = 16
    Width = 105
    Height = 57
    Caption = 'Customers'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'Selected')
    TabOrder = 0
    OnClick = rdgrpCustomerClick
  end
  object lstbxCustomersCode: TListBox
    Left = 96
    Top = 16
    Width = 25
    Height = 105
    ItemHeight = 13
    TabOrder = 11
    Visible = False
  end
  object grpbxCustomer: TGroupBox
    Left = 128
    Top = 16
    Width = 249
    Height = 113
    Enabled = False
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 10
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object btnCustomer: TButton
      Left = 216
      Top = 24
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnCustomerClick
    end
    object lstbxCustomers: TListBox
      Left = 8
      Top = 24
      Width = 201
      Height = 83
      ItemHeight = 13
      Items.Strings = (
        'All Customers')
      MultiSelect = True
      PopupMenu = pmnCustomers
      TabOrder = 1
    end
  end
  object rdgrpPriceChange: TRadioGroup
    Left = 16
    Top = 136
    Width = 143
    Height = 97
    Caption = 'Price Change type'
    ItemIndex = 0
    Items.Strings = (
      'Worktop Options'
      'Edge Options'
      'Cut Out Options'
      'Update All')
    TabOrder = 2
    OnClick = rdgrpPriceChangeClick
  end
  object rdGrpWTGroups: TRadioGroup
    Left = 176
    Top = 136
    Width = 185
    Height = 57
    Caption = 'Price Group selection'
    ItemIndex = 0
    Items.Strings = (
      'All Groups'
      'One Group')
    TabOrder = 3
    Visible = False
    OnClick = rdGrpWTGroupsClick
  end
  object grpbxWTGroups: TGroupBox
    Left = 176
    Top = 200
    Width = 185
    Height = 65
    TabOrder = 4
    Visible = False
    object Label3: TLabel
      Left = 10
      Top = 13
      Width = 73
      Height = 13
      Caption = 'Worktop Group'
    end
    object dblkpWTGroup: TDBLookupComboBox
      Left = 10
      Top = 29
      Width = 167
      Height = 21
      KeyField = 'Group_Number'
      ListField = 'Group_Description'
      ListSource = dtsWTGroup
      TabOrder = 0
    end
  end
  object pmnCustomers: TPopupMenu
    Left = 272
    Top = 104
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
  object dtsWTGroup: TDataSource
    DataSet = qryCustomerGroups
    Left = 288
    Top = 80
  end
  object qryCustomerGroups: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *'
      'from Customer_Worktop_Group'
      'where Customer = :Customer'
      'order by Group_Description')
    Left = 192
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryEdgeGroups: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select Group_Id as Group_Number,'
      '          Group_Description'
      'from Customer_Cutout_Edge_Group'
      'where Customer = :Customer'
      'order by Group_Description')
    Left = 192
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryWTGroups: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *'
      'from Customer_Worktop_Group'
      'where Customer = :Customer'
      'order by Group_Description')
    Left = 288
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryPrice: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select top 1 *'
      'from prices'
      'where (Price_pointer = :Price_pointer) and'
      #9#9'(effective_date <= now())'
      'order by effective_date desc')
    Left = 344
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Price_pointer'
        ParamType = ptUnknown
      end>
  end
  object qryWorktop: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Worktop_Group_Thick.Customer,'
      '        Customer_Worktop_Group_Thick.Group_Number,'
      '        Customer_Worktop_Group_Thick.Thickness,'
      '        Customer_Worktop_Group_Thick.Price_Pointer'
      'FROM Customer_Worktop_Group_Thick'
      'WHERE'
      
        ' ((Customer_Worktop_Group_Thick.Group_Number = :Group_Number) or' +
        ' (:Group_Number = 0)) and'
      ' ((Thickness = :Thickness) or (:Thickness = 0))')
    Left = 344
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Thickness'
        ParamType = ptUnknown
      end>
  end
  object qryCutOut: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Cutout_Edge_Group.Customer,'
      '        Customer_Cutout_Edge_Group.Group_ID,'
      '        Customer_Cutout.Price_Pointer'
      'FROM Customer_Cutout_Edge_Group'
      '        INNER JOIN Customer_Cutout'
      
        '          ON Customer_Cutout_Edge_Group.Group_ID = Customer_Cuto' +
        'ut.Group_ID'
      'WHERE'
      
        ' ((Customer_Cutout_Edge_Group.Group_ID = :Group_Number) or (:Gro' +
        'up_Number = 0))')
    Left = 344
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end>
  end
  object qryEdge: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Cutout_Edge_Group.Customer,'
      '        Customer_Cutout_Edge_Group.Group_ID,'
      '        Customer_Edge.Price_Pointer'
      'FROM Customer_Cutout_Edge_Group'
      '        INNER JOIN Customer_Edge'
      
        '          ON Customer_Cutout_Edge_Group.Group_ID = Customer_Edge' +
        '.Group_ID'
      'WHERE'
      
        ' ((Customer_Cutout_Edge_Group.Group_ID = :Group_Number) or (:Gro' +
        'up_Number = 0))')
    Left = 344
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end>
  end
end
