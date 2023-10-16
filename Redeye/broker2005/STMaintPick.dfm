object STMaintPickFrm: TSTMaintPickFrm
  Left = 32
  Top = 34
  Caption = 'Picking Confirmation by Part'
  ClientHeight = 449
  ClientWidth = 770
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
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 770
    Height = 73
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 766
    object Label1: TLabel
      Left = 24
      Top = 41
      Width = 60
      Height = 13
      Caption = 'Picking List:'
    end
    object Label2: TLabel
      Left = 376
      Top = 8
      Width = 30
      Height = 13
      Caption = 'Store:'
    end
    object StoreNameLbl: TLabel
      Left = 416
      Top = 8
      Width = 71
      Height = 13
      Caption = 'StoreNameLbl'
    end
    object Label3: TLabel
      Left = 24
      Top = 8
      Width = 80
      Height = 13
      Caption = 'Order Number: '
    end
    object LblOrderNo: TLabel
      Left = 107
      Top = 8
      Width = 60
      Height = 13
      Caption = 'LblOrderNo'
    end
    object cmbPickingNote: TComboBox
      Left = 104
      Top = 37
      Width = 169
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      OnClick = cmbPickingNoteClick
    end
  end
  object Panel2: TPanel
    Left = 673
    Top = 73
    Width = 97
    Height = 376
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 669
    ExplicitHeight = 375
    DesignSize = (
      97
      376)
    object ConfirmBtn: TBitBtn
      Left = 14
      Top = 309
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
      ExplicitTop = 308
    end
    object BitBtn2: TBitBtn
      Left = 14
      Top = 349
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Clos&e'
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 1
      OnClick = BitBtn2Click
      ExplicitTop = 348
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
    object CancelBtn: TBitBtn
      Left = 14
      Top = 128
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel All'
      Enabled = False
      TabOrder = 5
      OnClick = CancelBtnClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 73
    Width = 673
    Height = 376
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    ExplicitWidth = 669
    ExplicitHeight = 375
    object sgDetails: TStringGrid
      Left = 1
      Top = 1
      Width = 671
      Height = 374
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
      OnClick = sgDetailsClick
      OnDblClick = sgDetailsDblClick
      OnSelectCell = sgDetailsSelectCell
      ExplicitWidth = 667
      ExplicitHeight = 373
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
  object qryPickNotes: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct Sales_Order_Picking, Picking_List_Ref, Date_Pick' +
        'ed'
      'from Sales_Order_Picking'
      'where Sales_Order = :Sales_Order'
      
        'and ((Pick_Note_Confirmed is NULL) or (Pick_Note_Confirmed <> '#39'Y' +
        #39'))')
    Left = 312
    Top = 48
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryProdLocation: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Sales_order.Production_Location,'
      '        Production_Location.Receive_Forward_Stock'
      'from  Sales_Order,'
      '      Production_Location'
      'Where Sales_order.Sales_Order = :Sales_Order AND'
      
        '      Sales_Order.Production_Location = Production_Location.Prod' +
        'uction_Location')
    Left = 424
    Top = 209
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
end
