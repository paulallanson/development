object frmPBLUActivitiesSearch: TfrmPBLUActivitiesSearch
  Left = 509
  Top = 99
  BorderStyle = bsDialog
  Caption = 'Activity Search'
  ClientHeight = 397
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    285
    397)
  TextHeight = 13
  object Label9: TLabel
    Left = 11
    Top = 10
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
    Top = 10
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
  object Label6: TLabel
    Left = 11
    Top = 35
    Width = 34
    Height = 13
    Caption = 'Branch'
  end
  object Label13: TLabel
    Left = 11
    Top = 82
    Width = 36
    Height = 13
    Caption = 'Subject'
  end
  object Label1: TLabel
    Left = 11
    Top = 300
    Width = 65
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Created since'
    ExplicitTop = 309
  end
  object Label4: TLabel
    Left = 11
    Top = 178
    Width = 24
    Height = 13
    Caption = 'Type'
  end
  object Label2: TLabel
    Left = 11
    Top = 58
    Width = 37
    Height = 13
    Caption = 'Contact'
  end
  object Label5: TLabel
    Left = 11
    Top = 155
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label10: TLabel
    Left = 11
    Top = 202
    Width = 30
    Height = 13
    Caption = 'Status'
  end
  object Label14: TLabel
    Left = 11
    Top = 250
    Width = 52
    Height = 13
    Caption = 'Created By'
  end
  object Label15: TLabel
    Left = 11
    Top = 226
    Width = 59
    Height = 13
    Caption = 'Assigned To'
  end
  object lblDueDate: TLabel
    Left = 11
    Top = 270
    Width = 46
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Due Date'
    ExplicitTop = 279
  end
  object Label3: TLabel
    Left = 11
    Top = 107
    Width = 31
    Height = 13
    Caption = 'Priority'
  end
  object Label7: TLabel
    Left = 11
    Top = 131
    Width = 50
    Height = 13
    Caption = 'Reference'
  end
  object edtSubject: TEdit
    Left = 120
    Top = 78
    Width = 153
    Height = 21
    TabOrder = 2
  end
  object edtBranch: TEdit
    Left = 120
    Top = 30
    Width = 153
    Height = 21
    TabOrder = 0
  end
  object chkbxShowOnlyLive: TCheckBox
    Tag = 12
    Left = 12
    Top = 324
    Width = 185
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show only live activities'
    TabOrder = 14
  end
  object SearchButton: TButton
    Left = 12
    Top = 356
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Start Search'
    Default = True
    TabOrder = 15
    OnClick = SearchButtonClick
  end
  object edtDate: TEdit
    Left = 120
    Top = 296
    Width = 89
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 12
    OnExit = edtDateExit
  end
  object btnDate: TBitBtn
    Left = 216
    Top = 294
    Width = 25
    Height = 25
    Anchors = [akLeft, akBottom]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
      F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
      F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
      F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
      F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
      F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
      F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
      333337FFFFFFFF77333330000000000333333777777777733333}
    NumGlyphs = 2
    TabOrder = 13
    OnClick = btnDateClick
  end
  object edtType: TEdit
    Left = 120
    Top = 174
    Width = 153
    Height = 21
    TabOrder = 6
  end
  object edtPriority: TEdit
    Left = 120
    Top = 102
    Width = 153
    Height = 21
    TabOrder = 3
  end
  object ClearButton: TButton
    Left = 196
    Top = 357
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear Search'
    TabOrder = 16
    OnClick = ClearButtonClick
  end
  object edtContact: TEdit
    Left = 120
    Top = 54
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object edtStatus: TEdit
    Left = 120
    Top = 198
    Width = 153
    Height = 21
    TabOrder = 7
  end
  object edtCreatedBy: TEdit
    Left = 120
    Top = 246
    Width = 153
    Height = 21
    TabOrder = 9
  end
  object edtAssignedTo: TEdit
    Left = 120
    Top = 222
    Width = 153
    Height = 21
    TabOrder = 8
  end
  object edtDueDate: TEdit
    Left = 120
    Top = 266
    Width = 89
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 10
    OnExit = edtDueDateExit
  end
  object BitBtn1: TBitBtn
    Left = 216
    Top = 264
    Width = 25
    Height = 25
    Anchors = [akLeft, akBottom]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
      F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
      F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
      F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
      F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
      F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
      F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
      333337FFFFFFFF77333330000000000333333777777777733333}
    NumGlyphs = 2
    TabOrder = 11
    OnClick = BitBtn1Click
  end
  object edtDescription: TEdit
    Left = 120
    Top = 150
    Width = 153
    Height = 21
    TabOrder = 5
  end
  object edtReference: TEdit
    Left = 120
    Top = 126
    Width = 153
    Height = 21
    TabOrder = 4
  end
end
