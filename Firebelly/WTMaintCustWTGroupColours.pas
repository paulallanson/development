unit WTMaintCustWTGroupColours;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, DBTables;

type
  TfrmWTMaintCustWTGroupColours = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    lblGroupName: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    lstbxMembers: TListBox;
    lstbxMembersCodes: TListBox;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    lstbxNonMembers: TListBox;
    lstbxNonMembersCodes: TListBox;
    Panel2: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    lblMaterialType: TLabel;
    qryDelete: TQuery;
    qryAdd: TQuery;
    qryMembers: TQuery;
    qryNonMembers: TQuery;
    dtsNonMembers: TDataSource;
    qryDummy: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure lstbxNonMembersClick(Sender: TObject);
    procedure lstbxMembersClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure lstbxNonMembersDblClick(Sender: TObject);
    procedure lstbxMembersDblClick(Sender: TObject);
  private
    FGroupName: string;
    FMaterialType: integer;
    FCustomer: integer;
    FGroupCode: integer;
    FMaterialTypeName: string;
    procedure SetGroupName(const Value: string);
    procedure SetMaterialType(const Value: integer);
    procedure DeleteFromDB;
    procedure SaveToDB;
    procedure RefreshData;
    procedure RefreshNonMemberData;
    procedure SetCustomer(const Value: integer);
    procedure SetGroupCode(const Value: integer);
    procedure SetMaterialTypeName(const Value: string);
    { Private declarations }
  public
    property Customer: integer read FCustomer write SetCustomer;
    property GroupCode: integer read FGroupCode write SetGroupCode;
    property GroupName: string read FGroupName write SetGroupName;
    property MaterialType: integer read FMaterialType write SetMaterialType;
    property MaterialTypeName: string read FMaterialTypeName write SetMaterialTypeName;
  end;

var
  frmWTMaintCustWTGroupColours: TfrmWTMaintCustWTGroupColours;

implementation

{$R *.dfm}

procedure TfrmWTMaintCustWTGroupColours.FormActivate(Sender: TObject);
begin
  {Display the colours}
  RefreshData;
  RefreshNonMemberData;
end;

procedure TfrmWTMaintCustWTGroupColours.SetGroupName(const Value: string);
begin
  FGroupName := Value;
  lblGroupName.caption := FGroupName;
end;

procedure TfrmWTMaintCustWTGroupColours.SetMaterialType(
  const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintCustWTGroupColours.btnOKClick(Sender: TObject);
begin
  SavetoDB;
end;

procedure TfrmWTMaintCustWTGroupColours.SaveToDB;
var
  i: integer;
begin
  DeleteFromDB;

  for i := 0 to pred(lstbxMembers.items.count) do
    begin
      with qryAdd do
      begin
        close;
        parambyname('Customer').asinteger := Customer;
        parambyname('Group_Number').asinteger := GroupCode;
        parambyname('Worktop').asinteger := strtoint(lstbxMembersCodes.items[i]);
        execsql;
      end;
    end;
end;

procedure TfrmWTMaintCustWTGroupColours.DeleteFromDB;
begin
  with qryDelete do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Group_Number').asinteger := GroupCode;
      execsql;
    end;
end;

procedure TfrmWTMaintCustWTGroupColours.RefreshData;
begin
  with qryMembers do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Group_Number').asinteger := GroupCode;
      open;
      lstbxMembers.clear;

      while eof <> true do
        begin
          lstbxMembers.Items.add(fieldbyname('Worktop_Description').asstring);
          lstbxMembersCodes.Items.add(fieldbyname('Worktop').asstring);
          next;
        end;
    end;
end;

procedure TfrmWTMaintCustWTGroupColours.RefreshNonMemberData;
var
  i: integer;
begin
  lstbxNonMembers.clear;
  lstbxNonMembersCodes.clear;

  with qryNonMembers do
    begin
      close;
      sql.clear;
      sql.text := qryDummy.sql.text;
      sql.add('AND Worktop.Worktop NOT IN ');
      sql.add('(0');
      for i := 0 to pred(lstbxMembersCodes.items.count) do
        begin
          sql.add(', ' + lstbxMembersCodes.items[i]);
        end;
      sql.add(')');
      sql.add(' and ');
      sql.add('Worktop.Worktop not in (select Worktop from Customer_Worktop ');
      sql.add('where Customer = ' + inttostr(Customer) + ' AND Group_Number = ' + inttostr(GroupCode) + ')');
      sql.Add('ORDER BY Worktop.Description');
      parambyname('Material_Type').asinteger := MaterialType;
      open;
      while eof <> true do
        begin
          lstbxNonMembers.Items.Add(fieldbyname('Worktop_Description').asstring);
          lstbxNonMembersCodes.Items.Add(fieldbyname('Worktop').asstring);
          next;
        end;
    end;

end;

procedure TfrmWTMaintCustWTGroupColours.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmWTMaintCustWTGroupColours.SetGroupCode(const Value: integer);
begin
  FGroupCode := Value;
end;

procedure TfrmWTMaintCustWTGroupColours.SetMaterialTypeName(
  const Value: string);
begin
  FMaterialTypeName := Value;
  lblMaterialType.caption := FMaterialTypeName;
end;

procedure TfrmWTMaintCustWTGroupColours.btnAddClick(Sender: TObject);
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

procedure TfrmWTMaintCustWTGroupColours.lstbxNonMembersClick(
  Sender: TObject);
begin
  btnAdd.enabled := (lstbxNonMembers.SelCount > 0);
  btnRemove.enabled := false;
end;

procedure TfrmWTMaintCustWTGroupColours.lstbxMembersClick(Sender: TObject);
begin
  btnRemove.enabled := (lstbxMembers.SelCount > 0);
  btnAdd.enabled := false;

end;

procedure TfrmWTMaintCustWTGroupColours.btnRemoveClick(Sender: TObject);
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

procedure TfrmWTMaintCustWTGroupColours.lstbxNonMembersDblClick(
  Sender: TObject);
begin
  btnAddClick(self);
end;

procedure TfrmWTMaintCustWTGroupColours.lstbxMembersDblClick(
  Sender: TObject);
begin
  btnRemoveClick(self);
end;

end.
