object PBLaserImportFrm: TPBLaserImportFrm
  Left = 372
  Top = 125
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Import Laser Production Data'
  ClientHeight = 523
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 17
  object mmErrorRecords: TMemo
    Left = 0
    Top = 382
    Width = 622
    Height = 100
    Align = alTop
    Enabled = False
    ScrollBars = ssBoth
    TabOrder = 0
    ExplicitTop = 358
  end
  object pnlImportFile: TPanel
    Left = 0
    Top = 201
    Width = 622
    Height = 64
    Align = alTop
    Enabled = False
    ParentBackground = False
    TabOrder = 1
    object lblStep2: TLabel
      Left = 8
      Top = 5
      Width = 187
      Height = 17
      Caption = '2. Select the file to be imported.'
    end
    object edtImportFileName: TEdit
      Left = 8
      Top = 26
      Width = 289
      Height = 25
      TabOrder = 0
    end
    object btnFindFile: TButton
      Left = 304
      Top = 26
      Width = 59
      Height = 25
      Caption = 'Find File'
      TabOrder = 1
      OnClick = btnFindFileClick
    end
  end
  object pnlProgress: TPanel
    Left = 0
    Top = 306
    Width = 622
    Height = 76
    Align = alTop
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 282
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 59
      Height = 17
      Caption = 'Progress: '
    end
    object lblProgress: TLabel
      Left = 257
      Top = 8
      Width = 6
      Height = 17
      Caption = 'x'
      Visible = False
    end
    object lblRecordCount: TLabel
      Left = 299
      Top = 8
      Width = 79
      Height = 17
      Caption = 'records read.'
      Visible = False
    end
    object lblReadingFile: TLabel
      Left = 64
      Top = 8
      Width = 174
      Height = 17
      Caption = 'Reading Laser Production file.'
    end
    object prgrsbrImport: TProgressBar
      Left = 8
      Top = 34
      Width = 353
      Height = 22
      TabOrder = 0
    end
  end
  object pnlImport: TPanel
    Left = 0
    Top = 265
    Width = 622
    Height = 41
    Align = alTop
    Enabled = False
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 241
    object lblStep4: TLabel
      Left = 8
      Top = 8
      Width = 101
      Height = 17
      Caption = '3. Run the Import'
    end
    object ImportBtn: TButton
      Left = 304
      Top = 6
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
    Top = 482
    Width = 622
    Height = 41
    Align = alTop
    ParentBackground = False
    TabOrder = 4
    ExplicitTop = 458
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
    Width = 622
    Height = 201
    Align = alTop
    ParentBackground = False
    TabOrder = 5
    object lblStep1: TLabel
      Left = 8
      Top = 8
      Width = 187
      Height = 17
      Caption = '1. Select the department details.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 35
      Width = 72
      Height = 17
      Caption = 'Department:'
    end
    object Label4: TLabel
      Left = 16
      Top = 68
      Width = 48
      Height = 17
      Caption = 'Process:'
    end
    object Label5: TLabel
      Left = 16
      Top = 100
      Width = 62
      Height = 17
      Caption = 'Operation:'
    end
    object Label2: TLabel
      Left = 16
      Top = 132
      Width = 102
      Height = 17
      Caption = 'Default Operator:'
    end
    object Label6: TLabel
      Left = 16
      Top = 162
      Width = 86
      Height = 17
      Caption = 'Labour time is:'
    end
    object Label7: TLabel
      Left = 179
      Top = 160
      Width = 109
      Height = 17
      Caption = '% of Machine time'
    end
    object dblkpDepartment: TDBLookupComboBox
      Left = 123
      Top = 32
      Width = 137
      Height = 25
      KeyField = 'Process_Group'
      ListField = 'Process_Group_Description'
      ListSource = dtmdlJobBagLog.dtsProcessGroup
      TabOrder = 0
      OnClick = dblkpDepartmentClick
    end
    object dblkpProcess: TDBLookupComboBox
      Left = 123
      Top = 64
      Width = 169
      Height = 25
      KeyField = 'Process'
      ListField = 'Process_Description'
      ListSource = dtmdlJobBagLog.dtsProcess
      TabOrder = 1
      OnClick = dblkpProcessClick
    end
    object dblkpOperation: TDBLookupComboBox
      Left = 123
      Top = 96
      Width = 169
      Height = 25
      KeyField = 'Operation'
      ListField = 'Operation_Description'
      ListSource = dtmdlJobBagLog.dtsProcessOps
      TabOrder = 2
      OnClick = dblkpOperationClick
    end
    object dblkpOperator: TDBLookupComboBox
      Left = 123
      Top = 128
      Width = 169
      Height = 25
      KeyField = 'Work_Centre_Operator'
      ListField = 'Name'
      ListSource = dtmdlJobBagLog.dtsWCOperators
      TabOrder = 3
      OnClick = dblkpOperationClick
    end
    object spnPerc: TSpinEdit
      Left = 123
      Top = 157
      Width = 49
      Height = 27
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
    Left = 392
    Top = 40
  end
end
