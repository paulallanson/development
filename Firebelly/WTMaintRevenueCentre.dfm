object frmWTMaintRevenueCentre: TfrmWTMaintRevenueCentre
  Left = 381
  Top = 36
  BorderStyle = bsDialog
  Caption = 'Maintain Revenue Centre'
  ClientHeight = 659
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  DesignSize = (
    635
    659)
  TextHeight = 13
  object OKBitBtn: TBitBtn
    Left = 235
    Top = 618
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = OKBitBtnClick
    ExplicitTop = 609
  end
  object CancelBitBtn: TBitBtn
    Left = 323
    Top = 618
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 3
    OnClick = CancelBitBtnClick
    ExplicitTop = 609
  end
  object chkbxInActive: TCheckBox
    Left = 8
    Top = 622
    Width = 185
    Height = 17
    Caption = 'Revenue Centre is inactive'
    TabOrder = 1
  end
  object pcDetails: TPageControl
    Left = 8
    Top = 8
    Width = 617
    Height = 593
    ActivePage = tbsGeneral
    TabOrder = 0
    object tbsGeneral: TTabSheet
      Caption = 'Details'
      DesignSize = (
        609
        565)
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 59
        Height = 13
        Caption = 'Description'
      end
      object Label2: TLabel
        Left = 8
        Top = 60
        Width = 35
        Height = 13
        Caption = 'Colour'
      end
      object Label7: TLabel
        Left = 8
        Top = 108
        Width = 31
        Height = 13
        Caption = 'Image'
      end
      object Label3: TLabel
        Left = 8
        Top = 284
        Width = 43
        Height = 26
        Caption = 'Payment Details'
        WordWrap = True
      end
      object Label4: TLabel
        Left = 8
        Top = 380
        Width = 55
        Height = 39
        Caption = 'Registered Address Details'
        WordWrap = True
      end
      object Label5: TLabel
        Left = 8
        Top = 508
        Width = 86
        Height = 26
        Caption = 'VAT Registration No.'
        WordWrap = True
      end
      object Label25: TLabel
        Left = 8
        Top = 540
        Width = 92
        Height = 13
        Caption = 'Accounts Package'
      end
      object Label6: TLabel
        Left = 8
        Top = 474
        Width = 92
        Height = 13
        Caption = 'Company Reg No.'
      end
      object DescrEdit: TEdit
        Left = 118
        Top = 16
        Width = 411
        Height = 21
        MaxLength = 40
        TabOrder = 0
        Text = 'DescrEdit'
        OnChange = CheckOK
      end
      object edtColor: TEdit
        Left = 118
        Top = 56
        Width = 131
        Height = 21
        MaxLength = 40
        ReadOnly = True
        TabOrder = 1
        Text = 'Sample Text'
        OnChange = CheckOK
      end
      object Button1: TButton
        Left = 264
        Top = 54
        Width = 75
        Height = 25
        Caption = 'Colour'
        TabOrder = 2
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 344
        Top = 54
        Width = 75
        Height = 25
        Caption = 'Font'
        TabOrder = 3
        OnClick = Button2Click
      end
      object edtLogoPath: TEdit
        Left = 120
        Top = 104
        Width = 329
        Height = 21
        TabOrder = 4
        Text = 'edtLogoPath'
      end
      object Button3: TButton
        Left = 454
        Top = 102
        Width = 75
        Height = 25
        Caption = 'Browse'
        TabOrder = 5
        OnClick = Button3Click
      end
      object Panel1: TPanel
        Left = 120
        Top = 136
        Width = 217
        Height = 135
        BorderStyle = bsSingle
        ParentBackground = False
        TabOrder = 11
        object imgLogo: TImage
          Left = 1
          Top = 1
          Width = 211
          Height = 129
          Align = alClient
          Stretch = True
        end
      end
      object memRegistered: TMemo
        Left = 120
        Top = 381
        Width = 433
        Height = 76
        Lines.Strings = (
          'Memo2')
        ScrollBars = ssVertical
        TabOrder = 7
      end
      object memPayment: TMemo
        Left = 120
        Top = 281
        Width = 433
        Height = 88
        Anchors = [akLeft, akTop, akRight]
        ScrollBars = ssVertical
        TabOrder = 6
      end
      object edtVATRegistrationNo: TEdit
        Left = 120
        Top = 504
        Width = 315
        Height = 21
        MaxLength = 40
        TabOrder = 9
        Text = 'edtVATRegistrationNo'
        OnChange = CheckOK
      end
      object dblkpAccountsPackage: TDBLookupComboBox
        Left = 120
        Top = 536
        Width = 185
        Height = 21
        KeyField = 'Accounts_Package'
        ListField = 'Accounts_Package_Description'
        ListSource = dtsAccounts
        TabOrder = 10
      end
      object edtCompanyRegNo: TEdit
        Left = 120
        Top = 470
        Width = 315
        Height = 21
        MaxLength = 40
        TabOrder = 8
        Text = 'edtVATRegistrationNo'
        OnChange = CheckOK
      end
    end
    object tbsNumbers: TTabSheet
      Caption = 'Invoicing'
      ImageIndex = 1
      object grpbxNumbers: TGroupBox
        Left = 16
        Top = 24
        Width = 265
        Height = 121
        ParentBackground = False
        TabOrder = 0
        object Label21: TLabel
          Left = 24
          Top = 28
          Width = 103
          Height = 13
          Caption = 'Last Invoice Number'
        end
        object Label50: TLabel
          Left = 24
          Top = 60
          Width = 98
          Height = 13
          Caption = 'Last Credit Number'
        end
        object Label8: TLabel
          Left = 24
          Top = 92
          Width = 28
          Height = 13
          Caption = 'Prefix'
        end
        object edtLastInvoiceNumber: TCREditInt
          Left = 133
          Top = 24
          Width = 100
          Height = 21
          TabOrder = 0
          Text = 'edtLastInvoiceNumber'
        end
        object edtLastCreditNoteNumber: TCREditInt
          Left = 133
          Top = 56
          Width = 100
          Height = 21
          TabOrder = 1
          Text = 'edtLastCreditNoteNumber'
        end
        object edtPrefixValue: TEdit
          Left = 133
          Top = 88
          Width = 100
          Height = 21
          TabOrder = 2
          Text = 'edtPrefixValue'
        end
      end
      object chkbxUseSeparateInvoiceSeq: TCheckBox
        Left = 26
        Top = 21
        Width = 143
        Height = 17
        Caption = 'Use Seperate Numbering'
        TabOrder = 1
        OnClick = chkbxUseSeparateInvoiceSeqClick
      end
    end
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select max(Revenue_Centre) as Revenue_Centre'
      'From Revenue_Centre')
    Left = 416
    Top = 24
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Revenue_Centre'
      'Set     Revenue_Centre_Descr = :Revenue_Centre_Descr,'
      '        Inactive = :inactive,'
      '        Color = :Color,'
      '        Font_Color = :Font_Color,'
      '        Logo_Path = :Logo_Path,'
      '        Invoice_Payment_Notes = :Invoice_Payment_Notes,'
      '        Registered_Address = :Registered_Address,'
      '        Company_Reg_Number = :Company_Reg_Number,'
      '        VAT_Registration_No = :VAT_Registration_No,'
      '        Accounts_Package = :Accounts_Package,'
      '        Use_Separate_Invoice_Seq = :Use_Separate_Invoice_Seq,'
      '        Last_Invoice_Number = :Last_Invoice_Number,'
      '        Last_Credit_Note_Number = :Last_Credit_Note_Number,'
      '        Prefix_Value = :Prefix_Value'
      'Where'
      '(Revenue_Centre = :Revenue_Centre)'
      '')
    Left = 144
    Top = 16
    ParamData = <
      item
        Name = 'Revenue_Centre_Descr'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Color'
        DataType = ftInteger
      end
      item
        Name = 'Font_Color'
        DataType = ftInteger
      end
      item
        Name = 'Logo_Path'
        DataType = ftString
      end
      item
        Name = 'Invoice_Payment_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Registered_Address'
        DataType = ftString
      end
      item
        Name = 'Company_Reg_Number'
      end
      item
        Name = 'VAT_Registration_No'
      end
      item
        Name = 'Accounts_Package'
        DataType = ftInteger
      end
      item
        Name = 'Use_Separate_Invoice_Seq'
      end
      item
        Name = 'Last_Invoice_Number'
      end
      item
        Name = 'Last_Credit_Note_Number'
      end
      item
        Name = 'Prefix_Value'
      end
      item
        Name = 'Revenue_Centre'
      end>
  end
  object qryDelete: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Delete From Invoice_Location'
      'Where'
      '(Invoice_Location = :Invoice_Location)')
    Left = 240
    Top = 16
    ParamData = <
      item
        Name = 'Invoice_Location'
      end>
  end
  object DetsSRC: TDataSource
    Left = 408
    Top = 64
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      ''
      '')
    Left = 448
    Top = 68
  end
  object ColorDialog1: TColorDialog
    Left = 360
    Top = 91
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 
      'All (*.apf;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf)|*.apf;*.jpg;*.j' +
      'peg;*.bmp;*.ico;*.emf;*.wmf;*.png|APRO APF Format (*.apf)|*.apf|' +
      'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bi' +
      'tmaps (*.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles (*.em' +
      'f)|*.emf|Metafiles (*.wmf)|*.wmf'
    Left = 280
    Top = 96
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'insert into Revenue_Centre'
      '  (     Revenue_Centre_Descr,'
      '        Inactive,'
      '        Color,'
      '        Font_Color,'
      '        Logo_Path,'
      '        Invoice_Payment_Notes,'
      '        Registered_Address,'
      '        Company_Reg_Number,'
      '        VAT_Registration_No,'
      '        Accounts_Package,'
      '        Use_Separate_Invoice_Seq,'
      '        Last_Invoice_Number,'
      '        Last_Credit_Note_Number,'
      '        Prefix_Value'
      '  )'
      'values'
      '  (     :Revenue_Centre_Descr,'
      '        :inactive,'
      '        :Color,'
      '        :Font_Color,'
      '        :Logo_Path,'
      '        :Invoice_Payment_Notes,'
      '        :Registered_Address,'
      '        :Company_Reg_Number,'
      '        :VAT_Registration_No,'
      '        :Accounts_Package,'
      '        :Use_Separate_Invoice_Seq,'
      '        :Last_Invoice_Number,'
      '        :Last_Credit_Note_Number,'
      '        :Prefix_Value'
      '  )'
      '')
    Left = 312
    Top = 16
    ParamData = <
      item
        Name = 'Revenue_Centre_Descr'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Color'
        DataType = ftInteger
      end
      item
        Name = 'Font_Color'
        DataType = ftInteger
      end
      item
        Name = 'Logo_Path'
        DataType = ftString
      end
      item
        Name = 'Invoice_Payment_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Registered_Address'
        DataType = ftString
      end
      item
        Name = 'Company_Reg_Number'
      end
      item
        Name = 'VAT_Registration_No'
      end
      item
        Name = 'Accounts_Package'
        DataType = ftInteger
      end
      item
        Name = 'Use_Separate_Invoice_Seq'
      end
      item
        Name = 'Last_Invoice_Number'
      end
      item
        Name = 'Last_Credit_Note_Number'
      end
      item
        Name = 'Prefix_Value'
      end>
  end
  object qryAccounts: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * '
      'from Accounts_Package'
      'order by Accounts_Package_description')
    Left = 356
    Top = 160
  end
  object dtsAccounts: TDataSource
    DataSet = qryAccounts
    Left = 420
    Top = 160
  end
end
