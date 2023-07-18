object frmWTUSSetDocuments: TfrmWTUSSetDocuments
  Left = 559
  Top = 153
  BorderStyle = bsDialog
  Caption = 'Allocate Documents'
  ClientHeight = 268
  ClientWidth = 247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    247
    268)
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 233
    Height = 52
    Caption = 
      'This utility will allocate the quotation and health && safety do' +
      'cuments to the relevant folders in each sales order based on the' +
      ' fitting dates and whether the order is allocated to the schedul' +
      'e'
    WordWrap = True
  end
  object lblnoRecords: TLabel
    Left = 8
    Top = 184
    Width = 49
    Height = 13
    Caption = '0 Records'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 225
    Height = 57
    Caption = 'Sales Order Fitting Date Selection '
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 28
      Width = 26
      Height = 13
      Caption = 'From:'
    end
    object edtDateFrom: TEdit
      Left = 56
      Top = 24
      Width = 100
      Height = 21
      TabOrder = 0
      OnChange = enableOK
      OnExit = edtDateFromExit
    end
    object btnDatefrom: TBitBtn
      Left = 168
      Top = 22
      Width = 25
      Height = 25
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
      TabOrder = 1
      OnClick = btnDatefromClick
    end
  end
  object btnOK: TBitBtn
    Left = 40
    Top = 224
    Width = 75
    Height = 26
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 224
    Width = 75
    Height = 26
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
  end
  object prgbrRecords: TProgressBar
    Left = 8
    Top = 160
    Width = 225
    Height = 17
    TabOrder = 3
  end
  object qryGetOrders: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Sales_Order.sales_order,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.date_required,'
      '        Sales_Order.IsFittingInOutlook,'
      '        Sales_Order.IsTemplateInOutlook,'
      '        (SELECT Customer_Branch.Branch_Name'
      '         FROM Customer_Branch'
      
        '         WHERE Customer_Branch.Customer = Sales_order.Customer A' +
        'ND'
      
        '                Customer_Branch.Branch_no = Sales_Order.Branch_n' +
        'o) AS Branch_Name,'
      '        Sales_Order_Line.Quote'
      'FROM Sales_Order'
      '      INNER JOIN Sales_Order_Line'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Orde' +
        'r'
      'WHERE (Date_Required >= :Date_Required) AND'
      '      (Sales_Order_line.Quote > 0) AND'
      
        '      ((IsFittingInOutlook = '#39'Y'#39') OR (IsTemplateInOutlook = '#39'Y'#39')' +
        ')')
    Left = 32
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date_Required'
        ParamType = ptUnknown
      end>
  end
end
