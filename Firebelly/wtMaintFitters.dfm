object frmWTMaintFitters: TfrmWTMaintFitters
  Left = 306
  Top = 143
  BorderStyle = bsDialog
  Caption = 'Fitter Details'
  ClientHeight = 217
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  DesignSize = (
    360
    217)
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel
    Left = 8
    Top = 20
    Width = 54
    Height = 13
    Caption = 'Fitter Name'
  end
  object Label1: TLabel
    Left = 8
    Top = 52
    Width = 48
    Height = 13
    Caption = 'Phone No'
  end
  object Label2: TLabel
    Left = 8
    Top = 78
    Width = 48
    Height = 13
    Caption = 'Mobile No'
  end
  object Label3: TLabel
    Left = 8
    Top = 104
    Width = 66
    Height = 13
    Caption = 'Email Address'
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 186
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 6
    OnClick = btnOKClick
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 186
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 7
    NumGlyphs = 2
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 170
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 5
  end
  object chkbxIncludeInSchedule: TCheckBox
    Left = 8
    Top = 138
    Width = 161
    Height = 17
    Caption = 'Include in Schedule'
    TabOrder = 4
  end
  object edtFitterName: TEdit
    Left = 88
    Top = 16
    Width = 225
    Height = 21
    TabOrder = 0
    Text = 'edtFitterName'
    OnChange = EnableOK
  end
  object edtTelephoneNumber: TEdit
    Left = 88
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edtTelephoneNumber'
  end
  object edtMobileNumber: TEdit
    Left = 88
    Top = 74
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'edtMobileNumber'
  end
  object edtEmailAddress: TEdit
    Left = 88
    Top = 100
    Width = 265
    Height = 21
    TabOrder = 3
    Text = 'edtEmailAddress'
  end
  object qryUpdate: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'UPDATE Fitter'
      'SET'
      '  Fitter_Name = :Fitter_Name,'
      '  Telephone_Number = :Telephone_Number,'
      '  Mobile_Number = :Mobile_Number,'
      '  Email_Address = :Email_Address,'
      '  Include_in_Schedule = :Include_in_Schedule,'
      '  inActive = :inactive'
      'WHERE'
      '  Fitter = :Fitter')
    Left = 80
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Fitter_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Telephone_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mobile_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Email_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Include_in_Schedule'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fitter'
        ParamType = ptUnknown
      end>
  end
  object qryAdd: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Insert Into Fitter'
      '        (Fitter,'
      '        Fitter_Name,'
      '        inactive)'
      'Select Max(Fitter)+1, :GUID, '#39'N'#39
      'From Fitter'
      ' ')
    Left = 136
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryGetLast: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Select Fitter'
      'From Fitter'
      'Where Fitter_Name = :GUID')
    Left = 248
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryZero: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Update Category'
      'Set     Description = :Description,'
      '        Commission_rate = :Commission_Rate,'
      '        lnvoice_immediately = :Invoice_Immediately,'
      '        Cleared_Funds_Required = :Cleared_Funds_Required,'
      '        Use_Separate_Invoice_Seq = :Use_Separate_Invoice_Seq,'
      '        Inv_Narrative = :Inv_Narrative'
      'Where'
      '(Category = :Category) '
      '')
    Left = 312
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Commission_Rate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Immediately'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cleared_Funds_Required'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Use_Separate_Invoice_Seq'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inv_Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Category'
        ParamType = ptUnknown
      end>
  end
end
