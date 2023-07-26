unit PBMaintCompanyDocStructure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, ComCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintCompanyDocStructureFrm = class(TForm)
    OkBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    lstNames: TListBox;
    lblDocuments: TLabel;
    mnuFunctions: TPopupMenu;
    mnuAdd: TMenuItem;
    mnuRename: TMenuItem;
    mnuDelete: TMenuItem;
    lstCodes: TListBox;
    qryDelete: TFDQuery;
    qryAdd: TFDQuery;
    qryGetNames: TFDQuery;
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
  PBMaintCompanyDocStructureFrm: TPBMaintCompanyDocStructureFrm;

implementation

uses PBMaintCompanyDocName;

{$R *.dfm}

procedure TPBMaintCompanyDocStructureFrm.FormActivate(Sender: TObject);
begin
  bChanged := false;
  lstNames.clear;
  lstCodes.Clear;
  ShowNames;
end;

procedure TPBMaintCompanyDocStructureFrm.SetModule(const Value: integer);
begin
  FModule := Value;
  case Module of
    10: lblDocuments.caption := 'Customer Documents';
    15: lblDocuments.caption := 'Supplier Documents';
    20: lblDocuments.caption := 'Enquiry Documents';
    25: lblDocuments.caption := 'Quote Documents';
    30: lblDocuments.caption := 'Buy Print Documents';
    40: lblDocuments.caption := 'Job Documents';
    50: lblDocuments.caption := 'Prospect Documents';
    60: lblDocuments.caption := 'Activity Documents';
  end;
end;

procedure TPBMaintCompanyDocStructureFrm.CallMaintScreen(FuncMode: string);
var
  Key: integer;
begin

  PBMaintCompanyDocNameFrm :=  TPBMaintCompanyDocNameFrm.create(self);
  try
    if FuncMode = 'A' then
      begin
        key := 0;
        PBMaintCompanyDocNameFrm.sName := '';
      end
    else
      begin
        key := lstNames.ItemIndex;
        PBMaintCompanyDocNameFrm.sName := lstNames.Items[key];
      end;

    PBMaintCompanyDocNameFrm.mode := FuncMode;
    PBMaintCompanyDocNameFrm.showmodal;
    if PBMaintCompanyDocNameFrm.bOK then
      begin
        bChanged := true;
        if key = 0 then
          lstNames.Items.add(PBMaintCompanyDocNameFrm.sName)
        else
          lstNames.Items[key] := PBMaintCompanyDocNameFrm.sName;
      end;
  finally
    PBMaintCompanyDocNameFrm.free
  end;

end;

procedure TPBMaintCompanyDocStructureFrm.mnuAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TPBMaintCompanyDocStructureFrm.mnuRenameClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TPBMaintCompanyDocStructureFrm.mnuFunctionsPopup(
  Sender: TObject);
begin
  mnuReName.enabled := (lstNames.Items.count > 0);
  mnuDelete.enabled := (lstNames.Items.count > 0);
end;

procedure TPBMaintCompanyDocStructureFrm.OkBitBtnClick(Sender: TObject);
begin
  if bChanged then
    begin
      DeleteNames;
      AddNames;
    end;
end;

procedure TPBMaintCompanyDocStructureFrm.ShowNames;
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

procedure TPBMaintCompanyDocStructureFrm.DeleteNames;
begin
  with qryDelete do
    begin
      close;
      parambyname('Module_Id').asinteger := Module;
      execsql;
    end;
end;

procedure TPBMaintCompanyDocStructureFrm.AddNames;
var
  iCount: integer;
begin
  for icount := 0 to pred(lstNames.items.count) do
    begin
      with qryAdd do
        begin
          close;
          parambyname('Module_Id').asinteger := Module;
          parambyname('Folder_Name').asstring := lstNames.items[icount] ;
          execsql;
        end;
    end;
end;

procedure TPBMaintCompanyDocStructureFrm.mnuDeleteClick(Sender: TObject);
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
