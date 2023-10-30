object frmWTLUContractQuotes: TfrmWTLUContractQuotes
  Left = 296
  Top = 59
  Caption = 'Quotes Lookup'
  ClientHeight = 421
  ClientWidth = 732
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
    Top = 402
    Width = 732
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 100
      end>
    ExplicitTop = 393
    ExplicitWidth = 726
  end
  object Panel2: TPanel
    Left = 0
    Top = 351
    Width = 732
    Height = 51
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 342
    ExplicitWidth = 726
    DesignSize = (
      732
      51)
    object Label1: TLabel
      Left = 396
      Top = 20
      Width = 32
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Quote'
      ExplicitLeft = 402
    end
    object Label2: TLabel
      Left = 8
      Top = 20
      Width = 49
      Height = 13
      Caption = 'Customer'
    end
    object btnSelect: TBitBtn
      Left = 551
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Select'
      Enabled = False
      ModalResult = 1
      TabOrder = 0
      OnClick = btnSelectClick
      ExplicitLeft = 545
    end
    object edtNumber: TEdit
      Left = 436
      Top = 16
      Width = 89
      Height = 21
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnKeyPress = edtNumberKeyPress
      ExplicitLeft = 430
    end
    object edtCustomerName: TEdit
      Left = 64
      Top = 16
      Width = 305
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 639
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 3
      OnClick = BitBtn1Click
      ExplicitLeft = 633
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 732
    Height = 351
    Align = alClient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
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
end
