object STPickbyPartFrm: TSTPickbyPartFrm
  Left = 30
  Top = 34
  Caption = 'Picking Confirmation by Part'
  ClientHeight = 460
  ClientWidth = 774
  Color = clBtnFace
  Constraints.MinHeight = 487
  Constraints.MinWidth = 782
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 41
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 770
    object Label1: TLabel
      Left = 600
      Top = 10
      Width = 114
      Height = 13
      Caption = 'Picking List Reference '
      Enabled = False
      Visible = False
    end
    object Label2: TLabel
      Left = 368
      Top = 8
      Width = 30
      Height = 13
      Caption = 'Store:'
    end
    object StoreNameLbl: TLabel
      Left = 416
      Top = 8
      Width = 3
      Height = 13
    end
    object Label3: TLabel
      Left = 24
      Top = 8
      Width = 80
      Height = 13
      Caption = 'Order Number: '
    end
    object LblOrdNo: TLabel
      Left = 136
      Top = 8
      Width = 3
      Height = 13
    end
  end
  object Panel2: TPanel
    Left = 677
    Top = 41
    Width = 97
    Height = 419
    Align = alRight
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 673
    ExplicitHeight = 418
    DesignSize = (
      97
      419)
    object ConfirmBtn: TBitBtn
      Left = 14
      Top = 345
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'C&onfirm'
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
      TabOrder = 0
      OnClick = ConfirmBtnClick
      ExplicitTop = 344
    end
    object BitBtn2: TBitBtn
      Left = 14
      Top = 385
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Ca&ncel'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = BitBtn2Click
      ExplicitTop = 384
    end
    object DeleteBitBtn: TBitBtn
      Left = 14
      Top = 88
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Delete'
      Enabled = False
      TabOrder = 2
      OnClick = DeleteBitBtnClick
    end
    object AddBitBtn: TBitBtn
      Left = 14
      Top = 48
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Split'
      Enabled = False
      TabOrder = 3
      OnClick = AddBitBtnClick
    end
    object Changebtn: TBitBtn
      Left = 14
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Change'
      TabOrder = 4
      OnClick = ChangebtnClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 677
    Height = 419
    Align = alClient
    Caption = 'Panel3'
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 673
    ExplicitHeight = 418
    object PickingGrid: TStringGrid
      Left = 1
      Top = 1
      Width = 675
      Height = 417
      Align = alClient
      ColCount = 9
      DefaultColWidth = 60
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect, goThumbTracking]
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnClick = PickingGridClick
      OnDblClick = PickingGridDblClick
      OnSelectCell = PickingGridSelectCell
      ExplicitWidth = 671
      ExplicitHeight = 416
      ColWidths = (
        123
        183
        60
        60
        60
        60
        60
        60
        60)
    end
  end
  object GetIntSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'from int_sel'
      'where int_sel.int_sel_code = :int_sel_code'
      ' ')
    Left = 424
    Top = 144
    ParamData = <
      item
        Name = 'int_sel_code'
      end>
  end
end
