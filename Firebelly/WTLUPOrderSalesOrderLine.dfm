object frmWTLUPOrderSalesOrderLine: TfrmWTLUPOrderSalesOrderLine
  Left = 218
  Top = 90
  Caption = 'Select Sales Order Line'
  ClientHeight = 441
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 38
      Height = 13
      Caption = 'Supplier'
    end
    object Label3: TLabel
      Left = 680
      Top = 20
      Width = 86
      Height = 13
      Caption = 'Sales Order Fitting'
    end
    object edtSupplier: TEdit
      Left = 72
      Top = 16
      Width = 273
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object dtFitting: TDateTimePicker
      Left = 784
      Top = 16
      Width = 97
      Height = 21
      Date = 39470.000000000000000000
      Time = 0.402405902779719300
      TabOrder = 1
      OnChange = dtFittingChange
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 372
    Width = 912
    Height = 50
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      912
      50)
    object Label2: TLabel
      Left = 16
      Top = 20
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object edtCustomerName: TEdit
      Left = 72
      Top = 16
      Width = 209
      Height = 21
      TabOrder = 0
      OnChange = edtCustomerNameChange
    end
    object btbtnClose: TBitBtn
      Left = 834
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btbtnCloseClick
    end
    object btnSelect: TBitBtn
      Left = 746
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Select'
      Default = True
      Enabled = False
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnSelectClick
    end
    object btnSweep: TBitBtn
      Left = 296
      Top = 14
      Width = 75
      Height = 25
      Caption = 'S&weep'
      Enabled = False
      TabOrder = 3
      OnClick = btnSweepClick
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 422
    Width = 912
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 65
    Width = 912
    Height = 307
    Align = alClient
    DataSource = dtmdlPurchaseOrder.dtsGetSOLines
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Sales_Order'
        Title.Caption = 'Sales Order'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Required'
        Title.Caption = 'Required'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer_Name'
        Title.Caption = 'Customer'
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Slab_Description'
        Title.Caption = 'Description'
        Width = 267
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Length'
        Title.Caption = 'Slab Length'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Depth'
        Title.Caption = 'Slab Depth'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total_Slabs_Ordered'
        Title.Caption = 'Slabs On Order'
        Width = 85
        Visible = True
      end>
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 400
    Top = 160
  end
end
