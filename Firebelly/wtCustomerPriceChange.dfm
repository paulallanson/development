object frmwtCustomerPriceChange: TfrmwtCustomerPriceChange
  Left = 541
  Top = 121
  BorderStyle = bsDialog
  Caption = 'Customer Price Change'
  ClientHeight = 469
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object lblPriceChange: TLabel
    Left = 16
    Top = 366
    Width = 76
    Height = 17
    Caption = 'Price Change'
  end
  object Label2: TLabel
    Left = 16
    Top = 396
    Width = 79
    Height = 17
    Caption = 'Effective Date'
  end
  object Label5: TLabel
    Left = 224
    Top = 396
    Width = 28
    Height = 17
    Caption = 'Time'
  end
  object BasisGroup: TRadioGroup
    Left = 16
    Top = 272
    Width = 143
    Height = 67
    Caption = 'Price Change type'
    ItemIndex = 0
    Items.Strings = (
      'Uplift price by %'
      'Reduce price by %')
    ParentBackground = False
    TabOrder = 5
    OnClick = BasisGroupClick
  end
  object dtpckEffective: TDateTimePicker
    Left = 104
    Top = 392
    Width = 103
    Height = 25
    Date = 37563.000000000000000000
    Time = 0.834117939812131200
    TabOrder = 7
  end
  object edtTime: TMaskEdit
    Left = 261
    Top = 392
    Width = 51
    Height = 25
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
    NumGlyphs = 2
    TabOrder = 10
  end
  object btnOK: TBitBtn
    Left = 119
    Top = 432
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    NumGlyphs = 2
    TabOrder = 9
    OnClick = btnOKClick
  end
  object edtChange: TCREditFloat
    Left = 104
    Top = 360
    Width = 105
    Height = 25
    TabOrder = 6
    OnChange = edtChangeChange
  end
  object rdgrpCustomer: TRadioGroup
    Left = 16
    Top = 16
    Width = 105
    Height = 67
    Caption = 'Customers'
    ItemIndex = 0
    Items.Strings = (
      'All'
      'Selected')
    ParentBackground = False
    TabOrder = 0
    OnClick = rdgrpCustomerClick
  end
  object lstbxCustomersCode: TListBox
    Left = 96
    Top = 16
    Width = 25
    Height = 105
    ItemHeight = 17
    TabOrder = 11
    Visible = False
  end
  object grpbxCustomer: TGroupBox
    Left = 128
    Top = 20
    Width = 249
    Height = 113
    Enabled = False
    ParentBackground = False
    TabOrder = 1
    object Label4: TLabel
      Left = 8
      Top = 2
      Width = 56
      Height = 17
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
      ItemHeight = 17
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
    Height = 113
    Caption = 'Price Change type'
    ItemIndex = 0
    Items.Strings = (
      'Worktop Options'
      'Edge Options'
      'Cut Out Options'
      'Update All')
    ParentBackground = False
    TabOrder = 2
    OnClick = rdgrpPriceChangeClick
  end
  object rdGrpWTGroups: TRadioGroup
    Left = 176
    Top = 136
    Width = 201
    Height = 67
    Caption = 'Price Group selection'
    ItemIndex = 0
    Items.Strings = (
      'All Groups'
      'One Group')
    ParentBackground = False
    TabOrder = 3
    Visible = False
    OnClick = rdGrpWTGroupsClick
  end
  object grpbxWTGroups: TGroupBox
    Left = 176
    Top = 206
    Width = 201
    Height = 65
    ParentBackground = False
    TabOrder = 4
    Visible = False
    object Label3: TLabel
      Left = 10
      Top = 6
      Width = 91
      Height = 17
      Caption = 'Worktop Group'
    end
    object dblkpWTGroup: TDBLookupComboBox
      Left = 10
      Top = 29
      Width = 167
      Height = 25
      KeyField = 'Group_Number'
      ListField = 'Group_Description'
      ListSource = dtsWTGroup
      TabOrder = 0
    end
  end
  object pmnCustomers: TPopupMenu
    Left = 300
    Top = 306
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
  object dtsWTGroup: TDataSource
    DataSet = qryCustomerGroups
    Left = 320
    Top = 84
  end
  object qryCustomerGroups: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Customer_Worktop_Group'
      'where Customer = :Customer'
      'order by Group_Description')
    Left = 192
    Top = 80
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryEdgeGroups: TFDQuery
    ConnectionName = 'WT'
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
        Name = 'Customer'
      end>
  end
  object qryWTGroups: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Customer_Worktop_Group'
      'where Customer = :Customer'
      'order by Group_Description')
    Left = 320
    Top = 14
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryPrice: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select top 1 *'
      'from prices'
      'where (Price_pointer = :Price_pointer) and'
      #9#9'(effective_date <= now())'
      'order by effective_date desc')
    Left = 326
    Top = 416
    ParamData = <
      item
        Name = 'Price_pointer'
        DataType = ftInteger
      end>
  end
  object qryWorktop: TFDQuery
    ConnectionName = 'WT'
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
    Left = 326
    Top = 146
    ParamData = <
      item
        Name = 'Group_Number'
      end
      item
        Name = 'Group_Number'
      end
      item
        Name = 'Thickness'
      end
      item
        Name = 'Thickness'
      end>
  end
  object qryCutOut: TFDQuery
    ConnectionName = 'WT'
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
    Left = 326
    Top = 226
    ParamData = <
      item
        Name = 'Group_Number'
      end
      item
        Name = 'Group_Number'
      end>
  end
  object qryEdge: TFDQuery
    ConnectionName = 'WT'
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
    Left = 326
    Top = 336
    ParamData = <
      item
        Name = 'Group_Number'
      end
      item
        Name = 'Group_Number'
      end>
  end
end
