unit PBAuditDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBIERRS,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBAuditDataMod = class(TDataModule)
    AddAuditSQL: TFDQuery;
    Add1stAuditSQL: TFDQuery;
    GetAuditDescrSQL: TFDQuery;
    GetAuditTypeSQL: TFDQuery;
    GetAuditFlagsSQL: TFDQuery;
    GetFldChgTypSQL: TFDQuery;
    Access_Add1stAuditSQL: TFDQuery;
    Access_AddAuditSQL: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    bGotFlags, bAuditLogProg, bAuditLogUpd, bAuditLogFields, bAuditLogErrors: ByteBool;
  public
    { Public declarations }
    bDontWriteError: ByteBool;
    procedure WriteAudit(iTempType, iTempCode1, iTempCode2, iTempCode3, iTempCode4: Integer;
                                     sTempText: String);
    function GetAuditDescr(TempDS: TDataSet): String;
    procedure HandleException(Sender: TObject; E: Exception);
    function FieldChanges(sTempTable: String; DSFrom: TDataSet; SQLTo: TFDQuery): ByteBool;
    function GetAuditOperation(TempDS: TDataSet): String;
  end;

var
  PBAuditDataMod: TPBAuditDataMod;

implementation

uses UITypes, pbMainMenu;

{$R *.DFM}

procedure TPBAuditDataMod.WriteAudit(iTempType, iTempCode1, iTempCode2, iTempCode3, iTempCode4: Integer;
                                     sTempText: String);
Var
bWriteOK: ByteBool;
begin
{Write a record to the audit trail} ;
{Parameters are: Audit Type, Codes 1-4, Text} ;
If not bGotFlags then
        begin
        {1st audit write gets the audit trail flags} ;
        With GetAuditFlagsSQL do
                begin
                Close ;
                Open ;
                bAuditLogProg := FieldByName('Audit_Log_Prog').AsString = 'Y' ;
                bAuditLogUpd := FieldByName('Audit_Log_Upd').AsString = 'Y' ;
                bAuditLogFields := FieldByName('Audit_Log_Fields').AsString = 'Y' ;
                bAuditLogErrors := FieldByName('Audit_Log_Errors').AsString = 'Y' ;
                Close ;
                end;
        bGotFlags := True ;
        end;
{Use the flags to decide what to log} ;
If ((iTempType < 1000) and (not bAuditLogProg)) or
   ((iTempType >= 1000) and (iTempType <= 9999) and (not bAuditLogUpd)) or     
   ((iTempType >= 10000) and (iTempType <= 89999) and (not bAuditLogFields)) or     
   ((iTempType = 99999) and (not bAuditLogErrors)) then
        exit ;
