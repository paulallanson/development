object PBRSSuppDetFrm: TPBRSSuppDetFrm
  Left = 51
  Top = 48
  Width = 721
  Height = 417
  Caption = 'Supplier Details'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 640
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDisplay: TPanel
    Left = 0
    Top = 76
    Width = 713
    Height = 266
    Align = alClient
    TabOrder = 0
    object dbgrdCustStatus: TDBGrid
      Left = 1
      Top = 1
      Width = 711
      Height = 264
      Align = alClient
      DataSource = dtsrcCurrentSuppStatus
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Supp_name'
          Title.Caption = 'Name'
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Account_Code'
          Title.Caption = 'Account Code'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Building_No_name'
          Title.Caption = 'House'
          Width = 153
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Street'
          Width = 190
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Locale'
          Width = 159
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Town'
          Width = 163
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Postcode'
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Phone'
          Width = 119
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Fax_Number'
          Title.Caption = 'Fax Number'
          Width = 123
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Email'
          Width = 233
          Visible = True
        end>
    end
  end
  object pnlControls: TPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 76
    Align = alTop
    TabOrder = 1
    object RadioGroup1: TRadioGroup
      Left = 8
      Top = 8
      Width = 97
      Height = 57
      Caption = 'Report Type'
      ItemIndex = 0
      Items.Strings = (
        'Summary'
        'Detail')
      TabOrder = 0
    end
    object chkbxShowInactive: TCheckBox
      Left = 112
      Top = 48
      Width = 241
      Height = 17
      Caption = 'Show inactive suppliers'
      TabOrder = 1
      OnClick = chkbxShowInactiveClick
    end
  end
  object pnlPrintControl: TPanel
    Left = 0
    Top = 342
    Width = 713
    Height = 41
    Align = alBottom
    TabOrder = 2
    object lblRecordCount: TLabel
      Left = 104
      Top = 16
      Width = 3
      Height = 13
    end
    object Label6: TLabel
      Left = 24
      Top = 16
      Width = 69
      Height = 13
      Caption = 'Record Count:'
    end
    object Panel1: TPanel
      Left = 480
      Top = 1
      Width = 232
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object PreviewReportBitBtn: TBitBtn
        Left = 30
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Preview'
        TabOrder = 0
        OnClick = PreviewReportBitBtnClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
          3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
          33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
          333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        NumGlyphs = 2
      end
      object PrintReportBitBtn: TBitBtn
        Left = 126
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Print'
        TabOrder = 1
        OnClick = PrintReportBitBtnClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
    object CancelBitBtn: TBitBtn
      Left = 376
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object qryCurrentSuppStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Supplier_Branch.*, Supplier.Name+'#39'/'#39'+Supplier_Branch.name' +
        ' as Supp_name, Supplier.Name'
      'FROM Supplier INNER JOIN Supplier_Branch ON'
      '  Supplier.Supplier = Supplier_Branch.Supplier'
      
        'WHERE ((Supplier.Acc_Active = '#39'Y'#39') OR (Supplier.Acc_Active = :Ac' +
        'c_Active))'
      'order by Supplier.name'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 112
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Acc_Active'
        ParamType = ptUnknown
      end>
    object qryCurrentSuppStatusSupplier: TIntegerField
      FieldName = 'Supplier'
    end
    object qryCurrentSuppStatusBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qryCurrentSuppStatusName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object qryCurrentSuppStatusBuilding_No_name: TStringField
      FieldName = 'Building_No_name'
      FixedChar = True
      Size = 80
    end
    object qryCurrentSuppStatusStreet: TStringField
      FieldName = 'Street'
      FixedChar = True
      Size = 80
    end
    object qryCurrentSuppStatusLocale: TStringField
      FieldName = 'Locale'
      FixedChar = True
      Size = 80
    end
    object qryCurrentSuppStatusTown: TStringField
      FieldName = 'Town'
      FixedChar = True
      Size = 80
    end
    object qryCurrentSuppStatusPostcode: TStringField
      FieldName = 'Postcode'
      FixedChar = True
    end
    object qryCurrentSuppStatusPhone: TStringField
      FieldName = 'Phone'
      FixedChar = True
      Size = 40
    end
    object qryCurrentSuppStatusFax_Number: TStringField
      FieldName = 'Fax_Number'
      FixedChar = True
      Size = 40
    end
    object qryCurrentSuppStatusEmail: TStringField
      FieldName = 'Email'
      FixedChar = True
      Size = 80
    end
    object qryCurrentSuppStatusNarrative: TIntegerField
      FieldName = 'Narrative'
    end
    object qryCurrentSuppStatusAccount_Code: TStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object qryCurrentSuppStatusAccount_Code_On_Ledger: TStringField
      FieldName = 'Account_Code_On_Ledger'
      FixedChar = True
      Size = 2
    end
    object qryCurrentSuppStatusSupp_name: TStringField
      FieldName = 'Supp_name'
      FixedChar = True
      Size = 162
    end
    object qryCurrentSuppStatusName_1: TStringField
      FieldName = 'Name_1'
      FixedChar = True
      Size = 80
    end
  end
  object dtsrcCurrentSuppStatus: TDataSource
    DataSet = qryCurrentSuppStatus
    Left = 24
    Top = 168
  end
end
