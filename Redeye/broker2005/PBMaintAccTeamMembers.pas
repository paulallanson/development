unit PBMaintAccTeamMembers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBCtrls, DBTables;

type
  TfrmPBMaintAccTeamMembers = class(TForm)
    Label2: TLabel;
    Panel2: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    qryOperators: TQuery;
    dtsOperators: TDataSource;
    qryAdd: TQuery;
    qryDummy: TQuery;
    qryMembers: TQuery;
    qryDelete: TQuery;
    Panel1: TPanel;
    Label3: TLabel;
    lblDetails: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    lstbxMembers: TListBox;
    lstbxMembersCodes: TListBox;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    lstbxNonMembers: TListBox;
    Label4: TLabel;
    lstbxNonMembersCodes: TListBox;
    Panel4: TPanel;
    Label5: TLabel;
    lstbxReps: TListBox;
    lstbxRepsCodes: TListBox;
    Label6: TLabel;
    lstbxNonReps: TListBox;
    lstbxNonRepsCodes: TListBox;
    qryReps: TQuery;
    qryNonReps: TQuery;
    qryDummyRep: TQuery;
    btnAddRep: TBitBtn;
    btnRemoveRep: TBitBtn;
    qryDeleteReps: TQuery;
    qryAddReps: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure lstbxNonMembersClick(Sender: TObject);
    procedure lstbxMembersClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnAddRepClick(Sender: TObject);
    procedure btnRemoveRepClick(Sender: TObject);
    procedure lstbxRepsClick(Sender: TObject);
    procedure lstbxNonRepsClick(Sender: TObject);
  private
    procedure SaveToDB;
    procedure DeleteFromDB;
    procedure RefreshData;
    procedure RefreshNonMemberData;
    procedure RefreshRepData;
    procedure RefreshNonRepData;
    procedure SaveRepsToDB;
    procedure DeleteRepsFromDB;
    { Private declarations }
  public
    TeamCode: integer;
    TeamName: string;
  end;

var
  frmPBMaintAccTeamMembers: TfrmPBMaintAccTeamMembers;

implementation

{$R *.dfm}

procedure TfrmPBMaintAccTeamMembers.FormActivate(Sender: TObject);
begin
  lblDetails.caption := teamName;

  {Display the Account Managers}
  RefreshData;
  RefreshNonMemberData;

  {Display the Reps}
  RefreshRepData;
  RefreshNonRepData;
end;

procedure TfrmPBMaintAccTeamMembers.btnOKClick(Sender: TObject);
begin
  SavetoDB;
  SaveRepstoDB
end;

procedure TfrmPBMaintAccTeamMembers.SaveToDB;
var
  i: integer;
begin
  DeleteFromDB;

  for i := 0 to pred(lstbxMembers.items.count) do
    begin
      with qryAdd do
      begin
        close;
        parambyname('Account_Team').asinteger := TeamCode;
        parambyname('Member_no').asinteger := i+1;
        parambyname('Operator').asinteger := strtoint(lstbxMembersCodes.items[i]);
        execsql;
      end;
    end;
end;

procedure TfrmPBMaintAccTeamMembers.DeleteFromDB;
var
  i: integer;
begin
  with qryDelete do
    begin
      close;
      parambyname('Account_Team').asinteger := teamCode;
      execsql;
    end;
end;

procedure TfrmPBMaintAccTeamMembers.SaveRepsToDB;
var
  i: integer;
begin
  DeleteRepsFromDB;

  for i := 0 to pred(lstbxReps.items.count) do
    begin
      with qryAddReps do
      begin
        close;
        parambyname('Account_Team').asinteger := TeamCode;
        parambyname('Rep_no').asinteger := i+1;
        parambyname('Rep').asinteger := strtoint(lstbxRepsCodes.items[i]);
        execsql;
      end;
    end;
end;

procedure TfrmPBMaintAccTeamMembers.DeleteRepsFromDB;
var
  i: integer;
begin
  with qryDeleteReps do
    begin
      close;
      parambyname('Account_Team').asinteger := teamCode;
      execsql;
    end;
end;

procedure TfrmPBMaintAccTeamMembers.RefreshData;
begin
  with qryMembers do
    begin
      close;
      parambyname('Account_Team').asinteger := teamCode;
      open;
      lstbxMembers.clear;

      while eof <> true do
        begin
          lstbxMembers.Items.add(fieldbyname('Operator_Name').asstring);
          lstbxMembersCodes.Items.add(fieldbyname('Operator').asstring);
          next;
        end;
    end;
end;

procedure TfrmPBMaintAccTeamMembers.RefreshRepData;
begin
  with qryReps do
    begin
      close;
      parambyname('Account_Team').asinteger := teamCode;
      open;
      lstbxReps.clear;

      while eof <> true do
        begin
          lstbxReps.Items.add(fieldbyname('Rep_Name').asstring);
          lstbxRepsCodes.Items.add(fieldbyname('Rep').asstring);
          next;
        end;
    end;
