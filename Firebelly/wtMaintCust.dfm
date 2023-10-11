object frmWTMaintCust: TfrmWTMaintCust
  Left = 129
  Top = 104
  BorderStyle = bsDialog
  Caption = 'Customer details'
  ClientHeight = 352
  ClientWidth = 606
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 593
    Height = 305
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Details'
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Name'
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 37
        Height = 13
        Caption = 'Street 1'
      end
      object Label3: TLabel
        Left = 16
        Top = 69
        Width = 37
        Height = 13
        Caption = 'Street 2'
      end
      object Label4: TLabel
        Left = 16
        Top = 115
        Width = 27
        Height = 13
        Caption = 'Town'
      end
      object Label5: TLabel
        Left = 16
        Top = 136
        Width = 33
        Height = 13
        Caption = 'County'
      end
      object Label6: TLabel
        Left = 16
        Top = 157
        Width = 45
        Height = 13
        Caption = 'Postcode'
      end
      object Label7: TLabel
        Left = 344
        Top = 48
        Width = 31
        Height = 13
        Caption = 'Phone'
      end
      object Label8: TLabel
        Left = 344
        Top = 72
        Width = 17
        Height = 13
        Caption = 'Fax'
      end
      object Label9: TLabel
        Left = 344
        Top = 96
        Width = 25
        Height = 13
        Caption = 'Email'
      end
      object Label10: TLabel
        Left = 16
        Top = 184
        Width = 71
        Height = 13
        Caption = 'Customer Type'
      end
      object Label11: TLabel
        Left = 16
        Top = 216
        Width = 52
        Height = 13
        Caption = 'Price Band'
      end
      object Label12: TLabel
        Left = 16
        Top = 93
        Width = 32
        Height = 13
        Caption = 'Locale'
      end
      object DBEdit1: TDBEdit
        Left = 96
        Top = 8
        Width = 233
        Height = 21
        DataField = 'Name'
        DataSource = dtmdlCustomer.dtsrcCustomer
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 384
        Top = 40
        Width = 169
        Height = 21
        DataField = 'Tel_Number'
        DataSource = dtmdlCustomer.dtsrcCustomer
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 384
        Top = 64
        Width = 169
        Height = 21
        DataField = 'Fax_Number'
        DataSource = dtmdlCustomer.dtsrcCustomer
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 384
        Top = 88
        Width = 169
        Height = 21
        DataSource = dtmdlCustomer.dtsrcCustomer
        TabOrder = 3
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 96
        Top = 176
        Width = 153
        Height = 21
        DataField = 'Customer_Type'
        DataSource = dtmdlCustomer.dtsrcCustomer
        KeyField = 'Customer_Type'
        ListField = 'Description'
        ListSource = dtmdlCustomer.srcCustomerType
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 96
        Top = 208
        Width = 41
        Height = 21
        DataField = 'Price_Band'
        DataSource = dtmdlCustomer.dtsrcCustomer
        TabOrder = 5
      end
      object chkbxActive: TDBCheckBox
        Left = 16
        Top = 248
        Width = 97
        Height = 17
        Caption = 'Disable account'
        TabOrder = 6
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object DBEdit6: TDBEdit
        Left = 96
        Top = 40
        Width = 233
        Height = 21
        DataField = 'Building_Name'
        DataSource = dtmdlCustomer.dtsrcCustomer
        TabOrder = 7
      end
      object DBEdit7: TDBEdit
        Left = 96
        Top = 62
        Width = 233
        Height = 21
        DataField = 'Street_Name'
        DataSource = dtmdlCustomer.dtsrcCustomer
        TabOrder = 8
      end
      object DBEdit8: TDBEdit
        Left = 96
        Top = 84
        Width = 233
        Height = 21
        DataField = 'Locality'
        DataSource = dtmdlCustomer.dtsrcCustomer
        TabOrder = 9
      end
      object DBEdit9: TDBEdit
        Left = 96
        Top = 105
        Width = 233
        Height = 21
        DataField = 'Town_City'
        DataSource = dtmdlCustomer.dtsrcCustomer
        TabOrder = 10
      end
      object DBEdit10: TDBEdit
        Left = 96
        Top = 127
        Width = 233
        Height = 21
        DataField = 'County'
        DataSource = dtmdlCustomer.dtsrcCustomer
        TabOrder = 11
      end
      object DBEdit11: TDBEdit
        Left = 96
        Top = 149
        Width = 233
        Height = 21
        DataField = 'PostCode'
        DataSource = dtmdlCustomer.dtsrcCustomer
        TabOrder = 12
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 440
    Top = 320
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 526
    Top = 320
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
