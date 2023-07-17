unit WTUpdateDB;

interface

uses
  SysUtils, Classes, DB, DBTables, QrCtrls;

type
  TdtmdlUpdateDB = class(TDataModule)
    qryGetDBVersion: TQuery;
    Acc50Q1: TQuery;
    Acc56Q1: TQuery;
    Acc143Q1: TQuery;
    Acc143Q2: TQuery;
    Acc143Q3: TQuery;
    Acc143Q4: TQuery;
    Acc143Q5: TQuery;
    Acc143Q6: TQuery;
    Acc143Q7: TQuery;
    Acc143Q8: TQuery;
    Acc143Q9: TQuery;
    Acc143Q10: TQuery;
    Acc143Q11: TQuery;
    Acc143Q12: TQuery;
    Acc143Q13: TQuery;
    Acc143Q14: TQuery;
    Acc143Q15: TQuery;
    Acc143Q16: TQuery;
    Acc143Q17: TQuery;
    Acc143Q18: TQuery;
    Acc143Q19: TQuery;
    Acc143Q20: TQuery;
    Acc144Q1: TQuery;
    Acc144Q2: TQuery;
    Acc144Q3: TQuery;
    Acc144Q4: TQuery;
    Acc144Q5: TQuery;
    Acc144Q8: TQuery;
    Acc144Q6: TQuery;
    Acc144Q7: TQuery;
    Acc145Q1: TQuery;
    Acc145Q2: TQuery;
    Acc145Q3: TQuery;
    Acc145Q4: TQuery;
    Acc145Q5: TQuery;
    Acc145Q6: TQuery;
    Acc145Q8: TQuery;
    Acc145Q9: TQuery;
    Acc145Q10: TQuery;
    Acc145Q7: TQuery;
    Acc146Q1: TQuery;
    Acc146Q2: TQuery;
    Acc146Q5: TQuery;
    Acc146Q3: TQuery;
    Acc146Q4: TQuery;
    Acc147Q1: TQuery;
    Acc147Q2: TQuery;
    Acc148Q1: TQuery;
    Acc148Q2: TQuery;
    Acc149Q1: TQuery;
    Acc149Q2: TQuery;
    Acc150Q1: TQuery;
    Acc150Q5: TQuery;
    Acc150Q4: TQuery;
    Acc150Q2: TQuery;
    Acc150Q3: TQuery;
    Acc151Q1: TQuery;
    Acc151Q3: TQuery;
    Acc151Q2: TQuery;
    Acc152Q1: TQuery;
    Acc152Q2: TQuery;
    Acc152Q3: TQuery;
    Acc153Q1: TQuery;
    Acc153Q4: TQuery;
    Acc153Q2: TQuery;
    Acc153Q3: TQuery;
    Acc200Q1: TQuery;
    Acc200Q3: TQuery;
    Acc200Q2: TQuery;
    Acc201Q1: TQuery;
    Acc201Q2: TQuery;
    Acc202Q1: TQuery;
    Acc202Q2: TQuery;
    Acc203Q1: TQuery;
    Acc203Q2: TQuery;
    sql203Q1: TQuery;
    sql203Q2: TQuery;
    Acc204Q1: TQuery;
    Acc204Q4: TQuery;
    sql204Q1: TQuery;
    sql204Q4: TQuery;
    Acc204Q2: TQuery;
    Acc204Q3: TQuery;
    sql204Q2: TQuery;
    sql204Q3: TQuery;
    Acc205Q1: TQuery;
    Acc205Q2: TQuery;
    sql205Q1: TQuery;
    sql205Q2: TQuery;
    Acc206Q1: TQuery;
    Acc206Q2: TQuery;
    sql206Q1: TQuery;
    sql206Q2: TQuery;
    Acc207Q1: TQuery;
    Acc207Q2: TQuery;
    sql207Q1: TQuery;
    sql207Q2: TQuery;
    Acc208Q1: TQuery;
    Acc208Q3: TQuery;
    Acc208Q7: TQuery;
    sql208Q1: TQuery;
    sql208Q3: TQuery;
    sql208Q8: TQuery;
    Acc208Q2: TQuery;
    sql208Q2: TQuery;
    Acc208Q4: TQuery;
    sql208Q4: TQuery;
    Acc208Q5: TQuery;
    Acc208Q6: TQuery;
    sql208Q5: TQuery;
    sql208Q6: TQuery;
    sql208Q7: TQuery;
    Acc209Q1: TQuery;
    Acc209Q2: TQuery;
    sql209Q1: TQuery;
    sql209Q2: TQuery;
    Acc209Q3: TQuery;
    sql209Q3: TQuery;
    sql2010Q1: TQuery;
    sql2010Q3: TQuery;
    Acc2010Q1: TQuery;
    Acc2010Q3: TQuery;
    Acc2010Q2: TQuery;
    sql2010Q2: TQuery;
    Acc210Q1: TQuery;
    Acc210Q3: TQuery;
    sql210Q1: TQuery;
    sql210Q3: TQuery;
    Acc210Q2: TQuery;
    sql210Q2: TQuery;
    Acc211Q1: TQuery;
    Acc211Q2: TQuery;
    Acc211Q3: TQuery;
    sql211Q1: TQuery;
    sql211Q2: TQuery;
    sql211Q3: TQuery;
    Acc212Q1: TQuery;
    Acc212Q2: TQuery;
    Acc212Q3: TQuery;
    sql212Q1: TQuery;
    sql212Q2: TQuery;
    sql212Q3: TQuery;
    sql213Q1: TQuery;
    sql213Q2: TQuery;
    sql213Q3: TQuery;
    sql213Q4: TQuery;
    sql213Q5: TQuery;
    sql213Q6: TQuery;
    sql213Q7: TQuery;
    sql213Q8: TQuery;
    sql213Q9: TQuery;
    sql213Q10: TQuery;
    sql213Q11: TQuery;
    sql213Q12: TQuery;
    sql213Q13: TQuery;
    sql213Q14: TQuery;
    sql213Q15: TQuery;
    sql213Q16: TQuery;
    sql213Q17: TQuery;
    sql213Q18: TQuery;
    sql213Q19: TQuery;
    sql213Q20: TQuery;
    sql213Q21: TQuery;
    sql213Q22: TQuery;
    sql213Q23: TQuery;
    sql213Q24: TQuery;
    sql213Q25: TQuery;
    sql213Q26: TQuery;
    sql213Q27: TQuery;
    sql213Q28: TQuery;
    sql213Q29: TQuery;
    sql213Q30: TQuery;
    sql213Q31: TQuery;
    sql213Q32: TQuery;
    Acc213Q1: TQuery;
    Acc213Q2: TQuery;
    Acc213Q3: TQuery;
    Acc213Q4: TQuery;
    Acc213Q5: TQuery;
    Acc213Q6: TQuery;
    Acc213Q7: TQuery;
    Acc213Q8: TQuery;
    Acc213Q9: TQuery;
    Acc213Q10: TQuery;
    Acc213Q11: TQuery;
    Acc213Q12: TQuery;
    Acc213Q13: TQuery;
    Acc213Q14: TQuery;
    Acc213Q15: TQuery;
    Acc213Q16: TQuery;
    Acc213Q17: TQuery;
    Acc213Q18: TQuery;
    Acc213Q19: TQuery;
    Acc213Q20: TQuery;
    Acc213Q21: TQuery;
    Acc213Q22: TQuery;
    Acc213Q23: TQuery;
    Acc213Q24: TQuery;
    Acc213Q25: TQuery;
    Acc213Q26: TQuery;
    Acc213Q27: TQuery;
    Acc213Q28: TQuery;
    Acc213Q29: TQuery;
    Acc213Q30: TQuery;
    Acc213Q31: TQuery;
    Acc213Q32: TQuery;
    Acc214Q1: TQuery;
    sql214Q1: TQuery;
    Acc214Q2: TQuery;
    Acc214Q3: TQuery;
    Acc214Q4: TQuery;
    sql214Q2: TQuery;
    sql214Q3: TQuery;
    sql214Q4: TQuery;
    Acc214Q7: TQuery;
    sql214Q7: TQuery;
    Acc214Q5: TQuery;
    sql214Q5: TQuery;
    Acc214Q6: TQuery;
    sql214Q6: TQuery;
    Acc215Q1: TQuery;
    Acc215Q2: TQuery;
    Acc215Q3: TQuery;
    Acc215Q4: TQuery;
    Acc215Q5: TQuery;
    sql215Q1: TQuery;
    sql215Q2: TQuery;
    sql215Q3: TQuery;
    sql215Q4: TQuery;
    sql215Q5: TQuery;
    sql216Q1: TQuery;
    sql216Q3: TQuery;
    sql216Q4: TQuery;
    sql216Q5: TQuery;
    sql216Q6: TQuery;
    sql216Q10: TQuery;
    sql216Q8: TQuery;
    sql216Q9: TQuery;
    sql216Q2: TQuery;
    sql216Q7: TQuery;
    Acc216Q1: TQuery;
    Acc216Q3: TQuery;
    Acc216Q4: TQuery;
    Acc216Q5: TQuery;
    Acc216Q6: TQuery;
    Acc216Q10: TQuery;
    Acc216Q8: TQuery;
    Acc216Q9: TQuery;
    Acc216Q2: TQuery;
    Acc216Q7: TQuery;
    Acc217Q1: TQuery;
    Acc217Q2: TQuery;
    sql217Q1: TQuery;
    sql217Q2: TQuery;
    Acc218Q1: TQuery;
    Acc218Q2: TQuery;
    Acc218Q3: TQuery;
    Acc218Q4: TQuery;
    Acc218Q5: TQuery;
    Acc218Q6: TQuery;
    sql218Q1: TQuery;
    sql218Q2: TQuery;
    sql218Q3: TQuery;
    sql218Q4: TQuery;
    sql218Q13: TQuery;
    sql218Q5: TQuery;
    sql218Q6: TQuery;
    sql218Q8: TQuery;
    sql218Q10: TQuery;
    sql218Q7: TQuery;
    sql218Q9: TQuery;
    Acc218Q13: TQuery;
    Acc218Q8: TQuery;
    Acc218Q10: TQuery;
    Acc218Q7: TQuery;
    Acc218Q9: TQuery;
    Acc218Q11: TQuery;
    sql218Q11: TQuery;
    Acc218Q12: TQuery;
    sql218Q12: TQuery;
    Acc219Q1: TQuery;
    Acc219Q2: TQuery;
    Acc219Q3: TQuery;
    Acc219Q4: TQuery;
    Acc219Q5: TQuery;
    Acc219Q6: TQuery;
    Acc219Q12: TQuery;
    sql219Q2: TQuery;
    sql219Q3: TQuery;
    sql219Q4: TQuery;
    sql219Q5: TQuery;
    sql219Q6: TQuery;
    sql219Q12: TQuery;
    Acc219Q7: TQuery;
    sql219Q7: TQuery;
    sql219Q1: TQuery;
    Acc219Q8: TQuery;
    sql219Q8: TQuery;
    Acc219Q9: TQuery;
    sql219Q9: TQuery;
    Acc219Q10: TQuery;
    sql219Q10: TQuery;
    Acc219Q11: TQuery;
    sql219Q11: TQuery;
    sql220Q1: TQuery;
    sql220Q2: TQuery;
    sql220Q3: TQuery;
    Acc220Q1: TQuery;
    Acc220Q2: TQuery;
    Acc220Q3: TQuery;
    Acc221Q1: TQuery;
    Acc221Q2: TQuery;
    Acc221Q3: TQuery;
    Acc221Q4: TQuery;
    Acc221Q5: TQuery;
    Acc221Q6: TQuery;
    sql221Q1: TQuery;
    sql221Q2: TQuery;
    sql221Q3: TQuery;
    sql221Q4: TQuery;
    sql221Q5: TQuery;
    sql221Q6: TQuery;
    Acc222Q1: TQuery;
    Acc222Q2: TQuery;
    sql222Q1: TQuery;
    sql222Q2: TQuery;
    Acc223Q1: TQuery;
    Acc223Q2: TQuery;
    Acc223Q3: TQuery;
    Acc223Q4: TQuery;
    Acc223Q6: TQuery;
    sql223Q1: TQuery;
    sql223Q2: TQuery;
    sql223Q3: TQuery;
    sql223Q4: TQuery;
    sql223Q6: TQuery;
    Acc223Q5: TQuery;
    sql223Q5: TQuery;
    Acc224Q1: TQuery;
    Acc224Q2: TQuery;
    Acc224Q3: TQuery;
    sql224Q1: TQuery;
    sql224Q2: TQuery;
    sql224Q3: TQuery;
    sql224Q4: TQuery;
    sql224Q5: TQuery;
    sql224Q7: TQuery;
    sql224Q6: TQuery;
    Acc224Q4: TQuery;
    Acc224Q5: TQuery;
    Acc224Q6: TQuery;
    Acc224Q7: TQuery;
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
  TempQry :TQuery;
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
        TempQry := ((FindComponent(BatchName + 'Q' + IntToStr(i))) As TQuery);
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
