object STMaintPrtECommFrm: TSTMaintPrtECommFrm
  Left = 113
  Top = 133
  BorderStyle = bsSingle
  Caption = 'Maintain Product E-Commerce Info'
  ClientHeight = 224
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object lblProdCode: TLabel
    Left = 29
    Top = 16
    Width = 68
    Height = 13
    Caption = 'Product Code:'
  end
  object lblPromptInfo: TLabel
    Left = 61
    Top = 50
    Width = 36
    Height = 13
    Caption = 'Prompt:'
  end
  object lblThmNail: TLabel
    Left = 8
    Top = 84
    Width = 89
    Height = 13
    Caption = 'Thumb Nail Image:'
  end
  object lblPopUp: TLabel
    Left = 29
    Top = 118
    Width = 68
    Height = 13
    Caption = 'Pop-Up Image'
  end
  object lblPopImagePath: TLabel
    Left = 29
    Top = 152
    Width = 68
    Height = 13
    Caption = 'Pop Up Image'
  end
  object edtProdCode: TEdit
    Left = 120
    Top = 12
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object edtPromptInfo: TEdit
    Left = 120
    Top = 46
    Width = 297
    Height = 21
    MaxLength = 50
    TabOrder = 1
  end
  object edtThmNailFile: TEdit
    Left = 120
    Top = 80
    Width = 241
    Height = 21
    MaxLength = 100
    TabOrder = 2
  end
  object chkbxPopupYN: TCheckBox
    Left = 120
    Top = 117
    Width = 25
    Height = 17
    TabOrder = 3
    OnClick = chkbxPopupYNClick
  end
  object edtPopImagePath: TEdit
    Left = 120
    Top = 148
    Width = 241
    Height = 21
    Enabled = False
    MaxLength = 100
    TabOrder = 4
  end
  object btnBrowse1: TButton
    Left = 368
    Top = 79
    Width = 75
    Height = 25
    Caption = 'Browse'
    TabOrder = 5
    OnClick = btnBrowse1Click
  end
  object btnBrowse2: TButton
    Left = 368
    Top = 147
    Width = 75
    Height = 25
    Caption = 'Browse'
    Enabled = False
    TabOrder = 6
    OnClick = btnBrowse2Click
  end
  object btbtnOK: TBitBtn
    Left = 248
    Top = 184
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 7
    OnClick = btbtnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 336
    Top = 184
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 8
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 248
    Top = 112
  end
  object qryInsECommInfo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into ecommerce_info'
      
        '(Ecommerce_info, Stock_Reference, Other_info_prompt, Thumbnail_i' +
        'mage,'
      'Generate_popup, Popup_image)'
      'values'
      
        '(:Ecommerce_info, :Stock_Reference, :Other_info_prompt, :Thumbna' +
        'il_image,'
      ':Generate_popup, :Popup_image)')
    Left = 344
    Top = 8
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
      end
      item
        Name = 'Other_info_prompt'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Thumbnail_image'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Generate_popup'
      end
      item
        Name = 'Popup_image'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryUpdECommInfo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update ecommerce_info'
      'set'
      '  Stock_Reference = :Stock_Reference,'
      '  Other_info_prompt = :Other_info_prompt,'
      '  Thumbnail_image = :Thumbnail_image,'
      '  Generate_popup = :Generate_popup,'
      '  Popup_image = :Popup_image'
      'where'
      '  Ecommerce_info = :Ecommerce_info;'
      '')
    Left = 376
    Top = 8
    ParamData = <
      item
        Name = 'Stock_Reference'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Other_info_prompt'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Thumbnail_image'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Generate_popup'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Popup_image'
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
    Left = 304
    Top = 8
    ParamData = <
      item
        Name = 'stock_reference'
      end>
  end
  object qryTopECommNo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(ecommerce_info) as top_No '
      'from ecommerce_info;')
    Left = 192
    Top = 176
  end
end
