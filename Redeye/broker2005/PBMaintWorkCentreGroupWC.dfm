object PBMaintWorkCentreGroupWCFrm: TPBMaintWorkCentreGroupWCFrm
  Left = 659
  Top = 120
  BorderStyle = bsDialog
  Caption = 'Maintain Work Centres'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 102
    Height = 13
    Caption = 'Current Work Centres'
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
    Width = 114
    Height = 13
    Caption = 'Work Centre Group:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDetails: TLabel
    Left = 128
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
    Width = 127
    Height = 13
    Caption = 'Un-assigned Work Centres'
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
  object qryWorkCentres: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Work_Centre.*'
      'from Work_Centre')
    Left = 344
    Top = 48
  end
  object dtsWCGroups: TDataSource
    DataSet = qryWorkCentres
    Left = 416
    Top = 48
  end
  object qryAdd: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Work_Centre_WC_Group'
      '(Work_Centre,'
      'Work_Centre_Group,'
      'Inactive'
      ')'
      'values'
      '(  :Work_Centre,'
      '  :Work_Centre_Group,'
      '  :Inactive'
      ')')
    Left = 192
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Work_Centre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Work_Centre_Group'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inactive'
        ParamType = ptUnknown
      end>
  end
  object qryDummy: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Work_Centre.*'
      'from Work_Centre'
      'WHERE 1=1')
    Left = 328
    Top = 120
  end
  object qryMembers: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Work_Centre_WC_Group.*, Work_Centre_Name'
      'from Work_Centre_WC_Group, Work_Centre'
      'where Work_Centre_Group = :Work_Centre_Group and'
      'Work_Centre_WC_Group.Work_Centre = Work_Centre.Work_Centre')
    Left = 104
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Work_Centre_Group'
        ParamType = ptUnknown
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Work_Centre_WC_Group'
      'where Work_Centre_Group = :Work_Centre_Group')
    Left = 192
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Work_Centre_Group'
        ParamType = ptUnknown
      end>
  end
end
