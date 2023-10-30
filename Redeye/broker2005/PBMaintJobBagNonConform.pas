unit PBMaintJobBagNonConform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, Buttons, ExtCtrls, CCSCommon, Grids,
  PBJobBagDM;

type
  TPBMaintJobBagNonConformFrm = class(TForm)
    pnlTop: TPanel;
    labJobBagInfo: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label25: TLabel;
    edtJobBag: TEdit;
    edtDate: TEdit;
    edtDateReq: TEdit;
    edtStartDate: TEdit;
    stsbrDetails: TStatusBar;
    Panel2: TPanel;
    Panel4: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    edtCustomer: TEdit;
    edtDescription: TEdit;
    edtAccountManager: TEdit;
    edtRep: TEdit;
    sgDetails: TStringGrid;
    pnlFunctions: TPanel;
    btnAdd: TBitBtn;
    btnChange: TBitBtn;
    btnDelete: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure sgDetailsDblClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FActivated: boolean;
    FJobBag: TJobBag;
    FMode: TjbMode;
    procedure BuildNonConformGrid;
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure SetButtons;
    procedure ShowDetails;
    procedure ShowNonConformDetails;
    procedure SetJobBag(const Value: TJobBag);
    procedure CallMaintScreen(aMode: TjbncMode);
    procedure SetMode(const Value: TjbMode);
  public
    bOK: boolean;
    property JobBag : TJobBag read FJobBag write SetJobBag;
    property Mode: TjbMode read FMode write SetMode;
  end;

var
  PBMaintJobBagNonConformFrm: TPBMaintJobBagNonConformFrm;

implementation

uses UITypes, pbMainMenu, PBMaintJobBagNonConfDoc;

{$R *.dfm}

procedure TPBMaintJobBagNonConformFrm.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  {Invoice Line header}
  sgDetails.cells[0,0] := 'Doc';
  sgDetails.cells[1,0] := 'Reference';
  sgDetails.cells[2,0] := 'Date';
  sgDetails.cells[3,0] := 'Reason';
  sgDetails.cells[4,0] := 'Status';
  sgDetails.cells[5,0] := 'Raising Dept';
  sgDetails.cells[6,0] := 'Source Dept';
  sgDetails.cells[7,0] := 'QA Approved';
  sgDetails.cells[8,0] := 'QA Date';
  sgDetails.cells[9,0] := 'Cost';

  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintJobBagNonConformFrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintJobBagNonConformFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    ShowDetails;
    ShowNonConformDetails;
    FActivated := true;
  end;
end;

procedure TPBMaintJobBagNonConformFrm.ShowDetails;
begin
  edtJobBag.text := IntToStr(JobBag.DbKey);
  edtDate.text := PBDateStr(JobBag.Date);

  edtDateReq.Text := PBDateStr(JobBag.GoodsRequired);
  edtStartDate.Text := pbDateStr(JobBag.StartDate);

  edtCustomer.text := JobBag.CustomerName+'/'+JobBag.BranchName;
  edtDescription.text := JobBag.Description;

  edtAccountManager.Text :=  JobBag.AccountManagerName;

  edtRep.Text := JobBag.DataModule.GetRepName(JobBag.rep);
end;

procedure TPBMaintJobBagNonConformFrm.ShowNonConformDetails;
begin
  ClearGrid(sgDetails);
  BuildNonConformGrid;
end;

procedure TPBMaintJobBagNonConformFrm.ClearGrid(TempGrid: TStringGrid);
var
  irow, icol: integer;
begin
  with TempGrid do
    begin
    for irow := 1 to pred(rowcount) do
      for icol := 0 to pred(colcount) do
        cells[icol,irow] := '';
//    rowcount := 2;
    end;
end;

procedure TPBMaintJobBagNonConformFrm.BuildNonConformGrid;
var
  icount: integer;
  irow: integer;
