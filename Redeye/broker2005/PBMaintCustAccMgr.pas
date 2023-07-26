unit PBMaintCustAccMgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintCustAccMgrFrm = class(TForm)
    lstbxMembers: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    lstbxNonMembers: TListBox;
    Panel2: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    qryAccMgrs: TFDQuery;
    dtsAccMgrs: TDataSource;
    lstbxMembersCodes: TListBox;
    lstbxNonMembersCodes: TListBox;
    Label3: TLabel;
    lblDetails: TLabel;
    qryAdd: TFDQuery;
    qryDummy: TFDQuery;
    qryMembers: TFDQuery;
    qryDelete: TFDQuery;
    Label4: TLabel;
    qryDummyOps: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure lstbxNonMembersClick(Sender: TObject);
    procedure lstbxMembersClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure lstbxNonMembersDblClick(Sender: TObject);
    procedure lstbxMembersDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SaveToDB;
    procedure DeleteFromDB;
    procedure RefreshData;
    procedure RefreshNonMemberData;
    { Private declarations }
  public
    bOK: boolean;
    bRefresh: boolean;
    CustomerCode: integer;
    CustomerName: string;
  end;

var
  PBMaintCustAccMgrFrm: TPBMaintCustAccMgrFrm;

implementation

uses pbDatabase;

{$R *.dfm}

procedure TPBMaintCustAccMgrFrm.FormActivate(Sender: TObject);
begin
  lblDetails.caption := CustomerName;
  RefreshData;
  RefreshNonMemberData;
end;

procedure TPBMaintCustAccMgrFrm.btnOKClick(Sender: TObject);
begin
  SavetoDB;
end;

procedure TPBMaintCustAccMgrFrm.SaveToDB;
var
  i: integer;
begin
  bOK := true;
  DeleteFromDB;

  for i := 0 to pred(lstbxMembers.items.count) do
    begin
      with qryAdd do
      begin
        close;
        parambyname('Customer').asinteger := CustomerCode;
        parambyname('Operator').asinteger := strtoint(lstbxMembersCodes.items[i]);
        if i = 0 then
          parambyname('Is_Main_Operator').asstring := 'Y'
        else
          parambyname('Is_Main_Operator').asstring := 'N';
        execsql;
      end;
    end;
end;

procedure TPBMaintCustAccMgrFrm.DeleteFromDB;
var
  i: integer;
begin
  with qryDelete do
    begin
      close;
      parambyname('Customer').asinteger := CustomerCode;
      execsql;
    end;
end;

procedure TPBMaintCustAccMgrFrm.RefreshData;
begin
  with qryMembers do
    begin
      close;
      parambyname('Customer').asinteger := CustomerCode;
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

procedure TPBMaintCustAccMgrFrm.RefreshNonMemberData;
var
  i: integer;
begin
  lstbxNonMembers.clear;
  lstbxNonMembersCodes.clear;

  with qryAccMgrs do
    begin
      close;
      sql.clear;
      if dmBroker.UseAccountManagers then
        sql.text := qryDummy.sql.text
      else
        sql.text := qryDummyOps.sql.text;

      sql.add(' AND Operator.Operator NOT IN ');
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
      sql.Add('ORDER BY Operator_Name');
      open;
      while eof <> true do
        begin
          lstbxNonMembers.Items.Add(fieldbyname('Operator_Name').asstring);
          lstbxNonMembersCodes.Items.Add(fieldbyname('Operator').asstring);
          next;
        end;
    end;

end;

procedure TPBMaintCustAccMgrFrm.btnAddClick(Sender: TObject);
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
  bRefresh := true;
end;

procedure TPBMaintCustAccMgrFrm.lstbxNonMembersClick(
  Sender: TObject);
begin
  btnAdd.enabled := (lstbxNonMembers.SelCount > 0);
  btnRemove.enabled := false;
end;

procedure TPBMaintCustAccMgrFrm.lstbxMembersClick(
  Sender: TObject);
begin
  btnRemove.enabled := (lstbxMembers.SelCount > 0);
  btnAdd.enabled := false;
end;

procedure TPBMaintCustAccMgrFrm.btnRemoveClick(Sender: TObject);
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
  bRefresh := true;
end;

procedure TPBMaintCustAccMgrFrm.lstbxNonMembersDblClick(Sender: TObject);
begin
  btnAddClick(self);
end;

procedure TPBMaintCustAccMgrFrm.lstbxMembersDblClick(Sender: TObject);
begin
  btnRemoveClick(self);
end;

procedure TPBMaintCustAccMgrFrm.FormCreate(Sender: TObject);
begin
  bOK := false;
  bRefresh := false;
end;

end.
