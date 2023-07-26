object PBRPSupCapFrm: TPBRPSupCapFrm
  Left = 125
  Top = 161
  Width = 812
  Height = 520
  HorzScrollBar.Position = 43
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  AutoScroll = False
  Caption = 'Purchase Orders Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 14
  object SupCapQuickReport: TQuickRep
    Left = -35
    Top = 56
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = SupCapQuickReportBeforePrint
    DataSet = GetDetsSQL
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
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
    Page.Orientation = poLandscape
    Page.PaperSize = Default
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    ReportTitle = 'Purchase Orders'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object PageHeaderQRBand: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 123
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        325.437500000000000000
        2770.187500000000000000)
      BandType = rbPageHeader
      object QRLabel3: TQRLabel
        Left = 341
        Top = 10
        Width = 191
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          902.229166666666700000
          26.458333333333330000
          505.354166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Supplier Capabilities'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object RunDateQRLabel: TQRLabel
        Left = 544
        Top = 10
        Width = 108
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1439.333333333333000000
          26.458333333333330000
          285.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '- Run Date:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object RepSelectQRLabel: TQRLabel
        Left = 277
        Top = 40
        Width = 616
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          732.895833333333000000
          105.833333333333000000
          1629.833333333330000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'RepSelectQRLabel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DetHeadQRLabel: TQRLabel
        Left = 32
        Top = 98
        Width = 214
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          84.666666666666700000
          259.291666666667000000
          566.208333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DetalHeading'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 384
        Top = 98
        Width = 214
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1016.000000000000000000
          259.291666666667000000
          566.208333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Capabilities'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object FooterQRBand: TQRBand
      Left = 38
      Top = 241
      Width = 1047
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = FooterQRBandBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      BandType = rbPageFooter
      object PageNoQRLabel: TQRLabel
        Left = 480
        Top = 12
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          31.750000000000000000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Page No.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object RepTotsQRGroup: TQRGroup
      Left = 38
      Top = 161
      Width = 1047
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        2770.187500000000000000)
      Master = SupCapQuickReport
      ReprintOnNewPage = False
    end
    object DetQRBand: TQRBand
      Left = 38
      Top = 220
      Width = 1047
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = DetQRBandBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        2770.187500000000000000)
      BandType = rbDetail
      object DetailQRLabel: TQRLabel
        Left = 32
        Top = 2
        Width = 345
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          84.666666666666700000
          5.291666666666670000
          912.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DetailQRLabel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object CapsQRMemo: TQRMemo
        Left = 387
        Top = 2
        Width = 642
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1023.937500000000000000
          5.291666666666670000
          1698.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object SubGrpQRGroup: TQRGroup
      Left = 38
      Top = 180
      Width = 1047
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = SubGrpQRGroupBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      Master = SupCapQuickReport
      ReprintOnNewPage = False
      object SubGrpQRLabel: TQRLabel
        Left = 8
        Top = 18
        Width = 377
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          47.625000000000000000
          997.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SupGrpQRLabel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object CapsMemo: TMemo
    Left = 189
    Top = 8
    Width = 185
    Height = 89
    Lines.Strings = (
      'CapsMemo')
    TabOrder = 1
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      '')
    Left = 48
    Top = 16
  end
  object GetSuppPTSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  DISTINCT Supplier.Name as Sup_Name,'
      '        Supplier_Branch.Name as Branch_Name,'
      '        Product_Type.Description as PT_Name,'
      '        Splr_BrnchPrdct_TypCpblty.Supplier,'
      '        Splr_BrnchPrdct_TypCpblty.Branch_No,'
      '        Splr_BrnchPrdct_TypCpblty.Product_Type'
      
        '        From Splr_BrnchPrdct_TypCpblty, Supplier,Product_Type, S' +
        'upplier_Branch'
      
        '        Where (Splr_BrnchPrdct_TypCpblty.Supplier = Supplier.Sup' +
        'plier) and'
      
        '              (Splr_BrnchPrdct_TypCpblty.Supplier = Supplier_Bra' +
        'nch.Supplier) and'
      
        '              (Splr_BrnchPrdct_TypCpblty.Branch_No = Supplier_Br' +
        'anch.Branch_No) and'
      
        '              (Splr_BrnchPrdct_TypCpblty.Product_Type = Product_' +
        'Type.Product_Type) and'
      '              ((Supplier.Acc_Active = '#39'Y'#39'))'
      ''
      ' ')
    Left = 144
    Top = 24
  end
  object GetCapsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Product_TypeCapability.Description, Product_TypeCapabilit' +
        'y.Default_For_All'
      'From Product_TypeCapability, Splr_BrnchPrdct_TypCpblty'
      'Where (Splr_BrnchPrdct_TypCpblty.Supplier = :Supplier) and'
      '      (Splr_BrnchPrdct_TypCpblty.Branch_No = :Branch_No) and'
      
        '      (Splr_BrnchPrdct_TypCpblty.Product_Type = :Product_Type) a' +
        'nd'
      
        '      (Product_TypeCapability.Product_Type = Splr_BrnchPrdct_Typ' +
        'Cpblty.Product_Type) and'
      
        '      (Product_TypeCapability.Capability = Splr_BrnchPrdct_TypCp' +
        'blty.Capability) AND'
      
        '      ((Product_TypeCapability.InActive = '#39'N'#39') OR (Product_TypeC' +
        'apability.InActive IS NULL))'
      'Order By Product_TypeCapability.Description'
      ''
      ' ')
    Left = 88
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end>
  end
end
