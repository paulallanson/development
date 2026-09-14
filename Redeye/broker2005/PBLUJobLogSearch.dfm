object frmPBLUJobLogSearch: TfrmPBLUJobLogSearch
  Left = 433
  Top = 163
  BorderStyle = bsDialog
  Caption = 'Search Data Collection'
  ClientHeight = 374
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    325
    374)
  TextHeight = 17
  object lblFormReference: TLabel
    Left = 11
    Top = 269
    Width = 72
    Height = 17
    Caption = 'Work Centre'
  end
  object lblQuantity: TLabel
    Left = 11
    Top = 160
    Width = 60
    Height = 17
    Caption = 'Job Name'
  end
  object lblProductCode: TLabel
    Left = 11
    Top = 242
    Width = 45
    Height = 17
    Caption = 'Process'
  end
  object Label9: TLabel
    Left = 11
    Top = 6
    Width = 64
    Height = 17
    Caption = 'Item Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 128
    Top = 6
    Width = 182
    Height = 17
    Caption = 'Type here to narrow the search'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 11
    Top = 34
    Width = 59
    Height = 17
    Caption = 'Date from'
  end
  object lblDescription: TLabel
    Left = 11
    Top = 295
    Width = 59
    Height = 17
    Caption = 'Operation'
  end
  object lblDescriptiveRef: TLabel
    Left = 11
    Top = 187
    Width = 111
    Height = 17
    Caption = 'Non Job Bag Code'
  end
  object lblJobNumber: TLabel
    Left = 11
    Top = 133
    Width = 73
    Height = 17
    Caption = 'Job Number'
  end
  object lblStatus: TLabel
    Left = 11
    Top = 214
    Width = 69
    Height = 17
    Caption = 'Department'
  end
  object Label1: TLabel
    Left = 11
    Top = 68
    Width = 43
    Height = 17
    Caption = 'Date to'
  end
  object Label4: TLabel
    Left = 11
    Top = 106
    Width = 56
    Height = 17
    Caption = 'Customer'
  end
  object edtProcess: TEdit
    Left = 128
    Top = 237
    Width = 153
    Height = 25
    TabOrder = 5
  end
  object edtWorkCentre: TEdit
    Left = 128
    Top = 264
    Width = 153
    Height = 25
    TabOrder = 6
  end
  object edtJobName: TEdit
    Left = 128
    Top = 156
    Width = 153
    Height = 25
    TabOrder = 2
  end
  object SearchButton: TButton
    Left = 12
    Top = 339
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Start Search'
    Default = True
    TabOrder = 8
    OnClick = SearchButtonClick
    ExplicitTop = 299
  end
  object edtOperation: TEdit
    Left = 128
    Top = 291
    Width = 153
    Height = 25
    TabOrder = 7
  end
  object edtNonJobCode: TEdit
    Left = 128
    Top = 183
    Width = 153
    Height = 25
    TabOrder = 3
  end
  object edtJobNumber: TEdit
    Left = 128
    Top = 129
    Width = 153
    Height = 25
    TabOrder = 1
  end
  object edtDepartment: TEdit
    Left = 128
    Top = 210
    Width = 153
    Height = 25
    TabOrder = 4
  end
  object ClearButton: TButton
    Left = 196
    Top = 339
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 9
    OnClick = ClearButtonClick
    ExplicitTop = 299
  end
  object edtCustomer: TEdit
    Left = 128
    Top = 102
    Width = 153
    Height = 25
    TabOrder = 0
  end
  object dtmDateFrom: TDateTimePicker
    Left = 128
    Top = 30
    Width = 90
    Height = 25
    Date = 39825.000000000000000000
    Time = 0.487247696757549400
    TabOrder = 10
  end
  object dtmDateTo: TDateTimePicker
    Left = 128
    Top = 64
    Width = 90
    Height = 25
    Date = 39825.000000000000000000
    Time = 0.487276446758187400
    TabOrder = 11
  end
end
