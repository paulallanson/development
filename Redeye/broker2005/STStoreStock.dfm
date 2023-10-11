object STStoreStockFrm: TSTStoreStockFrm
  Left = 134
  Top = 136
  BorderStyle = bsSingle
  Caption = 'Maintain Store Stock Record'
  ClientHeight = 196
  ClientWidth = 499
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 499
    Height = 57
    Align = alTop
    TabOrder = 0
    object lblDetailLine1: TLabel
      Left = 8
      Top = 8
      Width = 209
      Height = 13
      Caption = 'Part , Date, Quantity values get shown here.'
    end
    object lblDetailLine2: TLabel
      Left = 8
      Top = 32
      Width = 179
      Height = 13
      Caption = 'Store, Bin, Lot details get shown here.'
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 57
    Width = 499
    Height = 98
    Align = alClient
    TabOrder = 1
    object lblCost: TLabel
      Left = 72
      Top = 44
      Width = 24
      Height = 13
      Caption = 'Cost:'
    end
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 84
      Height = 13
      Caption = 'Stock Reference:'
    end
    object lblPackSize: TLabel
      Left = 266
      Top = 12
      Width = 51
      Height = 13
      Caption = 'Pack Size:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 76
      Width = 92
      Height = 13
      Caption = 'Sets per pad/book:'
    end
    object chkbxPaidFor: TCheckBox
      Left = 264
      Top = 40
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Paid For:'
      TabOrder = 0
      OnClick = chkbxPaidForClick
    end
    object edtCost: TEdit
      Left = 112
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'edtCost'
      OnChange = edtCostChange
      OnKeyPress = edtCostKeyPress
    end
    object edtStockRef: TEdit
      Left = 112
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'edtStockRef'
      OnChange = edtStockRefChange
    end
    object edtPackSize: TEdit
      Left = 328
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'edtPackSize'
      OnChange = edtPackSizeChange
      OnExit = edtPackSizeExit
      OnKeyPress = edtPackSizeKeyPress
    end
    object edtSetsPerPad: TEdit
      Left = 112
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'edtSetsPerPad'
      OnChange = edtSetsPerPadChange
      OnKeyPress = edtSetsPerPadKeyPress
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 155
    Width = 499
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btbtnOK: TBitBtn
      Left = 312
      Top = 8
      Width = 75
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btbtnOKClick
    end
    object btbtnCancel: TBitBtn
      Left = 408
      Top = 8
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
end
