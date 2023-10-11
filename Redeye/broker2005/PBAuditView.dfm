object PBAuditViewFrm: TPBAuditViewFrm
  Left = 19
  Top = 20
  Caption = 'View Audit Trail - Test'
  ClientHeight = 522
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  DesignSize = (
    687
    522)
  TextHeight = 13
  object CountLabel: TLabel
    Left = 608
    Top = 440
    Width = 69
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'Please Wait....'
  end
  object SequenceLabel: TLabel
    Left = 608
    Top = 456
    Width = 69
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'Please Wait....'
  end
  object DetsDBGrid: TDBGrid
    Left = 8
    Top = 0
    Width = 673
    Height = 433
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DetsDS
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnTitleClick = DetsDBGridTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Date_Time_Entered'
        Title.Caption = 'Date + Time'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = 'Operator'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Audit_Type_Descr'
        Title.Caption = 'Operation'
        Width = 201
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Audit_Text'
        Title.Caption = 'Details'
        Width = 311
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 440
    Width = 129
    Height = 89
    Anchors = [akLeft, akBottom]
    Caption = 'Include'
    TabOrder = 1
    object ProgMoveCheckBox: TCheckBox
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Program Movement'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = IncludeCheckBoxClick
    end
    object FieldChangeCheckBox: TCheckBox
      Left = 8
      Top = 64
      Width = 113
      Height = 17
      Caption = 'Field Changes'
      TabOrder = 1
      OnClick = IncludeCheckBoxClick
    end
    object UpdatesCheckBox: TCheckBox
      Left = 8
      Top = 32
      Width = 97
      Height = 17
      Caption = 'Updates'
      TabOrder = 2
      OnClick = IncludeCheckBoxClick
    end
    object ErrorsCheckBox: TCheckBox
      Left = 8
      Top = 48
      Width = 113
      Height = 17
      Caption = 'Errors'
      TabOrder = 3
      OnClick = IncludeCheckBoxClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 144
    Top = 440
    Width = 225
    Height = 89
    Anchors = [akLeft, akBottom]
    Caption = 'Users'
    TabOrder = 2
    object UsersRadioGroup: TRadioGroup
      Left = 8
      Top = 16
      Width = 209
      Height = 33
      Columns = 3
      ItemIndex = 1
      Items.Strings = (
        'All'
        'Current'
        'Selected')
      TabOrder = 0
      OnClick = UsersRadioGroupClick
    end
    object UserDBLookupComboBox: TDBLookupComboBox
      Left = 8
      Top = 56
      Width = 209
      Height = 21
      Enabled = False
      KeyField = 'Operator'
      ListField = 'Name'
      ListSource = OperatorsDS
      TabOrder = 1
      OnClick = UserDBLookupComboBoxClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 376
    Top = 440
    Width = 153
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = 'Date From'
    TabOrder = 3
    object DateFromDateTimePicker: TDateTimePicker
      Left = 8
      Top = 16
      Width = 89
      Height = 21
      Date = 37456.000000000000000000
      Time = 0.480307974503375600
      TabOrder = 0
      OnChange = DateFromDateTimePickerChange
    end
    object DateFromCheckBox: TCheckBox
      Left = 104
      Top = 17
      Width = 41
      Height = 17
      Caption = 'Any'
      TabOrder = 1
      OnClick = DateFromCheckBoxClick
    end
  end
  object GroupBox4: TGroupBox
    Left = 376
    Top = 488
    Width = 153
    Height = 41
    Anchors = [akLeft, akBottom]
    Caption = 'Date To'
    TabOrder = 4
    object DateToDateTimePicker: TDateTimePicker
      Left = 8
      Top = 16
      Width = 89
      Height = 21
      Date = 37456.000000000000000000
      Time = 0.480307974503375600
      TabOrder = 0
      OnChange = DateToDateTimePickerChange
    end
    object DateToCheckBox: TCheckBox
      Left = 104
      Top = 17
      Width = 41
      Height = 17
      Caption = 'Any'
      TabOrder = 1
      OnClick = DateToCheckBoxClick
    end
  end
  object CloseBitBtn: TBitBtn
    Left = 608
    Top = 480
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 5
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      '')
    Left = 64
    Top = 144
    object GetDetsSQLAudit_Text: TStringField
      FieldName = 'Audit_Text'
      OnGetText = GetDetsSQLAudit_TextGetText
      FixedChar = True
      Size = 50
    end
    object GetDetsSQLAudit_Trail: TIntegerField
      FieldName = 'Audit_Trail'
    end
    object GetDetsSQLOperator: TIntegerField
      FieldName = 'Operator'
    end
    object GetDetsSQLDate_Time_Entered: TDateTimeField
      FieldName = 'Date_Time_Entered'
    end
    object GetDetsSQLAudit_Type: TIntegerField
      FieldName = 'Audit_Type'
    end
    object GetDetsSQLAudit_Code_1: TIntegerField
      FieldName = 'Audit_Code_1'
    end
    object GetDetsSQLAudit_Code_2: TIntegerField
      FieldName = 'Audit_Code_2'
    end
    object GetDetsSQLAudit_Code_3: TIntegerField
      FieldName = 'Audit_Code_3'
    end
    object GetDetsSQLAudit_Code_4: TIntegerField
      FieldName = 'Audit_Code_4'
    end
    object GetDetsSQLName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object GetDetsSQLAudit_Type_Descr: TStringField
      FieldName = 'Audit_Type_Descr'
      OnGetText = GetDetsSQLAudit_Type_DescrGetText
      FixedChar = True
      Size = 15
    end
    object GetDetsSQLAudit_Table_Name: TStringField
      FieldName = 'Audit_Table_Name'
    end
    object GetDetsSQLAudit_Code_1_Field: TStringField
      FieldName = 'Audit_Code_1_Field'
    end
  end
  object DetsDS: TDataSource
    DataSet = GetDetsSQL
    Left = 120
    Top = 80
  end
  object GetOperatorsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Operator, Name'
      'From Operator'
      'Order By Name')
    Left = 48
    Top = 88
  end
  object OperatorsDS: TDataSource
    DataSet = GetOperatorsSQL
    Left = 240
    Top = 104
  end
  object GetDetsSqlSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Audit_Trail.*, Operator.Name, Audit_Type.Audit_Type_Descr' +
        ', Audit_Type.Audit_Table_Name ,'
      '       Audit_Type.Audit_Code_1_Field'
      'From Audit_Trail, Operator, Audit_Type'
      'where (Audit_Trail.Operator = Operator.Operator) and'
      '      (Audit_Type.Audit_Type = Audit_Trail.Audit_Type) and'
      '      (Date_Time_Entered >= :Date_From) and'
      '      (Date_Time_Entered < :Date_To) '
      ' '
      ' '
      ' '
      ' ')
    Left = 104
    Top = 144
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end>
    object StringField4: TStringField
      FieldName = 'Audit_Text'
      OnGetText = GetDetsSQLAudit_TextGetText
      FixedChar = True
      Size = 50
    end
    object IntegerField8: TIntegerField
      FieldName = 'Audit_Trail'
    end
    object IntegerField9: TIntegerField
      FieldName = 'Operator'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'Date_Time_Entered'
    end
    object IntegerField10: TIntegerField
      FieldName = 'Audit_Type'
    end
    object IntegerField11: TIntegerField
      FieldName = 'Audit_Code_1'
    end
    object IntegerField12: TIntegerField
      FieldName = 'Audit_Code_2'
    end
    object IntegerField13: TIntegerField
      FieldName = 'Audit_Code_3'
    end
    object IntegerField14: TIntegerField
      FieldName = 'Audit_Code_4'
    end
    object StringField5: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object StringField6: TStringField
      FieldName = 'Audit_Type_Descr'
      FixedChar = True
      Size = 15
    end
    object GetDetsSqlSQLAudit_Table_Name: TStringField
      FieldName = 'Audit_Table_Name'
    end
    object GetDetsSqlSQLAudit_Code_1_Field: TStringField
      FieldName = 'Audit_Code_1_Field'
    end
  end
end
