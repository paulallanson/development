object frmWTSrchSuppContacts: TfrmWTSrchSuppContacts
  Left = 504
  Top = 117
  BorderStyle = bsDialog
  Caption = 'Search for Supplier contacts'
  ClientHeight = 354
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 312
    Width = 77
    Height = 13
    Caption = 'Contact Search'
  end
  object dbgdetails: TDBGrid
    Left = 8
    Top = 8
    Width = 257
    Height = 297
    DataSource = dtsDetails
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgdetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Contact_Name'
        Title.Caption = 'Contact'
        Width = 192
        Visible = True
      end>
  end
  object edtSearch: TEdit
    Left = 8
    Top = 325
    Width = 257
    Height = 21
    TabOrder = 1
    OnChange = edtSearchChange
  end
  object btnSelect: TBitBtn
    Left = 272
    Top = 292
    Width = 75
    Height = 25
    Caption = 'Select'
    ModalResult = 1
    TabOrder = 2
    OnClick = btnSelectClick
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 321
    Width = 75
    Height = 25
    Caption = '&Close'
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object btnAdd: TBitBtn
    Left = 272
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Add'
    TabOrder = 4
    OnClick = btnAddClick
  end
  object btnChange: TBitBtn
    Left = 272
    Top = 40
    Width = 75
    Height = 25
    Caption = '&Change'
    Enabled = False
    TabOrder = 5
    OnClick = btnChangeClick
  end
  object btnDelete: TBitBtn
    Left = 272
    Top = 72
    Width = 75
    Height = 25
    Caption = '&Delete'
    Enabled = False
    TabOrder = 6
    OnClick = btnDeleteClick
  end
  object qryDetails: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Supplier, Contact_no, Contact_Name'
      'from Supplier_contact'
      'where Contact_name like :Name and Supplier = :Supplier'
      'order by Contact_Name')
    Left = 80
    Top = 48
    ParamData = <
      item
        Name = 'Name'
        DataType = ftString
      end
      item
        Name = 'Supplier'
      end>
  end
  object dtsDetails: TDataSource
    DataSet = qryDetails
    Left = 144
    Top = 48
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 96
    Top = 168
  end
  object tblContacts: TFDTable
    OnNewRecord = tblContactsNewRecord
    Filtered = True
    FilterOptions = [foNoPartialCompare]
    ConnectionName = 'WT'
    TableName = 'Supplier_contact'
    Left = 80
    Top = 112
  end
  object dtstblContacts: TDataSource
    DataSet = tblContacts
    Left = 144
    Top = 112
  end
  object qryNewContact: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select max(Contact_no) '
      'from Supplier_Contact'
      'where Supplier = :Supplier')
    Left = 96
    Top = 232
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object qryContactType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * from Contact_Type'
      'Order by Contact_Type_description')
    Left = 160
    Top = 176
  end
  object dtsContactType: TDataSource
    DataSet = qryContactType
    Left = 216
    Top = 176
  end
end
