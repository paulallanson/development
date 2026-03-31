object frmWTMaintAppointmentDateType: TfrmWTMaintAppointmentDateType
  Left = 422
  Top = 181
  BorderStyle = bsDialog
  Caption = 'Appointment Type'
  ClientHeight = 145
  ClientWidth = 436
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    436
    145)
  TextHeight = 17
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 66
    Height = 17
    Caption = 'Description'
  end
  object Label2: TLabel
    Left = 16
    Top = 60
    Width = 39
    Height = 17
    Caption = 'Colour'
  end
  object btnOK: TBitBtn
    Left = 141
    Top = 107
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
    ExplicitTop = 98
  end
  object BitBtn2: TBitBtn
    Left = 221
    Top = 107
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
    ExplicitTop = 98
  end
  object edtColor: TEdit
    Left = 94
    Top = 56
    Width = 131
    Height = 25
    MaxLength = 40
    ReadOnly = True
    TabOrder = 3
    Text = 'Sample Text'
  end
  object Button1: TButton
    Left = 240
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Colour'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 327
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Font'
    TabOrder = 5
    OnClick = Button2Click
  end
  object edtName: TEdit
    Left = 94
    Top = 20
    Width = 185
    Height = 25
    TabOrder = 0
    Text = 'edtName'
    OnChange = EnableOK
  end
  object ColorDialog1: TColorDialog
    Left = 36
    Top = 56
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE AppointmentDateType'
      'SET'
      '  Name = :Name'
      'WHERE'
      '  ID = :ID')
    Left = 312
    Top = 65534
    ParamData = <
      item
        Name = 'Name'
      end
      item
        Name = 'ID'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into AppointmentDateType'
      '        (ID,'
      '        Name)'
      'Select Max(ID)+1, :GUID'
      'From AppointmentDateType'
      ' ')
    Left = 120
    Top = 24
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
      'Select ID'
      'From AppointmentDateType'
      'Where Name = :GUID')
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
