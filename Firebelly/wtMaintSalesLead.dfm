object frmWTMaintSalesLead: TfrmWTMaintSalesLead
  Left = 284
  Top = 232
  BorderStyle = bsDialog
  Caption = 'Sales Lead Details'
  ClientHeight = 120
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    360
    120)
  TextHeight = 17
  object label1: TLabel
    Left = 8
    Top = 20
    Width = 106
    Height = 17
    Caption = 'Sales Lead Source'
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 82
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 82
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 58
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 3
  end
  object edtSalesleadSourceDescr: TEdit
    Left = 120
    Top = 16
    Width = 225
    Height = 25
    TabOrder = 0
    Text = 'edtSalesleadSourceDescr'
    OnChange = EnableOK
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Sales_Lead_Source'
      'SET'
      '  Sales_Lead_Source_Descr = :Sales_Lead_Source_Descr,'
      '  inActive = :inactive'
      'WHERE'
      '  Sales_Lead_Source = :Sales_Lead_Source')
    Left = 16
    Top = 40
    ParamData = <
      item
        Name = 'Sales_Lead_Source_Descr'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Sales_Lead_Source'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Sales_Lead_Source'
      '        (Sales_Lead_Source,'
      '        Sales_Lead_Source_Descr,'
      '        inactive)'
      'Select Max(Sales_Lead_Source)+1, :GUID, '#39'N'#39
      'From Sales_Lead_Source'
      ' ')
    Left = 64
    Top = 48
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Sales_Lead_Source'
      'From Sales_Lead_Source'
      'Where Sales_Lead_Source_Descr = :GUID')
    Left = 232
    Top = 24
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      ''
      '')
    Left = 296
    Top = 24
  end
end
