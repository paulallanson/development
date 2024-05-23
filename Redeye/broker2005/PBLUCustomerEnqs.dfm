object PBLUCustomerEnqsFrm: TPBLUCustomerEnqsFrm
  Left = 200
  Top = 102
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Enquiries'
  ClientHeight = 375
  ClientWidth = 855
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
  OnShow = FormShow
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 855
    Height = 315
    Align = alClient
    DataSource = dtmdlEnqs.dtsEnqsJB
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
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
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Enquiry'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Line'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Point'
        Title.Caption = 'Date'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 313
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status_Description'
        Title.Caption = 'Status'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Rep_Name'
        Title.Caption = 'Rep'
        Width = 91
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 315
    Width = 855
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 852
    DesignSize = (
      855
      41)
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 96
      Height = 13
      Caption = 'Description Search'
    end
    object Label2: TLabel
      Left = 508
      Top = 13
      Width = 82
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Enquiry number'
    end
    object btnClose: TButton
      Left = 775
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 2
      OnClick = btnCloseClick
    end
    object edtSearch: TEdit
      Left = 110
      Top = 10
      Width = 180
      Height = 21
      TabOrder = 0
      OnChange = edtSearchChange
    end
    object edtNumber: TEdit
      Left = 596
      Top = 10
      Width = 90
      Height = 21
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnKeyPress = edtNumberKeyPress
    end
    object btnSelect: TButton
      Left = 694
      Top = 8
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
    Top = 356
    Width = 855
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitWidth = 852
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 325
    OnTimer = tmrSearchTimer
    Left = 368
    Top = 128
  end
end
