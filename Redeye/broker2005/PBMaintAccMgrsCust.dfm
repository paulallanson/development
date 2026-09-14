object PBMaintAccMgrsCustFrm: TPBMaintAccMgrsCustFrm
  Left = 344
  Top = 123
  BorderStyle = bsDialog
  Caption = 'Maintain Account Manager Clients'
  ClientHeight = 325
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object Label1: TLabel
    Left = 8
    Top = 36
    Width = 85
    Height = 17
    Caption = 'Current Clients'
  end
  object Label2: TLabel
    Left = 328
    Top = 56
    Width = 114
    Height = 17
    Caption = 'Available Processes'
  end
  object Label3: TLabel
    Left = 8
    Top = 11
    Width = 113
    Height = 17
    Caption = 'Account Manager:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDetails: TLabel
    Left = 125
    Top = 11
    Width = 59
    Height = 17
    Caption = 'lblDetails'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 328
    Top = 36
    Width = 115
    Height = 17
    Caption = 'Un-assigned Clients'
  end
  object lstbxMembers: TListBox
    Left = 8
    Top = 56
    Width = 201
    Height = 225
    ItemHeight = 17
    MultiSelect = True
    TabOrder = 0
    OnClick = lstbxMembersClick
    OnDblClick = lstbxMembersDblClick
  end
  object btnAdd: TBitBtn
    Left = 229
    Top = 56
    Width = 81
    Height = 25
    Caption = '&Add'
    Enabled = False
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333FF3333333333333003333333333333F77F33333333333009033
      333333333F7737F333333333009990333333333F773337FFFFFF330099999000
      00003F773333377777770099999999999990773FF33333FFFFF7330099999000
      000033773FF33777777733330099903333333333773FF7F33333333333009033
      33333333337737F3333333333333003333333333333377333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnRemove: TBitBtn
    Left = 229
    Top = 96
    Width = 81
    Height = 25
    Caption = '&Remove'
    Enabled = False
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333FF3333333333333003333
      3333333333773FF3333333333309003333333333337F773FF333333333099900
      33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
      99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
      33333333337F3F77333333333309003333333333337F77333333333333003333
      3333333333773333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnRemoveClick
  end
  object lstbxNonMembers: TListBox
    Left = 328
    Top = 56
    Width = 201
    Height = 225
    ItemHeight = 17
    MultiSelect = True
    TabOrder = 3
    OnClick = lstbxNonMembersClick
    OnDblClick = lstbxNonMembersDblClick
  end
  object Panel2: TPanel
    Left = 0
    Top = 284
    Width = 542
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 4
    ExplicitTop = 275
    ExplicitWidth = 536
    object btnOK: TBitBtn
      Left = 189
      Top = 8
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TBitBtn
      Left = 277
      Top = 8
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object lstbxMembersCodes: TListBox
    Left = 128
    Top = 56
    Width = 41
    Height = 225
    ItemHeight = 17
    TabOrder = 5
    Visible = False
  end
  object lstbxNonMembersCodes: TListBox
    Left = 392
    Top = 56
    Width = 41
    Height = 225
    ItemHeight = 17
    TabOrder = 6
    Visible = False
  end
  object qryCustomers: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Customer.Customer, Customer.Name as Operator_Name'
      'from Customer'
      'ORDER BY Customer.Name'
      '')
    Left = 344
    Top = 48
  end
  object dtsCustomers: TDataSource
    DataSet = qryCustomers
    Left = 416
    Top = 48
  end
  object qryAdd: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Customer_Operator'
      '(Customer,'
      'Operator,'
      'Is_Main_Operator'
      ')'
      'values'
      '(  :Customer,'
      '  :Operator,'
      '  :Is_Main_Operator'
      ')')
    Left = 192
    Top = 216
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Is_Main_Operator'
      end>
  end
  object qryDummy: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Customer.Customer, Customer.Name as Customer_Name'
      'from Customer'
      'where 1=1')
    Left = 328
    Top = 120
  end
  object qryMembers: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Customer_Operator.*, Customer.Name as Customer_Name'
      'from Customer_Operator, Customer'
      'where Operator = :Operator and'
      'Customer_Operator.Customer = Customer.Customer'
      'ORDER BY Customer.Name')
    Left = 104
    Top = 64
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Customer_Operator'
      'where Operator = :Operator')
    Left = 192
    Top = 160
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
end
