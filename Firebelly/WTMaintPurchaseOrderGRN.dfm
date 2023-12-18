object frmWTMaintPurchaseOrderGRN: TfrmWTMaintPurchaseOrderGRN
  Left = 261
  Top = 97
  Caption = 'Purchase Order Receipt'
  ClientHeight = 449
  ClientWidth = 882
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 408
    Width = 882
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      882
      41)
    object btnOK: TBitBtn
      Left = 714
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
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 802
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 882
    Height = 81
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      882
      81)
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 79
      Height = 13
      Caption = 'Purchase Order'
    end
    object Label2: TLabel
      Left = 264
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Supplier'
    end
    object Label3: TLabel
      Left = 664
      Top = 16
      Width = 72
      Height = 13
      Caption = 'Date Received'
    end
    object Label4: TLabel
      Left = 8
      Top = 48
      Width = 67
      Height = 13
      Caption = 'GRN Number'
    end
    object Label5: TLabel
      Left = 664
      Top = 48
      Width = 62
      Height = 13
      Caption = 'Reecived By:'
    end
    object Edit1: TEdit
      Left = 96
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 320
      Top = 12
      Width = 305
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
    object edtDateRequired: TEdit
      Left = 756
      Top = 12
      Width = 89
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object btnDateRequired: TBitBtn
      Left = 852
      Top = 10
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      TabOrder = 3
    end
    object Edit3: TEdit
      Left = 96
      Top = 44
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'Edit1'
    end
    object dblkpOperator: TDBLookupComboBox
      Left = 732
      Top = 44
      Width = 145
      Height = 21
      Anchors = [akTop, akRight]
      KeyField = 'Operator'
      ListField = 'Operator_Name'
      ListSource = dtmdlPurchaseOrder.dtsOperator
      TabOrder = 5
    end
  end
  object pnlFunctions: TPanel
    Left = 784
    Top = 81
    Width = 98
    Height = 327
    Align = alRight
    ParentBackground = False
    TabOrder = 2
    object btnAdd: TBitBtn
      Left = 14
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Add'
      TabOrder = 0
    end
    object btnChange: TBitBtn
      Left = 14
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Change'
      Enabled = False
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 81
    Width = 784
    Height = 327
    Align = alClient
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
end
