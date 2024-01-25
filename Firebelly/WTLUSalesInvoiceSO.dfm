object frmWTLUSalesInvoiceSO: TfrmWTLUSalesInvoiceSO
  Left = 215
  Top = 81
  Caption = 'Sales order selection'
  ClientHeight = 434
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object stbrDetails: TStatusBar
    Left = 0
    Top = 415
    Width = 984
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 100
      end>
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 984
    Height = 277
    Align = alClient
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Sales_Order'
        Title.Caption = 'Sales Order'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Raised'
        Title.Caption = 'Order Date'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer_Name'
        Title.Caption = 'Customer'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descriptive_Reference'
        Title.Caption = 'Description'
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Reference'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sales_Order_Status_Desc'
        Title.Caption = 'Order Status'
        Width = 190
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Required'
        Title.Caption = 'Required Date'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Revenue_Centre_Descr'
        Title.Caption = 'Revenue Centre'
        Width = 119
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 277
    Width = 984
    Height = 138
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    object chkbxShow: TCheckBox
      Left = 8
      Top = 41
      Width = 273
      Height = 17
      Caption = 'Show orders not yet fitted'
      TabOrder = 0
      OnClick = chkbxShowClick
    end
    object chkbxShowFutureOrders: TCheckBox
      Left = 8
      Top = 13
      Width = 273
      Height = 17
      Caption = 'Show future fitted orders'
      TabOrder = 1
      OnClick = chkbxShowClick
    end
    object pnlFooter: TPanel
      Left = 1
      Top = 84
      Width = 982
      Height = 53
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        982
        53)
      object Label1: TLabel
        Left = 657
        Top = 18
        Width = 59
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Sales Order'
      end
      object CustomerGroupBox: TGroupBox
        Left = 8
        Top = 0
        Width = 385
        Height = 49
        Caption = 'Type here to narrow the search'
        ParentBackground = False
        TabOrder = 0
        object Label2: TLabel
          Left = 24
          Top = 22
          Width = 49
          Height = 13
          Caption = 'Customer'
        end
        object edtCustomerName: TEdit
          Left = 72
          Top = 18
          Width = 209
          Height = 21
          TabOrder = 0
          OnChange = edtCustomerNameChange
        end
        object btnSweep: TBitBtn
          Left = 296
          Top = 16
          Width = 75
          Height = 25
          Caption = 'S&weep'
          Enabled = False
          TabOrder = 1
          OnClick = btnSweepClick
        end
      end
      object btnExcel: TBitBtn
        Left = 406
        Top = 12
        Width = 75
        Height = 25
        Caption = 'Excel'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333FFFFFFFFFFFFFFF000000000000000077777777777777770FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07F3FF3FF3FF3FFF70F00F00F00F000F07F773773773777370FFFFFFFFFFF
          FFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC07777777777777777088CCCCCCCCC
          C8807FF7777777777FF700000000000000007777777777777777333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnExcelClick
      end
      object edtSONumber: TEdit
        Left = 721
        Top = 14
        Width = 89
        Height = 21
        Anchors = [akRight, akBottom]
        TabOrder = 2
        OnKeyPress = edtSONumberKeyPress
      end
      object btnSelect: TBitBtn
        Left = 820
        Top = 12
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Select'
        ModalResult = 1
        TabOrder = 3
        OnClick = btnSelectClick
      end
      object btnClose: TBitBtn
        Left = 908
        Top = 12
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Close'
        ModalResult = 2
        TabOrder = 4
        OnClick = btnCloseClick
      end
    end
    object pnlRevenueCentre: TPanel
      Left = 600
      Top = 1
      Width = 383
      Height = 83
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 3
      object rdgrpRevenueCentre: TRadioGroup
        Left = 40
        Top = 3
        Width = 121
        Height = 73
        Caption = 'Revenue Centre '
        ItemIndex = 0
        Items.Strings = (
          'Default'
          'All'
          'Selected')
        ParentBackground = False
        TabOrder = 0
        OnClick = rdgrpRevenueCentreClick
      end
      object grpbxRevCentre: TGroupBox
        Left = 166
        Top = 3
        Width = 203
        Height = 73
        ParentBackground = False
        TabOrder = 1
        Visible = False
        object Label3: TLabel
          Left = 8
          Top = 12
          Width = 81
          Height = 13
          Caption = 'Revenue Centre'
        end
        object dblkpRevCentre: TDBLookupComboBox
          Left = 8
          Top = 32
          Width = 185
          Height = 21
          KeyField = 'Revenue_Centre'
          ListField = 'Revenue_Centre_Descr'
          TabOrder = 0
          OnClick = dblkpRevCentreClick
        end
      end
    end
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 264
    Top = 48
  end
end
