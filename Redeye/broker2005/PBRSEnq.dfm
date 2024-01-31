object PBRSEnqFrm: TPBRSEnqFrm
  Left = 196
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Enquiry Print'
  ClientHeight = 327
  ClientWidth = 407
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
  TextHeight = 13
  object MyOrAllRadioGroup: TRadioGroup
    Left = 272
    Top = 0
    Width = 129
    Height = 81
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'My Enquiries'
      'All Enquiries')
    ParentFont = False
    TabOrder = 0
  end
  object AllOrOneRadioGroup: TRadioGroup
    Left = -1
    Top = 0
    Width = 242
    Height = 81
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemIndex = 2
    Items.Strings = (
      'All Unprinted Enquiries'
      'Selected Enquiries, All Unprinted Lines'
      'Selected Enquiries, All Lines')
    ParentFont = False
    TabOrder = 1
    OnClick = AllOrOneRadioGroupClick
  end
  object gbLayouts: TGroupBox
    Left = 0
    Top = 81
    Width = 401
    Height = 68
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 15
      Width = 66
      Height = 13
      Caption = 'Paper Layout'
    end
    object Label2: TLabel
      Left = 8
      Top = 42
      Width = 66
      Height = 13
      Caption = 'Letter Layout'
    end
    object cmbPageLayout: TComboBox
      Left = 88
      Top = 11
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
    object cmbLetterLayout: TComboBox
      Left = 88
      Top = 38
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
    object cbPrintLogo: TCheckBox
      Left = 261
      Top = 16
      Width = 130
      Height = 16
      Caption = 'Print Company Logo'
      TabOrder = 2
      Visible = False
      OnClick = cbPrintLogoClick
    end
    object CBFileCpy: TCheckBox
      Left = 261
      Top = 43
      Width = 130
      Height = 16
      Caption = 'Print File Copy'
      TabOrder = 3
      OnClick = CBFileCpyClick
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 159
    Width = 407
    Height = 168
    Align = alBottom
    Anchors = [akLeft, akBottom]
    TabOrder = 3
    object CancelBitBtn: TBitBtn
      Left = 9
      Top = 135
      Width = 75
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
      TabOrder = 0
    end
    object PreviewBitBtn: TBitBtn
      Left = 89
      Top = 135
      Width = 75
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
      TabOrder = 1
      OnClick = PreviewBitBtnClick
    end
    object PrintBitBtn: TBitBtn
      Left = 169
      Top = 135
      Width = 75
      Height = 25
      Caption = '&Print'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 2
      OnClick = PrintBitBtnClick
    end
    object FaxBitBtn: TBitBtn
      Left = 249
      Top = 135
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
      TabOrder = 3
      OnClick = FaxBitBtnClick
    end
    object EmailBitBtn: TBitBtn
      Left = 328
      Top = 135
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
      TabOrder = 4
      OnClick = EmailBitBtnClick
    end
    object SelectionGroup: TGroupBox
      Left = 8
      Top = 8
      Width = 393
      Height = 121
      Caption = 'Enquiry Number Selection'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object Label3: TLabel
        Left = 8
        Top = 71
        Width = 222
        Height = 39
        Caption = 
          'Enter enquiry numbers and/or enquiry ranges separated by commas.' +
          ' For example, 1234, 1236, 1240-1245'
        WordWrap = True
      end
      object EnqLUSpeedButton: TSpeedButton
        Left = 312
        Top = 35
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
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
        OnChange = CanPrint
        OnKeyPress = SelectionMemoKeyPress
        OnKeyUp = SelectionMemoKeyUp
      end
      object SelectLst: TListBox
        Left = 272
        Top = 8
        Width = 25
        Height = 105
        ItemHeight = 13
        Sorted = True
        TabOrder = 1
        Visible = False
      end
    end
  end
  object GetEnqSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT  distinct Supplier.Name, Supplier_Branch.Building_No_Name' +
        ','
      
        '       Supplier_Branch.Street, Supplier_Branch.Locale, Supplier_' +
        'Branch.Town,'
      '       Supplier_Branch.PostCode, Supplier_Branch.Phone,'
      '       Supplier_Branch.Fax_Number, EnquiryLine.Enquiry'
      'From Enquiry, EnquiryLine, Supplier_Branch, Supplier_Enquiry, '
      '         Supplier, Rep, Operator, Int_sel'
      
        'Where (((Int_Sel.Int_sel_Code = :iintselcode) and (int_sel.sel1 ' +
        '= enquiry.enquiry)) or'
      
        '      ((:Enquiry = 0) and Supplier_Enquiry.Printed_Enquiry <>'#39'Y'#39 +
        ')) and'
      
        '      ((Supplier_Enquiry.Supplier = :Supplier ) or (:Supplier = ' +
        '0)) and'
      '      ((Enquiry.Operator = :Operator ) or (:Operator = 0)) and'
      #9#9' (Enquiry.Enquiry = EnquiryLine.Enquiry) and'
      '      (Supplier_Enquiry.Enquiry = EnquiryLine.Enquiry) and'
      '      (Supplier_Enquiry.Line = EnquiryLine.Line) and'
      '      (Supplier_Branch.Supplier = Supplier_Enquiry.Supplier) and'
      
        '      (Supplier_Branch.Branch_No = Supplier_Enquiry.Branch_No) a' +
        'nd'
      '      (Supplier.Supplier = Supplier_Branch.Supplier) and'
      '      (Enquiry.Rep = Rep.Rep) and'
      '      (Enquiry.Office_Contact = Operator.Operator) and'
      '      (EnquiryLine.Enq_InActive <> '#39'Y'#39')'
      'Order By EnquiryLine.Enquiry'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 200
    Top = 8
    ParamData = <
      item
        Name = 'iintselcode'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Operator'
      end>
  end
  object GetEnqSuppSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  distinct (Supplier.Name) AS Supp_Name,'
      '        EnquiryLine.Enquiry,'
      '        Supplier_Enquiry.Supplier,'
      '        Supplier_Enquiry.Branch_no,'
      '        Supplier_Enquiry.Contact_no,'
      '        Supplier_Branch.Name AS Branch_Name,'
      '        Supplier_Branch.Phone,'
      '        Supplier_Branch.Fax_Number, '
      '        Supplier_Branch.Email as branchEmail,'
      '        Supplier_BranchContacts.Email,'
      '        Supplier_BranchContacts.Salutation,'
      '        Supplier_BranchContacts.Fax_Number as Contact_Fax,'
      '        Supplier_BranchContacts.Exportfilter,'
      '        Supplier_BranchContacts.Name AS Contact_Name,'
      '        Supplier_BranchContacts.Contact_no,'
      '        Exportfilter.Description as ExportFilter_Descr'
      'FROM int_Sel Inner Join (Exportfilter'
      
        '      RIGHT JOIN (((Enquiry INNER JOIN Rep ON Enquiry.Rep = Rep.' +
        'Rep)'
      
        '      INNER JOIN EnquiryLine ON Enquiry.Enquiry = EnquiryLine.En' +
        'quiry)'
      '      INNER JOIN (Supplier_Branch'
      '      INNER JOIN ((Supplier_BranchContacts'
      '        RIGHT JOIN Supplier_Enquiry'
      
        '          ON (Supplier_BranchContacts.Supplier = Supplier_Enquir' +
        'y.Supplier) AND'
      
        '            (Supplier_BranchContacts.Branch_no = Supplier_Enquir' +
        'y.Branch_no) AND'
      
        '            (Supplier_BranchContacts.Contact_no = Supplier_Enqui' +
        'ry.Contact_no))'
      
        '      INNER JOIN Supplier ON Supplier_Enquiry.Supplier = Supplie' +
        'r.Supplier) ON'
      
        '          (Supplier_Branch.Branch_no = Supplier_Enquiry.Branch_n' +
        'o) AND'
      
        '          (Supplier_Branch.Supplier = Supplier_Enquiry.Supplier)' +
        ') ON'
      '          (EnquiryLine.Line = Supplier_Enquiry.Line) AND'
      '          (EnquiryLine.Enquiry = Supplier_Enquiry.Enquiry)) ON'
      
        '          Exportfilter.Exportfilter = Supplier_BranchContacts.Ex' +
        'portfilter) on Int_Sel.Sel1 = EnquiryLine.Enquiry'
      
        'WHERE     (((Int_Sel.Int_sel_Code = :iintselcode) and (int_sel.s' +
        'el1 = enquiry.enquiry)) or'
      
        '          ((:Enquiry = 0) and Supplier_Enquiry.Printed_Enquiry <' +
        '> '#39'Y'#39')) and'
      '       ((Enquiry.Operator = :Operator ) or (:Operator = 0)) and'
      '      (EnquiryLine.Enq_InActive <> '#39'Y'#39')'
      'ORDER BY Supplier_Enquiry.Supplier, EnquiryLine.Enquiry'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 208
    Top = 40
    ParamData = <
      item
        Name = 'iintselcode'
        DataType = ftInteger
      end
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Operator'
      end>
  end
  object GetLastIntSelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Int_Sel_Code) as Last_Code'
      'From Int_Sel'
      ' ')
    Left = 152
    Top = 76
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
    Left = 240
    Top = 76
    ParamData = <
      item
        Name = 'Int_Sel_Code'
        DataType = ftInteger
      end
      item
        Name = 'Text100'
        DataType = ftString
      end>
  end
  object DelWorkSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Int_Sel'
      'Where (Int_Sel_Code = :Int_Sel_Code) '
      ' ')
    Left = 160
    Top = 132
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end>
  end
  object AddIntSelQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, text100)'
      'Values'
      '(:Int_Sel_Code, :Sel1, 0.00, 0.00, 0.00,:text100)'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 296
    Top = 112
    ParamData = <
      item
        Name = 'Int_Sel_Code'
        DataType = ftInteger
      end
      item
        Name = 'Sel1'
        DataType = ftFloat
      end
      item
        Name = 'text100'
        DataType = ftString
      end>
  end
end
