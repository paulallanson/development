object frmWTRSJobRemedialSheet: TfrmWTRSJobRemedialSheet
  Left = 676
  Top = 190
  Caption = 'Remedial Print'
  ClientHeight = 366
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 113
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 68
      Height = 13
      Caption = 'Job Number:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 40
      Width = 53
      Height = 13
      Caption = 'Customer:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 64
      Width = 62
      Height = 13
      Caption = 'Description:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 104
      Top = 16
      Width = 121
      Height = 17
      DataField = 'Job'
      DataSource = dtsJob
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 104
      Top = 40
      Width = 489
      Height = 17
      DataField = 'Customer_Name'
      DataSource = dtsJob
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 104
      Top = 64
      Width = 481
      Height = 41
      DataField = 'Description'
      DataSource = dtsJob
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 352
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Reference:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText4: TDBText
      Left = 416
      Top = 16
      Width = 177
      Height = 17
      DataField = 'Order_Ref_No'
      DataSource = dtsJob
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 306
    Width = 628
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      628
      41)
    object Panel3: TPanel
      Left = 325
      Top = 1
      Width = 302
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        302
        39)
      object Button4: TButton
        Left = 203
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Close'
        TabOrder = 0
        OnClick = Button4Click
      end
    end
    object btnPrint: TButton
      Left = 8
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Print'
      Enabled = False
      TabOrder = 1
      OnClick = btnPrintClick
    end
    object btnPreview: TButton
      Left = 101
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'P&review'
      Enabled = False
      TabOrder = 2
      OnClick = btnPreviewClick
    end
    object btnEmail: TButton
      Left = 194
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Email'
      Enabled = False
      TabOrder = 3
      OnClick = btnEmailClick
    end
    object chkbxSelectAll: TCheckBox
      Left = 296
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Select All'
      TabOrder = 4
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 347
    Width = 628
    Height = 19
    Panels = <>
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 113
    Width = 628
    Height = 193
    Align = alClient
    DataSource = dtsReport
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Remedial_Number'
        Title.Caption = 'Remedial No.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Notes_Text'
        Title.Caption = 'Remedial Work'
        Width = 223
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fitter_Name'
        Title.Caption = 'Fitter'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Installation_Date'
        Title.Caption = 'Proposed Date'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Installation_Price'
        Title.Caption = 'Price'
        Visible = True
      end>
  end
  object qryReport: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '      Job_Remedial.job,'
      '      Job_Remedial.Remedial_Number,'
      '      Job_Remedial.Date_Raised,'
      '      Job_Remedial.Installation_Date,'
      '      Job_Remedial.Installation_Price,'
      '      Operator.Operator_Name,'
      '      Fitter.Fitter_Name,'
      '      Notes.Notes_line,'
      '      Notes.Notes_text'
      'FROM Fitter '
      #9#9'RIGHT JOIN (Operator '
      #9#9'INNER JOIN (Job_Remedial '
      #9#9'INNER JOIN Notes '
      #9#9#9'ON Job_Remedial.Notes = Notes.Notes_code) '
      #9#9#9'ON Operator.Operator = Job_Remedial.Operator) '
      #9#9#9'ON Fitter.Fitter = Job_Remedial.Fitter'
      'WHERE Notes.Notes_Line = 1 AND'
      '      Job_Remedial.Job = :Job'
      'ORDER BY Job_Remedial.Remedial_Number')
    Left = 136
    Top = 192
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 232
    Top = 232
  end
  object qryJob: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Job.Job,'
      '        Customer.Customer_Name,'
      '        Job.Order_ref_no,'
      '        Job.Description'
      'FROM Customer'
      '        INNER JOIN Job ON Customer.Customer = Job.Customer'
      'WHERE Job.Job = :Job')
    Left = 152
    Top = 16
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object dtsJob: TDataSource
    DataSet = qryJob
    Left = 248
    Top = 16
  end
  object qryReportDummy: TFDQuery
    SQL.Strings = (
      'SELECT  Job_Remedial.Job,'
      '        Job.Job_Status,'
      '        Job_Remedial.Remedial_Number,'
      '        Job_Remedial.Notes as Remedial_Notes,'
      '        Job_Remedial.Material_Required,'
      '        Job_Remedial.Fitter,'
      '        Job_Remedial.Date_Raised,'
      '        Job_Remedial.Items_to_Return_to_Site,'
      '        Job_Remedial.Items_Still_on_Site,'
      '        Job_Remedial.Tools_Required,'
      '        Job_Remedial.Site_Requirements,'
      '        Job_Remedial.Additional_Notes,'
      '        Job_Remedial.Manufacturing_Notes,'
      '        Fitter.Fitter_Name,'
      '        Fitter.Telephone_number,'
      '        Fitter.Mobile_number,'
      '        Fitter.Email_Address,'
      '        Sales_Order.Customer,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Contact_name,'
      '        Sales_Order.Order_ref_no,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Address,'
      '        Sales_Order.Install_Name,'
      '        Sales_Order.Install_Phone,'
      '        Operator.Operator_Name,'
      '        Sales_Order.Install_Address,'
      '        Sales_Order.Sales_Order,'
      '        Sales_Order.Revenue_Centre'
      'FROM Fitter'
      '      RIGHT JOIN (Sales_Order'
      '      INNER JOIN ((Operator'
      '      INNER JOIN (Job'
      '      INNER JOIN Job_Remedial'
      '          ON Job.Job = Job_Remedial.Job)'
      '          ON Operator.Operator = Job_Remedial.Operator)'
      '      INNER JOIN Sales_Order_Line'
      '          ON Job.Job = Sales_Order_Line.Job)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Fitter.Fitter = Job_Remedial.Fitter'
      'WHERE Job.Job = :Job  AND'
      
        '      ((Job_Remedial.Remedial_Number = :Remedial_Number) or (:Re' +
        'medial_Number = 0))'
      'ORDER BY Job_Remedial.Remedial_Number')
    Left = 392
    Top = 48
    ParamData = <
      item
        Name = 'Job'
      end
      item
        Name = 'Remedial_Number'
      end
      item
        Name = 'Remedial_Number'
      end>
  end
end
