object PBMaintPOrdInactiveFrm: TPBMaintPOrdInactiveFrm
  Left = 134
  Top = 105
  BorderStyle = bsDialog
  Caption = 'Cancel Purchase Order'
  ClientHeight = 209
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 566
    Height = 120
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      566
      120)
    object Label2: TLabel
      Left = 8
      Top = 20
      Width = 64
      Height = 13
      Caption = 'Reason Type'
    end
    object Label3: TLabel
      Left = 352
      Top = 20
      Width = 61
      Height = 13
      Caption = 'Cancel Date'
    end
    object Label4: TLabel
      Left = 8
      Top = 49
      Width = 47
      Height = 13
      Caption = 'Operator'
    end
    object lblOperatorName: TLabel
      Left = 88
      Top = 49
      Width = 47
      Height = 13
      Caption = 'Operator'
    end
    object dbluReason: TDBLookupComboBox
      Left = 88
      Top = 16
      Width = 217
      Height = 21
      KeyField = 'InActive_Reason'
      ListField = 'Description'
      ListSource = srcReason
      TabOrder = 0
      OnClick = dbluReasonClick
    end
    object edtDate: TEdit
      Left = 424
      Top = 16
      Width = 97
      Height = 21
      TabOrder = 1
      OnChange = edtDateChange
      OnExit = edtDateExit
    end
    object BitBtn1: TBitBtn
      Left = 528
      Top = 14
      Width = 25
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
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
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object btnOK: TBitBtn
      Left = 202
      Top = 80
      Width = 75
      Height = 25
      Anchors = [akLeft, akTop, akBottom]
      Enabled = False
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 3
      OnClick = btnOKClick
    end
    object BitBtn3: TBitBtn
      Left = 290
      Top = 80
      Width = 75
      Height = 25
      Anchors = [akLeft, akTop, akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 4
    end
    object BitBtn4: TBitBtn
      Left = 312
      Top = 14
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 5
      OnClick = BitBtn4Click
    end
    object reActiveChk: TCheckBox
      Left = 8
      Top = 80
      Width = 145
      Height = 17
      Anchors = [akLeft, akTop, akBottom]
      Caption = 'Re-activate Order'
      TabOrder = 6
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 566
    Height = 89
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 82
      Height = 13
      Caption = 'Purchase Order:'
    end
    object lblPOrder: TLabel
      Left = 104
      Top = 16
      Width = 49
      Height = 13
      Caption = 'lblPOrder'
    end
    object lblDescription: TLabel
      Left = 224
      Top = 16
      Width = 72
      Height = 13
      Caption = 'lblDescription'
    end
    object lblSupplier: TLabel
      Left = 8
      Top = 40
      Width = 56
      Height = 13
      Caption = 'lblSupplier'
    end
    object lblCustomer: TLabel
      Left = 8
      Top = 64
      Width = 62
      Height = 13
      Caption = 'lblCustomer'
    end
  end
  object GetHeadDtlsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer.Name AS Cust_name,'
      '        Supplier.Name AS Supp_Name,'
      '        Purchase_OrderLine.Suppliers_Desc,'
      '        Purchase_OrderLine.Inactive,'
      '        Purchase_OrderLine.Inactive_Date,'
      '        Purchase_OrderLine.Inactive_Reason,'
      '        Purchase_OrderLine.Inactive_Operator,'
      '        Operator.Name as Operator_Name'
      'FROM Operator'
      '      RIGHT JOIN ((Purchase_Order'
      '      LEFT JOIN Supplier'
      '        ON Purchase_Order.Supplier = Supplier.Supplier)'
      '      INNER JOIN (Purchase_OrderLine'
      '      LEFT JOIN Customer'
      '        ON Purchase_OrderLine.Customer = Customer.Customer)'
      
        '        ON Purchase_Order.Purchase_Order = Purchase_OrderLine.Pu' +
        'rchase_Order)'
      
        '        ON Operator.Operator = Purchase_OrderLine.Inactive_Opera' +
        'tor'
      
        'WHERE (((Purchase_OrderLine.Purchase_Order)= :purchase_order) AN' +
        'D'
      '      ((Purchase_OrderLine.Line)= :line))'
      ' '
      ' '
      ' ')
    Left = 336
    Top = 16
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryReason: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Inactive_reason')
    Left = 104
    Top = 41
  end
  object srcReason: TDataSource
    DataSet = qryReason
    Left = 168
    Top = 41
  end
  object qryUpPorder: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Purchase_OrderLine'
      'set Inactive = :Inactive, '
      '      Inactive_Date = :Inactive_Date, '
      '      Inactive_Reason = :Inactive_reason,'
      '      Inactive_Operator = :Inactive_Operator'
      'where Purchase_Order = :Purchase_Order and Line = :Line')
    Left = 432
    Top = 16
    ParamData = <
      item
        Name = 'Inactive'
      end
      item
        Name = 'Inactive_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Inactive_reason'
        DataType = ftInteger
      end
      item
        Name = 'Inactive_Operator'
        DataType = ftInteger
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryCountJBLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select count(Job_Bag_Line) as Line_Count'
      'from Job_Bag_Line_Dets'
      'where Job_Bag = :Job_Bag')
    Left = 368
    Top = 72
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryUpJBInactive: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Job_Bag'
      'set Inactive = :Inactive'
      'where Job_Bag = :Job_Bag')
    Left = 488
    Top = 72
    ParamData = <
      item
        Name = 'Inactive'
      end
      item
        Name = 'Job_Bag'
      end>
  end
end
