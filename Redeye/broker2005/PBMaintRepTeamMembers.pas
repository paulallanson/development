unit PBMaintRepTeamMembers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBCtrls, DBTables;

type
  TfrmPBMaintRepTeamMembers = class(TForm)
    Label2: TLabel;
    Panel2: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Panel1: TPanel;
    Label3: TLabel;
    lblDetails: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    lstbxReps: TListBox;
    lstbxRepsCodes: TListBox;
    Label6: TLabel;
    lstbxNonReps: TListBox;
    lstbxNonRepsCodes: TListBox;
    btnAddRep: TBitBtn;
    btnRemoveRep: TBitBtn;
    qryReps: TQuery;
    qryDeleteReps: TQuery;
    qryAddReps: TQuery;
    qryNonReps: TQuery;
    qryDummyRep: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnAddRepClick(Sender: TObject);
    procedure btnRemoveRepClick(Sender: TObject);
    procedure lstbxRepsClick(Sender: TObject);
    procedure lstbxNonRepsClick(Sender: TObject);
    procedure lstbxNonRepsDblClick(Sender: TObject);
    procedure lstbxRepsDblClick(Sender: TObject);
  private
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
  frmPBMaintRepTeamMembers: TfrmPBMaintRepTeamMembers;

implementation

{$R *.dfm}

procedure TfrmPBMaintRepTeamMembers.FormActivate(Sender: TObject);
begin
  lblDetails.caption := teamName;

  {Display the Reps}
  RefreshRepData;
  RefreshNonRepData;
end;

procedure TfrmPBMaintRepTeamMembers.btnOKClick(Sender: TObject);
begin
  SaveRepstoDB
end;

procedure TfrmPBMaintRepTeamMembers.SaveRepsToDB;
var
  i: integer;
begin
  DeleteRepsFromDB;

  for i := 0 to pred(lstbxReps.items.count) do
    begin
      with qryAddReps do
      begin
        close;
        parambyname('Rep_Team').asinteger := TeamCode;
        parambyname('Rep').asinteger := strtoint(lstbxRepsCodes.items[i]);
        execsql;
      end;
    end;
end;

procedure TfrmPBMaintRepTeamMembers.DeleteRepsFromDB;
begin
  with qryDeleteReps do
    begin
      close;
      parambyname('Rep_Team').asinteger := teamCode;
      execsql;
    end;
end;

procedure TfrmPBMaintRepTeamMembers.RefreshRepData;
begin
  with qryReps do
    begin
      close;
      parambyname('Rep_Team').asinteger := teamCode;
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

procedure TfrmPBMaintRepTeamMembers.RefreshNonRepData;
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
      sql.add('Rep.Rep not in (select Rep_team_Member.Rep from Rep_team_Member ');
      sql.add('where Rep_team_Member.Rep_Team <> ' + inttostr(teamCode) + ')');
      sql.Add('ORDER BY Rep.Name');
      open;
      while eof <> true do
        begin
          lstbxNonReps.Items.Add(fieldbyname('Rep_Name').asstring);
          lstbxNonRepsCodes.Items.Add(fieldbyname('Rep').asstring);
          next;
        end;
    end;
end;

procedure TfrmPBMaintRepTeamMembers.btnAddRepClick(Sender: TObject);
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

procedure TfrmPBMaintRepTeamMembers.btnRemoveRepClick(Sender: TObject);
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

procedure TfrmPBMaintRepTeamMembers.lstbxRepsClick(Sender: TObject);
begin
  btnRemoveRep.enabled := (lstbxReps.SelCount > 0);
  btnAddRep.enabled := false;
end;

procedure TfrmPBMaintRepTeamMembers.lstbxNonRepsClick(Sender: TObject);
begin
  btnAddRep.enabled := (lstbxNonReps.SelCount > 0);
  btnRemoveRep.enabled := false;

end;

procedure TfrmPBMaintRepTeamMembers.lstbxNonRepsDblClick(Sender: TObject);
begin
  btnAddRepClick(self);
end;

procedure TfrmPBMaintRepTeamMembers.lstbxRepsDblClick(Sender: TObject);
begin
  btnRemoveRepClick(self);
end;

end.
