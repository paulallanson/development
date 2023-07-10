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
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
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
    TabOrder = 7
    OnClick = btbtnOKClick
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 336
    Top = 184
    Width = 75
    Height = 25
    TabOrder = 8
    Kind = bkCancel
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 248
    Top = 112
  end
  object qryInsECommInfo: TQuery
    DatabaseName = 'PB'
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
        DataType = ftInteger
        Name = 'Ecommerce_info'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Stock_Reference'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Other_info_prompt'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Thumbnail_image'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Generate_popup'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Popup_image'
        ParamType = ptInput
      end>
  end
  object qryUpdECommInfo: TQuery
    DatabaseName = 'PB'
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
        DataType = ftString
        Name = 'Stock_Reference'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Other_info_prompt'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Thumbnail_image'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Generate_popup'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Popup_image'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Ecommerce_info'
        ParamType = ptInput
      end>
  end
  object qrySelECommInfo: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from ecommerce_info'
      'where stock_reference = :stock_reference;')
    Left = 304
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'stock_reference'
        ParamType = ptUnknown
      end>
  end
  object qryTopECommNo: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select max(ecommerce_info) as top_No '
      'from ecommerce_info;')
    Left = 192
    Top = 176
  end
end
