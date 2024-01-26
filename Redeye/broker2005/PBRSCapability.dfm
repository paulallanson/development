object PBRSCapabilityfrm: TPBRSCapabilityfrm
  Left = 58
  Top = 99
  Caption = 'Supplier/Capability report'
  ClientHeight = 414
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 332
    Width = 702
    Height = 63
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      702
      63)
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 51
      Height = 13
      Caption = 'Capability'
    end
    object edtCapability: TEdit
      Left = 72
      Top = 10
      Width = 225
      Height = 21
      TabOrder = 0
      OnChange = edtCapabilityChange
    end
    object btnPreview: TBitBtn
      Left = 450
      Top = 24
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Preview'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
        0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
        0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
        0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
        5555557FFFFF7755555555500000005555555577777775555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnPreviewClick
    end
    object btnPrint: TBitBtn
      Left = 530
      Top = 24
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Print'
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
      TabOrder = 2
      OnClick = btnPrintClick
    end
    object btnCancel: TBitBtn
      Left = 608
      Top = 24
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 3
    end
    object chkCapability: TCheckBox
      Left = 72
      Top = 40
      Width = 233
      Height = 17
      Caption = 'Page break on capability'
      TabOrder = 4
    end
  end
  object stsbrdetails: TStatusBar
    Left = 0
    Top = 395
    Width = 702
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 702
    Height = 332
    Align = alClient
    DataSource = dsCapability
    DrawingStyle = gdsGradient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'Capability_Description'
        Title.Caption = 'Capability'
        Width = 178
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Product_type_Description'
        Title.Caption = 'Product Type'
        Width = 209
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Supplier_Name'
        Title.Caption = 'Supplier'
        Width = 243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Branch_Name'
        Title.Caption = 'Branch'
        Width = 246
        Visible = True
      end>
  end
  object qryCapability: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Product_TypeCapability.Product_Type, '
      #9'Product_TypeCapability.Capability, '
      #9'Product_TypeCapability.Description as Capability_Description, '
      #9'Product_Type.Description as Product_type_Description, '
      #9'Splr_BrnchPrdct_TypCpblty.Supplier, '
      #9'Splr_BrnchPrdct_TypCpblty.Branch_no, '
      #9'Supplier_Branch.Name as Branch_Name, '
      #9'Supplier.Name as Supplier_Name'
      'FROM (Supplier '
      #9'INNER JOIN (Supplier_Branch '
      #9'INNER JOIN (Product_TypeCapability '
      #9'INNER JOIN Splr_BrnchPrdct_TypCpblty ON '#9
      
        #9#9'(Product_TypeCapability.Capability = Splr_BrnchPrdct_TypCpblty' +
        '.Capability) AND (Product_TypeCapability.Product_Type = Splr_Brn' +
        'chPrdct_TypCpblty.Product_Type)) ON '
      
        #9#9'(Supplier_Branch.Branch_no = Splr_BrnchPrdct_TypCpblty.Branch_' +
        'no) AND '
      
        #9#9'(Supplier_Branch.Supplier = Splr_BrnchPrdct_TypCpblty.Supplier' +
        ')) ON '
      #9#9'(Splr_BrnchPrdct_TypCpblty.Supplier = Supplier.Supplier) AND '
      #9#9'(Supplier.Supplier = Supplier_Branch.Supplier))'
      #9'INNER JOIN Product_Type ON '
      
        #9#9'Splr_BrnchPrdct_TypCpblty.Product_Type = Product_Type.Product_' +
        'Type'
      'Where Product_TypeCapability.Description like '#39'%%'#39' and'
      '('
      '(Product_typeCapability.Default_For_All <> '#39'Y'#39') or'
      '(Product_typeCapability.Default_for_all is null)'
      ') and'
      '(Supplier.Acc_Active = '#39'Y'#39')'
      
        'order by Product_typecapability.description, Product_type.Descri' +
        'ption, Supplier.Name')
    Left = 416
    Top = 128
  end
  object dsCapability: TDataSource
    DataSet = qryCapability
    Left = 496
    Top = 128
  end
  object SearchTimer: TTimer
    Interval = 250
    OnTimer = SearchTimerTimer
    Left = 272
    Top = 80
  end
  object qryDummy: TFDQuery
    SQL.Strings = (
      'SELECT '#9'Product_TypeCapability.Product_Type, '
      #9'Product_TypeCapability.Capability, '
      #9'Product_TypeCapability.Description as Capability_Description, '
      #9'Product_Type.Description as Product_type_Description, '
      #9'Splr_BrnchPrdct_TypCpblty.Supplier, '
      #9'Splr_BrnchPrdct_TypCpblty.Branch_no, '
      #9'Supplier_Branch.Name as Branch_Name, '
      #9'Supplier.Name as Supplier_Name'
      'FROM (Supplier '
      #9'INNER JOIN (Supplier_Branch '
      #9'INNER JOIN (Product_TypeCapability '
      #9'INNER JOIN Splr_BrnchPrdct_TypCpblty ON '#9
      
        #9#9'(Product_TypeCapability.Capability = Splr_BrnchPrdct_TypCpblty' +
        '.Capability) AND (Product_TypeCapability.Product_Type = Splr_Brn' +
        'chPrdct_TypCpblty.Product_Type)) ON '
      
        #9#9'(Supplier_Branch.Branch_no = Splr_BrnchPrdct_TypCpblty.Branch_' +
        'no) AND '
      
        #9#9'(Supplier_Branch.Supplier = Splr_BrnchPrdct_TypCpblty.Supplier' +
        ')) ON '
      #9#9'(Splr_BrnchPrdct_TypCpblty.Supplier = Supplier.Supplier) AND '
      #9#9'(Supplier.Supplier = Supplier_Branch.Supplier))'
      #9'INNER JOIN Product_Type ON '
      
        #9#9'Splr_BrnchPrdct_TypCpblty.Product_Type = Product_Type.Product_' +
        'Type')
    Left = 416
    Top = 72
  end
end
