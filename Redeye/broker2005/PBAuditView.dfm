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
    Left = 606
    Top = 440
    Width = 71
    Height = 13
    Alignment = taRightJustify
    Anchors = [akRight, akBottom]
    Caption = 'Please Wait....'
  end
  object SequenceLabel: TLabel
    Left = 606
    Top = 456
    Width = 71
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
    ParentBackground = False
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
      ParentBackground = False
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
    ParentBackground = False
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
    ParentBackground = False
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
  object btnExcel: TBitBtn
    Left = 600
    Top = 513
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Excel'
    Enabled = False
    TabOrder = 6
    OnClick = btnExcelClick
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A6000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00A407070700FF
      FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFFA407070700FF
      FFFFFFFFFFFF07FFFFFF00000000000707070707070707070707A407070700FF
      FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA407000700FF
      FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA400000700FF
      FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFF000000000000
      00000000000000000000A4070707000707070707070700070707A40707070007
      07000700070700070707A4070707000707000000070700070707A40707070007
      07000700070700070707A4A4A4A400A4A4A400A4A4A400A4A4A4}
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
