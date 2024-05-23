object Form1: TForm1
  Left = 164
  Top = 89
  Caption = 'Form1'
  ClientHeight = 189
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 497
    Height = 153
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 160
    Top = 168
    Width = 75
    Height = 25
    Caption = '&Add'
    TabOrder = 1
  end
  object Button2: TButton
    Left = 248
    Top = 168
    Width = 75
    Height = 25
    Caption = '&Change'
    TabOrder = 2
  end
  object Button3: TButton
    Left = 336
    Top = 168
    Width = 75
    Height = 25
    Caption = '&Delete'
    TabOrder = 3
  end
  object Button4: TButton
    Left = 432
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Clos&e'
    TabOrder = 4
  end
  object dtsBranch: TDataSource
    DataSet = qryBranch
    Left = 160
    Top = 32
  end
  object qryBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Customer_branch'
      'where Customer = :Customer')
    Left = 96
    Top = 32
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
end
