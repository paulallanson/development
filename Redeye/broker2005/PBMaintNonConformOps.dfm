object PBMaintNonConformOpsFrm: TPBMaintNonConformOpsFrm
  Left = 344
  Top = 123
  BorderStyle = bsDialog
  Caption = 'Maintain Non Conformance Recipients'
  ClientHeight = 316
  ClientWidth = 468
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
    Left = 8
    Top = 16
    Width = 112
    Height = 13
    Caption = 'Current NCA Recipients'
  end
  object Label2: TLabel
    Left = 328
    Top = 56
    Width = 95
    Height = 13
    Caption = 'Available Processes'
  end
  object Label4: TLabel
    Left = 288
    Top = 16
    Width = 108
    Height = 13
    Caption = 'Un-assigned Operators'
  end
  object lstbxMembers: TListBox
    Left = 8
    Top = 32
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
    Left = 191
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
    Left = 288
    Top = 32
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
    Top = 275
    Width = 468
    Height = 41
    Align = alBottom
    TabOrder = 4
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
  object lstbxMembersCodes: TListBox
    Left = 128
    Top = 32
    Width = 41
    Height = 225
    ItemHeight = 13
    TabOrder = 5
    Visible = False
  end
  object lstbxNonMembersCodes: TListBox
    Left = 392
    Top = 32
    Width = 41
    Height = 225
    ItemHeight = 13
    TabOrder = 6
    Visible = False
  end
  object qryOperators: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Operator, Operator.Name as Operator_Name'
      'from Operator'
      'where Operator.Operator_Can_Login = '#39'Y'#39)
    Left = 344
    Top = 48
  end
  object dtsOperators: TDataSource
    DataSet = qryOperators
    Left = 416
    Top = 48
  end
  object qryAdd: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Non_Conform_Operator'
      '(Non_Conform_Operator,'
      'Operator,'
      'Inactive'
      ')'
      'Select ISNULL(Max(Non_Conform_Operator),0)+1, :Operator, '#39'N'#39
      'From Non_Conform_Operator'
      '')
    Left = 192
    Top = 216
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object qryDummy: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Operator, Operator.Name as Operator_Name'
      'from Operator'
      'where Operator.Operator_Can_Login = '#39'Y'#39)
    Left = 328
    Top = 120
  end
  object qryMembers: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Non_Conform_Operator.*, Operator.Name as Operator_Name'
      'from Non_Conform_Operator, Operator'
      'where Non_Conform_Operator.Operator = Operator.Operator')
    Left = 104
    Top = 64
  end
  object qryDelete: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Non_Conform_Operator')
    Left = 192
    Top = 160
  end
end
