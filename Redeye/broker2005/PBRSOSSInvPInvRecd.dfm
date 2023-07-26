object PBRSOSSInvPInvRecdFrm: TPBRSOSSInvPInvRecdFrm
  Left = 248
  Top = 247
  Width = 667
  Height = 256
  Caption = 'Oustanding Invoicing - Purchase Invoice Received Report'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 156
    Width = 33
    Height = 13
    Caption = 'Sort by'
  end
  object Label2: TLabel
    Left = 464
    Top = 120
    Width = 161
    Height = 26
    Caption = 'Show where order status equal or greater than'
    WordWrap = True
  end
  object PrintBitBtn: TBitBtn
    Left = 576
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Print'
    TabOrder = 0
    OnClick = PrintBitBtnClick
  end
  object PreviewBitBtn: TBitBtn
    Left = 488
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Preview'
    TabOrder = 1
    OnClick = PreviewBitBtnClick
  end
  object pnlRepSearch: TPanel
    Left = 147
    Top = 16
    Width = 302
    Height = 57
    TabOrder = 2
    Visible = False
    object lblCustBran: TLabel
      Left = 8
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Rep Name'
    end
    object edtRep: TEdit
      Left = 8
      Top = 24
      Width = 257
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnRep: TButton
      Left = 272
      Top = 24
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnRepClick
    end
  end
  object CancelBitBtn: TBitBtn
    Left = 8
    Top = 184
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
  object rdgrpRep: TRadioGroup
    Left = 8
    Top = 8
    Width = 129
    Height = 65
    Caption = 'Rep'
    ItemIndex = 0
    Items.Strings = (
      'All Reps'
      'One Rep')
    TabOrder = 4
    OnClick = rdgrpRepClick
  end
  object pnlCustSearch: TPanel
    Left = 147
    Top = 81
    Width = 302
    Height = 58
    TabOrder = 5
    Visible = False
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 89
      Height = 13
      Caption = 'Customer / Branch'
    end
    object edtCust: TEdit
      Left = 8
      Top = 24
      Width = 257
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnCustLU: TButton
      Left = 272
      Top = 24
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCustLUClick
    end
  end
  object rdgrpCust: TRadioGroup
    Left = 8
    Top = 74
    Width = 129
    Height = 65
    Caption = 'Customer'
    ItemIndex = 0
    Items.Strings = (
      'All Customers'
      'One Customer')
    TabOrder = 6
    OnClick = rdgrpCustClick
  end
  object cmboSort: TComboBox
    Left = 56
    Top = 152
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 7
    OnChange = cmboSortChange
    Items.Strings = (
      'Order no'
      'Rep'
      'Customer'
      'Order Status'
      'Supplier'
      'Account Manager')
  end
  object chkbxPagebreak: TCheckBox
    Left = 224
    Top = 154
    Width = 169
    Height = 17
    Caption = 'page break on sort type'
    Enabled = False
    TabOrder = 8
  end
  object rdgrpOrders: TRadioGroup
    Left = 462
    Top = 11
    Width = 185
    Height = 89
    Caption = 'Include '
    ItemIndex = 0
    Items.Strings = (
      'All Orders'
      'Only Orders NOT IN Job Bags'
      'Only Orders IN Job Bags')
    TabOrder = 9
  end
  object dblkpStatus: TDBLookupComboBox
    Left = 464
    Top = 152
    Width = 185
    Height = 21
    KeyField = 'Status'
    ListField = 'Description'
    ListSource = dtsStatus
    TabOrder = 10
  end
  object chkbxExcludeZeroValues: TCheckBox
    Left = 224
    Top = 176
    Width = 177
    Height = 17
    Caption = 'Exclude zero sales values'
    TabOrder = 11
  end
  object dtsStatus: TDataSource
    DataSet = qryPOStatus
    Left = 576
    Top = 112
  end
  object qryPOStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select purch_ord_Line_status.purch_ord_Line_status as Status,'
      'purch_ord_Line_status.Description '
      'from purch_ord_Line_status'
      'where purch_ord_line_status > 10 and'
      'purch_ord_line_status < 30'
      'order by purch_ord_Line_status')
    Left = 616
    Top = 112
  end
end
