object PBMaintAccountManagerFrm: TPBMaintAccountManagerFrm
  Left = 426
  Top = 135
  BorderStyle = bsDialog
  Caption = 'Maintain Account Manager'
  ClientHeight = 113
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 20
    Width = 85
    Height = 13
    Caption = 'Account Manager'
  end
  object Label2: TLabel
    Left = 10
    Top = 56
    Width = 70
    Height = 13
    Caption = 'Account Team'
  end
  object btnOK: TBitBtn
    Left = 198
    Top = 80
    Width = 75
    Height = 25
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TBitBtn
    Left = 278
    Top = 80
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object dblkpOperators: TDBLookupComboBox
    Left = 112
    Top = 16
    Width = 200
    Height = 21
    KeyField = 'Operator'
    ListField = 'Name'
    ListSource = dtsOperators
    TabOrder = 2
    OnClick = CheckOK
  end
  object btnOperators: TBitBtn
    Left = 328
    Top = 14
    Width = 25
    Height = 25
    Hint = 'Maintain Operators'
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnOperatorsClick
  end
  object dblkpTeam: TDBLookupComboBox
    Left = 112
    Top = 48
    Width = 200
    Height = 21
    KeyField = 'Account_Team'
    ListField = 'Account_Team_Name'
    ListSource = dtsTeam
    TabOrder = 4
  end
  object btnTeam: TBitBtn
    Left = 328
    Top = 46
    Width = 25
    Height = 25
    Hint = 'Maintain Operators'
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnTeamClick
  end
  object qryOperators: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Operator.* '
      'from Operator'
      
        'where Operator not in (select Operator from User_Group_Operator ' +
        'where User_Group = 4 and Operator <> :Operator)'
      'order by name')
    Left = 200
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object dtsOperators: TDataSource
    DataSet = qryOperators
    Left = 240
    Top = 8
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into User_Group_Operator'
      '        (User_Group_Operator,'
      '        User_Group,'
      '        Operator)'
      'Values (:User_Group_Operator,'
      '            :User_Group,'
      '            :Operator)'
      ' '
      ' ')
    Left = 88
    ParamData = <
      item
        Name = 'User_Group_Operator'
      end
      item
        Name = 'User_Group'
      end
      item
        Name = 'Operator'
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(User_Group_Operator) as Last_Number'
      'from User_Group_Operator')
    Left = 120
    Top = 65528
  end
  object qryDelete: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'delete from user_group_operator'
      'where user_group_operator = :User_Group_operator')
    Left = 152
    Top = 65528
    ParamData = <
      item
        Name = 'User_Group_operator'
      end>
  end
  object qryTeam: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from Account_Team'
      'order by Account_Team_Name')
    Left = 64
    Top = 40
  end
  object dtsTeam: TDataSource
    DataSet = qryTeam
    Left = 112
    Top = 64
  end
  object qryGetAccountTeam: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Account_Team_Member'
      'where Operator = :Operator')
    Left = 160
    Top = 64
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object qryDelTeam: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'delete from Account_Team_Member'
      'where Operator = :Operator')
    Left = 8
    Top = 8
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object qryAddTeam: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'insert into Account_team_member'
      'values (:account_Team, :Member_no, :Operator)')
    Left = 16
    Top = 56
    ParamData = <
      item
        Name = 'account_Team'
      end
      item
        Name = 'Member_no'
      end
      item
        Name = 'Operator'
      end>
  end
  object qryGetMemberNo: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select max(Member_no) as Member_no'
      'from Account_Team_Member'
      'where Account_Team = :Account_Team')
    Left = 288
    Top = 32
    ParamData = <
      item
        Name = 'Account_Team'
      end>
  end
end
