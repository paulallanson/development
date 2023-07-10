object PBLUSalesInvoiceCustJBfrm: TPBLUSalesInvoiceCustJBfrm
  Left = 291
  Top = 114
  Width = 642
  Height = 388
  Caption = 'Customer Job Bags'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 49
    Align = alTop
    TabOrder = 0
    object lblCustomer: TLabel
      Left = 8
      Top = 8
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 310
    Width = 634
    Height = 44
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      634
      44)
    object btnSelect: TBitBtn
      Left = 456
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
      Left = 544
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object dbgJB: TDBGrid
    Left = 0
    Top = 49
    Width = 634
    Height = 261
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgJBCellClick
    OnDblClick = dbgJBDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Job_Bag'
        Title.Caption = 'Job Bag'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sequence_no'
        Title.Caption = 'Line'
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Job_Bag_Line_Descr'
        Title.Caption = 'Description'
        Width = 217
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Job_Bag_Quantity'
        Title.Caption = 'Quantity'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Job_Bag_Line_sell'
        Title.Caption = 'Selling Price'
        Width = 82
        Visible = True
      end>
  end
end