begin
  icount := 0;
  with sgDetails, jobbag.datamodule do
    begin
      for irow := 0 to pred(jobbag.NonConformDocs.count) do
        begin
          cells[0,irow+1] := inttostr(jobbag.NonConformDocs[irow].JBNonConformNo);
          cells[1,irow+1] := inttostr(jobbag.NonConformDocs[irow].NCNumber);

          cells[2,irow+1] := pbdatestr(jobbag.NonConformDocs[irow].DatePoint);
          cells[3,irow+1] := jobbag.NonConformDocs[irow].NCTypeDescription;
          cells[4,irow+1] := jobbag.NonConformDocs[irow].StatusDescription;
          cells[5,irow+1] := jobbag.NonConformDocs[irow].RaisedByName;
          cells[6,irow+1] := jobbag.NonConformDocs[irow].NCDepartmentName;
          cells[7,irow+1] := jobbag.NonConformDocs[irow].QAOperatorName;
          cells[8,irow+1] := pbdatestr(jobbag.NonConformDocs[irow].QASignOffDate);
          cells[9,irow+1] := formatfloat('0.00',jobbag.NonConformDocs[irow].TotalCost);
          icount := icount + 1;
        end;

      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  SetButtons;
end;

procedure TPBMaintJobBagNonConformFrm.SetButtons;
begin
  btnChange.Enabled := (JobBag.NonConformDocs.count > 0);
  btnDelete.Enabled := (JobBag.NonConformDocs.count > 0);
end;

procedure TPBMaintJobBagNonConformFrm.SetJobBag(const Value: TJobBag);
begin
  FJobBag := Value;
end;

procedure TPBMaintJobBagNonConformFrm.CallMaintScreen(aMode : TjbncMode);
var
  inx, LineNo : integer;
  jobBagNonConform : TjobBagNonConform;
  frm: TPBMaintJobBagNonConfDocFrm;
begin
  inx := sgDetails.row;
  try
    frm := TPBMaintJobBagNonConfDocFrm.Create(Self);
    try
      if aMode = jbncAdd then
        JobBagNonConform := TJobBagNonConform.Create(JobBag)
      else
      begin
        inx := JobBag.nonConformDocs.IndexOf(inx);
        JobBagNonConform := JobBag.nonConformDocs[inx];
      end;

      if (Mode = jbView) then
        aMode := jbncView;

      Frm.JobBagNonConform := JobBagNonConform;
      Frm.Mode := aMode;
      Frm.ShowModal;
      if (aMode = jbncAdd) and (Frm.ModalResult <> mrOK) then
        JobBagNonConform.Free
    finally
      Frm.Free;
    end;
  finally
    ShowNonConformDetails;
//    ShowTotals;
  end;
end;

procedure TPBMaintJobBagNonConformFrm.SetMode(const Value: TjbMode);
begin
  FMode := Value;
end;

procedure TPBMaintJobBagNonConformFrm.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(jbncAdd);
end;

procedure TPBMaintJobBagNonConformFrm.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen(jbncChange);

end;

procedure TPBMaintJobBagNonConformFrm.btnDeleteClick(Sender: TObject);
begin
  CallMaintScreen(jbncDelete);

end;

procedure TPBMaintJobBagNonConformFrm.sgDetailsDblClick(Sender: TObject);
begin
  if (JobBag.NonConformDocs.count = 0) then
    exit;
  btnChangeClick(self);
end;

procedure TPBMaintJobBagNonConformFrm.btnOKClick(Sender: TObject);
begin
  bOK := true;
  JobBag.SaveNonConformDocs;
  close;
end;

procedure TPBMaintJobBagNonConformFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if bOK then exit;

  if not(btnOK.enabled) then exit;

  if Mode = jbView then exit;

  TempWord := MessageDlg('Do you want to save these non conformance details?', mtConfirmation,
      [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
    begin
      Exit;
    end
  else
  if TempWord = mrCancel then
    Action := caNone
  else
    begin
      btnOKClick(self);
    end;
end;

end.
