object STRSPODelivNoteFrm: TSTRSPODelivNoteFrm
  Left = 207
  Top = 132
  ActiveControl = PrintBtn
  BorderStyle = bsDialog
  Caption = 'Purchase Order Delivery Note'
  ClientHeight = 260
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  OnShow = FormShow
  DesignSize = (
    387
    260)
  TextHeight = 13
  object selectionGrp: TGroupBox
    Left = 8
    Top = 8
    Width = 361
    Height = 137
    Caption = 'Purchase Order Selection'
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 80
      Width = 180
      Height = 39
      Caption = 
        'Enter purchase order numbers and/or order ranges separated by co' +
        'mmas. For example, 1234, 1236, 1240-1245'
      WordWrap = True
    end
    object SelectionMemo: TMemo
      Left = 8
      Top = 20
      Width = 337
      Height = 53
      TabOrder = 0
      OnKeyPress = SelectionMemoKeyPress
    end
  end
  object PrintBtn: TBitBtn
    Left = 12
    Top = 227
    Width = 80
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Print'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
    TabOrder = 0
    OnClick = PrintBtnClick
  end
  object PreviewBtn: TBitBtn
    Left = 102
    Top = 227
    Width = 80
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Preview'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
      0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
      0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
      0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
      0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
      0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
      5555557FFFFF7755555555500000005555555577777775555555555555555555
      5555555555555555555555555555555555555555555555555555}
    NumGlyphs = 2
    TabOrder = 1
    OnClick = PreviewBtnClick
  end
  object CloseBitBtn: TBitBtn
    Left = 284
    Top = 227
    Width = 80
    Height = 25
    Anchors = [akLeft, akBottom]
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 2
  end
  object SelectLst: TListBox
    Left = 336
    Top = 16
    Width = 25
    Height = 113
    ItemHeight = 13
    Sorted = True
    TabOrder = 4
    Visible = False
  end
  object EmailBitBtn: TBitBtn
    Left = 193
    Top = 227
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Email'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
      000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
      FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
      FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
      9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
      0000777777777777777733333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    TabOrder = 5
    OnClick = EmailBitBtnClick
  end
  object rdgrpLogo: TRadioGroup
    Left = 11
    Top = 152
    Width = 214
    Height = 65
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      'Company logo'
      'Customer logo')
    ParentBackground = False
    TabOrder = 6
  end
  object chkbxPrintlogo: TCheckBox
    Left = 17
    Top = 150
    Width = 72
    Height = 17
    Caption = 'Print Logo'
    TabOrder = 7
    OnClick = chkbxPrintlogoClick
  end
  object AddIntSelQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, text100)'
      'Values'
      '(:Int_Sel_Code, :Sel1, 0.0,0.0,0.0,:text100)'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 328
    Top = 56
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Sel1'
      end
      item
        Name = 'text100'
      end>
  end
  object AddWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Text100)'
      'Values'
      '(:Int_Sel_Code, 0.0,0.0,0.0,0.0,:Text100)'
      ''
      ' ')
    Left = 272
    Top = 20
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Text100'
      end>
  end
  object DelWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) '
      ' ')
    Left = 104
    Top = 52
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end>
  end
  object GetLastIntSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Int_Sel_Code) as Last_Code'
      'From Int_Sel'
      ' ')
    Left = 184
    Top = 20
  end
  object GetOrdHedQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Int_Sel.Int_Sel_Code,'
      '        Supplier.Name as Supplier_Name,'
      '        Supplier_Branch.Name as Branch_Name,'
      '        Supplier_Branch.Email,'
      '        Supplier_Branch.Supplier,'
      '        Supplier_Branch.Branch_no'
      'FROM Supplier'
      '  INNER JOIN (Supplier_Branch'
      '  INNER JOIN (Int_Sel'
      '  INNER JOIN purch_ord'
      '    ON Int_Sel.Text100 = purch_ord.Purch_Ord_No)'
      
        '    ON (Supplier_Branch.Branch_no = purch_ord.Branch_no) AND (Su' +
        'pplier_Branch.Supplier = purch_ord.Supplier))'
      '    ON Supplier.Supplier = Supplier_Branch.Supplier'
      'WHERE   (Int_Sel.Int_Sel_Code = :Int_Sel_Code)'
      'GROUP BY  Int_Sel.Int_Sel_Code,'
      '        Supplier.Name,'
      '        Supplier_Branch.Name,'
      '        Supplier_Branch.Email,'
      '        Supplier_Branch.Supplier,'
      '        Supplier_Branch.Branch_no'
      ''
      '')
    Left = 166
    Top = 160
    ParamData = <
      item
        Name = 'Int_Sel_Code'
        DataType = ftInteger
      end>
  end
end
