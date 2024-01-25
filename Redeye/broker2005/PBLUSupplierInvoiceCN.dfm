object PBLUSupplierInvoiceCNFrm: TPBLUSupplierInvoiceCNFrm
  Left = 6
  Top = 2
  Caption = 'Supplier Invoice details'
  ClientHeight = 535
  ClientWidth = 781
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 432
    Width = 781
    Height = 84
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      781
      84)
    object GroupBox1: TGroupBox
      Left = 8
      Top = 26
      Width = 297
      Height = 53
      Caption = 'Type here to narrow the search for supplier'
      ParentBackground = False
      TabOrder = 0
      object edtSupplierName: TEdit
        Left = 10
        Top = 21
        Width = 271
        Height = 21
        TabOrder = 0
        OnChange = edtSupplierNameChange
      end
    end
    object GroupBox2: TGroupBox
      Left = 662
      Top = 3
      Width = 105
      Height = 76
      Anchors = [akRight, akBottom]
      Caption = 'Function'
      ParentBackground = False
      TabOrder = 1
      object btnSelect: TBitBtn
        Left = 14
        Top = 16
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
      object BitBtn2: TBitBtn
        Left = 14
        Top = 47
        Width = 75
        Height = 25
        Caption = 'Close'
        Kind = bkClose
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  object stBrDetails: TStatusBar
    Left = 0
    Top = 516
    Width = 781
    Height = 19
    Panels = <
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object dbgSupplierInvoice: TDBGrid
    Left = 0
    Top = 0
    Width = 781
    Height = 432
    Align = alClient
    DataSource = dmSupplierInvoice.dsSIHeaderGrid
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
    TitleFont.Style = []
    OnCellClick = dbgSupplierInvoiceCellClick
    OnDblClick = dbgSupplierInvoiceDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Supplier_Name'
        Title.Caption = 'Supplier'
        Width = 203
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Supplier_Invoice_no'
        Title.Caption = 'Invoice No'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Invoice_Date'
        Title.Caption = 'Invoice Date'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Goods_Value'
        Title.Caption = 'Goods Value'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vat_Value'
        Title.Caption = 'Vat Value'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Supp_Inv_Alt_Ref'
        Title.Caption = 'PIN Number'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status_Desc'
        Title.Caption = 'Status'
        Visible = True
      end>
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 304
    Top = 112
  end
end