end;

procedure TfrmPBMaintAccTeamMembers.RefreshNonMemberData;
var
  i: integer;
begin
  lstbxNonMembers.clear;
  lstbxNonMembersCodes.clear;

  with qryOperators do
    begin
      close;
      sql.clear;
      sql.text := qryDummy.sql.text;
      sql.add('AND User_Group_Operator.Operator NOT IN ');
      sql.add('(0');
      for i := 0 to pred(lstbxMembersCodes.items.count) do
        begin
          sql.add(', ' + lstbxMembersCodes.items[i]);
        end;
      sql.add(')');
      sql.add(' and ');
      sql.add('User_Group_Operator.Operator not in (select operator from account_team_member ');
      sql.add('where account_team <> ' + inttostr(teamCode) + ')');
      sql.Add('ORDER BY Name');
      open;
      while eof <> true do
        begin
          lstbxNonMembers.Items.Add(fieldbyname('Operator_Name').asstring);
          lstbxNonMembersCodes.Items.Add(fieldbyname('Operator').asstring);
          next;
        end;
    end;

end;

procedure TfrmPBMaintAccTeamMembers.RefreshNonRepData;
var
  i: integer;
begin
  lstbxNonReps.clear;
  lstbxNonRepsCodes.clear;

  with qryNonReps do
    begin
      close;
      sql.clear;
      sql.text := qryDummyRep.sql.text;
      sql.add(' AND Rep.Rep NOT IN ');
      sql.add('(0');
      for i := 0 to pred(lstbxRepsCodes.items.count) do
        begin
          sql.add(', ' + lstbxRepsCodes.items[i]);
        end;
      sql.add(')');
      sql.add(' and ');
      sql.add('Rep.Rep not in (select Rep from account_team_rep ');
      sql.add('where account_team <> ' + inttostr(teamCode) + ')');
      sql.Add('ORDER BY Name');
      open;
      while eof <> true do
        begin
          lstbxNonReps.Items.Add(fieldbyname('Rep_Name').asstring);
          lstbxNonRepsCodes.Items.Add(fieldbyname('Rep').asstring);
          next;
        end;
    end;
end;

procedure TfrmPBMaintAccTeamMembers.btnAddClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pred(lstbxNonMembers.items.count) do
    begin
      if lstbxNonMembers.Selected[i] then
        begin
          lstbxMembers.Items.Add(lstbxNonMembers.items[i]);
          lstbxMembersCodes.Items.Add(lstbxNonMembersCodes.items[i]);
        end;
    end;
  RefreshNonMemberData;
end;

procedure TfrmPBMaintAccTeamMembers.lstbxNonMembersClick(
  Sender: TObject);
begin
  btnAdd.enabled := (lstbxNonMembers.SelCount > 0);
  btnRemove.enabled := false;
end;

procedure TfrmPBMaintAccTeamMembers.lstbxMembersClick(
  Sender: TObject);
begin
  btnRemove.enabled := (lstbxMembers.SelCount > 0);
  btnAdd.enabled := false;
end;

procedure TfrmPBMaintAccTeamMembers.btnRemoveClick(Sender: TObject);
var
  i: integer;
begin
  for i := pred(lstbxMembers.items.count) downto 0 do
    begin
      if lstbxMembers.Selected[i] then
        begin
          lstbxMembers.Items.Delete(i);
          lstbxMembersCodes.Items.Delete(i);
        end;
    end;
  RefreshNonMemberData;
end;

procedure TfrmPBMaintAccTeamMembers.btnAddRepClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pred(lstbxNonReps.items.count) do
    begin
      if lstbxNonReps.Selected[i] then
        begin
          lstbxReps.Items.Add(lstbxNonReps.items[i]);
          lstbxRepsCodes.Items.Add(lstbxNonRepsCodes.items[i]);
        end;
    end;
  RefreshNonRepData;
end;

procedure TfrmPBMaintAccTeamMembers.btnRemoveRepClick(Sender: TObject);
var
  i: integer;
begin
  for i := pred(lstbxReps.items.count) downto 0 do
    begin
      if lstbxReps.Selected[i] then
        begin
          lstbxReps.Items.Delete(i);
          lstbxRepsCodes.Items.Delete(i);
        end;
    end;
  RefreshNonRepData;
end;

procedure TfrmPBMaintAccTeamMembers.lstbxRepsClick(Sender: TObject);
begin
  btnRemoveRep.enabled := (lstbxReps.SelCount > 0);
  btnAddRep.enabled := false;
end;

procedure TfrmPBMaintAccTeamMembers.lstbxNonRepsClick(Sender: TObject);
begin
  btnAddRep.enabled := (lstbxNonReps.SelCount > 0);
  btnRemoveRep.enabled := false;

end;

end.
