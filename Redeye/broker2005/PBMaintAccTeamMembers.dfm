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
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
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
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TBitBtn
      Left = 241
      Top = 8
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
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
      Font.Name = 'Segoe UI'
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
      Font.Name = 'Segoe UI'
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
      TabOrder = 2
      OnClick = btnAddClick
    end
    object btnRemove: TBitBtn
      Left = 191
      Top = 72
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
      TabOrder = 3
      OnClick = btnRemoveClick
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
      TabOrder = 4
      OnClick = btnAddRepClick
    end
    object btnRemoveRep: TBitBtn
      Left = 191
      Top = 72
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
      TabOrder = 5
      OnClick = btnRemoveRepClick
    end
  end
  object qryOperators: TFDQuery
    ConnectionName = 'pb'
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
  object qryAdd: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Account_Team'
      end
      item
        Name = 'Member_no'
      end
      item
        Name = 'Operator'
      end>
  end
  object qryDummy: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select User_Group_Operator.Operator, Operator.Name as Operator_N' +
        'ame'
      'from User_Group_Operator, Operator'
      'WHERE User_Group_Operator.User_Group = 4 and'
      'User_Group_Operator.Operator = Operator.Operator')
    Left = 328
    Top = 144
  end
  object qryMembers: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Account_Team_Member.*, Operator.Name as Operator_Name'
      'from Account_Team_Member, Operator'
      'where Account_Team = :Account_Team and'
      'Account_Team_Member.Operator = Operator.Operator')
    Left = 104
    Top = 88
    ParamData = <
      item
        Name = 'Account_Team'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Account_Team_Member'
      'where Account_Team = :Account_Team')
    Left = 216
    Top = 56
    ParamData = <
      item
        Name = 'Account_Team'
      end>
  end
  object qryReps: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Account_Team_Rep.*, Rep.Name as Rep_Name'
      'from Account_Team_Rep, Rep'
      'where Account_Team = :Account_Team and'
      'Account_Team_Rep.Rep = Rep.Rep')
    Left = 40
    Top = 256
    ParamData = <
      item
        Name = 'Account_Team'
      end>
  end
  object qryNonReps: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Rep.Rep, Rep.Name as Rep_Name'
      'from Rep'
      'ORDER BY Rep.Name')
    Left = 336
    Top = 256
  end
  object qryDummyRep: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Rep.Rep, Rep.Name as Rep_Name'
      'from Rep'
      'WHERE ((inactive = '#39'N'#39') or (inactive is NULL))')
    Left = 336
    Top = 312
  end
  object qryDeleteReps: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Account_Team_Rep'
      'where Account_Team = :Account_Team')
    Left = 216
    Top = 232
    ParamData = <
      item
        Name = 'Account_Team'
      end>
  end
  object qryAddReps: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Account_Team'
      end
      item
        Name = 'Rep_no'
      end
      item
        Name = 'Rep'
      end>
  end
end
