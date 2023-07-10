object frmWTLUContractQuotes: TfrmWTLUContractQuotes
  Left = 296
  Top = 59
  Width = 750
  Height = 468
  Caption = 'Quotes Lookup'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object stbrDetails: TStatusBar
    Left = 0
    Top = 422
    Width = 742
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
    Top = 371
    Width = 742
    Height = 51
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      742
      51)
    object Label1: TLabel
      Left = 402
      Top = 20
      Width = 29
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Quote'
    end
    object Label2: TLabel
      Left = 8
      Top = 20
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object btnSelect: TBitBtn
      Left = 557
      Top = 14
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
      Left = 442
      Top = 16
      Width = 89
      Height = 21
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnKeyPress = edtNumberKeyPress
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
      Left = 645
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 3
      OnClick = BitBtn1Click
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 742
    Height = 371
    Align = alClient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
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
