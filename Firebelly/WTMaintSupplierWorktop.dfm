object frmWTMaintSupplierWorktop: TfrmWTMaintSupplierWorktop
  Left = 371
  Top = 143
  Caption = 'Maintain Supplier Worktop Details'
  ClientHeight = 211
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Label2: TLabel
    Left = 24
    Top = 44
    Width = 49
    Height = 13
    Caption = 'Worktop:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 76
    Width = 76
    Height = 13
    Caption = 'Adhesive Code'
  end
  object lblWorktop: TLabel
    Left = 120
    Top = 44
    Width = 59
    Height = 13
    Caption = 'lblWorktop'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 24
    Top = 16
    Width = 46
    Height = 13
    Caption = 'Supplier:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSupplierName: TLabel
    Left = 120
    Top = 16
    Width = 87
    Height = 13
    Caption = 'lblSupplierName'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 24
    Top = 140
    Width = 96
    Height = 13
    Caption = 'Adhesives per Slab'
  end
  object Label3: TLabel
    Left = 24
    Top = 108
    Width = 59
    Height = 13
    Caption = 'Description'
  end
  object btnLUProducts: TSpeedButton
    Left = 373
    Top = 72
    Width = 23
    Height = 23
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btnLUProductsClick
  end
  object btnOK: TBitBtn
    Left = 146
    Top = 179
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 234
    Top = 179
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object spnAdhesiveQuantity: TSpinEdit
    Left = 121
    Top = 136
    Width = 50
    Height = 22
    MaxValue = 1000
    MinValue = 1
    TabOrder = 2
    Value = 1
  end
  object edtAdhesiveProduct: TEdit
    Left = 120
    Top = 72
    Width = 241
    Height = 21
    TabOrder = 3
    Text = 'edtAdhesiveProduct'
  end
  object edtAdhesiveDescription: TEdit
    Left = 120
    Top = 104
    Width = 377
    Height = 21
    TabOrder = 4
    Text = 'edtAdhesiveDescription'
  end
  object btnClear: TBitBtn
    Left = 403
    Top = 71
    Width = 25
    Height = 25
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
      305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
      005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
      B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
      B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
      B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
      B0557777FF577777F7F500000E055550805577777F7555575755500000555555
      05555777775555557F5555000555555505555577755555557555}
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btnClearClick
  end
  object qryUpdSupplierWorktop: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Update Supplier_Worktop'
      'Set Adhesive_Product_Code = :Adhesive_Product_Code, '
      'Adhesive_Quantity_Per_Slab = :Adhesive_Quantity_Per_Slab'
      'WHERE Supplier = :Supplier AND'
      'Worktop = :Worktop')
    Left = 376
    Top = 32
    ParamData = <
      item
        Name = 'Adhesive_Product_Code'
      end
      item
        Name = 'Adhesive_Quantity_Per_Slab'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Worktop'
      end>
  end
  object qryGetSupplierWorktop: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Supplier_Worktop.Supplier,'
      '        Supplier_Worktop.Worktop,'
      '        Supplier_Worktop.inactive,'
      '        Supplier_Worktop.Adhesive_Product_Code,'
      '        Supplier_Product.Description as Adhesive_Description,'
      '        Supplier_Worktop.Adhesive_Quantity_Per_Slab'
      'FROM Supplier_Product'
      '        RIGHT JOIN Supplier_Worktop'
      
        '          ON (Supplier_Product.Supplier = Supplier_Worktop.Suppl' +
        'ier)'
      
        '            AND (Supplier_Product.Supplier_Product_Code = Suppli' +
        'er_Worktop.Adhesive_Product_Code)'
      'WHERE Supplier_Worktop.Supplier = :Supplier AND'
      '      Supplier_Worktop.Worktop = :Worktop')
    Left = 232
    Top = 32
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Worktop'
      end>
  end
end
