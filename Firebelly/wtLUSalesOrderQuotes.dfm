object frmWTLUSalesOrderQuotes: TfrmWTLUSalesOrderQuotes
  Left = 38
  Top = 52
  Caption = 'Quotes Lookup'
  ClientHeight = 450
  ClientWidth = 993
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object stbrDetails: TStatusBar
    Left = 0
    Top = 431
    Width = 993
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 100
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 355
    Width = 993
    Height = 76
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      993
      76)
    object Label1: TLabel
      Left = 649
      Top = 45
      Width = 32
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Quote'
      ExplicitLeft = 667
    end
    object Label2: TLabel
      Left = 8
      Top = 20
      Width = 49
      Height = 13
      Caption = 'Customer'
    end
    object Label3: TLabel
      Left = 8
      Top = 52
      Width = 51
      Height = 13
      Caption = 'Reference'
    end
    object btnSelect: TBitBtn
      Left = 804
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Select'
      Enabled = False
      ModalResult = 1
      TabOrder = 0
      OnClick = btnSelectClick
    end
    object edtNumber: TEdit
      Left = 689
      Top = 41
      Width = 89
      Height = 21
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnKeyPress = edtNumberKeyPress
    end
    object edtCustomerName: TEdit
      Left = 72
      Top = 16
      Width = 305
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 892
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object edtReference: TEdit
      Left = 72
      Top = 48
      Width = 177
      Height = 21
      TabOrder = 4
      OnChange = edtReferenceChange
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 993
    Height = 355
    Align = alClient
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Quote'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_Raised'
        Title.Caption = 'Date'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Width = 361
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Reference'
        Width = 187
        Visible = True
      end>
  end
  object tmrRefresh: TTimer
    OnTimer = tmrRefreshTimer
    Left = 440
    Top = 120
  end
end
