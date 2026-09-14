object PBMaintPOEmailFrm: TPBMaintPOEmailFrm
  Left = 128
  Top = 70
  BorderStyle = bsDialog
  Caption = 'Email details'
  ClientHeight = 206
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  object rgAddressType: TRadioGroup
    Left = 8
    Top = 8
    Width = 121
    Height = 77
    Caption = 'Address type'
    ItemIndex = 0
    Items.Strings = (
      'Supplier'
      'Customer')
    ParentBackground = False
    TabOrder = 0
    OnClick = rgAddressTypeClick
  end
  object grpbxContact: TGroupBox
    Left = 136
    Top = 8
    Width = 369
    Height = 89
    Caption = 'Supplier'
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 28
      Width = 44
      Height = 17
      Caption = 'Contact'
    end
    object Label2: TLabel
      Left = 8
      Top = 60
      Width = 31
      Height = 17
      Caption = 'Email'
    end
    object edtEmail: TEdit
      Left = 59
      Top = 56
      Width = 297
      Height = 25
      TabOrder = 1
      OnChange = EnableOK
    end
    object dblkpContacts: TDBLookupComboBox
      Left = 59
      Top = 24
      Width = 233
      Height = 25
      KeyField = 'Contact_no'
      ListField = 'Name'
      ListSource = dtsContacts
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 104
    Width = 497
    Height = 49
    ParentBackground = False
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 20
      Width = 42
      Height = 17
      Caption = 'Subject'
    end
    object edtSubject: TEdit
      Left = 64
      Top = 16
      Width = 425
      Height = 25
      TabOrder = 0
      OnChange = EnableOK
    end
  end
  object btnOK: TBitBtn
    Left = 177
    Top = 160
    Width = 75
    Height = 25
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 3
  end
  object btnCancel: TBitBtn
    Left = 265
    Top = 160
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
  end
  object qrySContacts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct Contact_no, Name, Email'
      'from Supplier_BranchContacts'
      'where Supplier = :Supplier'
      'Order By Name'
      '')
    Left = 424
    Top = 32
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
      end>
  end
  object qryCContacts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct Contact_no, Name, Email'
      'from customer_Contact'
      'where customer = :Customer'
      'Order By Name')
    Left = 352
    Top = 32
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
  object dtsContacts: TDataSource
    DataSet = qrySContacts
    OnDataChange = dtsContactsDataChange
    Left = 456
    Top = 104
  end
end
