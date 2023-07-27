object PBRSEnqNFrm: TPBRSEnqNFrm
  Left = 212
  Top = 187
  BorderIcons = [biSystemMenu]
  Caption = 'Enquiry Print'
  ClientHeight = 225
  ClientWidth = 417
  Color = clBtnFace
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 610
  Constraints.MinHeight = 192
  Constraints.MinWidth = 419
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object pnlButtons: TPanel
    Left = 0
    Top = 109
    Width = 417
    Height = 97
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 122
    ExplicitWidth = 429
    object CancelBitBtn: TBitBtn
      Left = 9
      Top = 55
      Width = 75
      Height = 25
      Caption = '&Cancel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
      OnClick = CancelBitBtnClick
    end
    object PreviewBitBtn: TBitBtn
      Left = 153
      Top = 55
      Width = 75
      Height = 25
      Caption = 'Pre&view'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
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
      Left = 241
      Top = 55
      Width = 75
      Height = 25
      Caption = '&Print'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
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
    object EmailBitBtn: TBitBtn
      Left = 328
      Top = 55
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
      TabOrder = 3
      OnClick = EmailBitBtnClick
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = -3
      Width = 225
      Height = 41
      TabOrder = 4
      object EstNumLabel: TLabel
        Left = 8
        Top = 17
        Width = 75
        Height = 13
        Caption = 'Enquiry Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EnquiryMemo: TMemo
        Left = 88
        Top = 11
        Width = 129
        Height = 25
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        WantReturns = False
        WordWrap = False
        OnExit = EnquiryMemoExit
        OnKeyPress = EnquiryMemoKeyPress
        OnKeyUp = EnquiryMemoKeyUp
      end
    end
    object CBFileCpy: TCheckBox
      Left = 253
      Top = 11
      Width = 130
      Height = 16
      Caption = 'Print File Copy'
      TabOrder = 5
      Visible = False
      OnClick = CBFileCpyClick
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 429
    object gbLayouts: TGroupBox
      Left = 8
      Top = 4
      Width = 265
      Height = 72
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 15
        Width = 63
        Height = 13
        Caption = 'Paper Layout'
      end
      object Label2: TLabel
        Left = 8
        Top = 42
        Width = 62
        Height = 13
        Caption = 'Letter Layout'
      end
      object cmbPageLayout: TComboBox
        Left = 88
        Top = 11
        Width = 169
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = CanPrint
      end
      object cmbLetterLayout: TComboBox
        Left = 88
        Top = 38
        Width = 169
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnChange = CanPrint
      end
    end
  end
  object pnlReminder: TPanel
    Left = 0
    Top = 81
    Width = 417
    Height = 28
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 429
    ExplicitHeight = 41
    object GroupBox2: TGroupBox
      Left = 8
      Top = -5
      Width = 266
      Height = 40
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 18
        Width = 71
        Height = 13
        Caption = 'Reminder Date'
      end
      object dtReminderDate: TDateTimePicker
        Left = 88
        Top = 14
        Width = 129
        Height = 21
        Date = 42548.000000000000000000
        Time = 0.588667349540628500
        TabOrder = 0
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 206
    Width = 417
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
    ExplicitTop = 219
    ExplicitWidth = 429
  end
  object GetEnqSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT  distinct Supplier.Name, Supplier_Branch.Building_No_Name' +
        ','
      
        '       Supplier_Branch.Street, Supplier_Branch.Locale, Supplier_' +
        'Branch.Town,'
      '       Supplier_Branch.PostCode, Supplier_Branch.Phone,'
      '       Supplier_Branch.Fax_Number, EnquiryLine.Enquiry,'
      
        '       Enquiry.Customer, Enquiry.Branch_no, Enquiry.Contact_no, ' +
        'Enquiry.Description, Enquiry.Office_Contact'
      'From Enquiry, EnquiryLine, Supplier_Branch, Supplier_Enquiry,'
      '         Supplier, Rep, Operator'
      'Where ((Enquiry.Enquiry = :Enquiry ) or'
      
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
      ' ')
    Left = 336
    Top = 16
    ParamData = <
      item
        Name = 'Enquiry'
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
      '        Supplier_Branch.Fax_Number,'
      '        Supplier_Branch.Email as branchEmail,'
      '        Supplier_BranchContacts.Email,'
      '        Supplier_BranchContacts.Salutation,'
      '        Supplier_BranchContacts.Fax_Number as Contact_Fax,'
      '        Supplier_BranchContacts.Exportfilter,'
      '        Supplier_BranchContacts.Name AS Contact_Name,'
      '        Supplier_BranchContacts.Contact_no,'
      '        Exportfilter.Description as ExportFilter_Descr'
      'FROM Exportfilter'
      
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
        'portfilter'
      'WHERE     ((Enquiry.Enquiry = :Enquiry ) or'
      
        '          ((:Enquiry = 0) and Supplier_Enquiry.Printed_Enquiry <' +
        '> '#39'Y'#39')) and'
      '       ((Enquiry.Operator = :Operator ) or (:Operator = 0)) and'
      '      (EnquiryLine.Enq_InActive <> '#39'Y'#39')'
      'ORDER BY Supplier_Enquiry.Supplier, EnquiryLine.Enquiry'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    Left = 336
    Top = 72
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Operator'
      end>
  end
end
