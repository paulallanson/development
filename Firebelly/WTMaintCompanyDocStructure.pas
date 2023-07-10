unit WTMaintCompanyDocStructure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, ComCtrls, DB, DBTables;

type
  TfrmWTMaintCompanyDocStructure = class(TForm)
    OkBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    lstNames: TListBox;
    lblDocuments: TLabel;
    mnuFunctions: TPopupMenu;
    mnuAdd: TMenuItem;
    mnuRename: TMenuItem;
    mnuDelete: TMenuItem;
    lstCodes: TListBox;
    qryDelete: TQuery;
    qryAdd: TQuery;
    qryGetNames: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure mnuAddClick(Sender: TObject);
    procedure mnuRenameClick(Sender: TObject);
    procedure mnuFunctionsPopup(Sender: TObject);
    procedure OkBitBtnClick(Sender: TObject);
    procedure mnuDeleteClick(Sender: TObject);
  private
    bChanged: boolean;
    FModule: integer;
    procedure SetModule(const Value: integer);
    procedure CallMaintScreen(FuncMode: string);
    procedure AddNames;
    procedure DeleteNames;
    procedure ShowNames;
    { Private declarations }
  public
    { Public declarations }
    property Module: integer read FModule write SetModule;
  end;

var
  frmWTMaintCompanyDocStructure: TfrmWTMaintCompanyDocStructure;

implementation

uses WTMaintCompanyDocName, wtDataModule;

{$R *.dfm}

procedure TfrmWTMaintCompanyDocStructure.FormActivate(Sender: TObject);
begin
  bChanged := false;
  lstNames.clear;
  lstCodes.Clear;
  ShowNames;
end;

procedure TfrmWTMaintCompanyDocStructure.SetModule(const Value: integer);
begin
  FModule := Value;
  case Module of
    10: lblDocuments.caption := 'Customer Documents';
    20: lblDocuments.caption := 'Supplier Documents';
    30: lblDocuments.caption := 'Quote Documents';
    40: lblDocuments.caption := 'Sales Order Documents';
    50: lblDocuments.caption := 'Job Documents';
    60: lblDocuments.caption := 'Contract Documents';
  end;
end;

procedure TfrmWTMaintCompanyDocStructure.CallMaintScreen(FuncMode: string);
var
  Key: integer;
begin

  frmWTMaintCompanyDocName :=  TfrmWTMaintCompanyDocName.create(self);
  try
    if FuncMode = 'A' then
      begin
        key := 0;
        frmWTMaintCompanyDocName.sName := '';
      end
    else
      begin
        key := lstNames.ItemIndex;
        frmWTMaintCompanyDocName.sName := lstNames.Items[key];
      end;

    frmWTMaintCompanyDocName.mode := FuncMode;
    frmWTMaintCompanyDocName.showmodal;
    if frmWTMaintCompanyDocName.bOK then
      begin
        bChanged := true;
        if key = 0 then
          lstNames.Items.add(frmWTMaintCompanyDocName.sName)
        else
          lstNames.Items[key] := frmWTMaintCompanyDocName.sName;
      end;
  finally
    frmWTMaintCompanyDocName.free
  end;

end;

procedure TfrmWTMaintCompanyDocStructure.mnuAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTMaintCompanyDocStructure.mnuRenameClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTMaintCompanyDocStructure.mnuFunctionsPopup(
  Sender: TObject);
begin
  mnuReName.enabled := (lstNames.Items.count > 0);
  mnuDelete.enabled := (lstNames.Items.count > 0);
end;

procedure TfrmWTMaintCompanyDocStructure.OkBitBtnClick(Sender: TObject);
begin
  if bChanged then
    begin
      DeleteNames;
      AddNames;
    end;
end;

procedure TfrmWTMaintCompanyDocStructure.ShowNames;
begin
  with qryGetNames do
    begin
      close;
      parambyname('Module_Id').asinteger := Module;
      open;

      first;

      while eof <> true do
        begin
          lstNames.items.add(fieldbyname('Folder_Name').asstring);
          next;
        end;
    end;
end;

procedure TfrmWTMaintCompanyDocStructure.DeleteNames;
begin
  with qryDelete do
    begin
      close;
      parambyname('Module_Id').asinteger := Module;
      execsql;
    end;
end;

procedure TfrmWTMaintCompanyDocStructure.AddNames;
var
  iCount: integer;
  sText: string;
begin
  for icount := 0 to pred(lstNames.items.count) do
    begin
      with qryAdd do
        begin
          close;
          if dtmdlWorktops.IsSQL then
            begin
              sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
              SQL.Text := sText;
            end;

          parambyname('Module_Id').asinteger := Module;
          parambyname('Folder_Name').asstring := lstNames.items[icount] ;
          execsql;
        end;
    end;
end;

procedure TfrmWTMaintCompanyDocStructure.mnuDeleteClick(Sender: TObject);
var
  key: integer;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      key := lstNames.itemindex;
      try
        lstNames.Items.Delete(key);
        bChanged := true;
      except
        messagedlg(lstNames.Items[key] + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;

end;

end.
