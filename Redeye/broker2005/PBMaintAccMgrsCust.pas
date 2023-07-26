unit PBMaintAccMgrsCust;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintAccMgrsCustFrm = class(TForm)
    lstbxMembers: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    lstbxNonMembers: TListBox;
    Panel2: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    qryCustomers: TFDQuery;
    dtsCustomers: TDataSource;
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
    AccMgrCode: integer;
    AccMgrName: string;
  end;

var
  PBMaintAccMgrsCustFrm: TPBMaintAccMgrsCustFrm;

implementation

{$R *.dfm}

procedure TPBMaintAccMgrsCustFrm.FormActivate(Sender: TObject);
begin
  lblDetails.caption := AccMgrName;
  RefreshData;
  RefreshNonMemberData;
end;

procedure TPBMaintAccMgrsCustFrm.btnOKClick(Sender: TObject);
begin
  SavetoDB;
end;

procedure TPBMaintAccMgrsCustFrm.SaveToDB;
var
  i: integer;
begin
  DeleteFromDB;

  for i := 0 to pred(lstbxMembers.items.count) do
    begin
      with qryAdd do
      begin
        close;
        parambyname('Operator').asinteger := AccMgrCode;
        parambyname('Customer').asinteger := strtoint(lstbxMembersCodes.items[i]);
        parambyname('Is_Main_Operator').asstring := 'N';
        execsql;
      end;
    end;
end;

procedure TPBMaintAccMgrsCustFrm.DeleteFromDB;
var
  i: integer;
begin
  with qryDelete do
    begin
      close;
      parambyname('Operator').asinteger := AccMgrCode;
      execsql;
    end;
end;

procedure TPBMaintAccMgrsCustFrm.RefreshData;
begin
  with qryMembers do
    begin
      close;
      parambyname('Operator').asinteger := AccMgrCode;
      open;
      lstbxMembers.clear;

      while eof <> true do
        begin
          lstbxMembers.Items.add(fieldbyname('Customer_Name').asstring);
          lstbxMembersCodes.Items.add(fieldbyname('Customer').asstring);
          next;
        end;
    end;
end;

procedure TPBMaintAccMgrsCustFrm.RefreshNonMemberData;
var
  i: integer;
begin
  lstbxNonMembers.clear;
  lstbxNonMembersCodes.clear;

  with qryCustomers do
    begin
      close;
      sql.clear;
      sql.text := qryDummy.sql.text;
      sql.add(' AND Customer.Customer NOT IN ');
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
      sql.Add('ORDER BY Customer_Name');
      open;
      while eof <> true do
        begin
          lstbxNonMembers.Items.Add(fieldbyname('Customer_Name').asstring);
          lstbxNonMembersCodes.Items.Add(fieldbyname('Customer').asstring);
          next;
        end;
    end;

end;

procedure TPBMaintAccMgrsCustFrm.btnAddClick(Sender: TObject);
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

procedure TPBMaintAccMgrsCustFrm.lstbxNonMembersClick(
  Sender: TObject);
begin
  btnAdd.enabled := (lstbxNonMembers.SelCount > 0);
  btnRemove.enabled := false;
end;

procedure TPBMaintAccMgrsCustFrm.lstbxMembersClick(
  Sender: TObject);
begin
  btnRemove.enabled := (lstbxMembers.SelCount > 0);
  btnAdd.enabled := false;
end;

procedure TPBMaintAccMgrsCustFrm.btnRemoveClick(Sender: TObject);
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

procedure TPBMaintAccMgrsCustFrm.lstbxNonMembersDblClick(Sender: TObject);
begin
  btnAddClick(self);
end;

procedure TPBMaintAccMgrsCustFrm.lstbxMembersDblClick(Sender: TObject);
begin
  btnRemoveClick(self);
end;

end.
