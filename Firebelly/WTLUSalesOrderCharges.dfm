object frmWTLUSalesOrderCharges: TfrmWTLUSalesOrderCharges
  Left = 0
  Top = 0
  Caption = 'Raise Sales Order Associate Charges'
  ClientHeight = 608
  ClientWidth = 1273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object stBrDetails: TStatusBar
    Left = 0
    Top = 589
    Width = 1273
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 580
    ExplicitWidth = 1267
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 536
    Width = 1273
    Height = 53
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 527
    ExplicitWidth = 1267
    DesignSize = (
      1273
      53)
    object Label1: TLabel
      Left = 8
      Top = 22
      Width = 34
      Height = 13
      Caption = 'Search'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnSweep: TButton
      Left = 264
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Sweep'
      Enabled = False
      TabOrder = 0
      OnClick = btnSweepClick
    end
    object btnExcel: TButton
      Left = 472
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'E&xcel'
      Enabled = False
      TabOrder = 1
      OnClick = btnExcelClick
    end
    object btnClose: TButton
      Left = 1150
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      ModalResult = 2
      TabOrder = 2
      ExplicitLeft = 1144
    end
    object btnSelect: TButton
      Left = 1045
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Select'
      Enabled = False
      TabOrder = 3
      OnClick = btnSelectClick
      ExplicitLeft = 1039
    end
    object edtSearch: TEdit
      Left = 48
      Top = 16
      Width = 193
      Height = 23
      TabOrder = 4
      OnChange = edtSearchChange
    end
    object btnDeselect: TButton
      Left = 368
      Top = 16
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&De-Select'
      Enabled = False
      TabOrder = 5
      OnClick = btnDeSelectClick
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1273
    Height = 97
    Align = alTop
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      1273
      97)
    object CustomerLbl: TLabel
      Left = 8
      Top = 30
      Width = 105
      Height = 15
      Caption = 'Associate Customer'
    end
    object edtCustomer: TEdit
      Left = 128
      Top = 26
      Width = 233
      Height = 23
      ReadOnly = True
      TabOrder = 0
    end
    object btnCustomer: TBitBtn
      Left = 368
      Top = 26
      Width = 23
      Height = 23
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCustomerClick
    end
    object grpInvDate: TGroupBox
      Left = 974
      Top = 18
      Width = 233
      Height = 73
      Anchors = [akTop, akRight]
      Caption = 'Fitting Date'
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        233
        73)
      object Label4: TLabel
        Left = 20
        Top = 21
        Width = 31
        Height = 15
        Anchors = [akRight, akBottom]
        Caption = 'From:'
      end
      object Label5: TLabel
        Left = 19
        Top = 49
        Width = 16
        Height = 15
        Anchors = [akRight, akBottom]
        Caption = 'To:'
      end
      object DateFromButton: TSpeedButton
        Left = 192
        Top = 11
        Width = 25
        Height = 25
        Anchors = [akRight, akBottom]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
          F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
          F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
          F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
          F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
          F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
          F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
          333337FFFFFFFF77333330000000000333333777777777733333}
        NumGlyphs = 2
        OnClick = edtDateToExit
      end
      object DateToButton: TSpeedButton
        Left = 192
        Top = 39
        Width = 25
        Height = 25
        Anchors = [akRight, akBottom]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
          F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
          F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
          F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
          F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
          F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
          F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
          333337FFFFFFFF77333330000000000333333777777777733333}
        NumGlyphs = 2
        OnClick = DateToButtonClick
      end
      object edtDateFrom: TEdit
        Left = 87
        Top = 13
        Width = 98
        Height = 23
        Anchors = [akRight, akBottom]
        MaxLength = 10
        TabOrder = 0
        OnExit = edtDateFromExit
      end
      object edtDateTo: TEdit
        Left = 87
        Top = 41
        Width = 98
        Height = 23
        Anchors = [akRight, akBottom]
        MaxLength = 10
        TabOrder = 1
        OnExit = edtDateToExit
      end
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 97
    Width = 1273
    Height = 439
    Align = alClient
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgDetailsDrawColumnCell
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Sales_order'
        Title.Caption = 'Sales Order'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Raised'
        Title.Caption = 'Order Date'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Associate_Customer_Name'
        Title.Caption = 'Associate Customer'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descriptive_Reference'
        Title.Caption = 'Description'
        Width = 186
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Reference'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Template_Date'
        Title.Caption = 'Template Date'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Required'
        Title.Caption = 'Fitting Date'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Product_Code'
        Title.Caption = 'Product Code'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Product_Description'
        Title.Caption = 'Product Description'
        Width = 234
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit_Price'
        Title.Caption = 'Price'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Width = 57
        Visible = True
      end>
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 504
    Top = 160
  end
end
