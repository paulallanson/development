object PBMaintWCOperatorFrm: TPBMaintWCOperatorFrm
  Left = 401
  Top = 180
  BorderStyle = bsDialog
  Caption = 'Maintain Work Centre Operator'
  ClientHeight = 270
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object DelLabel: TLabel
    Left = 30
    Top = 253
    Width = 145
    Height = 15
    Caption = 'Delete the above details ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 188
    Top = 248
    Width = 75
    Height = 25
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TBitBtn
    Left = 270
    Top = 248
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object detsgrpbox: TGroupBox
    Left = 8
    Top = 8
    Width = 337
    Height = 231
    ParentBackground = False
    TabOrder = 2
    object Label1: TLabel
      Left = 10
      Top = 20
      Width = 29
      Height = 13
      Caption = 'Name'
    end
    object Label2: TLabel
      Left = 8
      Top = 53
      Width = 70
      Height = 13
      Caption = 'Employee No:'
    end
    object Label3: TLabel
      Left = 8
      Top = 83
      Width = 61
      Height = 13
      Caption = 'Department'
    end
    object Label4: TLabel
      Left = 8
      Top = 115
      Width = 38
      Height = 13
      Caption = 'Process'
    end
    object Label5: TLabel
      Left = 8
      Top = 144
      Width = 60
      Height = 13
      Caption = 'Hourly Rate'
    end
    object Label6: TLabel
      Left = 8
      Top = 176
      Width = 87
      Height = 13
      Caption = 'No. of Operators'
    end
    object btnOperators: TBitBtn
      Left = 296
      Top = 14
      Width = 25
      Height = 25
      Hint = 'Maintain Operators'
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnOperatorsClick
    end
    object edtEmployeeNo: TEdit
      Left = 96
      Top = 48
      Width = 145
      Height = 21
      TabOrder = 2
      Text = 'edtEmployeeNo'
    end
    object dblkpProcessGroup: TDBLookupComboBox
      Left = 96
      Top = 80
      Width = 145
      Height = 21
      KeyField = 'Process_Group'
      ListField = 'Process_Group_Description'
      ListSource = dtsProcessGroup
      TabOrder = 3
      OnClick = dblkpProcessGroupClick
    end
    object chkbxActive: TCheckBox
      Left = 9
      Top = 208
      Width = 185
      Height = 17
      Caption = 'Operator is active'
      TabOrder = 5
    end
    object dblkpProcess: TDBLookupComboBox
      Left = 96
      Top = 111
      Width = 193
      Height = 21
      KeyField = 'Process'
      ListField = 'Process_Description'
      ListSource = dtsProcess
      TabOrder = 4
    end
    object btnProcessClear: TBitBtn
      Left = 296
      Top = 110
      Width = 25
      Height = 23
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
      TabOrder = 6
      TabStop = False
      OnClick = btnProcessClearClick
    end
    object edtEmployeeName: TEdit
      Left = 96
      Top = 16
      Width = 193
      Height = 21
      TabOrder = 0
      Text = 'edtEmployeeName'
    end
    object memHourlyRate: TMemo
      Left = 96
      Top = 140
      Width = 91
      Height = 21
      TabOrder = 7
      WantReturns = False
      WordWrap = False
      OnEnter = SaveValue
      OnKeyPress = CheckKeyIsFloat
    end
    object spnNoOperators: TSpinEdit
      Left = 96
      Top = 168
      Width = 49
      Height = 22
      MaxValue = 99
      MinValue = 1
      TabOrder = 8
      Value = 1
    end
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Work_Centre_Operator'
      '        (Work_Centre_Operator,'
      '        Name)'
      
        'Select Max(Work_Centre_Operator)+1, :GUID From Work_Centre_Opera' +
        'tor')
    Left = 152
    Top = 112
    ParamData = <
      item
        Name = 'GUID'
      end>
  end
  object qryProcessGroup: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from process_group'
      'order by Process_Group_Description')
    Left = 32
    Top = 8
  end
  object dtsProcessGroup: TDataSource
    DataSet = qryProcessGroup
    Left = 32
    Top = 48
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Work_Centre_Operator'
      'Set'
      '        Name = :Name,'
      '        Employee_Number = :Employee_Number,'
      '        Process_Group = :Process_Group,'
      '        Process = :Process,'
      '        Operator = :Operator,'
      '        Inactive = :inactive,'
      '        Hourly_Rate = :Hourly_Rate,'
      '        Operator_Count = :Operator_Count'
      'Where'
      '(Work_Centre_Operator = :Work_Centre_Operator)')
    Left = 152
    Top = 56
    ParamData = <
      item
        Name = 'Name'
      end
      item
        Name = 'Employee_Number'
      end
      item
        Name = 'Process_Group'
        DataType = ftInteger
      end
      item
        Name = 'Process'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'Hourly_Rate'
      end
      item
        Name = 'Operator_Count'
      end
      item
        Name = 'Work_Centre_Operator'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Rep(Rep, Name)'
      'SELECT Max(Rep)+1, :GUID FROM Rep'
      ''
      ''
      ' ')
    Left = 192
    Top = 8
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Work_Centre_Operator'
      'Where'
      '(Work_Centre_Operator = :Work_Centre_Operator)')
    Left = 256
    Top = 8
    ParamData = <
      item
        Name = 'Work_Centre_Operator'
      end>
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Work_Centre_Operator'
      'From Work_Centre_Operator'
      'Where Name = :GUID')
    Left = 264
    Top = 112
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryProcess: TFDQuery
    MasterSource = dtsProcessGroup
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Process'
      'where Process_Group = :Process_Group'
      'Order by Process_Description')
    Left = 240
    Top = 168
    ParamData = <
      item
        Name = 'Process_Group'
      end>
  end
  object dtsProcess: TDataSource
    DataSet = qryProcess
    Left = 288
    Top = 168
  end
  object qryGetOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Operator'
      'where Operator.Name = :Name')
    Left = 256
    Top = 64
    ParamData = <
      item
        Name = 'Name'
      end>
  end
end
