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
    Acc143Q1: TFDQuery;
    Acc143Q2: TFDQuery;
    Acc143Q3: TFDQuery;
    Acc143Q4: TFDQuery;
    Acc143Q5: TFDQuery;
    Acc143Q6: TFDQuery;
    Acc143Q7: TFDQuery;
    Acc143Q8: TFDQuery;
    Acc143Q9: TFDQuery;
    Acc143Q10: TFDQuery;
    Acc143Q11: TFDQuery;
    Acc143Q12: TFDQuery;
    Acc143Q13: TFDQuery;
    Acc143Q14: TFDQuery;
    Acc143Q15: TFDQuery;
    Acc143Q16: TFDQuery;
    Acc143Q17: TFDQuery;
    Acc143Q18: TFDQuery;
    Acc143Q19: TFDQuery;
    Acc143Q20: TFDQuery;
    Acc144Q1: TFDQuery;
    Acc144Q2: TFDQuery;
    Acc144Q3: TFDQuery;
    Acc144Q4: TFDQuery;
    Acc144Q5: TFDQuery;
    Acc144Q8: TFDQuery;
    Acc144Q6: TFDQuery;
    Acc144Q7: TFDQuery;
    Acc145Q1: TFDQuery;
    Acc145Q2: TFDQuery;
    Acc145Q3: TFDQuery;
    Acc145Q4: TFDQuery;
    Acc145Q5: TFDQuery;
    Acc145Q6: TFDQuery;
    Acc145Q8: TFDQuery;
    Acc145Q9: TFDQuery;
    Acc145Q10: TFDQuery;
    Acc145Q7: TFDQuery;
    Acc146Q1: TFDQuery;
    Acc146Q2: TFDQuery;
    Acc146Q5: TFDQuery;
    Acc146Q3: TFDQuery;
    Acc146Q4: TFDQuery;
    Acc147Q1: TFDQuery;
    Acc147Q2: TFDQuery;
    Acc148Q1: TFDQuery;
    Acc148Q2: TFDQuery;
    Acc149Q1: TFDQuery;
    Acc149Q2: TFDQuery;
    Acc150Q1: TFDQuery;
    Acc150Q5: TFDQuery;
    Acc150Q4: TFDQuery;
    Acc150Q2: TFDQuery;
    Acc150Q3: TFDQuery;
    Acc151Q1: TFDQuery;
    Acc151Q3: TFDQuery;
    Acc151Q2: TFDQuery;
    Acc152Q1: TFDQuery;
    Acc152Q2: TFDQuery;
    Acc152Q3: TFDQuery;
    Acc153Q1: TFDQuery;
    Acc153Q4: TFDQuery;
    Acc153Q2: TFDQuery;
    Acc153Q3: TFDQuery;
    Acc200Q1: TFDQuery;
    Acc200Q3: TFDQuery;
    Acc200Q2: TFDQuery;
    Acc201Q1: TFDQuery;
    Acc201Q2: TFDQuery;
    Acc202Q1: TFDQuery;
    Acc202Q2: TFDQuery;
    Acc203Q1: TFDQuery;
    Acc203Q2: TFDQuery;
    sql203Q1: TFDQuery;
    sql203Q2: TFDQuery;
    Acc204Q1: TFDQuery;
    Acc204Q4: TFDQuery;
    sql204Q1: TFDQuery;
    sql204Q4: TFDQuery;
    Acc204Q2: TFDQuery;
    Acc204Q3: TFDQuery;
    sql204Q2: TFDQuery;
    sql204Q3: TFDQuery;
    Acc205Q1: TFDQuery;
    Acc205Q2: TFDQuery;
    sql205Q1: TFDQuery;
    sql205Q2: TFDQuery;
    Acc206Q1: TFDQuery;
    Acc206Q2: TFDQuery;
    sql206Q1: TFDQuery;
    sql206Q2: TFDQuery;
    Acc207Q1: TFDQuery;
    Acc207Q2: TFDQuery;
    sql207Q1: TFDQuery;
    sql207Q2: TFDQuery;
    Acc208Q1: TFDQuery;
    Acc208Q3: TFDQuery;
    Acc208Q7: TFDQuery;
    sql208Q1: TFDQuery;
    sql208Q3: TFDQuery;
    sql208Q8: TFDQuery;
    Acc208Q2: TFDQuery;
    sql208Q2: TFDQuery;
    Acc208Q4: TFDQuery;
    sql208Q4: TFDQuery;
    Acc208Q5: TFDQuery;
    Acc208Q6: TFDQuery;
    sql208Q5: TFDQuery;
    sql208Q6: TFDQuery;
    sql208Q7: TFDQuery;
    Acc209Q1: TFDQuery;
    Acc209Q2: TFDQuery;
    sql209Q1: TFDQuery;
    sql209Q2: TFDQuery;
    Acc209Q3: TFDQuery;
    sql209Q3: TFDQuery;
    sql2010Q1: TFDQuery;
    sql2010Q3: TFDQuery;
    Acc2010Q1: TFDQuery;
    Acc2010Q3: TFDQuery;
    Acc2010Q2: TFDQuery;
    sql2010Q2: TFDQuery;
    Acc210Q1: TFDQuery;
    Acc210Q3: TFDQuery;
    sql210Q1: TFDQuery;
    sql210Q3: TFDQuery;
    Acc210Q2: TFDQuery;
    sql210Q2: TFDQuery;
    Acc211Q1: TFDQuery;
    Acc211Q2: TFDQuery;
    Acc211Q3: TFDQuery;
    sql211Q1: TFDQuery;
    sql211Q2: TFDQuery;
    sql211Q3: TFDQuery;
    Acc212Q1: TFDQuery;
    Acc212Q2: TFDQuery;
    Acc212Q3: TFDQuery;
    sql212Q1: TFDQuery;
    sql212Q2: TFDQuery;
    sql212Q3: TFDQuery;
    sql213Q1: TFDQuery;
    sql213Q2: TFDQuery;
    sql213Q3: TFDQuery;
    sql213Q4: TFDQuery;
    sql213Q5: TFDQuery;
    sql213Q6: TFDQuery;
    sql213Q7: TFDQuery;
    sql213Q8: TFDQuery;
    sql213Q9: TFDQuery;
    sql213Q10: TFDQuery;
    sql213Q11: TFDQuery;
    sql213Q12: TFDQuery;
    sql213Q13: TFDQuery;
    sql213Q14: TFDQuery;
    sql213Q15: TFDQuery;
    sql213Q16: TFDQuery;
    sql213Q17: TFDQuery;
    sql213Q18: TFDQuery;
    sql213Q19: TFDQuery;
    sql213Q20: TFDQuery;
    sql213Q21: TFDQuery;
    sql213Q22: TFDQuery;
    sql213Q23: TFDQuery;
    sql213Q24: TFDQuery;
    sql213Q25: TFDQuery;
    sql213Q26: TFDQuery;
    sql213Q27: TFDQuery;
    sql213Q28: TFDQuery;
    sql213Q29: TFDQuery;
    sql213Q30: TFDQuery;
    sql213Q31: TFDQuery;
    sql213Q32: TFDQuery;
    Acc213Q1: TFDQuery;
    Acc213Q2: TFDQuery;
    Acc213Q3: TFDQuery;
    Acc213Q4: TFDQuery;
    Acc213Q5: TFDQuery;
    Acc213Q6: TFDQuery;
    Acc213Q7: TFDQuery;
    Acc213Q8: TFDQuery;
    Acc213Q9: TFDQuery;
    Acc213Q10: TFDQuery;
    Acc213Q11: TFDQuery;
    Acc213Q12: TFDQuery;
    Acc213Q13: TFDQuery;
    Acc213Q14: TFDQuery;
    Acc213Q15: TFDQuery;
    Acc213Q16: TFDQuery;
    Acc213Q17: TFDQuery;
    Acc213Q18: TFDQuery;
    Acc213Q19: TFDQuery;
    Acc213Q20: TFDQuery;
    Acc213Q21: TFDQuery;
    Acc213Q22: TFDQuery;
    Acc213Q23: TFDQuery;
    Acc213Q24: TFDQuery;
    Acc213Q25: TFDQuery;
    Acc213Q26: TFDQuery;
    Acc213Q27: TFDQuery;
    Acc213Q28: TFDQuery;
    Acc213Q29: TFDQuery;
    Acc213Q30: TFDQuery;
    Acc213Q31: TFDQuery;
    Acc213Q32: TFDQuery;
    Acc214Q1: TFDQuery;
    sql214Q1: TFDQuery;
    Acc214Q2: TFDQuery;
    Acc214Q3: TFDQuery;
    Acc214Q4: TFDQuery;
    sql214Q2: TFDQuery;
    sql214Q3: TFDQuery;
    sql214Q4: TFDQuery;
    Acc214Q7: TFDQuery;
    sql214Q7: TFDQuery;
    Acc214Q5: TFDQuery;
    sql214Q5: TFDQuery;
    Acc214Q6: TFDQuery;
    sql214Q6: TFDQuery;
    Acc215Q1: TFDQuery;
    Acc215Q2: TFDQuery;
    Acc215Q3: TFDQuery;
    Acc215Q4: TFDQuery;
    Acc215Q5: TFDQuery;
    sql215Q1: TFDQuery;
    sql215Q2: TFDQuery;
    sql215Q3: TFDQuery;
    sql215Q4: TFDQuery;
    sql215Q5: TFDQuery;
    sql216Q1: TFDQuery;
    sql216Q3: TFDQuery;
    sql216Q4: TFDQuery;
    sql216Q5: TFDQuery;
    sql216Q6: TFDQuery;
    sql216Q10: TFDQuery;
    sql216Q8: TFDQuery;
    sql216Q9: TFDQuery;
    sql216Q2: TFDQuery;
    sql216Q7: TFDQuery;
    Acc216Q1: TFDQuery;
    Acc216Q3: TFDQuery;
    Acc216Q4: TFDQuery;
    Acc216Q5: TFDQuery;
    Acc216Q6: TFDQuery;
    Acc216Q10: TFDQuery;
    Acc216Q8: TFDQuery;
    Acc216Q9: TFDQuery;
    Acc216Q2: TFDQuery;
    Acc216Q7: TFDQuery;
    Acc217Q1: TFDQuery;
    Acc217Q2: TFDQuery;
    sql217Q1: TFDQuery;
    sql217Q2: TFDQuery;
    Acc218Q1: TFDQuery;
    Acc218Q2: TFDQuery;
    Acc218Q3: TFDQuery;
    Acc218Q4: TFDQuery;
    Acc218Q5: TFDQuery;
    Acc218Q6: TFDQuery;
    sql218Q1: TFDQuery;
    sql218Q2: TFDQuery;
    sql218Q3: TFDQuery;
    sql218Q4: TFDQuery;
    sql218Q13: TFDQuery;
    sql218Q5: TFDQuery;
    sql218Q6: TFDQuery;
    sql218Q8: TFDQuery;
    sql218Q10: TFDQuery;
    sql218Q7: TFDQuery;
    sql218Q9: TFDQuery;
    Acc218Q13: TFDQuery;
    Acc218Q8: TFDQuery;
    Acc218Q10: TFDQuery;
    Acc218Q7: TFDQuery;
    Acc218Q9: TFDQuery;
    Acc218Q11: TFDQuery;
    sql218Q11: TFDQuery;
    Acc218Q12: TFDQuery;
    sql218Q12: TFDQuery;
    Acc219Q1: TFDQuery;
    Acc219Q2: TFDQuery;
    Acc219Q3: TFDQuery;
    Acc219Q4: TFDQuery;
    Acc219Q5: TFDQuery;
    Acc219Q6: TFDQuery;
    Acc219Q12: TFDQuery;
    sql219Q2: TFDQuery;
    sql219Q3: TFDQuery;
    sql219Q4: TFDQuery;
    sql219Q5: TFDQuery;
    sql219Q6: TFDQuery;
    sql219Q12: TFDQuery;
    Acc219Q7: TFDQuery;
    sql219Q7: TFDQuery;
    sql219Q1: TFDQuery;
    Acc219Q8: TFDQuery;
    sql219Q8: TFDQuery;
    Acc219Q9: TFDQuery;
    sql219Q9: TFDQuery;
    Acc219Q10: TFDQuery;
    sql219Q10: TFDQuery;
    Acc219Q11: TFDQuery;
    sql219Q11: TFDQuery;
    sql220Q1: TFDQuery;
    sql220Q2: TFDQuery;
    sql220Q3: TFDQuery;
    Acc220Q1: TFDQuery;
    Acc220Q2: TFDQuery;
    Acc220Q3: TFDQuery;
    Acc221Q1: TFDQuery;
    Acc221Q2: TFDQuery;
    Acc221Q3: TFDQuery;
    Acc221Q4: TFDQuery;
    Acc221Q5: TFDQuery;
    Acc221Q6: TFDQuery;
    sql221Q1: TFDQuery;
    sql221Q2: TFDQuery;
    sql221Q3: TFDQuery;
    sql221Q4: TFDQuery;
    sql221Q5: TFDQuery;
    sql221Q6: TFDQuery;
    Acc222Q1: TFDQuery;
    Acc222Q2: TFDQuery;
    sql222Q1: TFDQuery;
    sql222Q2: TFDQuery;
    Acc223Q1: TFDQuery;
    Acc223Q2: TFDQuery;
    Acc223Q3: TFDQuery;
    Acc223Q4: TFDQuery;
    Acc223Q6: TFDQuery;
    sql223Q1: TFDQuery;
    sql223Q2: TFDQuery;
    sql223Q3: TFDQuery;
    sql223Q4: TFDQuery;
    sql223Q6: TFDQuery;
    Acc223Q5: TFDQuery;
    sql223Q5: TFDQuery;
    Acc224Q1: TFDQuery;
    Acc224Q2: TFDQuery;
    Acc224Q3: TFDQuery;
    sql224Q1: TFDQuery;
    sql224Q2: TFDQuery;
    sql224Q3: TFDQuery;
    sql224Q4: TFDQuery;
    sql224Q5: TFDQuery;
    sql224Q7: TFDQuery;
    sql224Q6: TFDQuery;
    Acc224Q4: TFDQuery;
    Acc224Q5: TFDQuery;
    Acc224Q6: TFDQuery;
    Acc224Q7: TFDQuery;
    Acc225Q1: TFDQuery;
    Acc225Q2: TFDQuery;
    Acc225Q3: TFDQuery;
    Acc225Q4: TFDQuery;
    Acc225Q5: TFDQuery;
    Acc225Q6: TFDQuery;
    Acc225Q7: TFDQuery;
    Acc225Q9: TFDQuery;
    sql225Q1: TFDQuery;
    sql225Q2: TFDQuery;
    sql225Q3: TFDQuery;
    sql225Q4: TFDQuery;
    sql225Q5: TFDQuery;
    sql225Q6: TFDQuery;
    sql225Q7: TFDQuery;
    sql225Q9: TFDQuery;
    Acc225Q8: TFDQuery;
    sql225Q8: TFDQuery;
    Acc226Q1: TFDQuery;
    Acc226Q2: TFDQuery;
    Acc226Q3: TFDQuery;
    sql226Q1: TFDQuery;
    sql226Q2: TFDQuery;
    sql226Q3: TFDQuery;
    Acc226Q4: TFDQuery;
    sql226Q4: TFDQuery;
    Acc227Q1: TFDQuery;
    Acc227Q2: TFDQuery;
    Acc227Q3: TFDQuery;
    Acc227Q4: TFDQuery;
    Acc227Q5: TFDQuery;
    sql227Q1: TFDQuery;
    sql227Q2: TFDQuery;
    sql227Q3: TFDQuery;
    sql227Q4: TFDQuery;
    sql227Q5: TFDQuery;
    Acc228Q1: TFDQuery;
    sql228Q1: TFDQuery;
    Acc228Q2: TFDQuery;
    Acc228Q3: TFDQuery;
    Acc228Q4: TFDQuery;
    Acc228Q5: TFDQuery;
    Acc228Q6: TFDQuery;
    Acc228Q7: TFDQuery;
    Acc228Q8: TFDQuery;
    Acc228Q9: TFDQuery;
    sql228Q2: TFDQuery;
    sql228Q3: TFDQuery;
    sql228Q4: TFDQuery;
    sql228Q5: TFDQuery;
    sql228Q6: TFDQuery;
    sql228Q7: TFDQuery;
    sql228Q8: TFDQuery;
    sql228Q9: TFDQuery;
    Acc229Q1: TFDQuery;
    Acc229Q2: TFDQuery;
    sql229Q1: TFDQuery;
    sql229Q2: TFDQuery;
    Acc229Q3: TFDQuery;
    sql229Q3: TFDQuery;
    Acc23Q1: TFDQuery;
    Acc23Q4: TFDQuery;
    sql23Q1: TFDQuery;
    sql23Q4: TFDQuery;
    Acc23Q2: TFDQuery;
    sql23Q2: TFDQuery;
    Acc23Q3: TFDQuery;
    sql23Q3: TFDQuery;
    Acc231Q1: TFDQuery;
    Acc231Q2: TFDQuery;
    sql231Q1: TFDQuery;
    sql231Q2: TFDQuery;
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
  if (sDb_Version = '9') then
    QryFails := RunBatch('Acc91', 18);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '9.1') then
    QryFails := RunBatch('Acc92', 15);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '9.2') then
    QryFails := RunBatch('Acc93', 3);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '9.3') then
    QryFails := RunBatch('Acc94', 3);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '9.4') then
    QryFails := RunBatch('Acc95', 4);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '9.5') then
    QryFails := RunBatch('Acc96', 4);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '9.6') then
    QryFails := RunBatch('Acc97', 4);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '9.7') then
    QryFails := RunBatch('Acc98', 3);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '9.8') then
    QryFails := RunBatch('Acc99', 14);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '9.9') then
    QryFails := RunBatch('Acc100', 7);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '10') then
    QryFails := RunBatch('Acc101', 2);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '10.1') then
    QryFails := RunBatch('Acc102', 2);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '10.2') then
    QryFails := RunBatch('Acc103', 2);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '10.3') then
    QryFails := RunBatch('Acc104', 4);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '10.4') then
    QryFails := RunBatch('Acc110', 32);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '11') then
    QryFails := RunBatch('Acc111', 10);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '11.1') then
    QryFails := RunBatch('Acc112', 3);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '11.2') then
    QryFails := RunBatch('Acc113', 5);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '11.3') then
    QryFails := RunBatch('Acc114', 7);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '11.4') then
    QryFails := RunBatch('Acc115', 6);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '11.5') then
    QryFails := RunBatch('Acc116', 2);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '11.6') then
    QryFails := RunBatch('Acc117', 11);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '11.7') then
    QryFails := RunBatch('Acc118', 9);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '11.8') then
    QryFails := RunBatch('Acc119', 15);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '11.9') then
    QryFails := RunBatch('Acc120', 5);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '12') then
    QryFails := RunBatch('Acc121', 15);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '12.1') then
    QryFails := RunBatch('Acc122', 6);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '12.2') then
    QryFails := RunBatch('Acc123', 3);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '12.3') then
    QryFails := RunBatch('Acc124', 3);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '12.4') then
    QryFails := RunBatch('Acc125', 2);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '12.5') then
    QryFails := RunBatch('Acc126', 2);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '12.6') then
    QryFails := RunBatch('Acc127', 6);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '12.7') then
    QryFails := RunBatch('Acc130', 15);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '13') then
    QryFails := RunBatch('Acc131', 7);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '13.1') then
    QryFails := RunBatch('Acc132', 15);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '13.2') then
    QryFails := RunBatch('Acc133', 3);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '13.3') then
    QryFails := RunBatch('Acc134', 15);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '13.4') then
    QryFails := RunBatch('Acc135', 4);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '13.5') then
    QryFails := RunBatch('Acc136', 4);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '13.6') then
    QryFails := RunBatch('Acc137', 3);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '13.7') then
    QryFails := RunBatch('Acc138', 2);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '13.8') then
    QryFails := RunBatch('Acc139', 6);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '13.9') then
    QryFails := RunBatch('Acc140', 5);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '14') then
    QryFails := RunBatch('Acc141', 11);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '14.1') then
    QryFails := RunBatch('Acc142', 2);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '14.2') then
    QryFails := RunBatch('Acc143', 20);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '14.3') then
    QryFails := RunBatch('Acc144', 8);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '14.4') then
    QryFails := RunBatch('Acc145', 10);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '14.5') then
    QryFails := RunBatch('Acc146', 5);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '14.6') then
    QryFails := RunBatch('Acc147', 2);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '14.7') then
    QryFails := RunBatch('Acc148', 2);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '14.8') then
    QryFails := RunBatch('Acc149', 2);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '14.9') then
    QryFails := RunBatch('Acc150', 5);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '15') then
    QryFails := RunBatch('Acc151', 3);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '15.1') then
    QryFails := RunBatch('Acc152', 3);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '15.2') then
    QryFails := RunBatch('Acc153', 4);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '15.3') then
    QryFails := RunBatch('Acc200', 3);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '20') then
    QryFails := RunBatch('Acc201', 2);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '20.1') then
    QryFails := RunBatch('Acc202', 2);

  sDb_Version := GetDBVersion;
  if (sDb_Version = '20.2') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql203', 2)
      else
        QryFails := RunBatch('Acc203', 2);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '20.3') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql204', 4)
      else
        QryFails := RunBatch('Acc204', 4);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '20.4') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql205', 2)
      else
        QryFails := RunBatch('Acc205', 2);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '20.5') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql206', 2)
      else
        QryFails := RunBatch('Acc206', 2);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '20.6') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql207', 2)
      else
        QryFails := RunBatch('Acc207', 2);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '20.7') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql208', 8)
      else
        QryFails := RunBatch('Acc208', 7);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '20.8') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql209', 3)
      else
        QryFails := RunBatch('Acc209', 3);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '20.9') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql2010', 3)
      else
        QryFails := RunBatch('Acc2010', 3);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '20.10') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql210', 3)
      else
        QryFails := RunBatch('Acc210', 3);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '21') or (sDb_Version = '21.0') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql211', 3)
      else
        QryFails := RunBatch('Acc211', 3);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '21.1') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql212', 3)
      else
        QryFails := RunBatch('Acc212', 3);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '21.2') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql213', 32)
      else
        QryFails := RunBatch('Acc213', 32);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '21.3') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql214', 7)
      else
        QryFails := RunBatch('Acc214', 7);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '21.4') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql215', 5)
      else
        QryFails := RunBatch('Acc215', 5);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '21.5') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql216', 10)
      else
        QryFails := RunBatch('Acc216', 10);
    end;


  sDb_Version := GetDBVersion;
  if (sDb_Version = '21.6') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql217', 2)
      else
        QryFails := RunBatch('Acc217', 2);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '21.7') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql218', 13)
      else
        QryFails := RunBatch('Acc218', 13);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '21.8') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql219', 12)
      else
        QryFails := RunBatch('Acc219', 12);
    end;


  sDb_Version := GetDBVersion;
  if (sDb_Version = '21.9') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql220', 3)
      else
        QryFails := RunBatch('Acc220', 3);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '22') or (sDb_Version = '22.0') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql221', 6)
      else
        QryFails := RunBatch('Acc221', 6);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '22.1') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql222', 2)
      else
        QryFails := RunBatch('Acc222', 2);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '22.2') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql223', 6)
      else
        QryFails := RunBatch('Acc223', 6);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '22.3') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql224', 7)
      else
        QryFails := RunBatch('Acc224', 7);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '22.4') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql225', 9)
      else
        QryFails := RunBatch('Acc225', 9);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '22.5') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql226', 4)
      else
        QryFails := RunBatch('Acc226', 4);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '22.6') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql227', 5)
      else
        QryFails := RunBatch('Acc227', 5);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '22.7') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql228', 9)
      else
        QryFails := RunBatch('Acc228', 9);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '22.8') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql229', 3)
      else
        QryFails := RunBatch('Acc229', 3);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '22.9') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql23', 4)
      else
        QryFails := RunBatch('Acc23', 4);
    end;

  sDb_Version := GetDBVersion;
  if (sDb_Version = '23') then
    begin
      if dtmdlWorktops.IsSQL then
        QryFails := RunBatch('sql231', 2)
      else
        QryFails := RunBatch('Acc231', 2);
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
