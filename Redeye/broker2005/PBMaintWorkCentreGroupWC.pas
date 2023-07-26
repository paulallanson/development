unit PBMaintWorkCentreGroupWC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintWorkCentreGroupWCFrm = class(TForm)
    lstbxMembers: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    lstbxNonMembers: TListBox;
    Panel2: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    qryWorkCentres: TFDQuery;
    dtsWCGroups: TDataSource;
    lstbxMembersCodes: TListBox;
    lstbxNonMembersCodes: TListBox;
    Label3: TLabel;
    lblDetails: TLabel;
    qryAdd: TFDQuery;
    qryDummy: TFDQuery;
    qryMembers: TFDQuery;
    qryDelete: TFDQuery;
    Label4: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure lstbxNonMembersClick(Sender: TObject);
    procedure lstbxMembersClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure lstbxNonMembersDblClick(Sender: TObject);
    procedure lstbxMembersDblClick(Sender: TObject);
  private
    procedure SaveToDB;
    procedure DeleteFromDB;
    procedure RefreshData;
    procedure RefreshNonMemberData;
    { Private declarations }
  public
    WCGroupCode: integer;
    WCGroupName: string;
  end;

var
  PBMaintWorkCentreGroupWCFrm: TPBMaintWorkCentreGroupWCFrm;

implementation

{$R *.dfm}

procedure TPBMaintWorkCentreGroupWCFrm.FormActivate(Sender: TObject);
begin
  lblDetails.caption := WCGroupName;
  RefreshData;
  RefreshNonMemberData;
end;

procedure TPBMaintWorkCentreGroupWCFrm.btnOKClick(Sender: TObject);
begin
  SavetoDB;
end;

procedure TPBMaintWorkCentreGroupWCFrm.SaveToDB;
var
  i: integer;
begin
  DeleteFromDB;

  for i := 0 to pred(lstbxMembers.items.count) do
    begin
      with qryAdd do
      begin
        close;
        parambyname('Work_Centre_Group').asinteger := WCGroupCode;
        parambyname('Work_Centre').asinteger := strtoint(lstbxMembersCodes.items[i]);
        parambyname('Inactive').asstring := 'N';
        execsql;
      end;
    end;
end;

procedure TPBMaintWorkCentreGroupWCFrm.DeleteFromDB;
var
  i: integer;
begin
  with qryDelete do
    begin
      close;
      parambyname('Work_Centre_Group').asinteger := WCGroupCode;
      execsql;
    end;
end;

procedure TPBMaintWorkCentreGroupWCFrm.RefreshData;
begin
  with qryMembers do
    begin
      close;
      parambyname('Work_Centre_Group').asinteger := WCGroupCode;
      open;
      lstbxMembers.clear;

      while eof <> true do
        begin
          lstbxMembers.Items.add(fieldbyname('Work_Centre_Name').asstring);
          lstbxMembersCodes.Items.add(fieldbyname('Work_Centre').asstring);
          next;
        end;
    end;
end;

procedure TPBMaintWorkCentreGroupWCFrm.RefreshNonMemberData;
var
  i: integer;
begin
  lstbxNonMembers.clear;
  lstbxNonMembersCodes.clear;

  with qryWorkCentres do
    begin
      close;
      sql.clear;
      sql.text := qryDummy.sql.text;
      sql.add(' AND Work_Centre.Work_Centre NOT IN ');
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
      sql.Add('ORDER BY Work_Centre_Name');
      open;
      while eof <> true do
        begin
          lstbxNonMembers.Items.Add(fieldbyname('Work_Centre_Name').asstring);
          lstbxNonMembersCodes.Items.Add(fieldbyname('Work_Centre').asstring);
          next;
        end;
    end;

end;

procedure TPBMaintWorkCentreGroupWCFrm.btnAddClick(Sender: TObject);
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

procedure TPBMaintWorkCentreGroupWCFrm.lstbxNonMembersClick(
  Sender: TObject);
begin
  btnAdd.enabled := (lstbxNonMembers.SelCount > 0);
  btnRemove.enabled := false;
end;

procedure TPBMaintWorkCentreGroupWCFrm.lstbxMembersClick(
  Sender: TObject);
begin
  btnRemove.enabled := (lstbxMembers.SelCount > 0);
  btnAdd.enabled := false;
end;

procedure TPBMaintWorkCentreGroupWCFrm.btnRemoveClick(Sender: TObject);
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

procedure TPBMaintWorkCentreGroupWCFrm.lstbxNonMembersDblClick(
  Sender: TObject);
begin
  btnAddClick(self);
end;

procedure TPBMaintWorkCentreGroupWCFrm.lstbxMembersDblClick(
  Sender: TObject);
begin
  btnRemoveClick(self);
end;

end.
