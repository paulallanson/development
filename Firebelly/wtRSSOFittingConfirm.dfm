object frmWTRSSOFittingConfirm: TfrmWTRSSOFittingConfirm
  Left = 515
  Top = 175
  BorderStyle = bsDialog
  Caption = 'Fitting Confirmation'
  ClientHeight = 236
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    372
    236)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 79
    Height = 13
    Caption = 'Sales Order No'#39's'
  end
  object memSelection: TMemo
    Left = 8
    Top = 24
    Width = 225
    Height = 65
    ReadOnly = True
    TabOrder = 0
    OnChange = EnableRun
  end
  object btnPrint: TButton
    Left = 8
    Top = 200
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    Enabled = False
    TabOrder = 1
    OnClick = btnPrintClick
  end
  object Button4: TButton
    Left = 283
    Top = 200
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button4Click
  end
  object SelectLst: TListBox
    Left = 200
    Top = 8
    Width = 25
    Height = 105
    ItemHeight = 13
    Sorted = True
    TabOrder = 3
    Visible = False
  end
  object btnPreview: TButton
    Left = 99
    Top = 200
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'P&review'
    Enabled = False
    TabOrder = 4
    OnClick = btnPreviewClick
  end
  object btnEmail: TButton
    Left = 191
    Top = 200
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Email'
    Enabled = False
    TabOrder = 5
    OnClick = btnEmailClick
  end
  object chkbxprintLogo: TCheckBox
    Left = 8
    Top = 96
    Width = 97
    Height = 17
    Caption = 'Print your logo'
    TabOrder = 6
  end
  object rdgrpType: TRadioGroup
    Left = 248
    Top = 21
    Width = 113
    Height = 68
    Caption = 'Print Type'
    ItemIndex = 0
    Items.Strings = (
      'Summary'
      'Detailed')
    TabOrder = 7
  end
  object chkbxAttachTemplate: TCheckBox
    Left = 8
    Top = 120
    Width = 225
    Height = 17
    Caption = 'Attach Template Conditions document'
    TabOrder = 8
  end
  object chkbxAttachTerms: TCheckBox
    Left = 8
    Top = 144
    Width = 249
    Height = 17
    Caption = 'Attach Sales Terms && Conditions document'
    TabOrder = 9
  end
  object qryGetQuotes: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Int_Sel.Int_Sel_Code,'
      '        Int_Sel.Sel1,'
      '        Quote.Quote,'
      '        Quote.Customer,'
      '        Quote.Customer_Name,'
      '        Quote.Contact_Name,'
      '        Customer.Fax_number as Customer_Fax,'
      '        Customer.Email_Address as Customer_Email,'
      '        Customer.Is_Retail_Customer,'
      '        Address.Fax_number,'
      '        Address.Email_Address'
      'FROM Int_Sel'
      '      INNER JOIN (Address'
      '      RIGHT JOIN (Customer'
      '      INNER JOIN Quote ON'
      '        Customer.Customer = Quote.Customer) ON'
      '        Address.Address = Quote.Address) ON'
      '        Int_Sel.Sel1 = Quote.Quote'
      'WHERE Int_Sel.Int_Sel_Code = :Int_Sel_Code')
    Left = 160
    Top = 34
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end>
  end
  object qryGetRange: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT distinct Quote.Quote'
      'FROM Quote'
      'WHERE'
      '  (Quote >= :From_Quote) and'
      '  (Quote <= :To_Quote)')
    Left = 272
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'From_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'To_Quote'
        ParamType = ptUnknown
      end>
  end
  object qryGetSOQuote: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select top 1 Quote'
      'from Sales_Order_Line'
      'where sales_order = :Sales_Order')
    Left = 56
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object qryGetSOQuotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Quote'
      'from Sales_Order_Line'
      'where sales_order = :Sales_Order')
    Left = 112
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
end
