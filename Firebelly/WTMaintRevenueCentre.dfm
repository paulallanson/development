object frmWTMaintRevenueCentre: TfrmWTMaintRevenueCentre
  Left = 381
  Top = 36
  BorderStyle = bsDialog
  Caption = 'Maintain Revenue Centre'
  ClientHeight = 633
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    611
    633)
  TextHeight = 13
  object DetsGrpBox: TGroupBox
    Left = 16
    Top = 8
    Width = 577
    Height = 569
    Caption = 'Details'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      577
      569)
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object Label2: TLabel
      Left = 8
      Top = 60
      Width = 30
      Height = 13
      Caption = 'Colour'
    end
    object Label7: TLabel
      Left = 8
      Top = 108
      Width = 29
      Height = 13
      Caption = 'Image'
    end
    object Label3: TLabel
      Left = 8
      Top = 284
      Width = 44
      Height = 26
      Caption = 'Payment Details'
      WordWrap = True
    end
    object Label4: TLabel
      Left = 8
      Top = 380
      Width = 54
      Height = 39
      Caption = 'Registered Address Details'
      WordWrap = True
    end
    object Label5: TLabel
      Left = 8
      Top = 508
      Width = 100
      Height = 13
      Caption = 'VAT Registration No.'
      WordWrap = True
    end
    object Label25: TLabel
      Left = 8
      Top = 540
      Width = 91
      Height = 13
      Caption = 'Accounts Package'
    end
    object Label6: TLabel
      Left = 8
      Top = 474
      Width = 87
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
      ParentBackground = False
      Left = 120
      Top = 136
      Width = 217
      Height = 135
      BorderStyle = bsSingle
      TabOrder = 6
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
      TabOrder = 8
    end
    object memPayment: TMemo
      Left = 120
      Top = 281
      Width = 433
      Height = 88
      Anchors = [akLeft, akTop, akRight]
      ScrollBars = ssVertical
      TabOrder = 7
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
      TabOrder = 11
      Text = 'edtVATRegistrationNo'
      OnChange = CheckOK
    end
  end
  object OKBitBtn: TBitBtn
    Left = 235
    Top = 592
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 323
    Top = 592
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
    OnClick = CancelBitBtnClick
  end
  object chkbxInActive: TCheckBox
    Left = 16
    Top = 596
    Width = 185
    Height = 17
    Caption = 'Revenue Centre is inactive'
    TabOrder = 3
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
      '        Accounts_Package = :Accounts_Package'
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
      '        Accounts_Package'
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
      '        :Accounts_Package'
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
