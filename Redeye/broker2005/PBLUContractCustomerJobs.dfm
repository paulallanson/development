object PBLUContractCustomerJobsFrm: TPBLUContractCustomerJobsFrm
  Left = 288
  Top = 127
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Insert Contract Job Bags'
  ClientHeight = 373
  ClientWidth = 817
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 313
    Width = 817
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      817
      41)
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 96
      Height = 13
      Caption = 'Description Search'
    end
    object Label2: TLabel
      Left = 448
      Top = 16
      Width = 84
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Job Bag Number'
      ExplicitLeft = 454
    end
    object btnClose: TButton
      Left = 728
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 2
      OnClick = btnCloseClick
    end
    object edtSearch: TEdit
      Left = 104
      Top = 12
      Width = 169
      Height = 21
      TabOrder = 0
      OnChange = edtSearchChange
    end
    object edtJobBag: TEdit
      Left = 542
      Top = 12
      Width = 90
      Height = 21
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnKeyPress = edtJobBagKeyPress
    end
    object btnSelect: TButton
      Left = 640
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Select'
      TabOrder = 3
      OnClick = btnSelectClick
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 354
    Width = 817
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
    Top = 0
    Width = 817
    Height = 313
    Align = alClient
    DrawingStyle = gdsGradient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Job_Bag'
        Title.Caption = 'Job Bag'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Point'
        Title.Caption = 'Date'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Job_Bag_Descr'
        Title.Caption = 'Description'
        Width = 417
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cust_Order_no'
        Title.Caption = 'Order Number'
        Width = 82
        Visible = True
      end>
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 325
    OnTimer = tmrSearchTimer
    Left = 368
    Top = 128
  end
end
