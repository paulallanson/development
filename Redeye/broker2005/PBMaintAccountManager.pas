unit PBMaintAccountManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, DBCtrls, StdCtrls, Buttons;

type
  TPBMaintAccountManagerFrm = class(TForm)
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    dblkpOperators: TDBLookupComboBox;
    qryOperators: TQuery;
    dtsOperators: TDataSource;
    btnOperators: TBitBtn;
    AddSQL: TQuery;
    qryGetLast: TQuery;
    qryDelete: TQuery;
    Label2: TLabel;
    dblkpTeam: TDBLookupComboBox;
    qryTeam: TQuery;
    dtsTeam: TDataSource;
    qryGetAccountTeam: TQuery;
    qryDelTeam: TQuery;
    qryAddTeam: TQuery;
    qryGetMemberNo: TQuery;
    btnTeam: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure dblkpOperatorsClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure btnOperatorsClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnTeamClick(Sender: TObject);
  private
    procedure ShowDetails;
    procedure GetOperators;
    procedure GetAccountTeams;
    function GetAccountManagerTeam: integer;
    { Private declarations }
  public
    iCode: integer;
    iOperator: integer;
    sFuncMode: string;
  end;

var
  PBMaintAccountManagerFrm: TPBMaintAccountManagerFrm;

implementation

uses PBLUOps, pbDatabase, pbMainMenu, PBLUAccountTeam;

{$R *.dfm}

procedure TPBMaintAccountManagerFrm.FormActivate(Sender: TObject);
begin
  GetOperators;

  GetAccountTeams;

  ShowDetails;

  dmBroker.ScreenAccessControl(Self,'mnuAccountManagers',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintAccountManagerFrm.ShowDetails;
begin
  if sFuncMode = 'A' then
    begin
      dblkpOperators.KeyValue := 0;
      dblkpTeam.KeyValue := 0;
    end
  else
    begin
      dblkpOperators.KeyValue := iOperator;
      dblkpOperators.enabled := false;
      dblkpTeam.KeyValue := GetAccountManagerTeam;
    end;
  checkok(self);
end;

procedure TPBMaintAccountManagerFrm.dblkpOperatorsClick(Sender: TObject);
begin
  checkok(self);
end;

procedure TPBMaintAccountManagerFrm.CheckOK(Sender: TObject);
begin
  btnOK.enabled := dblkpOperators.keyvalue <> 0;
end;

procedure TPBMaintAccountManagerFrm.btnOperatorsClick(Sender: TObject);
begin
  PBLUOpsFrm := TPBLUOpsFrm.Create(Self);
  try
    PBLUOpsFrm.bIs_Lookup := True;
    PBLUOpsFrm.bAllow_Upd := True;
    PBLUOpsFrm.SelCode := dblkpOperators.Keyvalue;
    PBLUOpsFrm.ShowModal;
    if PBLUOpsFrm.Selected then
    begin
      GetOperators;
      dblkpOperators.keyvalue := PBLUOpsFrm.SelCode;
    end;
  finally
    PBLUOpsFrm.Free;
  end;

end;

procedure TPBMaintAccountManagerFrm.GetOperators;
begin
  with qryOperators do
    begin
      close;
      parambyname('Operator').AsInteger := iOperator;
      open;
    end;
end;

procedure TPBMaintAccountManagerFrm.GetAccountTeams;
begin
  with qryTeam do
    begin
      close;
      open;
    end;
end;

procedure TPBMaintAccountManagerFrm.btnOKClick(Sender: TObject);
var
  iMemberNo: integer;
begin
  iOperator := dblkpOperators.keyvalue;
  if sFuncMode = 'A' then
    begin
      with qryGetLast do
        begin
          close;
          open;
          iCode := fieldbyname('Last_Number').asinteger+1;
        end;

      with addSQL do
      begin
        ParamByName('User_Group_operator').AsInteger := iCode;
        ParamByName('User_Group').Asinteger := 4;     {Account Manager Group}
        Parambyname('Operator').asinteger := dblkpOperators.keyvalue;
        ExecSQL;
      end;
    end
  else
  if sFuncMode = 'D' then
    begin
      with qryDelete do
        begin
          close;
          parambyname('User_group_Operator').asinteger := iCode;
          execsql;
        end;
    end;
  {Delete operator from all teams}
  with qryDelTeam do
    begin
      close;
      parambyname('Operator').asinteger := dblkpOperators.keyvalue;
      execsql;
    end;

  if (dblkpTeam.Text <> '') and (sFuncMode <> 'D') then
    begin
      with qryGetMemberNo do
        begin
          close;
          parambyname('Account_team').asinteger := dblkpTeam.keyvalue;
          open;

          iMemberNo := fieldbyname('Member_no').asinteger+1;
        end;

      with qryAddTeam do
        begin
          close;
          parambyname('Account_Team').asinteger := dblkpTeam.keyvalue;
          parambyname('Member_no').asinteger := iMemberNo;
          parambyname('Operator').asinteger := dblkpOperators.keyvalue;
          execsql;
        end;
    end;
end;

function TPBMaintAccountManagerFrm.GetAccountManagerTeam: integer;
begin
  with qryGetAccountTeam do
    begin
      close;
      parambyname('Operator').asinteger := dblkpOperators.keyvalue;
      open;
      result := fieldbyname('Account_Team').asinteger;
    end;
end;

procedure TPBMaintAccountManagerFrm.btnTeamClick(Sender: TObject);
begin
  PBLUAccountTeamFrm := TPBLUAccountTeamFrm.Create(Self);
  try
    PBLUAccountTeamFrm.bIs_Lookup := True;
    PBLUAccountTeamFrm.bAllow_Upd := True;
    PBLUAccountTeamFrm.SelCode := dblkpTeam.Keyvalue;
    PBLUAccountTeamFrm.ShowModal;
    if PBLUAccountTeamFrm.Selected then
    begin
      GetAccountTeams;
      dblkpTeam.keyvalue := PBLUAccountTeamFrm.SelCode;
    end;
  finally
    PBLUAccountTeamFrm.Free;
  end;


end;

end.
