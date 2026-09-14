object PBMaintJobBagProcessFrm: TPBMaintJobBagProcessFrm
  Left = 264
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Maintain Production Process Details'
  ClientHeight = 348
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 17
  object pnlFoot: TPanel
    Left = 0
    Top = 297
    Width = 443
    Height = 51
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = 283
    ExplicitWidth = 500
    object DelLabel: TLabel
      Left = 163
      Top = 25
      Width = 158
      Height = 15
      Caption = 'Really Delete This Process?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object OKBitBtn: TBitBtn
      Left = 331
      Top = 15
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      Enabled = False
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F7F00007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F7F0000007F00007F007F0000007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F0000007F00007F00007F0000
        7F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F000000
        7F00007F00007F00007F00007F00007F007F0000007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F
        7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F7F0000007F00007F00007F0000FF00007F00007F00007F00007F00
        7F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFF
        FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F00007F00007F0000FF00007F7F
        00FF00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F7F7F7FFFFFFF007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00
        007F0000FF00007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F00
        7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F00FF
        00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F
        7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF0000
        7F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F
        7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00
        007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFF
        FFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F00FF00007F00007F007F0000007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F
        7F7FFFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00007F
        00007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = OKBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 419
      Top = 15
      Width = 75
      Height = 25
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object pnlProcess: TPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 57
    Align = alTop
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 500
    object Process: TLabel
      Left = 24
      Top = 19
      Width = 112
      Height = 17
      Caption = 'Production Process'
    end
    object edtProcess: TEdit
      Left = 142
      Top = 15
      Width = 217
      Height = 25
      ReadOnly = True
      TabOrder = 0
    end
    object BitBtn4: TBitBtn
      Left = 374
      Top = 15
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn4Click
    end
  end
  object pnlProductSize: TPanel
    Left = 0
    Top = 57
    Width = 443
    Height = 88
    Align = alTop
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 500
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 72
      Height = 17
      Caption = 'Product Size'
    end
    object Label8: TLabel
      Left = 24
      Top = 52
      Width = 113
      Height = 17
      Caption = 'Work Centre Group'
    end
    object edtProductSize: TEdit
      Left = 142
      Top = 12
      Width = 177
      Height = 25
      ReadOnly = True
      TabOrder = 0
    end
    object dblkpWorkCentreGroup: TDBLookupComboBox
      Left = 142
      Top = 48
      Width = 177
      Height = 25
      KeyField = 'Work_Centre_Group'
      ListField = 'Work_Centre_Group_Name'
      ListSource = dtsWCGroups
      TabOrder = 1
      OnClick = CheckOK
    end
    object BitBtn1: TBitBtn
      Left = 334
      Top = 10
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 334
      Top = 46
      Width = 25
      Height = 25
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BitBtn2Click
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 145
    Width = 443
    Height = 152
    Align = alClient
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 500
    ExplicitHeight = 138
    object Label4: TLabel
      Left = 24
      Top = 20
      Width = 90
      Height = 17
      Caption = 'Simplex/Duplex'
    end
    object Label5: TLabel
      Left = 24
      Top = 53
      Width = 93
      Height = 17
      Caption = 'No. of elements'
    end
    object Label6: TLabel
      Left = 24
      Top = 86
      Width = 48
      Height = 17
      Caption = 'Quantity'
    end
    object Label7: TLabel
      Left = 24
      Top = 120
      Width = 74
      Height = 17
      Caption = 'No. of hours'
    end
    object cmbSimplexDuplex: TComboBox
      Left = 142
      Top = 16
      Width = 145
      Height = 25
      Style = csDropDownList
      TabOrder = 0
      OnClick = CheckOK
      Items.Strings = (
        'N/A'
        'Simplex'
        'Duplex')
    end
    object spnElements: TSpinEdit
      Left = 142
      Top = 49
      Width = 57
      Height = 27
      MaxValue = 100
      MinValue = 1
      TabOrder = 1
      Value = 1
      OnClick = CheckOK
    end
    object memQuantity: TMemo
      Left = 142
      Top = 82
      Width = 97
      Height = 21
      TabOrder = 2
      WantReturns = False
      WordWrap = False
      OnClick = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateQty
      OnKeyPress = memQuantityKeyPress
    end
    object memHours: TMemo
      Left = 142
      Top = 116
      Width = 97
      Height = 21
      TabOrder = 3
      WantReturns = False
      WordWrap = False
      OnClick = CheckOK
      OnEnter = SaveValue
      OnExit = ValidateMoney
      OnKeyPress = memHoursKeyPress
    end
  end
  object qryWCGroups: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Distinct Process.Process,'
      '      Work_Centre_Group.Work_Centre_Group,'
      '      Work_Centre_Group.Work_Centre_Group_Name'
      'from Process,'
      '      Process_Work_Centre_Group,'
      '      Work_Centre_Group,'
      '      Work_Centre,'
      '      Work_Centre_WC_Group,'
      '      Work_Centre_Paper_Size'
      'where Process.Process = :Process and'
      '      Work_Centre_Paper_Size.Paper_Size = :Paper_Size and'
      '      Process.Process = Process_Work_Centre_Group.Process and'
      
        '      Process_Work_Centre_Group.Work_Centre_Group = Work_Centre_' +
        'WC_Group.Work_Centre_Group and'
      
        '      Work_Centre_WC_Group.Work_Centre_Group = Work_Centre_Group' +
        '.Work_Centre_Group and'
      
        '      Work_Centre_WC_Group.Work_Centre = Work_Centre_Paper_Size.' +
        'Work_Centre'
      'ORDER BY Work_Centre_Group.Work_Centre_Group_Name'
      ''
      '')
    Left = 360
    Top = 193
    ParamData = <
      item
        Name = 'Process'
      end
      item
        Name = 'Paper_Size'
      end>
  end
  object dtsWCGroups: TDataSource
    DataSet = qryWCGroups
    Left = 408
    Top = 193
  end
end
