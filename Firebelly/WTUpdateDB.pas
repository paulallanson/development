unit WTUpdateDB;

interface

uses
  SysUtils, Classes, DB, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlUpdateDB = class(TDataModule)
    qryGetDBVersion: TFDQuery;
    Acc50Q1: TFDQuery;
    Acc56Q1: TFDQuery;
    sql240Q1: TFDQuery;
    sql240Q3: TFDQuery;
    sql240Q4: TFDQuery;
    sql240Q2: TFDQuery;
    sql240Q5: TFDQuery;
    sql240Q6: TFDQuery;
    sql240Q7: TFDQuery;
    sql240Q8: TFDQuery;
    sql240Q9: TFDQuery;
    sql242Q1: TFDQuery;
    sql242Q2: TFDQuery;
    sql242Q3: TFDQuery;
    sql242Q4: TFDQuery;
    sql242Q5: TFDQuery;
  private
    QryFails :boolean;
    sDb_Version :String;
    FisLiveDB: boolean;
    FDBName: string;
    procedure SetisLiveDB(const Value: boolean);
    function GetDBVersion: String;
    function RunBatch(BatchName: String; NoOfQueries: Integer): boolean;
    procedure SetDBName(const Value: string);
    { Private declarations }
  public
    procedure UpdateDatabase;
    property isLiveDB :boolean read FisLiveDB write SetisLiveDB;
    property DBName: string read FDBName write SetDBName;
  end;

var
  dtmdlUpdateDB: TdtmdlUpdateDB;

implementation

uses wtDataModule;

{$R *.dfm}

{ TdtmdlUpdateDB }

procedure TdtmdlUpdateDB.UpdateDatabase;
begin
  QryFails := false;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '23') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql231', 2)
      else
        QryFails := RunBatch('Acc231', 2);
    end;

(*  sDb_Version := GetDBVersion;
  if (sDb_Version = '23.2') then
    begin
      QryFails := RunBatch('sql240', 9)
    end;
*)

  sDb_Version := GetDBVersion;
  if (sDb_Version = '24.0') then
    begin
      QryFails := RunBatch('sql240', 9)
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '24.1') then
    begin
      QryFails := RunBatch('sql242', 5)
    end;
end;

function TdtmdlUpdateDB.GetDBVersion():String;
begin
  try
    with qryGetDBVersion do
      begin
        close;
        open;
        first;
        result := fieldbyname('Database_Version').asstring;
      end;
  except
    result := '';
  end;
end;

function TdtmdlUpdateDB.RunBatch(BatchName :String; NoOfQueries :Integer):boolean;
var
  i : integer;
  TempQry :TFDQuery;
  QryName :string[15];
  QryResult :string[15];
  Log :TextFile;
  StartQry :integer;
  LogName :String;
  QryFails :boolean;
begin
  QryFails := false;
  StartQry :=1;

(*  if isLiveDB then
    LogName := 'LiveDBU'+BatchName+'.log'
  else
    LogName := 'TestDBU'+BatchName+'.log';
*)

  LogName :=  DBName+BatchName+'.log';

  AssignFile(Log, LogName);

  try
    Reset(Log);
  except
    Rewrite(Log);
  end;

  try
    begin
      Reset(Log);
      While not Eof(Log) do
      begin
        ReadLn(Log, QryName, QryResult);
        if (QryResult = 'Successful     ') then
          StartQry := StartQry +1;
      end;
    end;
  finally
    begin
      CloseFile(Log);
    end;
  end;

  try
    begin
      Append(Log);
      for i := StartQry to NoOfQueries do
      {*Loop thru queries*}
      begin
        {*Use TempQry as reference to current query*}
        TempQry := ((FindComponent(BatchName + 'Q' + IntToStr(i))) As TFDQuery);
        with TempQry do
        begin
          try
            begin
              ExecSQL;
              QryName := TempQry.Name + '               ';
              QryResult := 'Successful     ';
              WriteLn(Log, QryName, QryResult, DateToStr(Date), TimeToStr(Time));
            end;
          except
            begin
              QryFails := true;
            end;
          end;
        end;
        if QryFails then Break;
      end;
    CloseFile(Log);
  end;
  except
    begin
      QryFails := True;
      CloseFile(Log);
    end;
  end;
  Result := QryFails;
end;

procedure TdtmdlUpdateDB.SetisLiveDB(const Value: boolean);
begin
  FisLiveDB := Value;
end;

procedure TdtmdlUpdateDB.SetDBName(const Value: string);
begin
  FDBName := Value;
end;

end.
