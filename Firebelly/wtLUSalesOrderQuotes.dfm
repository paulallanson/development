object frmWTLUSalesOrderQuotes: TfrmWTLUSalesOrderQuotes
  Left = 38
  Top = 52
  Caption = 'Quotes Lookup'
  ClientHeight = 450
  ClientWidth = 993
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 17
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
    ExplicitTop = 422
    ExplicitWidth = 987
  end
  object Panel2: TPanel
    Left = 0
    Top = 355
    Width = 993
    Height = 76
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 346
    ExplicitWidth = 987
    DesignSize = (
      993
      76)
    object Label1: TLabel
      Left = 643
      Top = 43
      Width = 36
      Height = 17
      Anchors = [akRight, akBottom]
      Caption = 'Quote'
    end
    object Label2: TLabel
      Left = 8
      Top = 11
      Width = 56
      Height = 17
      Caption = 'Customer'
    end
    object Label3: TLabel
      Left = 8
      Top = 43
      Width = 58
      Height = 17
      Caption = 'Reference'
    end
    object btnSelect: TBitBtn
      Left = 798
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Select'
      Enabled = False
      ModalResult = 1
      TabOrder = 0
      OnClick = btnSelectClick
      ExplicitLeft = 792
    end
    object edtNumber: TEdit
      Left = 687
      Top = 39
      Width = 89
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnKeyPress = edtNumberKeyPress
    end
    object edtCustomerName: TEdit
      Left = 72
      Top = 7
      Width = 305
      Height = 25
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 886
      Top = 39
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 3
      OnClick = BitBtn1Click
      ExplicitLeft = 880
    end
    object edtReference: TEdit
      Left = 72
      Top = 39
      Width = 177
      Height = 25
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
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
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
