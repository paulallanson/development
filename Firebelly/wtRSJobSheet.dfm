object frmWTRSJobSheet: TfrmWTRSJobSheet
  Left = 531
  Top = 172
  BorderStyle = bsDialog
  Caption = 'Print Job Sheet'
  ClientHeight = 343
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 254
    Width = 522
    Height = 89
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 245
    ExplicitWidth = 516
    DesignSize = (
      522
      89)
    object btnPrint: TButton
      Left = 8
      Top = 56
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Print'
      Enabled = False
      TabOrder = 0
      OnClick = btnPrintClick
    end
    object btnPreview: TButton
      Left = 101
      Top = 56
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'P&review'
      Enabled = False
      TabOrder = 1
      OnClick = btnPreviewClick
    end
    object btnEmail: TButton
      Left = 194
      Top = 56
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Email'
      Enabled = False
      TabOrder = 2
      OnClick = btnEmailClick
    end
    object Button4: TButton
      Left = 440
      Top = 56
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Close'
      TabOrder = 3
      OnClick = Button4Click
    end
    object chkbxAccounts: TCheckBox
      Left = 8
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Client copy'
      TabOrder = 4
    end
    object chkbxMerge: TCheckBox
      Left = 8
      Top = 2
      Width = 345
      Height = 17
      Caption = 'Merge all selected documents to create single PDF in email'
      TabOrder = 5
    end
  end
  object pnlBody: TPanel
    Left = 0
    Top = 0
    Width = 522
    Height = 254
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 516
    ExplicitHeight = 245
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 522
      Height = 49
      Align = alTop
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 516
      DesignSize = (
        522
        49)
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 39
        Height = 13
        Caption = 'Job No.'
      end
      object Label2: TLabel
        Left = 336
        Top = 8
        Width = 80
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Sales Order No.'
        ExplicitLeft = 332
      end
      object memSelection: TMemo
        Left = 8
        Top = 24
        Width = 130
        Height = 21
        ReadOnly = True
        TabOrder = 0
        OnChange = EnableRun
      end
      object memSOrderNumber: TMemo
        Left = 336
        Top = 24
        Width = 130
        Height = 21
        Anchors = [akTop, akRight]
        ReadOnly = True
        TabOrder = 1
        OnChange = EnableRun
        ExplicitLeft = 330
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 104
      Width = 522
      Height = 150
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      ExplicitTop = 95
      ExplicitWidth = 516
      object lstbxDocuments: TListBox
        Left = 8
        Top = 14
        Width = 273
        Height = 129
        ItemHeight = 13
        MultiSelect = True
        TabOrder = 0
        OnDblClick = lstbxDocumentsDblClick
      end
      object chkbxIncludeVoucher: TCheckBox
        Left = 314
        Top = 38
        Width = 97
        Height = 17
        Caption = 'Include Voucher'
        TabOrder = 1
        Visible = False
      end
      object chkbxAllDocuments: TCheckBox
        Left = 314
        Top = 15
        Width = 201
        Height = 17
        Caption = 'Select ALL additional order documents'
        TabOrder = 2
        OnClick = chkbxAllDocumentsClick
      end
      object chkbxPrint: TCheckBox
        Left = 314
        Top = 64
        Width = 209
        Height = 17
        Caption = 'Print/Email Remedial Sheet'
        TabOrder = 3
        Visible = False
      end
    end
    object pnlDocuments: TPanel
      Left = 0
      Top = 49
      Width = 522
      Height = 55
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      ExplicitWidth = 516
      ExplicitHeight = 46
      object Label3: TLabel
        Left = 8
        Top = 5
        Width = 207
        Height = 13
        Caption = 'Include documents from selected folder:'
      end
      object cmbDocuments: TComboBox
        Left = 8
        Top = 26
        Width = 273
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 0
        Text = '<All>'
        OnChange = cmbDocumentsChange
        Items.Strings = (
          '<All>')
      end
    end
  end
  object qryDocumentStructure: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Folder_Name'
      'FROM Document_Structure'
      'WHERE Module_Id = 50'
      'ORDER BY Folder_Name')
    Left = 352
    Top = 32
  end
  object qryReport: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Job.Job,'
      '        Job.Job_Status,'
      '        Sales_Order.Customer,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Contact_name,'
      '        Sales_Order.Order_ref_no,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Address,'
      '        Sales_Order.Install_Name,'
      '        Sales_Order.Install_Phone,'
      '        Sales_Order.Install_Address,'
      '        Sales_Order.Sales_Order,'
      '        0 as "Job_Remedial.Remedial_Number"'
      'FROM Sales_Order'
      '        INNER JOIN (Job'
      '        INNER JOIN Sales_Order_Line'
      '          ON Job.Job = Sales_Order_Line.Job)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der'
      'WHERE Job.Job = :Job AND :Remedial_Number = 0')
    Left = 344
    Top = 200
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'Remedial_Number'
      end>
  end
end
