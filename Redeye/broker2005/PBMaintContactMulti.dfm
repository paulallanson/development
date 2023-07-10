object PBMaintContactMultiFrm: TPBMaintContactMultiFrm
  Left = 568
  Top = 140
  AutoScroll = False
  Caption = 'Move Customer Contacts'
  ClientHeight = 133
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 17
    Top = 20
    Width = 44
    Height = 13
    Caption = 'Customer'
  end
  object Label2: TLabel
    Left = 17
    Top = 52
    Width = 37
    Height = 13
    Caption = 'Branch '
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object dblkpBranchName: TDBLookupComboBox
    Left = 78
    Top = 48
    Width = 267
    Height = 21
    KeyField = 'Branch_no'
    ListField = 'Branch_Name'
    ListSource = dtsBranches
    TabOrder = 0
  end
  object OKBitBtn: TBitBtn
    Left = 116
    Top = 89
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = OKBitBtnClick
    NumGlyphs = 2
  end
  object CancelBitBtn: TBitBtn
    Left = 220
    Top = 89
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = CancelBitBtnClick
    NumGlyphs = 2
  end
  object ContTypeMaintBitBtn: TBitBtn
    Left = 360
    Top = 15
    Width = 25
    Height = 23
    Hint = 'Contact Type Maintenance'
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'System'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = ContTypeMaintBitBtnClick
  end
  object edtCustomerName: TEdit
    Left = 78
    Top = 16
    Width = 265
    Height = 21
    ReadOnly = True
    TabOrder = 4
    Text = 'edtCustomerName'
  end
  object qryBranches: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Branch_no, Name as Branch_Name'
      'from Customer_Branch'
      'where Customer = :Customer AND'
      
        '((Customer_Branch.inactive = '#39'N'#39') OR (Customer_Branch.inactive i' +
        's NULL) OR (Customer_Branch.inactive = '#39#39'))'
      'Order by Name')
    Left = 304
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object dtsBranches: TDataSource
    DataSet = qryBranches
    Left = 360
    Top = 80
  end
end