bWriteOK := False ;
While not bWriteOK do
   begin
   Try
        With AddAuditSQL do
                begin
                Close ;
                ParamByName('Operator').AsInteger := frmpbMainMenu.iOperator ;
                ParamByName('Audit_Type').AsInteger := iTempType ;
                ParamByName('Audit_Code_1').AsInteger := iTempCode1 ;
                ParamByName('Audit_Code_2').AsInteger := iTempCode2 ;
                ParamByName('Audit_Code_3').AsInteger := iTempCode3 ;
                ParamByName('Audit_Code_4').AsInteger := iTempCode4 ;
                ParamByName('Audit_Text').AsString := sTempText + ' ' ;
                ExecSQL ;
                end;
        bWriteOK := True ;
        Except
        On E: Exception do
                begin
                If (Pos('NULL', E.Message) > 0) and (Pos('Audit_Trail', E.Message) > 0) then
                        begin
                        {There are no records on the audit Trail, so create an INITIALISE record} ;
                        With Add1stAuditSQL do
                                begin
                                Close ;
                                ParamByName('Operator').AsInteger := frmpbMainMenu.iOperator ;
                                ExecSQL ;
                                end;
                        end
                else
                        begin
                        {If it's a foreign key problem, the audit_type record is missing so don't log it} ;
                        If (Pos('FOREIGN KEY', E.Message) > 0) then
                                exit ;
                        {If it's not a PRIMARY KEY violation, raise an error} ;
                        If (Pos('PRIMARY KEY', E.Message) = 0) or (Pos('duplicate key', E.Message) = 0) then
                                Raise  ;
                        end;
                {Above line says if the error is caused by a duplicate audit trialn record, loop back and try the} ;
                {audit ADD again, anything else, raise the exception} ;
                end;
        end;
   end;
end;

function TPBAuditDataMod.GetAuditDescr(TempDS: TDataSet): String;
begin
{Get the audit trail description based on the input dataset} ;
With GetAuditTypeSQL do
        begin
        Close ;
        ParamByName('Audit_Type').AsInteger := TempDS.FieldByName('Audit_Type').AsInteger ;
        Open ;
        First ;
        end;
If TempDS.FieldByName('Audit_Text').AsString <> '' then
        begin
        Result := TempDS.FieldByName('Audit_Text').AsString ;
        end
else
        begin
        With GetAuditTypeSQL do
                begin
                Close ;
                ParamByName('Audit_Type').AsInteger := TempDS.FieldByName('Audit_Type').AsInteger ;
                Open ;
                First ;
                If FieldByName('Audit_Code_1_Field').AsString = '' then
                        begin
                        Result := '' ;
                        exit ;
                        end;
                end;
        end;
{Construct a SQL statment based on the audit type to access the actual record} ;
{With GetAuditDescrSQL do
        begin
        SQL.Clear ;
        SQL.Add('Select ' + GetAuditTypeSQL.FieldByName('Audit_Field_Name').AsString + ' as Audit_Details') ;
        SQL.Add('From ' + GetAuditTypeSQL.FieldByName('Audit_Table_Name').AsString) ;
        SQL.Add('Where ' + GetAuditTypeSQL.FieldByName('Audit_Code_1_Field').AsString + ' = ' +
                        IntToStr(TempDS.FieldByName('Audit_Code_1').AsInteger)) ;
        If GetAuditTypeSQL.FieldByName('Audit_Code_2_Field').AsString <> '' then
                        SQL.Add('and ' + GetAuditTypeSQL.FieldByName('Audit_Code_2_Field').AsString + ' = ' +
                          IntToStr(TempDS.FieldByName('Audit_Code_2').AsInteger)) ;
        If GetAuditTypeSQL.FieldByName('Audit_Code_3_Field').AsString <> '' then
                        SQL.Add('and ' + GetAuditTypeSQL.FieldByName('Audit_Code_3_Field').AsString + ' = ' +
                          IntToStr(TempDS.FieldByName('Audit_Code_3').AsInteger)) ;
        If GetAuditTypeSQL.FieldByName('Audit_Code_4_Field').AsString <> '' then
                        SQL.Add('and ' + GetAuditTypeSQL.FieldByName('Audit_Code_4_Field').AsString + ' = ' +
                          IntToStr(TempDS.FieldByName('Audit_Code_4').AsInteger)) ;
        Close ;
        Open ;
        First ;
        Result := FieldByName('Audit_Details').AsString ;
        end};
end;

procedure TPBAuditDataMod.DataModuleCreate(Sender: TObject);
begin
  {Switch ON error logging} ;
  bDontWriteError := False ;
  {Enable the application exception handler} ;
  Application.onException := HandleException;
  {Set the flag to say we haven't got the audit trail flags yet} ;
  bGotFlags := false ;
end;

procedure TPBAuditDataMod.HandleException(Sender: TObject; E: Exception);
var err : DBIResult;
TempStr: String;
iCount: Integer;
begin
{Generla handler for untrapped errors in the application};
If not bDontWriteError then
        begin
        {Set this flag to stop an error on the audit trail write trying to write an error} ;
        bDontWriteError := True ;
        TempStr := E.Message ;
        For iCount := 1 to Length(TempStr) do
                If Pos(TempStr[iCount], Chr(10)+Chr(13)) > 0 then
                        TempStr[iCount] := ' ' ;
        {Write the the error to the audit trail} ;
        PBAuditDataMod.WriteAudit(99999, err, 0, 0, 0, TempStr) ;
        bDontWriteError := False ;
        end;
{Tell the user about the error} ;
MessageDlg(E.Message ,mtError,[mbOK],0) ;
end;

function TPBAuditDataMod.FieldChanges(sTempTable: String; DSFrom: TDataSet; SQLTo: TFDQuery): ByteBool;
Var
  iCount, iTmpCde1, iTmpCde2, iTmpCde3, iTmpCde4: Integer ;
  TempField: TField ;
  TempParam: TFDParam;
  TempFieldType: TFieldType;
  sTempFrom, sTempTo: String;
begin
  {Detect field changes in 2 datasets} ;
  {Returns TRUE if a field has changed} ;
  Result := False ;
  {If FILE UPDATE and FIELD CHANGES are disabled, don't bother to do anything else} ;
  If (not bAuditLogFields) and (not bAuditLogUpd) then
          exit ;
  {Loop through the PARAMETERS in the output TFDQuery} ;
  For iCount := 0 to SQLTo.ParamCount -1 do
        begin
        TempParam := SQLTo.Params[iCount] ;
        {Try to find the same field name in the INPUT dataset} ;
        Try
                TempField := DSFrom.FieldByName(TempParam.Name) ;
        Except
                Continue ;
                end;
        {If found OK, access the field type. Currently this only handles STRINGS, FLOATS and INTEGERS} ;
        {Any other types brings up a message} ;
        TempFieldType := TempParam.DataType ;
        If TempFieldType = ftString then
                begin
                sTempFrom := Trim(TempField.AsString) ;
                sTempTo := Trim(TempParam.AsString) ;
                end
        else
                If (TempFieldType = ftCurrency) then
                        begin
                        sTempFrom := FormatFloat('######0.00',TempField.AsFloat) ;
                        sTempTo := FormatFloat('######0.00',TempParam.AsFloat) ;
                        end
                else
                        If TempFieldType = ftInteger then
                                begin
                                sTempFrom := IntToStr(TempField.AsInteger) ;
                                sTempTo :=IntToStr(TempParam.AsInteger) ;
                                end
                        else
                                If TempFieldType = ftDateTime then
                                        begin
                                        sTempFrom := DateToStr(TempField.AsDateTime) ;
                                        sTempTo :=DateToStr(TempParam.AsDateTime) ;
                                        end
                                else
                                        If (TempFieldType = ftFloat) then
                                                begin
                                                sTempFrom := FloatToStr(TempField.AsFloat) ;
                                                sTempTo := FloatToStr(TempParam.AsFloat) ;
                                                end
                                        else MessageDlg('Audit trail does not know type: ',mtinformation,[mbOK],0) ;
        {Compare the field with the parameter} ;
        If sTempFrom <> sTempTo then
                begin
                {set the output to TRUE to denote that a field has changed} ;
                Result := True;
                {If it's not logging field changes we can exit as soon as a field change has been detected} ;
                If not bAuditLogFields then
                        Break ;
                {If they've changed, the following SQL gets the correct audit trail type for the specific field} ;
                {on the specific table (in the Audit_Type >= 10000 and < 99999 range. It also gets the table} ;
                {changed record in the Audit_Type >= 2000 and < 3000 range to know what fields to write into the} ;
                {audit trail code fields. If either record isn't present, nothin happens} ;
                With GetFldChgTypSQL do
                        begin
                        Close ;
                        ParamByName('Audit_Table_Name').AsString := sTempTable ;
                        ParamByName('Audit_Code_1_Field').AsString := TempParam.Name ;
                        Open ;
                        First ;
                        If EOF then
                                Continue;
                        end;
                {Write the audit trail record} ;
                Try
                        iTmpCde1 := SQLTo.ParamByName(GetFldChgTypSQL.FieldByName('Audit_Code_1_Field').AsString).AsInteger ;
                Except
                        iTmpCde1 := 0 ;
                        end;
                {Write the audit trail record} ;
                Try
                        iTmpCde2 := SQLTo.ParamByName(GetFldChgTypSQL.FieldByName('Audit_Code_2_Field').AsString).AsInteger ;
                Except
                        iTmpCde2 := 0 ;
                        end;
                {Write the audit trail record} ;
                Try
                        iTmpCde3 := SQLTo.ParamByName(GetFldChgTypSQL.FieldByName('Audit_Code_3_Field').AsString).AsInteger ;
                Except
                        iTmpCde3 := 0 ;
                        end;
                {Write the audit trail record} ;
                Try
                        iTmpCde4 := SQLTo.ParamByName(GetFldChgTypSQL.FieldByName('Audit_Code_4_Field').AsString).AsInteger ;
                Except
                        iTmpCde4 := 0 ;
                        end;
                WriteAudit(GetFldChgTypSQL.FieldByName('Audit_Type').AsInteger, iTmpCde1, iTmpCde2, iTmpCde3, iTmpCde4,
                                     sTempFrom + ' --> ' + sTempTo) ;
                end;
        end;
end;

function TPBAuditDataMod.GetAuditOperation(TempDS: TDataSet): String;
begin
{Get the audit trail operation for the display/print} ;
If (TempDS.FieldByName('Audit_Type').AsInteger < 10000) or
   (TempDS.FieldByName('Audit_Type').AsInteger > 99998) then
        begin
        {If it's NOT a field change, return nothing} ;
        Result := '' ;
        end
else
        begin
        With GetFldChgTypSQL do
                begin
                Close ;
                ParamByName('Audit_Table_Name').AsString := TempDS.FieldByName('Audit_Table_Name').AsString ;
                ParamByName('Audit_Code_1_Field').AsString := TempDS.FieldByName('Audit_Code_1_Field').AsString ;
                Open ;
                First ;
                If EOF then
                        Result := ''
                else
                        Result := FieldByName('Audit_Type_Descr').AsString + ' - ' ;
                end;
        end;
end;

end.
