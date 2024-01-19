object frmWTLUStore: TfrmWTLUStore
  Left = 444
  Top = 160
  BorderStyle = bsDialog
  Caption = 'Stores'
  ClientHeight = 369
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 303
    Height = 276
    Align = alClient
    DataSource = srcStore
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Address_Name'
        Title.Caption = 'Store Name'
        Width = 272
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inactive'
        Visible = False
      end>
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 350
    Width = 392
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 352
    ExplicitWidth = 400
  end
  object Panel1: TPanel
    Left = 0
    Top = 276
    Width = 392
    Height = 74
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 278
    ExplicitWidth = 400
    DesignSize = (
      392
      74)
    object Label4: TLabel
      Left = 8
      Top = 20
      Width = 34
      Height = 13
      Caption = 'Search'
    end
    object chkbxShowInactive: TCheckBox
      Left = 8
      Top = 50
      Width = 169
      Height = 17
      Caption = 'Show inactive stores'
      TabOrder = 0
      OnClick = chkbxShowInactiveClick
    end
    object BitBtn4: TBitBtn
      Left = 414
      Top = 41
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
    object edtName: TEdit
      Left = 56
      Top = 16
      Width = 177
      Height = 21
      TabOrder = 2
      OnChange = edtNameChange
    end
    object BitBtn2: TBitBtn
      Left = 317
      Top = 33
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Close'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 303
    Top = 0
    Width = 89
    Height = 276
    Align = alRight
    TabOrder = 3
    ExplicitLeft = 311
    ExplicitHeight = 278
    DesignSize = (
      89
      276)
    object BitBtn1: TBitBtn
      Left = 8
      Top = 86
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Add'
      TabOrder = 0
      OnClick = BitBtn1Click
      ExplicitTop = 88
    end
    object btnEdit: TBitBtn
      Left = 6
      Top = 126
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Edit'
      TabOrder = 1
      OnClick = btnEditClick
      ExplicitTop = 128
    end
    object btnDelete: TBitBtn
      Left = 6
      Top = 166
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Delete'
      TabOrder = 2
      OnClick = btnDeleteClick
      ExplicitTop = 168
    end
    object btnExcel: TBitBtn
      Left = 6
      Top = 206
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Excel'
      TabOrder = 3
      OnClick = btnExcelClick
      ExplicitTop = 208
    end
    object btnSelect: TBitBtn
      Left = 6
      Top = 244
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Select'
      TabOrder = 4
      OnClick = btnSelectClick
      ExplicitTop = 246
    end
  end
  object srcStore: TDataSource
    DataSet = qryStore
    OnDataChange = srcStoreDataChange
    Left = 136
    Top = 56
  end
  object qryStore: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Store.Store,'
      '        Store.Address,'
      '        Store.inactive,'
      '        Address.Address_name,'
      '        Address.Street,'
      '        Address.Locale,'
      '        Address.Town_city,'
      '        Address.Postcode,'
      '        Address.County_State,'
      '        Address.Telephone_number,'
      '        Address.Fax_number,'
      '        Address.Web_Address,'
      '        Address.Email_Address,'
      '        Address.Date_Created'
      'FROM Address'
      '        INNER JOIN Store'
      '          ON Address.Address = Store.Address'
      
        'WHERE ((Store.inactive = :inactive) or (Store.inactive is NULL) ' +
        'or (Store.inactive = '#39'N'#39')) AND'
      #9#9'(Address.Address_Name LIKE :Description)'
      'ORDER BY Address.Address_Name')
    Left = 80
    Top = 56
    ParamData = <
      item
        Name = 'inactive'
      end
      item
        Name = 'Description'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    Left = 304
    Top = 56
  end
  object tmrRefresh: TTimer
    Interval = 250
    OnTimer = tmrRefreshTimer
    Left = 168
    Top = 120
  end
end
