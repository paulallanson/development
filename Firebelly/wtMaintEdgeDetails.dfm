object frmWTMaintEdgeDetails: TfrmWTMaintEdgeDetails
  Left = 200
  Top = 146
  BorderStyle = bsDialog
  Caption = 'Edge details'
  ClientHeight = 173
  ClientWidth = 387
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label4: TLabel
    Left = 8
    Top = 56
    Width = 48
    Height = 13
    Caption = 'Cost Price'
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 58
    Height = 13
    Caption = 'Selling Price'
  end
  object edtmnyCost: TCREditMoney
    Left = 80
    Top = 48
    Width = 105
    Height = 21
    TabOrder = 0
    Text = '0.00'
  end
  object edtmnySell: TCREditMoney
    Left = 80
    Top = 80
    Width = 105
    Height = 21
    TabOrder = 1
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
    TabOrder = 2
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
    TabOrder = 3
  end
  object dblkpDescription: TDBLookupComboBox
    Left = 80
    Top = 16
    Width = 249
    Height = 21
    KeyField = 'Edge_profile'
    ListField = 'Description'
    ListSource = srclkpEdges
    TabOrder = 4
    OnClick = dblkpDescriptionClick
  end
  object btnEdges: TBitBtn
    Left = 335
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
    TabOrder = 5
    OnClick = btnEdgesClick
  end
  object lkpEdges: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * from edge_profile'
      'where edge_profile not in'
      '(select edge_profile from edge_thickness'
      
        'where material_type = :Material_type and Edge_type = :Edge_Type)' +
        ' and'
      '((inactive = '#39'N'#39') or (inactive = '#39#39') or (inactive is null))'
      'order by Description')
    Left = 216
    Top = 56
    ParamData = <
      item
        Name = 'Material_type'
      end
      item
        Name = 'Edge_Type'
      end>
  end
  object srclkpEdges: TDataSource
    DataSet = lkpEdges
    Left = 272
    Top = 56
  end
  object qryAdd: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'INSERT INTO Edge_Thickness'
      '('
      '  Edge_Profile,'
      '  Edge_Type,'
      '  Material_Type,'
      '  Price_Pointer'
      ')'
      'VALUES'
      '('
      '  :Edge_Profile,'
      '  :Edge_Type,'
      '  :Material_Type,'
      '  :Price_Pointer'
      ')'
      '')
    Left = 16
    Top = 112
    ParamData = <
      item
        Name = 'Edge_Profile'
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
