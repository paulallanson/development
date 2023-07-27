object PBRSQuoNFrm: TPBRSQuoNFrm
  Left = 434
  Top = 183
  BorderIcons = [biSystemMenu]
  Caption = 'Quotation Print'
  ClientHeight = 306
  ClientWidth = 447
  Color = clBtnFace
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 625
  Constraints.MinHeight = 205
  Constraints.MinWidth = 415
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object pnlButtons: TPanel
    ParentBackground = False
    Left = 0
    Top = 115
    Width = 447
    Height = 172
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 128
    ExplicitWidth = 459
    object cbPrintLogo: TCheckBox
      Left = 10
      Top = 44
      Width = 169
      Height = 17
      Caption = 'Print Company Logo'
      TabOrder = 0
      Visible = False
      OnClick = cbPrintLogoClick
    end
    object CancelBitBtn: TBitBtn
      Left = 10
      Top = 124
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
      TabOrder = 1
    end
    object PreviewBitBtn: TBitBtn
      Left = 161
      Top = 124
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
      TabOrder = 2
      OnClick = PreviewBitBtnClick
    end
    object PrintBitBtn: TBitBtn
      Left = 247
      Top = 124
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
      TabOrder = 3
      OnClick = PrintBitBtnClick
    end
    object TypeRadioGroup: TRadioGroup
      ParentBackground = False
      Left = 245
      Top = 42
      Width = 164
      Height = 65
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'One letter per line'
        'One letter for all lines')
      ParentFont = False
      TabOrder = 4
      OnClick = TypeRadioGroupClick
    end
    object EmailBitBtn: TBitBtn
      Left = 332
      Top = 124
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
      TabOrder = 5
      OnClick = EmailBitBtnClick
    end
    object GroupBox1: TGroupBox
      ParentBackground = False
      Left = 8
      Top = 64
      Width = 217
      Height = 41
      TabOrder = 6
      object EstNumLabel: TLabel
        Left = 4
        Top = 22
        Width = 89
        Height = 14
        AutoSize = False
        Caption = 'Enquiry Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object EnquiryMemo: TMemo
        Left = 98
        Top = 11
        Width = 111
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        WantReturns = False
        WordWrap = False
        OnChange = CanPrint
        OnKeyPress = EnquiryMemoKeyPress
        OnKeyUp = EnquiryMemoKeyUp
      end
    end
    object chkbxAttachPriceList: TCheckBox
      Left = 10
      Top = 20
      Width = 217
      Height = 17
      Caption = 'Attach Studio Price List'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 7
    end
  end
  object pnlReminder: TPanel
    ParentBackground = False
    Left = 0
    Top = 71
    Width = 447
    Height = 44
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 459
    ExplicitHeight = 57
    object GroupBox2: TGroupBox
      ParentBackground = False
      Left = 8
      Top = 0
      Width = 272
      Height = 45
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
  object pnlTop: TPanel
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 447
    Height = 71
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 459
    object gbLayouts: TGroupBox
      ParentBackground = False
      Left = 8
      Top = -1
      Width = 272
      Height = 68
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
        Width = 177
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        OnChange = CanPrint
      end
      object cmbLetterLayout: TComboBox
        Left = 88
        Top = 38
        Width = 177
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnChange = CanPrint
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 287
    Width = 447
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
    ExplicitTop = 300
    ExplicitWidth = 459
  end
  object GetEnqSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT distinct (Customer.Name) as Cust_Name,'
      '       EnquiryLine.Enquiry, '
      '       Enquiry.Customer, '
      '       Enquiry.Branch_No, '
      '       Enquiry.Contact_no,'
      '       Enquiry.Description,'
      '       Enquiry.Customer_Quote_Date,'
      '       Enquiry.Office_Contact,'
      '       Customer_Branch.Name as Branch_Name, '
      '       Customer_Branch.Fax_Number,'
      '       Customer_Contact.Email,'
      '       Customer_Contact.Salutation, '
      '       Customer_Contact.Fax_Number as Contact_Fax, '
      '       Customer_Contact.Exportfilter, '
      '       Customer_Contact.Name as Contact_Name,'
      '       Exportfilter.Description as Exportfilter_Descr'
      'FROM Operator '
      #9'INNER JOIN (Customer '
      #9'INNER JOIN (Customer_Branch '
      #9'INNER JOIN ((Exportfilter RIGHT JOIN Customer_Contact ON '
      #9#9'Exportfilter.Exportfilter = Customer_Contact.Exportfilter) '
      #9'INNER JOIN (Enquiry '
      #9'INNER JOIN (Supplier_EnquiryQty '
      #9'INNER JOIN EnquiryLine ON '
      #9#9'(Supplier_EnquiryQty.Line = EnquiryLine.Line) AND '
      #9#9'(Supplier_EnquiryQty.Enquiry = EnquiryLine.Enquiry)) ON '
      #9#9'Enquiry.Enquiry = EnquiryLine.Enquiry) ON '
      #9#9'(Customer_Contact.Contact_no = Enquiry.Contact_no) AND '
      #9#9'(Customer_Contact.Branch_no = Enquiry.Branch_no) AND '
      #9#9'(Customer_Contact.Customer = Enquiry.Customer)) ON '
      #9#9'(Customer_Branch.Branch_no = Customer_Contact.Branch_no) AND '
      #9#9'(Customer_Branch.Customer = Customer_Contact.Customer)) ON '
      #9#9'Customer.Customer = Customer_Contact.Customer) ON '
      #9#9'Operator.Operator = Enquiry.Operator'
      'where'
      '      ((Enquiry.Enquiry = :Enquiry ) or'
      '      ((:Enquiry = 0) and (EnquiryLine.Enquiry_Status >= 45) and'
      
        '                              (EnquiryLine.Enquiry_Status <= 50)' +
        ')) and'
      '       ((Enquiry.Operator = :Operator ) or (:Operator = 0)) and'
      '      (Supplier_EnquiryQty.Price_Selected = '#39'Y'#39')  and'
      '      (EnquiryLine.Enq_InActive <> '#39'Y'#39')'
      'Order By EnquiryLine.Enquiry'
      ''
      ' '
      ' '
      ' ')
    Left = 296
    Top = 72
    ParamData = <
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end>
  end
end
