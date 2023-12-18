object frmWTMaintCutOutDetails: TfrmWTMaintCutOutDetails
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Cut Outs details'
  ClientHeight = 159
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 59
    Height = 13
    Caption = 'Description'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 52
    Width = 51
    Height = 13
    Caption = 'Cost Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 84
    Width = 63
    Height = 13
    Caption = 'Selling Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dblkpDescription: TDBLookupComboBox
    Left = 88
    Top = 16
    Width = 249
    Height = 21
    KeyField = 'CutOut'
    ListField = 'Description'
    ListSource = srclkpCutOuts
    TabOrder = 0
    OnClick = EnableOK
  end
  object btnCutOuts: TBitBtn
    Left = 343
    Top = 14
    Width = 25
    Height = 25
    Hint = 'Select Customer'
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnCutOutsClick
  end
  object edtmnyCost: TCREditMoney
    Left = 88
    Top = 48
    Width = 105
    Height = 21
    TabOrder = 2
    Text = '0.00'
  end
  object edtmnySell: TCREditMoney
    Left = 88
    Top = 80
    Width = 105
    Height = 21
    TabOrder = 3
    Text = '0.00'
  end
  object btnOK: TBitBtn
    Left = 200
    Top = 120
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 288
    Top = 120
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 5
  end
  object lkpCutOuts: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * from cutout'
      'where cutout not in'
      '(select cutout from cutout_thickness'
      
        ' where material_type = :Material_type and Edge_Type = :Edge_Type' +
        ') and'
      '((inactive = '#39'N'#39') or (inactive = '#39#39') or (inactive is null))'
      'order by Description')
    Left = 72
    Top = 8
    ParamData = <
      item
        Name = 'Material_type'
      end
      item
        Name = 'Edge_Type'
      end>
  end
  object srclkpCutOuts: TDataSource
    DataSet = lkpCutOuts
    Left = 128
    Top = 8
  end
  object qryAdd: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'INSERT INTO CutOut_Thickness'
      '('
      '  CutOut,'
      '  Edge_Type,'
      '  Material_Type,'
      '  Price_Pointer'
      ')'
      'VALUES'
      '('
      '  :CutOut,'
      '  :Edge_Type,'
      '  :Material_Type,'
      '  :Price_Pointer'
      ')'
      '')
    Left = 64
    Top = 96
    ParamData = <
      item
        Name = 'CutOut'
      end
      item
        Name = 'Edge_Type'
      end
      item
        Name = 'Material_Type'
      end
      item
        Name = 'price_pointer'
      end>
  end
end
