object PBRPCustCreditTermsFrm: TPBRPCustCreditTermsFrm
  Left = 50
  Top = 99
  Caption = 'Credit Terms Letter'
  ClientHeight = 712
  ClientWidth = 1197
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 152
    Top = 24
    Width = 794
    Height = 1123
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
      Left = 38
      Top = 38
      Width = 718
      Height = 875
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2315.104166666667000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel3: TQRLabel
        Left = 456
        Top = 130
        Width = 259
        Height = 41
        Size.Values = (
          108.479166666666700000
          1206.500000000000000000
          343.958333333333300000
          685.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Credit Terms Letter'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
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
        Left = 0
        Top = 0
        Width = 717
        Height = 90
        Size.Values = (
          238.125000000000000000
          0.000000000000000000
          0.000000000000000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object CustomerAddMemo: TQRMemo
        Left = 40
        Top = 162
        Width = 337
        Height = 116
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
        Font.Height = -13
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
        Left = 40
        Top = 312
        Width = 38
        Height = 19
        Size.Values = (
          50.270833333333330000
          105.833333333333300000
          825.500000000000000000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 40
        Top = 344
        Width = 110
        Height = 19
        Size.Values = (
          50.270833333333330000
          105.833333333333300000
          910.166666666666700000
          291.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Dear Sir or Madam'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 40
        Top = 384
        Width = 81
        Height = 19
        Size.Values = (
          50.270833333333330000
          105.833333333333300000
          1016.000000000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Account:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 144
        Top = 384
        Width = 78
        Height = 19
        Size.Values = (
          50.270833333333330000
          381.000000000000000000
          1016.000000000000000000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Account'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 40
        Top = 424
        Width = 485
        Height = 19
        Size.Values = (
          50.270833333333330000
          105.833333333333300000
          1121.833333333333000000
          1283.229166666667000000)
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
        Font.Height = -13
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
        Left = 40
        Top = 456
        Width = 89
        Height = 19
        Size.Values = (
          50.270833333333330000
          105.833333333333300000
          1206.500000000000000000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CREDIT LIMIT:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 40
        Top = 488
        Width = 100
        Height = 19
        Size.Values = (
          50.270833333333330000
          105.833333333333300000
          1291.166666666667000000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CREDIT TERMS: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 168
        Top = 488
        Width = 99
        Height = 19
        Size.Values = (
          50.270833333333330000
          444.500000000000000000
          1291.166666666667000000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblCreditTerms'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 168
        Top = 456
        Width = 91
        Height = 19
        Size.Values = (
          50.270833333333330000
          444.500000000000000000
          1206.500000000000000000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblCreditLimit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrmCompanyDetails: TQRMemo
        Left = 535
        Top = 108
        Width = 179
        Height = 14
        Enabled = False
        Size.Values = (
          37.041666666666670000
          1415.520833333333000000
          285.750000000000000000
          473.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object memCreditTerms: TQRMemo
        Left = 42
        Top = 534
        Width = 675
        Height = 339
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
        Font.Height = -13
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
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 913
      Width = 718
      Height = 340
      AlignToBottom = True
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        899.583333333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object gtQRLabel6: TQRLabel
        Left = 40
        Top = 18
        Width = 80
        Height = 19
        Size.Values = (
          50.270833333333330000
          105.833333333333300000
          47.625000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Kind Regards,'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 40
        Top = 114
        Width = 89
        Height = 19
        Size.Values = (
          50.270833333333330000
          105.833333333333300000
          301.625000000000000000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Amanda Horler'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 40
        Top = 154
        Width = 187
        Height = 19
        Size.Values = (
          50.270833333333330000
          105.833333333333300000
          407.458333333333300000
          494.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Head of Compliance and Finance'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 40
        Top = 66
        Width = 175
        Height = 25
        Size.Values = (
          66.145833333333330000
          105.833333333333300000
          174.625000000000000000
          463.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Am anda Horler'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Lucida Handwriting'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
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
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode,'
      '        Phone,'
      '        Fax_Number,'
      '        Email,'
      '        Credit_Terms_Notes'
      'from Company'
      'where Company = 1'
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
