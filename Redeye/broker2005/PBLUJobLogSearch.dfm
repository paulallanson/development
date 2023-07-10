object frmPBLUJobLogSearch: TfrmPBLUJobLogSearch
  Left = 433
  Top = 163
  BorderStyle = bsDialog
  Caption = 'Search Data Collection'
  ClientHeight = 343
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    285
    343)
  PixelsPerInch = 96
  TextHeight = 13
  object lblFormReference: TLabel
    Left = 11
    Top = 251
    Width = 60
    Height = 13
    Caption = 'Work Centre'
  end
  object lblQuantity: TLabel
    Left = 11
    Top = 154
    Width = 48
    Height = 13
    Caption = 'Job Name'
  end
  object lblProductCode: TLabel
    Left = 11
    Top = 227
    Width = 38
    Height = 13
    Caption = 'Process'
  end
  object Label9: TLabel
    Left = 11
    Top = 2
    Width = 51
    Height = 13
    Caption = 'Item Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 120
    Top = 2
    Width = 148
    Height = 13
    Caption = 'Type here to narrow the search'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 11
    Top = 34
    Width = 46
    Height = 13
    Caption = 'Date from'
  end
  object lblDescription: TLabel
    Left = 11
    Top = 274
    Width = 46
    Height = 13
    Caption = 'Operation'
  end
  object lblDescriptiveRef: TLabel
    Left = 11
    Top = 178
    Width = 90
    Height = 13
    Caption = 'Non Job Bag Code'
  end
  object lblJobNumber: TLabel
    Left = 11
    Top = 130
    Width = 57
    Height = 13
    Caption = 'Job Number'
  end
  object lblStatus: TLabel
    Left = 11
    Top = 202
    Width = 55
    Height = 13
    Caption = 'Department'
  end
  object Label1: TLabel
    Left = 11
    Top = 68
    Width = 35
    Height = 13
    Caption = 'Date to'
  end
  object Label4: TLabel
    Left = 11
    Top = 106
    Width = 44
    Height = 13
    Caption = 'Customer'
  end
  object edtProcess: TEdit
    Left = 120
    Top = 222
    Width = 153
    Height = 21
    TabOrder = 5
  end
  object edtWorkCentre: TEdit
    Left = 120
    Top = 246
    Width = 153
    Height = 21
    TabOrder = 6
  end
  object edtJobName: TEdit
    Left = 120
    Top = 150
    Width = 153
    Height = 21
    TabOrder = 2
  end
  object SearchButton: TButton
    Left = 12
    Top = 308
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Start Search'
    Default = True
    TabOrder = 8
    OnClick = SearchButtonClick
  end
  object edtOperation: TEdit
    Left = 120
    Top = 270
    Width = 153
    Height = 21
    TabOrder = 7
  end
  object edtNonJobCode: TEdit
    Left = 120
    Top = 174
    Width = 153
    Height = 21
    TabOrder = 3
  end
  object edtJobNumber: TEdit
    Left = 120
    Top = 126
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object edtDepartment: TEdit
    Left = 120
    Top = 198
    Width = 153
    Height = 21
    TabOrder = 4
  end
  object ClearButton: TButton
    Left = 196
    Top = 308
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 9
    OnClick = ClearButtonClick
  end
  object edtCustomer: TEdit
    Left = 120
    Top = 102
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object dtmDateFrom: TDateTimePicker
    Left = 120
    Top = 30
    Width = 90
    Height = 21
    Date = 39825.487247696760000000
    Time = 39825.487247696760000000
    TabOrder = 10
  end
  object dtmDateTo: TDateTimePicker
    Left = 120
    Top = 64
    Width = 90
    Height = 21
    Date = 39825.487276446760000000
    Time = 39825.487276446760000000
    TabOrder = 11
  end
end
