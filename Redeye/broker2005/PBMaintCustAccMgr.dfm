object PBMaintCustAccMgrFrm: TPBMaintCustAccMgrFrm
  Left = 344
  Top = 123
  BorderStyle = bsDialog
  Caption = 'Maintain Customer Account Managers'
  ClientHeight = 325
  ClientWidth = 468
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 127
    Height = 13
    Caption = 'Current Account Managers'
  end
  object Label2: TLabel
    Left = 328
    Top = 56
    Width = 95
    Height = 13
    Caption = 'Available Processes'
  end
  object Label3: TLabel
    Left = 8
    Top = 16
    Width = 57
    Height = 13
    Caption = 'Customer:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDetails: TLabel
    Left = 72
    Top = 16
    Width = 53
    Height = 13
    Caption = 'lblDetails'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 288
    Top = 40
    Width = 152
    Height = 13
    Caption = 'Un-assigned Account Managers'
  end
  object lstbxMembers: TListBox
    Left = 8
    Top = 56
    Width = 169
    Height = 225
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 0
    OnClick = lstbxMembersClick
    OnDblClick = lstbxMembersDblClick
  end
  object btnAdd: TBitBtn
    Left = 191
    Top = 56
    Width = 81
    Height = 25
    Caption = '&Add'
    Enabled = False
    TabOrder = 1
    OnClick = btnAddClick
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
  end
  object btnRemove: TBitBtn
    Left = 191
    Top = 96
    Width = 81
    Height = 25
    Caption = '&Remove'
    Enabled = False
    TabOrder = 2
    OnClick = btnRemoveClick
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
  end
  object lstbxNonMembers: TListBox
    Left = 288
    Top = 56
    Width = 169
    Height = 225
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 3
    OnClick = lstbxNonMembersClick
    OnDblClick = lstbxNonMembersDblClick
  end
  object Panel2: TPanel
    Left = 0
    Top = 284
    Width = 468
    Height = 41
    Align = alBottom
    TabOrder = 4
    object btnOK: TBitBtn
      Left = 153
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = btnOKClick
      Kind = bkOK
    end
    object btnCancel: TBitBtn
      Left = 241
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object lstbxMembersCodes: TListBox
    Left = 128
    Top = 56
    Width = 41
    Height = 225
    ItemHeight = 13
    TabOrder = 5
    Visible = False
  end
  object lstbxNonMembersCodes: TListBox
    Left = 392
    Top = 56
    Width = 41
    Height = 225
    ItemHeight = 13
    TabOrder = 6
    Visible = False
  end
  object qryAccMgrs: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select User_Group_Operator.*, Operator.Name as Operator_Name'
      'from User_Group_Operator, Operator'
      'where User_Group_Operator.Operator = Operator.Operator and'
      'User_Group_Operator.User_Group = 4')
    Left = 344
    Top = 48
  end
  object dtsAccMgrs: TDataSource
    DataSet = qryAccMgrs
    Left = 416
    Top = 48
  end
  object qryAdd: TQuery
    DatabaseName = 'PB'
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Main_Operator'
        ParamType = ptUnknown
      end>
  end
  object qryDummy: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select User_Group_Operator.*, Operator.Name as Operator_Name'
      'from User_Group_Operator, Operator'
      'where User_Group_Operator.Operator = Operator.Operator and'
      'User_Group_Operator.User_Group = 4 and'
      'Operator.Operator_Can_Login = '#39'Y'#39)
    Left = 328
    Top = 120
  end
  object qryMembers: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select Customer_Operator.*, Operator.Name as Operator_Name'
      'from Customer_Operator, Operator'
      'where Customer = :Customer and'
      'Customer_Operator.Operator = Operator.Operator'
      'order by Is_main_Operator desc')
    Left = 104
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryDelete: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from Customer_Operator'
      'where Customer = :Customer')
    Left = 192
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryDummyOps: TQuery
    SQL.Strings = (
      'select  Operator.Operator,'
      '        Operator.Name as Operator_Name'
      'from Operator'
      'where Operator.Operator_Can_Login = '#39'Y'#39)
    Left = 336
    Top = 184
  end
end
