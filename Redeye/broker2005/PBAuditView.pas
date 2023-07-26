unit PBAuditView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, StdCtrls, ExtCtrls, DBCtrls, ComCtrls,
  Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBAuditViewFrm = class(TForm)
    GetDetsSQL: TFDQuery;
    DetsDS: TDataSource;
    DetsDBGrid: TDBGrid;
    GetDetsSQLAudit_Text: TStringField;
    GetDetsSQLAudit_Trail: TIntegerField;
    GetDetsSQLOperator: TIntegerField;
    GetDetsSQLDate_Time_Entered: TDateTimeField;
    GetDetsSQLAudit_Type: TIntegerField;
    GetDetsSQLAudit_Code_1: TIntegerField;
    GetDetsSQLAudit_Code_2: TIntegerField;
    GetDetsSQLAudit_Code_3: TIntegerField;
    GetDetsSQLAudit_Code_4: TIntegerField;
    GetDetsSQLName: TStringField;
    GetDetsSQLAudit_Type_Descr: TStringField;
    GroupBox1: TGroupBox;
    ProgMoveCheckBox: TCheckBox;
    FieldChangeCheckBox: TCheckBox;
    UpdatesCheckBox: TCheckBox;
    ErrorsCheckBox: TCheckBox;
    GroupBox2: TGroupBox;
    UsersRadioGroup: TRadioGroup;
    GetOperatorsSQL: TFDQuery;
    OperatorsDS: TDataSource;
    UserDBLookupComboBox: TDBLookupComboBox;
    GetDetsSqlSQL: TFDQuery;
    StringField4: TStringField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    DateTimeField2: TDateTimeField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    StringField5: TStringField;
    StringField6: TStringField;
    CountLabel: TLabel;
    GroupBox3: TGroupBox;
    DateFromDateTimePicker: TDateTimePicker;
    DateFromCheckBox: TCheckBox;
    GroupBox4: TGroupBox;
    DateToDateTimePicker: TDateTimePicker;
    DateToCheckBox: TCheckBox;
    CloseBitBtn: TBitBtn;
    SequenceLabel: TLabel;
    GetDetsSqlSQLAudit_Table_Name: TStringField;
    GetDetsSQLAudit_Table_Name: TStringField;
    GetDetsSQLAudit_Code_1_Field: TStringField;
    GetDetsSqlSQLAudit_Code_1_Field: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure GetDetsSQLAudit_TextGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure GetDets(Sender: TObject);
    procedure DetsDBGridTitleClick(Column: TColumn);
    procedure UsersRadioGroupClick(Sender: TObject);
    procedure UserDBLookupComboBoxClick(Sender: TObject);
    procedure IncludeCheckBoxClick(Sender: TObject);
    procedure DateFromCheckBoxClick(Sender: TObject);
    procedure DateFromDateTimePickerChange(Sender: TObject);
    procedure DateToDateTimePickerChange(Sender: TObject);
    procedure DateToCheckBoxClick(Sender: TObject);
    procedure GetDetsSQLAudit_Type_DescrGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    { Private declarations }
    sSequence, sSeqName: String;
  public
    { Public declarations }
  end;

var
  PBAuditViewFrm: TPBAuditViewFrm;

implementation

uses PBAuditDM, pbMainMenu, pbDatabase;

{$R *.DFM}

