object frmWTMaintPurchaseOrderReceipts: TfrmWTMaintPurchaseOrderReceipts
  Left = 206
  Top = 114
  Caption = 'Maintain Purchase Order Receipts'
  ClientHeight = 428
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 409
    Width = 832
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 368
    Width = 832
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      832
      41)
    object btbtnClose: TBitBtn
      Left = 732
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
    end
    object btnOK: TBitBtn
      Left = 644
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Confirm'
      Default = True
      Enabled = False
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnOKClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 832
    Height = 145
    Align = alTop
    TabOrder = 2
    object Label3: TLabel
      Left = 16
      Top = 52
      Width = 65
      Height = 13
      Caption = 'Receipt Date'
    end
    object Label1: TLabel
      Left = 16
      Top = 116
      Width = 67
      Height = 13
      Caption = 'GRN Number'
    end
    object Label5: TLabel
      Left = 16
      Top = 84
      Width = 86
      Height = 13
      Caption = 'Delivery Note No'
    end
    object Label4: TLabel
      Left = 16
      Top = 20
      Width = 43
      Height = 13
      Caption = 'Supplier'
    end
    object Label6: TLabel
      Left = 648
      Top = 20
      Width = 79
      Height = 13
      Caption = 'Purchase Order'
    end
    object Label7: TLabel
      Left = 480
      Top = 116
      Width = 74
      Height = 13
      Caption = 'Our Reference'
    end
    object dtTransaction: TDateTimePicker
      Left = 104
      Top = 48
      Width = 97
      Height = 21
      Date = 39470.000000000000000000
      Time = 0.402405902779719300
      TabOrder = 1
      OnChange = CheckOK
    end
    object edtGRN: TEdit
      Left = 104
      Top = 112
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'edtGRN'
      OnChange = CheckOK
    end
    object edtDeliveryNote: TEdit
      Left = 104
      Top = 80
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'edtDeliveryNote'
      OnChange = CheckOK
    end
    object edtSupplierName: TEdit
      Left = 104
      Top = 16
      Width = 273
      Height = 21
      Color = clBtnFace
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtNumber: TEdit
      Left = 744
      Top = 16
      Width = 97
      Height = 21
      TabStop = False
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtReference: TEdit
      Left = 568
      Top = 112
      Width = 273
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 5
      Text = 'edtReference'
    end
  end
  object dbgLines: TStringGrid
    Left = 0
    Top = 145
    Width = 832
    Height = 223
    Align = alClient
    ColCount = 6
    DefaultRowHeight = 20
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 3
    OnDrawCell = dbgLinesDrawCell
    OnKeyPress = dbgLinesKeyPress
    OnSelectCell = dbgLinesSelectCell
    ColWidths = (
      47
      314
      172
      95
      78
      76)
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 296
    Top = 88
  end
end
