object frmWTMaintCustEdge: TfrmWTMaintCustEdge
  Left = 447
  Top = 168
  BorderStyle = bsDialog
  Caption = 'Maintain Customer Edge Profile'
  ClientHeight = 175
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 71
    Height = 17
    Caption = 'Description'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 52
    Width = 61
    Height = 17
    Caption = 'Cost Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 84
    Width = 76
    Height = 17
    Caption = 'Selling Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dblkpDescription: TDBLookupComboBox
    Left = 92
    Top = 16
    Width = 249
    Height = 25
    KeyField = 'Edge_Profile'
    ListField = 'Description'
    ListSource = srclkpEdges
    TabOrder = 0
    OnClick = EnableOK
  end
  object btnCutOuts: TBitBtn
    Left = 347
    Top = 16
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
    Left = 92
    Top = 48
    Width = 105
    Height = 25
    TabOrder = 2
    Text = '0.00'
    OnChange = EnableOK
  end
  object edtmnySell: TCREditMoney
    Left = 92
    Top = 80
    Width = 105
    Height = 25
    TabOrder = 3
    Text = '0.00'
    OnChange = EnableOK
  end
  object btnOK: TBitBtn
    Left = 207
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
    Left = 295
    Top = 120
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 5
  end
  object lkpEdges: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select * from Edge_Profile'
      'where Edge_Profile not in'
      '(select Edge_Profile from Customer_Edge'
      ' where Group_Id = :Group_Id AND Edge_Type = :Edge_Type) and'
      '((inactive = '#39'N'#39') or (inactive = '#39#39') or (inactive is null))'
      'order by Description')
    Left = 304
    Top = 48
    ParamData = <
      item
        Name = 'Group_Id'
      end
      item
        Name = 'Edge_Type'
      end>
  end
  object srclkpEdges: TDataSource
    DataSet = lkpEdges
    Left = 352
    Top = 48
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'INSERT INTO Customer_Edge'
      '('
      'Group_Id,'
      'Edge_Profile,'
      'Edge_type,'
      'Price_Pointer'
      ')'
      'VALUES'
      '('
      ':Group_Id,'
      ':Edge_Profile,'
      ':Edge_type,'
      ':Price_Pointer'
      ')')
    Left = 8
    Top = 112
    ParamData = <
      item
        Name = 'Group_Id'
      end
      item
        Name = 'Edge_Profile'
      end
      item
        Name = 'Edge_type'
      end
      item
        Name = 'Price_Pointer'
      end>
  end
end
