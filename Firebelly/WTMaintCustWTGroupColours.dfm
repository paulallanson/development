object frmWTMaintCustWTGroupColours: TfrmWTMaintCustWTGroupColours
  Left = 420
  Top = 117
  Caption = 'Customer Group Colours'
  ClientHeight = 378
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 579
    DesignSize = (
      681
      41)
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 36
      Height = 13
      Caption = 'Group:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblGroupName: TLabel
      Left = 60
      Top = 16
      Width = 77
      Height = 13
      Caption = 'lblGroupName'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 446
      Top = 16
      Width = 74
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Material Type:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 344
    end
    object lblMaterialType: TLabel
      Left = 530
      Top = 16
      Width = 81
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'lblMaterialType'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 428
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 681
    Height = 296
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 579
    ExplicitHeight = 234
  end
  object Panel2: TPanel
    Left = 0
    Top = 337
    Width = 681
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 275
    ExplicitWidth = 579
    object btnOK: TBitBtn
      Left = 14
      Top = 8
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TBitBtn
      Left = 102
      Top = 8
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object GridPanel1: TGridPanel
    Left = 0
    Top = 41
    Width = 681
    Height = 296
    Align = alClient
    ColumnCollection = <
      item
        Value = 39.813035730171460000
      end
      item
        Value = 20.373928539657080000
      end
      item
        Value = 39.813035730171460000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = Panel4
        Row = 0
      end
      item
        Column = 1
        Control = Panel5
        Row = 0
      end
      item
        Column = 2
        Control = Panel6
        Row = 0
      end>
    ExpandStyle = emAddColumns
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 3
    ExplicitWidth = 513
    ExplicitHeight = 234
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 270
      Height = 294
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 264
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 268
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Currently Selected Colours'
        ExplicitWidth = 230
      end
      object lstbxMembers: TListBox
        Left = 1
        Top = 14
        Width = 268
        Height = 279
        Align = alClient
        ItemHeight = 13
        MultiSelect = True
        TabOrder = 0
        OnClick = lstbxMembersClick
        OnDblClick = lstbxMembersDblClick
        ExplicitTop = 18
        ExplicitWidth = 186
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
    end
    object Panel5: TPanel
      Left = 271
      Top = 1
      Width = 139
      Height = 294
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 79
      ExplicitTop = 18
      DesignSize = (
        139
        294)
      object btnRemove: TBitBtn
        Left = 30
        Top = 50
        Width = 81
        Height = 25
        Anchors = [akTop]
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
        TabOrder = 0
        OnClick = btnRemoveClick
      end
      object btnAdd: TBitBtn
        Left = 30
        Top = 19
        Width = 81
        Height = 25
        Anchors = [akTop]
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
    end
    object Panel6: TPanel
      Left = 410
      Top = 1
      Width = 270
      Height = 294
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 366
      ExplicitWidth = 250
      ExplicitHeight = 232
      object Label4: TLabel
        Left = 1
        Top = 1
        Width = 268
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Un-Selected Colours'
        ExplicitLeft = -23
        ExplicitTop = 5
        ExplicitWidth = 248
      end
      object lstbxNonMembers: TListBox
        Left = 1
        Top = 14
        Width = 268
        Height = 279
        Align = alClient
        ItemHeight = 13
        MultiSelect = True
        TabOrder = 0
        OnClick = lstbxNonMembersClick
        OnDblClick = lstbxNonMembersDblClick
        ExplicitLeft = -31
        ExplicitTop = 18
        ExplicitWidth = 248
        ExplicitHeight = 101
      end
      object lstbxNonMembersCodes: TListBox
        Left = 128
        Top = 28
        Width = 41
        Height = 140
        ItemHeight = 13
        TabOrder = 1
        Visible = False
      end
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
        Name = 'Customer'
      end
      item
        Name = 'Group_Number'
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
        Name = 'Customer'
      end
      item
        Name = 'Group_Number'
      end
      item
        Name = 'Worktop'
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
        Name = 'Customer'
      end
      item
        Name = 'Group_Number'
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
        Name = 'Material_Type'
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
        Name = 'Material_Type'
      end>
  end
end
