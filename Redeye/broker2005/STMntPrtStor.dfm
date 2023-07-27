object STMntPrtStorFrm: TSTMntPrtStorFrm
  Left = 144
  Top = 111
  AutoScroll = False
  Caption = 'Maintain Product Store'
  ClientHeight = 377
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DelLabel: TLabel
    Left = 14
    Top = 334
    Width = 145
    Height = 15
    Caption = 'Delete the above details ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object OKBitBtn: TBitBtn
    Left = 190
    Top = 334
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = OKBitBtnClick
    Glyph.Data = {
      CE070000424DCE07000000000000360000002800000024000000120000000100
      1800000000009807000000000000000000000000000000000000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F7F00007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F7F0000007F00007F007F0000007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F0000007F00007F00007F0000
      7F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F000000
      7F00007F00007F00007F00007F00007F007F0000007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F
      7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F7F0000007F00007F00007F0000FF00007F00007F00007F00007F00
      7F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFF
      FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F00007F00007F0000FF00007F7F
      00FF00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F7F7F7FFFFFFF007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00
      007F0000FF00007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F00
      7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F00FF
      00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F
      7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF0000
      7F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F
      7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00
      007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFF
      FFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F00FF00007F00007F007F0000007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F
      7F7FFFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00007F
      00007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F}
    NumGlyphs = 2
  end
  object CancelBitBtn: TBitBtn
    Left = 278
    Top = 334
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = CancelBitBtnClick
    Glyph.Data = {
      CE070000424DCE07000000000000360000002800000024000000120000000100
      1800000000009807000000000000000000000000000000000000007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
      7F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F0000FF7F7F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF007F7F
      007F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F00
      00FF00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
      FFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7FFFFFFF7F7F7F7F7F7FFFFF
      FF007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00
      007F7F7F7F007F7F0000FF00007F00007F00007F00007F7F7F7F007F7F007F7F
      007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7FFFFF
      FF7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F00
      7F7F0000FF00007F00007F00007F00007F7F7F7F00007F00007F00007F00007F
      00007F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F
      7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF00
      7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00007F
      00007F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F00
      7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      0000FF00007F00007F00007F00007F00007F00007F7F7F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F00
      7F7F007F7F007F7F007F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F00007F00007F00007F00007F00007F7F7F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
      7F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
      7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F0000FF00007F00007F00007F00007F00007F7F7F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
      007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F7F7F7F00007F00
      007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00
      007F7F7F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F7F7F7FFFFF
      FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F0000FF00007F00007F7F7F7F007F7F007F7F007F7F0000FF00007F00007F
      00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
      7F007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F007F7F007F7F007F7F
      007F7F007F7F0000FF00007F00007F00007F007F7F007F7F007F7F007F7F007F
      7F007F7F7F7F7FFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F7F7F7FFFFFFF00
      7F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F0000FF007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F00
      7F7F007F7F007F7F7F7F7FFFFFFFFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F7F7F7F
      007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
      7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
      7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
      007F7F007F7F007F7F007F7F007F7F007F7F}
    NumGlyphs = 2
  end
  object DetsGrpBox: TGroupBox
    ParentBackground = False
    Left = 8
    Top = 12
    Width = 481
    Height = 117
    Caption = 'Product Store Details'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label5: TLabel
      Left = 11
      Top = 23
      Width = 33
      Height = 13
      Caption = 'Name'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 11
      Top = 56
      Width = 63
      Height = 13
      Caption = 'Store Type'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object NameEdit: TEdit
      Left = 94
      Top = 17
      Width = 212
      Height = 21
      MaxLength = 40
      TabOrder = 0
      OnChange = NameEditChange
    end
    object BinsCheckBox: TCheckBox
      Left = 11
      Top = 88
      Width = 150
      Height = 17
      Caption = 'Use Stock Bins'
      TabOrder = 1
    end
    object LotsCheckBox: TCheckBox
      Left = 168
      Top = 88
      Width = 140
      Height = 17
      Caption = 'Use Stock Lots'
      TabOrder = 2
    end
    object NegativeCheckBox: TCheckBox
      Left = 312
      Top = 88
      Width = 161
      Height = 17
      Caption = 'Allow Negative Stock'
      TabOrder = 3
    end
  end
  object StorTypDBLookupComboBox: TDBLookupComboBox
    Left = 102
    Top = 64
    Width = 209
    Height = 21
    KeyField = 'Part_Store_Type'
    ListField = 'Part_Store_Type_Name'
    ListSource = StorTypsDataSource
    TabOrder = 3
    OnClick = StorTypDBLookupComboBoxClick
  end
  object AddressGroupBox: TGroupBox
    ParentBackground = False
    Left = 8
    Top = 136
    Width = 473
    Height = 185
    Caption = 'Address Details'
    TabOrder = 4
    object StreetLabel: TLabel
      Left = 8
      Top = 16
      Width = 35
      Height = 13
      Caption = 'Street'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DistrictLabel: TLabel
      Left = 8
      Top = 40
      Width = 32
      Height = 13
      Caption = 'District'
    end
    object TownLabel: TLabel
      Left = 8
      Top = 64
      Width = 27
      Height = 13
      Caption = 'Town'
    end
    object PostLabel: TLabel
      Left = 8
      Top = 88
      Width = 54
      Height = 13
      Caption = 'Postcode'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TelLabel: TLabel
      Left = 8
      Top = 112
      Width = 61
      Height = 13
      Caption = 'Telephone'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object FaxLabel: TLabel
      Left = 8
      Top = 136
      Width = 57
      Height = 13
      Caption = 'Fax Number'
    end
    object StreetEdit: TEdit
      Left = 136
      Top = 16
      Width = 300
      Height = 21
      TabOrder = 0
      OnChange = StreetEditChange
    end
    object DistrictEdit: TEdit
      Left = 136
      Top = 40
      Width = 300
      Height = 21
      TabOrder = 1
      OnChange = DistrictEditChange
    end
    object TownEdit: TEdit
      Left = 136
      Top = 64
      Width = 300
      Height = 21
      TabOrder = 2
      OnChange = TownEditChange
    end
    object PostEdit: TEdit
      Left = 136
      Top = 88
      Width = 120
      Height = 21
      TabOrder = 3
      OnChange = PostEditChange
    end
    object PhoneEdit: TEdit
      Left = 136
      Top = 112
      Width = 150
      Height = 21
      TabOrder = 4
      OnChange = PhoneEditChange
    end
    object chkbxActive: TCheckBox
      Left = 9
      Top = 160
      Width = 185
      Height = 17
      Caption = 'Store is active'
      TabOrder = 5
    end
  end
  object FaxEdit: TEdit
    Left = 144
    Top = 272
    Width = 150
    Height = 21
    TabOrder = 5
    OnChange = FaxEditChange
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part_Store'
      'Set'
      '        Part_Store = :Part_Store,'
      '        Part_Store_Name = :Part_Store_Name,'
      '        Part_Store_Type = :Part_Store_Type,'
      '        Stock_Bins_In_Use = :Stock_Bins_In_Use,'
      '        Stock_Lots_In_Use = :Stock_Lots_In_Use,'
      '        Internal_Number_and_Stret = :Internal_Number_and_Stret,'
      '        Internal_District = :Internal_District,'
      '        Internal_Town = :Internal_Town,'
      '        Internal_Postcode = :Internal_Postcode,'
      '        Internal_Phone = :Internal_Phone,'
      '        Internal_Fax = :Internal_Fax,'
      '        Allow_Neg_Stock = :Allow_Neg_Stock,'
      '        inactive = :inactive'
      'Where'
      '(Part_Store = :Part_Store)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 232
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Bins_In_Use'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Lots_In_Use'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_Number_and_Stret'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_District'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_Town'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_Postcode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_Fax'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Allow_Neg_Stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Part_Store'
      
        '(Part_Store, Part_Store_Name, Part_Store_Type, Stock_Bins_In_Use' +
        ','
      
        ' Stock_Lots_In_Use, Internal_Number_and_Stret, Internal_District' +
        ','
      ' Internal_Town, Internal_Postcode, Internal_Phone, Internal_Fax,'
      ' Allow_Neg_Stock)'
      'Values'
      
        '(:Part_Store, :Part_Store_Name, :Part_Store_Type, :Stock_Bins_In' +
        '_Use,'
      
        ' :Stock_Lots_In_Use, :Internal_Number_and_Stret, :Internal_Distr' +
        'ict,'
      
        ' :Internal_Town, :Internal_Postcode, :Internal_Phone, :Internal_' +
        'Fax,'
      ' :Allow_Neg_Stock)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 152
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Store_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Bins_In_Use'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Stock_Lots_In_Use'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_Number_and_Stret'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_District'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_Town'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_Postcode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Internal_Fax'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Allow_Neg_Stock'
        ParamType = ptUnknown
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Part_Store'
      'where Part_Store = :Part_Store'
      ''
      ' '
      ' '
      ' ')
    Left = 344
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part_Store'
        ParamType = ptUnknown
      end>
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Part_Store) as Last_Code'
      'From Part_Store'
      ' '
      ' '
      ' ')
    Left = 280
    Top = 56
  end
  object GetStorTypsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Store_Type, Part_Store_Type_Name'
      'From Part_Store_Type'
      'Order by Part_Store_Type_Name')
    Left = 48
    Top = 76
  end
  object StorTypsDataSource: TDataSource
    DataSet = GetStorTypsQuery
    Left = 64
    Top = 44
  end
end
