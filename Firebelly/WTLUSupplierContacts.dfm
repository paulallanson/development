object frmWTLUSupplierContacts: TfrmWTLUSupplierContacts
  Left = 524
  Top = 163
  BorderStyle = bsDialog
  Caption = 'Supplier Contacts'
  ClientHeight = 382
  ClientWidth = 383
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 17
  object Label1: TLabel
    Left = 8
    Top = 312
    Width = 87
    Height = 17
    Caption = 'Contact Search'
  end
  object dbgdetails: TDBGrid
    Left = 8
    Top = 8
    Width = 257
    Height = 297
    DataSource = dtsDetails
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
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
  object btnAdd: TBitBtn
    Left = 282
    Top = 8
    Width = 75
    Height = 25
    Caption = '&Add'
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnChange: TBitBtn
    Left = 282
    Top = 40
    Width = 75
    Height = 25
    Caption = '&Change'
    Enabled = False
    TabOrder = 2
    OnClick = btnChangeClick
  end
  object btnDelete: TBitBtn
    Left = 282
    Top = 72
    Width = 75
    Height = 25
    Caption = '&Delete'
    Enabled = False
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object btnSelect: TBitBtn
    Left = 282
    Top = 309
    Width = 75
    Height = 25
    Caption = 'Select'
    ModalResult = 1
    TabOrder = 4
    OnClick = btnSelectClick
  end
  object BitBtn2: TBitBtn
    Left = 282
    Top = 338
    Width = 75
    Height = 25
    Caption = '&Close'
    NumGlyphs = 2
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object edtSearch: TEdit
    Left = 8
    Top = 335
    Width = 257
    Height = 25
    TabOrder = 6
    OnChange = edtSearchChange
  end
  object qryDetails: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
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
    Left = 152
    Top = 48
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 80
    Top = 176
  end
  object qryContactType: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * from Contact_Type'
      'Order by Contact_Type_description')
    Left = 96
    Top = 240
  end
  object dtsContactType: TDataSource
    DataSet = qryContactType
    Left = 152
    Top = 240
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 292
    Top = 140
  end
end
