object PBMaintEmailSupplierFrm: TPBMaintEmailSupplierFrm
  Left = 128
  Top = 70
  BorderStyle = bsDialog
  Caption = 'Supplier Email details'
  ClientHeight = 223
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    514
    223)
  TextHeight = 17
  object grpbxContact: TGroupBox
    Left = 8
    Top = 8
    Width = 497
    Height = 121
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 60
      Width = 44
      Height = 17
      Caption = 'Contact'
    end
    object Label2: TLabel
      Left = 8
      Top = 92
      Width = 31
      Height = 17
      Caption = 'Email'
    end
    object Label4: TLabel
      Left = 8
      Top = 26
      Width = 48
      Height = 17
      Caption = 'Supplier'
    end
    object edtEmail: TEdit
      Left = 64
      Top = 88
      Width = 425
      Height = 25
      TabOrder = 0
      OnChange = EnableOK
    end
    object dblkpContacts: TDBLookupComboBox
      Left = 64
      Top = 56
      Width = 233
      Height = 25
      KeyField = 'Contact_no'
      ListField = 'Name'
      ListSource = dtsContacts
      TabOrder = 1
    end
    object dblkpSuppliers: TDBLookupComboBox
      Left = 64
      Top = 24
      Width = 233
      Height = 25
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
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 121
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
    Top = 186
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    ExplicitTop = 177
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
    ExplicitTop = 177
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
    Left = 370
    Top = 24
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
      end>
  end
  object dtsContacts: TDataSource
    DataSet = qrySContacts
    OnDataChange = dtsContactsDataChange
    Left = 322
    Top = 32
  end
  object qrySuppliers: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct supplier, Name'
      'from Supplier'
      'where 1 = 1'
      ''
      '')
    Left = 250
    Top = 36
  end
  object dtsSuppliers: TDataSource
    DataSet = qrySuppliers
    Left = 394
    Top = 36
  end
  object qryCContacts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct Contact_no, Name, Email'
      'from customer_Contact'
      'where customer = :Customer'
      'Order By Name')
    Left = 220
    Top = 30
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
end
