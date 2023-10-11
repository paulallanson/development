object frmWTLUPOrderSalesOrders: TfrmWTLUPOrderSalesOrders
  Left = 204
  Top = 74
  Caption = 'Recommended Purchase Orders'
  ClientHeight = 441
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 65
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 664
      Top = 20
      Width = 69
      Height = 13
      Caption = 'Date Required'
    end
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 85
      Height = 13
      Caption = 'Order Due before:'
    end
    object dtTransaction: TDateTimePicker
      Left = 744
      Top = 16
      Width = 97
      Height = 21
      Date = 39470.000000000000000000
      Time = 0.402405902779719300
      TabOrder = 0
    end
    object DateTimePicker1: TDateTimePicker
      Left = 144
      Top = 16
      Width = 97
      Height = 21
      Date = 39470.000000000000000000
      Time = 0.402405902779719300
      TabOrder = 1
    end
  end
  object sgdetails: TStringGrid
    Left = 0
    Top = 65
    Width = 912
    Height = 307
    Align = alClient
    ColCount = 6
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    TabOrder = 1
    ColWidths = (
      178
      201
      182
      83
      78
      76)
  end
  object Panel2: TPanel
    Left = 0
    Top = 372
    Width = 912
    Height = 50
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      912
      50)
    object Label2: TLabel
      Left = 16
      Top = 20
      Width = 38
      Height = 13
      Caption = 'Supplier'
    end
    object edtSearch: TEdit
      Left = 64
      Top = 16
      Width = 209
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object btbtnClose: TBitBtn
      Left = 834
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
    object btnOK: TBitBtn
      Left = 746
      Top = 14
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
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
      TabOrder = 2
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 422
    Width = 912
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 50
      end>
  end
end
