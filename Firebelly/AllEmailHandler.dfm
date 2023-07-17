object emailHandler: TemailHandler
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 304
  Width = 730
  object qrySelCustomerContacts: TQuery
    DatabaseName = 'Wt'
    SQL.Strings = (
      'select customer_contact.*,'
      '  contact_type.Description as contact_type_desc,'
      '  exportfilter.description as export_filter_desc '
      'from (customer_contact inner join contact_type on '
      ' customer_contact.contact_type = contact_type.contact_type)'
      ' left join exportfilter on'
      ' customer_contact.exportfilter = exportfilter.exportfilter'
      'where customer = :customer and '
      ' branch_no = :branch;'
      ' ')
    Left = 72
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'branch'
        ParamType = ptUnknown
      end>
  end
  object qryEmailList: TQuery
    DatabaseName = 'Wt'
    Left = 192
    Top = 16
  end
  object gtQRExportInterface1: TgtQRExportInterface
    DoBeginDoc = True
    DoEndDoc = True
    Left = 72
    Top = 112
  end
  object gtHTMLEngine1: TgtHTMLEngine
    FileExtension = 'htm'
    FileDescription = 'HyperText Markup Language'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifJPEG
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    Preferences.AutoScroll = False
    Preferences.OptimizeForIE = False
    Navigator.LinkFont.Charset = DEFAULT_CHARSET
    Navigator.LinkFont.Color = clBlue
    Navigator.LinkFont.Height = -27
    Navigator.LinkFont.Name = 'Wingdings'
    Navigator.LinkFont.Style = []
    TransparentBackground = True
    TOCPageSettings.ItemFont.Charset = DEFAULT_CHARSET
    TOCPageSettings.ItemFont.Color = clWindowText
    TOCPageSettings.ItemFont.Height = -12
    TOCPageSettings.ItemFont.Name = 'Segoe UI'
    TOCPageSettings.ItemFont.Style = []
    TOCPageSettings.TitleFont.Charset = DEFAULT_CHARSET
    TOCPageSettings.TitleFont.Color = clWindowText
    TOCPageSettings.TitleFont.Height = -12
    TOCPageSettings.TitleFont.Name = 'Segoe UI'
    TOCPageSettings.TitleFont.Style = []
    TOCPageSettings.Title = 'Table Of Contents'
    Left = 72
    Top = 176
  end
  object gtPDFEngine1: TgtPDFEngine
    FileExtension = 'pdf'
    FileDescription = 'Adobe PDF Files'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifJPEG
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    FontEncoding = feWinAnsiEncoding
    DigitalSignature.FieldProperties.Visible = True
    DigitalSignature.FieldProperties.PageNumber = 1
    DigitalSignature.FieldProperties.FieldAppearenceOptions = [sfaoShowName, sfaoShowReason, sfaoShowLocation, sfaoShowDate, sfaoShowLabels]
    DigitalSignature.SignatureProperties.DateTime = 45121.668233993060000000
    DigitalSignature.AppearenceImageAreaPercent = 0
    PDFVersion = PDF_VER14
    Left = 192
    Top = 176
  end
  object gtBMPEngine1: TgtBMPEngine
    FileExtension = 'bmp'
    FileDescription = 'Windows Bitmap'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifJPEG
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 312
    Top = 176
  end
  object gtRTFEngine1: TgtRTFEngine
    FileExtension = 'rtf'
    FileDescription = 'Rich Text Format'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifJPEG
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    Preferences.GraphicDataInBinary = False
    DocumentEncodingType = etPositionalAccuracy
    Left = 416
    Top = 176
  end
  object gtGIFEngine1: TgtGIFEngine
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifJPEG
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 520
    Top = 176
  end
  object gtJPEGEngine1: TgtJPEGEngine
    FileExtension = 'jpg'
    FileDescription = 'JPEG File Interchange Format'
    InputXRes = 96
    InputYRes = 96
    ReferencePoint = rpBand
    EMailSettings.AuthenticationRequired = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ImageSettings.SourceDPI = 96
    ImageSettings.OutputImageFormat = ifJPEG
    Page.Width = 8.267700000000000000
    Page.Height = 11.692900000000000000
    Page.BinNumber = 0
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 624
    Top = 176
  end
end
