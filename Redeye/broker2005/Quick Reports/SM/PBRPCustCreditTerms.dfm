object PBRPCustCreditTermsFrm: TPBRPCustCreditTermsFrm
  Left = 50
  Top = 99
  Caption = 'Credit Terms Letter'
  ClientHeight = 746
  ClientWidth = 1197
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 229
    Top = -1088
    Width = 992
    Height = 1641
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryDetails
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 2
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand1: TQRBand
      Left = 47
      Top = 47
      Width = 898
      Height = 1094
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2315.633333333333000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel3: TQRLabel
        Left = 50
        Top = 95
        Width = 343
        Height = 51
        Size.Values = (
          107.950000000000000000
          105.833333333333300000
          201.083333333333300000
          726.016666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Credit Terms Letter'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 22
      end
      object imgReport: TQRImage
        Left = 440
        Top = 0
        Width = 458
        Height = 88
        Size.Values = (
          186.266666666666700000
          931.333333333333300000
          0.000000000000000000
          969.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object CustomerAddMemo: TQRMemo
        Left = 50
        Top = 203
        Width = 421
        Height = 145
        Size.Values = (
          306.916666666666700000
          105.833333333333300000
          428.625000000000000000
          891.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        Lines.Strings = (
          'Invoice To XXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          ' ')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object gtQRSysData1: TQRSysData
        Left = 50
        Top = 390
        Width = 47
        Height = 24
        Size.Values = (
          50.800000000000000000
          105.833333333333300000
          825.500000000000000000
          99.483333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel1: TQRLabel
        Left = 50
        Top = 430
        Width = 141
        Height = 24
        Size.Values = (
          50.800000000000000000
          105.833333333333300000
          910.166666666666700000
          298.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Dear Sir or Madam'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel2: TQRLabel
        Left = 50
        Top = 480
        Width = 106
        Height = 24
        Size.Values = (
          50.800000000000000000
          105.833333333333300000
          1016.000000000000000000
          224.366666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Account:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblAccountCode: TQRLabel
        Left = 180
        Top = 480
        Width = 101
        Height = 24
        Size.Values = (
          50.800000000000000000
          381.000000000000000000
          1016.000000000000000000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Account'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel3: TQRLabel
        Left = 50
        Top = 530
        Width = 607
        Height = 24
        Size.Values = (
          50.800000000000000000
          105.833333333333300000
          1121.833333333333000000
          1284.816666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'I would like to take this opportunity to confirm the authorised ' +
          'credit terms as follows:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel4: TQRLabel
        Left = 50
        Top = 570
        Width = 112
        Height = 24
        Size.Values = (
          50.800000000000000000
          105.833333333333300000
          1206.500000000000000000
          237.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CREDIT LIMIT:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel5: TQRLabel
        Left = 50
        Top = 610
        Width = 131
        Height = 24
        Size.Values = (
          50.800000000000000000
          105.833333333333300000
          1291.166666666667000000
          277.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CREDIT TERMS: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblCreditTerms: TQRLabel
        Left = 210
        Top = 610
        Width = 120
        Height = 24
        Size.Values = (
          50.800000000000000000
          444.500000000000000000
          1291.166666666667000000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblCreditTerms'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblCreditLimit: TQRLabel
        Left = 210
        Top = 570
        Width = 109
        Height = 24
        Size.Values = (
          50.800000000000000000
          444.500000000000000000
          1206.500000000000000000
          230.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblCreditLimit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object memCreditTerms: TQRMemo
        Left = 53
        Top = 668
        Width = 844
        Height = 424
        Size.Values = (
          896.937500000000000000
          111.125000000000000000
          1412.875000000000000000
          1785.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        Lines.Strings = (
          
            'We reserve the right to amend these notes at will and when we li' +
            'ke!')
        ParentFont = False
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrmCompanyDetails: TQRMemo
        Left = 599
        Top = 105
        Width = 118
        Height = 206
        Size.Values = (
          436.033333333333300000
          1267.883333333333000000
          222.250000000000000000
          249.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object QRBand2: TQRBand
      Left = 47
      Top = 1141
      Width = 898
      Height = 425
      AlignToBottom = True
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        899.583333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object gtQRLabel6: TQRLabel
        Left = 50
        Top = 23
        Width = 105
        Height = 24
        Size.Values = (
          50.800000000000000000
          105.833333333333300000
          48.683333333333330000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Kind Regards,'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblOperatorName: TQRLabel
        Left = 50
        Top = 142
        Width = 110
        Height = 24
        Size.Values = (
          50.800000000000000000
          105.833333333333300000
          300.566666666666700000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Amanda Horler'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblOperatorPosition: TQRLabel
        Left = 50
        Top = 192
        Width = 245
        Height = 24
        Size.Values = (
          50.800000000000000000
          105.833333333333300000
          406.400000000000000000
          518.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Head of Compliance and Finance'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblOperatorSignature: TQRLabel
        Left = 50
        Top = 83
        Width = 214
        Height = 31
        Size.Values = (
          65.616666666666670000
          105.833333333333300000
          175.683333333333300000
          452.966666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Am anda Horler'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Lucida Handwriting'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object qrmRegNumber: TQRMemo
        Left = 191
        Top = 347
        Width = 703
        Height = 16
        Size.Values = (
          33.866666666666670000
          404.283333333333300000
          734.483333333333300000
          1488.016666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Lato Light'
        Font.Style = []
        Lines.Strings = (
          
            'Service Graphics (A trading division of Paragon Group Ltd), Regi' +
            'stered in England & Wales Company Registration No: 00551336')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object qrmRegOffice: TQRMemo
        Left = 587
        Top = 365
        Width = 307
        Height = 16
        Size.Values = (
          33.866666666666670000
          1242.483333333333000000
          772.583333333333300000
          649.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Lato Light'
        Font.Style = []
        Lines.Strings = (
          'Registered address 1 Onslow Street London EC1N 8AS')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object qrmVatNumber: TQRMemo
        Left = 813
        Top = 382
        Width = 81
        Height = 16
        Size.Values = (
          33.866666666666670000
          1720.850000000000000000
          808.566666666666700000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Lato Light'
        Font.Style = []
        Lines.Strings = (
          'VAT registered')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
    end
  end
  object qryDetails: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer.Customer,'
      '        Customer.Name as Customer_Name,'
      '        Customer.Settlement_Discount,'
      '        Customer.Settlement_Days,'
      '        Customer.Credit_Limit,'
      '        Customer.Payment_Terms,'
      '        Payment_Terms.Payment_Terms_Description,'
      '        Credit_Status.Credit_Status,'
      '        Credit_Status.Credit_Status_Descr,'
      '        Customer_Branch.Inv_To_Customer,'
      '        Customer_Branch.Inv_To_Branch,'
      '        Inv_Branch.Use_Branch_Name,'
      '        Inv_Branch.Name as Branch_Name,'
      '        Inv_Branch.Building_No_name,'
      '        Inv_Branch.Street,'
      '        Inv_Branch.Locale,'
      '        Inv_Branch.Town,'
      '        Inv_Branch.Postcode,'
      '        Inv_Branch.County,'
      '        Inv_Branch.Phone,'
      '        Inv_Branch.Fax_Number,'
      '        Inv_Branch.Account_Code'
      'FROM Payment_Terms'
      '      RIGHT JOIN ((Credit_Status'
      '      INNER JOIN Customer'
      '        ON Credit_Status.Credit_Status = Customer.Credit_Status)'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN Customer_Branch AS Inv_Branch'
      
        '        ON (Customer_Branch.Inv_To_Customer = Inv_Branch.Custome' +
        'r) AND (Customer_Branch.Inv_To_Branch = Inv_Branch.Branch_no))'
      '        ON Customer.Customer = Customer_Branch.Customer)'
      '        ON Payment_Terms.Payment_Terms = Customer.Payment_Terms'
      
        'WHERE Customer.Customer = :Customer AND Customer_Branch.Branch_n' +
        'o = 0')
    Left = 80
    Top = 88
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object CompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Company.Name as Company_Name,'
      '        Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode,'
      '        Phone,'
      '        Fax_Number,'
      '        Email,'
      '        Company_Reg_No,'
      '        Registered_Office_Address,'
      '        VAT_Registration_No,'
      '        Credit_Terms_Notes'
      'from Company'
      'where Company = 1'
      ''
      ' ')
    Left = 85
    Top = 32
  end
  object GetNarrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'From Narrative_Line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line')
    Left = 80
    Top = 157
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
end
