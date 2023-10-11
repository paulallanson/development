object frmWTRSPOrder: TfrmWTRSPOrder
  Left = 458
  Top = 211
  BorderStyle = bsDialog
  Caption = 'Print Purchase Order'
  ClientHeight = 173
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    363
    173)
  TextHeight = 13
  object memSelection: TMemo
    Left = 8
    Top = 24
    Width = 225
    Height = 65
    ReadOnly = True
    TabOrder = 0
    OnChange = EnableRun
  end
  object SelectLst: TListBox
    Left = 200
    Top = 8
    Width = 25
    Height = 105
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
    Visible = False
  end
  object chkbxprintLogo: TCheckBox
    Left = 8
    Top = 96
    Width = 97
    Height = 17
    Caption = 'Print your logo'
    TabOrder = 2
  end
  object btnPrint: TButton
    Left = 8
    Top = 134
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    Enabled = False
    TabOrder = 3
    OnClick = btnPrintClick
  end
  object btnPreview: TButton
    Left = 99
    Top = 134
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
    Top = 134
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Email'
    Enabled = False
    TabOrder = 5
    OnClick = btnEmailClick
  end
  object Button4: TButton
    Left = 283
    Top = 134
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    TabOrder = 6
    OnClick = Button4Click
  end
  object qryGetRange: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT distinct Purchase_Order.Purchase_Order'
      'FROM Purchase_Order'
      'WHERE'
      '  (Purchase_Order.Purchase_Order >= :From_Purchase_Order) and'
      '  (Purchase_Order.Purchase_Order <= :To_Purchase_Order)')
    Left = 272
    Top = 48
    ParamData = <
      item
        Name = 'From_Purchase_Order'
      end
      item
        Name = 'To_Purchase_Order'
      end>
  end
  object qryGetSupplierEmailCCs: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Email_Address'
      'FROM Supplier_Contact'
      'WHERE (Supplier_Contact.Supplier = :Supplier) AND'
      '(Supplier_Contact.Receive_Purchase_Order = '#39'Y'#39') AND'
      '(Supplier_Contact.Contact_no <> :Contact_no)')
    Left = 328
    Top = 48
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Contact_no'
      end>
  end
end
