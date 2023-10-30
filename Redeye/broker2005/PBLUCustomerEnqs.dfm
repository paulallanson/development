object PBLUCustomerEnqsFrm: TPBLUCustomerEnqsFrm
  Left = 200
  Top = 102
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Enquiries'
  ClientHeight = 375
  ClientWidth = 852
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
    Width = 852
    Height = 315
    Align = alClient
    DataSource = dtmdlEnqs.dtsEnqsJB
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
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
    Width = 852
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 306
    ExplicitWidth = 846
    DesignSize = (
      852
      41)
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 96
      Height = 13
      Caption = 'Description Search'
    end
    object Label2: TLabel
      Left = 515
      Top = 16
      Width = 82
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Enquiry number'
      ExplicitLeft = 509
    end
    object btnClose: TButton
      Left = 779
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 2
      OnClick = btnCloseClick
      ExplicitLeft = 773
    end
    object edtSearch: TEdit
      Left = 104
      Top = 12
      Width = 180
      Height = 21
      TabOrder = 0
      OnChange = edtSearchChange
    end
    object edtNumber: TEdit
      Left = 593
      Top = 12
      Width = 90
      Height = 21
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnKeyPress = edtNumberKeyPress
      ExplicitLeft = 587
    end
    object btnSelect: TButton
      Left = 691
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Select'
      TabOrder = 3
      OnClick = btnSelectClick
      ExplicitLeft = 685
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 356
    Width = 852
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
    ExplicitTop = 347
    ExplicitWidth = 846
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 325
    OnTimer = tmrSearchTimer
    Left = 368
    Top = 128
  end
end