procedure TPBAuditViewFrm.FormActivate(Sender: TObject);
begin
  GetOperatorsSQL.Close ;
  GetOperatorsSQL.Open ;
  {Set the selected operator to be CURRENT operator} ;
  UserDBLookupComboBox.KeyValue := frmPBMainMenu.iOperator ;
  sSequence := 'Date_Time_Entered' ;
  sSeqname := 'Date + Time' ;
  DateFromDateTimePicker.Date := Date - 7 ;
  DateToDateTimePicker.Date := Date  ;
  GetDets(Self) ;
  dmBroker.ScreenAccessControl(Self,'mnuSystem',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBAuditViewFrm.GetDetsSQLAudit_TextGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
Text := PBAuditDataMod.GetAuditDescr(Sender.DataSet) ;
end;

procedure TPBAuditViewFrm.GetDets(Sender: TObject);
begin
GetDetsSQL.Close ;
GetDetsSQL.SQL := GetDetsSqlSQL.SQL ;
If UsersRadioGroup.ItemIndex > 0 then
        GetDetsSQL.SQL.Add('and (Audit_Trail.Operator = ' + IntToStr(UserDBLookupComboBox.KeyValue) + ')') ;
If not ProgMoveCheckBox.Checked then
       GetDetsSQL.SQL.Add('and (Audit_Trail.Audit_Type > 999)') ;
If not UpdatesCheckBox.Checked then
       GetDetsSQL.SQL.Add('and ((Audit_Trail.Audit_Type < 1000) or (Audit_Trail.Audit_Type > 9999))') ;
If not FieldChangeCheckBox.Checked then
       GetDetsSQL.SQL.Add('and ((Audit_Trail.Audit_Type < 10000) or (Audit_Trail.Audit_Type > 89999))') ;
If not ErrorsCheckBox.Checked then
       GetDetsSQL.SQL.Add('and (Audit_Trail.Audit_Type <> 99999)') ;
If not DateFromCheckBox.Checked then
       GetDetsSQL.ParamByName('Date_From').AsDateTime := DateFromDateTimePicker.Date
else
       GetDetsSQL.ParamByName('Date_From').AsDateTime := 0 ; 
If not DateToCheckBox.Checked then
       GetDetsSQL.ParamByName('Date_To').AsDateTime := DateToDateTimePicker.Date + 1
else
       GetDetsSQL.ParamByName('Date_To').AsDateTime := StrToDate('31/12/2099') ;
GetDetsSQL.SQL.Add('Order By') ;
If sSequence <> 'Date_Time_Entered' then
        GetDetsSQL.SQL.Add(sSequence + ' , ') ;
GetDetsSQL.SQL.Add('Date_Time_Entered desc') ;
GetDetsSQL.Open ;
CountLabel.Caption := IntToStr(GetDetsSQL.RecordCount) + ' items' ;
SequenceLabel.Caption := 'Sequenced by ' + sSeqName ;
end;

procedure TPBAuditViewFrm.DetsDBGridTitleClick(Column: TColumn);
begin
{New sequence selected} ;
sSequence := Column.FieldName ;
sSeqName := Column.Title.Caption ;
GetDets(Self) ;
end;

procedure TPBAuditViewFrm.UsersRadioGroupClick(Sender: TObject);
begin
Case (Sender as TRadioGroup).ItemIndex of
        0:      begin
                {ALL operators} ;
                UserDBLookupComboBox.Enabled := False ;
                end;
        1:      begin
                {CURRENT operator} ;
                UserDBLookupComboBox.Enabled := False ;
                UserDBLookupComboBox.KeyValue := frmPBMainMenu.iOperator ;
                end;
        2:      begin
                UserDBLookupComboBox.Enabled := True ;
                end;
        end;
GetDets(Self) ;
end;

procedure TPBAuditViewFrm.UserDBLookupComboBoxClick(Sender: TObject);
begin
GetDets(Self) ;
end;

procedure TPBAuditViewFrm.IncludeCheckBoxClick(Sender: TObject);
begin
GetDets(Self) ;
end;

procedure TPBAuditViewFrm.DateFromCheckBoxClick(Sender: TObject);
begin
DateFromDateTimePicker.Enabled := not (Sender as TCheckBox).Checked ;
GetDets(self) ;
end;

procedure TPBAuditViewFrm.DateFromDateTimePickerChange(Sender: TObject);
begin
GetDets(Self) ;
end;

procedure TPBAuditViewFrm.DateToDateTimePickerChange(Sender: TObject);
begin
GetDets(Self) ;
end;

procedure TPBAuditViewFrm.DateToCheckBoxClick(Sender: TObject);
begin
DateToDateTimePicker.Enabled := not (Sender as TCheckBox).Checked ;
GetDets(self) ;
end;

procedure TPBAuditViewFrm.GetDetsSQLAudit_Type_DescrGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
Text := PBAuditDataMod.GetAuditOperation(Sender.DataSet) + (Sender As TStringField).AsString ;
end;

end.
