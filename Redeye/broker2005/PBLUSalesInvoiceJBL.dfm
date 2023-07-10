object PBLUSalesInvoiceJBLfrm: TPBLUSalesInvoiceJBLfrm
  Left = 150
  Top = 77
  BorderStyle = bsDialog
  Caption = 'Job bag item invoice selection'
  ClientHeight = 383
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
  object Panel1: TPanel
    Left = 0
    Top = 339
    Width = 594
    Height = 44
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      594
      44)
    object btnSelect: TBitBtn
      Left = 416
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Select'
      Enabled = False
      TabOrder = 0
      OnClick = btnSelectClick
      Kind = bkOK
    end
    object btnCancel: TBitBtn
      Left = 504
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 49
    Align = alTop
    TabOrder = 1
    object lblCustomer: TLabel
      Left = 8
      Top = 8
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object lblJobBag: TLabel
      Left = 8
      Top = 32
      Width = 79
      Height = 13
      Caption = 'Job Bag Number'
    end
    object lblDescription: TLabel
      Left = 136
      Top = 32
      Width = 63
      Height = 13
      Caption = 'lblDescription'
    end
  end
  object dbgJBLines: TDBGrid
    Left = 0
    Top = 49
    Width = 594
    Height = 290
    Align = alClient
    DataSource = dmSalesInvoice.dsJBLines
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Job_Bag_Line'
        Title.Caption = 'Line'
        Width = 42
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Purchase_Order'
        Title.Caption = 'Purchase Order'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Job_Bag_Line_Descr'
        Title.Caption = 'Description'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Job_Bag_Quantity'
        Title.Caption = 'Quantity'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Job_Bag_Line_Sell'
        Title.Caption = 'Sell Price'
        Visible = True
      end>
  end
end
