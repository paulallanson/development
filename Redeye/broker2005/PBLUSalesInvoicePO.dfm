object PBLUSalesInvoicePOfrm: TPBLUSalesInvoicePOfrm
  Left = 19
  Top = 38
  Caption = 'Purchase Order Selection'
  ClientHeight = 479
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 343
    Width = 779
    Height = 117
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      779
      117)
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 318
      Height = 15
      Caption = 'Orders highlighted in red are orders to be invoiced upfront.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object chkSuppInvoiced: TCheckBox
      Left = 16
      Top = 48
      Width = 345
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Display orders where a Supplier Invoice has been received'
      TabOrder = 0
      OnClick = chkSuppInvoicedClick
    end
    object CustomerGroupBox: TGroupBox
      Left = 16
      Top = 67
      Width = 385
      Height = 49
      Anchors = [akLeft, akBottom]
      Caption = 'Type here to narrow the search'
      ParentBackground = False
      TabOrder = 1
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
        Left = 296
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
      Left = 472
      Top = 67
      Width = 161
      Height = 49
      Anchors = [akRight, akBottom]
      Caption = 'Selected Purchase Order'
      ParentBackground = False
      TabOrder = 2
      object edtPONumber: TEdit
        Left = 8
        Top = 16
        Width = 137
        Height = 21
        TabOrder = 0
        OnKeyPress = edtPONumberKeyPress
      end
    end
    object GroupBox2: TGroupBox
      Left = 648
      Top = 32
      Width = 105
      Height = 81
      Anchors = [akRight, akBottom]
      Caption = 'Function'
      ParentBackground = False
      TabOrder = 3
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
        Kind = bkClose
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object chkAllOrders: TCheckBox
      Left = 16
      Top = 26
      Width = 313
      Height = 17
      Caption = 'Display all orders not invoiced'
      TabOrder = 4
      OnClick = chkAllOrdersClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 779
    Height = 343
    Align = alClient
    Caption = 'Panel2'
    ParentBackground = False
    TabOrder = 1
    object dbgPO: TDBGrid
      Left = 1
      Top = 1
      Width = 777
      Height = 341
      Align = alClient
      DataSource = dmSalesInvoice.dsPOLine
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
      OnCellClick = dbgPOCellClick
      OnDrawColumnCell = dbgPODrawColumnCell
      OnDblClick = dbgPODblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Purchase_Order'
          Title.Caption = 'Number'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date_point'
          Title.Caption = 'Date'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Customer_Name'
          Title.Caption = 'Customer'
          Width = 209
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Job_Bag'
          Title.Caption = 'Job Bag'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quantity'
          Title.Alignment = taRightJustify
          Title.Caption = 'Qty on Order'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Selling_Price'
          Title.Alignment = taRightJustify
          Title.Caption = 'Sell Price'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sales_Unit_Desc'
          Title.Caption = 'Sales Unit'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qty_to_be_invoiced'
          Title.Caption = 'Qty to Invoice'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Customers_Desc'
          Title.Caption = 'Description'
          Width = 279
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Last_Delivery_date'
          Title.Caption = 'Last Delivery'
          Width = 86
          Visible = True
        end>
    end
  end
  object stbrDetails: TStatusBar
    Left = 0
    Top = 460
    Width = 779
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 264
    Top = 48
  end
end
