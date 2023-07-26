unit PBMaintNonConformOps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintNonConformOpsFrm = class(TForm)
    lstbxMembers: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    lstbxNonMembers: TListBox;
    Panel2: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    qryOperators: TFDQuery;
    dtsOperators: TDataSource;
    lstbxMembersCodes: TListBox;
    lstbxNonMembersCodes: TListBox;
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
    CustomerCode: integer;
    CustomerName: string;
  end;

var
  PBMaintNonConformOpsFrm: TPBMaintNonConformOpsFrm;

implementation

uses pbDatabase;

{$R *.dfm}

procedure TPBMaintNonConformOpsFrm.FormActivate(Sender: TObject);
begin
  RefreshData;
  RefreshNonMemberData;
end;

procedure TPBMaintNonConformOpsFrm.btnOKClick(Sender: TObject);
begin
  SavetoDB;
end;

procedure TPBMaintNonConformOpsFrm.SaveToDB;
var
  i: integer;
begin
  DeleteFromDB;

  for i := 0 to pred(lstbxMembers.items.count) do
    begin
      with qryAdd do
      begin
        close;
        parambyname('Operator').asinteger := strtoint(lstbxMembersCodes.items[i]);
//        parambyname('Inactive').asstring := 'N';
        execsql;
      end;
    end;
end;

procedure TPBMaintNonConformOpsFrm.DeleteFromDB;
var
  i: integer;
begin
  with qryDelete do
    begin
      close;
      execsql;
    end;
end;

procedure TPBMaintNonConformOpsFrm.RefreshData;
begin
  with qryMembers do
    begin
      close;
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

procedure TPBMaintNonConformOpsFrm.RefreshNonMemberData;
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

      sql.add(' AND Operator.Operator NOT IN ');
      sql.add('(0');
      for i := 0 to pred(lstbxMembersCodes.items.count) do
        begin
          sql.add(', ' + lstbxMembersCodes.items[i]);
        end;
      sql.add(')');
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

procedure TPBMaintNonConformOpsFrm.btnAddClick(Sender: TObject);
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

procedure TPBMaintNonConformOpsFrm.lstbxNonMembersClick(
  Sender: TObject);
begin
  btnAdd.enabled := (lstbxNonMembers.SelCount > 0);
  btnRemove.enabled := false;
end;

procedure TPBMaintNonConformOpsFrm.lstbxMembersClick(
  Sender: TObject);
begin
  btnRemove.enabled := (lstbxMembers.SelCount > 0);
  btnAdd.enabled := false;
end;

procedure TPBMaintNonConformOpsFrm.btnRemoveClick(Sender: TObject);
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

procedure TPBMaintNonConformOpsFrm.lstbxNonMembersDblClick(Sender: TObject);
begin
  btnAddClick(self);
end;

procedure TPBMaintNonConformOpsFrm.lstbxMembersDblClick(Sender: TObject);
begin
  btnRemoveClick(self);
end;

end.
