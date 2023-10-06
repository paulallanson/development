object PBMaintEmailSupplierFrm: TPBMaintEmailSupplierFrm
  Left = 128
  Top = 70
  BorderStyle = bsDialog
  Caption = 'Supplier Email details'
  ClientHeight = 223
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    516
    223)
  TextHeight = 13
  object grpbxContact: TGroupBox
    Left = 8
    Top = 8
    Width = 497
    Height = 121
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 60
      Width = 37
      Height = 13
      Caption = 'Contact'
    end
    object Label2: TLabel
      Left = 8
      Top = 92
      Width = 25
      Height = 13
      Caption = 'Email'
    end
    object Label4: TLabel
      Left = 8
      Top = 26
      Width = 38
      Height = 13
      Caption = 'Supplier'
    end
    object edtEmail: TEdit
      Left = 64
      Top = 88
      Width = 425
      Height = 21
      TabOrder = 0
      OnChange = EnableOK
    end
    object dblkpContacts: TDBLookupComboBox
      Left = 64
      Top = 56
      Width = 233
      Height = 21
      KeyField = 'Contact_no'
      ListField = 'Name'
      ListSource = dtsContacts
      TabOrder = 1
    end
    object dblkpSuppliers: TDBLookupComboBox
      Left = 64
      Top = 24
      Width = 233
      Height = 21
      KeyField = 'Supplier'
      ListField = 'Name'
      ListSource = dtsSuppliers
      TabOrder = 2
      OnClick = dblkpSuppliersClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 130
    Width = 497
    Height = 49
    Anchors = [akLeft, akBottom]
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 20
      Width = 36
      Height = 13
      Caption = 'Subject'
    end
    object edtSubject: TEdit
      Left = 64
      Top = 16
      Width = 425
      Height = 21
      TabOrder = 0
      OnChange = EnableOK
    end
  end
  object btnOK: TBitBtn
    Left = 177
    Top = 186
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object btnCancel: TBitBtn
    Left = 265
    Top = 186
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object qrySContacts: TFDQuery
    MasterSource = dtsSuppliers
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct Contact_no, Name, Email'
      'from Supplier_BranchContacts'
      'where Supplier = :Supplier'
      'Order By Name'
      '')
    Left = 456
    Top = 64
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
      end>
  end
  object dtsContacts: TDataSource
    DataSet = qrySContacts
    OnDataChange = dtsContactsDataChange
    Left = 392
    Top = 64
  end
  object qrySuppliers: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct supplier, Name'
      'from Supplier'
      'where 1 = 1'
      ''
      '')
    Left = 456
    Top = 16
  end
  object dtsSuppliers: TDataSource
    DataSet = qrySuppliers
    Left = 392
    Top = 16
  end
  object qryCContacts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct Contact_no, Name, Email'
      'from customer_Contact'
      'where customer = :Customer'
      'Order By Name')
    Left = 368
    Top = 120
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
end
