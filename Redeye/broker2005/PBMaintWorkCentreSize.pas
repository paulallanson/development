unit PBMaintWorkCentreSize;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBCtrls, DBTables;

type
  TPBMaintWorkCentreSizeFrm = class(TForm)
    lstbxMembers: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    lstbxNonMembers: TListBox;
    Panel2: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    qryPaperSize: TQuery;
    dtsPaperSize: TDataSource;
    lstbxMembersCodes: TListBox;
    lstbxNonMembersCodes: TListBox;
    Label3: TLabel;
    lblDetails: TLabel;
    qryAdd: TQuery;
    qryDummy: TQuery;
    qryMembers: TQuery;
    qryDelete: TQuery;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure lstbxNonMembersClick(Sender: TObject);
    procedure lstbxMembersClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
  private
    procedure SaveToDB;
    procedure DeleteFromDB;
    procedure RefreshData;
    procedure RefreshNonMemberData;
    { Private declarations }
  public
    WCCode: integer;
    WCName: string;
  end;

var
  PBMaintWorkCentreSizeFrm: TPBMaintWorkCentreSizeFrm;

implementation

{$R *.dfm}

procedure TPBMaintWorkCentreSizeFrm.FormActivate(Sender: TObject);
begin
  lblDetails.caption := WCName;
  RefreshData;
  RefreshNonMemberData;
end;

procedure TPBMaintWorkCentreSizeFrm.btnOKClick(Sender: TObject);
begin
  SavetoDB;
end;

procedure TPBMaintWorkCentreSizeFrm.SaveToDB;
var
  i: integer;
begin
  DeleteFromDB;

  for i := 0 to pred(lstbxMembers.items.count) do
    begin
      with qryAdd do
      begin
        close;
        parambyname('Work_Centre').asinteger := WCCode;
        parambyname('Paper_Size').asinteger := strtoint(lstbxMembersCodes.items[i]);
        parambyname('Inactive').asstring := 'N';
        execsql;
      end;
    end;
end;

procedure TPBMaintWorkCentreSizeFrm.DeleteFromDB;
var
  i: integer;
begin
  with qryDelete do
    begin
      close;
      parambyname('Work_Centre').asinteger := WCCode;
      execsql;
    end;
end;

procedure TPBMaintWorkCentreSizeFrm.RefreshData;
begin
  with qryMembers do
    begin
      close;
      parambyname('Work_Centre').asinteger := WCCode;
      open;
      lstbxMembers.clear;

      while eof <> true do
        begin
          lstbxMembers.Items.add(fieldbyname('Description').asstring);
          lstbxMembersCodes.Items.add(fieldbyname('Paper_Size').asstring);
          next;
        end;
    end;
end;

procedure TPBMaintWorkCentreSizeFrm.RefreshNonMemberData;
var
  i: integer;
begin
  lstbxNonMembers.clear;
  lstbxNonMembersCodes.clear;

  with qryPaperSize do
    begin
      close;
      sql.clear;
      sql.text := qryDummy.sql.text;
      sql.add(' AND Paper_Size.Paper_Size NOT IN ');
      sql.add('(0');
      for i := 0 to pred(lstbxMembersCodes.items.count) do
        begin
          sql.add(', ' + lstbxMembersCodes.items[i]);
        end;
      sql.add(')');
(*      sql.add(' AND ');
      sql.add('Work_Centre_Group.Work_Centre_Group NOT IN (select Work_Centre_Group from Process_Work_Centre_Group ');
      sql.add('where Process <> ' + inttostr(ProcessCode) + ')');
*)
      sql.Add('ORDER BY Paper_Size.Description');
      open;
      while eof <> true do
        begin
          lstbxNonMembers.Items.Add(fieldbyname('Description').asstring);
          lstbxNonMembersCodes.Items.Add(fieldbyname('Paper_Size').asstring);
          next;
        end;
    end;

end;

procedure TPBMaintWorkCentreSizeFrm.btnAddClick(Sender: TObject);
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

procedure TPBMaintWorkCentreSizeFrm.lstbxNonMembersClick(
  Sender: TObject);
begin
  btnAdd.enabled := (lstbxNonMembers.SelCount > 0);
  btnRemove.enabled := false;
end;

procedure TPBMaintWorkCentreSizeFrm.lstbxMembersClick(
  Sender: TObject);
begin
  btnRemove.enabled := (lstbxMembers.SelCount > 0);
  btnAdd.enabled := false;
end;

procedure TPBMaintWorkCentreSizeFrm.btnRemoveClick(Sender: TObject);
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

end.
