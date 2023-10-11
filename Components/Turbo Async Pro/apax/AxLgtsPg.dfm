object ApxLightsPage: TApxLightsPage
  Left = 382
  Top = 161
  Width = 358
  Height = 300
  Caption = 'Status and Tool Bars'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnNotLitColor: TSpeedButton
    Tag = 2
    Left = 262
    Top = 124
    Width = 76
    Height = 22
    Caption = '&Not lit color...'
    OnClick = btnNotLitColorClick
  end
  object btnLitColor: TSpeedButton
    Tag = 2
    Left = 151
    Top = 124
    Width = 54
    Height = 22
    Caption = 'Lit c&olor...'
    OnClick = btnLitColorClick
  end
  object Label5: TLabel
    Tag = 2
    Left = 12
    Top = 129
    Width = 54
    Height = 13
    Caption = 'Li&ght width:'
    FocusControl = edtLightWidth
  end
  object Label1: TLabel
    Tag = 1
    Left = 12
    Top = 53
    Width = 39
    Height = 13
    Caption = '&Caption:'
    FocusControl = edtCaption
  end
  object Label2: TLabel
    Tag = 1
    Left = 223
    Top = 27
    Width = 26
    Height = 13
    Caption = '&Align:'
    FocusControl = cbxCaptionAlignment
  end
  object Label4: TLabel
    Tag = 1
    Left = 120
    Top = 27
    Width = 31
    Height = 13
    Caption = '&Width:'
    FocusControl = edtCaptionWidth
  end
  object Bevel1: TBevel
    Left = 28
    Top = 13
    Width = 316
    Height = 4
    Shape = bsTopLine
  end
  object Label6: TLabel
    Left = 5
    Top = 7
    Width = 54
    Height = 13
    Caption = 'Status bar  '
  end
  object Bevel2: TBevel
    Left = 28
    Top = 162
    Width = 316
    Height = 4
    Shape = bsTopLine
  end
  object Bevel3: TBevel
    Left = 28
    Top = 88
    Width = 316
    Height = 4
    Shape = bsTopLine
  end
  object Label8: TLabel
    Left = 5
    Top = 82
    Width = 63
    Height = 13
    Caption = 'Status lights  '
  end
  object Label7: TLabel
    Left = 5
    Top = 156
    Width = 45
    Height = 13
    Caption = 'Tool bar  '
  end
  object chkShowTerminalButtons: TCheckBox
    Tag = 3
    Left = 192
    Top = 217
    Width = 137
    Height = 17
    Caption = 'Show ter&minal buttons'
    TabOrder = 0
  end
  object chkShowDeviceSelButton: TCheckBox
    Tag = 3
    Left = 12
    Top = 217
    Width = 177
    Height = 17
    Caption = 'Show device selection &button'
    TabOrder = 1
  end
  object chkShowConnectButtons: TCheckBox
    Tag = 3
    Left = 192
    Top = 196
    Width = 145
    Height = 17
    Caption = 'S&how connect buttons'
    TabOrder = 2
  end
  object chkShowProtocolButtons: TCheckBox
    Tag = 3
    Left = 12
    Top = 196
    Width = 137
    Height = 17
    Caption = 'Show &protocol buttons'
    TabOrder = 3
  end
  object chkShowToolBar: TCheckBox
    Tag = 3
    Left = 12
    Top = 174
    Width = 97
    Height = 17
    Caption = 'Show &tool bar'
    TabOrder = 4
    OnClick = chkShowToolBarClick
  end
  object pnlLightsNotLitColor: TPanel
    Tag = 2
    Left = 238
    Top = 125
    Width = 20
    Height = 20
    BevelOuter = bvLowered
    TabOrder = 5
  end
  object pnlLightsLitColor: TPanel
    Tag = 2
    Left = 127
    Top = 125
    Width = 20
    Height = 20
    BevelOuter = bvLowered
    TabOrder = 6
  end
  object edtLightWidth: TMaskEdit
    Tag = 2
    Left = 69
    Top = 125
    Width = 33
    Height = 21
    EditMask = '!9999;1; '
    MaxLength = 4
    TabOrder = 7
    Text = '   0'
  end
  object UpDown2: TUpDown
    Tag = 2
    Left = 102
    Top = 125
    Width = 15
    Height = 21
    Associate = edtLightWidth
    Max = 32767
    TabOrder = 8
  end
  object chkShowLightCaptions: TCheckBox
    Tag = 2
    Left = 192
    Top = 102
    Width = 137
    Height = 17
    Caption = '&Display light captions'
    TabOrder = 9
  end
  object chkShowLights: TCheckBox
    Tag = 2
    Left = 12
    Top = 102
    Width = 113
    Height = 17
    Caption = 'Show status &lights'
    TabOrder = 10
    OnClick = chkShowToolBarClick
  end
  object edtCaption: TEdit
    Tag = 1
    Left = 60
    Top = 49
    Width = 275
    Height = 21
    TabOrder = 11
  end
  object cbxCaptionAlignment: TComboBox
    Tag = 1
    Left = 253
    Top = 23
    Width = 83
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 12
    Items.Strings = (
      'LeftJustify '
      'RightJustify'
      'Center')
  end
  object edtCaptionWidth: TMaskEdit
    Tag = 1
    Left = 153
    Top = 23
    Width = 33
    Height = 21
    EditMask = '!9999;1; '
    MaxLength = 4
    TabOrder = 13
    Text = '   0'
  end
  object UpDown1: TUpDown
    Tag = 1
    Left = 186
    Top = 23
    Width = 15
    Height = 21
    Associate = edtCaptionWidth
    Max = 32767
    TabOrder = 14
  end
  object chkShowStatusBar: TCheckBox
    Tag = 1
    Left = 12
    Top = 25
    Width = 103
    Height = 17
    Caption = '&Show status bar '
    TabOrder = 15
    OnClick = chkShowToolBarClick
  end
  object ColorDialog1: TColorDialog
    Left = 287
    Top = 64
  end
end
