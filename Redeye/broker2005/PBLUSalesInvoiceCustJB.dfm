object PBLUSalesInvoiceCustJBfrm: TPBLUSalesInvoiceCustJBfrm
  Left = 291
  Top = 114
  Caption = 'Customer Job Bags'
  ClientHeight = 349
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 626
    Height = 49
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object lblCustomer: TLabel
      Left = 8
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Customer'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 305
    Width = 626
    Height = 44
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      626
      44)
    object btnSelect: TBitBtn
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Select'
      Enabled = False
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnSelectClick
    end
    object btnCancel: TBitBtn
      Left = 536
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object dbgJB: TDBGrid
    Left = 0
    Top = 49
    Width = 626
    Height = 256
    Align = alClient
    DrawingStyle = gdsGradient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
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
