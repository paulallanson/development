object frmWTMaintCustWTGroupColours: TfrmWTMaintCustWTGroupColours
  Left = 420
  Top = 117
  Width = 595
  Height = 355
  Caption = 'Customer Group Colours'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 587
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Group:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblGroupName: TLabel
      Left = 60
      Top = 16
      Width = 80
      Height = 13
      Caption = 'lblGroupName'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 344
      Top = 16
      Width = 82
      Height = 13
      Caption = 'Material Type:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMaterialType: TLabel
      Left = 428
      Top = 16
      Width = 87
      Height = 13
      Caption = 'lblMaterialType'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 587
    Height = 246
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 124
      Height = 13
      Caption = 'Currently Selected Colours'
    end
    object Label4: TLabel
      Left = 344
      Top = 8
      Width = 97
      Height = 13
      Caption = 'Un-Selected Colours'
    end
    object lstbxMembers: TListBox
      Left = 8
      Top = 28
      Width = 233
      Height = 213
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
      OnClick = lstbxMembersClick
      OnDblClick = lstbxMembersDblClick
    end
    object lstbxMembersCodes: TListBox
      Left = 128
      Top = 28
      Width = 41
      Height = 140
      ItemHeight = 13
      TabOrder = 1
      Visible = False
    end
    object btnAdd: TBitBtn
      Left = 253
      Top = 32
      Width = 81
      Height = 25
      Caption = '&Add'
      Enabled = False
      TabOrder = 2
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
      Left = 253
      Top = 72
      Width = 81
      Height = 25
      Caption = '&Remove'
      Enabled = False
      TabOrder = 3
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
      Left = 344
      Top = 28
      Width = 233
      Height = 213
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 4
      OnClick = lstbxNonMembersClick
      OnDblClick = lstbxNonMembersDblClick
    end
    object lstbxNonMembersCodes: TListBox
      Left = 472
      Top = 28
      Width = 41
      Height = 140
      ItemHeight = 13
      TabOrder = 5
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 287
    Width = 587
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnOK: TBitBtn
      Left = 212
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = btnOKClick
      Kind = bkOK
    end
    object btnCancel: TBitBtn
      Left = 300
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object qryDelete: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'delete from Customer_Worktop'
      'where Customer = :Customer AND Group_Number = :Group_Number')
    Left = 216
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Insert into Customer_Worktop'
      '(Customer,'
      'Group_Number,'
      'Worktop,'
      'inactive'
      ')'
      'values'
      '(  :Customer,'
      '  :Group_Number,'
      '  :Worktop,'
      '  '#39'N'#39
      ')'
      '')
    Left = 216
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Worktop'
        ParamType = ptUnknown
      end>
  end
  object qryMembers: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Customer_Worktop.Customer,'
      '        Customer_Worktop.Group_Number,'
      '        Customer_Worktop.Worktop,'
      '        Worktop.Description as Worktop_Description'
      'FROM Worktop'
      '      INNER JOIN Customer_Worktop'
      '        ON Worktop.Worktop = Customer_Worktop.Worktop'
      'WHERE Customer_Worktop.Customer = :Customer AND'
      '      Customer_Worktop.Group_Number = :Group_Number'
      'Order By Worktop.Description'
      '')
    Left = 104
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Group_Number'
        ParamType = ptUnknown
      end>
  end
  object qryNonMembers: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Worktop.Worktop,'
      '        Worktop.Description as Worktop_Description,'
      '        Worktop.Material_Type,'
      '        Worktop.Not_used_for_quoting,'
      '        Worktop.Worktop_Group,'
      '        Worktop.inactive,'
      '        Worktop_Group.Worktop_Group_Description'
      'FROM Worktop_Group'
      '      INNER JOIN Worktop'
      '        ON Worktop_Group.Worktop_Group = Worktop.Worktop_Group'
      'WHERE Worktop.Material_Type = :Material_Type')
    Left = 344
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end>
  end
  object dtsNonMembers: TDataSource
    DataSet = qryNonMembers
    Left = 416
    Top = 72
  end
  object qryDummy: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Worktop.Worktop,'
      '        Worktop.Description as Worktop_Description,'
      '        Worktop.Material_Type,'
      '        Worktop.Not_used_for_quoting,'
      '        Worktop.Worktop_Group,'
      '        Worktop.inactive'
      'FROM Worktop'
      'WHERE Worktop.Material_Type = :Material_Type AND '
      '      (inactive = '#39'N'#39')'
      ''
      '')
    Left = 328
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Material_Type'
        ParamType = ptUnknown
      end>
  end
end
