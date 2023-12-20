object CCSMaintPrtImagesFrm: TCCSMaintPrtImagesFrm
  Left = 201
  Top = 125
  BorderStyle = bsSingle
  Caption = 'Maintain Product E-Commerce Info'
  ClientHeight = 281
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object Shape2: TShape
    Left = 12
    Top = 47
    Width = 160
    Height = 225
    Brush.Color = clBtnFace
  end
  object lblProdCode: TLabel
    Left = 13
    Top = 8
    Width = 73
    Height = 13
    Caption = 'Product Code:'
  end
  object lblPopUpImage: TLabel
    Left = 13
    Top = 32
    Width = 74
    Height = 13
    Caption = 'Product Image'
  end
  object lblFullImagePath: TLabel
    Left = 184
    Top = 80
    Width = 241
    Height = 113
    AutoSize = False
    Caption = 'lblFullImagePath'
    WordWrap = True
  end
  object Image2: TImage
    Left = 13
    Top = 48
    Width = 158
    Height = 223
    OnDblClick = Image2DblClick
  end
  object edtProdCode: TEdit
    Left = 96
    Top = 4
    Width = 225
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object btnBrowse2: TButton
    Left = 184
    Top = 48
    Width = 97
    Height = 25
    Caption = 'Change Image'
    TabOrder = 1
    OnClick = btnBrowse2Click
  end
  object btbtnOK: TBitBtn
    Left = 264
    Top = 248
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btbtnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 360
    Top = 248
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
  object btbtnEraseImage2: TBitBtn
    Left = 288
    Top = 48
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
    TabOrder = 4
    OnClick = btbtnEraseImage2Click
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 
      'All (*.jpg;*.bmp;*.gif)|*.apf;*.jpg;*.bmp;*.gif|JPEG Image File ' +
      '(*.jpg)|*.jpg|Bitmaps (*.bmp)|*.bmp|GIF Image File (*.gif)|*.gif'
    Left = 368
    Top = 5
  end
  object qryInsECommInfo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into ecommerce_info'
      '(Ecommerce_info, Stock_Reference)'
      'values'
      '(:Ecommerce_info, :Stock_Reference)')
    Left = 368
    Top = 168
    ParamData = <
      item
        Name = 'Ecommerce_info'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Stock_Reference'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryUpdECommInfo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update ecommerce_info'
      'set'
      '  Stock_Reference = :Stock_Reference'
      'where'
      '  Ecommerce_info = :Ecommerce_info;'
      '')
    Left = 336
    Top = 64
    ParamData = <
      item
        Name = 'Stock_Reference'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Ecommerce_info'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qrySelECommInfo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from ecommerce_info'
      'where stock_reference = :stock_reference;')
    Left = 368
    Top = 64
    ParamData = <
      item
        Name = 'stock_reference'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryTopECommNo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(ecommerce_info) as top_No '
      'from ecommerce_info;')
    Left = 400
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = qrySelECommInfo
    Left = 336
    Top = 168
  end
  object qryUpdFullImg: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update ecommerce_info '
      'set full_image = :full_image, '
      ' full_image_format = :format '
      'where ecommerce_info.ecommerce_info = :ecommerce_info')
    Left = 152
    Top = 232
    ParamData = <
      item
        Name = 'full_image'
      end
      item
        Name = 'format'
      end
      item
        Name = 'ecommerce_info'
      end>
  end
  object qryDelEcommInfo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from ecommerce_info '
      'where ecommerce_info = :ecomm_info')
    Left = 400
    Top = 168
    ParamData = <
      item
        Name = 'ecomm_info'
      end>
  end
end
