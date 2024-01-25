object PBLUSalesInvoiceJBfrm: TPBLUSalesInvoiceJBfrm
  Left = 35
  Top = 48
  Caption = 'Job Bag Selection'
  ClientHeight = 435
  ClientWidth = 715
  Color = clBtnFace
  Constraints.MinHeight = 462
  Constraints.MinWidth = 723
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object dbgJB: TDBGrid
    Left = 0
    Top = 0
    Width = 715
    Height = 320
    Align = alClient
    DataSource = dmSalesInvoice.dsJBAll
    DrawingStyle = gdsGradient
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
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
        FieldName = 'Date_Point'
        Title.Caption = 'Date'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer_Name'
        Title.Caption = 'Customer Name'
        Width = 222
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cust_Order_No'
        Title.Caption = 'Customer Reference'
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Goods_Required'
        Title.Caption = 'Date Required'
        Width = 101
        Visible = True
      end>
  end
  object stbrDetails: TStatusBar
    Left = 0
    Top = 416
    Width = 715
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 320
    Width = 715
    Height = 96
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      715
      96)
    object CustomerGroupBox: TGroupBox
      Left = 8
      Top = 39
      Width = 393
      Height = 49
      Caption = 'Type here to narrow the search'
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 49
        Height = 13
        Caption = 'Customer'
      end
      object edtCustomerName: TEdit
        Left = 72
        Top = 16
        Width = 209
        Height = 21
        TabOrder = 0
        OnChange = edtCustomerNameChange
      end
      object btnSweep: TBitBtn
        Left = 302
        Top = 16
        Width = 75
        Height = 25
        Caption = 'S&weep'
        Enabled = False
        TabOrder = 1
        OnClick = btnSweepClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 426
      Top = 39
      Width = 161
      Height = 49
      Anchors = [akTop, akRight]
      Caption = 'Selected Job Bag'
      ParentBackground = False
      TabOrder = 1
      object edtJBNumber: TEdit
        Left = 8
        Top = 16
        Width = 137
        Height = 21
        TabOrder = 0
        OnKeyPress = edtJBNumberKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 594
      Top = 7
      Width = 105
      Height = 81
      Anchors = [akTop, akRight]
      Caption = 'Function'
      ParentBackground = False
      TabOrder = 2
      object btnSelect: TBitBtn
        Left = 16
        Top = 20
        Width = 75
        Height = 25
        Caption = 'Select '
        Enabled = False
        Glyph.Data = {
          BE060000424DBE06000000000000360400002800000024000000120000000100
          0800000000008802000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A600000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          03030303030303030303030303030303030303030303FF030303030303030303
          03030303030303040403030303030303030303030303030303F8F8FF03030303
          03030303030303030303040202040303030303030303030303030303F80303F8
          FF030303030303030303030303040202020204030303030303030303030303F8
          03030303F8FF0303030303030303030304020202020202040303030303030303
          0303F8030303030303F8FF030303030303030304020202FA0202020204030303
          0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
          040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
          03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
          FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
          0303030303030303030303FA0202020403030303030303030303030303F8FF03
          03F8FF03030303030303030303030303FA020202040303030303030303030303
          0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
          03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
          030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
          0202040303030303030303030303030303F8FF03F8FF03030303030303030303
          03030303FA0202030303030303030303030303030303F8FFF803030303030303
          030303030303030303FA0303030303030303030303030303030303F803030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnSelectClick
      end
      object btnClose: TBitBtn
        Left = 16
        Top = 48
        Width = 75
        Height = 25
        Caption = 'Close'
        Kind = bkClose
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 264
    Top = 48
  end
end
