object frmPBMaintAccTeamMembers: TfrmPBMaintAccTeamMembers
  Left = 344
  Top = 123
  BorderStyle = bsDialog
  Caption = 'Maintain Account Manager Teams'
  ClientHeight = 431
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 328
    Top = 80
    Width = 95
    Height = 13
    Caption = 'Available Processes'
  end
  object Panel2: TPanel
    Left = 0
    Top = 390
    Width = 468
    Height = 41
    Align = alBottom
    TabOrder = 0
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 468
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 140
      Height = 13
      Caption = 'Account Manager Team:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDetails: TLabel
      Left = 156
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
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 468
    Height = 176
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 127
      Height = 13
      Caption = 'Current Account Managers'
    end
    object Label4: TLabel
      Left = 288
      Top = 8
      Width = 152
      Height = 13
      Caption = 'Un-assigned Account Managers'
    end
    object lstbxMembers: TListBox
      Left = 8
      Top = 28
      Width = 169
      Height = 140
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
      OnClick = lstbxMembersClick
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
      Left = 191
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
      Left = 191
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
      Left = 288
      Top = 28
      Width = 169
      Height = 140
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 4
      OnClick = lstbxNonMembersClick
    end
    object lstbxNonMembersCodes: TListBox
      Left = 392
      Top = 28
      Width = 41
      Height = 140
      ItemHeight = 13
      TabOrder = 5
      Visible = False
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 217
    Width = 468
    Height = 173
    Align = alClient
    TabOrder = 3
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 62
      Height = 13
      Caption = 'Current Reps'
    end
    object Label6: TLabel
      Left = 288
      Top = 8
      Width = 87
      Height = 13
      Caption = 'Un-assigned Reps'
    end
    object lstbxReps: TListBox
      Left = 8
      Top = 25
      Width = 169
      Height = 140
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
      OnClick = lstbxRepsClick
    end
    object lstbxRepsCodes: TListBox
      Left = 128
      Top = 25
      Width = 41
      Height = 140
      ItemHeight = 13
      TabOrder = 1
      Visible = False
    end
    object lstbxNonReps: TListBox
      Left = 288
      Top = 25
      Width = 169
      Height = 140
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 2
      OnClick = lstbxNonRepsClick
    end
    object lstbxNonRepsCodes: TListBox
      Left = 392
      Top = 25
      Width = 41
      Height = 140
      ItemHeight = 13
      TabOrder = 3
      Visible = False
    end
    object btnAddRep: TBitBtn
      Left = 191
      Top = 32
      Width = 81
      Height = 25
      Caption = '&Add'
      Enabled = False
      TabOrder = 4
      OnClick = btnAddRepClick
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
    object btnRemoveRep: TBitBtn
      Left = 191
      Top = 72
      Width = 81
      Height = 25
      Caption = '&Remove'
      Enabled = False
      TabOrder = 5
      OnClick = btnRemoveRepClick
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
  end
  object qryOperators: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      
        'select User_Group_Operator.Operator, Operator.Name as Operator_N' +
        'ame'
      'from User_Group_Operator, Operator'
      'WHERE User_Group_Operator.User_Group = 4 and'
      'User_Group_Operator.Operator = Operator.Operator')
    Left = 344
    Top = 72
  end
  object dtsOperators: TDataSource
    DataSet = qryOperators
    Left = 416
    Top = 72
  end
  object qryAdd: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert into Account_Team_Member'
      '(Account_Team,'
      'Member_no,'
      'Operator'
      ')'
      'values'
      '(  :Account_Team,'
      '  :Member_no,'
      '  :Operator'
      ')'
      '')
    Left = 216
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Account_Team'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Member_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end>
  end
  object qryDummy: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      
        'select User_Group_Operator.Operator, Operator.Name as Operator_N' +
        'ame'
      'from User_Group_Operator, Operator'
      'WHERE User_Group_Operator.User_Group = 4 and'
      'User_Group_Operator.Operator = Operator.Operator')
    Left = 328
    Top = 144
  end
  object qryMembers: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select Account_Team_Member.*, Operator.Name as Operator_Name'
      'from Account_Team_Member, Operator'
      'where Account_Team = :Account_Team and'
      'Account_Team_Member.Operator = Operator.Operator')
    Left = 104
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Account_Team'
        ParamType = ptUnknown
      end>
  end
  object qryDelete: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from Account_Team_Member'
      'where Account_Team = :Account_Team')
    Left = 216
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Account_Team'
        ParamType = ptUnknown
      end>
  end
  object qryReps: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select Account_Team_Rep.*, Rep.Name as Rep_Name'
      'from Account_Team_Rep, Rep'
      'where Account_Team = :Account_Team and'
      'Account_Team_Rep.Rep = Rep.Rep')
    Left = 40
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Account_Team'
        ParamType = ptUnknown
      end>
  end
  object qryNonReps: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select Rep.Rep, Rep.Name as Rep_Name'
      'from Rep'
      'ORDER BY Rep.Name')
    Left = 336
    Top = 256
  end
  object qryDummyRep: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'select Rep.Rep, Rep.Name as Rep_Name'
      'from Rep'
      'WHERE ((inactive = '#39'N'#39') or (inactive is NULL))')
    Left = 336
    Top = 312
  end
  object qryDeleteReps: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from Account_Team_Rep'
      'where Account_Team = :Account_Team')
    Left = 216
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Account_Team'
        ParamType = ptUnknown
      end>
  end
  object qryAddReps: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert into Account_Team_Rep'
      '(Account_Team,'
      'Rep_no,'
      'Rep'
      ')'
      'values'
      '(  :Account_Team,'
      '  :Rep_no,'
      '  :Rep'
      ')'
      '')
    Left = 216
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Account_Team'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
end
