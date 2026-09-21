object STPordRSlFrm: TSTPordRSlFrm
  Left = 243
  Top = 172
  Caption = 'Print Purchase Orders'
  ClientHeight = 351
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  TextHeight = 17
  object PreviewBitBtn: TBitBtn
    Left = 93
    Top = 288
    Width = 72
    Height = 25
    Caption = 'Pre&view'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 2
    OnClick = PreviewBitBtnClick
  end
  object PrintBitBtn: TBitBtn
    Left = 173
    Top = 288
    Width = 72
    Height = 25
    Caption = '&Print'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 3
    OnClick = PrintBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 13
    Top = 288
    Width = 72
    Height = 25
    Caption = '&Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Kind = bkCancel
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 1
  end
  object SelectRadioGroup: TRadioGroup
    Left = 16
    Top = 16
    Width = 170
    Height = 89
    Caption = 'Selection'
    ItemIndex = 0
    Items.Strings = (
      'One Order'
      'Selected Orders'
      'All Unprinted Orders  ')
    ParentBackground = False
    TabOrder = 0
    OnClick = SelectRadioGroupClick
  end
  object FaxBitBtn: TBitBtn
    Left = 251
    Top = 288
    Width = 75
    Height = 25
    Caption = '&Fax'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
      333333333333337FF3333333333333903333333333333377FF33333333333399
      03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
      99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
      99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
      03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
      33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
      33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
      3333777777333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 4
    OnClick = FaxBitBtnClick
  end
  object SelectionGroup: TGroupBox
    Left = 16
    Top = 128
    Width = 393
    Height = 137
    Caption = 'Purchase Order Number Selection'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
    object Label1: TLabel
      Left = 8
      Top = 71
      Width = 273
      Height = 51
      Caption = 
        'Enter Order numbers and/or Order ranges separated by commas. For' +
        ' example, 1234, 1236, 1240-1245'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object EnqLUSpeedButton: TSpeedButton
      Left = 312
      Top = 19
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = EnqLUSpeedButtonClick
    end
    object SelectionMemo: TMemo
      Left = 8
      Top = 19
      Width = 273
      Height = 53
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = CheckOK
    end
    object SelectLst: TListBox
      Left = 368
      Top = -16
      Width = 25
      Height = 105
      ItemHeight = 17
      Sorted = True
      TabOrder = 1
      Visible = False
    end
  end
  object ChkBxLogo: TCheckBox
    Left = 192
    Top = 24
    Width = 153
    Height = 17
    Caption = 'Print Company Logo'
    TabOrder = 6
  end
  object EmailBitBtn: TBitBtn
    Left = 334
    Top = 288
    Width = 75
    Height = 25
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
    TabOrder = 7
    OnClick = EmailBitBtnClick
  end
  object DelRepSelQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Report_Select'
      'Where Workstation = :Workstation'
      '')
    Left = 340
    Top = 14
    ParamData = <
      item
        Name = 'Workstation'
      end>
  end
  object AddRepSelQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Text100)'
      'Values'
      '(:Int_Sel_Code, :Sel1, :Sel2, :Sel3, :Sel4, :Text100)'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 304
    Top = 64
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Sel1'
      end
      item
        Name = 'Sel2'
      end
      item
        Name = 'Sel3'
      end
      item
        Name = 'Sel4'
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
    Left = 184
    Top = 53
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end>
  end
  object AddWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Text100)'
      'Values'
      '(:Int_Sel_Code, 0.00, 0.00, 0.00, 0.00,:Text100)'
      ''
      ' '
      ' ')
    Left = 262
    Top = 5
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Text100'
      end>
  end
  object GetPORngSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT distinct Purch_Ord.Purch_Ord_No'
      'FROM Purch_ord, Purch_Ord_line'
      'WHERE'
      '  (Purch_Ord.Purch_Ord_No >= :From_PONum) and'
      '  (Purch_Ord.Purch_Ord_no <= :To_PONum) and'
      '  (Purch_Ord.Purch_ord = Purch_Ord_Line.Purch_ord) and'
      '  (Purch_Ord.Purch_Ord_Status >= :sStatusFrom) and'
      '  (Purch_Ord.Purch_Ord_Status <= :sStatusTo)'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 90
    Top = 10
    ParamData = <
      item
        Name = 'From_PONum'
        DataType = ftString
      end
      item
        Name = 'To_PONum'
        DataType = ftString
      end
      item
        Name = 'sStatusFrom'
      end
      item
        Name = 'sStatusTo'
      end>
  end
  object qryGetPOs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Sel1,'
      '        text100,'
      '        Purch_Ord.Purch_Ord,'
      '        Purch_Ord.Purch_Ord_no,'
      '        Purch_ord.Supplier,'
      '        Purch_Ord.Branch_no,'
      '        Supplier.Name as Name,'
      '        Supplier_Branch.Name as Branch_Name,'
      '        Supplier_Branch.Fax_number,'
      '        Supplier_Branch.Email,'
      #9'      '#39'Adobe Acrobat Document (*.pdf)'#39' as export_filter_desc,'
      #9'      '#39'PDF'#39' as ExportFilter,'
      '        '#39' '#39' as CC_Email'
      'from'
      '  Int_Sel, Purch_Ord, Supplier, Supplier_Branch'
      'where'
      '  (Int_Sel_Code = :Int_Sel_Code) and'
      '  (Sel1 <> 0) and'
      '  (Sel1 = Purch_Ord.Purch_Ord_no) and'
      '  ('
      '  (Purch_Ord.Supplier = Supplier_Branch.Supplier) and'
      '  (Purch_Ord.Branch_no = Supplier_Branch.Branch_no)'
      '  ) and'
      '  (Supplier_Branch.Supplier = Supplier.Supplier)'
      'order by'
      '  Sel1'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 266
    Top = 40
    ParamData = <
      item
        Name = 'Int_Sel_Code'
        DataType = ftInteger
      end>
  end
end
