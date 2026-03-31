object frmWTMaintFitters: TfrmWTMaintFitters
  Left = 306
  Top = 143
  BorderStyle = bsDialog
  Caption = 'Fitter Details'
  ClientHeight = 231
  ClientWidth = 395
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
    395
    231)
  TextHeight = 17
  object lblName: TLabel
    Left = 8
    Top = 20
    Width = 68
    Height = 17
    Caption = 'Fitter Name'
  end
  object Label1: TLabel
    Left = 8
    Top = 49
    Width = 58
    Height = 17
    Caption = 'Phone No'
  end
  object Label2: TLabel
    Left = 8
    Top = 78
    Width = 63
    Height = 17
    Caption = 'Mobile No'
  end
  object Label3: TLabel
    Left = 8
    Top = 107
    Width = 83
    Height = 17
    Caption = 'Email Address'
  end
  object btnOK: TBitBtn
    Left = 184
    Top = 200
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 6
    OnClick = btnOKClick
    ExplicitTop = 177
  end
  object BitBtn2: TBitBtn
    Left = 272
    Top = 200
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 7
    ExplicitTop = 177
  end
  object chkbxInactive: TCheckBox
    Left = 8
    Top = 172
    Width = 97
    Height = 17
    Caption = 'Inactive'
    TabOrder = 5
  end
  object chkbxIncludeInSchedule: TCheckBox
    Left = 8
    Top = 144
    Width = 161
    Height = 17
    Caption = 'Include in Schedule'
    TabOrder = 4
  end
  object edtFitterName: TEdit
    Left = 104
    Top = 17
    Width = 225
    Height = 25
    TabOrder = 0
    Text = 'edtFitterName'
    OnChange = EnableOK
  end
  object edtTelephoneNumber: TEdit
    Left = 104
    Top = 46
    Width = 121
    Height = 25
    TabOrder = 1
    Text = 'edtTelephoneNumber'
  end
  object edtMobileNumber: TEdit
    Left = 104
    Top = 75
    Width = 121
    Height = 25
    TabOrder = 2
    Text = 'edtMobileNumber'
  end
  object edtEmailAddress: TEdit
    Left = 104
    Top = 104
    Width = 265
    Height = 25
    TabOrder = 3
    Text = 'edtEmailAddress'
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
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
    Left = 212
    Top = 50
    ParamData = <
      item
        Name = 'Fitter_Name'
      end
      item
        Name = 'Telephone_Number'
      end
      item
        Name = 'Mobile_Number'
      end
      item
        Name = 'Email_Address'
      end
      item
        Name = 'Include_in_Schedule'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Fitter'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Fitter'
      '        (Fitter,'
      '        Fitter_Name,'
      '        inactive)'
      'Select Max(Fitter)+1, :GUID, '#39'N'#39
      'From Fitter'
      ' ')
    Left = 186
    Top = 51
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
      'Select Fitter'
      'From Fitter'
      'Where Fitter_Name = :GUID')
    Left = 248
    Top = 40
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
        Name = 'Description'
      end
      item
        Name = 'Commission_Rate'
      end
      item
        Name = 'Invoice_Immediately'
      end
      item
        Name = 'Cleared_Funds_Required'
      end
      item
        Name = 'Use_Separate_Invoice_Seq'
      end
      item
        Name = 'Inv_Narrative'
      end
      item
        Name = 'Category'
      end>
  end
end
