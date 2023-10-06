object PBLaserImportFrm: TPBLaserImportFrm
  Left = 372
  Top = 125
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Import Laser Production Data'
  ClientHeight = 499
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object mmErrorRecords: TMemo
    Left = 0
    Top = 358
    Width = 624
    Height = 100
    Align = alTop
    Enabled = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object pnlImportFile: TPanel
    Left = 0
    Top = 185
    Width = 624
    Height = 56
    Align = alTop
    Enabled = False
    TabOrder = 1
    object lblStep2: TLabel
      Left = 8
      Top = 8
      Width = 149
      Height = 13
      Caption = '2. Select the file to be imported.'
    end
    object edtImportFileName: TEdit
      Left = 8
      Top = 24
      Width = 289
      Height = 21
      TabOrder = 0
    end
    object btnFindFile: TButton
      Left = 304
      Top = 22
      Width = 59
      Height = 25
      Caption = 'Find File'
      TabOrder = 1
      OnClick = btnFindFileClick
    end
  end
  object pnlProgress: TPanel
    Left = 0
    Top = 282
    Width = 624
    Height = 76
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 47
      Height = 13
      Caption = 'Progress: '
    end
    object lblProgress: TLabel
      Left = 257
      Top = 8
      Width = 5
      Height = 13
      Caption = 'x'
      Visible = False
    end
    object lblRecordCount: TLabel
      Left = 299
      Top = 8
      Width = 62
      Height = 13
      Caption = 'records read.'
      Visible = False
    end
    object lblReadingFile: TLabel
      Left = 64
      Top = 8
      Width = 142
      Height = 13
      Caption = 'Reading Laser Production file.'
    end
    object prgrsbrImport: TProgressBar
      Left = 8
      Top = 24
      Width = 353
      Height = 17
      TabOrder = 0
    end
  end
  object pnlImport: TPanel
    Left = 0
    Top = 241
    Width = 624
    Height = 41
    Align = alTop
    Enabled = False
    TabOrder = 3
    object lblStep4: TLabel
      Left = 8
      Top = 8
      Width = 82
      Height = 13
      Caption = '3. Run the Import'
    end
    object ImportBtn: TButton
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Import'
      Enabled = False
      TabOrder = 0
      OnClick = ImportBtnClick
    end
  end
  object pnlCancel: TPanel
    Left = 0
    Top = 458
    Width = 624
    Height = 41
    Align = alTop
    TabOrder = 4
    object Cancel2BitBtn: TBitBtn
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Close'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object pnlDepartment: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 185
    Align = alTop
    TabOrder = 5
    object lblStep1: TLabel
      Left = 8
      Top = 8
      Width = 152
      Height = 13
      Caption = '1. Select the department details.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 35
      Width = 58
      Height = 13
      Caption = 'Department:'
    end
    object Label4: TLabel
      Left = 16
      Top = 68
      Width = 41
      Height = 13
      Caption = 'Process:'
    end
    object Label5: TLabel
      Left = 16
      Top = 100
      Width = 49
      Height = 13
      Caption = 'Operation:'
    end
    object Label2: TLabel
      Left = 16
      Top = 132
      Width = 78
      Height = 13
      Caption = 'Default Operator'
    end
    object Label6: TLabel
      Left = 16
      Top = 162
      Width = 68
      Height = 13
      Caption = 'Labour time is:'
    end
    object Label7: TLabel
      Left = 168
      Top = 160
      Width = 86
      Height = 13
      Caption = '% of Machine time'
    end
    object dblkpDepartment: TDBLookupComboBox
      Left = 112
      Top = 32
      Width = 137
      Height = 21
      KeyField = 'Process_Group'
      ListField = 'Process_Group_Description'
      ListSource = dtmdlJobBagLog.dtsProcessGroup
      TabOrder = 0
      OnClick = dblkpDepartmentClick
    end
    object dblkpProcess: TDBLookupComboBox
      Left = 112
      Top = 64
      Width = 169
      Height = 21
      KeyField = 'Process'
      ListField = 'Process_Description'
      ListSource = dtmdlJobBagLog.dtsProcess
      TabOrder = 1
      OnClick = dblkpProcessClick
    end
    object dblkpOperation: TDBLookupComboBox
      Left = 112
      Top = 96
      Width = 169
      Height = 21
      KeyField = 'Operation'
      ListField = 'Operation_Description'
      ListSource = dtmdlJobBagLog.dtsProcessOps
      TabOrder = 2
      OnClick = dblkpOperationClick
    end
    object dblkpOperator: TDBLookupComboBox
      Left = 112
      Top = 128
      Width = 169
      Height = 21
      KeyField = 'Work_Centre_Operator'
      ListField = 'Name'
      ListSource = dtmdlJobBagLog.dtsWCOperators
      TabOrder = 3
      OnClick = dblkpOperationClick
    end
    object spnPerc: TSpinEdit
      Left = 112
      Top = 157
      Width = 49
      Height = 22
      Increment = 5
      MaxValue = 100
      MinValue = 0
      TabOrder = 4
      Value = 0
    end
  end
  object opndlgImportFile: TOpenDialog
    DefaultExt = 'txt'
    Filter = 
      'Text files (*.txt)|*.TXT|Terms files (*.TMF)|*.TMF|Contract file' +
      's (*.css)|*.CSS'
    InitialDir = 'C:\My Documents'
    Left = 448
    Top = 128
  end
end
