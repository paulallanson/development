object PBLUProofHistNFrm: TPBLUProofHistNFrm
  Left = 93
  Top = 66
  Caption = 'Maintain Proof History'
  ClientHeight = 324
  ClientWidth = 625
  Color = clBtnFace
  Constraints.MinHeight = 351
  Constraints.MinWidth = 595
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object Panel1: TPanel
    Left = 517
    Top = 73
    Width = 108
    Height = 251
    Align = alRight
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      108
      251)
    object CountLabel: TLabel
      Left = 19
      Top = 64
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'CountLabel'
    end
    object FuncGrpBox: TGroupBox
      Left = 8
      Top = 88
      Width = 89
      Height = 105
      Anchors = [akRight, akBottom]
      Caption = 'Function'
      ParentBackground = False
      TabOrder = 0
      object AddBitBtn: TBitBtn
        Left = 6
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Add'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
          0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
          33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = AddBitBtnClick
      end
      object ChgBitBtn: TBitBtn
        Left = 6
        Top = 44
        Width = 75
        Height = 25
        Caption = 'Change'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = ChgBitBtnClick
      end
      object DelBitBtn: TBitBtn
        Left = 6
        Top = 72
        Width = 75
        Height = 25
        Caption = 'Delete'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
        TabOrder = 2
        OnClick = DelBitBtnClick
      end
    end
    object CloseBitBtn: TBitBtn
      Left = 14
      Top = 208
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = CloseBitBtnClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 0
      Top = 4
      Width = 625
      Height = 69
      Align = alBottom
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 16
        Width = 74
        Height = 13
        Caption = 'Purchase Order'
      end
      object DescLabel: TLabel
        Left = 232
        Top = 43
        Width = 345
        Height = 15
        AutoSize = False
        Caption = 'desc'
      end
      object POLabel: TLabel
        Left = 104
        Top = 16
        Width = 80
        Height = 15
        AutoSize = False
        Caption = 'ordno'
      end
      object SuppLabel: TLabel
        Left = 10
        Top = 40
        Width = 215
        Height = 15
        AutoSize = False
        Caption = 'supplier'
      end
      object CustLabel: TLabel
        Left = 232
        Top = 16
        Width = 345
        Height = 15
        AutoSize = False
        Caption = 'customer'
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 73
    Width = 517
    Height = 251
    Align = alClient
    Caption = 'Panel3'
    ParentBackground = False
    TabOrder = 2
    object DetsDBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 515
      Height = 249
      Align = alClient
      DataSource = DetsSRC
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = DetsDBGridDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Proof_Date'
          Title.Caption = 'Date'
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Description'
          Title.Caption = 'Status'
          Width = 216
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Name'
          Title.Caption = 'Updated by'
          Width = 147
          Visible = True
        end>
    end
  end
  object DetsSRC: TDataSource
    DataSet = GetDetsSQL
    Left = 144
    Top = 72
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Proof_History.Proof_History,'
      '      Proof_History.Proof_Status,'
      '      Proof_History.Proof_Date,'
      '      Proof_Status.Description,'
      '      Operator.Name'
      'FROM (Proof_Status'
      '      INNER JOIN Proof_History ON'
      '        Proof_Status.Proof_Status = Proof_History.Proof_Status)'
      '      LEFT JOIN Operator ON'
      '        Proof_History.Operator = Operator.Operator'
      'Where (Proof_History.Purchase_Order = :Purchase_Order) and'
      '      (Proof_History.Line = :Line)'
      'ORDER BY Proof_History.Proof_History DESC')
    Left = 56
    Top = 104
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object NullSRC: TDataSource
    Left = 224
    Top = 88
  end
  object GetHeadDtlsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Customer.Name as Cust_name, Supplier.Name as Supp_Name, P' +
        'urchase_OrderLine.Suppliers_Desc'
      
        'FROM ((Purchase_Order INNER JOIN Purchase_OrderLine ON Purchase_' +
        'Order.Purchase_Order = Purchase_OrderLine.Purchase_Order) LEFT J' +
        'OIN Customer ON Purchase_OrderLine.Customer = Customer.Customer)' +
        ' LEFT JOIN Supplier ON Purchase_Order.Supplier = Supplier.Suppli' +
        'er'
      
        'WHERE (((Purchase_OrderLine.Purchase_Order)= :purchase_order) AN' +
        'D ((Purchase_OrderLine.Line)= :line))'
      ' '
      ' ')
    Left = 376
    Top = 16
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
end
